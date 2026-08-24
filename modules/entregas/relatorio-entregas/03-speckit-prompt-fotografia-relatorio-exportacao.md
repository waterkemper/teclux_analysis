# Prompt para `/speckit.specify` — fotografia, relatório e exportação

```text
/speckit.specify

Crie a especificação funcional e técnica da Fotografia de Relatório, visualização, PDF, impressão e exportação do **Relatório de Entregas**, terceiro de quatro prompts. Consuma as specs 01–02. Não crie uma nova consulta, não altere filtros/SQL e não reabra decisões de acesso, grid ou cancelamento.

Não implemente durante /speckit.specify. Inspecione o checkout Laravel atual e cite arquivos concretos. Não peça inspeção direta do Delphi.

Autoridades:
- modules/entregas/relatorio-entregas/README.md
- modules/entregas/relatorio-entregas/pesquisa-interface-delphi.md
- modules/entregas/relatorio-entregas/pesquisa-sql-delphi.md
- modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md
- a saída da spec 02

## Fotografia canônica

- Cada F6 bem-sucedido materializa uma Fotografia de Relatório imutável com critérios normalizados, Filial, usuário/Operador, ordenação, catálogo/schema/template version, linhas, agrupamentos/totais quando existentes, integridade/hash, estado, timestamps e retenção.
- Grid, preview, HTML, PDF, impressão e exportação devem ler a mesma fotografia/read model. Não execute uma consulta separada para PDF, download ou exportação.
- Cancelamento, erro e expiração não substituem o último resultado completo. Nova geração possui identidade própria e respostas antigas não podem sobrescrever o resultado atual.
- Autorize novamente a visualização, PDF, impressão e download por usuário, capability e Filial; audite criação, visualização, download, impressão e cancelamento sem registrar credenciais, SQL sensível ou chave NF-e completa.
- Defina comportamento para vazio: mensagem de nenhum registro, sem fotografia parcial e sem PDF enganoso.

## Campos e layout

Preserve a semântica e os campos consolidados: contrato, cliente/tipo/nome, endereço de entrega com rua/número/complemento/bairro/CEP/cidade/UF, produto/descrição, quantidade, quantidade entregue, a entregar, região/código, datas de entrega/emissão/faturamento, filial de venda, observação de montagem e dia da semana. Preserve títulos de situação e zebração como intenção visual, mas não exija reprodução pixel a pixel do FastReport.

O agrupamento por região/cliente não será exposto nesta entrega porque os controles Delphi estavam ocultos e não eram enviados ao dataset. Não criar totais ou agrupamentos sem evidência da fotografia/contrato.

## Exportação e impressão

- Use ErpReportLayoutService, layout institucional, identidade de Filial e os services de PDF/impressão já existentes.
- Use GridExportOrchestrator para exportação; contexto deve congelar fotografia, filtros, Filial, sort, versão e colunas autorizadas, e ser reautorizado no download.
- PDF, impressão e exportação devem representar todas as linhas da mesma fotografia, ainda que o grid use paginação visual.
- Defina retenção e expiração conforme a convenção atual do Laravel; se o valor não existir, registrar a decisão e o risco, sem inventar um período silenciosamente.
- Se referência de chave NF-e vier a ser necessária, usar NfeAccessKeyInput/NfeAccessKey/NfeAccessKeyValid/NfeAccessKeyText; não criar máscara, regex ou DV local. A tela legada não possui esse campo.

## Saída da spec

Entregue contrato da fotografia, materializador/leitor, templates/layout, preview/PDF/impressão, exportação, retenção, auditoria, autorização, vazio, erros e testes de equivalência grid/relatório/PDF/exportação. Reutilize o read model da spec 02 e não introduza N+1 ou uma segunda fonte de dados.
```
