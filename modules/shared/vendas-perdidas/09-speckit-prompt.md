# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para implementar no Laravel a funcionalidade reutilizável de Venda Perdida, atualmente existente no Delphi e usada por diversos módulos.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação. Antes de concluir, inspecione o Delphi e o Laravel existentes; se qualquer hipótese deste prompt contrariar o código, corrija-a e registre a divergência com evidência concreta.

## Objetivo de domínio

Venda Perdida é uma ocorrência que registra um único item ou demanda comercial não atendida. Não representa o cancelamento de uma Venda, de um Orçamento ou de um Contrato. Uma mesma negociação pode produzir várias Vendas Perdidas, uma para cada item ou demanda.

A solução deve ser reutilizável por Orçamentos, Contratos, Consulta de Estoque e outros módulos, usando um único núcleo e uma única interface de captura. Não copie regras ou componentes entre módulos.

## Regras de investigação e evidência

Analise conjuntamente PAS e DFM, incluindo:

- `fmVendasPerdidas.pas/.dfm`;
- `dmVendasPerdidas.pas/.dfm`;
- forms e data modules ancestrais;
- frames de pesquisa de Produto, Grupo, vendedor e Venda Perdida;
- queries, SQL, sequence, constraints e tabela `vendasperdidas`;
- eventos de inclusão, pesquisa, gravação, alteração e exclusão;
- actions, botões, menus e atalhos;
- todos os módulos consumidores, não apenas os já localizados;
- Permissões, Autorizações e Parâmetros do Sistema;
- relatórios, filtros, indicadores e eventual uso em DRE;
- triggers e tabelas de Auditoria `_log_new`;
- units e serviços compartilhados.

Compare com o Laravel existente: arquitetura de Vendas e Estoque, Cadastro de Orçamentos, Contratos, Consulta de Estoque, Produto/Grupo, Cliente, Filial, usuários/vendedores, modais reutilizáveis, lookups, policies/Permissões, requests, repositories, Auditoria, testes e relatórios.

Classifique cada conclusão como:

- CONFIRMADO;
- INFERIDO;
- DÚVIDA;
- NÃO LOCALIZADO;
- DIVERGENTE;
- POSSÍVEL BUG LEGADO;
- DECISÃO NOVA.

Toda conclusão deve citar evidência concreta. Não converta automaticamente limitações, código comentado ou bugs do Delphi em requisitos.

## Evidência Delphi já confirmada

- O núcleo está em `fmVendasPerdidas` e `dmVendasPerdidas`.
- A persistência usa `vendasperdidas`; o identificador Delphi usa `vendasperdidas_codigo_seq`.
- Campos localizados: código, Filial, vendedor, grupo, data/hora, observações, Produto, descrição livre do item e descrição livre do grupo.
- Um novo registro recebe Filial base e data/hora do servidor.
- Vendedor é obrigatório e não recebe preenchimento automático no código ativo.
- Observações são obrigatórias.
- O registro aceita Produto cadastrado ou descrição livre de item. Também aceita grupo cadastrado ou descrição livre, conforme o modo do item.
- Ao selecionar Produto com grupo, o Delphi deriva o grupo e bloqueia sua troca naquele fluxo.
- A exclusão exige confirmação e chama uma Autorização contextual por login.
- A gravação não chama essa Autorização no código ativo.
- As linhas que atribuiriam o Usuário autorizador ao vendedor estão comentadas.
- Orçamentos, Contratos e Consulta de Estoque chamam o mesmo formulário com `['Incluir']`.
- Essas três chamadas não enviam Orçamento, Contrato, Cliente nem Produto selecionado; o formulário abre vazio.
- Existe consulta/menu próprio de Vendas Perdidas.
- Não foi localizada implementação equivalente no Laravel.
- Não foram localizados motivo estruturado, concorrente ou Parâmetro do Sistema específico para Venda Perdida.

Confirme todos esses pontos e amplie o inventário antes de fechar a especificação.

## Decisões obrigatórias desta migração

1. Cada Venda Perdida representa exatamente um item ou uma demanda não atendida.
2. Uma negociação pode gerar várias ocorrências independentes.
3. Preservar duas formas de identificação:
   - Produto cadastrado;
   - item não cadastrado, descrito livremente com seu grupo.
