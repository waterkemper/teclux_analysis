Type: task
Status: resolved
Blocked by:

## Question

Quais são, com ordem física, título, campo, largura, formato, visibilidade inicial, condição por perfil e participação em cada ciclo de visão, todas as colunas da grade de Movimentos Delphi; e qual é o contrato completo de F5, F6, Esc, Alt+F5, Alt+F7, Alt+F8, modificadores+clique, legenda dinâmica e demais operações de teclado/mouse?

## Answer

### Fontes

Inventário direto de fmconsultafichaproduto.dfm/.pas e dmconsultafichaproduto.dfm. Movimentos e Lotes repetem a mesma ordem de 43 colunas. Visible omitido abaixo significa largura padrão do componente; as colunas declaradas True são visíveis para gerente na abertura.

### Ordem física da grade de Movimentos

| # | Campo | Título | Largura | Inicial | Grupo/ciclo |
|---:|---|---|---:|---|---|
| 0 | data | DATA | 65 | visível | fixa |
| 1 | filial | FILIAL | 30 | visível | fixa |
| 2 | nrlote | Nº.LOTE | 124 | visível | fixa |
| 3 | tipomovimento | MOVTO | 40 | visível | fixa |
| 4 | referencia | REFERÊNCIA | 360 | visível | Alt+F7 Referência |
| 5 | clientefornecedor | CLIENTE/FORNECEDOR | padrão | oculta | Alt+F7 Parte |
| 6 | est | EST | padrão | oculta | Alt+F7 Operações |
| 7 | res | RES | padrão | oculta | Alt+F7 Operações |
| 8 | tra | TRÂ | padrão | oculta | Alt+F7 Operações |
| 9 | dem | DEM | padrão | oculta | Alt+F7 Operações |
| 10 | con | CON | padrão | oculta | Alt+F7 Operações |
| 11 | fut | FUT | padrão | oculta | Alt+F7 Operações |
| 12 | dan | DAN | padrão | oculta | Alt+F7 Operações |
| 13 | fis | FÍS | padrão | oculta | Alt+F7 Operações |
| 14 | prev | PRV | padrão | oculta | Alt+F7 Operações |
| 15 | uent | U. ENT | padrão | oculta | Alt+F7 Operações |
| 16 | ucom | U. COMP | padrão | oculta | Alt+F7 Operações |
| 17 | fin | FIN | padrão | oculta | Alt+F7 Operações |
| 18 | tven | TVEN | padrão | oculta | Alt+F7 Operações |
| 19 | tcom | TCOM | padrão | oculta | não entra no ciclo por erro de limite |
| 20 | quantidade | QTDE | 34 mínimo dinâmico | visível | fixa |
| 21 | emestoque | ESTOQUE | 54 mínimo dinâmico | visível | fixa |
| 22 | financeiro | FINANCEIRO | 70 | visível gerente | Alt+F5 Valores |
| 23 | customedio | CUSTO MÉDIO | padrão | visível gerente | afetada indevidamente por Alt+F8 |
| 24 | reservado | RESERVADO | 67 | visível | Alt+F8 |
| 25 | transito | TRÂNSITO | 58 | visível | Alt+F8 |
| 26 | demonstracao | DEMONSTRAÇÃO | 87 | visível | Alt+F8 |
| 27 | conserto | CONSERTO | 61 | visível | Alt+F8 |
| 28 | futuro | FUTURO | 56 | visível | Alt+F8 |
| 29 | danificada | DANIFICADA | 66 | visível | Alt+F8 |
| 30 | estoquefisico | EST.FÍSICO | padrão | visível | Alt+F8 |
| 31 | reservaprevia | RES.PRÉVIA | 67 | visível | fixa por erro de limite |
| 32 | precocomicms | COM ICMS | padrão | visível gerente | financeira |
| 33 | precosemicms | SEM ICMS | padrão | visível gerente | financeira |
| 34 | moedaLookup | MOEDA | 75 | visível gerente | financeira |
| 35 | valormoeda | VLR MOEDA | padrão | visível gerente | financeira |
| 36 | pedcotacao | COTAÇÃO | padrão | visível | pedidos |
| 37 | pedaberto | EM ABERTO | padrão | visível | pedidos |
| 38 | usuariologado | LOGADO | 45 | visível | auditoria |
| 39 | nomeusuariologado | NOME | 100 | visível | auditoria |
| 40 | usuarioautorizacao | AUTORIZADO | padrão | visível | auditoria |
| 41 | nomeusuarioautorizacao | NOME | 119 | visível | auditoria |
| 42 | processamento | PROCESSAMENTO | 94 | visível | auditoria |

