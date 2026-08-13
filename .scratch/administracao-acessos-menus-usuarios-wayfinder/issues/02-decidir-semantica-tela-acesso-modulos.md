# Decidir a semantica da tela administrativa de acesso a modulos

Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual deve ser o contrato funcional e de seguranca da tela, disponivel somente a Administradores, que concede acesso de Usuarios aos modulos? A decisao precisa fechar: populacao de folhas administraveis; concessao direta a Usuario versus Grupo de Usuarios; distincao entre raiz, agrupador e folha; bypass de Administrador; protecao contra auto-revogacao ou remocao do ultimo Administrador; edicao em lote; idempotencia e concorrencia; comportamento de modulos/rotas ausentes, desabilitados ou ambiguos; Auditoria antes/depois; confirmacao e mensagens; e revalidacao server-side em cada operacao.

Partir do modelo atual de acessosmodulos/usuariosacessosmodulos e do UsersModuleAccessService, sem criar permissoes operacionais por modulo como efeito colateral. Registrar cenarios de um Administrador, Usuario sem concessao, Usuario com concessao revogada e tentativa de acesso direto a rota.

## Answer

Contrato confirmado pelo usuario:

- A primeira versao concede e remove acesso diretamente para Usuarios individuais. Grupos de Usuarios ficam fora.
- A arvore mostra somente folhas Cloud ativas, com rota nomeada existente e nao ambigua. Raizes e agrupadores aparecem apenas como estrutura visual.
- Administradores mantem bypass absoluto para todos os modulos Cloud e nao entram na edicao de grants individuais.
- A nova tela e todas as operacoes de consulta e gravacao sao exclusivas de Administradores, por revalidacao server-side da flag administrador. O grant users.cadastro nao concede esse poder.
- A edicao ocorre para um Usuario por vez. O Administrador seleciona folhas e salva um diff atomico em transacao; nao existe edicao em massa na primeira versao.
- Repeticao identica e idempotente. Alteracao concorrente retorna 409 e exige recarregar antes de confirmar novamente.
- Usuarios ativos e inativos podem ser administrados; o filtro padrao mostra ativos. Inativar um Usuario nao apaga seus grants.
- Cada salvamento com alteracao gera uma Auditoria unica com operador, Usuario alvo, modulos adicionados/removidos, estado anterior/posterior, data/hora, request/trace id e resultado. Nenhuma senha ou dado sensivel entra no evento. Salvamento sem diff nao gera evento de mudanca.
- Folhas desabilitadas, sem rota ou ambiguas nao aceitam novas concessoes. Grants antigos sao preservados para diagnostico, aparecem como inconsistencias somente leitura, nao aparecem no menu e nao autorizam acesso direto.
- O grant e autorizacao efetiva do modulo, nao mera visibilidade de menu. Todas as rotas filhas, lookups, exportacoes, PDFs, downloads e comandos devem revalidar o mesmo acesso. Permissoes operacionais continuam em Policies/abilities proprias.
- Grupos e hubs nao recebem concessao propria. Um hub de grupo so e acessivel quando existe ao menos uma folha filha autorizada; funcionalidade exclusiva de hub deve ser modelada como folha propria.
- A confirmacao mostra o resumo da alteracao. Falhas sao atomicas; autorizacao negada retorna 403 sem detalhes internos; conflito retorna 409; sucesso mostra o estado persistido.

Resolvido em sessao HITL de grilling, com base no inventario Laravel. Nenhum codigo de producao foi alterado.
