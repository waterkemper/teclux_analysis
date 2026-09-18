# Fluxo Interlojas: documentospag.previsao e Romaneio ENTREGUE

## Resposta curta

Sim: no Interlojas há escrita Delphi direta de documentospag.previsao := false.
Ela ocorre em IncluirDocumentosPag, durante a confirmação de uma transferência
com vendatransferencia = true. O código não espera o Romaneio já estar
ENTREGUE: cria (Append) um novo documentospag, atribui false, faz Post e
persiste o dataset; só depois chama a função PostgreSQL
Atualizar_situacao_romaneio. Portanto, neste fluxo, a gravação de
previsao = false e a transição para ENTREGUE fazem parte da mesma operação,
mas a primeira não é efeito da segunda.

Também não foi encontrada, no snapshot autoritativo do banco usado por este
módulo, trigger que transforme documentospag.previsao em false em resposta à
situação do Romaneio.

## Cadeia comprovada — confirmação por Romaneio

1. A ação da tela é
   TfrmConfirmarromaneiosTransferencia.sbnConfirmarClick; depois da autorização
   ela chama dtmConfirmarromaneiosTransferencia.ConfirmaTransferencia
   (delphi/apps/interlojas/fmconfirmarromaneiostransferencia.pas:232-245).
2. ConfirmaTransferencia percorre os Romaneios/notas marcados
   (dmconfirmarromaneiostransferencia.pas:460-478), cria a nota de entrada e
   seus produtos (:486-488) e, somente quando
   qryromaneiosTransferenciasvendatransferencia é verdadeiro, chama
   IncluirDocumentosPag (:490-491).
3. IncluirDocumentosPag executa qryDocumentosPag.Append
   (dmconfirmarromaneiostransferencia.pas:1049-1051). O dataset é live e aponta
   para select dp.* from documentospag dp where dp.numero = 0
   (dmconfirmarromaneiostransferencia.dfm:1284-1288), logo o Append prepara uma
   inserção em documentospag.
4. Na rotina interna AtribuirdadosDocumentopag, o número é obtido por
   documentospag_proximonumero()
   (dmconfirmarromaneiostransferencia.pas:982-986; SQL em
   dmconfirmarromaneiostransferencia.dfm:1541-1553), e a escrita relevante é
   explícita: qryDocumentosPagprevisao.AsBoolean := false
   (dmconfirmarromaneiostransferencia.pas:989-1005, especialmente :996).
5. O documento e a relação notaspag.documentopag são postados
   (dmconfirmarromaneiostransferencia.pas:1005 e :1053-1055) e os datasets,
   incluindo qryDocumentosPag, são persistidos por Perpetrar
   (dmconfirmarromaneiostransferencia.pas:510-513).
6. Só após essa persistência o Delphi executa qryAtualizarSituacaoRomaneio
   (dmconfirmarromaneiostransferencia.pas:513-518). O SQL do componente é
   select Atualizar_situacao_romaneio(:romaneio)
   (dmconfirmarromaneiostransferencia.dfm:1658-1679).
7. No PostgreSQL, atualizar_situacao_romaneio(integer) chama
   situacao_romaneio(integer) e atualiza apenas romaneios.situacao_romaneio com
   o valor retornado
   (modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json:23877).
   Para Romaneio tipo T, situacao_romaneio retorna ENTREGUE quando a conferência
   de entrada ROE está completa e existe a correspondente notaspag ativa; essa
   regra está na definição capturada em
   modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json:23943.

A consulta inicial desta tela aceita Romaneios em EM TRÂNSITO, PASSAGEM ou
ENTREGUE PARCIAL (dmconfirmarromaneiostransferencia.dfm:139-142) e calcula
seleção a partir de situacao_romaneio_entrada(...)
(dmconfirmarromaneiostransferencia.dfm:33-34,69-73). Isso confirma que a ação é
uma confirmação de entrada capaz de levar o Romaneio ao estado final, não uma
edição posterior de um Romaneio já entregue.

## Cadeia comprovada — confirmação por Nota

Há uma segunda entrada funcional que pode completar o último documento e,
assim, levar o Romaneio a ENTREGUE:

1. TfrmConfirmarNotasTransferencia.sbnConfirmarClick chama
   ConfirmaTransferencia(User.CodigoUsuario)
   (delphi/apps/interlojas/fmconfirmarnotastransferencia.pas:238-251).
2. A rotina cria a nota/produtos e, quando vendatransferencia = true, chama
   IncluirDocumentosPag
   (delphi/apps/interlojas/dmconfirmarnotastransferencia.pas:401-431).
3. Essa versão também faz Append, atribui
   qryDocumentosPagprevisao.AsBoolean := false, faz Post e vincula
   notaspag.documentopag
   (dmconfirmarnotastransferencia.pas:935-961,1005-1011; atribuição exata em
   :952). O componente live aponta para documentospag
   (dmconfirmarnotastransferencia.dfm:1192-1207).
4. Após persistir os datasets (dmconfirmarnotastransferencia.pas:448-452), a
   rotina chama incluirconferenciadocumentos primeiro para ROS e depois para
   ROE (:456-474; SQL do componente em
   dmconfirmarnotastransferencia.dfm:1503-1523), e em seguida executa
   Atualizar_situacao_romaneio (dmconfirmarnotastransferencia.pas:476-478; SQL
   em dmconfirmarnotastransferencia.dfm:1480-1501).
5. incluirconferenciadocumentos grava/atualiza a conferência de volumes e, para
   ROE, só considera volumes que possuam saída ROS; sua definição autoritativa
   está em
   modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json:23910.
   A chamada final cai nas mesmas funções de situação descritas acima.

## Banco: descarte da hipótese de trigger de situação

O snapshot foi coletado do catálogo PostgreSQL em transação somente leitura em
2026-08-03
(modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json:2-13).
Ele lista cinco triggers habilitadas para documentospag: exclusão,
validação/efeitos antes de inserir/atualizar, log legado, auditoria nova e
timestamps. As definições estão no mesmo arquivo, linhas 22998-23046.

Nenhuma dessas cinco funções:

- atribui valor a NEW.previsao;
- atualiza documentospag.previsao;
- depende de romaneios.situacao_romaneio.

documentospag_log apenas copia NEW.previsao/OLD.previsao para a tabela de log
(postgresql-authoritative-2026-08-03.json:23020-23026). Já
Atualizar_situacao_romaneio atualiza somente a tabela romaneios (:23877).
Assim, para as cadeias Interlojas comprovadas, a origem de previsao = false é o
Delphi nas linhas 996 e 952, não uma trigger disparada pela mudança para
ENTREGUE.

## NÃO LOCALIZADO

Não foi localizado neste fluxo Interlojas nem nas triggers de documentospag do
snapshot um UPDATE que converta previsao de true para false em registro já
existente. As cadeias comprovadas fazem INSERT de novo documentospag já com
previsao = false.

## Conclusão

O vínculo é temporal/transacional, não uma regra “ao mudar para ENTREGUE,
coloque previsão em falso”:

Confirmar transferência → cria notaspag e, se venda-transferência, cria
documentospag(previsao=false) → persiste → registra a conferência de entrada
(na rota por Nota) → chama Atualizar_situacao_romaneio → o PostgreSQL pode
calcular ENTREGUE.

Se o registro observado em produção já existia antes dessa confirmação e teve
seu campo previsao atualizado de true para false, esta cadeia não explica tal
UPDATE. Seria necessário correlacionar documentospag_log/auditoria pelo número
do documento e horário para identificar outro fluxo.
