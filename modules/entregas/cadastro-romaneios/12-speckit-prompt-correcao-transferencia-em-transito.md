# Prompt 12

```text

Regra: T + EM TRANSITO deixa todos os botoes do grid desabilitados.
Este prompt e novo e corretivo. Os prompts 04, 09, 10 e 11 ja foram publicados; nao os reexecute e nao implemente agora.

Nao consultar nem exigir codigo-fonte Delphi. Regra confirmada: Romaneio de Transferencia, tipo T, em EM TRANSITO, deixa todos os botoes ao lado do grid desabilitados.
A regra generica nao FECHADA/CANCELADO = pode incluir esta incorreta. Para T + EM TRANSITO, incluir nota, incluir multiplos, editar e excluir ficam desabilitados.
Tambem ficam desabilitados anular/reativar, conferencia, recebimento, justificar, atendimento, reagendamento, assinatura e movimentacoes quando estiverem nessa barra. Consulta deve ser superficie separada.
Nao aplicar automaticamente a regra a Normal em transito. Nao herdar permissoes de Normal para T. PASSAGEM, ENTREGUE PARCIAL, ENTREGUE e FECHADA de T precisam de celulas proprias.
Use os documentos consolidados em modules/entregas/cadastro-romaneios/, o snapshot/schema, o prompt 10 e o checkout Laravel. Confira Cadastro.tsx, RomaneioItensToolbar.tsx, RomaneioItensGrid.tsx, AuthorizationService, EditabilityService, OperacoesGuard e handlers Update/UpsertItem/DeleteItem/ToggleCancelado/Conferir.
Nao pedir validacao adicional do Delphi. Classifique CONFIRMADO, DIVERGENTE, POSSIVEL BUG ATUAL, DUVIDA ou DECISAO NOVA, com arquivo/linha Laravel.
Contrato server-side: grid_actions.allowed=false, reason_code=transferencia_em_transito. Flags de incluir, editar, excluir, cancelamento, conferencia, entrega e movimentacoes sao false.
A mesma decisao alimenta botoes, duplo clique, Enter, Ctrl+F2, Ctrl+F3, Ctrl+Espaco, rotas e handlers. Releia a situacao canonica sob lock; payload HTTP nao pode contornar.
Auditar CadastroRomaneiosEditabilityService: somente FECHADA/CANCELADO nao cobre a excecao T em transito. Auditar Cadastro.tsx: capabilities.create nao pode habilitar canIncluir para T em transito.
Auditar RomaneioItensToolbar, AuthorizationService, OperacoesGuard e handlers de Update/UpsertItem/DeleteItem/ToggleCancelado/Conferir. Todos devem compartilhar a pre-condicao transacional.
Entregar matriz tipo x situacao x operacao. Para T: ABERTA e CONFIRMADA PARCIAL usam suas regras proprias; CONFIRMADA nao herda Liberar de N; PASSAGEM usa RPS; EM TRANSITO tem todos os botoes do grid desabilitados; ENTREGUE PARCIAL/ENTREGUE tem celulas proprias; FECHADA e somente leitura.
Aceite: renderizar T em transito com todos os botoes desabilitados; impedir modais de incluir; impedir duplo clique, Enter, Ctrl+F2/Ctrl+F3/Ctrl+Espaco; rejeitar rotas adulteradas; testar revisao, concorrencia, idempotencia, PostgreSQL canonico e acessibilidade do motivo.
O prompt 12 supersede o prompt 11 somente neste ponto. Fora de escopo: reexecutar prompts, consultar Delphi, implementar agora ou alterar banco, funcoes, triggers e migrations.
```
