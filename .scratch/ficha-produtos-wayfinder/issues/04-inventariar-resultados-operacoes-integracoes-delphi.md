Type: task
Status: resolved
Blocked by: 01, 02, 03

## Question

Com base nos inventários de interface, dados e segurança, qual é o contrato funcional consolidado dos resultados e operações Delphi: colunas e significados, formatação e legendas, totais/saldos, alterações persistidas, visualização de produtos por contrato, tratamento de erros e integrações com produtos, filiais, tipos de movimento, lotes, contratos, moedas, usuários e autorização?

## Answer

### Natureza do resultado

A Ficha é uma linha do tempo de movimentos de um único produto. Ela oferece duas perspectivas:

- **Movimentos:** snapshots acumulados no nível produto/filial;
- **Lotes:** snapshots acumulados no nível produto/lote/filial.

Não é:

- o Cadastro de Produtos;
- a posição atual consolidada da Consulta de Estoques;
- um relatório de totais do período;
- uma soma dos deltas de movimento.

Cada linha combina o evento (`quantidade`, tipo, referência e operação) com o estado acumulado registrado naquele momento. A primeira linha sintética **SALDO ANTERIOR** representa o snapshot imediatamente anterior ao período.

### Contrato das colunas de Movimentos e Lotes

| Grupo | Campo/coluna | Significado |
|---|---|---|
| Identidade | `numero` | identificador do movimento |
| Identidade | `lancto` | sequência/lançamento usada na ordenação |
| Tempo | DATA | data do movimento; a grade não exibe hora |
| Tempo | PROCESSAMENTO | data/hora técnica de processamento |
| Escopo | FILIAL | filial que recebeu o efeito |
| Evento | Nº.LOTE | lote relacionado; pode ser vazio em Movimentos |
| Evento | MOVTO | código do tipo de movimento |
| Evento | REFERÊNCIA | descrição/origem textual do evento; na linha sintética, SALDO ANTERIOR |
| Evento | QTDE | quantidade do evento, não o saldo |
| Parte | CLIENTE/FORNECEDOR | pessoa resolvida pelo movimento ou pela nota vinculada |
| Operação | EST..TCOM | caracteres da operação de 14 posições |
| Snapshot | ESTOQUE | `emestoque` acumulado |
| Snapshot | RESERVADO | quantidade reservada acumulada |
| Snapshot | TRÂNSITO | quantidade em trânsito acumulada |
| Snapshot | DEMONSTRAÇÃO | quantidade em demonstração acumulada |
| Snapshot | CONSERTO | quantidade em conserto acumulada |
| Snapshot | FUTURO | quantidade futura acumulada |
| Snapshot | DANIFICADA | quantidade danificada acumulada |
| Snapshot | EST.FÍSICO | estoque físico acumulado |
| Snapshot | RES.PRÉVIA | reserva prévia acumulada |
| Financeiro | FINANCEIRO | saldo financeiro acumulado |
| Financeiro | CUSTO | `valor` do movimento; ocupa a coluna alternável |
| Financeiro | ALÍQ. IPI | alíquota do movimento; ocupa a mesma coluna alternável |
| Financeiro | CUSTO MÉDIO | financeiro dividido por sete dimensões elegíveis |
| Fiscal | COM ICMS / SEM ICMS | preços registrados no movimento |
| Moeda | MOEDA / VLR MOEDA | moeda e valor original |
| Pedidos | `pedcotacao` / `pedaberto` | valores/vínculos persistidos no movimento; o Delphi não dá títulos amigáveis |
| Auditoria | LOGADO / NOME | executor e nome atual do cadastro de usuário |
| Auditoria | AUTORIZADO / NOME | autorizador contextual, anulável |
| Contrato | `contrato` | contrato associado ao movimento |

Na aba Lotes, os mesmos conceitos vêm de `movimentoslotes` e incluem `movimento` como vínculo ao movimento mestre e `loteproduto` como ID interno.

### Operação de 14 posições

