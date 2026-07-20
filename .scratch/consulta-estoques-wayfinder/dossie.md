# Dossiê — Consulta de Estoques Delphi → Laravel

Status: pronto para `$to-spec`

## 1. Objetivo

Especificar a migração de **Estoques → Consultas** do Delphi para uma nova **Consulta de Estoques** no Laravel, preservando a semântica funcional comprovada e reutilizando a infraestrutura, componentes, cadastros e serviços já existentes.

O Delphi é referência de comportamento, não de arquitetura ou segurança. Bugs, limitações e proteções exclusivamente visuais estão documentados para decisão explícita e não devem ser reproduzidos automaticamente.

## 2. Fontes e rastreabilidade

Fontes Delphi centrais:

- `delphi/apps/estoque/fmconsultaestoque.pas/.dfm`;
- `delphi/apps/estoque/dmconsultaestoque.pas/.dfm`;
- frames de seleção múltipla e units compartilhadas citados nos levantamentos;
- `biblio/clusuario.pas`, `biblio/clparametrossistema.pas` e `repositorio/dmbasico.pas` para Usuário, Parâmetro do Sistema e FilialBase.

Fontes Laravel centrais:

- `backend/app/Http/Controllers/Estoque/AnaliseEstoquesController.php`;
- `backend/app/Http/Requests/Estoque/GerarAnaliseEstoquesRequest.php`;
- `backend/app/Support/Estoque/AnaliseEstoques*`;
- `backend/resources/js/Pages/Cadastros/Estoque/AnaliseEstoques/*`;
- `backend/resources/js/Components/erp/data-grid/*`;
- serviços e endpoints do Cadastro de Produto/Característica;
- testes `backend/tests/Feature/Estoque/AnaliseEstoques*` e testes das abas do Produto.

Levantamentos detalhados:

1. [Interface, abas e filtros](issues/01-inventariar-interface-delphi.md)
2. [Datasets, queries e cálculos](issues/02-inventariar-dados-queries-delphi.md)
3. [Permissões, Autorizações e configurações](issues/03-inventariar-permissoes-parametros-configuracoes.md)
4. [Resultados, operações e integrações](issues/04-inventariar-resultados-operacoes-integracoes.md)
5. [Capacidades existentes no Laravel](issues/05-mapear-capacidades-laravel-existentes.md)
6. [Matriz de paridade, reuso e lacunas](issues/06-construir-matriz-paridade-reuso-lacunas.md)

## 3. Escopo

### Incluído

- Nova página Laravel de Consulta de Estoques.
- Filtros, lookups, defaults, validações, atalhos e fluxo Gerar.
- Resultado mestre e perspectivas de Itens, Lotes, Similares, Grade, Modelos, Componentes e Atributos.
- Detalhes de Estoques, Financeiro, Acumuladores, Preços, Preços por Cargo, Preço por Cliente, Pedidos, Fornecedores e Licitações.
- Cálculos, escopo de Filial, Parâmetros do Sistema, Permissões e escritas iniciadas pela consulta.
- Integrações até o limite de Fotos, histórico fiscal, Pedido e Venda Perdida.
- Reuso obrigatório dos padrões e cadastros Laravel existentes.

### Fora do escopo

- Implementar ou alterar internamente os Cadastros de Produto, Pedido, Venda Perdida, Fornecedor ou Foto.
- Migrar relatórios externos.
- Alterar/corrigir o Delphi.
- Copiar literalmente o layout VCL.
- Tornar exportação ou impressão requisito obrigatório sem decisão de produto.

## 4. Decisão de arquitetura

Criar rota, folha de menu, Policy, FormRequest, controller, service/orquestrador, repositories/assemblers SQL e página Inertia próprios para **Consulta de Estoques**.

Não alterar nem renomear **Análise de Estoques**. Ela é um Relatório temporal distinto, mas fornece:

- `ErpCadastroShell` e `ErpConsultaOperationBar`;
- Gerar por F6, cancelamento, polling e tratamento de timeout;
- filtros estruturados e lookups;
- compiladores SQL com binds;
- `AuthorizedFiliaisCheckList`;
- `ErpPreferenceDataGrid`, catálogos e preferências;
- padrões de Policy/FormRequest/repository/testes;
- exportação síncrona/assíncrona, se adotada como melhoria.

A nova consulta será master-detail:

1. filtros produzem consulta mestre paginada de Produto/Filial;
2. seleção de linha define o Produto ativo;
3. perspectiva externa troca o conjunto mestre/derivado;
4. aba interna requisita seu detalhe apenas quando aberta;
5. respostas obsoletas são canceladas ou descartadas ao mudar Produto, filtros ou perspectiva.

## 5. Fluxo funcional

