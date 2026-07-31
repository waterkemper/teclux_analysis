# Classificar lacunas e consolidar o plano de reúso

Type: task
Status: resolved
Blocked by: 04, 05, 06, 07

## Question

À luz das decisões anteriores, qual é a matriz final entre “já existe e pode ser reutilizado”, “existe mas precisa ser aprofundado”, “precisa ser criado” e “fica fora de escopo”, tanto na camada de domínio e persistência quanto na interface do Cadastro?

## Answer

### Diretriz de consolidação

O Cadastro não deve depender de `ConsultaComprasRequisicaoService` nem reutilizar sua tela modal. Os dois fluxos passam a depender de um núcleo neutro de **Requisição entre Filiais**. A extração deve ser incremental e preservar a Consulta de Compras já entregue; componentes cujo contrato já é genérico podem ser usados diretamente, enquanto os componentes prefixados por `ConsultaCompras` só são considerados reutilizáveis depois do aprofundamento indicado abaixo.

### Já existe e pode ser reutilizado

| Camada | Peça existente | Uso no Cadastro |
|---|---|---|
| Domínio | `QuantityDecimal` | Representar e comparar quantidades sem introduzir aritmética de ponto flutuante. |
| Parâmetros | `ParameterService` e `LegacyParameterBooleanValue` | Ler `parametros_valor` por descrição e filial ativa da sessão; vazio, nulo, ausente ou booleano inválido permanece falso. |
| Autorização de filial | `UserBranchAccessService` | Listar e validar filiais requisitantes de `usuariosfiliais`, incluindo a regra já existente de administrador. |
| Auditoria | `DatabaseAuditContext` | Propagar ator, origem e `request_id` dentro da transação PostgreSQL. |
| Persistência auxiliar | `LegacyMotivoRepository` | Resolver e validar motivos do tipo pedido no cancelamento. |
| Interface | `ErpCadastroShell`, `ErpCadastroCommandBar`, `useRegistryCadastroShortcuts` e estado de cadastro | Estruturar os modos Novo, Editando aberta e Somente leitura e os atalhos F3/F5/F6/F9/Esc. |
| Interface | `ErpRegistryOperationFeedback` | Exibir sucesso, erro, conflito e alerta persistente de divergência da Reserva Prévia. |
| Interface | `CatalogCodeLookup`, `ErpCadastroLookupModal` e `ErpTwoColumnCatalogLookupModal` | Infraestrutura dos lookups, mantendo fontes e contratos próprios do Cadastro. |
| Infraestrutura | transações Laravel, `lockForUpdate` e `EncodingSanitizer` | Atomicidade, locks de linha e compatibilidade de texto legado. |

### Existe, mas precisa ser aprofundado

| Peça atual | Lacuna constatada | Destino do aprofundamento |
|---|---|---|
| `ConsultaComprasRequisicaoParameterManifest` | Usa `Transferir_Produtos_Compostos`, `Permitir_Requisicoes_de_Produtos_Duplicadas` e `RequisicaoSubtraiEstoque`, que não são as descrições literais Delphi. Também não reúne `USAR GRADES PRODUTOS`. | Tornar manifesto neutro e usar literalmente `Transferir Produtos Compostos`, `Permitir requisições de produtos duplicadas`, `REQUISICAOSUBTRAIESTOQUE`, `Informar o motivo do cancelamento do pedido` e `USAR GRADES PRODUTOS`, sempre pela filial ativa da sessão. |
| `LegacyPedidosFiliaisRepository` | Já inclui, localiza aberta, soma e cancela, mas seus métodos atendem principalmente ao lote da Consulta; não oferecem carga detalhada, edição por delta, lock do agregado nem revisão pelo log. | Tornar repositório neutro, preservar criação/soma da Consulta e adicionar carga por `(requisitante, codigo)`, edição, cancelamento completo, lock e consulta da Revisão da Requisição. |
| `LegacyConsultaComprasRequisicaoMovimentoWriteRepository` | Já ordena locks e grava TEP/TPE/TFR, porém usa `REQ <codigo>` no TEP, libera a quantidade pedida sem limitar pela Reserva Prévia e não implementa toda a troca/edição. | Renomear/aprofundar como infraestrutura neutra; revalidar saldos após locks, resolver filial física, operar por delta, limitar liberação, priorizar Venda Futura e padronizar referências Delphi. |
| `ConsultaComprasRequisicaoService` | Mistura preview/alocação em lote com persistência compartilhável; verifica alguns saldos e duplicidades antes da transação; soma duplicata automaticamente; fixa a requisitante na filial da sessão; não possui edição e não aplica o novo contexto de auditoria. | Separar a orquestração específica da Consulta dos comandos transacionais neutros de criar, alterar e cancelar. A Consulta mantém seu preview, candidatas, snapshots e soma; ambos passam a usar o mesmo núcleo de persistência, parâmetros, locks e movimentos. |
| Repositórios de candidatas/estoque da Consulta | Possuem SQL útil para filial física e saldo, mas os resultados são projeções do motor de sugestão. | Extrair somente resolução de filial física, existência do produto e leitura bloqueável do estoque; não levar candidatas, cobertura ou sugestão ao Cadastro. |
| `EstoqueConsultaComprasModuleAccessService` e padrão de módulos | O mecanismo `acessosmodulos`/`usuariosacessosmodulos` está pronto, mas a rota identifica outro módulo. | Reaproveitar o padrão, criando identidade de módulo própria para Interlojas → Requisição para Exposição. |
| Padrão `clientes_log_new` | Tabela, gatilho, contexto e testes constituem precedente, não uma auditoria de requisições pronta. | Replicar o padrão para `pedidosfiliais_log_new`, preservando `pedidosfiliais_log`, e usar o último `trigger_id` do conjunto como revisão comum ao Delphi e Laravel. |
| Modal `RequisicaoEntreFiliaisModal` | Confirma que os tipos, mensagens e feedbacks de requisição existem, mas é uma UI de distribuição em lote dependente da Consulta. | Reaproveitar apenas linguagem visual e padrões de feedback; não importar estado, DTO, cálculos de cobertura ou composição da modal. |

