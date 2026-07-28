# Inventário Delphi do estorno de pagamento

## Escopo e fontes

Este inventário descreve o comportamento observável no código legado, sem convertê-lo automaticamente em requisito. As fontes primárias estão sob `C:\projetos.vcl\apps\contaspagar`: `dmcancelamentoquitacao.pas/.dfm`, `fmcancelamentoquitacao.pas/.dfm` e o núcleo alcançado em `dmcontaspagar.pas/.dfm`.

## Entrada, pesquisa e seleção

- A consulta oferece somente duplicatas com `DataPagto IS NOT NULL` e retorna documento, vencimento, número, data/valor pagos, conta, cheque e conta contábil, com seleção transitória `Quitar=false` ([dmcancelamentoquitacao.dfm:280](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.dfm#L280), [dmcancelamentoquitacao.dfm:333](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.dfm#L333), [dmcancelamentoquitacao.dfm:398](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.dfm#L398)).
- Há filtros por intervalo/data exata de pagamento, filial ou grupo, fornecedor, conta bancária, conta contábil e documentos administrativos; ordenação por fornecedor ou data ([dmcancelamentoquitacao.pas:571](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L571), [dmcancelamentoquitacao.pas:612](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L612), [dmcancelamentoquitacao.dfm:292](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.dfm#L292)).
- A UI habilita confirmação somente havendo marcada; F5 confirma e F6 consulta ([fmcancelamentoquitacao.pas:114](C:/projetos.vcl/apps/contaspagar/fmcancelamentoquitacao.pas#L114), [fmcancelamentoquitacao.pas:276](C:/projetos.vcl/apps/contaspagar/fmcancelamentoquitacao.pas#L276)). A seleção totaliza quantidade e `ValorPagto` ([dmcancelamentoquitacao.pas:426](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L426)).

## Cheques e efeitos compartilhados na seleção

- `qryMesmoCheque` considera compartilhado todo pagamento com a mesma `ContaPagto` e `ChequePagto` ([dmcancelamentoquitacao.dfm:477](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.dfm#L477)).
- Se todas as duplicatas do cheque estão no resultado, marcar uma oferece marcar todas. Se alguma está fora do resultado, há aviso e tentativa de marcar as localizáveis ([dmcancelamentoquitacao.pas:462](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L462), [dmcancelamentoquitacao.pas:492](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L492), [dmcancelamentoquitacao.pas:507](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L507)). Isso é regra da tela; o núcleo permite cancelar apenas uma e reconstruir os efeitos restantes.

## Autorização e parâmetros

- Exige a mesma capacidade `Pagamento`: se o usuário logado a possui, pede senha; senão, login autorizado para pagamento. Só continua se o usuário obtido possuir `Pagamento` ([dmcancelamentoquitacao.pas:220](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L220)).
- Cada item recebe a chave `DocumentoPag`, `Numero`, `DataVencto` e a lista completa selecionada ([dmcancelamentoquitacao.pas:230](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L230), [dmcontaspagar.pas:972](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L972)). A lista libera dependências tributárias apenas quando as duplicatas relacionadas pertencem ao conjunto ([dmcontaspagar.pas:3978](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L3978)).
- O chamador percorre itens e ignora o `Boolean` de `DesQuitarDuplicatas`; não agrega erros nem interrompe explicitamente o laço ([dmcancelamentoquitacao.pas:256](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L256)).

## Pré-condições

- Documento e duplicata identificados pela chave devem existir. São carregados documentos/duplicatas de impostos retidos originados pela duplicata ([dmcontaspagar.pas:3924](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L3924)).
- O estorno é bloqueado quando há pagamento de imposto retido vinculado que não pertence à seleção ([dmcontaspagar.pas:3871](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L3871), [dmcontaspagar.pas:3710](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L3710)).
- No cadastro há confirmação e escolha entre todo o lote/cheque ou só a duplicata. Via lote (`fViaLote_`), ambas são puladas e o cancelamento individual é chamado diretamente ([dmcontaspagar.pas:1204](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1204)).
- Tipo de pagamento `3` (adiantamento) não remove movimento bancário, que pertence ao adiantamento. Integração bancária só é manipulada desde `InicioIntegracaoBancos`, se o marco for posterior a 01/01/1980 ([dmcontaspagar.pas:2423](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2423)).

## Mutação da duplicata

- Guarda a antiga data e limpa `DataPagto`, `FilialPagto`, `ContaPagto`, `ChequePagto`, `TipoPagamento` e `ContaCredito` ([dmcontaspagar.pas:1146](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1146)).
- Preserva inicialmente `ValorPagto` para calcular reversões; ao final, limpa-o junto com `DataPagtoAux`, `ContaPagtoAux` e `ChequePagtoAux` ([dmcontaspagar.pas:1154](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1154), [dmcontaspagar.pas:2503](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2503)).
- `ValorDesconto` não é limpo (as linhas estão comentadas), portanto permanece ([dmcontaspagar.pas:1154](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1154), [dmcontaspagar.pas:2503](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2503)).
- Volta a `Autorizado=true`, mas substitui a data de autorização por `now`, divergindo da decisão atual de preservar a autorização anterior quando válida ([dmcontaspagar.pas:1175](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1175)).
- `Evento`, `Sequencia`, `SequenciaEvento` e `NrLoteContabil` são limpos durante a reconstrução ([dmcontaspagar.pas:1979](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1979), [dmcontaspagar.pas:2481](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2481)).

## Parcial, residual e desconto

- Não há rotina específica de fusão/exclusão de residual no caminho analisado. `ValorVencto` permanece, `ValorPagto` é subtraído dos efeitos e depois anulado, e `ValorDesconto` permanece. O código desfaz o pagamento daquela linha; eventual recomposição adicional por trigger não foi demonstrada.
- Quitações com `ValorPagto=0` e desconto de 100% entram na condição bancária especial quando `ValorVencto=ValorDesconto` ([dmcontaspagar.pas:2423](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2423)).

## Reconstrução bancária e cheque compartilhado

- Localiza movimento por `ContaPagtoAux`, `DataPagtoAux`, `Sequencia`, e evento também por `Evento` e `SequenciaEvento` ([dmcontaspagar.pas:2436](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2436)).
- Exclui o cabeçalho se não múltiplo e a subtração zerar, ou no cancelamento total. Senão, reconstrói `-(abs(valor atual) - ValorPagto)` e exclui se chegar a zero ([dmcontaspagar.pas:2453](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2453)).
- Exclui os eventos retornados. Se restar uma duplicata, o cabeçalho recupera observação e evento dela, deixando de representar diversas duplicatas ([dmcontaspagar.pas:2467](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2467), [dmcontaspagar.pas:2478](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2478)). Isso confirma estorno parcial do cheque/lote mediante reconstrução.

## Reconstrução contábil

- Com contabilidade habilitada e origem documento/entrada, abre o lote do pagamento usando a antiga data ([dmcontaspagar.pas:1772](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1772), [dmcontaspagar.pas:1868](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1868)).
- No total apaga todos os lançamentos; no individual apaga os da duplicata e acumula débitos/créditos removidos ([dmcontaspagar.pas:1874](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1874)).
- Reduz o crédito compartilhado pela diferença removida. Se resta um lançamento, exclui-o; quando deixa de ser múltiplo, o crédito restante recebe `NrOrigem` e complemento do único débito remanescente ([dmcontaspagar.pas:1902](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1902), [dmcontaspagar.pas:1924](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L1924)).

## Tributos

- Documentos e duplicatas de impostos retidos participam de validação e gravação ([dmcontaspagar.pas:3950](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L3950), [dmcontaspagar.pas:2200](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2200)).
- Para cancelamento total integrado, tabelas do lote também passam por validação/gravação; no individual prevalece o bloqueio de pagamentos tributários vinculados fora da seleção ([dmcontaspagar.pas:2214](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2214), [dmcontaspagar.pas:2283](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2283)).

## Transação e falhas

- Por duplicata, um `Perpetrar` reúne documento, lote, duplicata, impostos, contabilidade (se ativa), movimento e eventos bancários, indicando atomicidade por chamada ([dmcontaspagar.pas:2519](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2519), [dmcontaspagar.pas:2560](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2560)). Depois, `ValidarValoresDocumentosPag(..., true)` valida o movimento ([dmcontaspagar.pas:2599](C:/projetos.vcl/apps/contaspagar/dmcontaspagar.pas#L2599)).
- A tela em lote chama o ciclo separadamente, ignora retornos falsos e não abre transação externa ([dmcancelamentoquitacao.pas:256](C:/projetos.vcl/apps/contaspagar/dmcancelamentoquitacao.pas#L256)). Logo, não garante tudo-ou-nada: itens anteriores podem estar gravados quando um posterior falhar.

## Auditoria e motivo

- Não há campo, parâmetro ou persistência explícita de motivo no caminho inspecionado, nem atribuição explícita do usuário do estorno. Isso não prova ausência de auditoria sistêmica em `Perpetrar` ou triggers, que não estão nestas units.
- Motivo obrigatório, operador, estado anterior/posterior e vínculo ao manifesto devem ser acréscimos explícitos na nova especificação, não comportamento atribuído ao Delphi sem evidência.

## Implicações para a especificação

1. Usar a chave `DocumentoPag`, `DataVencto`, `Numero` e pré-carregar dependências.
2. Validar todo o manifesto antes de escrever, sobretudo impostos vinculados.
3. Executar o manifesto inteiro numa transação única.
4. Permitir remoção individual de efeito compartilhado, reconstruindo banco, evento e contabilidade.
5. Persistir motivo, operador, antes/depois e manifesto explicitamente.
6. Preservar deliberadamente a autorização anterior válida; o Delphi força nova data.
7. Confirmar o modelo de parcial/residual antes de exigir fusão de linhas, pois ela não aparece no caminho analisado.
