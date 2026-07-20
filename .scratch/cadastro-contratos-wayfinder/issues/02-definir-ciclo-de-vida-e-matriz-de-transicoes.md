Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual deve ser o ciclo de vida canônico do Contrato no Laravel, incluindo significados de `O`, `R`, `F`, `C`, `P` e `N`, transições permitidas, pré-condições, reversões, mutabilidade por situação e distinção entre comportamento confirmado, divergência e possível bug legado?

Cruzar handlers e habilitação visual do PAS/DFM com constantes, data modules, operações de faturamento/cancelamento e mapeadores já presentes no Laravel.

## Comments

### Decisão confirmada — Reservado

- `R — Reservado` representa um Contrato com mercadorias reservadas, mas ainda sem compromisso comercial assumido pelo Cliente.
- O compromisso comercial existe somente nas situações `F — Faturado`, `P — Nota Parcial` ou `N — Nota Fiscal`.
- Classificação: `DECISÃO NOVA`, coerente com a linguagem de domínio já confirmada para Venda/Contrato.

### Decisão confirmada — Cancelado

- `C — Cancelado` pode ser alcançado diretamente a partir de `O — Orçado`, `R — Reservado` ou `F — Faturado`.
- Contratos em `P — Nota Parcial` ou `N — Nota Fiscal` não transitam diretamente para `C`; documentos fiscais e seus efeitos precisam ser regularizados antes por fluxo específico.
- Cancelamento comercial e cancelamento/devolução fiscal são operações distintas.
- Classificação: `DECISÃO NOVA`, apoiada pela separação de units de cancelamento, operações e dados fiscais no Delphi.

### Decisão confirmada — recorte inicial da máquina de estados

- A primeira etapa do Cadastro abordará transições somente entre `O — Orçado`, `R — Reservado`, `F — Faturado` e `C — Cancelado`.
- `P — Nota Parcial` e `N — Nota Fiscal` dependem de parâmetros de venda futura, configuração da Filial, características do item e operações como simples faturamento.
- `P` e `N` devem ser reconhecidos para leitura e bloqueio seguro, mas suas regras de entrada, saída, derivação e regularização ficam para o ticket de faturamento/documentos fiscais.
- Classificação: `DECISÃO NOVA`; evita transformar uma hipótese incompleta sobre cobertura fiscal em requisito.

### Decisão confirmada — avanço manual

- O avanço manual no Cadastro é estritamente sequencial: `O — Orçado → R — Reservado → F — Faturado`.
- O Cadastro não oferece transição manual direta `O → F`.
- Fluxos externos que possam criar ou posicionar Contratos em `F` serão analisados separadamente e não constituem atalho da interface do Cadastro.
- Classificação: `CONFIRMADO` para o botão principal Delphi (`sbnAlterarSituacaoClick`) e `DECISÃO NOVA` para explicitar a fronteira dos fluxos externos.

### Decisão confirmada — reversão e cancelamento de Faturado

- Para um Contrato em `F — Faturado`, o comando Cancelar oferece duas operações distintas: Voltar (`F → R`) ou Cancelar (`F → C`).
- `F → R` desfaz os efeitos do Faturamento; `F → C` encerra o Contrato como cancelado.
- Nenhuma das duas é edição direta da Situação. Ambas são transições guardadas, com validações, autorização e efeitos compensatórios próprios.
- O Delphi bloqueia ambas quando há trocas/devoluções, parcelas pagas ou Nota de Simples Faturamento ainda válida; o detalhamento e a revisão dessas condições pertencem à fatia de cancelamento.
- Classificação: `CONFIRMADO`, com evidência em `TfrmCadastroContratos.InternoExcluir` e `TdtmCadastroContratos.VoltarSituacaFaturadoparaCancelado` (apesar do nome legado, a rotina persiste `R`).

### Decisão confirmada — Reservado para Cancelado

- `R — Reservado` pode transitar para `F — Faturado` ou `C — Cancelado`.
- Não existe transição `R → O` no Cadastro.
- O cancelamento `R → C` deve desfazer os efeitos da reserva e obedecer às condições de autorização, que serão detalhadas na fatia de cancelamento.
- Classificação: `CONFIRMADO` para o fluxo Delphi e confirmado como comportamento desejado.

