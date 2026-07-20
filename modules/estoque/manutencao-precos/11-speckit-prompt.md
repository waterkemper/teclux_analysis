# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional completa e implementável para **Operações locais, simulação e modal F8** da **Manutenção de Preços interna** (Estoque), no ERP tecLUX Laravel. Este é o terceiro de quatro specs incrementais; depende dos contratos de dados da Consulta F6 (segundo spec, já implementado) e do Resolvedor de Preço Corrente (primeiro spec, já implementado), e produz o comando canônico que o quarto spec (commit atômico) vai persistir.

## Regra fundamental sobre as fontes

Você não possui acesso ao código Delphi nem ao PostgreSQL legado investigados e **não deve procurar, solicitar, citar ou depender deles**. Não inclua tarefas de "analisar o legado", "validar no Delphi" ou "comparar com o Delphi/PostgreSQL". O levantamento já foi concluído e o contrato abaixo é a fonte autoritativa e autocontida.

Investigue somente o Laravel atual — a Consulta F6 e os três grids já implementados (`ManutencaoPrecosConsultaService`, `Index.tsx`, `DadosTriPane.tsx`, o tipo `ManutencaoPrecosRow`), o Resolvedor de Preço Corrente (`PrecoCorrenteResolver`/`LegacyProductPriceEngineRepository`), o catálogo de grid/exportação e o serviço de autorização do módulo — para localizar nomes e contratos concretos a estender. Essa inspeção serve para integração, não para redescobrir requisitos. Se o Laravel divergir do contrato abaixo, registre a divergência e proponha a adaptação; não busque confirmação em outro repositório.

Não faça nova entrevista. Não implemente a persistência/commit F5 real, autorização sensível, concorrência ou auditoria — isso pertence ao próximo spec. Gere requisitos numerados, cenários, contratos e critérios mensuráveis.

## Objetivo e natureza

Tornar interativos os três grids já existentes, introduzindo uma **sessão local de edição** inteiramente em memória no cliente, espelhada por um endpoint de simulação no servidor que usa o mesmo contrato para qualquer prévia. **Nenhum comando desta entrega grava no banco**; o resultado observável é um **comando canônico** revisável, pronto para ser submetido quando o spec de commit existir.

## Contratos já implementados (não redesenhe, estenda)

- Linha do F6 (`ManutencaoPrecosRow`): campos estáticos + `colunas: Record<string, {valor, margem, validade}>` + `cargos: Record<string, {preco_calculado, margem, desconto}> | null`, chaves string do código; `alterar` está hoje travado como literal `false` no tipo e sempre emitido `false` pelo backend — **amplie esse campo para `boolean`** no tipo e no builder de linha, não invente um campo novo.
- Identidade da linha para seleção/proposta: `produto_codigo` + `caracteristica_codigo` (nullable). **Não** use o índice do array — a navegação entre grids já usa um `activeRowIndex` numérico próprio para sincronizar a linha ativa entre os três painés, mas seleção e propostas devem ser um estado **separado**, chaveado por identidade, não por índice.
- Virtualização já existe (três instâncias independentes de `useVirtualizer`, sincronizadas por scroll e por `activeRowIndex`) — não redesenhe; a seleção deve funcionar corretamente com linhas fora da janela renderizada.
- A célula "Alterar" hoje é um checkbox estático, desabilitado, com um teste que trava esse comportamento (`'mantém Alterar apenas como renderização não interativa'`). **Substitua intencionalmente essa célula e esse teste** — não deixe o teste antigo como guarda de regressão contraditória.
- Catálogo de grid/exportação hoje só cobre as 24 colunas estáticas; a coluna Alterar e as colunas dinâmicas por Coluna/Cargo não são exportadas. Estenda o catálogo/exportação para cobri-las.
- O motor oficial já expõe: preço efetivo em lote, e uma resolução de preço via markup **como desconto sobre o preço efetivo** (`preço efetivo × (1 − markup/100)`), hoje usada para preço por Cargo. A própria consulta F6 já calcula seu preço de venda calculado com um markup **diferente, sobre custo** (`custo × (1 + markup/100)`). Nenhuma dessas duas fórmulas é a mesma usada por "aplicar percentual"/"copiar coluna" abaixo (`valor × (1 ± percentual/100)`, fórmula legada comprovada, sobre o próprio Valor de Preço). **Declare explicitamente qual das três fórmulas cada operação usa** — nunca as confunda.

## Modelo de sessão

