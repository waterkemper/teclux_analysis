# Correção de paridade das abas da Consulta de Estoques

Status: ready-for-agent

## Problem Statement

A Consulta de Estoques Laravel já oferece geração da consulta, resultado mestre e detalhes carregados sob demanda, mas cinco abas ainda divergem das informações e regras operacionais esperadas pelos usuários do sistema.

Na aba Estoques, o resumo de Pedidos não representa corretamente o saldo pendente por Filial, a metadata visual dos preços está incompleta e valores sensíveis podem atravessar um contrato não gerencial. Acumuladores reconstrói o histórico usando o cadastro atual do Tipo de Movimento e agrega dados em memória, o que pode reclassificar lançamentos antigos e degradar desempenho. Financeiro não apresenta integralmente Fornecedor, Nota e tributação, mantendo campos fiscais incompletos ou fixos. Preços por Cargo está declarado por parâmetros, mas não calcula nem exibe os Cargos. Pedidos usa a quantidade original como se fosse saldo pendente e representa as NFe pendentes por uma fonte provisória que não corresponde aos documentos SEFAZ ainda não lançados.

Essas divergências prejudicam decisões de compra, venda e reposição, podem misturar informações de Filiais, ocultam dados fiscais importantes e criam risco de exposição de preços e informações gerenciais a usuários sem a capability adequada.

## Solution

Corrigir as cinco abas dentro da Consulta de Estoques existente, preservando a rota lazy, a identidade Produto+Filial, o motor de preços, o calculador de saldos, as policies, as mutações auditadas, o hook de carregamento e os componentes compartilhados.

Cada detalhe terá contrato tipado, autorização aplicada antes da consulta e regras explícitas de Filial, nulabilidade, formatação e vazio. Estoques manterá as fórmulas de saldo já corretas e passará a apresentar preços completos e Pedidos pendentes coerentes. Acumuladores agregará o snapshot de operação dos Movimentos diretamente no PostgreSQL. Financeiro passará a resolver a última Nota, o Fornecedor e os dados fiscais da Filial selecionada. Preços alternará de forma explícita entre o modo convencional e o modo por Cargo, calculado pelo motor legado. Pedidos separará pedidos comerciais pendentes de NFe SEFAZ ainda não lançadas e limitará ambas as listas às Filiais autorizadas.

A solução não dependerá de investigação no Delphi e não criará um módulo paralelo.

## User Stories

