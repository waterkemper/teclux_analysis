# Auditoria Delphi — paridade ainda não coberta do Cadastro de Pedidos

## Escopo e método

Foram confrontados:

- fontes primárias atuais `C:/projetos.vcl/apps/estoque/dmcadastropedidos.pas/.dfm` e `fmcadastropedidos.pas/.dfm`;
- as nove imagens em `.scratch/cadastro-pedidos-wayfinder/imagens/`;
- os mapas `.scratch/cadastro-pedidos-wayfinder/map.md` e `.scratch/cadastro-pedidos-tela-wayfinder/map.md`;
- os 15 prompts `modules/estoque/cadastro-pedidos/01-speckit-prompt.md` a `15-speckit-prompt.md`.

A lista abaixo contém somente comportamento ou estado observável ainda sem contrato suficiente nos prompts. Não foram contados: bugs já classificados, código comentado/morto, detalhes internos já cobertos pelos motores, funcionalidades deliberadamente fora de escopo, diferenças apenas pixel a pixel ou implementação Laravel ausente (objeto de outro ticket).

## Lacunas confirmadas

### 1. Contrato funcional completo do cabeçalho da aba Informações

**Status: CONFIRMADO — alta abrangência.**

O prompt 06 especifica ciclo de vida, quatro validações, máquina de situação e previsões, mas não fecha a superfície funcional do cabeçalho mostrada em `tela_principal.png`. O DFM expõe, além das quatro identidades no topo, três Filiais com lookup, fornecedor/UF, data-base, entrega, referência, contato, transportadora, percentuais de frete CTR/NF, recebido, duas observações e o quadro de totais (`fmcadastropedidos.dfm:466-1953`). Os prompts 01/06 citam muitos desses nomes como schema, sem definir edição, obrigatoriedade, lookup, dependências ou recalculo na tela.

Comportamentos ainda sem requisito explícito:

- a Filial selecionada pela consulta preenche Entrega e Cobrança quando estão zeradas (`dmcadastropedidos.pas:2601-2610`);
- mudar Filial de Entrega troca a Filial-base da busca de produtos (`dmcadastropedidos.pas:1636-1637`);
- mudar Filial de Fatura atualiza regime tributário, reatribui os dados fiscais, recalcula impostos e previsões (`dmcadastropedidos.pas:1648-1654`);
- mudar fornecedor atualiza UF/CRT e a origem fiscal da busca de produto; se já há itens, pede confirmação para apagar todos ou desfaz a troca — o wipe foi coberto no prompt 07, mas as demais consequências do cabeçalho não (`dmcadastropedidos.pas:1589-1623,2612-2626`);
- alterar `fretectr`, `fretenota`, desconto geral, acréscimo, seguro ou despesas acessórias recalcula impostos e previsões, com tipos de alteração específicos para frete/desconto/despesas (`dmcadastropedidos.pas:1626-1631,1655-1673`);
- alterar data-base recalcula previsões (`dmcadastropedidos.pas:1633-1634`).

A fotografia `tela_principal.png` confirma a hierarquia da aba e o quadro simultâneo de totais: desconto geral, desconto dos itens, acréscimo, valor dos produtos, ICMS-ST, frete, seguro, despesas acessórias, IPI e valor final.

**Paridade que falta especificar:** campos editáveis/somente leitura por estado, lookups das três Filiais/fornecedor/transportadora, valores padrão, gatilhos de recálculo e apresentação consistente do quadro de totais.

### 2. Edição excepcional de Pedido Parcial e campo Recebido

**Status: CONFIRMADO — regra de estado não coberta.**

O prompt 06 define que Pedido Parcial não pode ser excluído fisicamente, mas não define quais campos continuam editáveis. O Delphi torna o conjunto inteiro read-only e reabre seletivamente, em situação Aberto ou Parcial, `entrega`, `observacoes_estoque`, Filial de Fatura, Filial de Entrega e Filial de Cobrança (`dmcadastropedidos.pas:2520-2549`). O fornecedor é explicitamente liberado logo depois (`dmcadastropedidos.pas:2551-2552`), embora a troca continue sujeita à confirmação/wipe dos itens.