4. Não exigir criação prévia de Produto para registrar demanda inexistente no catálogo.
5. Observações livres permanecem obrigatórias.
6. Não criar Cadastro de Motivos, motivo estruturado nem campo de concorrente.
7. Vendedor permanece obrigatório, mas sempre inicia em branco para escolha explícita do usuário.
8. Não preencher vendedor com Usuário logado, vendedor do documento, contexto de origem ou autorizador.
9. A interface recebe, quando disponíveis, módulo e registro de origem, Filial, Cliente, Produto, quantidade e valor.
10. O contexto serve para identificação, exibição e preenchimento dos demais dados aplicáveis; não produz efeitos no documento de origem.
11. Registrar Venda Perdida nunca altera Orçamento, Contrato, Venda, disponibilidade ou saldo de Estoque.
12. Não gerar automaticamente Venda Perdida ao cancelar documento, excluir item ou encontrar indisponibilidade.
13. Implementar um núcleo e uma interface reutilizáveis, com adaptadores finos por módulo consumidor.

## Contrato reutilizável

Especifique um contrato único de abertura da captura contendo apenas dados independentes do consumidor:

- tipo e identidade estável da origem;
- Filial efetiva;
- Cliente/tipo quando identificado;
- Produto selecionado quando houver;
- quantidade relacionada quando houver;
- valor unitário e/ou total relacionado quando houver;
- metadados mínimos de apresentação e retorno.

Defina quais dados são apenas apresentados, quais podem preencher a ocorrência e quais podem ser alterados. Produto recebido deve abrir selecionado, mas o desenho deve permitir registrar a demanda correta sem acoplar o núcleo ao grid de origem. Vendedor sempre deve abrir vazio.

O contrato deve aceitar contexto parcial ou ausente para suportar o menu próprio. Não envie models completos da UI nem faça o núcleo conhecer internamente Orçamento, Contrato ou Estoque.

Defina rastreabilidade da origem sem FK polimórfica frágil. Especifique como manter o histórico se o documento ou Produto de origem mudar ou for excluído, distinguindo referência atual de fotografia necessária para análise.

## Regras da captura

Especifique uma modal ou interface compartilhada, responsiva e acessível, sem copiar o layout Delphi.

Modo Produto cadastrado:

- selecionar por lookup existente;
- persistir a identidade interna do Produto;
- apresentar código visual e descrição;
- derivar Grupo conforme a regra efetiva do Cadastro;
- evitar descrição livre conflitante.

Modo demanda livre:

- permitir descrição do item sem Produto cadastrado;
- exigir a informação de grupo conforme a regra efetiva confirmada;
- permitir Grupo cadastrado ou descrição livre quando isso for compatível com as invariantes confirmadas;
- impedir estados ambíguos ou vazios.

Campos e comportamento:

- vendedor obrigatório e inicialmente vazio;
- observações livres obrigatórias;
- Filial resolvida autoritativamente e exibida;
- data/hora gerada pelo servidor;
- contexto de Cliente, origem, quantidade e valor apresentado quando disponível;
- mensagens de validação próximas aos campos;
- foco inicial previsível e navegação completa por teclado;
- estado de envio e erro recuperável;
- proteção contra duplo clique e submissão repetida;
- cancelar/fechar sem alterar a origem nem criar registro parcial.

Não invente limite de texto, casas decimais ou regras de valor: derive do schema e dos padrões Laravel, registrando dúvidas quando não houver evidência.

## Persistência, compatibilidade e Auditoria

Investigue o schema real de `vendasperdidas`, não apenas os fields persistentes do DFM. Confirme:

- tipos, nulabilidade, defaults e constraints;
- chaves e relacionamentos;
- sequence/geração de código;
- colunas adicionais não expostas na tela;
- triggers e tabela de Auditoria;
- comportamento diante de Produto ou Grupo removido/inativado;
- joins que possam excluir registros com descrições livres;
- compatibilidade de escrita Laravel no banco legado.

Quantidade, valor, Cliente e origem não aparecem entre os fields Delphi já localizados. Como foi decidido preservar esse contexto, proponha a menor extensão coerente do modelo após confirmar o schema. Diferencie claramente:

- dado necessário na própria Venda Perdida;
- fotografia útil para análise histórica;
- dado apenas transitório de interface;
- referência ao documento de origem.

Use transação, idempotência e tratamento de concorrência conforme os padrões existentes do Laravel. Toda inclusão, alteração e exclusão deve participar da Auditoria existente, normalmente baseada em triggers `_log_new`, após comprovação.

## Permissões e Autorizações

Não suponha que a autorização Delphi de exclusão governa também inclusão ou gravação. A evidência atual confirma apenas:

- confirmação antes de excluir;
- chamada de Autorização contextual por login na exclusão;
- ausência dessa chamada na gravação ativa.