1. Como usuário da Consulta de Estoques, quero abrir cada aba somente quando necessário, para que a tela continue responsiva mesmo com muitos Produtos.
2. Como usuário, quero que a aba ativa sempre corresponda ao Produto e à Filial selecionados, para que eu não tome decisões sobre uma resposta atrasada de outra seleção.
3. Como usuário, quero que a troca rápida de Produto, Filial ou aba descarte requisições obsoletas, para que dados antigos não substituam o contexto atual.
4. Como usuário, quero que uma seleção removida da grade limpe os detalhes, para que informações do Produto anterior não permaneçam visíveis.
5. Como usuário autorizado a uma Filial, quero consultar apenas dados permitidos para meu escopo, para que informações de outras Filiais não sejam reveladas.
6. Como usuário sem acesso gerencial, quero que Financeiro e Acumuladores não sejam oferecidos nem retornados, para que dados confidenciais permaneçam protegidos.
7. Como usuário sem permissão de preços, quero usar os saldos de Estoques sem receber valores de preços, para que a capability seja respeitada pelo servidor e pela interface.
8. Como usuário de Estoques, quero ver Em estoque, Reservado, Reserva prévia, Demonstração, Conserto, Em trânsito, Danificada e Futuro, para entender a composição operacional do saldo.
9. Como usuário de Estoques, quero ver Estoque físico, Estoque venda e Estoque total com as fórmulas corporativas, para comparar posições sem cálculos manuais.
10. Como usuário, quero que Reserva prévia participe do Estoque venda e do total, para que a disponibilidade reflita a regra vigente.
11. Como usuário, quero que Futuro e Estoque físico não sejam somados indevidamente aos totais calculados, para evitar saldos inflados.
12. Como usuário, quero ver o resumo de Pedidos pendentes da Filial selecionada, para avaliar demanda ainda não atendida naquele estoque.
13. Como usuário em contexto de Filiais Independentes, quero ver um consolidado somente das Filiais que posso acessar, para obter visão ampla sem vazamento de autorização.
14. Como usuário, quero saber se o resumo de Pedidos é por Filial ou consolidado, para interpretar corretamente o número apresentado.
15. Como usuário autorizado a preços, quero ver preço normal, alteração, descrição, promoção e validade, para conhecer a condição comercial vigente.
16. Como usuário, quero que promoção vencida não seja apresentada como preço válido, para evitar decisões com valor expirado.
17. Como gerente de estoque, quero consultar Compras e Vendas mensais do Produto na Filial, para analisar seu histórico de movimentação.
18. Como gerente de estoque, quero que Acumuladores use a operação registrada em cada Movimento, para que mudanças posteriores no cadastro não reescrevam o histórico.
19. Como gerente, quero os períodos ordenados do mais recente para o mais antigo, para acessar rapidamente a movimentação atual.
20. Como gerente, quero que meses sem Compras ou Vendas não sejam inventados, para que a tabela represente apenas atividade real.
21. Como gerente, quero que movimentos compensados até zero continuem representados no mês, para distinguir ausência de atividade de compensação real.
22. Como gerente, quero ver Custo médio e Financeiro coerentes com os saldos, para avaliar o valor do estoque.
23. Como gerente, quero ver IPI e Margem final como percentuais, para interpretar corretamente esses indicadores.
24. Como gerente, quero ver datas e quantidade da última compra, última entrada e última venda, para entender a recência operacional.
25. Como gerente, quero ver valores da última compra com e sem ICMS, para conferir a composição do custo.
26. Como gerente, quero ver o Fornecedor e a última Nota de entrada de compra da Filial selecionada, para rastrear a origem do custo.
27. Como gerente, quero ver CST e CSOSN da empresa, da Nota do Fornecedor e do Produto, para conferir o tratamento tributário.
28. Como gerente autorizado, quero ajustar o valor da última compra apenas para o Produto e Filial selecionados, para corrigir o custo sem afetar outras Filiais.
29. Como auditor, quero que a alteração da última compra registre usuário, identidade, antes e depois, para manter rastreabilidade.
30. Como usuário autorizado a preços, quero que o parâmetro Preços por Cargo determine claramente o modo da aba, para não misturar cálculos convencionais e por Cargo.
31. Como usuário, quero ver Cargo, descrição e valor calculado para cada vínculo do Produto, para consultar a política comercial por função.
32. Como usuário, quero que o preço por Cargo seja calculado com o markup e o estoque da Filial selecionada, para obter o valor correto daquele contexto.
33. Como usuário, quero que ausência de vínculos por Cargo seja informada como vazio legítimo, para distinguir configuração inexistente de falha do sistema.
34. Como usuário, quero que um vínculo com valor indisponível permaneça visível, para identificar que o Cargo está configurado, mas o cálculo não produziu preço.
35. Como usuário, quero que o modo Cargo não misture promoção convencional, para não comparar regras de preço incompatíveis.
36. Como usuário, quero ver somente Pedidos comerciais em situações abertas ou pendentes, para focar demanda ainda válida.
37. Como usuário, quero ver o saldo pendente calculado após atendimentos parciais, para não confundir quantidade original com necessidade restante.
38. Como usuário, quero ver Filial de entrega e previsão de cada Pedido, para saber onde e quando a demanda deverá ser atendida.
39. Como usuário, quero ver o total pendente das Filiais autorizadas, para dimensionar a demanda consolidada acessível.
40. Como usuário com acesso ao cadastro de Pedido, quero abrir o Pedido pelo número interno, para investigar seus detalhes.
41. Como usuário sem acesso ao cadastro de Pedido, quero continuar vendo a linha sem link indevido, para consultar o saldo sem obter uma ação não autorizada.
42. Como usuário, quero ver separadamente NFe pendentes de entrada identificadas no SEFAZ, para antecipar mercadorias ainda não lançadas.
43. Como usuário, quero que NFe já lançadas ou canceladas sejam excluídas, para evitar entradas duplicadas ou inválidas.
44. Como usuário, quero ver Filial, Fornecedor, Série, Número, Situação e Emissão da NFe pendente, para reconhecer o documento.
45. Como usuário, quero que uma NFe reconhecida por múltiplos critérios apareça uma única vez, para evitar duplicidade na consulta.
46. Como usuário, quero que NFe de Filiais não autorizadas não apareçam, para preservar o isolamento organizacional.
47. Como usuário, quero que NFe pendente não abra um histórico fiscal de uma Nota interna inexistente, para evitar navegação incorreta.
48. Como usuário, quero mensagens vazias específicas para Pedidos e NFe, para entender qual conjunto não possui dados.
49. Como usuário, quero que zero seja exibido como valor real e ausência como travessão, para não confundir falta de informação com saldo zerado.
50. Como operador, quero que quantidades, moeda, percentuais, datas e códigos usem formatação apropriada, para ler os dados sem ambiguidade.
51. Como suporte, quero que falhas de função, tabela ou SQL sejam reportadas como erro operacional, para não diagnosticar infraestrutura quebrada como vazio de negócio.
52. Como mantenedor, quero contratos nominais por aba, para que backend e React não divirjam silenciosamente.
53. Como mantenedor, quero reutilizar os seams e componentes existentes, para corrigir a paridade sem duplicar infraestrutura.
54. Como mantenedor, quero testes de isolamento entre duas Filiais em cada detalhe, para impedir regressões de escopo.
55. Como mantenedor, quero testes PostgreSQL para funções e consultas legadas críticas, para validar comportamento que não pode ser reproduzido fielmente em banco simplificado.

