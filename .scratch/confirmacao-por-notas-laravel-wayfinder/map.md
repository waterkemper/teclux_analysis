# Wayfinder — Confirmação por Notas no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/interlojas/confirmacao-por-notas/` um conjunto autoritativo e fatiado de prompts `/speckit.specify`, pronto para orientar via Cursor a implementação de **Interlojas → Confirmação por Notas** no Laravel, incluindo fundação/acesso, filtros e grids, confirmação transacional e um componente compartilhado padrão para chave de acesso NF-e.

## Notes

- Contexto: Plataforma Laravel em convivência com o legado Delphi.
- Consultar `/research`, `/grilling` e `/domain-modeling` ao resolver tickets.
- Fontes Delphi primárias: `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas/.dfm` e `fmconfirmarnotastransferencia.pas/.dfm`.
- Fonte de parâmetros: `C:\projetos.vcl\biblio\clparametrossistema.pas` e suportes estritamente necessários para resolver suas descrições e semânticas.
- Nome canônico/menu confirmado pelo usuário: **Interlojas → Confirmação por Notas**.
- Toda leitura em lote deve evitar N+1: usar projeções set-based e `whereIn`/`IN` ou `ANY(array)` com binds quando a cardinalidade ou o limite de parâmetros justificar, preservando ordem e correspondência.
- O componente de chave NF-e deve ser compartilhado e preparado como padrão reutilizável do sistema, não componente privado da página.
- O mapa produz especificações; não implementa Laravel, não executa SpecKit e não altera Delphi.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Inventariar interface, filtros, grids, máscara e atalhos Delphi](issues/01-inventariar-interface-filtros-grids-mascara-e-atalhos.md) — tela, buscas, máscara NF-e, seleção, grids, cores, habilitação, operações e atalhos foram registrados com evidência.
- [Inventariar consultas, projeções e estratégia de batching](issues/02-inventariar-consultas-projecoes-e-batching.md) — datasets e SQLs foram inventariados com estratégia explícita de `whereIn`/`ANY`/`unnest` e testes anti-N+1.
- [Modelar a transação de confirmação, concorrência e idempotência](issues/03-modelar-transacao-confirmacao-concorrencia-e-idempotencia.md) — sequência transacional, locks, efeitos, autoria, idempotência, rollback e reconciliação foram mapeados.
- [Identificar parâmetros, autorizações e acesso do módulo](issues/04-identificar-parametros-autorizacoes-e-acesso.md) — cinco parâmetros, fallback, menu, grants e fluxo de autorização por senha/login foram esclarecidos.
- [Mapear seams Laravel e o componente compartilhado de chave NF-e](issues/05-mapear-seams-laravel-e-componente-chave-nfe.md) — seams existentes foram localizados e a ausência de uma autoridade compartilhada de chave NF-e foi confirmada.
- [Investigar a operação Conferir Produtos](issues/08-investigar-operacao-conferir-produtos.md) — `NST` foi identificado como conferência persistente por dado fiscal, não bloqueante, a ser integrada ao `ConferenceEngine` por adapter.
- [Decidir o fatiamento e os contratos dos prompts SpecKit](issues/06-decidir-fatiamento-e-contratos-dos-prompts.md) — quatro prompts foram definidos para chave NF-e compartilhada, fundação/autorização, consulta anti-N+1 e confirmação atômica por nota.
- [Produzir e validar os prompts SpecKit de Confirmação por Notas](issues/07-produzir-e-validar-prompts-speckit.md) — quatro prompts autoritativos foram criados e validados de ponta a ponta contra filtros, batching, segurança, grids, fiscal, estoque, financeiro e romaneio.
- [Reavaliar a geração de movimentos de entrada por `AtribuirDadosProdutos`](issues/09-reavaliar-geracao-movimentos-entrada-atribuir-dados-produtos.md) — confirmou materialização fiscal explícita antes de `STC`/`FTR`; a etapa 4 foi corrigida e as lacunas Laravel foram registradas.

## Not yet specified

- Nenhuma; o destino do mapa foi alcançado.

## Out of scope

- Implementar o Laravel ou alterar o Delphi durante este mapa.
- Executar os prompts `/speckit.specify` no Cursor.
- Migrar Confirmação por Item, Confirmação por Romaneio, Importação ou Exportação de Notas de Transferência, salvo seams compartilhados indispensáveis.