1. Usuário autorizado abre a Consulta.
2. Backend fornece capabilities, Parâmetros do Sistema relevantes, Filiais autorizadas e catálogos de grid/filtros.
3. Tela inicia em seleção de Item de Produto, perspectiva **Itens do Produto** e detalhe **Estoques**.
4. Usuário informa uma ou mais seleções de cadastro, Filial quando aplicável e flags de Produto.
5. `Gerar` ou `F6` valida o payload e executa a consulta mestre.
6. Resultado vazio mantém/retorna foco aos filtros e mostra estado vazio explícito.
7. Resultado existente seleciona uma linha e permite navegar pelas perspectivas e detalhes.
8. Alterar filtros marca o resultado como desatualizado até novo Gerar.
9. `Esc/Limpar` cancela geração em andamento, invalida resultados/detalhes e retorna foco ao primeiro filtro; não fecha a página web.

`CONFIRMADO` — No Delphi, Gerar insere estatística em `estoques_estatistica` com Produto, data/hora do servidor, FilialBase e Usuário. O spec deve decidir se este efeito é requisito de negócio; se mantido, deve ocorrer no backend com Auditoria adequada.

## 6. Filtros

### Seleção por cadastro

Paridade obrigatória:

- Item de Produto;
- Produto/Característica;
- Grupo;
- Classe;
- Marca;
- Promoção;
- Modelo;
- Especificação de Modelo;
- Localização de Estoque;
- Lote;
- Atributos.

Reusar `ProductFilterPanel`, registries, normalizers, lookup services e `AnaliseEstoquesProductFilterCompiler` para Item, Produto, Grupo, Classe, Marca, Promoção, CST, CSOSN, NCM, Lotes e Atributos. Acrescentar tabs/lookup/compiler compartilhados para Modelo, Especificação e Localização.

O frontend envia apenas regras estruturadas versionadas. É proibido transportar fragments SQL/macros do cliente. O backend valida tab, field, operator e value e compila com binds.

### Filial

- O Delphi aceita Filial vazia; se `FiliaisIndependentes`, oculta o seletor e força `FilialBase`.
- O Laravel já possui `AuthorizedFiliaisCheckList` e `UserBranchAccessService`.
- Toda consulta, lookup e escrita deve limitar Filiais no backend.
- Filial vazia nunca pode significar acesso global.

Recomendação para o spec:

- `FiliaisIndependentes=true`: usar somente FilialBase autorizada e ocultar seleção;
- caso contrário: vazio resolve para Filiais autorizadas ou a seleção torna-se obrigatória; fixar uma única semântica nos critérios de aceite;
- rejeitar com 422 qualquer Filial explícita não autorizada.

### Flags de Produto

Pares Delphi:

- Em linha / Fora de linha;
- Ativo / Inativo;
- Com montagem / Sem montagem;
- Brinde / Não brinde;
- Disponível no site / Não disponível no site.

Em cada par, apenas um lado marcado filtra; ambos ou nenhum não restringem. Incluir `Sem estoque zero`, calculado pelo Saldo de Estoque total equivalente e, em Lotes, pelo saldo do lote.

O Delphi exige alguma seleção múltipla. Recomenda-se preservar uma validação que impeça varredura irrestrita, com mensagem explícita e sem depender apenas do frontend.

## 7. Perspectivas externas

### Itens do Produto

Consulta mestre por Produto/Filial com identificação, descrição, Filial, grades, grupo, marca, peso condicional, situação, promoção, preço, comissão e saldos necessários. Ordenar por descrição normalizada, com FilialBase primeiro dentro do Produto quando aplicável.

### Lotes dos Itens

Por Produto ativo, retornar lote, validade e dados comerciais/fiscais/estoque equivalentes. Deve respeitar as Filiais efetivas; o Delphi possivelmente perde esse filtro, comportamento classificado como bug.

### Produtos Similares

Unir similares por Característica nas duas direções e vínculos explícitos por Produto. Respeitar `agrupamentosimilares` para igualdade de valor de Grade e excluir o Produto original. Enriquecer com saldos, preço e situação.

### Grade de Produtos

Matriz linha × coluna. Cada célula apresenta Produto, `Em estoque/Estoque total` e preço. Selecionar célula redefine o Produto ativo e carrega seus detalhes. Reusar `ProdutoGradeStructureService` e `AgrupamentoGradeUiMapper`.

### Modelos

Lista de Modelos/observações da Característica ativa. Disponibilidade condicionada ao Parâmetro do Sistema de visualização de Modelos.

### Componentes

Visível somente para Produto composto. Retornar componente, quantidade, unidade, preço unitário/total, Grade, situação e estoque. Reusar `ProdutoComposicaoTabReadService`, enriquecendo a leitura.

### Atributos

