# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para transformar a prévia Laravel existente na Consulta de Orçamentos completa, tomando o Delphi como evidência funcional e Vendas → Consulta de Contratos do Laravel como referência arquitetural e visual de componentes.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Se a evidência fornecida for insuficiente ou ambígua, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Não transforme limitações ou bugs legados já classificados em requisitos.

## Objetivo

A nova Consulta de Orçamentos deve reunir:

- filtros completos e combináveis;
- ação explícita Gerar;
- geração cancelável;
- resultados paginados com totalizadores;
- linha ativa separada da seleção múltipla;
- visualização mestre–detalhe;
- Produtos e situações de atendimento;
- operações contextuais sobre a linha ativa;
- Cancelamento/Exclusão e Impressão sobre marcados;
- Parâmetros, Permissões e Autorizações equivalentes;
- reutilização dos componentes existentes da Consulta de Contratos.

## Fronteira de acesso e investigação obrigatória

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, forms, data modules, frames, queries, macros SQL, datasets ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir da Consulta de Orçamentos, seus ancestrais, filtros compartilhados, operações, Parâmetros do Sistema, Permissões e Autorizações.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações e sem exigir que o Cursor as reconfirme no código Delphi.
- Imagens ou comportamento visual não substituem evidência funcional.
- Quando uma decisão depender de informação Delphi ausente, não invente nem deduza: registre exatamente a pergunta que deve retornar ao workspace de análise.

No checkout Laravel, analise:

- Consulta de Orçamentos atual: page, componentes, controller, request, service, repository, types, rotas e testes;
- Consulta de Contratos: estrutura Filtros/Resultados, Gerar cancelável, payload versionado, ajuda, operação, grids, detalhe e autenticação sensível;
- componentes reutilizáveis de Filiais, Produto, Cliente, Fornecedor, vendedor, Plano de Pagamento, datas e Atendimento;
- composição SQL compartilhada, especialmente Fornecedor por Produtos;
- Cadastro de Orçamentos, Contratos, Atendimento, Consulta de Vendas e Ficha Financeira;
- specs já elaborados de Cancelamento/Exclusão e Impressão de Orçamentos.

Classifique descobertas do Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE frente ao pacote fornecido. Preserve as marcações POSSÍVEL BUG LEGADO e DECISÃO NOVA já presentes, sem reclassificá-las por suposição.

## Evidência Delphi confirmada

### Organização e operações

- A tela possui abas `Parâmetros` e `Registros selecionados`.
- F6/Gerar executa a consulta.
- F7 aciona Cancelamento/Exclusão dos marcados.
- F11 imprime os marcados.
- Espaço alterna a marcação da linha.
- Há seleção de todos e totalizadores gerais/marcados.
- Operações contextuais: abrir Cadastro do Orçamento, abrir Contrato, Atendimento, Consultar Vendas e Ficha Financeira.
- O botão Contrato usa o Contrato vinculado ao Orçamento.
- As operações Atendimento, Vendas e Ficha usam o Cliente/tipo do Orçamento.

### Filtros

Foram localizados:

- validade inicial/final;
- Planos;
- Cliente marcado para não ligar: marcados, ambos ou não marcados;
- quantidade de Atendimentos com operador;
- data de contato inicial/final;
- data de `lembrar em` inicial/final;
- faixa de valor total;
- Filial;
- vendedor;
- Cliente exato;
- texto contido no nome quando não há Cliente exato;
- Produto/item;
- emissão inicial/final;
- Situação;
- ordenação;
- listas de itens, Produtos, grupos, classes, marcas e promoções por frames compartilhados.

Inspecione no Laravel valores, defaults, nulabilidade, operadores, precedência e SQL de cada filtro e confronte-os com o pacote fornecido. Quando um detalhe funcional do legado não estiver definido, registre DÚVIDA/BLOQUEIO para o workspace de análise.

### Resultados

Colunas localizadas incluem:

- código do Orçamento;
- código/nome do vendedor;
- Cliente/nome;
- Filial;
- emissão e validade;
- total de Produtos;
- Situação;
- seleção;
- Contrato e Situação do Contrato;
- valor a prazo;
- quantidade de Atendimentos;
- último contato, lembrar em e assunto;
- Motivo e descrição do Cancelamento.