Quantidades usam máscara do sistema; QTDE e ESTOQUE têm largura elevada ao mínimo da máscara. Valores, preços, financeiro e custo usam duas casas; IPI duas casas; valor em moeda seis; COTAÇÃO duas e EM ABERTO três. Data usa data local e PROCESSAMENTO inclui data/hora.

Para não gerente, o construtor remove ainda FINANCEIRO, CUSTO MÉDIO, COM ICMS, SEM ICMS, MOEDA e VLR MOEDA em ambas as abas. QTDE, ESTOQUE, dimensões, pedidos e auditoria permanecem.

### Alt+F7 — ciclo de contexto

Estado inicial: Referência. Cada acionamento atualiza Movimentos e Lotes:

1. Referência: coluna 4 visível; Parte e indicadores ocultos.
2. Operações: Referência e Parte ocultas; índices 6–18 visíveis: EST, RES, TRÂ, DEM, CON, FUT, DAN, FÍS, PRV, U.ENT, U.COMP, FIN e TVEN.
3. Cliente/Fornecedor: somente Parte visível entre esses grupos.

TCOM, índice 19, nunca aparece porque o laço termina em TVEN. A legenda mostra a próxima visão, não a atual. Alt+F7 simula Alt/Shift+clique no título físico de Referência. O ciclo só funciona com dataset ativo.

### Alt+F5 — ciclo de valores

Somente GerenteEstoque. Reutiliza fisicamente a coluna 22 nas duas abas:

1. FINANCEIRO, campo financeiro; próxima ação “Custo”.
2. CUSTO, campo valor; próxima ação “Alíquota IPI”.
3. ALÍQ. IPI, campo aliquotaipi; próxima ação “Financeiro”.

CUSTO significa valor unitário do movimento, não CUSTO MÉDIO, que continua em coluna própria. Alt+F5 simula Alt/Shift+clique no título físico da coluna 22. Não gerente não recebe a legenda e o teclado não executa o ciclo.

### Alt+F8 — ocultar quantidades

O código alterna literalmente os índices 23–30 nas duas abas:

- CUSTO MÉDIO;
- RESERVADO;
- TRÂNSITO;
- DEMONSTRAÇÃO;
- CONSERTO;
- FUTURO;
- DANIFICADA;
- EST.FÍSICO.

QTDE e ESTOQUE ficam visíveis, mas RES.PRÉVIA também fica visível. Portanto o comportamento real contradiz o rótulo amplo “Quantidades” e o levantamento anterior. Há ainda falha de segurança: para não gerente, CUSTO MÉDIO começa oculto, mas o segundo Alt+F8 pode torná-lo visível porque o laço não verifica perfil.

### Demais teclas e operações

- F6: chama Gerar; Enter/Return sem modificador na Data Final também gera. Após sucesso força Movimentos, desabilita Gravar e foca a grade.
- F5 sem Alt: é tratado primeiro pelo formulário ancestral e corresponde a Gravar quando disponível. A implementação local salva somente qryFichaProduto; Lotes não possui gravação comprovada.
- Esc: o ancestral cancela edição/fecha conforme seu estado; em seguida a Ficha fecha datasets, executa LimpaControles e foca Produto. LimpaControles reposiciona seletores, mas não limpa necessariamente seus textos.
- Botão Visualizar grade de Produtos por Contrato alterna grade e splitter; a fonte acompanha a aba Movimentos/Lotes.
- Trocar de aba muda a fonte contratual e, ao entrar em Lotes, inclui o saldo anterior de lote.
- Alt ou Shift + clique no título Referência executa Alt+F7; no título físico 22 executa Alt+F5. Clique sem modificador não executa ciclo.
- Alt/F7/F8 usam estado global de modificadores e índices físicos, portanto são frágeis a reordenação de colunas.
- Não há ação funcional em F7/F8 sem Alt; F11 aparece apenas como código comentado.

### Conclusões para a paridade

O contrato informacional é de 43 colunas, 28 inicialmente visíveis para gerente e 22 para não gerente. As três visões de contexto e as três visões de valor são capacidades reais; os limites físicos defeituosos não são requisitos. TCOM deve ser deliberadamente incluído ou excluído na futura decisão, e Alt+F8 precisa ser redesenhado como grupo sem expor CUSTO MÉDIO nem omitir RES.PRÉVIA por acidente.