Mapeie o controle real de acesso ao menu, formulário e botões. Compare com policies/Permissões Laravel e especifique capacidades separadas para consultar, incluir, alterar e excluir quando isso seguir os padrões existentes.

Defina explicitamente:

- ator autenticado responsável pela Auditoria;
- vendedor comercial escolhido no formulário;
- eventual Usuário autorizador de uma ação privilegiada.

Não trate esses três papéis como sinônimos.

## Consumidores

Inventarie todos os consumidores Delphi. Para cada um, documente:

- onde a ação aparece;
- quando fica disponível;
- se existe Produto ou documento selecionado;
- qual Filial, Cliente, quantidade e valor estão disponíveis;
- comportamento atual ao abrir, salvar e cancelar;
- diferenças entre PAS, DFM e ancestrais.

No Laravel, identifique quais consumidores equivalentes já existem. Planeje a integração pela mesma API/componente, com adaptadores pequenos. Inclua pelo menos, quando existentes:

- Cadastro de Orçamentos;
- Cadastro/Consulta de Contratos;
- Consulta de Estoque;
- consulta/manutenção própria de Vendas Perdidas.

Não bloqueie a especificação pela ausência de um consumidor futuro; mantenha o núcleo extensível sem criar abstrações especulativas além do contrato confirmado.

## Consulta e relatórios

Mapeie a consulta Delphi localizada em `frconsulta`, seus filtros, joins e ordenação. Procure relatórios, indicadores e DRE que leiam `vendasperdidas`.

Especifique apenas consultas e relatórios sustentados por evidência ou necessários para operar o cadastro. Não crie análises por motivo ou concorrente, pois esses conceitos foram recusados. Garanta que registros com descrição livre não desapareçam por `INNER JOIN` obrigatório a Grupo ou Produto; classifique o comportamento legado se isso ocorrer.

## Testes obrigatórios

Use como seam principal o fluxo público reutilizável: abrir a captura por um consumidor real, enviar e observar a Venda Perdida persistida e a origem inalterada.

Cubra no mínimo:

1. Produto cadastrado com Grupo derivado.
2. Demanda livre com item e Grupo válidos.
3. Estados mistos inválidos entre Produto e descrições livres.
4. Vendedor vazio ao abrir, mesmo com usuário/vendedor no contexto.
5. Bloqueio da gravação sem vendedor.
6. Bloqueio da gravação sem observações.
7. Filial correta e data/hora do servidor.
8. Contexto completo, parcial e ausente.
9. Produto selecionado recebido do consumidor.
10. Registro de quantidade, valor, Cliente e origem conforme o modelo finalmente definido.
11. Cancelamento sem gravação e sem alterar a origem.
12. Sucesso sem alterar Orçamento, Contrato ou Estoque.
13. Submissão repetida/idempotente.
14. Permissão concedida e negada para cada ação definida.
15. Confirmação e Autorização aplicáveis à exclusão.
16. Auditoria de inclusão, alteração e exclusão.
17. Concorrência em alteração/exclusão.
18. Consulta incluindo registros com Produto e registros livres.
19. Contrato comportamental compartilhado pelos adaptadores consumidores.
20. Falhas recuperáveis de validação e persistência.

Prefira Feature tests nos limites HTTP/aplicação e testes de componente para comportamento visível. Reaproveite padrões de testes já existentes; não teste métodos privados nem detalhes internos.

## Entregáveis da especificação

A saída do `/speckit.specify` deve conter:

- escopo funcional;
- inventário Delphi completo com mapa de evidências;
- inventário Laravel e análise de lacunas;
- modelo de domínio e invariantes;
- contrato reutilizável e adaptadores consumidores;
- modelo de dados proposto e estratégia de compatibilidade;
- UX e estados da captura;
- Permissões, Autorizações e Auditoria;
- consulta/relatórios sustentados por evidência;
- critérios de aceitação verificáveis;
- estratégia de testes no seam principal;
- riscos, migração e rollout;
- dúvidas realmente não solucionáveis pelo código.

## Fora de escopo

- implementar durante `/speckit.specify`;
- alterar o Delphi;
- transformar cancelamento de documento em Venda Perdida;
- alterar saldos ou disponibilidade de Estoque;
- criar Cadastro de Motivos, motivo estruturado ou concorrente;
- preencher vendedor automaticamente;
- copiar a interface Delphi;
- inventar Parâmetro do Sistema, relatório ou regra de autorização sem evidência.
```
