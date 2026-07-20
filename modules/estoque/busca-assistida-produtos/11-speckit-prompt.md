# Prompt SpecKit — Restrição de Preço na consulta da Busca Assistida

Crie uma especificação e um plano de implementação completos para que a Busca Assistida de Produtos reconheça uma **Restrição de Preço** em linguagem natural dentro da própria consulta (ex.: "puxadores de ouro abaixo de 50,00") e a aplique aos resultados — nos dois hospedeiros já existentes (Consulta de Estoques, `BuscaAssistidaSearchService`, e Orçamentos, `OrcamentoBuscaAssistidaSearchService`, já implementado). Só preço; nenhuma outra restrição (estoque, marca, cor etc.) entra nesta entrega. **Não reabra** recuperação híbrida, embeddings, cache, voz, multisseleção, detalhe ou a adaptação de Orçamentos já fixadas em `09-speckit-prompt.md` e `10-speckit-prompt.md`.

## Regra de investigação

Você tem acesso somente ao Laravel atual. Inspecione detalhadamente `QueryNormalizer`, `ExactIdentifierMatcher`, `HybridProductRetrievalService`, `BuscaAssistidaSearchService`, `OrcamentoBuscaAssistidaSearchService`, `LegacyBuscaAssistidaRevalidationRepository` e `OrcamentoCargoPriceResolver` — e trate-os como ponto real de partida. **Não procure, não solicite e não dependa de Delphi**. Todo contrato necessário está neste prompt.

## Nomenclatura de domínio

**Restrição de Preço**: operador e valor extraídos de uma consulta em linguagem natural da Busca Assistida (ex.: "abaixo de 50,00") e usados para filtrar candidatos pelo Preço Efetivo na Filial. Já registrada em `CONTEXT.md` com `_Avoid_`: "faixa de preço" (conceito diferente — seleção de preço do Produto dentro de sua Característica) e "filtro de preço" (sugere o mecanismo de `ProductFilterRule`/`ProductFilterPanel`, que a Restrição de Preço **não** reaproveita). Use exatamente esse termo na especificação.

## Estado atual do pipeline (não altere fora do escopo abaixo)

`QueryNormalizer::normalize()` só colapsa espaços e faz trim — nenhuma extração de número/comparação existe hoje. `ExactIdentifierMatcher` trata a consulta inteira como um único valor exato via lookup — não é modelo para extrair um trecho de dentro de uma frase maior.

Pipeline confirmado, idêntico nos dois serviços de busca:

1. Recuperação: exata + lexical + vetorial (cada uma capada em 50) → Reciprocal Rank Fusion.
2. Consolidação e corte para `candidate_cap` (config `busca_assistida.candidate_cap`, hoje 50) — nenhum preço existe ainda neste ponto.
3. Revalidação (`LegacyBuscaAssistidaRevalidationRepository::revalidate` em Consulta de Estoques; `OrcamentoCargoPriceResolver::resolvePrecoVendaParaCliente` por item em Orçamentos) — primeiro ponto onde o preço é calculado hoje, só para os candidatos já cortados.
4. Mapeamento, evidência/abstenção, filtros (`applyProductFilters`, hoje só `item_produto.codigo eq/neq`), fotos.

Preço nunca entra no embedding — a busca vetorial/lexical é agnóstica a preço. `ProductFilterFieldOperatorRegistry` já tem vocabulário `gt/gte/lt/lte` usado em outras telas, mas nenhum campo de preço existe nele, e a Busca Assistida já é isolada desse mecanismo hoje — **não integre a Restrição de Preço a esse registro** (ver "Aplicação sem perder resultados" abaixo).

## Estratégia de extração

Implemente um parser **determinístico, sem chamar IA** — mais rápido, sem custo, testável exaustivamente, consistente com o princípio já estabelecido no projeto de minimizar chamadas de IA fora do necessário.

Vocabulário suportado (frase → operador):

- "abaixo de X", "menor que X", "menor de X" → `lt`
- "até X", "no máximo X" → `lte`
- "acima de X", "maior que X", "maior de X" → `gt`
- "a partir de X", "no mínimo X" → `gte`
- "entre X e Y" → intervalo (`gte X` e `lte Y`)

Número em dígitos, com ou sem "R$"/"reais", formato brasileiro (50 ou 50,00). Números por extenso ficam fora de escopo.

**Conservador com o não reconhecido**: só extraia quando a frase bate exatamente com o vocabulário acima e há um número válido junto; sem correspondência clara, a consulta inteira segue como texto de busca normal, sem Restrição aplicada e sem erro. Nenhuma tentativa especulativa de interpretar frases parecidas.

Remova o trecho reconhecido do texto enviado à recuperação lexical/semântica — só o restante da consulta é buscado/embedado; a Restrição de Preço (`{operador, valor}`) viaja separada no pipeline, não como parte do texto.

## Aplicação sem perder resultados