- Seleção é um conjunto de identidades de linha, independente do `activeRowIndex` de navegação já existente.
- Cabeçalho de seleção tri-estado (todos/nenhum/parcial) com contagem "selecionadas / total" sobre **toda** a coleção do F6 em memória, não a janela virtualizada.
- "Selecionar todos" seleciona todo o resultado corrente, inclusive linhas fora da área renderizada.
- Desmarcar uma linha preserva propostas já aplicadas; só "Desfazer" remove uma operação.
- Operações são cumulativas: cada nova operação lê o valor proposto atual, não necessariamente o original. Quando várias operações atingem a mesma célula, a última vence; a prévia guarda original, final e histórico intermediário. Desfazer a última restaura o estado anterior exatamente.
- Executar novo F6, trocar filtro ou Filial, ou sair com alterações pendentes exige escolha explícita entre continuar a sessão ou descartar tudo — nunca migração silenciosa nem descarte silencioso.

## Matriz de comandos

Cada comando produz, por linha, um resultado: `alterada`, `sem mudança`, `ignorada` (com motivo) ou `erro` (com motivo).

- **Selecionar todos / Desmarcar todos** — mutação pura do conjunto de seleção, sem prévia própria.
- **Aplicar percentual e/ou validade** — exige coluna de origem; atua só nas selecionadas. Valor proposto = valor proposto atual × (1 + percentual/100); percentual vazio/zero mantém preço; validade vazia mantém validade; validade informada substitui. Passe o resultado pela resolução de arredondamento/múltiplo já existente (Produto → Grupo → Classe → parâmetro global) antes de virar o novo valor proposto.
- **Copiar coluna origem → destino** — exige origem ≠ destino; atua só nas selecionadas. Atribui o valor proposto da origem ao destino, opcionalmente ajustado pela mesma fórmula de percentual acima antes de atribuir; validade só substitui se informada, senão herda da origem. Origem zero/vazia não altera o destino e é classificada `ignorada — origem sem preço`, nunca omitida silenciosamente.
- **Limpar coluna** — atua só nas selecionadas; zera Valor/Margem/Validade localmente, disponível para Normal e para colunas adicionais/promocionais. Exige confirmação própria mostrando coluna, total selecionado e total que efetivamente perderá valor, com aviso reforçado quando o alvo for a coluna Normal. Confirmar só prepara a proposta.
- **Edição manual de célula** — nunca exige seleção da linha. Edição de Valor compartilhado por Característica + Faixa + Coluna reflete nas demais linhas da mesma identidade; edição de desconto por Cargo segue a propagação já decidida para Cargo.
- **Recalcular** — projeção pura sobre as linhas selecionadas (ou, se nenhuma selecionada, sobre todas com proposta pendente — escolha um comportamento único e mantenha-o consistente). Recalcula colunas derivadas (preço de venda calculado, margens, preço calculado por Cargo) a partir dos insumos persistíveis atualmente propostos (custo, markups, múltiplos, Promoções e Cargos ativos), usando a fórmula de desconto-sobre-preço-efetivo do motor oficial para o preço calculado por Cargo e a fórmula de markup-sobre-custo já usada pela própria consulta para o preço de venda calculado — nunca confundindo as duas nem com a fórmula de percentual acima. Não cria mutação persistível quando nenhum insumo persistível mudou; identifica explicitamente linhas que falharem.

## Prévia e Motor de Propostas

Construa uma interface única de **Motor de Propostas**: dado a assinatura da consulta atual (já presente no `meta` do F6) e uma lista ordenada de operações canônicas, devolve a prévia do lote. O frontend pode aplicar isso localmente para resposta imediata, mas crie um endpoint de **simulação** no servidor que recomputa exatamente o mesmo contrato — o conteúdo do modal F8 vem sempre desse recômputo do servidor, nunca só do estado local.

A prévia separa sempre entradas persistíveis (Valor/Validade de Coluna de Preço, atribuição de Faixa/Produto, desconto por Cargo) de projeções recalculadas (margens, preço de venda calculado, preço calculado por Cargo) — projeções nunca aparecem como alteração persistível independente.

## Contadores, indicadores e troca de contexto

Contadores/filtros rápidos "Somente alterações", "Com erros" e "Com conflitos" acima dos três grids; clicar navega à primeira ocorrência via o `activeRowIndex` compartilhado. Indicadores de erro/alteração/conflito aparecem de forma consistente nos três painés para a mesma linha lógica.

Novo F6, troca de filtro, troca de Filial ou navegação para fora com alterações pendentes exige escolha explícita entre continuar a sessão local ou descartar tudo.

## Modal F8

