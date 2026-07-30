# Consolidar o(s) prompt(s) SpecKit

Type: task
Status: resolved
Blocked by: 21

## Question

Decidir e produzir o(s) prompt(s) `/speckit.specify` finais, publicados em `modules/estoque/cadastro-pedidos/`. Decisão de fatiamento a tomar aqui (não antecipar): dado que o motor de custo/formação de preço/impostos (tickets 06-08, 13-19 — 11 tickets, a fatia individualmente maior que todo o resto do mapa somado) foi decidido como peça própria e reaproveitável (Notes do mapa), é provável que saia como prompt(s) dedicado(s), separado(s) do prompt do Cadastro de Pedidos propriamente dito (cabeçalho, previsões, itens, grade, cópia, documentos a pagar, acessórios — tickets 01-05, 09-12). Considerar também se o motor de impostos, dado seu tamanho (~6.122 linhas documentadas em 8 tickets), justifica mais de um prompt por si só (ex.: um prompt "núcleo do motor" + referência às famílias fiscais como anexo, ou um prompt por família). Cada prompt deve seguir o mesmo formato já usado em `modules/estoque/consulta-compras/`.

## Answer

### Decisão de fatiamento (DECISÃO NOVA, levada ao usuário)

Perguntado ao usuário entre 3 granularidades (4 prompts por domínio funcional; 2 prompts engine-vs-tela; 8 prompts quase 1:1 com os clusters de tickets) — **escolhida a granularidade fina, 8 prompts**, um por subsistema/cluster de tickets, priorizando rastreabilidade ticket→prompt sobre o menor número de arquivos.

### 8 prompts publicados em `modules/estoque/cadastro-pedidos/`

Ordem de dependência: o Motor de Custo/Impostos (01-05, decoupled e reaproveitável) vem primeiro; o núcleo do Cadastro de Pedidos propriamente dito (06-08) é construído por cima, consumindo os 5 primeiros como serviços prontos.

1. [`01-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/01-speckit-prompt.md) — Motor de Custo (ticket 06).
2. [`02-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/02-speckit-prompt.md) — Motor de Impostos: núcleo/orquestração + ICMS normal (tickets 07, 13).
3. [`03-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/03-speckit-prompt.md) — Motor de Impostos: ICMS-ST (ticket 14).
4. [`04-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/04-speckit-prompt.md) — Motor de Impostos: IPI, PIS/COFINS e Simples Nacional/CSOSN (tickets 15, 16, 17).
5. [`05-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/05-speckit-prompt.md) — Motor de Impostos: rateio de frete/desconto/despesas acessórias e produtos compostos (ticket 19).
6. [`06-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/06-speckit-prompt.md) — Cabeçalho e Previsões do Pedido de Compra (tickets 03, 04).
7. [`07-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/07-speckit-prompt.md) — Itens do Pedido (produtos) (ticket 05).
8. [`08-speckit-prompt.md`](../../../modules/estoque/cadastro-pedidos/08-speckit-prompt.md) — Grade, Cópia de Produtos ligada à grade, Formação de Preço de Venda, Documentos a Pagar e Funcionalidades Acessórias (tickets 08, 09, 10, 11, 12).

DIFAL (ticket 18) não gerou prompt próprio — documentado dentro do prompt 02 como estruturalmente inaplicável, não uma feature a implementar. A Cópia de Produtos autônoma e a Importação Daico permanecem fora de escopo/não especificadas, conforme já registrado no mapa.

Cada prompt segue o formato dos prompts já publicados em `modules/estoque/consulta-compras/` (limite da entrega, fronteira de acesso às fontes, investigação Laravel obrigatória, evidência Delphi confirmada, decisões obrigatórias, critérios de aceite, matriz de testes, saída esperada do SpecKit, fora de escopo) e incorpora os achados classificados no ticket 20 (bugs a corrigir, código morto a não replicar, divergências mantidas por decisão) e os critérios/testes consolidados no ticket 21.

### Decisão

Destino do mapa alcançado: os 8 prompts `/speckit.specify` estão publicados e prontos para uso.