| Pos. | Legenda | Efeito |
|---:|---|---|
| 1 | EST | Em estoque |
| 2 | RES | Reservado |
| 3 | TRÂ | Trânsito |
| 4 | DEM | Demonstração |
| 5 | CON | Conserto |
| 6 | FUT | Futuro |
| 7 | DAN | Danificado |
| 8 | FÍS | Estoque físico |
| 9 | PRV | Reserva prévia |
| 10 | U.ENT | Última entrada |
| 11 | U.COMP | Última compra |
| 12 | FIN | Financeiro |
| 13 | TVEN | Totalização de venda |
| 14 | TCOM | Totalização de compra |

A grade mostra o caractere histórico, não uma descrição. `+` indica adição, `-` redução, `*` ausência/ignorar em fluxos observados; `C` e `=` têm usos financeiros especiais fora da Ficha. Na nova UI, mostrar símbolos com legenda/tooltip, sem inventar significados não confirmados.

### Formatação

- DATA: data local, sem hora.
- PROCESSAMENTO: `dd/mm/yyyy hh:MM:ss` no componente legado.
- Quantidades principais usam `ParSistema.MascaraQuantidadeGrade`.
- Dimensões do movimento substituem zeros obrigatórios da máscara por posições opcionais, reduzindo zeros visuais.
- A largura mínima de QTDE e ESTOQUE usa `ParSistema.TamanhoMascaraQuantidade`.
- Valores, financeiro, custo e preços: duas casas decimais.
- IPI: duas casas.
- Valor em moeda: seis casas.
- Pedido de cotação: duas casas; pedido aberto: três.
- Filial: formato visual `00#`.
- As grades de lote/contrato têm menos `DisplayFormat` persistidos que a grade mestre; é inconsistência de apresentação, não regra de domínio.

**Decisão futura:** centralizar formatação pt-BR e usar a precisão do domínio/API, sem transportar diferenças acidentais entre datasets.

### Saldo e totais

- A tela não possui footer, total geral, total do período nem contagem.
- **SALDO ANTERIOR** é uma linha sintética no início, copiada do último snapshot anterior.
- Se não existe anterior, a linha contém a referência, mas valores vazios/zero.
- Movimentos posteriores já mostram os saldos acumulados após cada evento.
- O saldo de produto funciona por produto + filtros de filial/tipo/lote.
- O saldo por lote tem SQL contraditório e normalmente vira linha vazia; deve ser corrigido.
- O filtro de lançamentos autorizados não altera o saldo anterior do produto.

O contrato Laravel deve retornar a linha de abertura de maneira explícita, preferencialmente como `openingBalance` ou uma linha marcada `isOpeningBalance=true`, em vez de falsificar um movimento persistido.

### Custo médio

`customedio = 0` quando o denominador é zero; senão:

`round(financeiro / (emestoque + reservado + reservaprevia + transito + demonstracao + conserto + danificada), 2)`.

Futuro e estoque físico não entram. O valor é derivado por linha/snapshot, não um total da consulta.

### Modos de apresentação

- Visão inicial: REFERÊNCIA.
- Alt+F7 alterna Referência → Operações → Cliente/Fornecedor.
- Alt+F5, gerente: Financeiro → Custo → Alíquota IPI.
- Alt+F8: mostra/oculta as oito dimensões de RESERVADO a RES.PRÉVIA.
- A legenda inferior informa o próximo modo disponível.
- As alternâncias são sincronizadas entre Movimentos e Lotes.
- Não há persistência da preferência após fechar; a abertura e nova geração voltam à primeira aba.

Na migração, esses modos devem virar seletor explícito de visão e configuração de colunas. Não é necessário imitar índices físicos ou texto “Alt F...”.

### Produtos por contrato

É uma grade de detalhe, opcional e inicialmente oculta. Ao abrir:

1. coleta os contratos presentes no resultado mestre;
2. consulta movimentos históricos desses contratos;
3. ao navegar, filtra em memória por filial + contrato da linha atual;
4. alterna a fonte entre produto e lote conforme a aba.

Colunas:

