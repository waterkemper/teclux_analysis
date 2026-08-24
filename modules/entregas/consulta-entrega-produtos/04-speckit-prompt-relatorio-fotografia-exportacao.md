# Prompt 04 — Relatório, fotografia e exportação

Execute /speckit.specify para especificar as saídas canônicas da Consulta e Agendamento de Entregas.

## Resultado único

O F6 deve produzir um resultado canônico com filtros normalizados, Filial efetiva, ordenação, agrupamentos, identidade source_kind/chave, linhas, totais, schemaVersion, contrato/template version, data_as_of e integridade. Grid, agrupamento, preview, relatório, PDF, impressão e exportação devem ler esse mesmo resultado; não executar consultas independentes nem aceitar linhas enviadas pelo cliente.

Se a arquitetura exigir persistência para PDF, impressão ou reabertura, materializar Fotografia de Relatório imutável com generation_id, critérios, operador, autorização, Filiais, ordenação, linhas, totais, hash, data_as_of, expiração e auditoria. Cancelamento não cria fotografia parcial nem substitui o último resultado completo.

## Conteúdo e layout

Preservar o conteúdo funcional observado:

- data, hora e período de entrega;
- contrato, documento fiscal, filial, série e número quando existirem;
- código visual e descrição do produto;
- saldo e indicador de entrega;
- região, UF, cidade, bairro, CEP e endereço;
- fornecedor de transporte, romaneio, limite e texto de identificação;
- agrupamentos por data, período, região e detalhes, com totais coerentes.

O layout deve ser institucional e responsivo, não uma cópia pixel a pixel do FastReport. Grid e relatório devem usar catálogo de campos comum, títulos e formatos comuns, mesma ordenação estável e mesma regra de vazio. Totais devem ser calculados do resultado canônico, não de uma segunda consulta.

## Exportação e autorização

Exportação síncrona deve respeitar limite do orquestrador; execução pesada deve usar geração administrável. Revalidar usuário, capability, Filial, filtros e expiração em toda leitura de fotografia, HTML, PDF, impressão e exportação. Nunca confiar em colunas selecionadas, IDs ou linhas vindas do browser sem allowlist.

## Chave NF-e

A tela não comprovou chave de acesso NF-e. Se uma evolução realmente precisar dela, reutilizar NfeAccessKeyInput, NfeAccessKey, NfeAccessKeyValid e NfeAccessKeyText, com validação backend canônica. Não criar máscara, regex ou cálculo de dígito local.

## Aceite

Comprovar paridade de identidade e linhas entre grid, relatório, preview, PDF, impressão e exportação; agrupamentos, totais, vazio, expiração, hash, autorização, resposta tardia e cancelamento. Nenhuma saída pode executar N+1 ou consulta divergente.