Exibir nome, descrição e valor. Booleanos como Sim/Não e numéricos conforme locale. Reusar os serviços de atributos do Produto.

## 8. Detalhes internos

### Estoques

Exibir:

- Estoque total;
- Em estoque;
- Danificada;
- Reservado;
- Futuro;
- Demonstração;
- Pedidos;
- Conserto;
- Estoque venda;
- Em trânsito;
- Reserva prévia;
- Estoque físico;
- preço normal, promoção, validade, alteração e descrição;
- localização, mínimo e máximo.

Fórmulas comprovadas:

- Estoque venda = Em estoque + Reservado + Reserva prévia;
- Estoque total = Estoque venda + Em trânsito + Demonstração + Conserto + Danificada;
- custo médio divide Financeiro pela soma de Em estoque, Reservado, Reserva prévia, Trânsito, Demonstração, Conserto e Danificada, retornando zero quando o denominador for zero.

### Financeiro

Somente ability gerencial. Incluir custo médio, Financeiro, alíquota IPI, margem final, últimas entradas/compras/vendas, quantidade da compra, valor da última compra, valores com/sem ICMS, Fornecedor, optante do simples e CST/CSOSN.

Para CSOSN 101/102, última compra com ICMS = valor da última compra + diferença entre preço com e sem ICMS; demais casos usam valor da última compra.

### Acumuladores

Somente ability gerencial. Compras e Vendas mensais por Produto/Filial, com sinal derivado da operação do Movimento e período mais recente primeiro.

### Preços

Alternar entre Preços convencionais e Preços por Cargo conforme Parâmetro do Sistema. Preço por Cliente é aba adicional quando habilitada. Promoção vencida deve ser apresentada como inexistente usando data do servidor.

### Pedidos

Exibir pedidos A/P com quantidade pendente positiva e Notas Pendentes de Entrada, excluindo notas canceladas ou já recebidas. Abrir Pedido pela rota canônica e pelo identificador correto.

### Fornecedores

Somente ability gerencial. Vínculo Produto–Fornecedor, preço, IPI e data da última entrada.

### Licitações

Somente saldo pendente positivo. Exibir Licitação, Cliente, situação, quantidade, saldo, preço, custo/ICMS e total (`saldo × preço`). Somar quantidade, saldo e total no footer.

## 9. Estado visual

Semânticas obrigatórias:

- Produto inativo ou fora de linha deve ser distinguível;
- Produto em promoção deve ser distinguível;
- comissão do Produto/Grupo deve receber destaque próprio;
- célula promocional da Grade deve ser distinguível;
- legenda acessível deve explicar estados.

Não exigir as cores VCL literais. Usar tokens ERP e não depender apenas de cor para acessibilidade. Grade zebrada segue o padrão Laravel; `CorZebradoRelatorio` não precisa ser convertido literalmente sem requisito adicional.

## 10. Permissões e Autorizações

- Criar Permissão/folha de módulo própria para abrir a Consulta.
- Administrador e grants seguem a convenção Laravel existente.
- Mapear `GerenteEstoque` para abilities server-side de visualizar Financeiro, Acumuladores e Fornecedores.
- Criar abilities distintas para alterar mínimo/máximo/localização e alterar valor da última compra.
- O backend deve omitir ou negar dados sensíveis, não apenas ocultar abas.
- Não foi localizada Autorização contextual no Delphi; reautenticação não é requisito de paridade.
- Toda leitura e escrita aplica o escopo de Filial do Usuário.

## 11. Parâmetros do Sistema e ambiente

O backend deve mediar:

- `PrecosporCargo`;
- `PrecoParaCliente`;
- `FiliaisIndependentes`;
- `UsarGradesProdutos`;
- `LiberarVisualizacaodeModelosProdutos`;
- `LiberarVisualizacaoPesoProdutonasPesquisas`;
- `SoVisualizarEstoqueDeposito`;
- `MascaraQuantidadeGrade` e hint de largura;
- existência de CRT simples/normal;
- arredondamento do ECF;
- data/hora do servidor.

`SoVisualizarEstoqueDeposito` restringe somente o detalhe de estoque da Grade a Filiais `tipofilial='D'`, conforme comportamento observado.

## 12. Escritas

### Mínimo e máximo

Endpoint próprio por Produto+Filial, ability, validação e Auditoria. Após sucesso, atualizar o detalhe e a linha afetada.

### Localização

O Delphi libera edição para gerente, mas seu UPDATE não persiste. O spec deve escolher:

- implementar corretamente por Produto+Filial; ou
- manter readonly até requisito confirmado.

Nunca simular sucesso sem persistência.

### Valor da última compra

O Delphi lê Produto+FilialBase e atualiza somente por Produto, possivelmente todas as Filiais. Se mantida, a operação Laravel deve definir explicitamente o escopo de Filial, exigir ability e Auditoria. Recomendação: Produto+Filial efetiva.

