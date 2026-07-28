# Pesquisa — interface e fluxo Delphi do Estorno do Pagamento

## Escopo e fontes

Investigação da jornada legada de cancelamento de quitação, com foco na interface em lote e no ponto equivalente do Cadastro de Contas a Pagar. Fontes primárias: `fmcancelamentoquitacao.pas/.dfm`, `dmcancelamentoquitacao.pas/.dfm`, `fmcadastroduplicatascontaspagar.pas/.dfm`, `dmcontaspagar.pas` e `rgcontaspagar.pas`, em `C:/projetos.vcl/apps/contaspagar`. A simetria de UX usa a baseline do repositório em `modules/financeiro/contas-pagar/quitacao-em-lote/dossie.md`.

Esta pesquisa inventaria comportamento observável e implicações para a especificação. No domínio novo, o nome canônico é **Estorno do Pagamento em Lote**.

## 1. Jornada alcançável

Há dois caminhos relacionados, mas distintos:

1. `TfrmCancelamentoQuitacao` é registrado entre os formulários da aplicação (`rgcontaspagar.pas:8-14`). É uma tela completa intitulada **Cancelamento de Quitação**, não um modal do Cadastro (`fmcancelamentoquitacao.dfm:1-6`).
2. No Cadastro de Contas a Pagar, excluir uma Duplicata em operação de pagamento/cancelamento chama `dtmContasPagar.CancelarQuitacao`; opcionalmente, `ckbRefazerPagamento` reaplica os dados anteriores (`fmcadastroduplicatascontaspagar.pas:198-244`). Esse caminho unitário é referência para desquitar, enquanto a nova jornada em lote deve seguir a página dedicada.

Fluxo observável: `Parâmetros -> Gerar (F6) -> Registros Selecionados -> marcar -> Confirma (F5) -> autorização -> processamento -> recarga`.

O formulário inicia nos parâmetros, com período inicial/final igual ao dia corrente (`fmcancelamentoquitacao.pas:148-160`). F6 consulta; com resultados muda de aba, sem resultados avisa e devolve foco ao período inicial (`fmcancelamentoquitacao.pas:346-369`). F5 chama o cancelamento e atualiza telas de Cadastro ou Quitação abertas (`fmcancelamentoquitacao.pas:316-340`). Esc na lista volta aos parâmetros e limpa seleção, contadores e consulta (`fmcancelamentoquitacao.pas:276-299`).

## 2. Filtros e validações

A aba **Parâmetros** oferece:

- período de pagamentos, de/até (`fmcancelamentoquitacao.dfm:340-404`);
- Filial **ou** Grupo de Filiais, mutuamente exclusivos; trocar limpa o outro (`fmcancelamentoquitacao.dfm:423-664`; `fmcancelamentoquitacao.pas:303-313`);
- Parte Fornecedora, rotulada Fornecedor, Cliente Fornecedor ou Filial Fornecedor conforme o tipo (`fmcancelamentoquitacao.pas:114-125`);
- Conta bancária, com Banco e Agência derivados (`fmcancelamentoquitacao.dfm:191-339,933-1002`);
- Conta Crédito/conta contábil, visível somente com Contabilidade ativa (`fmcancelamentoquitacao.pas:148-160`; `fmcancelamentoquitacao.dfm:799-932`);
- ordenação por **Data Pagto** ou **Fornecedor** (`fmcancelamentoquitacao.dfm:405-422`).

Antes de pesquisar, valida as datas, exige ao menos uma preenchida e valida a existência de cada lookup informado (`fmcancelamentoquitacao.pas:411-420`). A query aplica os filtros e exige `DataPagto IS NOT NULL`, logo o universo contém somente Duplicatas pagas (`dmcancelamentoquitacao.dfm:333-412`; `dmcancelamentoquitacao.pas:612-670`).

Para o lote novo, período de pagamento, Filiais, Parte Fornecedora, Conta e ordenação são filtros centrais. Grupo pode ser absorvido por seleção múltipla de Filiais permitidas. Conta Crédito é efeito/reconstrução contábil, não fato a ser inventado pelo Operador.

## 3. Lista, seleção e totais

O grid exibe código/nome da Parte Fornecedora, Documento, número da Duplicata, nota/complemento, data do pagamento, atraso, valor pago, Conta, cheque e `OK` (`fmcancelamentoquitacao.dfm:1020-1222`). Atraso compara pagamento ao primeiro dia útil do vencimento, limitado a zero (`dmcancelamentoquitacao.dfm:376-395`). Totais separam quantidade/valor pesquisados de quantidade/valor marcados (`fmcancelamentoquitacao.dfm:1240-1398`; `fmcancelamentoquitacao.pas:129-138`).

A seleção é explícita. Duplo clique ou `Ctrl+Espaço` alterna a linha; marcação recebe destaque; há **Marcar todas as duplicatas** (`fmcancelamentoquitacao.pas:141-189`; `fmcancelamentoquitacao.dfm:1224-1234`). F5 só habilita com marcação; F6 somente nos parâmetros; “Marcar todas” somente com resultados (`fmcancelamentoquitacao.pas:114-126`).

O novo lote deve manter seleção e totais, mas usar identidade `(documentopag, datavencto, numero)` mais revisão. O booleano temporário legado chama-se `Quitar` apesar de cancelar (`dmcancelamentoquitacao.dfm:390-395,464-465`); esse nome não deve entrar no contrato novo.

