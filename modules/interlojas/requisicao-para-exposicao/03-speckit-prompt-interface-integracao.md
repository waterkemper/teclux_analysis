# Prompt para /speckit.specify — interface e integração

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para implementar a interface Laravel/Inertia React do Cadastro **Interlojas → Requisição para Exposição** e integrá-la ao backend especificado em `02-speckit-prompt-backend-cadastro.md` e ao núcleo de `01-speckit-prompt-nucleo-compartilhado.md`.

Não implemente nesta etapa. Inspecione os componentes Laravel existentes e cite evidências concretas. Não abra fontes Delphi: este prompt contém o contrato visual e de interação autoritativo. A página deve seguir o design system do Laravel, preservando a jornada e os atalhos do Cadastro Delphi sem copiar literalmente widgets desktop.

## Estado Laravel a investigar e reutilizar

- `ErpCadastroShell`;
- `ErpCadastroCommandBar`;
- `useRegistryCadastroShortcuts` e hooks de estado/foco de cadastro;
- `ErpRegistryOperationFeedback`;
- `CatalogCodeLookup`;
- `ErpCadastroLookupModal` e `ErpTwoColumnCatalogLookupModal`;
- padrões de confirmação, dirty state, erro de campo, Inertia e menu;
- `RequisicaoEntreFiliaisModal` da Consulta apenas para linguagem visual/feedback, nunca para reutilizar seu estado, DTO, cobertura, candidatas ou fluxo em lote.

Criar página própria em `resources/js/Pages/Interlojas/RequisicaoParaExposicao/`.

## Jornada e modos

Página única de cadastro unitário com modos:

1. **Novo** — número exibido como “Novo”; campos editáveis conforme dependências;
2. **Editando aberta** — situação `A`, campos de negócio editáveis;
3. **Somente leitura** — situação `F`, `D`, `C` ou desconhecida.

Ações visíveis e clicáveis:

- Nova — F3;
- Gravar — F5;
- Cancelar requisição — F6;
- Procurar — F9;
- Descartar/Voltar — Esc.

Atalhos não podem ser a única forma de operar. Antes de descartar, navegar, abrir outra ficha ou iniciar Nova com alterações locais, pedir confirmação.

Após criar, carregar a identidade persistida. Após cancelar, manter a ficha na tela, situação cancelada e somente leitura.

## Layout e campos

Usar `ErpCadastroShell` e padrões responsivos existentes.

### Cabeçalho somente leitura

- Número;
- Data/hora;
- Situação;
- Requisição de origem.

### Dados editáveis enquanto aberta

- Filial Requisitante;
- Filial Requisitada;
- Produto;
- Quantidade pedida;
- Observação.

### Contexto informativo

- descrição e unidade do produto;
- estoque da requisitante;
- estoque da requisitada.

### Resultado posterior somente leitura

- quantidade recebida;
- série;
- número da nota fiscal.

Quantidade aceita apenas inteiro maior que zero. Zero mostra erro e não significa cancelamento. Observação tem contador de 150 caracteres, sem truncamento silencioso.

## Lookups e dependências

- Requisitante mostra somente filiais autorizadas retornadas pelo servidor.
- Requisitada exclui a requisitante.
- Produto fica desabilitado até haver requisitada.
- Alterar requisitante limpa requisitada, produto e quantidade.
- Alterar requisitada limpa produto e quantidade.
- Alterar produto limpa quantidade e atualiza descrição/unidade/estoques.
- Produto resolve por código visual ou código de barras e possui modal específico com descrição, Linha, Coluna, referência, código, filial, estoque e unidade.
- `USAR GRADES PRODUTOS` retornado pelo servidor controla a visibilidade de Linha/Coluna; a interface nunca decide o valor do parâmetro.

Não reutilizar o modal de distribuição em lote da Consulta como formulário do Cadastro.

## Pesquisa F9

F9 abre lookup próprio de requisições abertas da requisitante escolhida. Se não houver requisitante, orientar o usuário a selecioná-la.

Mostrar:

- produto e descrição;
- Linha/Coluna conforme parâmetro;
- número;
- requisitante;
- requisitada;
- data;
- referência.

Selecionar uma linha carrega a ficha. Carga direta por código pode mostrar qualquer situação; não abertas entram em somente leitura.

## Gravação, duplicidade e conflito

O payload envia somente campos editáveis, identidade quando existente e Revisão da Requisição. Não enviar como autoridade:

- parâmetros do sistema;
- autorização;
- novo número;
- situação desejada;
- decisão de movimento;
- campos recebidos/NF.

Em duplicidade proibida, mostrar modal com mensagem equivalente a “produto já requisitado; alterar quantidade?”, oferecendo:

1. abrir a requisição existente;
2. permanecer no rascunho.

Nunca somar automaticamente no Cadastro.

Em conflito de revisão, informar que a requisição mudou no Delphi ou em outra sessão e oferecer recarregar. Não sobrescrever nem descartar silenciosamente o rascunho.