## Implementation Decisions

- A Consulta de Estoques existente será modificada; nenhum módulo paralelo será criado.
- A rota lazy por Produto, Filial e detalhe permanecerá como interface principal das cinco abas.
- O serviço de detalhe continuará como dispatcher e aplicará, nesta ordem, validação do detalhe, acesso ao módulo, autorização da Filial, existência da relação Produto+Filial e capability específica antes de consultar dados.
- Repositories cuidarão de SQL e persistência; não receberão usuário nem decidirão autorização. Controllers não conterão regras SQL.
- Toda resposta de detalhe repetirá Produto e Filial. Pedidos também declarará que suas linhas cobrem Filiais autorizadas.
- O hook de detalhe manterá uma chave composta por Produto, Filial e aba, cancelará a requisição anterior e publicará apenas respostas da geração e identidade ativas.
- Não haverá cache indefinido de detalhes mutáveis. Mutações e nova geração invalidarão os snapshots afetados.
- Financeiro e Acumuladores exigirão acesso gerencial. Qualquer preço exigirá a capability de visualizar preços. A alteração da última compra exigirá acesso gerencial e capability própria. Localização e limites manterão sua capability específica.
- Campos sensíveis serão omitidos no servidor quando não autorizados; ocultação no React não será tratada como segurança.
- Parâmetros serão resolvidos por um manifesto central no contexto da Filial selecionada. A Filial ativa da sessão não substituirá silenciosamente a Filial da linha.
- O parâmetro Preços por Cargo definirá um modo discriminado convencional ou Cargo. Filiais Independentes definirá explicitamente resumo de Pedidos por Filial ou consolidado autorizado.
- Os cinco detalhes terão contratos nominais no backend e TypeScript. Os painéis não aceitarão objetos desconhecidos.
- Números permanecerão numéricos, booleanos permanecerão booleanos, datas serão ISO anuláveis e códigos/chaves serão texto. Ausência será nula e distinta de zero ou falso.
- O cálculo do Estoque venda continuará somando Em estoque, Reservado e Reserva prévia.
- O cálculo do Estoque total continuará somando Estoque venda, Trânsito, Demonstração, Conserto e Danificada. Futuro e Estoque físico não participarão.
- O Custo médio será Financeiro dividido pelo mesmo denominador do Estoque total, retornando zero quando o denominador for zero. O frontend não recalculará valores de domínio.
- A aba Estoques exibirá quantidades e preços; Localização, Sublocalização, Mínimo e Máximo permanecerão no grid mestre e na mutação existente. Financeiro e Custo médio terão como único dono visual e contratual a aba gerencial Financeiro.
- O painel de preços em Estoques incluirá preço normal, alteração, descrição, preço promocional e validade. Promoção vencida não fornecerá valor promocional vigente.
- O resumo de Pedidos em Estoques usará a regra canônica de pendência da Filial selecionada. No modo consolidado, somará apenas Filiais autorizadas e informará modo e Filiais consideradas.
- Acumuladores será agregado no PostgreSQL por Produto, Filial e mês civil, usando o snapshot de operação gravado em cada Movimento.
- Vendas serão classificadas pela posição 13 da operação: símbolo positivo usa valor absoluto e símbolo negativo inverte a quantidade conforme a expressão legada.
- Compras serão classificadas pela posição 14: símbolo positivo usa a quantidade e símbolo negativo usa o negativo do valor absoluto.
- Somente símbolos positivo ou negativo participarão. Meses sem atividade não serão criados; um mês com atividade que resulte em zero será preservado.
- A resposta de Acumuladores conterá Filial, período canônico, Compras e Vendas, ordenados do mais recente para o mais antigo. Não haverá total geral nem acumulado progressivo.
- Financeiro retornará custos, IPI, margem, dados da última compra, últimas datas, última Nota, Fornecedor, indicador de Simples e os códigos fiscais da empresa, Fornecedor e Produto.
- Para CSOSN atual 101 ou 102, última compra com ICMS somará ao valor da última compra a diferença entre os preços com e sem ICMS. Para os demais códigos, manterá o valor da última compra.
- Margem final será calculada sobre o preço efetivo vigente e o Custo médio; ficará nula quando não houver preço utilizável.
- A última Nota de entrada de compra será resolvida deterministicamente para o Produto e a Filial selecionada, excluindo fornecedor do tipo não comercial definido pelo legado. Não haverá fallback para Nota de outra Filial.
- A alteração da última compra continuará atualizando somente a chave Produto+Filial, com validação decimal, transação, auditoria, idempotência e snapshot atualizado. Uma atualização sem linha não será sucesso silencioso.
- No modo Cargo, a relação Produto-Cargo e o cadastro de Cargo fornecerão código, descrição e markup. O valor será calculado pela função corporativa de preço com Produto, Filial selecionada e markup.
- A implementação não usará uma coluna de preço do vínculo Cargo nem reimplementará a função em PHP ou TypeScript.
- Promoções convencionais não participarão do modo Cargo. Sem vínculos será vazio válido; vínculo cujo cálculo seja nulo continuará listado.
- Preço por Cliente continuará reconhecido como modo adicional, mas seu preenchimento não será fingido com arrays vazios e não integra o escopo funcional desta correção.
- Pedidos comerciais serão filtrados por Produto, situações abertas/pendentes e Filial de entrega autorizada. O saldo será calculado pela função corporativa que considera atendimento parcial.
- Somente saldo pendente positivo permanecerá. A previsão priorizará a data do item e usará a data do Pedido como fallback.
- A grade exibirá Pedido, Filial, saldo pendente e previsão, além do total pendente das Filiais autorizadas.
- A navegação de Pedido usará rota nomeada e dependerá da autorização do destino; URLs não serão concatenadas no componente.
- NFe pendentes virão dos documentos e itens SEFAZ, associados a Fornecedor e Filial pelos CNPJs, e reconhecidos como Produto pelos vínculos do Fornecedor ou código de barras.
- NFe já lançadas, canceladas por situação ou evento e pertencentes a Filial não autorizada serão excluídas. Múltiplos critérios verdadeiros não duplicarão a mesma identidade documental.
- A identidade de NFe pendente será composta pela Filial, tipo, NSU e chave. Ela não será tratada como Nota interna já persistida.
- Não será oferecido link de histórico fiscal interno para uma NFe ainda não lançada. Um link só poderá existir se já houver viewer SEFAZ readonly compatível com sua identidade.
- Componentes existentes de painel e campo serão reutilizados. Uma tabela readonly leve poderá ser compartilhada por Acumuladores, Cargo e Pedidos sem centralizar regras de domínio.
- Quantidade usará a máscara configurada; moeda, percentual, data e data-hora usarão helpers comuns. Códigos documentais não perderão zeros.
- Ausências estruturais não serão convertidas em arrays vazios por introspecção de schema durante requests.
- Respostas de autorização e escopo não revelarão existência de dados fora do acesso do usuário. Erros operacionais registrarão request ID sem expor detalhes técnicos ao cliente.
- Nenhuma alteração de schema ou de funções PostgreSQL está prevista. Caso a inspeção do Laravel demonstre ser indispensável, a especificação de implementação deverá justificar e isolar essa mudança antes de executá-la.

