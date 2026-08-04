# Pesquisa: interface e fluxos Delphi do Cadastro de Romaneios

## Escopo

Inventário das raízes `fmcadastroromaneios.pas/.dfm` e `dmcadastroromaneios.pas/.dfm`, seguindo apenas dependências acionadas pela interface. SQL, schema, parâmetros e autorização completa pertencem aos tickets próprios.

## Cadastro mestre

- `CONFIRMADO` — a janela **Cadastro de Romaneios** inicia com foco no número e usa data/hora do servidor (`fmcadastroromaneios.dfm:1-5`; `.pas:167-178`).
- `CONFIRMADO` — cabeçalho: número; abertura; tipo Normal/Transferência; Fornecedor e razão; Frete por conta do Emitente/Destinatário; Situação; conferente/data; liberador/data de trânsito (`fmcadastroromaneios.dfm:147-179,2302-2534,2775-3031`).
- `CONFIRMADO` — tipo fica bloqueado depois do primeiro item. Na inclusão, Normal inicia frete Emitente e Transferência inicia Destinatário (`dmcadastroromaneios.pas:1090-1101,1408-1422,2666-2676`).
- `CONFIRMADO` — a pesquisa geral localiza Romaneios; com Fornecedor ativo, pesquisa e aplica Fornecedor. Chamadas externas podem abrir/reabrir um Romaneio específico (`fmcadastroromaneios.pas:230-302,649-663`).
- `CONFIRMADO` — Valores do Romaneio mostra Entregue, A entregar, Total a pagar e duplicatas somente leitura: Documento, Vencimento, Valor, Pagamento, Valor pago, Previsão e Autorizado. Há observação mestre (`fmcadastroromaneios.dfm:2269-2299,2539-2772`).
- `CONFIRMADO` — CRUD herdado: Incluir `F3`, Gravar `F5`, Excluir `F6`; `Esc` cancela primeiro a edição ativa (`fmcadastropadrao.dfm:44,119,195`; `fmcadastropadrao.pas:181-269`).
- `CONFIRMADO` — Gravar exige ao menos um item. Excluir só é oferecido em `ABERTA`, bloqueia se há entrega ou duplicata paga e pede confirmação para mestre e associados (`dmcadastroromaneios.pas:551-621,674-697,2633-2636`).

## Grade de Notas e Cupons

- `CONFIRMADO` — colunas: Filial, Série, Nº NF, ECF/Máquina, Intervenção, Nº Cupom, situação fiscal, emissão, volumes, anulado, Cliente/nome, recebimento, justificativa, motivo/código/descrição, entrega original, situação de saída, reagendamento (data/hora) e endereço completo (`fmcadastroromaneios.dfm:257-1228`).
- `CONFIRMADO` — total de volumes separado; situação fiscal `C` em vermelho e demais em verde, sem legenda textual (`fmcadastroromaneios.dfm:2225-2264`; `.pas:818-830`).
- `CONFIRMADO` — identidade fiscal só edita com item `ABERTA`. Cancelado, frete, valores e observação bloqueiam em Romaneio `FECHADA` (`dmcadastroromaneios.pas:1507-1523`).
- `CONFIRMADO` — recebimento edita em Romaneio Normal com saída `EM TRÂNSITO`, `ENTREGUE PARCIAL` ou `ENTREGUE`, sem justificativa; horário anterior ao trânsito é corrigido. Reagendamento edita em `ENTREGA NÃO EFETUADA` ou `EM TRÂNSITO` (`dmcadastroromaneios.pas:1455-1527,2577-2600`).
- `CONFIRMADO` — ações: incluir múltiplos; incluir/editar/excluir item; assinatura; conferir volumes; justificar; visualizar movimentações. Duplo clique/Ctrl+F2 edita, Ctrl+F3 inclui e Ctrl+Espaço alterna anulado (`fmcadastroromaneios.dfm:1380-2183`; `.pas:304-341,691-708`).
- `CONFIRMADO` — excluir item exige situação de saída `ABERTA` e confirmação. Assinatura abre blob Base64 sob condição específica de recebimento. Movimentações exibem tipo, usuário, Filial, data/hora, volumes e conferido, com Filial/Série/Número/Chave no cabeçalho (`dmcadastroromaneios.pas:1180-1189,2628-2631`; `fmcadastroromaneios.pas:385-387,596-618,808-816`; `fmMovimentacaoLotesDadosFiscais.dfm:141-549`).

## Cadastro unitário de Nota/Cupom

- `CONFIRMADO` — modal com abas Nota Fiscal e Cupom Fiscal. Nota: Filial, Série, Nº Nota, “Somente NF com itens para entrega”. Cupom: Filial, ECF, Intervenção, Nº Cupom. Campos comuns: Chave NF-e, Auto Incluir, Anulado, Emissão, Tipo de Frete, Valor Tabela, Valor Frete e Observação (`fmcadastroitensromaneio.dfm:53-1156`).
- `CONFIRMADO` — Série/Nº Nota são obrigatórios para Nota; Nº Cupom/ECF/Intervenção para Cupom. Com entrega, Valor Frete é obrigatório (`fmcadastroitensromaneio.pas:170-197`; `dmcadastroromaneios.pas:1191-1213`).
- `CONFIRMADO` — após salvar Nota, foco/seleção voltam à chave; após Cupom, à Filial (`fmcadastroitensromaneio.pas:183-190`).
- `CONFIRMADO` — Enter na chave remove não dígitos, força aba Nota, localiza/preenche e grava. Auto Incluir inicia outra inclusão, pisca “INCLUINDO!” e preserva fluxo de scanner (`fmcadastroitensromaneio.pas:513-560`).
- `POSSÍVEL BUG LEGADO` — não há validação explícita de 44 dígitos/DV nessa interface; apenas `somentenumero`. `vProsseguir` recebe retorno sem ser inicializado ou usado. Laravel deve consumir a autoridade compartilhada de chave NF-e (`fmcadastroitensromaneio.pas:515-537`).

