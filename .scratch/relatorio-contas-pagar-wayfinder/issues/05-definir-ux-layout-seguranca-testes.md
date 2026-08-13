# Definir a UX, o layout, a segurança e os testes do Relatório de Contas a Pagar

Type: grilling
Status: resolved
Blocked by: 04

## Question

Como a página, filtros condicionais, preview, navegação, PDF, impressão, acessibilidade, autorização por Filial, retenção, desempenho, erros e testes devem expor e provar o contrato do Relatório de Contas a Pagar?

## Answer

### Página e fluxo

- A página usa os filtros principais no topo, os filtros avançados em painel recolhível e as opções de agrupamento e saída em uma seção própria.
- Toda solicitação cria uma Geração de Relatório assíncrona; não existe caminho síncrono alternativo.
- A tela acompanha a situação da geração e mantém um histórico das gerações do Usuário nos últimos 7 dias, com situação, critérios resumidos e ações compatíveis com a retenção da Fotografia de Relatório.
- A fotografia concluída abre em uma rota própria de visualização. A tela de filtros permanece separada e disponível para iniciar outra geração.
- As situações são `QUEUED`, `RUNNING`, `COMPLETED`, `FAILED`, `CANCELLED` e `EXPIRED`. O cancelamento é permitido apenas em `QUEUED` ou `RUNNING`, é terminal e nunca publica conteúdo parcial.
- Uma tentativa após falha ou cancelamento cria outra geração, com novo identificador e vínculo de rastreabilidade à anterior; registros terminais não são reutilizados nem sobrescritos.
- Erros devem ser compreensíveis e acionáveis, sem expor SQL, detalhes internos ou dados fora do escopo autorizado.

### Visualização, PDF e impressão

- Visualização, PDF e impressão consomem exclusivamente a mesma Fotografia de Relatório identificada; nenhuma dessas ações reconsulta fatos financeiros.
- Relatórios detalhados usam orientação paisagem; a saída `somente resumido` usa retrato. A orientação e a versão do template integram a fotografia.
- O cabeçalho é institucional da empresa. Quando o escopo contiver várias Filiais, todas são identificadas nos critérios, sem atribuir o relatório artificialmente a uma única Filial.
- Cabeçalhos de colunas se repetem a cada página. Grupos e subtotais não devem ser quebrados quando couberem juntos; quando a quebra for inevitável, a continuação do grupo deve ser identificada.
- O PDF é produzido sob demanda a partir da fotografia concluída e pode ser armazenado como artefato derivado vinculado à geração. Falha na renderização do PDF não invalida a fotografia.
- A ação Imprimir usa a impressão do navegador sobre a visualização da fotografia, com o mesmo template versionado do PDF e sem integração com impressoras do servidor.

### Segurança e rastreabilidade

- Capacidades específicas de visualizar e gerar o relatório derivam da Permissão de consulta de Contas a Pagar.
- Toda consulta de situação, histórico, visualização, PDF, impressão e cancelamento revalida simultaneamente a capacidade exigida e o acesso do Usuário a todas as Filiais fotografadas. Conhecer o identificador da geração não concede acesso.
- A criação, visualização, download do PDF, impressão e cancelamento produzem Auditoria de Relatório com Usuário, instante, geração e Filiais envolvidas. Essa trilha é operacional e não constitui Movimento ou fato financeiro.
- A expiração encerra o acesso à fotografia e aos artefatos derivados conforme a retenção de 7 dias, preservando apenas os metadados de auditoria exigidos pela política do sistema.

### Acessibilidade

- Filtros, acompanhamento e ações devem ser operáveis por teclado e possuir foco visível e nomes acessíveis.
- Situações e erros não podem depender apenas de cor.
- Tabelas usam cabeçalhos semânticos e mantêm leitura compreensível com ampliação; os documentos preservam contraste e hierarquia visual.

### Estratégia de testes e aceite

- Testes unitários cobrem a matriz condicional de filtros, estados e transições, orientação, agrupamentos, cinco medidas financeiras, valor líquido derivado e separação entre os dois descontos.
- Testes de integração em PostgreSQL cobrem filtros e temporalidades das três modalidades, regime de caixa, Duplicatas/Adiantamentos, agrupamentos, totais, snapshot consistente, concorrência, limite de 100.000 linhas, ausência de resultado parcial e expiração.
- Testes de autorização cobrem criador, outro Usuário autorizado, perda de Permissão, perda de acesso a uma das Filiais e tentativa por enumeração de identificadores em todas as rotas e ações.
- Testes do ciclo assíncrono cobrem sucesso, falha, cancelamento, nova tentativa com novo identificador e produção do PDF sem reconsulta financeira.
- Testes de contrato provam que visualização, PDF e impressão recebem o mesmo identificador, critérios, linhas, grupos e totais da fotografia.
- Testes de renderização/Browsershot validam estrutura visual, orientação, repetição de cabeçalhos, quebras, rodapés e impressão. Regras e totais financeiros não podem depender de testes ignoráveis pela indisponibilidade do renderizador.
- Um cenário próximo de 100.000 linhas registra duração e consumo de memória, confirma processamento assíncrono e detecta consultas repetidas por linha. O primeiro aceite cria uma referência operacional mensurável, sem fixar tempo absoluto dependente da infraestrutura antes dessa medição.
- O aceite inclui navegação por teclado, foco, nomes acessíveis, semântica das tabelas, contraste e comunicação de situação sem dependência exclusiva de cor.

### Restrições de implementação

- Reutilizar o shell institucional, o serviço de layout, o gerador Browsershot, Policies e escopos de Filial existentes, aprofundando-os somente onde o contrato de fotografia exigir.
- Templates Laravel são versionados e determinísticos; templates FastReport `.fr3` não são dependência de execução.
- A fotografia é a fonte canônica. Cache temporário de job, HTML ao vivo e arquivo PDF isolado não satisfazem o contrato.