### Decisão confirmada — tratamento de Orçado no comando Excluir/Cancelar

- O parâmetro legado `ExclusaoContrato` deve governar o comando em `O — Orçado`:
  - Cancelar: transição `O → C`, preservando histórico;
  - Excluir: remoção do Contrato orçado;
  - Perguntar: usuário escolhe cancelar ou excluir.
- Exclusão física não é situação nem transição da máquina; é operação separada permitida somente em `O`.
- Classificação: `CONFIRMADO`, com evidência em `TfrmCadastroContratos.InternoExcluir`, e confirmado como comportamento desejado.

### Decisão confirmada — mutabilidade por situação

- `O — Orçado`: dados e itens editáveis.
- `R — Reservado`: dados e itens editáveis, mas alterações que afetem reserva, estoque, valores ou parcelas devem coordenar seus efeitos na mesma operação.
- `F — Faturado`, `P — Nota Parcial`, `N — Nota Fiscal` e `C — Cancelado`: somente leitura no Cadastro, exceto comandos específicos permitidos para a situação.
- Classificação: `CONFIRMADO`, apoiado por `ReadOnly`, comparações com `scFATURADO` e habilitação dos controles no form Delphi; confirmado como comportamento desejado.

### Decisão confirmada — situação inicial

- Todo Contrato novo nasce em `O — Orçado`, tanto na inclusão manual quanto quando gerado a partir de Orçamento.
- O Cadastro inicial não oferece criação direta em `R` ou `F`.
- Integrações legadas que eventualmente posicionem Contratos diretamente em situações posteriores devem ser analisadas como fluxos externos.
- Classificação: `DECISÃO NOVA`, coerente com a geração por Orçamento já definida e com o avanço manual sequencial.

### Decisão confirmada — Cancelado é terminal

- `C — Cancelado` é situação terminal, sem reabertura para `O`, `R` ou `F`.
- A retomada da negociação exige um novo Contrato, que pode ser criado ou copiado, preservando o cancelado como histórico.
- Classificação: `DECISÃO NOVA`.

## Answer

### Máquina inicial aprovada

```text
novo ──→ O ──Reservar──→ R ──Faturar──→ F
          │              │               │
          └─Cancelar──→ C ←──Cancelar────┤
                         terminal         │
                                  Voltar ─┘
                                     F → R
```

**DECISÃO NOVA** — Todo Contrato novo nasce em `O — Orçado`, inclusive quando gerado a partir de Orçamento. O Cadastro não cria diretamente em `R` ou `F`; integrações excepcionais são fluxos externos.

**CONFIRMADO** — O avanço manual principal é estritamente sequencial: `O → R → F`. O botão F11 do Delphi chama Reservar em `O` e Faturar em `R`; não há atalho manual `O → F`. Evidência: `TfrmCadastroContratos.sbnAlterarSituacaoClick`.

**DECISÃO NOVA** — `R — Reservado` significa mercadorias reservadas sem compromisso comercial assumido pelo Cliente. O compromisso comercial existe somente em `F`, `P` ou `N`.

### Transições permitidas no primeiro recorte

| Origem | Destino | Comando | Natureza |
| --- | --- | --- | --- |
| novo | `O` | incluir/gerar | criação canônica |
| `O` | `R` | Reservar | avanço manual |
| `R` | `F` | Faturar | avanço manual e início do compromisso comercial |
| `O` | `C` | Cancelar | cancelamento parametrizado |
| `R` | `C` | Cancelar | desfaz reserva e cancela |
| `F` | `R` | Cancelar → Voltar | reversão compensatória do Faturamento |
| `F` | `C` | Cancelar → Cancelar | compensação e cancelamento |

**CONFIRMADO** — Em `F`, o comando Cancelar oferece “Voltar” (`F → R`) e “Cancelar” (`F → C`). Ambas as operações são bloqueadas no Delphi quando há trocas/devoluções, parcelas pagas ou Nota de Simples Faturamento ainda válida. Evidências: `TfrmCadastroContratos.InternoExcluir` e `TdtmCadastroContratos.VoltarSituacaFaturadoparaCancelado`. O nome desta última é enganoso: a rotina persiste `R`, não `C`.

