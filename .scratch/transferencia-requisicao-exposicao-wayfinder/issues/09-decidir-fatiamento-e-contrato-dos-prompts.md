# Decidir fatiamento, rastreabilidade e aceite dos prompts SpecKit

Type: grilling
Status: resolved
Blocked by: 03, 04, 05, 06, 07, 08

## Conversation

O usuario confirmou a publicacao de cinco prompts, nesta ordem: (1) fundacao, dominio, parametros, autorizacoes e menu; (2) consulta F6, filtros, SQL, schema, grid sem paginacao e cancelamento PostgreSQL; (3) nucleo transacional de geracao, confirmacao, estoque, reserva, movimentos e auditoria; (4) lotes e conferencia; (5) interface Laravel, integracao, atalhos, acessibilidade e criterios de aceite. Cada prompt deve referenciar os anteriores e os prompts existentes sem duplicar regras.

O usuario confirmou o contrato comum: cada prompt tera objetivo e fronteira da fatia, evidencias Delphi/Laravel/schema, comportamento esperado igual ao Delphi, regras de dados com SQL parametrizado e prevencao de N+1, seguranca/autorizacoes/parametros, criterios de aceite e testes permitidos, dependencias, exclusoes fiscais e itens nao localizados.

O usuario confirmou os nomes: `01-speckit-prompt-fundacao-dominio-seguranca.md`, `02-speckit-prompt-consulta-f6-grid-cancelamento.md`, `03-speckit-prompt-nucleo-transacional-confirmacao.md`, `04-speckit-prompt-lotes-conferencia.md` e `05-speckit-prompt-interface-integracao-aceite.md`. O primeiro prompt tambem cobre parametros, autorizacoes e menu.

## Question

Qual sequência mínima de prompts `/speckit.specify` deve ser publicada em `modules/interlojas/transferencia-requisicao-exposicao/` para permitir implementação segura por fatias? Definir fronteiras entre fundação/acesso/parâmetros, núcleo transacional, consulta/grid/cancelamento, operações de lotes e interface/integração; cada prompt deve apontar às evidências, consumir os prompts existentes sem duplicá-los, preservar decisões compartilhadas, explicitar SQL/schema, critérios de aceite, testes permitidos e exclusões fiscais.

## Answer

Publicar cinco prompts ordenados, com contrato comum e dependencias explicitas: fundacao/dominio/seguranca (incluindo parametros, autorizacoes e menu); consulta F6/grid/cancelamento; nucleo transacional; lotes/conferencia; interface/integracao/aceite. Cada arquivo deve seguir o padrao `NN-speckit-prompt-*.md`, apontar aos prompts existentes e ao snapshot autoritativo do schema, preservar a paridade Delphi e declarar exclusoes, especialmente emissao fiscal, venda entre filiais, grades obsoletas de compras/grupos/filiais, testes de driver e `hastablefs`.
