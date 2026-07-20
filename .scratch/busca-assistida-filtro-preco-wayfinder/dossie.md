# Dossiê — Restrição de Preço na Busca Assistida

Autocontido: quem for converter isto em prompt SpecKit não precisa reabrir os tickets, redescobrir os fatos sobre o pipeline de preço, nem investigar o Delphi. Complementa, sem reabrir, [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md) (recuperação híbrida, embeddings, cache), [Experiência reutilizável da Busca Assistida de Produtos](../busca-assistida-produtos-experiencia-wayfinder/dossie.md) (voz, multisseleção, detalhe) e [Adaptar a Busca Assistida de Produtos para Orçamentos](../orcamentos-busca-assistida-wayfinder/dossie.md) (Filial Base, preço por Cargo — já implementado, `OrcamentoBuscaAssistidaSearchService` já existe).

## Objetivo

A Busca Assistida passa a reconhecer uma **Restrição de Preço** dentro da própria consulta em linguagem natural (ex.: "puxadores de ouro abaixo de 50,00") e aplicá-la aos resultados — nos dois hospedeiros já existentes (Consulta de Estoques e Orçamentos). Só preço; nenhuma outra restrição (estoque, marca, cor etc.) entra nesta entrega.

## Estado atual do pipeline

`QueryNormalizer::normalize()` só colapsa espaços e faz trim — nenhuma tokenização, extração de número/moeda ou reconhecimento de comparação existe hoje em lugar nenhum do pipeline. `ExactIdentifierMatcher` trata a consulta inteira como um único valor exato via lookup no banco — não é um modelo de "extrair um trecho numérico de dentro de uma frase maior"; a extração de preço é uma operação de formato diferente, construída do zero.

Pipeline confirmado (`HybridProductRetrievalService::retrieve` + `BuscaAssistidaSearchService::search`, e o gêmeo `OrcamentoBuscaAssistidaSearchService`):

1. Recuperação: exata + lexical + vetorial (cada uma capada em 50) → Reciprocal Rank Fusion.
2. Consolidação e corte para `candidate_cap` (config `busca_assistida.candidate_cap`, hoje 50) — nenhum preço existe ainda neste ponto.
3. Revalidação em lote (`LegacyBuscaAssistidaRevalidationRepository::revalidate`, ou `OrcamentoCargoPriceResolver::resolvePrecoVendaParaCliente` por item em Orçamentos) — primeiro e único ponto onde o preço é calculado hoje, só para os candidatos já cortados.
4. Mapeamento dos itens, evidência/abstenção, filtros (`applyProductFilters`, hoje só `item_produto.codigo eq/neq`), fotos.

Preço nunca entra no embedding (é dado dinâmico) — a busca vetorial/lexical em si é agnóstica a preço.

Não existe nenhum parser de frase de comparação em português no app hoje (o que existe é vocabulário de operador já estruturado por dropdown, nunca extração de texto livre). `ProductFilterFieldOperatorRegistry` já tem o vocabulário `gt/gte/lt/lte` usado em outras telas (datas de lote, faixas numéricas em Consulta de Contratos), mas nenhum campo de preço existe nele para nenhuma aba, e a Busca Assistida já é isolada desse mecanismo hoje.

## Nomenclatura de domínio

**Restrição de Preço**: operador e valor extraídos de uma consulta em linguagem natural da Busca Assistida de Produtos (ex.: "abaixo de 50,00") e usados para filtrar candidatos pelo Preço Efetivo na Filial. Não usa o mecanismo de filtros estruturados por aba/campo/operador já existente em outras telas. Distinto de **Faixa de Preço** (seleção de preço do Produto dentro de sua Característica — conceito já existente e diferente) e de "filtro" (o mecanismo de `ProductFilterRule`/`ProductFilterPanel`, que a Restrição de Preço não reaproveita). Já registrado em `CONTEXT.md` com `_Avoid_`: faixa de preço, filtro de preço.

## Estratégia de extração

- **Determinístico, sem IA.** Parser regex/vocabulário fixo — mais rápido, sem custo, testável exaustivamente, consistente com o princípio já estabelecido no projeto de minimizar chamadas de IA fora do necessário.
- **Vocabulário suportado**: "abaixo de X"/"menor que X"/"menor de X" → `lt`; "até X"/"no máximo X" → `lte`; "acima de X"/"maior que X"/"maior de X" → `gt`; "a partir de X"/"no mínimo X" → `gte`; "entre X e Y" → intervalo (`gte X` e `lte Y`). Número em dígitos, com ou sem "R$"/"reais", formato brasileiro (50 ou 50,00). Números por extenso ficam fora de escopo.
- **Ambiguidade/não reconhecido**: conservador — só extrai quando a frase bate exatamente com o vocabulário fixo e há um número válido junto; sem correspondência clara, a consulta inteira segue como texto de busca normal, sem Restrição aplicada e sem erro. Nenhuma tentativa especulativa de interpretar frases parecidas.
- **Remoção do trecho**: o trecho reconhecido é removido do texto enviado à recuperação lexical/semântica — só o restante da consulta é buscado/embedado; a Restrição de Preço (`{operador, valor}`) viaja separada no pipeline.
- **Comunicação na UI**: chip perto dos resultados (ex. "Preço até R$ 50,00 detectado"), com × para remover; ao remover, a busca roda de novo com o texto original completo, sem tratamento especial de preço. Mesma linguagem de chip já usada na faixa de seleção.

