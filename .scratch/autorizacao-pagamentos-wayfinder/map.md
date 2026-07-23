# Paridade da Autorização de Pagamentos em Contas a Pagar

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/autorizacao-pagamentos/`, um dossiê específico e um prompt `/speckit.specify` autocontido para implementar no Laravel o módulo de Autorização de Pagamentos alcançável no Delphi, preservando e aprofundando os commands, Policies, Sensitive Operation, UI e testes já existentes.

## Notes

- Fonte Delphi principal: `delphi/apps/contaspagar/dmautorizacaopagamento.pas/.dfm` e `fmautorizacaopagamento.pas/.dfm` (espelho local do caminho informado `projetos.vcl/apps/contaspagar/`).
- Seguir consumidores alcançáveis apenas quando necessários para fixar o contrato de autorização; não reanalisar toda a Quitação.
- Analisar sempre o Laravel atual antes de propor mudanças, especialmente `AuthorizeDuplicataPaymentCommand`, `AuthorizeDuplicataPaymentRequest`, `DocumentosPagarController`, `ContasPagarDocumentosPagarAuthorizationService`, Policies, `SensitiveOperationAuthService`, proof/contexto, UI e testes.
- Reutilizar como contexto, sem duplicar, `modules/financeiro/contas-pagar/quitacao-duplicata/` e ADR-0246 sobre rascunho versus comandos financeiros.
- Usar a linguagem: **Autorização de Pagamento** é evidência/estado que permite tentar a Quitação; não é a própria Quitação.
- Rastrear campos, filtros, marcação, autorização/desautorização, operador/autorizador, Filiais, parâmetros, impressão, lote, logs e efeitos sobre Duplicatas.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Respeitar ADR-0002 (UI ERP), ADR-0005 (parâmetros), ADR-0007 (fail-fast de schema) e ADR-0246 (comandos financeiros).
- Este mapa gera planejamento/especificação; não altera Delphi nem implementa Laravel.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar o fluxo e a interface Delphi](issues/01-inventariar-fluxo-interface-delphi.md): confirmou duas jornadas (autorizar e cancelar/imprimir), filtros, grade, marcação, totais, atalhos e exclusão de pagos; registrou lacunas de estados de UI e divergência do F7.
- [Inventariar dados, regras e efeitos da Autorização de Pagamentos no Delphi](issues/02-inventariar-dados-regras-delphi.md): fixou o estado por duplicata, proof baseado em perfil Pagamento, parâmetro de autorização automática, transação e dependência da Quitação.
- [Inventariar a Autorização de Pagamentos já implementada no Laravel](issues/03-inventariar-laravel-autorizacao-atual.md): confirmou command unitário seguro como base, mas sem UI/data/desautorização/lote e com divergências de proof, parâmetro e impressão.
- [Definir a matriz e o contrato seguro da Autorização de Pagamentos](issues/04-definir-matriz-contrato-autorizacao.md): decidiu estados, read model, lote atômico, proof segregado, Auditoria, impressão pura, UX, erros e integração com Quitação.
- [Consolidar o dossiê e o prompt Spec Kit da Autorização de Pagamentos](issues/05-consolidar-dossie-prompt.md): publicou o dossiê focado e o prompt autocontido em `modules/financeiro/contas-pagar/autorizacao-pagamentos/`.

## Not yet specified

Nenhum. O mapa atingiu o destino.

## Out of scope

- Implementar o módulo durante o Wayfinder.
- Alterar Delphi.
- Reespecificar Pay/Cancel/Rebuild além do contrato de consumo da Autorização.
- Migrar integralmente quitação em lote, remessa, retorno ou relatórios não acionados pela tela de Autorização.
- Copiar credenciais frágeis, login mágico, proteção somente visual, Filiais globais, SQL inseguro, `MAX+1` ou estado confiado ao cliente.
