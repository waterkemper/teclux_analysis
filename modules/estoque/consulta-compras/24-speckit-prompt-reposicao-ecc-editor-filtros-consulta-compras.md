# Prompt 24 — Editor compartilhado dos filtros e motor da Consulta de Compras

## Objetivo

> PARCIALMENTE SUPERSEDED: o editor compartilhado e o round-trip continuam validos, mas a secao de overlays automaticos por tipo foi substituida pelas regras temporais configuraveis dos prompts 27 a 31.

Permitir que a configuração da Rotina ECC use os mesmos filtros da Consulta de Compras, gravando um round-trip fiel entre estado da UI e `parametros_json` + `motor_json`.

## Implementação

### 1. Criar um módulo de estado compartilhado

Extrair da Consulta de Compras, sem quebrar a tela existente:

- tipo `ConsultaComprasUiState` e estado inicial neutro;
- hidratação de payload persistido para estado editável;
- `buildParametrosPayload()` e `buildMotorPayload()` como seam comum;
- limpeza de linhas de regra vazias apenas no momento de serializar;
- round-trip preservando regras, exceções, seleções, datas e flags.

O editor ECC deve usar a mesma interface e os mesmos componentes da Consulta, não uma segunda implementação de filtros.

### 2. Painéis configuráveis

Renderizar no editor ECC:

- filiais, grupos de filiais, filiais com estoque e sem estoque;
- período de velocidade com `numero_dias` de 0 a 9999;
- filtro de produtos com todas as abas suportadas;
- status de estoque;
- flags de produto;
- compostos;
- conceitos comerciais;
- fornecedor e grupo fornecedor;
- motor: curva ABC, redutora, sugestão zero, produtos marcados, percentual acima do mínimo, pedidos entre filiais, pedidos de compra e totalização.

Não inserir valores de cliente. Arrays começam vazios e seleções só aparecem após escolha do operador; valores booleanos devem ser explícitos no payload final.

### 3. Período da rotina

Para ECC, o campo principal editável é `periodo.numero_dias`. Exibir ajuda clara:

> O período é deslizado no momento da execução. Em cada execução, o sistema usa o dia civil D e calcula `data_inicial = D - numero_dias` e `data_final = D`.

Não permitir que datas fixas antigas substituam o período deslizante. Se o payload legado tiver datas, migrar/hidratar para `numero_dias` quando possível ou exibir pendência de configuração; nunca alterar silenciosamente o snapshot já persistido.

### 4. Regras automáticas por tipo

O painel deve mostrar uma seção somente leitura com o overlay do tipo:

- Geralzão: agenda quinzenal; nenhum filtro de data imposto pelo tipo.
- Vendido do dia anterior: diário; `ultima_venda = D-1..D-1`.
- Produtos novos recebidos: diário; `entrada_nf = D-1..D-1` e filial do depósito configurado.

Quando um campo do payload é sobrescrito pelo tipo, informar isso explicitamente. O payload vivo não deve fingir que uma regra automática foi cadastrada pelo operador; a regra efetiva só aparece no snapshot da execução.

### 5. Lookups e acessibilidade

- Usar as URLs entregues pelo módulo ECC, com autorização ECC, sem acessar diretamente endpoint da Consulta que possa exigir outro grant.
- Manter labels resolvidos, exceções por aba, seleção de todas e filtros compostos.
- Testar teclado, foco, leitura de labels, estado somente leitura e erros de validação.

## Testes obrigatórios

- teste unitário de hidratação payload → estado → payload;
- preservação de regras e exceções por aba;
- período `numero_dias` e limite 9999;
- arrays vazios não viram filtros inventados;
- motor completo é serializado com todas as chaves necessárias;
- overlays diários não são confundidos com configuração persistida;
- regressão da Consulta de Compras permanece verde.
