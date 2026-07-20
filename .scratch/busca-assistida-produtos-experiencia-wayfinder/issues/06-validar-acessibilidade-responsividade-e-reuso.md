# Validar acessibilidade, responsividade e reuso

Type: grilling
Status: resolved
Blocked by: 02, 03, 04, 05

## Question

O fluxo decidido funciona por teclado, leitor de tela, toque e desktop para consulta única e multisseleção; comunica gravação/processamento sem depender apenas de cor; preserva foco e seleção; e oferece seams suficientes para Consulta de Estoques, Orçamentos, Contratos e outros hospedeiros sem acoplamento ou vazamento de permissões?

## Answer

### Decisão nova

- **Mobile/celular fica fora de escopo por agora.** O painel continua como `aside` de largura fixa, desktop/tablet apenas — nada no restante da Consulta de Estoques tem hoje um layout mobile-first, e não há caso de uso real de celular para este fluxo. Revisitar se e quando um hospedeiro exigir isso.

### Validação do que já havia sido decidido (sem necessidade de nova decisão)

- **Teclado/leitor de tela na lista com multisseleção**: cada cartão de resultado expõe dois controles independentes e alcançáveis por Tab — checkbox "Selecionar" e botão "Ver mais detalhes" — nenhum aciona o outro, consistente com [Definir multisseleção e contrato com o hospedeiro](03-definir-multisselecao-e-contrato-hospedeiro.md). Cada chip removível na faixa de seleção tem rótulo acessível próprio ("Remover <produto> da seleção"), seguindo o mesmo padrão já usado no botão de microfone ([Definir a máquina de estados do microfone](02-definir-maquina-estados-voz.md)).
- **Modal de detalhe (variante C, [Prototipar resultados e detalhe comercial rico](04-prototipar-resultados-e-detalhe-rico.md))**: reaproveita a convenção de `aria-modal`/foco preso já usada em dezenas de modais existentes no projeto (ex. `ProductPhotoGalleryModal`) — Esc fecha, foco preso dentro do modal, retorno de foco ao botão "Ver mais detalhes" que abriu, ao fechar. Nenhuma convenção nova precisa ser inventada.
- **Preservar foco e seleção**: abrir/fechar o detalhe nunca altera a seleção (já decidido). Como o detalhe é sobreposto (variante C), a lista de resultados nunca é desmontada por baixo do modal, então a posição de rolagem nunca se perde.
- **Comunicação de gravação/processamento sem depender só de cor**: já resolvido em [Definir a máquina de estados do microfone](02-definir-maquina-estados-voz.md) — ícone, texto, `aria-pressed` e região viva, não apenas a cor do botão.
- **Seams para outros hospedeiros (Orçamentos, Contratos etc.)**: o painel recebe todas as URLs como props do hospedeiro (busca, ditado, feedback, e agora o endpoint combinado do detalhe) — nunca importa rotas de um hospedeiro específico. Autorização por contexto nomeado nega por padrão qualquer contexto ainda não registrado ([Definir dados, carregamento e segurança do detalhe](05-definir-contrato-dados-detalhe-seguranca.md)), então um hospedeiro ainda não integrado não corre risco de vazamento de permissão. `onApply(selections[])` mantém o painel cego às regras internas de cada hospedeiro — cada um escreve seu próprio adaptador.