Há totalizadores de quantidade e valor para todos e marcados. A evidência fornecida não determina se o legado agrega o conjunto inteiro ou apenas o dataset carregado; não tente consultar o Delphi. Especifique totalizadores coerentes com paginação sobre o conjunto filtrado e destaque essa escolha como DECISÃO NOVA, ou registre bloqueio se houver impacto funcional que exija investigação adicional.

### Produtos

- A tela pode exibir grade inferior de Produtos do Orçamento ativo.
- `Visualizar Situação Produtos` governa o cálculo/exibição da situação.
- Existem filtros Atendido, Parcialmente atendido e Não atendido.
- Colunas incluem sequência, situação, Filial, código visual, descrição, grades, quantidade, preço, desconto, total, previsão, quantidade vendida/Contrato, montagem, entrega, estoque e reservado.
- Existe opção legada de mesclar Orçamentos e Produtos.
- DECISÃO NOVA: não reproduzir a mesclagem; usar mestre–detalhe no padrão da Consulta de Contratos.

### Cancelamento/Exclusão

- `ExclusaoOrcamento` escolhe Cancelar, Excluir, Perguntar ou Nenhuma.
- Cancelamento de mais de um Orçamento solicita Autorização contextual de Gerente de Vendas.
- Motivo/descrição e Atendimento seguem o fluxo de cancelamento já analisado.
- A consulta não deve criar um caminho simplificado que contorne essas regras.

### Impressão

- A impressão usa os Orçamentos marcados.
- Deve integrar o spec já produzido: modal de foto, PDF único, validação de Qualidade da Venda e autorização de Analista de Crédito por Orçamento.

## Estado Laravel confirmado

- Já existe Consulta de Orçamentos com rota, controller, request, service, repository e página React/Inertia.
- O backend já reconhece alguns filtros: Filial, vendedor, Cliente, nome, Produto, Plano, emissão, validade, Situação, faixa total e quantidade de Atendimentos.
- A UI atual expõe apenas emissão, nome do Cliente e Situação.
- O repository atual aplica Filiais autorizadas.
- A tela possui grade, seleção, Gerar, abrir Cadastro e Cancelar selecionados.
- O cancelamento atual solicita código do Motivo por `window.prompt`, divergindo do fluxo completo já especificado.
- NÃO LOCALIZADO: painel mestre–detalhe, Produtos, Contrato, Atendimento, Vendas, Ficha Financeira e impressão em lote.
- A Consulta de Contratos já possui os componentes e padrões necessários para a reformulação.

## Decisões obrigatórias

1. Transformar a prévia em Consulta de Orçamentos completa.
2. Aplicar filtros somente quando o Usuário clicar em `Gerar`.
3. Não realizar consulta reativa durante edição dos filtros.
4. Usar Consulta de Contratos como referência de abas, barra, geração cancelável, filtros, ajuda, resultados e detalhes.
5. Reutilizar componentes existentes; generalizá-los quando necessário, sem copiar.
6. Incluir filtro de Fornecedor relacionado aos Produtos usando componente e composição SQL já existentes.
7. Manter todos os filtros específicos Delphi, adaptando `não ligar` ao campo/regra atual do Cliente.
8. Ações Orçamento, Contrato, Atendimento, Vendas e Ficha Financeira usam somente a linha ativa.
9. Seleção múltipla serve somente para Cancelar/Excluir e Imprimir.
10. Usar mestre–detalhe com aba Produtos; não mesclar grids.
11. Integrar os specs existentes de Cancelamento/Exclusão e Impressão sem redefinir ou simplificar suas regras.

## Arquitetura dos filtros

Crie payload versionado inspirado em Consulta de Contratos. Deve representar:

- lista de Filiais autorizadas selecionadas;
- regras e exceções de Produto;
- regras e exceções de Cliente;
- regras e exceções de Fornecedor via Produtos;
- regras e exceções de vendedor;
- regras e exceções de Plano de Pagamento;
- intervalos de emissão e validade;
- Situações do Orçamento;
- faixa de valor total;
- quantidade de Atendimentos e operador;
- intervalos do último contato e lembrar em;
- estado de não ligar;
- texto contido no nome;
- ordenação;
- paginação.

Reutilize builders, types e normalizadores compartilháveis. Validar no backend:

- versão suportada;
- datas e intervalos;
- valores e operadores;
- códigos autorizados;
- número máximo de regras/listas;
- combinações incompatíveis;
- paginação e ordenação em allowlist.

Filiais autorizadas sempre são impostas no servidor. Filtro submetido nunca amplia acesso.

## Composição SQL e desempenho

Reutilize a composição de Consulta de Contratos para painéis por Cadastro. Para Produto, Fornecedor, Plano e Atendimento, prefira `EXISTS`, subqueries ou CTEs que não multipliquem Orçamentos.

Garanta que:

- um Orçamento aparece uma única vez;
- contagem e soma não são duplicadas por Produtos/Atendimentos;
- totalizadores representam todo o conjunto filtrado, não apenas página;
- paginação e ordenação são server-side;
- consultas de total e página compartilham as mesmas condições;
- geração longa pode ser cancelada segundo o padrão Laravel existente;
- limites evitam consultas irrestritas acidentais.

Inspecione índices e planos somente de forma segura/read-only. Registre riscos e recomendações sem executar migrations nesta etapa.

## Interface

Estruture:

1. barra de operações;
2. banner de geração/cancelamento;
3. aba Filtros;
4. aba Resultados;
5. grade mestre;
6. totalizadores;
7. detalhe do Orçamento ativo;
8. aba Produtos no detalhe.

Ao Gerar:

- validar filtros;
- mostrar estado de geração;
- permitir cancelar;
- abrir Resultados após sucesso;
- ativar a primeira linha quando houver;
- manter filtros submetidos como fotografia da consulta executada.

Alterar campos depois da busca deve indicar filtros pendentes, sem modificar o resultado até novo Gerar.

## Grade, linha ativa e seleção

Diferencie:

- linha ativa: dirige detalhe e ações contextuais;
- linhas marcadas: dirigem apenas Cancelar/Excluir e Imprimir.

Especifique:

- seleção por checkbox e teclado;
- alcance de `Selecionar todos` — página ou conjunto — com rótulo inequívoco;
- persistência/reconciliação da seleção entre páginas;
- limpeza ou manutenção ao executar novo Gerar;
- ordenação por cabeçalho permitida;
- feedback quando não há registros;
- total quantidade/valor geral e marcado.

Não permita que Orçamento, Contrato, Atendimento, Vendas ou Ficha Financeira usem vários marcados.

## Mestre–detalhe e Produtos

Carregue detalhes sob demanda para a linha ativa com proteção contra respostas fora de ordem.

A aba Produtos deve exibir dados confirmados do Delphi e reutilizar componentes de grid Laravel. Aplicar situações:

- A — Atendido;
- P — Parcialmente atendido;
- N — Não atendido.

Use os códigos fornecidos `A`, `P` e `N` como contrato legado de entrada. Inspecione no Laravel o cálculo existente e confronte-o com as descrições Atendido, Parcialmente atendido e Não atendido. Se a fórmula necessária não estiver determinada pelo pacote, registre DÚVIDA/BLOQUEIO para investigação no workspace de análise. Quando `Visualizar Situação Produtos` estiver desativado, não exponha filtros sem significado.

Não reproduza `Mesclar orçamentos e produtos`. Em telas menores, detalhe pode usar drawer/painel responsivo, mantendo a linha ativa identificável.

## Operações contextuais

### Orçamento

- abrir o Cadastro no código ativo;
- respeitar Permissão e Situação próprias;
- duplo clique pode executar esta ação;
- ao retornar, preservar filtros e atualizar a linha se necessário.

### Contrato

- habilitar somente com vínculo válido;
- abrir Cadastro/Consulta conforme padrão Laravel existente;
- não inferir Contrato quando não houver vínculo.

### Atendimento

- reutilizar a modal/embed já usada na Consulta de Contratos;
- preencher Cliente/tipo e Orçamento de origem;
- respeitar parâmetro de solicitação de Usuário/senha e Permissão do Atendimento;
- atualizar resumo/detalhe após gravação.

### Consultar Vendas

- abrir a consulta existente para Cliente/tipo da linha ativa;
- definir comportamento quando não houver Cliente ou tipo elegível.

### Ficha Financeira

- abrir para Cliente/tipo da linha ativa;
- respeitar parâmetros, restrições e Autorizações da Ficha;
- não duplicar suas regras dentro da Consulta de Orçamentos.

