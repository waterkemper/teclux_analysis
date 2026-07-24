/speckit.specify

# Correção — Consulta de Compras: grade prática da Requisição entre Filiais (F11)

## Escopo

O backend da Requisição entre Filiais (`ConsultaComprasRequisicaoService`, `LegacyConsultaComprasRequisicaoCandidatasRepository`, `LegacyPedidosFiliaisRepository`, `LegacyConsultaComprasRequisicaoMovimentoWriteRepository`) já implementa corretamente as 4 fases especificadas em `03-speckit-prompt.md` (exclusão de compostos, candidatas por filial, revalidação de saldo, persistência transacional com soma de duplicata e débito `TEP`) — **não mexer nessa camada**. O problema é a **grade de revisão** (`RequisicaoEntreFiliaisModal.tsx`): hoje é uma tabela mínima de 5 colunas com um campo de texto solto por linha, sem nenhuma das colunas de apoio à decisão, ações rápidas, avisos visuais ou proteção contra excesso que o Delphi oferece (`fmconsultacompras.dfm:6837-7551`, painel `pnlBarraRequisicoes:7552-7675`, tela em `tela_requisicao_filiais.png`). O usuário não consegue hoje decidir **quanto pedir de cada filial** com segurança — é exatamente essa parte que não está prática.

Também foi confirmado que **"Gerar Pedido de Compra" (F10) já está correto** como está: monta o contrato (`buildGerarPedidoPayload`) e avisa claramente "Cadastro de Pedidos ainda não está disponível nesta tela" (`Index.tsx:1125`) — o modal de escolha de quantidade (`GerarPedidoQuantidadeModal.tsx`) já cancela limpo, sem gerar nada, se o usuário cancelar (conforme decidido em `03-speckit-prompt.md`, item 4). **Este prompt não trata do Gerar Pedido nem do Cadastro de Pedidos de Compra** — só da Requisição entre Filiais.

Quatro correções:

- **A. Pré-preenchimento perigoso da quantidade pedida** (risco de pedir demais)
- **B. Colunas de apoio à decisão ausentes**
- **C. Ações práticas ausentes** (Preencher, Reiniciar, busca por filial, busca geral)
- **D. Avisos visuais ausentes** (quantidade não atendida, saldo alterado) e observação por linha

## A. Pré-preenchimento perigoso da quantidade pedida

Hoje, `ConsultaComprasRequisicaoService::preview()` (`ConsultaComprasRequisicaoService.php:104-119`) preenche `quantidade_pedida` com a **sugestão completa do produto em cada linha candidata**, sem dividir entre filiais: se um produto tem 2 filiais candidatas com estoque, **as duas linhas** nascem com a mesma quantidade cheia sugerida. Se o usuário não perceber e confirmar direto, o backend não bloqueia — ele só valida saldo/duplicata, não soma-versus-necessidade — e a requisição sai **em dobro** (ou mais) do que o produto realmente precisa.

No Delphi (`dmconsultacompras.pas:2653-2783`, `GerarDadosRequisicoes`), `qtdepedida` de cada linha candidata **não nasce pré-preenchida com a quantidade cheia** (INFERIDO, não localizei o SQL de `qryPedidosFiliais`, mas é a única leitura consistente com: 1) o botão "Preencher" existir especificamente para atribuir a quantidade a uma filial escolhida — `sbnPreencherClick`, `fmconsultacompras.pas:2268-2286`; e 2) o aviso vermelho de "quantidade não atendida totalmente" comparar `quantidade > qtdeAtendida`, o que só faz sentido se o atendimento for uma soma que o usuário constrói filial a filial, não um valor que já nasce cheio em todas as candidatas). A distribuição entre filiais é decisão manual do usuário (linha a linha, ou via "Preencher" por filial), com o total já pedido acumulado na linha-resumo do produto (`vTotalAtendido`, `PreencherRequisicaoFilialSolicitada`, `dmconsultacompras.pas:4130-4193`).

Correção proposta:
- `quantidade_pedida` nasce **zerada** em cada linha candidata (não igual à sugestão).
- O payload passa a incluir, por produto, a **quantidade necessária** (`quantidade`, vinda da sugestão calculada na spec 02) separada da quantidade pedida por linha — para exibir "necessário: X / já alocado: Y" (ver seção D).
- Nenhuma trava impede o usuário de pedir mais que o necessário deliberadamente (o Delphi também não trava isso, só avisa); a mudança aqui é não **pré-preencher** um valor perigoso por padrão.

## B. Colunas de apoio à decisão ausentes

A grade Delphi (`dbgPedidosFiliais_`, `fmconsultacompras.dfm:6951-7499`) tem 18 colunas; a modal Laravel tem 5 (`Código, Descrição, Filial, Estoque, Qtd. pedida`). Faltam as colunas que dizem ao usuário **se dá pra tirar daquela filial sem prejudicá-la**:

| Campo Delphi | Coluna | Propósito |
|---|---|---|
| `total_estoque` | ESTOQUE TOTAL | estoque da filial candidata em todas as suas próprias sub-origens |
| `diasestoque` / `diasestoquecalculado` / `diasestoquecompedidosdecompra` / `diasestcalcpedcompra` | DIAS EM ESTOQUE (4 variantes) | cobertura em dias da filial candidata — se ela mesma está no limite, o usuário não deveria puxar dela |
| `reservado` | RESERVADO | quanto do estoque da candidata já está comprometido |
| `total_transito` | TRÂNSITO | quanto já está a caminho da candidata |
| `reservaprevia` | RES.PRÉVIA | reserva prévia da candidata |
| `futuro` | FUTURO | saída futura prevista da candidata |
| `total_vendido` | VENDIDO | velocidade de venda da candidata (mesmo campo da spec 02) |
| `mnemonico` | MNEM. | mnemônico da filial candidata (identificação rápida) |

Evidência Laravel: nenhum desses campos existe hoje em `ConsultaComprasRequisicaoLinha` (`types/consultaCompras.ts:374-381`) nem é lido por `LegacyConsultaComprasRequisicaoCandidatasRepository::listCandidatas()`.

Correção proposta: estender `listCandidatas()` e `ConsultaComprasRequisicaoLinha` com os 8 campos acima (reaproveitando os mesmos cálculos/fontes já usados na spec 02 — Motor de Sugestão — para `total_estoque`, os 4 campos de dias, `reservado`, `total_transito`, `reservaprevia`, `futuro`, `total_vendido` por filial); exibi-los na grade da modal.

## C. Ações práticas ausentes

Painel `pnlBarraRequisicoes` (`fmconsultacompras.dfm:7552-7675`) oferece, além da edição célula a célula:

| Ação Delphi | Efeito | Evidência |
|---|---|---|
| Campo de busca de filial + botão **Preencher** | Para a filial escolhida (busca por código/nome, `fraConsultaFilial`), preenche `qtdepedida` de todas as linhas candidatas dessa filial com a quantidade ainda necessária — **exceto** se a quantidade necessária exceder o estoque da própria candidata, caso em que avisa e deixa em branco (não deixa pedir mais do que a filial tem) | `sbnPreencherClick` (`fmconsultacompras.pas:2268-2286`), `PreencherRequisicaoFilialSolicitada` (`dmconsultacompras.pas:4120-4200`) |
| Botão **Reiniciar** | Zera `qtdepedida` das linhas candidatas da filial escolhida na busca — ou de **todas** as filiais, se nenhuma estiver escolhida (com confirmação) | `sbnReiniciarPedidosFiliaisClick` (`fmconsultacompras.pas:2299-2320`), `RetirarRequisicaoFilialSolicitada` (`dmconsultacompras.pas:4202-4261`) |
| **Ctrl+F** / botão "Ctrl+F para pesquisar" | Abre busca textual dentro da grade (útil com muitos produtos/filiais na mesma requisição) | `dbgPedidosFiliais_KeyDown` (`fmconsultacompras.pas:2109-2110`), `SpeedButton1` (`.dfm:7596-7603`) |
| Cursor entra direto em edição ao navegar (`Navigation.AlwaysEdit`/`CursorWalkEditor`) e grava ao sair da linha (`EditPostMode = epRow`) | Digitar a quantidade não exige duplo-clique nem F2; sair da linha já persiste local (antes da confirmação final) | `.dfm:6900-6901,7501` |

Nenhuma dessas ações existe hoje na modal Laravel: não há seletor de filial, não há "Preencher"/"Reiniciar", não há busca interna na grade.

Correção proposta:
- Adicionar um seletor de filial (reaproveitando o componente de busca de filial já usado nos parâmetros, spec 01) com dois botões: **Preencher** (chama a mesma regra: quantidade necessária restante, limitada ao estoque da candidata, com aviso se exceder) e **Reiniciar** (zera a filial escolhida, ou todas se nenhuma escolhida, com confirmação).
- Adicionar um campo de busca/filtro simples na grade da modal (filtra linhas visíveis por texto — código, descrição ou filial).
- Manter a edição direta em campo de texto (já existe), mas persistir a alteração só localmente na modal até "Confirmar" — como já é hoje; não é preciso replicar o `EditPostMode` linha-a-linha do Delphi, que é uma característica de grid desktop sem correspondente direto no design system web.

## D. Avisos visuais ausentes e observação por linha

Legenda (`fmconsultacompras.dfm:7566-7595`) e lógica de cor (`DrawGrid`, `fmconsultacompras.pas:1851-1938`):

| Condição | Efeito visual | Cor |
|---|---|---|
| `quantidade` (necessária) `>` soma já pedida entre as candidatas do produto | Texto vermelho no código/descrição/quantidade da linha-resumo do produto | `clRed` |
| `emestoque` da candidata mudou desde que a grade foi montada (`emestoque <> emestoqueanterior`) | Texto azul no campo de estoque da candidata | RGB(0,128,255) — `Brush.Color = 16744448` na legenda |
| Linha-resumo do próprio produto (linha "total") | Fundo cinza-claro + negrito, mesclada | `$00DADADA` |
| Linha de filial candidata (não a requisitante) | Fundo verde-claro nas colunas de estoque/qtde pedida | `$00D9FFD9` |