### Precisa ser criado

#### Núcleo compartilhado

- namespace neutro de Requisição entre Filiais, sem dependência da Consulta;
- resolvedor único dos cinco parâmetros literais;
- comandos transacionais de criar, alterar e cancelar, recebendo ator e filial ativa, mas revalidando autorização e parâmetros no servidor;
- lock transacional determinístico da tríade `(produto, requisitante, requisitada)` para duplicidade;
- edição por delta, troca atômica de produto/filial e política de liberação limitada com prioridade da Venda Futura;
- leitura da revisão agregada pelo maior `trigger_id` de `pedidosfiliais_log_new`;
- resultado estruturado para conflito, estoque insuficiente e alerta de Reserva Prévia divergente;
- migrações de `pedidosfiliais_log_new`, função/gatilho PostgreSQL e suporte equivalente nos testes SQLite;
- testes de regressão que provem que a Consulta continua somando duplicata quando configurada para isso.

#### Backend específico do Cadastro

- módulo e serviço de acesso próprios;
- controller, Form Requests, policy/gate e rotas próprias;
- endpoints de ficha nova, carga direta, gravação, cancelamento e pesquisa F9;
- endpoints próprios para filiais requisitantes, filiais requisitadas, produtos e motivos;
- SQL/projeção detalhada da ficha, incluindo dados somente leitura de recebimento e nota fiscal;
- pesquisa de produto por código visual ou barras, exigindo `estoques` na filial física da requisitada e respeitando compostos/grades;
- pesquisa de abertas limitada à requisitante escolhida e ordenações Delphi já definidas;
- validação autoritativa de situação aberta, filial autorizada, produto elegível, quantidade inteira positiva, observação/motivo e revisão.

#### Interface específica do Cadastro

- página própria em `Pages/Interlojas/RequisicaoParaExposicao`, baseada no shell de cadastro;
- formulário unitário com cabeçalho, participantes, produto, quantidade, observação, contexto de estoque e resultado de recebimento/NF;
- modos Novo, Editando aberta e Somente leitura;
- dependências e limpeza entre requisitante, requisitada, produto e quantidade;
- lookups específicos e pesquisa F9;
- confirmação de descarte e cancelamento, captura de motivo conforme parâmetro e tratamento de duplicidade oferecendo abrir a existente;
- apresentação de conflito de revisão e alerta persistente de liberação parcial da Reserva Prévia;
- registro do item de menu sob Interlojas → Requisição para Exposição.

### Fora de escopo

- transformar o Cadastro em consulta histórica geral;
- separação, transferência, expedição, recebimento e alteração de `qtderecebida`;
- preview, candidatas, cobertura, sugestão, distribuição em lote e snapshots da Consulta de Compras;
- pedido de compra, fornecedor, NF-e pendente e demais painéis da Consulta;
- DTO, controller, policy ou tela universal para Consulta e Cadastro;
- cópia da modal da Consulta como tela do Cadastro;
- propriedade exclusiva por sistema de origem, requisição parcial ou senha de supervisor;
- reescrever o Delphi, `pedidosfiliais_log` ou movimentos legados `REQ <codigo>`;
- aceitar parâmetros, autorização, número ou decisão de estoque enviados pelo frontend.

### Divisão para publicação SpecKit

Publicar em `modules/interlojas/requisicao-para-exposicao/`, separado de `modules/estoque/consulta-compras/`, porque o menu, a jornada e a autorização de entrada pertencem a Interlojas. O vínculo com a Consulta fica explícito nos contratos compartilhados, não na localização dos artefatos.

Planejar três comandos `/speckit.specify`, executáveis em ordem:

1. **Aprofundar o núcleo compartilhado de Requisição entre Filiais** — parâmetros literais, persistência, movimentos, locks, duplicidade, revisão por log, auditoria e adaptação sem regressão da Consulta de Compras.
2. **Implementar o backend do Cadastro Requisição para Exposição** — módulo, autorização, rotas, requests, comandos, projeções, pesquisas e lookups próprios.
3. **Implementar a interface Requisição para Exposição e fechar a integração** — página, estados, campos, atalhos, modais, feedbacks, menu e integração com os endpoints.

Os critérios e a matriz de testes de cada comando serão detalhados em **Definir critérios de aceite e testes** antes da publicação.