Abre como modal, não como terceira aba, populado pelo recômputo do servidor sobre a lista atual de operações canônicas. Mostra total de alterações, linhas ignoradas com motivo, erros não resolvidos, conflitos e aviso de que a gravação exigirá a autorização sensível já estabelecida (Gerente de Estoque) — **mas esta entrega não implementa a submissão real, persistência, desafio de autorização, concorrência ou auditoria por trás dessa gravação**; o modal termina produzindo um comando canônico pronto para envio. Desabilite a ação de revisar/gravar enquanto houver erro ou conflito não resolvido.

O comando canônico produzido (identidade do request, assinatura da consulta atual, operações canônicas ordenadas, revisões de linha esperadas, Filial efetiva) deve ter exatamente o formato que o próximo spec (commit atômico) vai aceitar como entrada.

## Autorização

Estenda o serviço de autorização do módulo com uma capability `prepare` (seleção, edição, simulação, revisão), exigindo só o acesso `view` já existente — sem desafio de autorização sensível, reservado ao futuro commit.

## Catálogo e exportação

Estenda o catálogo de grid/exportação para cobrir o indicador Alterar e os valores dinâmicos por Coluna/Cargo, hoje ausentes do catálogo e da exportação. Exportar a sessão local atual (com propostas não gravadas) deve ser uma ação visivelmente distinta de exportar um resultado de F6 puro, claramente rotulada como prévia/rascunho.

## Correção de contrato a sinalizar, não a corrigir aqui

A Consulta F6, como implementada, roda hoje por trás de um job assíncrono com polling (retorna `job_id`/`poll_url`, depois status `ready`). **F6 deve ser sempre síncrono.** Não construa a sessão local/prévia deste spec assumindo ou dependendo do wrapper assíncrono como se fosse intencional; apenas sinalize essa divergência para quem for tocar o endpoint do F6 — corrigi-la não é escopo desta entrega.

## Fora do escopo

Persistir qualquer proposta, o commit atômico F5/F8 real, desafio de autorização sensível, concorrência otimista contra o banco, idempotência e auditoria — pertencem ao próximo spec. Qualquer alteração no contrato da Consulta F6 além da capability `prepare`. Qualquer alteração no contrato público do Resolvedor de Preço Corrente. Corrigir o wrapper assíncrono do F6. Construir os comandos/calculadoras/exportação equivalentes de Marketplace. Redesenhar abas, virtualização ou sincronização de linha ativa/rolagem já implementadas — esta entrega só adiciona seleção/edição/prévia por cima delas.

## Testes e aceite mínimo

Cubra Feature/Unit (backend) e componente (frontend):

1. cada operação canônica e sua classificação por linha (`alterada`/`sem mudança`/`ignorada`/`erro`), isolada e em sequências compostas/cumulativas;
2. as duas fórmulas de markup exercitadas separadamente, afirmando fórmula/caminho aplicado, não só o valor; fórmula de percentual sobre Valor de Coluna passando pela resolução de arredondamento/múltiplo;
3. "sem mudança" nunca produz mutação persistível; "ignorada" nunca bloqueia as demais linhas; "erro" impede considerar a preparação completa;
4. desfazer restaura exatamente o estado anterior; contagem de consultas comprovando que a simulação não degrada para uma chamada ao motor por linha conforme a seleção cresce;
5. cabeçalho de seleção tri-estado e sua contagem sobre toda a coleção, inclusive linhas fora da janela virtualizada;
6. checkbox Alterar agora interativo, substituindo explicitamente o teste anterior de "não interativo";
7. edição manual sem seleção, propagando por identidade compartilhada;
8. fluxo de confirmação de cada comando em lote, especialmente o aviso reforçado de Limpar coluna na coluna Normal;
9. contadores/filtros rápidos navegando à primeira ocorrência entre os painés sincronizados;
10. prompt de continuar/descartar disparando em novo F6, troca de filtro/Filial e navegação para fora com alterações pendentes;
11. modal F8 desabilitado enquanto houver erro/conflito, e seu conteúdo batendo com uma resposta simulada do servidor, não só com o estado local do cliente;
12. exportação distinguindo claramente exportação de F6 puro de exportação de sessão/prévia.

## Saída esperada

Gere uma spec completa, verificável e pronta para planejamento/implementação. Numere requisitos funcionais e não funcionais, contratos de request/response (inclusive o formato do comando canônico), entidades, cenários e critérios de aceite mensuráveis. Identifique os componentes Laravel/React reutilizáveis existentes e os novos limites necessários após inspecioná-los. Não crie pendências de investigação no Delphi ou PostgreSQL: tudo que precisa ser preservado está neste briefing.
```