## 13. Integrações

- **Fotos:** reutilizar `ProductPhotoGalleryModal` e `ProductPhotosController`, usando Produto da linha ou célula ativa.
- **Venda Perdida:** reutilizar `VendaPerdidaCaptureModal`/opening. Paridade estrita abre inclusão sem preencher Produto; prefill seria melhoria separada.
- **Pedido:** navegar para a rota canônica pelo número do Pedido, com autorização.
- **Histórico fiscal:** criar integração readonly equivalente a Produto + Código da Nota ou reutilizar rota canônica quando identificada; implementação interna do módulo fica fora do escopo.

## 14. Bugs e divergências legadas

Não transformar automaticamente em critérios de aceite:

1. Lotes podem ignorar Filial do mestre.
2. Similar inativo consulta o flag de fora de linha.
3. Localização editável não é persistida.
4. Última compra atualiza todas as Filiais do Produto.
5. Duplo clique em Nota Pendente usa número do dataset de Pedidos.
6. Fornecedor no simples usa comparação `= null`.
7. Ajuste de largura referencia grades diferentes.
8. Booleano de abertura significa “vazio”, apesar do nome.
9. Refazer não fecha todos os datasets dependentes.
10. Laravel Análise de Estoques trata Filiais vazias como ausência de filtro SQL.

Correções de segurança, escopo e persistência são recomendadas. A semântica visível não defeituosa continua obrigatória.

## 15. Oportunidades separadas

- persistência de layout do grid;
- busca global e seletor de colunas;
- paginação server-side;
- resultado stale;
- cancelamento de geração;
- exportação XLSX sync/async;
- filtros E/OU e “exceto” mais expressivos;
- prefill de Venda Perdida;
- acessibilidade superior às cores do Delphi.

Esses itens podem ser adotados, mas devem aparecer no spec como melhoria, nunca como evidência de paridade Delphi.

## 16. Contratos técnicos recomendados

### Carregamento inicial

Fornecer endpoints, capabilities, Parâmetros do Sistema necessários, Filiais autorizadas, tabs disponíveis e catálogos de grid.

### Gerar

Payload versionado contendo Filiais, flags e blocos de regras de Produto. Resposta paginada com linhas mestre, metadados, snapshot de filtros, timestamp do servidor e contexto de exportação opcional.

### Detalhes

Endpoints readonly por perspectiva/aba recebem identidade estável do Produto, Filiais efetivas e contexto mínimo. Resposta inclui capability/estado vazio e não retorna campos gerenciais sem ability.

### Escritas

Endpoints pequenos e idempotência/concorrência conforme padrão do projeto; validação server-side, escopo de Filial, ability e Auditoria.

### Testes mínimos

- acesso ao módulo e abilities gerenciais;
- Filial autorizada, não autorizada, vazia e Filiais independentes;
- validação de seleção obrigatória e pares de flags;
- compiler por cada tab e proteção contra SQL vindo do cliente;
- fórmulas de saldos/custo/preço/promoção;
- cada perspectiva e detalhe sob demanda;
- cancelamento/race ao trocar Produto;
- CRT/ECF/Parâmetros do Sistema;
- escritas com Filial correta e Auditoria;
- contratos de Fotos, Pedido, Venda Perdida e histórico fiscal;
- regressões específicas para os bugs legados decididos.

## 17. Dúvidas que o spec deve fechar

1. Quando Filiais não são independentes e nenhuma é marcada, consultar todas as autorizadas ou exigir seleção?
2. Manter o registro em `estoques_estatistica` ao Gerar?
3. Implementar alteração de localização ou mantê-la readonly?
4. Manter alteração do valor da última compra e qual Filial afetar?
5. Habilitar exportação/persistência de grid já na primeira entrega?
6. Qual rota Laravel canônica abre Pedido por número?
7. Há rota/componente fiscal existente que possa substituir o histórico de notas anterior?

As quatro primeiras alteram comportamento ou segurança e precisam virar decisões/requisitos explícitos no `$to-spec`; as demais podem ser dependências/tarefas de descoberta da implementação.

## 18. Resultado esperado do `$to-spec`

O `$to-spec` deve produzir uma especificação de uma nova Consulta de Estoques Laravel que:

- preserve a paridade funcional confirmada;
- declare o modelo master-detail e carga sob demanda;
- referencie os componentes/serviços Laravel a reutilizar;
- explicite abilities e escopo de Filial;
- converta cada lacuna real em requisito verificável;
- mantenha bugs legados em decisões separadas;
- distinga melhorias opcionais;
- forneça critérios de aceite e testes para filtros, resultados, cálculos, parâmetros, operações e integrações.