| Coluna | Significado |
|---|---|
| DATA/FILIAL/MOVTO/REFERÊNCIA/QTDE | evento que afeta o contrato |
| CONTRATO | número do contrato |
| SIT. | código documental de um caractere de `contratos.situacao` |
| DATA CONTRATO | criação/data do contrato |
| RESERVADO EM | data da reserva |
| FATURADO EM | data do faturamento |
| PRODUTO NO CONTRATO | código visual do item contratado; pode ser composto |
| QTDE CONTRATO | quantidade original contratada |
| DEVOLVIDOS | soma de `contratosdevolvidos` tipo `D` |
| TROCADOS | soma de `contratosdevolvidos` tipo `T` |

Situação é estado documental — Orçado, Reservado, Faturado, Nota Parcial, Nota Fiscal ou Cancelado — e não classificação financeira como aberto/atrasado/quitado. O Delphi mostra o código cru.

O join aceita contrato cujo item seja o próprio produto ou um produto composto que contenha o produto consultado.

Ponto em aberto já delimitado para a matriz: o detalhe ignora período, tipo, lote e “somente autorizados”, exibindo histórico completo dos contratos encontrados. A UI deve dizer **Histórico completo do contrato** se isso for preservado; caso contrário aplicar o mesmo recorte.

### Operações disponíveis

| Operação | Pré-condição | Resultado |
|---|---|---|
| Gerar | produto, datas válidas e lookups existentes | substitui o resultado e volta a Movimentos |
| Trocar aba | consulta aberta | alterna perspectiva; Lotes injeta saldo anterior |
| Alternar visão | dataset ativo | muda grupos de colunas |
| Mostrar contratos | opcional | abre/fecha detalhe contextual |
| Esc/limpar | sem edição pendente ou após cancelamento | fecha dataset e refoca produto; filtros não são realmente limpos |
| Abrir por produto | chamada externa | preenche produto e foca filial |
| Corrigir financeiro | gerente, linha `fin='+'` | altera whitelist de campos no movimento |
| Gravar | dataset editado | aplica cached update sem reprocessar triggers |

Não existem na tela:

- inclusão/exclusão real de movimento;
- exportação;
- impressão;
- paginação;
- ordenação escolhida pelo usuário;
- busca textual dentro do resultado;
- refresh automático;
- progresso/cancelamento da consulta.

### Alterações persistidas

Embora seja chamada “Consulta”, o legado permite ao gerente alterar no movimento principal:

- `precocomicms`;
- `precosemicms`;
- `moeda`;
- `valormoeda`;
- `pedcotacao`;
- `pedaberto`.

Somente quando `fin='+'`. O save exclui temporariamente a linha sintética, seta `naoprocessartriggers=true` e aplica o update.

Para o escopo confirmado **só pela consulta**:

- não criar endpoint de update;
- não renderizar controles editáveis;
- não enviar `naoprocessartriggers`;
- registrar a correção financeira como paridade adiada, não requisito da primeira entrega.

### Tratamento de validação, vazio e erro

Validações locais:

- produto precisa existir;
- datas precisam ser válidas;
- inicial não pode superar final;
- filial/tipo, se informados, precisam existir;
- produto/lote divergentes pedem confirmação.

Comportamento vazio:

- o dataset principal aberto e vazio recebe uma linha artificial;
- após gerar sem movimentos, a tela tende a mostrar apenas SALDO ANTERIOR vazio;
- não existe mensagem “nenhum movimento encontrado”.

Falhas:

- `RefazConsulta` fecha, parametriza e abre; não captura erro de banco;
- erros propagam ao handler global da aplicação;
- autoabertura de datasets por `TdtmBasico.Abre` captura exceção e mostra apenas a mensagem;
- o callback de progresso existe, mas está desativado;
- não há retry, timeout funcional visível, cancelamento ou recuperação parcial;
- falha ao salvar usa o tratamento genérico `ErroPadraoDeSalvar`/transação.

Requisitos recomendados:

- validação server-side com mensagens por campo;
- empty state real;
- erro de consulta preservando filtros e permitindo tentar novamente;
- timeout/paginação;
- não misturar linha vazia com saldo zero;
- falhas do detalhe de contrato/lote não devem corromper o resultado mestre.

### Fronteiras de integração

#### Produtos

