# Pesquisa: parâmetros, autorizações e acesso da Confirmação por Notas

## Conclusão e parâmetros

O módulo não chama `parametros_valor(descricao, filial)` diretamente; lê propriedades `ParSistema` indexadas internamente por descrição. No Laravel, resolver em lote por `ParameterService::getMany(..., filial_ativa)`.

| Propriedade | Descrição literal | Tipo, efeito e fallback |
|---|---|---|
| `UsarGradesProdutos` | `USAR GRADES PRODUTOS` | Booleano; visibilidade das colunas de grade. Inválido/ausente: `false`. |
| `MascaraQuantidade` | `Máscara Quantidade` | String; formato/largura de quantidades. Ausente: vazio. |
| `DataContabil` | `DATA CONTABIL` | Data/string; valida datas inicial/final. Inválida cai em `30/12/1899` no Delphi; Laravel deve tratar erro explicitamente. |
| `DiasNotaRetroativa` (via `NDiasLimiteEmissao`) | `DIASNOTARETROATIVA` | Inteiro; limite retroativo combinado à data contábil. Inválido: `0`. |
| `EventoPagtoDuplTransferenciaentreEmpresa` | `Evento Pagto Duplicata Transferência entre empresa` | Código string/variant do documento a pagar. Ausente: vazio; se financeiro for necessário, falhar por configuração. |

Evidências: `C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.pas:116-129,193-210`; `C:\projetos.vcl\apps\interlojas\dmconfirmarnotastransferencia.pas:912-923,947-949`; `C:\projetos.vcl\biblio\clparametrossistema.pas:1969,2075,2128,2132,2230,2606-2609,4957-4964,5912-5925,7487-7494,7822-7825,7848-7872`.

Filial nula vira `-1` global (`clparametrossistema.pas:1889-1909`); leitura tenta filial ativa e depois global (`:7138-7153`), com filial propagada aos itens (`:7320-7326`). Boolean inválido vira `false`, número inválido `0` e string ausente vazio (`:7075-7087,7099-7105,7129-7153`). Carregar as cinco chaves em uma única `getMany`.

## Autorização operacional

No Confirmar:

- solicitante sem `TransferenciaPorItem`: `taSENHA`, senha do login corrente;
- solicitante com `TransferenciaPorItem`: `taLOGIN`, login/senha de outro usuário, motivo `ctAUTORIZACAOTRANSFERENCIA = 'Para Confirmar a Transferência'` e responsável `ctAUTORIZADO = ' usuário autorizado'`;
- só prossegue se o autenticado existe e **não** possui `TransferenciaPorItem`.

Evidências: `C:\projetos.vcl\apps\interlojas\fmconfirmarnotastransferencia.pas:236-253`; `C:\projetos.vcl\biblio\clusuario.pas:602-605,640-665`; `C:\projetos.vcl\biblio\ctconstantes.pas:1483-1485,1693,2219`. `taSENHA` reutiliza o login; `taLOGIN` coleta usuário/senha (`C:\projetos.vcl\repositorio\dmsenhaautorizacao.pas:79-100,121-135`); conexão bem-sucedida materializa o autorizador (`C:\projetos.vcl\repositorio\dmbasico.pas:1484-1508`).

Laravel deve distinguir **solicitante** (sessão) e **autorizador** (credenciais revalidadas), auditar ambos sem senha e nunca confiar em `autorizador_id` do browser. O autorizador é gravado em `conferenciadocumentos.usuario` (`dmconfirmarnotastransferencia.pas:456-470`), enquanto financeiro usa `UsuarioLogin.Administrador` e `UsuarioLogin.CodigoUsuario` (`:942-949,978-990`); preservar essa diferença ou decidir explicitamente outra auditoria.

## Filial, menu e acessosmodulos

A tela fixa `FilialBase` da sessão e usa-a na consulta (`fmconfirmarnotastransferencia.pas:116-120`; `dmconfirmarnotastransferencia.pas:498-505`). Não há seleção livre: ignorar filial do cliente.

Menu: `InterLojas → Confirmação por Notas`, componente `mitConfirmarNotasTransferencia` (`C:\projetos.vcl\apps\tecsoft\fmtecsoft.dfm:830-853`). Acesso lê `acessosmodulos.nomemenu`, unindo `usuariosacessosmodulos` e `gruposusuariosacessosmodulos` (`C:\projetos.vcl\biblio\clusuario.pas:332-344,425-438,612-623`); suporte/administrador têm bypass (`C:\projetos.vcl\apps\tecsoft\fmtecsoft.pas:1359-1382`).

Criar acesso Laravel próprio, associável a usuário/grupo, protegendo menu, rota e policy. Não foi localizado código numérico/seed confiável: não inventar/reutilizar código. Não confiar em filial, autorizador, administrador ou `transferenciaporitem` enviados pelo cliente.