## 4. Cheque compartilhado

Ao marcar Duplicata com cheque, o legado consulta itens da mesma Conta/cheque. Se todos estão no resultado, pergunta se deve marcar o conjunto; se não, conserva apenas a atual (`dmcancelamentoquitacao.pas:462-490`). Se faltam itens devido aos filtros, identifica Documento/parcela/cheque e oferece buscar/marcar o conjunto (`dmcancelamentoquitacao.pas:492-531`).

Essa semântica **não é a decisão nova**. Uma Duplicata de `SINGLE_CHECK` pode ser estornada isoladamente, reconstruindo o movimento. A UI nova não deve ampliar seleção: o preview deve explicar a reconstrução, itens remanescentes e novo total; o cabeçalho é excluído somente no último evento.

## 5. Permissões e autorização

Se o usuário conectado possui perfil `Pagamento`, o lote pede sua senha; caso contrário pede login de outro usuário e exige o mesmo perfil. Falha informa que o usuário não está autorizado a cancelar pagamento (`dmcancelamentoquitacao.pas:214-227,294-314`). Não há permissão exclusiva de estorno: quem quita também desquita.

O lote coleta identidades marcadas e chama `DesQuitarDuplicatas` por item (`dmcancelamentoquitacao.pas:230-261`). Esse método abre o Documento, bloqueia pagamentos tributários vinculados e delega à rotina `CancelarQuitacao` usada no Cadastro (`dmcontaspagar.pas:3871-3917`). Deve-se preservar a equivalência de permissão e a credencial própria/Autorizador, auditando ambos separadamente.

## 6. Confirmações, bloqueios e mensagens

O Cadastro unitário pergunta **“O pagamento da duplicata será cancelado. Confirma?”** (`dmcontaspagar.pas:1204-1214`). Quando há lote/cheque, oferece cancelar lote inteiro ou item; imposto retido pago vinculado bloqueia e identifica Duplicata e pagamento tributário (`dmcontaspagar.pas:1215-1275`).

A tela dedicada não tem confirmação final própria: F5 entra na autenticação/loop (`fmcancelamentoquitacao.pas:316-340`; `dmcancelamentoquitacao.pas:214-314`). Não há sucesso consolidado; a lista recarrega e contadores zeram. O loop admite falhas item a item.

A experiência simétrica à Quitação em Lote deve usar preview/revisão final antes da prova sensível, mostrando quantidade, total, itens, efeitos compartilhados e motivo; bloquear duplo envio; anunciar sucesso somente após operação atômica e reconciliação; retornar erros por item sem sucesso parcial.

## 7. Motivo obrigatório: lacuna nas fontes

Não há controle de motivo em `fmcancelamentoquitacao.pas/.dfm`, nem parâmetro de motivo em `TdtmCancelamentoQuitacao.CancelarQuitacao`. O Cadastro tem somente o memo genérico **Observações da Duplicata**, ligado a `observacao` (`fmcadastroduplicatascontaspagar.dfm:38-62`), e a rotina unitária não exige/grava justificativa (`dmcontaspagar.pas:1141-1282`). Portanto, o motivo específico obrigatório mencionado como comportamento atual **não está demonstrado nesta revisão das units**.

Isso é lacuna legada, não razão para omitir a decisão. No novo lote:

- motivo é obrigatório antes do preview final/confirm;
- vazio ou somente espaços é inválido;
- integra fingerprint, idempotência e Auditoria transacional;
- é comum à intenção, com before/after por Duplicata;
- não sobrescreve a observação histórica da Duplicata.

## 8. Estados recomendados

1. **Inicial/filtros**: datas padrão, filtros, F6.
2. **Carregando** e **vazio**: preservar filtros e explicar ausência de elegíveis.
3. **Resultados**: grid paginado, seleção, totais e inelegibilidade.
4. **Seleção pronta**: F5 somente com itens e motivo válido.
5. **Preview/revisão**: efeitos, reconstrução `SINGLE_CHECK`, Contabilidade/tributos e totais.
6. **Prova sensível**: senha própria ou Autorizador com perfil.
7. **Confirmando**: edição/reenvio bloqueados.
8. **Sucesso/replay**: resumo e recarga; Duplicatas em `AUTHORIZED`.
9. **Validação/conflito/preview expirado**: zero efeitos e nova prévia.
10. **Forbidden/dependência indisponível**: mensagem acionável sem vazamento entre Filiais.

Alterar filtros, seleção ou motivo invalida a prévia. Esc em diálogo cancela a jornada, nunca confirma implicitamente.

## 9. Conclusão normativa

Preservar: página filtros/pesquisa/seleção/confirmação; período, Filiais, Parte Fornecedora e Conta; identificação do pagamento original; seleção e totais; F6/F5; perfil de pagamento compartilhado; credencial própria/Autorizador; bloqueio tributário; retorno a `AUTHORIZED`.

Corrigir: nome **Estorno do Pagamento em Lote**; motivo auditável; preview antes de write; não expandir por cheque; atomicidade/manifesto/reconciliação; inelegibilidade e conflitos explícitos; preservar autorização anterior válida para nova Quitação.
