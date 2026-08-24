# Prompt para /speckit.specify — IBS/CBS na NF-e de transferência

## Contexto

Estamos revisando a emissão de NF-e própria do módulo de Transferência de Requisição para Exposição no Laravel. A implementação atual já possui a fotografia fiscal, numeração, chave, natureza e CFOP por item e os impostos legados ICMS/IPI/PIS/COFINS, mas ainda não há caminho Laravel para IBS/CBS.

O comportamento fiscal atualizado do Delphi foi verificado e está transcrito neste prompt. O Cursor não tem acesso aos fontes Delphi e não deve tentar abri-los. Use somente os fatos e contratos abaixo, além do código Laravel e do PostgreSQL disponível no projeto.

Este prompt cobre somente NF-e modelo 55 de saída por transferência de requisição. Não incluir venda entre filiais, devolução, NFS-e, NFC-e, etiquetas, impressão automática, impressoras ou alteração do fluxo de cancelamento/inutilização.

## Fatos comportamentais atualizados

Na confirmação da transferência, o Delphi conclui a inclusão da nota, dados fiscais, movimentos e atualização de pedidosfiliais; depois executa o cálculo fiscal de saída. 
A emissão deve continuar sendo uma transação operacional coerente, sem criar uma segunda movimentação de estoque durante a emissão da NF-e.

Na composição da NF-e, o Delphi lê os impostos novos por documento e produto a partir de uma estrutura equivalente a:

- trib_saida_item_imposto, relacionada a trib_imposto;
- trib_saida_total_imposto para os totais do documento;
- função/rotina de recálculo de saída equivalente a fn_recalcula_saida, quando essa for a autoridade instalada no PostgreSQL.

Para cada item, quando houver registro aplicável e os dois códigos estiverem preenchidos, o Delphi gera IBSCBS com:

- CST = código tributário comum de CBS/IBS;
- cClassTrib = classificação tributária comum;
- gIBSCBS.vBC;
- gIBSUF.pIBSUF e gIBSUF.vIBSUF;
- gIBSMun.pIBSMun e gIBSMun.vIBSMun;
- gIBSCBS.vIBS = IBS UF + IBS município;
- gCBS.pCBS e gCBS.vCBS.

Para o total, quando houver dados calculados, o Delphi gera IBSCBSTot com, no mínimo:

- vBCIBSCBS;
- gIBS.gIBSUF.vIBSUF e gIBS.gIBSMun.vIBSMun;
- gIBS.vIBS;
- gCBS.vCBS;
- os campos de diferença, devolução tributária e crédito presumido previstos pelo layout, com valores provenientes do cálculo ou zero somente quando o contrato fiscal determinar zero;
- vDif, vDevTrib, vCredPres e vCredPresCondSus em cada grupo aplicável.

O CST e o cClassTrib são comuns às regras de CBS, IBS UF e IBS município. Não aceitar silenciosamente divergência entre os registros relacionados. O cálculo deve manter escala, arredondamento e soma compatíveis com a NF-e serializada; vIBS deve ser a soma dos componentes UF e município.

## Tarefas da especificação

1. Mapear no banco de dados instalado as tabelas, colunas, relacionamentos, função de recálculo e catálogo de CST/cClassTrib existentes. Não inventar tabela, coluna, alíquota ou código padrão. Se a estrutura não existir no ambiente, a especificação deve definir o bloqueio explícito antes de reservar/numerar a NF-e e a forma de habilitação/migração.
2. Definir a autoridade do cálculo: reaproveitar uma função PostgreSQL existente ou implementar o cálculo no serviço fiscal Laravel. Deve haver uma única fonte de verdade e uma fotografia fiscal imutável; o serializer não pode recalcular imposto.
3. Estender a leitura de metadados/projeção da transferência para transportar os dados IBS/CBS do item e dos totais até a fotografia fiscal, sem aceitar esses valores como entrada livre do request ou da tela.
4. Definir o comportamento por competência/layout/configuração fiscal. Se IBS/CBS forem exigidos pelo pacote normativo vigente, ausência de CST, cClassTrib, base, alíquota ou valor aplicável deve bloquear antes da numeração. Se o layout/configuração ainda não exigir o grupo, registrar essa decisão de forma explícita e não emitir um grupo parcialmente preenchido.
5. Estender o serializer NFePHP para produzir IBSCBS por item e IBSCBSTot no total, preservando a ordem/estrutura esperada pelo layout. A fotografia, o XML e os totais devem ser comparáveis sem recalcular no momento da serialização.
6. Preservar as regras já corrigidas: uma NF por filial requisitante/grupo operacional, sem separar artificialmente por producaoPropria; natureza e CFOP continuam sendo definidos por item; produtos próprios podem usar a natureza de produção própria já especificada; CFOP continua podendo variar por produto.
7. Definir idempotência e reprocessamento: o recálculo não pode duplicar linhas tributárias, alterar uma fotografia selada ou mudar a chave/número já reservado.

## Critérios de aceite

- Uma transferência com dados IBS/CBS válidos produz na fotografia os campos de item e totais e gera IBSCBS/IBSCBSTot no XML.
- O XML não contém IBS/CBS parcial, valores inventados ou divergência entre CST/cClassTrib e os componentes.
- A ausência de dados obrigatórios é reportada com código operacional claro antes da reserva da numeração.
- O teste valida base, alíquotas, valores, arredondamento, soma IBS UF + município e total CBS.
- O teste prova que os valores vêm do banco/cálculo fiscal e não do payload da tela.
- O teste prova que a reexecução é idempotente e não cria movimento de estoque adicional.
- Existem testes unitários do cálculo/projeção, integração do PostgreSQL e serialização NFePHP com XML; os testes devem usar fixtures determinísticas e não depender de SEFAZ real.
- A especificação deve listar migrations, contratos, serviços, repositórios, comandos, testes e rollout necessários. Não implementar código durante /speckit.specify.

## Entrega esperada

Produza a especificação de implementação completa, com decisões explícitas sobre a fonte PostgreSQL, matriz de campos Delphi/Laravel/XML, estados de erro, compatibilidade do layout vigente e critérios de aceite. Não ampliar o escopo para NFS-e ou para os processos de cancelamento/inutilização.