## Seleção múltipla

- `CONFIRMADO` — abas Parâmetros/Dados. Filtros: emissão inicial/final; Filiais; Clientes; entrega inicial/final; somente NF com itens para entrega (`fmSelecaoMultiplasNotasRomaneio.dfm:142-396`).
- `CONFIRMADO` — emissão inicia em servidor−15 dias até hoje; datas são obrigatórias, válidas e ordenadas, com mensagem/foco em erro (`fmSelecaoMultiplasNotasRomaneio.pas:93-172`).
- `CONFIRMADO` — `Gerar F6` consulta e só abre Dados com resultado. Pesquisa por chave aparece em Dados e Enter localiza preservando foco (`fmSelecaoMultiplasNotasRomaneio.pas:124-181,320-359`).
- `DIVERGENTE` — Delphi não oferece Cancelar durante Gerar; Laravel deve oferecer desde o início e interromper a query PostgreSQL.
- `CONFIRMADO` — grade: emissão, Cliente, endereço, frete, Filial, Série/Nota/chave, ECF/Intervenção/Cupom, entrega, valores, observação e seleção. Permite ordenar, Ctrl+C, marcar todos (`fmSelecaoMultiplasNotasRomaneio.dfm:421-1280`; `.pas:184-251,361-380`).
- `CONFIRMADO` — padrões em lote para Tipo de Frete, Entrega, Valor e Observação; `Ctrl+F5` aplica às marcadas. Gravar só habilita com seleção, inclui e fecha (`fmSelecaoMultiplasNotasRomaneio.pas:253-344`).

## Conferência e entrega

- `CONFIRMADO` — Conferir usa operação `RPS` em `PASSAGEM` ou `ROS` nos demais casos, apenas com documentos não cancelados (`fmcadastroromaneios.pas:620-647`).
- `CONFIRMADO` — Conferência de Volumes mostra documentos/volumes, chave, Conferidos/Não conferidos, leitura por Enter, Recomeçar, Gravar `F5` e `Esc`; Imprimir `F7` está invisível (`fmConferenciaDocumentos.dfm:9-426`; `.pas:202-221,938-959`).
- `CONFIRMADO` — Liberar `F10`: Normal+`CONFIRMADA`, autorização “LIBERAR ENTREGA”, grava usuário/data. Reter `F10`: Normal+`EM TRÂNSITO`, autorização “RETER ENTREGA”, limpa ambos. As duas recalculam situação (`fmcadastroromaneios.pas:391-405,500-515,665-689,782-806`; `dmcadastroromaneios.pas:2555-2575,2644-2664`).
- `POSSÍVEL BUG LEGADO` — liberar/reter engolem exceções sem feedback; não reproduzir.
- `CONFIRMADO` — Justificar aparece para Normal com item em `EM TRÂNSITO`, `ENTREGUE PARCIAL`, `ENTREGUE` ou `ENTREGA NÃO EFETUADA` (`fmcadastroromaneios.pas:414-420`).

## Justificativa e impressão

- `CONFIRMADO` — justificativa: Motivo tipo `E`, data/hora da tentativa, observação, Limpar Campos, Atendimento `F10` e Reagendamento. Sem limpar, os três campos são obrigatórios com mensagem/foco. Atendimento abre follow-up contextual; Reagendamento abre Consulta de Entrega por Romaneio+dado fiscal (`fmJustificativaEntrega.dfm:1-281`; `.pas:46-178`).
- `DÚVIDA` — Reagendamento tem hint “Liberar Entrega”, provável texto reaproveitado (`fmJustificativaEntrega.dfm:93-161`).
- `CONFIRMADO` — Imprimir `F7` escolhe **Notas do Romaneio** ou **Produtos do Romaneio** e **Incluir cancelados** (`fmcadastroromaneios.pas:352-364`; `fmLerTipoRelatorio.dfm:45-68`).

## Estados observáveis

| Estado | Interface comprovada |
|---|---|
| `ABERTA` | Alterar/incluir/excluir; identidade fiscal editável. |
| `CONFIRMADA PARCIAL` | Alterar documento/itens; não excluir mestre. |
| `CONFIRMADA` | Alterar; Normal pode Liberar. |
| `PASSAGEM` | Alterar; conferência RPS. |
| `EM TRÂNSITO` | Normal pode Reter; recebimento/justificativa conforme item. |
| `ENTREGUE PARCIAL` | Recebimento/justificativa conforme item. |
| `FECHADA` | Itens e campos mutáveis bloqueados. |

`DÚVIDA` — a função PostgreSQL ainda deve confirmar todas as transições.

## Requisitos para os prompts

- Preservar as quatro superfícies funcionais e telas compartilhadas alcançadas, adaptadas ao Laravel.
- Usar texto/ícone além de cor; UI desabilitada não substitui autorização.
- Atalhos comprovados: mestre `F3/F5/F6/F7/F10`; grid `Ctrl+F2/Ctrl+F3/Ctrl+Espaço`; múltipla `F6/Ctrl+F5/Ctrl+C`; conferência `F5/Esc`.
- Reusar grid/exportação/preferências Laravel, cancelamento real e chave NF-e compartilhada.
- Testar guards, validação/foco, confirmação destrutiva, falhas, respostas tardias e atalhos duplicados.