**Pré-check antes do corte, não depois**: quando uma Restrição de Preço é detectada, execute uma consulta legada leve (só código+preço, não a revalidação completa) que descarta os candidatos que não a satisfazem **antes** da fusão RRF/corte de `candidate_cap` — reaproveitando a mesma fonte de preço já usada pela revalidação/`OrcamentoCargoPriceResolver` (Filial Base, e Cargo-aware em Orçamentos). Motivo: a Restrição foi pedida explicitamente pelo vendedor, que quer tudo dentro do orçamento — um filtro só depois do corte (mais barato, mas com perdas) poderia excluir produtos válidos e mais baratos que não estivessem entre os 50 mais relevantes por semântica.

**Não integre ao `ProductFilterFieldOperatorRegistry`**: esse registro valida combinações de aba/campo/operador escolhidas por dropdown num filtro já buscado — mecanismo diferente do pré-check antes do corte, que vem de texto livre. Mantenha a Restrição de Preço **bespoke**, como o filtro `item_produto.codigo` já é hoje.

Isso vale igualmente para os dois hospedeiros — implemente o pré-check e o parser uma única vez, compartilhados, chamados por ambos `BuscaAssistidaSearchService` e `OrcamentoBuscaAssistidaSearchService` antes de suas respectivas recuperações.

## Comunicação na UI

A resposta de busca passa a incluir a Restrição de Preço detectada. O painel mostra um chip perto dos resultados (ex.: "Preço até R$ 50,00 detectado"), com × para remover; ao remover, a busca roda de novo com o texto original completo, sem tratamento especial de preço. Mesma linguagem de chip já usada na faixa de seleção — não invente um padrão visual novo.

## Contratos técnicos consolidados

**Novo componente de parsing** (bespoke, determinístico, compartilhado pelos dois serviços): recebe a consulta normalizada, devolve `{ restricao: { operador, valor, valorAte? } | null, textoResidual: string }`.

**Pré-check de preço** (novo, compartilhado): consulta leve código+preço, aplicada aos candidatos exatos+lexicais+semânticos antes da fusão RRF e do corte de `candidate_cap`, reaproveitando a mesma fonte de preço da revalidação existente em cada hospedeiro.

**Resposta de busca**: inclui a Restrição de Preço detectada (para render do chip) além dos itens já filtrados.

## Fases de implementação

Planeje tracer bullets verificáveis:

1. Parser determinístico de Restrição de Preço (vocabulário fixo, conservador com não reconhecido, remoção do trecho do texto).
2. Pré-check leve de preço, compartilhado, chamado antes da fusão/corte em ambos os serviços de busca.
3. Resposta de busca inclui a Restrição detectada; chip na UI com opção de remover.
4. `CONTEXT.md` já tem o termo "Restrição de Preço" registrado — não redefina.

Cada fase deve manter a recuperação híbrida, a lupa tradicional e o restante do pipeline funcionando sem regressão.

## Matriz mínima de testes

Unit (seguindo `ExactIdentifierMatcherTest.php`): cada frase do vocabulário suportado, formatos numéricos (com/sem R$, com/sem centavos), frases não reconhecidas (nenhuma Restrição extraída), texto residual correto após remoção do trecho.

Feature (seguindo `HybridRetrievalIntegrationTest.php`): candidatos fora da Restrição descartados antes do corte de `candidate_cap`; um candidato relevante e barato fora do top-50 por semântica ainda aparece quando a Restrição está ativa; mesmo comportamento nos dois hospedeiros (Consulta de Estoques e Orçamentos Cargo-aware); resposta de busca inclui a Restrição detectada para o chip.

## Critérios de conclusão

Considere concluído somente quando:

- "puxadores de ouro abaixo de 50,00" detecta a Restrição (`lt`, 50,00) e busca só "puxadores de ouro" na recuperação;
- nenhum produto acima do valor da Restrição aparece nos resultados, em nenhum dos dois hospedeiros;
- um produto válido e mais barato, fora do top-50 por relevância semântica, ainda aparece quando satisfaz a Restrição;
- frases não reconhecidas não aplicam nenhuma Restrição — a consulta busca normalmente, texto completo;
- o chip da Restrição detectada aparece e pode ser removido, revertendo à busca sem Restrição;
- em Orçamentos, a Restrição de Preço compara contra o preço já Cargo-aware (Filial Base + Cliente, se identificado);
- a recuperação híbrida e a lupa tradicional não têm regressão;
- testes relevantes (unit do parser, feature do pré-check) passarem.

## Saída esperada do SpecKit

Produza especificação executável e plano, não apenas análise. Liste requisitos funcionais/não funcionais, contratos e payloads, serviços/endpoints/componentes atuais a alterar após inspecioná-los, fases, riscos, critérios de aceite e matriz de testes.

Não mande investigar Delphi. Não reabra recuperação híbrida, embeddings, cache, voz, multisseleção, detalhe ou a adaptação de Orçamentos já fixadas em `09-speckit-prompt.md` e `10-speckit-prompt.md`. Não implemente restrições numéricas/atributo além de preço. Não integre a Restrição de Preço ao `ProductFilterFieldOperatorRegistry`. Não use IA/LLM para o parsing. Não simplifique o pré-check antes do corte para um filtro só depois da revalidação.
