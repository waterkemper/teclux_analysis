# Decidir a organizacao canonica de menus e rotas

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como o Laravel deve representar e manter a relacao entre menu visual, folha de modulo, rota nomeada e URL publica? Definir o contrato para catalogo de rotas canonicas, arvore visual, nomes estaveis em acessosmodulos.rota, mapeamento do caso Contas a Pagar, deteccao de duplicidades e orfaos, migrations idempotentes, compatibilidade com URLs existentes e protecao das rotas filhas.

## Answer

Decisoes confirmadas pelo usuario:

- A reorganizacao sera incremental, por lotes de modulos, comecando pelo catalogo e pelos modulos envolvidos nesta iniciativa. Nao havera uma reescrita global em uma unica entrega.
- O contrato separa quatro responsabilidades: hierarquia e texto visual do menu; nome estavel da rota Laravel em acessosmodulos.rota; URL publica declarada em routes/web.php; e protecao HTTP da folha e de suas rotas filhas.
- acessosmodulos.rota usa o nome da rota Laravel como identidade canonica da folha. A URL nao e usada como identidade de grant ou de menu.
- Cada ramo visual usa codigo estavel, codigo_pai, nome e ordem. Somente folhas operacionais apontam para rotas nomeadas e podem ser concedidas. Grupos e hubs sao apenas navegacao.
- O exemplo Contas a Pagar -> Relatorios -> Contas a Pagar sera mapeado para a URL /cadastros/contas-pagar/relatorios/contas-a-pagar e para a rota principal contas_pagar.relatorios.contas_a_pagar.index.
- Os nomes das rotas serao normalizados seguindo a convencao funcional existente, com namespaces previsiveis para index, gerar, export, pdf, lookup e demais operacoes.
- As URLs /cloud/modulos/... e os nomes de rota antigos serao removidos nesta entrega. Todas as referencias internas, migrations, testes e chamadas frontend serao atualizadas. Nao serao mantidos aliases ou redirects permanentes; redirects temporarios somente se algum teste ou integracao local exigir.
- Toda rota filha da folha deve aplicar o mesmo acesso de modulo da pagina principal, incluindo geracao, acompanhamento, cancelamento, retry, exportacao, download, PDF, lookups e endpoints auxiliares. Permissoes operacionais especificas continuam separadas quando necessario.
- Cada migration deve ser idempotente e validar o catalogo. Rota inexistente bloqueia a migration; duas folhas usando a mesma rota canonica bloqueiam a migration; folha sem pai valido e reportada como orfa e nao e exibida.
- Correcoes de duplicidade devem ser explicitas, nao podem apagar concessoes silenciosamente e devem preservar diagnostico e registrar o motivo da alteracao.
- A reorganizacao visual, a renomeacao de rota e a mudanca de URL devem ser implementadas e testadas como mudancas distintas, para evitar que uma alteracao visual quebre grants ou referencias internas.