Cada ação deve informar por que está indisponível, e o backend deve revalidar o contexto.

## Operações em lote

### Cancelar/Excluir

Integre integralmente o spec de F6 Cancelar/Excluir:

- enum `ExclusaoOrcamento`;
- Motivo/descrição;
- Atendimento quando aplicável;
- solicitação de Usuário/senha do Atendimento quando parametrizada;
- Autorização de Gerente de Vendas para múltiplos;
- Permissões;
- Auditoria;
- concorrência, idempotência e resultados individuais.

Remova o `window.prompt` simplificado atual.

### Imprimir

Integre integralmente o spec de impressão:

- modal com `Incluir fotos`, desmarcado;
- foto principal;
- Qualidade da Venda/Analista de Crédito para cada Orçamento;
- um PDF para autorizados;
- resumo dos impedidos.

Após operação em lote, atualizar linhas, totalizadores e seleção com dados autoritativos.

## Permissões e Autorizações

Mapeie e especifique separadamente:

- acessar Consulta;
- visualizar Orçamento;
- abrir/alterar Cadastro;
- abrir Contrato;
- criar/consultar Atendimento;
- consultar Vendas;
- visualizar Ficha Financeira;
- Cancelar;
- Excluir fisicamente;
- Imprimir;
- Autorizações contextuais de Gerente de Vendas, Analista de Crédito e responsável pelo Atendimento.

Ocultar/desabilitar ações na UI não substitui autorização no backend. Diferencie Usuário logado, Usuário autorizador, vendedor e responsável pelo Atendimento.

## Testes obrigatórios

Use como seam principal:

`preencher filtros → Gerar → receber grade e totalizadores → ativar linha → carregar detalhe/Produtos → executar ação contextual ou em lote → observar resultado e estado preservado`.

Cubra:

1. cada filtro isolado;
2. combinações Produto + Fornecedor + Cliente + Atendimento;
3. Filiais autorizadas e tentativa de ampliar acesso;
4. payload versionado inválido;
5. intervalos e operadores inválidos;
6. Gerar explícito e filtros pendentes sem busca reativa;
7. cancelamento da geração;
8. paginação e ordenação;
9. contagem/soma do conjunto completo;
10. ausência de duplicação por joins;
11. linha ativa versus marcadas;
12. selecionar todos e mudança de página;
13. detalhe sob demanda e corrida entre linhas;
14. Produtos e situações A/P/N;
15. parâmetro de situação ligado/desligado;
16. abrir Orçamento por botão e duplo clique;
17. Contrato existente/ausente;
18. Atendimento autorizado/negado e credencial parametrizada;
19. Vendas e Ficha com/sem Cliente elegível;
20. Permissão negada em cada ação;
21. Cancelamento/Exclusão em lote completo;
22. Impressão em lote completa;
23. resultados parciais e concorrência;
24. atualização da grade/totalizadores após mutação;
25. preservação de filtros ao navegar e retornar;
26. teclado, foco, acessibilidade e responsividade.

Prefira Feature tests nos endpoints/aplicação e testes de componente para comportamento visível. Reaproveite testes e contratos da Consulta de Contratos. Não teste métodos privados nem detalhes frágeis da implementação SQL.

## Entregáveis

A especificação deve conter:

- pacote de evidências Delphi fornecido organizado por filtros, resultados e operações, sem nova inspeção do legado;
- inventário Laravel atual e matriz pacote Delphi fornecido × comportamento Laravel localizado, com referências concretas do checkout;
- contrato versionado de filtros;
- estratégia SQL e de desempenho;
- desenho mestre–detalhe;
- contrato de linha ativa/seleção;
- integrações contextuais;
- integração com specs de Cancelamento/Exclusão e Impressão;
- matriz de Permissões/Autorizações;
- critérios de aceitação;
- estratégia de testes;
- riscos e dúvidas não solucionáveis pelo código Laravel;
- lista explícita de bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- copiar a interface Delphi ou mesclar grids;
- duplicar filtros ou SQL existentes na Consulta de Contratos;
- redefinir Cancelamento/Exclusão e Impressão;
- executar ações contextuais sobre múltiplos marcados;
- consultar automaticamente ao alterar filtros;
- alterar Delphi.
```