## Testing Decisions

- O seam principal será a rota lazy autenticada de detalhe, pois observa simultaneamente autorização, Filial, composição do serviço, repository, mapeamento e contrato JSON. A maior parte dos critérios de negócio deverá ser comprovada por testes Feature nesse nível.
- Cada aba terá ao menos um cenário com duas Filiais contendo dados diferentes e um usuário sem acesso a uma delas. O teste verificará tanto linhas quanto totalizadores e campos omitidos.
- Testes de segurança verificarão ausência efetiva de valores sensíveis no JSON e nas props, não apenas invisibilidade da aba.
- O calculador de saldos e as fórmulas de ICMS permanecerão cobertos por testes unitários puros, incluindo cada parcela, denominador zero, nulos e valores negativos relevantes.
- Acumuladores terá testes de integração que comprovem snapshot de operação, posições 13 e 14, sinais, múltiplos Movimentos no mês, virada de ano, símbolos irrelevantes, compensação até zero e ordenação.
- As consultas críticas e funções corporativas de preço e Pedidos serão testadas em PostgreSQL compatível. Testes em banco simplificado não serão considerados prova de equivalência dessas funções.
- Financeiro terá cenários de CSOSN 101, 102 e outros, Nota/Fornecedor por Filial, ausência legítima de Nota, quatro códigos fiscais independentes, IPI e margem.
- A mutação de última compra será testada pela interface HTTP: capabilities, validação, chave Produto+Filial, outra Filial intacta, auditoria, idempotência, conflito/ausência e snapshot recalculado.
- Preços por Cargo terá cenários de parâmetro divergente entre Filiais, markups distintos, função de cálculo, ordenação, zero, nulo, vazio e ausência de promoção no modo Cargo.
- Pedidos terá saldo parcial diferente da quantidade original, situações incluídas/excluídas, previsão do item e fallback, Filiais autorizadas, total e navegação condicionada.
- NFe pendentes terá um cenário para cada forma de reconhecimento do Produto, deduplicação, documento já lançado, cancelamento por situação, cancelamento por evento, Fornecedor incompatível e Filial não autorizada.
- O hook React será testado para troca rápida de Produto, Filial e aba, cancelamento, geração obsoleta, limpeza da seleção e tratamento de respostas 403, 404 e 5xx.
- Os painéis serão testados por comportamento observável: papéis acessíveis, rótulos, células, formatos, null versus zero, mensagens vazias, modos e links. Não serão usados snapshots extensos como principal evidência.
- O container terá teste de aba proibida ausente e fallback seguro para Estoques antes do request.
- Testes de query ou telemetria assegurarão ausência de N+1 nas listas por Cargo, Pedidos e NFe, além de agregação de Acumuladores no banco.
- Os testes existentes de consulta mestre, filtros, seleção, lazy loading, Filial e mutações deverão continuar passando para comprovar ausência de regressão fora das abas.