Erros de validação aparecem junto aos campos e no feedback operacional quando apropriado.

## Cancelamento

F6/botão só fica habilitado para ficha persistida e aberta.

Fluxo:

1. modal de confirmação;
2. se o backend indicar que `Informar o motivo do cancelamento do pedido` está ativo, exigir motivo;
3. se inativo, permitir sem motivo, mas aceitar motivo opcional;
4. enviar revisão e intenção explícita;
5. em sucesso, manter ficha cancelada e somente leitura.

Não pedir senha/supervisor. `qtderecebida > 0` não bloqueia cancelamento se a situação estiver aberta.

## Feedback de Reserva Prévia

Quando redução, troca ou cancelamento liberar menos Reserva Prévia que o esperado, a operação já foi confirmada. Exibir alerta persistente, claramente diferente de erro, com:

- quantidade esperada;
- quantidade movimentada;
- diferença;
- orientação para conferir o estoque.

O alerta permanece até reconhecimento explícito ou navegação para outra ficha; não desaparecer automaticamente como toast breve. A prioridade de Venda Futura é tratada pelo backend e não precisa ser recalculada na tela.

## Menu e autorização visual

Registrar exatamente **Interlojas → Requisição para Exposição**. Exibir o item somente quando o servidor autorizar o módulo. O ocultamento visual não substitui a proteção backend.

## Critérios de aceite

- [ ] Os três modos apresentam campos e ações corretos.
- [ ] F3/F5/F6/F9/Esc e botões equivalentes funcionam sem conflito com campos/modais.
- [ ] Dirty state protege contra perda de dados.
- [ ] Dependências limpam campos descendentes e produto só habilita após requisitada.
- [ ] Quantidade inválida e observação acima do limite não são enviadas.
- [ ] Lookups direto/modal aplicam o mesmo contrato e grades apenas alteram visibilidade.
- [ ] F9 pesquisa abertas da requisitante e carrega a seleção.
- [ ] Duplicidade oferece abrir a existente ou manter rascunho, sem soma.
- [ ] Revisão obsoleta não sobrescreve dados e oferece recarga consciente.
- [ ] Cancelamento respeita confirmação/motivo e termina em somente leitura.
- [ ] Alerta de Reserva Prévia é persistente e informa os três valores.
- [ ] Campos de recebimento/NF e parâmetros nunca são tratados como editáveis/autoridade.
- [ ] Menu usa o nome/localização exatos e respeita acesso.
- [ ] A tela não incorpora DTO, estado ou lógica de sugestão da Consulta de Compras.

## Matriz mínima de testes Vitest

- renderizar Novo, aberta e cada situação somente leitura;
- disparar cada atalho e equivalente por clique;
- tentar Nova/Voltar/F9 com formulário sujo e confirmar/cancelar descarte;
- cascata de limpeza requisitante → requisitada → produto → quantidade;
- produto desabilitado/habilitado e resolução visual/barras;
- grades ligadas/desligadas mantendo ordem;
- quantidade vazia, zero, negativa, fracionária e inteira;
- contador de observação em 149, 150 e 151;
- selecionar F9 e carregar ficha;
- resposta de duplicidade: abrir existente e permanecer;
- conflito: conservar rascunho e recarregar somente após confirmação;
- motivo obrigatório/opcional e cancelamento bem-sucedido;
- cancelamento aberto com quantidade recebida informativa;
- alerta de Reserva Prévia permanece após sucesso;
- payload não contém parâmetros nem campos somente leitura;
- item de menu autorizado/não autorizado.

## Smoke test integrado

Documentar e automatizar no nível suportado pelo projeto:

1. entrar pelo menu;
2. criar requisição com requisitante autorizada;
3. localizar por F9;
4. aumentar e reduzir quantidade;
5. simular alteração concorrente e verificar conflito;
6. cancelar;
7. confirmar situação final, movimentos e auditoria.

## Gates

- `npm test`;
- `npm run build`;
- feature tests das rotas/menu do prompt 02;
- smoke test integrado;
- regressão da Consulta e suíte PostgreSQL do prompt 01.

Nenhum cenário obrigatório de PostgreSQL pode ser considerado aprovado apenas porque foi pulado.

## Saída esperada do SpecKit

Produza especificação e plano executáveis com árvore de componentes, modelo de estado, contratos com endpoints, acessibilidade, atalhos, comportamento responsivo, tratamento de erros/alertas, menu, sequência de implementação e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- consulta histórica geral;
- separação, transferência, expedição, recebimento e alteração operacional de `qtderecebida`;
- sugestão, candidatas, cobertura e distribuição em lote da Consulta de Compras;
- Pedido de Compra e NF-e pendente;
- copiar interação desktop sem equivalente web;
- senha de supervisor, requisição parcial, edição de parâmetros ou alteração do Delphi.
```