## Aplicação sem perder resultados

- **Pré-check antes do corte**: quando uma Restrição de Preço é detectada, uma consulta legada leve (só código+preço, não a revalidação completa) descarta os candidatos que não a satisfazem **antes** da fusão/corte de `candidate_cap` — não depois. Motivo: a Restrição foi pedida explicitamente pelo vendedor, que quer tudo dentro do orçamento — um filtro pós-corte (mais barato, mas com perdas) poderia excluir produtos válidos e mais baratos que não estivessem entre os 50 mais relevantes por semântica.
- **Sem reaproveitar `ProductFilterFieldOperatorRegistry`**: o registro valida combinações de aba/campo/operador escolhidas por dropdown num filtro já buscado — mecanismo diferente do pré-check antes do corte, que vem de texto livre. A Restrição de Preço fica **bespoke**, documentada aqui, como o filtro `item_produto.codigo` já é hoje.
- Vale igualmente para os dois hospedeiros (Consulta de Estoques e o preço Cargo-aware de Orçamentos), já que ambos passam pelo mesmo ponto do pipeline (recuperação → corte → revalidação/preço).

## Contratos técnicos consolidados

**Novo componente de parsing** (bespoke, determinístico): recebe a consulta normalizada, devolve `{ restricao: { operador, valor, valorAte? } | null, textoResidual: string }`. Chamado antes da recuperação lexical/semântica em ambos os serviços de busca (`BuscaAssistidaSearchService` e `OrcamentoBuscaAssistidaSearchService`).

**Pré-check de preço**: nova consulta legada leve (código+preço apenas), reaproveitando a mesma fonte de preço já usada pela revalidação/`OrcamentoCargoPriceResolver` (Filial Base, e Cargo-aware em Orçamentos) — aplicada aos candidatos exatos+lexicais+semânticos antes da fusão RRF e do corte de `candidate_cap`.

**Resposta de busca**: passa a incluir a Restrição de Preço detectada (para render do chip) além dos itens já filtrados.

## Critérios de aceite

- "Puxadores de ouro abaixo de 50,00" detecta a Restrição (`lt`, 50,00) e busca só "puxadores de ouro" na recuperação.
- Nenhum produto acima do valor da Restrição aparece nos resultados, em nenhum dos dois hospedeiros.
- Um produto válido e mais barato, fora do top-50 por relevância semântica, ainda aparece quando satisfaz a Restrição (pré-check antes do corte).
- Frases não reconhecidas não aplicam nenhuma Restrição — a consulta busca normalmente, texto completo.
- O chip da Restrição detectada aparece e pode ser removido, revertendo à busca sem Restrição.
- Em Orçamentos, a Restrição de Preço compara contra o preço já Cargo-aware (Filial Base + Cliente, se identificado), não um preço genérico.

## Estados de erro

Herda os estados de busca já definidos (abstenção, cobertura parcial, indisponível). Novo: frase de preço não reconhecida não é um erro — é tratada como ausência de Restrição, silenciosamente.

## Matriz mínima de testes

- Parser: cada frase do vocabulário suportado (abaixo de/até/acima de/a partir de/entre), formatos numéricos (com/sem R$, com/sem centavos), frases não reconhecidas (nenhuma Restrição extraída), texto residual correto após remoção do trecho.
- Pré-check: candidatos fora da Restrição são descartados antes do corte de `candidate_cap`; um candidato relevante e barato fora do top-50 por semântica ainda aparece quando a Restrição está ativa.
- Dois hospedeiros: Restrição de Preço funciona igual em Consulta de Estoques e em Orçamentos (Cargo-aware).
- UI: chip aparece com o texto correto; remover o chip reverte à busca com o texto original completo.

## Fora de escopo

- Restrições numéricas/atributo além de preço (estoque, marca, cor, dimensões etc.) — generalização futura, não decidida aqui.
- Reabrir recuperação híbrida, embeddings, cache, voz, multisseleção, detalhe ou a adaptação de Orçamentos já decididas nos mapas anteriores.
- Redesenhar a UI do painel além do necessário para comunicar a Restrição de Preço detectada.

## Rastreabilidade

Mapa e tickets resolvidos: [`map.md`](map.md).