Além disso, ao alterar a data de entrega de um Pedido marcado como Recebido, o sistema avisa e desmarca `recebido` automaticamente (`dmcadastropedidos.pas:1639-1645`). A imagem `tela_principal.png` mostra `RECEBIDO` ao lado da data de entrega, mas nenhum prompt fecha essa transição.

**Paridade que falta especificar:** matriz de editabilidade Aberto/Parcial/Concluído/Cancelado/Parcial Liquidado e a invalidação de `recebido` quando a entrega muda.

### 3. Semântica distinta das duas observações do Pedido

**Status: CONFIRMADO — conteúdo já visível, persistência parcialmente omitida.**

O próprio prompt 06 manda registrar pergunta caso falte a persistência de “observações”, e os prompts posteriores não a resolveram. A UI possui dois campos diferentes:

- `observacoes`: “OBSERVAÇÕES DA COMPRA”, memo tratado manualmente pela tela, que coloca o Pedido em edição ao mudar e só transfere o texto ao dataset na gravação (`fmcadastropedidos.dfm:1390-1414`; `fmcadastropedidos.pas:541-549,777-813`; `dmcadastropedidos.pas:3295-3303`);
- `observacoes_estoque`: “OBSERVAÇÕES DO ESTOQUE”, campo ligado diretamente ao dataset, excepcionalmente editável em Aberto/Parcial (`fmcadastropedidos.dfm:1422-1446`; `dmcadastropedidos.pas:2532-2534`).

Ambos aparecem simultaneamente em `tela_principal.png` e contêm textos diferentes. Não são aliases nem um único campo genérico.

**Paridade que falta especificar:** dois campos persistentes separados, limites/validação, edição por estado e inclusão apropriada em relatório/e-mail quando aplicável.

### 4. Modo inline “Custo e Preço de Venda” na grade de Produtos

**Status: CONFIRMADO — funcionalidade distinta do visualizador F11.**

O prompt 08 cobre a tela compartilhada de Formação de Preço de Venda, somente leitura, aberta pelo botão F11 e apenas após gravar o Pedido (`fmcadastropedidos.pas:1213-1224`). Porém existe uma segunda ação, botão `$`/atalho indicado como “Visualizar Custo, Preço de Venda (Ctrl V)”, visível em `tela_principal.png` e declarada no DFM (`fmcadastropedidos.dfm:4536-4546`).

Essa ação alterna um modo **inline na própria grade**, recalcula custo/preço quando habilitado e mostra/oculta colunas: custo para venda, preço atual, variação atual×venda, preço de venda, variação venda×digitado, preço digitado, permissão para atualizar, código fiscal, ICMS outras e ICMS isentas (`fmcadastropedidos.pas:1226-1249,1252-1321`). Diferenças percentuais não zero e preço digitado alterado ficam em vermelho (`fmcadastropedidos.pas:899-915`). O botão só existe quando `LocalCalculoPreco` permite cálculo no Pedido ou em ambos (`fmcadastropedidos.pas:407-410`).

O modo é encerrado ao trocar de Pedido (`fmcadastropedidos.pas:777-789`). Nada disso está nos prompts 08, 13 ou 15.

**Paridade que falta especificar:** distinguir F11 do modo inline `$`, suas colunas, disponibilidade por configuração, recálculo ao abrir, destaque de divergências e reset ao trocar Pedido.

### 5. Navegação sincronizada entre Notas Pendentes de Entrada e Produtos

**Status: CONFIRMADO — gap da aba já especificada.**

O prompt 12 especifica consulta e colunas da aba SEFAZ, mas não a interação cruzada. No Delphi:

- entrar na aba dispara a consulta sob demanda (`fmcadastropedidos.pas:1329-1334`);
- a consulta recebe Pedido, fornecedor e data-base (`dmcadastropedidos.pas:5592-5600`);
- ao navegar numa nota pendente com o grid em foco, a grade de Produtos posiciona o item correspondente (`dmcadastropedidos.pas:5602-5616`);
- ao navegar nos Produtos, a consulta pendente localiza o mesmo produto (`dmcadastropedidos.pas:3237-3260`);
- quando a aba está ativa, a linha correspondente do grid de Produtos ganha fundo zebrado e negrito (`fmcadastropedidos.pas:918-933`).

