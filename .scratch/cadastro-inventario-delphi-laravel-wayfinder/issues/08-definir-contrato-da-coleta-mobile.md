# Definir contrato da Sessão de Coleta Mobile do Inventário

Type: grilling
Status: resolved
Blocked by: 07

## Question

Definir a operação de coleta do Inventário para celular e tablet: Sessão de Coleta Mobile separada, vinculada a um Inventário aberto, bipagem por câmera, layout responsivo, operador/dispositivo, ciclo de vida, duplicidade, sincronização, conflitos, permissões, auditoria, funcionamento com conectividade limitada e integração com os Itens de Inventário.

Preservar a separação entre coleta e Processamento de Inventário. A coleta não deve publicar P nem editar Movimentos de Estoque; precisa deixar claro quando uma bipagem cria, incrementa, corrige ou apenas seleciona um Item de Inventário.

## Evidence captured

O Delphi também possui importação de arquivo para o Inventário (`fmcadastroinventario.pas:665-734`; `dmcadastroinventario.pas:2056-2196`):

- o arquivo é lido linha a linha como CSV separado por vírgula, com código e quantidade;
- linhas repetidas do mesmo código são acumuladas;
- produto já presente soma a quantidade; produto novo é incluído com descrição, grades e saldos da consulta de produto;
- código alfanumérico depende de `ParSistema.PermitirProdutoAlfanumerico`;
- quantidade inválida interrompe a leitura com erro;
- após sucesso, o arquivo é renomeado para `.old` e o caminho é salvo no INI;
- o DFM usa `TSaveDialog` para selecionar um arquivo de entrada, uma divergência a corrigir no Laravel;
- a lógica comentada menciona `PesquisaPadraoProdutoCodigoBarras`, mas a rotina ativa consulta `produtovisual`; código de barras não deve ser afirmado como comportamento efetivo sem decisão adicional.

Também foi confirmada uma operação separada de junção/cópia de inventários (`fmcadastroinventario.pas:631-647`; `dmcadastroinventario.pas:1941-2045`): seleciona inventários abertos da mesma Filial, soma quantidades de Produtos repetidos, inclui Produtos ausentes no destino e marca cada origem como `T`, preenchendo `transferidopara` com o número do Inventário destino. Essa operação não deve ser confundida com bipagem, importação ou Processamento F8.

## Answer

Contrato mobile confirmado:

- Sessão separada vinculada a Inventário A; não publica P e não edita Movimentos de Estoque.
- Câmera, entrada manual e TXT alimentam a mesma sessão e usam a mesma identificação parametrizada por `PesquisaPadraoProdutoCodigoBarras` e `PermitirProdutoAlfanumerico`.
- TXT mantém o formato legado `código,quantidade`; repetições são somadas, sem lote. Produtos controlados por lote são distribuídos posteriormente com fechamento de soma.
- A sessão é offline-tolerante, idempotente, auditável, sincronizável e permite vários Usuários/dispositivos. Não finaliza com pendências/conflitos e não processa offline.
- Leiaute mobile-first: câmera principal, controles grandes, entrada manual, progresso, último Produto, pendências e conflitos; tablet pode usar duas colunas.
- Câmera indisponível oferece entrada manual e TXT. Correção manual exige Inventário A, motivo para reduzir/corrigir e auditoria completa.
- Iniciar/pausar/retomar/bipar/importar usam alteração; finalizar exige permissão própria; F8 continua exigindo Gerente de Estoque.
- A junção/cópia de Inventários foi confirmada separadamente e permanece responsiva em desktop/tablet, com permissão e confirmação, fora do fluxo rápido de coleta.

Fontes adicionais verificadas: `dmcadastroinventario.pas:2056-2196`, `fmcadastroinventario.pas:665-734`, `fmcadastroprodutosinventario.pas:348-410,435-500`, `dmcadastroinventario.pas:1941-2045` e `fmcopiarprodutosinventarios.pas:57-115`.