Também existe um campo `observacao` editável por linha candidata (até 150 caracteres, `.dfm:7471-7499`) — não existe hoje no payload Laravel (`ConsultaComprasRequisicaoLinha` não tem `observacao`, e `LegacyPedidosFiliaisRepository::insert()`/`somarQuantidade()` não foram inspecionados neste prompt para confirmar se já persistem observação; **DÚVIDA a resolver na implementação**: se a tabela `pedidosfiliais` já tem coluna de observação e o repositório atual simplesmente não a está gravando, é bug a corrigir; se a coluna não existe, é uma extensão de escopo a decidir com o usuário antes de implementar).

Correção proposta:
- Somar, por produto, a quantidade pedida entre suas linhas candidatas; se for menor que a quantidade necessária, destacar visualmente (cor de aviso do design system — não precisa ser vermelho literal) o card/linha-resumo daquele produto.
- Comparar o estoque da candidata no momento da confirmação com o estoque exibido no preview (o backend já faz isso em `confirmar()` via `diferenca_saldo` — reaproveitar o mesmo sinal para destacar a linha **antes** de confirmar, não só depois de rejeitar); ou, no mínimo, deixar claro visualmente quando o modal reabre com `pendingCode === 'diferenca_saldo'` **quais linhas específicas** mudaram (hoje o aviso é só texto genérico no topo, sem apontar a linha — `RequisicaoEntreFiliaisModal.tsx:71-75`).
- Adicionar campo de observação por linha candidata (texto curto), condicionado à resolução da dúvida acima sobre persistência em `pedidosfiliais`.

## Critérios de aceite

- [ ] `quantidade_pedida` não nasce pré-preenchida com a sugestão cheia em cada linha candidata; nasce zerada.
- [ ] O preview expõe, por produto, a quantidade necessária separada da quantidade já alocada por filial.
- [ ] A grade exibe as 8 colunas de apoio à decisão (estoque total, 4 variantes de dias em estoque, reservado, trânsito, reserva prévia, futuro, vendido, mnemônico) por linha candidata.
- [ ] Existe seletor de filial + botão "Preencher" que aloca a quantidade necessária restante na filial escolhida, respeitando o estoque disponível dela (avisando se exceder).
- [ ] Existe botão "Reiniciar" que zera a quantidade pedida da filial escolhida, ou de todas se nenhuma escolhida (com confirmação).
- [ ] Existe busca/filtro textual dentro da grade da modal.
- [ ] Produtos com quantidade pedida total menor que a necessária são destacados visualmente.
- [ ] Quando o estoque de uma candidata mudou desde o preview, a(s) linha(s) específica(s) afetada(s) ficam destacadas, não só um aviso genérico no topo.
- [ ] Backend de confirmação (4 fases) permanece inalterado.
- [ ] "Gerar Pedido de Compra" e o modal de escolha de quantidade permanecem como estão (fora de escopo).

## Matriz mínima de testes

| # | Cenário | Resultado esperado |
|---|---|---|
| 1 | Abrir requisição para um produto com 2 filiais candidatas | Ambas as linhas nascem com quantidade pedida zerada, não com a sugestão cheia duplicada |
| 2 | Escolher uma filial no seletor e clicar "Preencher" | Linha(s) candidata(s) daquela filial recebem a quantidade necessária restante do produto |
| 3 | "Preencher" quando a quantidade necessária excede o estoque da filial escolhida | Aviso explícito; quantidade não é preenchida acima do disponível |
| 4 | Clicar "Reiniciar" com uma filial escolhida | Só as linhas daquela filial voltam a zero |
| 5 | Clicar "Reiniciar" sem filial escolhida | Todas as linhas voltam a zero, após confirmação |
| 6 | Produto com quantidade pedida total menor que a necessária | Destaque visual de "não atendido totalmente" nesse produto |
| 7 | Estoque de uma candidata muda entre preview e confirmação | Reabrir a modal aponta visualmente a linha específica afetada, não só um aviso genérico |
| 8 | Confirmar requisição válida | Grava em `pedidosfiliais` (e `movimentos` tipo TEP se o parâmetro estiver ativo) exatamente como hoje — sem mudança de comportamento no backend |
| 9 | Gerar Pedido de Compra após a requisição | Comportamento inalterado (contrato montado, aviso de cadastro pendente) |

## Fora de escopo

- Qualquer alteração no `ConsultaComprasRequisicaoService`, repositórios de escrita ou nas 4 fases de persistência — já corretas, cobertas pelo ticket `11-definir-requisicao-entre-filiais.md` e por `03-speckit-prompt.md`.
- Cadastro de Pedidos de Compra e o fluxo "Gerar Pedido de Compra" (F10) — já corretamente implementado como contrato + aviso de cadastro pendente; não mexer.
- Réplica literal do `EditPostMode`/navegação de grid desktop do Delphi (cursor entra em edição ao navegar) — não tem equivalente direto no design system web; manter a edição por campo já usada na modal.
- Persistência de observação por linha, caso se confirme que a coluna correspondente não existe em `pedidosfiliais` — nesse caso, tratar como decisão de escopo à parte, não implementar sem confirmar o schema.