A imagem `notas_pendentes_entrada.png` mostra os dois grids simultaneamente, sustentando que a correlação visual é parte da operação e não mera consulta isolada.

**Paridade que falta especificar:** seleção bidirecional por produto, preservação/restauração da seleção quando não há correspondência e realce visual/acessível do par relacionado.

### 6. Atalhos e gestos de edição de Itens e Previsões

**Status: CONFIRMADO — paridade operacional/acessibilidade.**

Os prompts definem os ciclos de CRUD, mas não como operá-los pelo teclado/grid. No Delphi:

- duplo clique em Previsão edita; `Ctrl+Editar` edita e `Ctrl+Inserir` inclui, somente se a grade/ação estiver habilitada (`fmcadastropedidos.pas:452-467`);
- duplo clique em Produto vazio inclui, em Produto existente edita; `Ctrl+Editar` e `Ctrl+Inserir` fazem as mesmas ações (`fmcadastropedidos.pas:469-500`);
- `Alt+Up`/`Alt+Down` aparecem nos hints dos botões de reordenação e acionam a movimentação especificada no prompt 13 (`fmcadastropedidos.dfm:4270-4452`; `fmcadastropedidos.pas:1033-1044`).

As imagens `previsoes_de_pagamento.png` e `tela_principal.png` evidenciam os grids compactos com ações laterais, onde teclado/duplo clique são caminhos relevantes.

**Paridade que falta especificar:** ações equivalentes acessíveis no frontend, com foco preservado, estados disabled e sem depender exclusivamente de ícones.

### 7. Ficha compartilhada do fornecedor acionada na troca

**Status: CONFIRMADO quanto ao gatilho; conteúdo externo não auditado.**

Ao sair do campo depois de trocar fornecedor, o Pedido chama `ExibirFicha` e devolve o foco/seleção ao lookup (`fmcadastropedidos.pas:1118-1142`). O data module delega à ficha compartilhada de cliente/fornecedor com código, tipo `F`, nome e formulário de origem (`dmcadastropedidos.pas:4932-4938`). Nenhum dos 15 prompts menciona esse gatilho.

Como o conteúdo da ficha pertence a módulo compartilhado fora do escopo, esta auditoria não o especifica. A lacuna limitada é decidir se o Cadastro Laravel deve abrir/reaproveitar uma ficha/resumo já existente ao selecionar fornecedor ou se esse auxílio legado será conscientemente omitido.

## Itens examinados que não são lacunas

- **Cópia autônoma de produtos:** botão no núcleo chama `fmcopiarprodutospedidos`, mas os dois mapas a excluíram explicitamente; não reintroduzir (`fmcadastropedidos.pas:978-1031`).
- **Importação Daico:** conscientemente mantida fora dos prompts por relevância não confirmada; não é nova descoberta (`fmcadastropedidos.pas:1052-1059`).
- **Atendimento F10:** módulo CRM autônomo explicitamente fora do segundo mapa; não incluir.
- **Relatório/Excel e Envio:** cobertura deliberadamente funcional/superficial no prompt 08; esta auditoria não transforma ausência de paridade pixel a pixel em gap. O relatório usa título/observação de rodapé e preview (`dmcadastropedidos.pas:4348-4378`); a exportação continua decisão já fechada.
- **Bugs/código morto:** `CalcularAcrescimoDesconto`, código de situação Concluído e total de IPI da grade permanecem nas classificações anteriores; não foram reabertos.
- **Reordenação, cores de situação, marcar todos, abas informativas, F9, modal fiscal e Produtos Similares:** cobertos respectivamente pelos prompts 10–15; não duplicados aqui.
- **Campos fiscais/custo e fórmulas:** cobertos pelos prompts 01–05 e 15; a única lacuna é a apresentação inline descrita acima.

## Síntese para classificação posterior

As lacunas formam quatro blocos coesos:

1. **Cabeçalho e estado:** itens 1–3.
2. **Grade e análise de custo:** item 4.
3. **Correlação SEFAZ–Pedido:** item 5.
4. **Operação da UI:** itens 6–7, sendo o item 7 uma decisão de paridade, não implementação automaticamente obrigatória.

Nenhum achado exige reabrir os motores de custo/impostos, o contrato de itens/previsões ou os módulos já excluídos.

