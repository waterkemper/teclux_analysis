# Inventariar parâmetros, autorizações e acesso do módulo legado

Type: research
Status: resolved
Blocked by:

## Answer

O inventario foi registrado em pesquisa-parametros-autorizacoes-menu.md. Ele confirma os literais e a precedencia filial/global de ParSistema, a conversao legada de booleanos/inteiros/datas, os parametros de duplicidade, estoque, reservas, grades, lotes, cancelamento, confirmacao e impressao, bem como os filtros por Filial Base e Requisitante.

O Delphi nao prova grants operacionais nem ObterAutorizacao; validacoes de estado/estoque nao devem virar capabilities automaticamente. O menu legado identifica a folha tecnica mitTransferenciaRequisicaoExposicao sob InterLojas -> Transferencia, mas nao fornece codigo numerico para acessosmodulos. O Laravel deve decidir uma folha/rota propria, proteger todas as rotas, revalidar filial no servidor e nao copiar grants em massa sem decisao.

## Question

Quais propriedades de `ParSistema` e literais de `clparametrossistema.pas` governam a tela e cada operação — estoque, reservas, duplicidade, limites de data, grades, código de barras, lotes, confirmação, cancelamento, impressão e demais usos alcançados? Como o Delphi autoriza o menu **Interlojas → Transferências**, filiais requisitante/requisitada e operações sensíveis? Comparar com `acessosmodulos`, `usuariosacessosmodulos`, `usuariosfiliais` e os padrões Laravel atuais, sem inventar permissões nem conceder acesso em massa.