- Entrada: código visual via `TfraConsultaProduto`.
- Identidade usada na query: ID interno do produto.
- Dados adicionais: gerencia lote/validade e composição.
- Deep-link: Consulta de Compras abre a Ficha com produto de compras, similar ou grade.
- Contrato esperado: lookup existente deve devolver ID, código visual, descrição e indicador de lote/validade.

#### Lotes

- Lookup restrito ao produto.
- Entrega ID interno, número, fabricação, validade e produto proprietário.
- Pode selecionar lote primeiro e resolver o produto.
- A aba detalha `movimentoslotes`.

#### Filiais

- Lookup fornece código/nome.
- Delphi: gerente vê todas; não gerente usa filial-base.
- Laravel: integração deve usar filiais autorizadas e validar no servidor.

#### Tipos de movimento

- Lookup fornece código de três caracteres e descrição.
- O código filtra exatamente `movimentos.tipomovimento`.
- A operação de 14 posições vem gravada no movimento; não precisa ser reconstruída pelo lookup.

#### Contratos

- Leitura de `contratos`, `produtoscontratos`, `produtoscompostos` e `contratosdevolvidos`.
- A Ficha só consulta; não muda situação, reserva, faturamento, devolução ou troca.
- Integração termina no detalhe histórico.

#### Moedas

- Lookup traz código/descrição e uma opção vazia.
- No escopo somente leitura, basta resolver a descrição da moeda histórica.

#### Pessoas e notas

- Sem nota: cliente/fornecedor vem de `m.cliente/tipocliente` em `vfornecedores`.
- Com nota: vem do fornecedor da `notaspag`.
- A Ficha não navega para o cadastro da pessoa ou nota.

#### Usuários e autorização

- `usuariologado` é executor.
- `usuarioautorizacao` é gerente que autorizou, quando houve desafio.
- Nomes são resolvidos do cadastro atual.
- O filtro “avulsos” equivale a autorizador não nulo.

#### Banco/transação

- Leituras vêm diretamente do schema legado PostgreSQL.
- Movimentos contêm snapshots materializados por processamento externo à Ficha.
- A consulta não deve assumir que pode recalculá-los sem conhecer triggers/regras de escrita.

### Invariantes verificáveis

1. Toda consulta pertence a exatamente um produto.
2. Filial solicitada deve estar no escopo autorizado.
3. Período é inclusivo até 23:59:59 do dia final no legado.
4. QTDE é delta; dimensões são snapshots.
5. SALDO ANTERIOR não é movimento persistido.
6. Custo médio segue a fórmula de sete dimensões.
7. Autorizador pode ser nulo e difere do executor.
8. Lote selecionado deve pertencer ao produto confirmado.
9. Produto composto pode relacionar o componente ao item de contrato.
10. A fase inicial não persiste alterações.

### Classificação consolidada

**Paridade obrigatória**

- filtros e lookups;
- linha do tempo Movimentos/Lotes;
- saldo anterior correto;
- snapshots, operação, financeiro condicionado à permissão e auditoria;
- custo médio;
- detalhe contratual;
- deep-link por produto.

**Adaptação recomendada**

- consulta somente leitura;
- opening balance tipado;
- filiais autorizadas;
- modos de coluna explícitos;
- paginação/ordenação determinística;
- empty/error states;
- descrições para códigos e símbolos.

**Legado a não reproduzir**

- saldo por lote impossível;
- mutação ao navegar;
- concatenação SQL;
- índices rígidos;
- resultado obsoleto após alguns filtros;
- linha artificial para dataset vazio;
- “avulsos” com rótulo incorreto;
- contrato com recorte silenciosamente divergente;
- permissão única `GerenteEstoque`.

### Síntese

O contrato funcional está fechado como consulta histórica somente leitura, com duas perspectivas e detalhe contratual. A unidade fundamental é o movimento com delta e snapshots acumulados; saldo anterior é uma projeção separada. Integrações devem reutilizar cadastros existentes apenas por suas fronteiras de lookup/leitura, sem trazer a migração interna de produtos, lotes, contratos, pessoas ou usuários para este escopo.