## Out of Scope

- Reimplementar a geração da Consulta de Estoques ou seus filtros.
- Alterar o resultado mestre, exceto preservar Localização, Sublocalização, Mínimo e Máximo e sua mutação já existente.
- Revisar a lupa enriquecida ou seus lookups.
- Revisar Lotes, Similares, Grade, Modelos, Componentes, Atributos, Fornecedores, Licitações ou Fotos.
- Implementar Preço por Cliente nesta entrega.
- Criar manutenção ou edição de Preços por Cargo dentro da Consulta.
- Reprojetar visualmente todo o módulo.
- Alterar o Delphi ou depender de acesso ao seu código durante a implementação.
- Afrouxar autorização de Filial, dados gerenciais, preços ou auditoria para reproduzir comportamentos inseguros do legado.
- Alterar schema ou funções de banco sem demonstração explícita de necessidade.

## Further Notes

- O Laravel atual é a fonte de verdade para nomes e organização das classes a modificar. A implementação deve inspecionar o estado corrente antes de editar e preservar seams existentes que já atendam ao contrato.
- A equivalência buscada é funcional e segura, não cópia literal de falhas do legado. Foram deliberadamente rejeitados update de última compra somente por Produto, escolha global de última Nota sem Filial, consolidação sobre Filiais não autorizadas e navegação de NFe pendente como Nota interna.
- O prompt corretivo e o dossiê do Wayfinder permanecem como material de contexto, mas esta PRD é suficiente para implementação sem acesso ao Delphi.
- Ordem recomendada: firmar DTOs e AuthZ; corrigir repositories e fórmulas; atualizar painéis tipados; corrigir navegações e mutações; executar a matriz transversal de segurança, Filial, corrida e desempenho.
