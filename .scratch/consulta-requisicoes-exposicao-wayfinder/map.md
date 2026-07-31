# Consulta de Requisições para Exposição

## Destination

Produzir comandos `/speckit.specify`, publicados em `modules/interlojas/consulta-requisicoes-exposicao/`, para implementar no Laravel o módulo completo **Interlojas → Consulta de Requisições para Exposição** de `dmconsultarequisicaoexposicao.pas/.dfm` e `fmconsultarequisicaoexposicao.pas/.dfm`, reaproveitando o Cadastro e o núcleo de Requisição entre Filiais já existentes no Laravel.

## Notes

- Fontes Delphi primárias: `delphi/apps/interlojas/dmconsultarequisicaoexposicao.pas/.dfm` e `fmconsultarequisicaoexposicao.pas/.dfm`.
- Base Laravel obrigatória: implementação atual de `RequisicaoExposicao`, núcleo compartilhado `RequisicaoFiliais`, testes de Interlojas, ADR 0292 e componentes/padrões de grids e relatórios.
- Usar `/domain-modeling` quando surgir termo novo ou conflito com o glossário; usar `/grilling` para decisões de produto/arquitetura não extraíveis do código.
- Preservar a distinção entre **Consulta de Requisições para Exposição**, **Cadastro Manual de Requisições** e **Geração de Requisições pela Consulta de Compras**.
- Parâmetros seguem as descrições literais de `delphi/biblio/clparametrossistema.pas` e mensagens/constantes de `ctconstantes.pas`; Laravel resolve por `parametros_valor(descricao, filial ativa)`. `''`, `NULL`, ausência e booleano inválido equivalem a falso.
- Tratar o código Laravel existente como estado real a inspecionar, não como implementação presumida pelos prompts anteriores.
- Exceção ao padrão “plan, don't do”: o ticket final publica os comandos `/speckit.specify` em `modules/`.

## Decisions so far

- [Decidir autorização, filiais e parâmetros da Consulta](issues/06-decidir-autorizacao-filiais-e-parametros.md) — capability própria em `acessosmodulos` para Interlojas → Consulta de Requisições; filial ativa como Base, requisitantes limitadas por `usuariosfiliais` e parâmetros resolvidos pelo manifesto Laravel com falso para valores vazios/inválidos.

<!-- As decisões resolvidas serão indexadas aqui. -->

- [Inventariar jornada e interface da Consulta Delphi](issues/01-inventariar-jornada-e-interface-delphi.md) — tela filtra Filial Base por período/situação, mostra Pedidos com quantidade editável e detalhe Confirmados para fechadas, oferece Gerar F7, Cancelar F6 e impressão, com cores de estado e alternância Data–Nota/Série.

- [Mapear SQL, mutações, parâmetros e relatório Delphi](issues/02-mapear-sql-mutacoes-parametros-e-relatorio-delphi.md) — consulta fixa a requisitante na Filial Base e ordena por requisitada/produto; edição e cancelamento de abertas coordenam bloqueio, TEP/TPE/TFR e venda futura conforme parâmetros, sem autorização de usuário local, e imprimem o conjunto filtrado.

- [Inventariar Interlojas já existente no Laravel](issues/03-inventariar-interlojas-existente-no-laravel.md) — backend do Cadastro e núcleo já oferecem autorização, ficha/F9, comandos transacionais, revisão, auditoria, parâmetros e tratamento de reserva/futuro; faltam a página React, a consulta por período/situação e o relatório específico.

- [Comparar a Consulta Delphi com o Cadastro Laravel](issues/04-comparar-consulta-delphi-com-cadastro-laravel.md) — Consulta exige página, leitura paginada, detalhe Confirmados e relatório próprios, mas deve delegar quantidade/cancelamento ao núcleo com adapters estreitos, mantendo autorização, parâmetros, revisão, auditoria, locks, movimentos e alertas compartilhados.

## Not yet specified


## Out of scope

- Separação, transferência, expedição e recebimento de mercadorias.
- Alterar operacionalmente `qtderecebida` ou reproduzir os formulários de transferência.
- Geração em lote pela Consulta de Compras.
- Reimplementar o Cadastro Manual já existente, salvo seams necessários ao reúso.
- Alterações no Delphi; a jornada termina na publicação dos comandos SpecKit.
- [Comparar a Consulta Delphi com o Cadastro Laravel](issues/04-comparar-consulta-delphi-com-cadastro-laravel.md) — Consulta exige página, leitura paginada, detalhe Confirmados e relatório próprios, mas deve delegar quantidade/cancelamento ao núcleo com adapters estreitos, mantendo autorização, parâmetros, revisão, auditoria, locks, movimentos e alertas compartilhados.
+- [Decidir jornada e edição na Consulta Laravel](issues/05-decidir-jornada-e-edicao-na-consulta-laravel.md) — Consulta abre na filial ativa com datas do servidor e Aberto, gera sob demanda, mantém Pedidos/Confirmados, estados explícitos e edição restrita de quantidade; usa barra Laravel com atalhos F7/F5/F6/F12 complementares.
+- [Decidir cancelamento, concorrência e auditoria na Consulta](issues/07-decidir-cancelamento-concorrencia-e-auditoria.md) — F6 delega cancelamento lógico ao núcleo com quantidade integral, futuro prioritário e alerta de reserva; alterações usam revisão/locks e `409`, enquanto `pedidosfiliais_log_new` é preenchido exclusivamente pelo trigger via `DatabaseAuditContext`.
- [Decidir autorização, filiais e parâmetros da Consulta](issues/06-decidir-autorizacao-filiais-e-parametros.md) — capability própria em `acessosmodulos` para Interlojas → Consulta de Requisições; filial ativa como Base, requisitantes limitadas por `usuariosfiliais` e parâmetros resolvidos pelo manifesto Laravel com falso para valores vazios/inválidos.
- [Decidir jornada e edição na Consulta Laravel](issues/05-decidir-jornada-e-edicao-na-consulta-laravel.md) — jornada confirmada: filial ativa, geração sob demanda, abas Pedidos/Confirmados, edição restrita e barra Laravel com atalhos.
- [Decidir cancelamento, concorrência e auditoria na Consulta](issues/07-decidir-cancelamento-concorrencia-e-auditoria.md) — cancelamento pelo núcleo, revisão/locks, conflito 409 e auditoria pelo trigger.