**DECISÃO NOVA** — `F → R` não é edição do campo Situação; é uma operação compensatória que deve desfazer os efeitos do Faturamento. As condições completas, autorizações, motivo e efeitos serão especificados na fatia de cancelamento.

**CONFIRMADO** — `R → C` existe; `R → O` não faz parte do Cadastro.

### Orçado: cancelar versus excluir

**CONFIRMADO** — O parâmetro `ExclusaoContrato` controla o comando em `O`: cancelar, excluir ou perguntar. Evidência: `TfrmCadastroContratos.InternoExcluir`.

**DECISÃO NOVA** — Apenas `O → C` pertence à máquina. Excluir é operação física separada, permitida somente em `O`:

- Cancelar: mantém o Contrato como histórico em `C`;
- Excluir: remove o Contrato orçado;
- Perguntar: usuário escolhe entre as duas operações.

### Situações posteriores e limite fiscal

**CONFIRMADO** — Delphi e Laravel reconhecem os códigos `P — Nota Parcial` e `N — Nota Fiscal`. Evidências: `TtecSituacaoContrato`, `SetSituacaoContrato` e `ContratoSituacaoDocumentalMapper`.

**DECISÃO NOVA** — A primeira etapa não define transições para `P/N`. Essas situações dependem de venda futura, parâmetros da Filial, características do item e simples faturamento. O Cadastro inicial deve reconhecê-las para consulta e bloqueio seguro, sem implementar entrada, saída ou derivação.

**DECISÃO NOVA** — Contratos em `P/N` não transitam diretamente a `C`; regularização fiscal antecede qualquer decisão de situação. A regra completa pertence ao ticket de faturamento e documentos fiscais.

### Mutabilidade

| Situação | Mutabilidade no Cadastro |
| --- | --- |
| `O` | dados e itens editáveis |
| `R` | dados e itens editáveis; mudanças coordenam reserva, estoque, valores e parcelas |
| `F` | somente leitura, exceto comandos explícitos como Voltar/Cancelar |
| `P` | somente leitura neste recorte |
| `N` | somente leitura neste recorte |
| `C` | somente leitura e terminal |

**CONFIRMADO** — O padrão Delphi habilita edição até `R` e torna situações a partir de `F` somente leitura, salvo operações específicas. Evidências: `ReadOnly`, `AlterarEstadoBotoes` e comparações com `scFATURADO` em PAS/DFM.

### Transições proibidas

**DECISÃO NOVA** — São proibidos no Cadastro inicial: `O → F`, `R → O`, edição direta da Situação, criação direta em `R/F`, reabertura de `C` e qualquer transição nova envolvendo `P/N`.

**DECISÃO NOVA** — `C` é terminal. Retomar a negociação cria ou copia outro Contrato e preserva o cancelado como histórico.

### Distinção entre duas classificações de situação

**CONFIRMADO** — `contratos.situacao` é a situação documental (`O/R/F/P/N/C`). `estado_ficha` do Laravel é uma classificação financeira derivada (`aberto`, `em_atraso`, `quitado`, etc.) e não é a mesma máquina. Evidências: `ContratoSituacaoDocumentalMapper` e `ContratoFichaSituacaoMapper`.

### Consequências para os próximos tickets

- “Delimitar núcleo, abertura, localização e gravação” pode assumir criação em `O`, edição apenas em `O/R` e leitura segura nos demais estados.
- “Definir vínculo e fotografia do Cliente” deve considerar que Cliente e preços ainda podem mudar em `O/R`, com efeitos coordenados.
- “Mapear autorizações, permissões e parâmetros” deve detalhar Reserva, Faturamento, cancelamento, `F → R` e `ExclusaoContrato`.
- “Delimitar estoque, reserva e conferência” deve modelar efeitos de `O → R`, mudanças em `R`, `R → F`, `R → C` e `F → R/C`.
- “Delimitar faturamento e documentos fiscais” deve resolver posteriormente `F/P/N`, venda futura, simples faturamento e regularização fiscal.

### Aptidão para `$to-spec`

**CONFIRMADO** — A máquina de estados está decidida, mas não deve receber `$to-spec` isoladamente. Ela compõe o futuro spec do núcleo após a definição de gravação, Cliente, autorizações e origem por Orçamento.
