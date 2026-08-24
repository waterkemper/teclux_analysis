# Prompt SpecKit - Adapter do Interpreter IA em Orcamentos

Crie uma especificacao executavel e um plano de implementacao para integrar o novo fluxo Interpreter IA -> PlanValidator -> Executor da Busca Assistida ao Cadastro de Orcamentos.

Use como contrato principal o prompt modules/estoque/busca-assistida-produtos/13-speckit-prompt-interpreter-ia-executor.md. Este prompt escopa apenas o adapter de Orcamentos e nao deve reabrir a arquitetura do nucleo.

## Regra de investigacao

Inspecione o Laravel atual e confirme os seams reais de Cadastro.tsx, ProdutosGrid, BuscaAssistidaPanel, OrcamentoBuscaAssistidaSearchController, OrcamentoBuscaAssistidaSearchService, OrcamentoCargoPriceResolver, OrcamentoProdutoInclusaoService, produto_lookup e autorizacao de fotos/detalhe.

Nao investigue Delphi. Nao reescreva o modal tradicional de bipe. Nao implemente voz de criacao de Orcamento.

## Contexto do adapter

Consultas textuais do vendedor passam pelo Interpreter barato, inclusive erros de linguagem como "baixo de 200". Consultas de codigo/referencia exatos podem usar fast path. O adapter nunca interpreta por regex propria nem duplica o Interpreter.

O fluxo deve ser:

1. receber consulta e contexto autorizado do Orcamento;
2. chamar o Interpreter compartilhado quando necessario;
3. validar o plano no servidor;
4. executar uma unica busca pelo Executor compartilhado;
5. devolver o envelope existente ao painel.

Nao chamar tool como efeito paralelo e nao descartar o resultado estruturado.

## Preco e Filial

- A busca e o detalhe exibem o preco da Filial Base.
- Cliente e Cargo devem participar do preco Cargo-aware.
- Sem Cliente, usar Cargo Tabela Preco Padrao conforme o servico existente.
- O preco da busca deve ser identico ao preco da inclusao.
- A inclusao sempre usa a Filial Base.
- O modelo nao escolhe Cliente, Cargo ou Filial.

Reutilize o servico compartilhado de Cargo/markup/preco usado pelo fluxo tradicional e pelo Executor. Nao duplicar regra em OrcamentoBuscaAssistidaSearchService.

## Estoque

- A apresentacao da busca mostra o total de emestoque somado em todas as Filiais.
- Nao exibir composicao por Filial.
- Nenhuma embalagem, reserva, transito ou conversao participa.
- A funcao de inclusao continua revalidando a disponibilidade na Filial Base.

## Aplicacao e autorizacao

Preserve onApply, currentSelection, handleConfirmProdutoModal, upsert por Produto+Filial, applyProdutosTotais e agendarCascataValores.

Registre e valide o contexto busca_assistida_orcamentos. Capabilities: can_visualizar_precos true para acesso ao Cadastro e can_visualizar_comissoes false.

Falha de interpretacao, baixa confianca ou indisponibilidade deve manter o painel seguro, mostrar clarificacao/fallback e nunca incluir produto ou remover filtro silenciosamente.

## Testes obrigatorios

- Consulta textual com "baixo de 200" gera plano de preco lt 200 e exclui preco acima do limite.
- Preco Cargo-aware na busca coincide com produto_lookup.
- Estoque exibido soma todas as Filiais e inclusao permanece na Filial Base.
- Produto inativo nunca aparece.
- Cliente, Cargo e Filial nao podem ser escolhidos pelo modelo.
- Planner faz uma chamada, Executor uma execucao e o endpoint devolve um envelope.
- Tool/Executor encaminha preco, emestoque, atributos, identificadores e ordenacao.
- Falha/baixa confianca gera clarificacao ou fallback sem inclusao.
- Modal tradicional de bipe e busca tradicional continuam sem regressao.

## Saida esperada do SpecKit

Produza requisitos, contratos HTTP/DTO, componentes e servicos reais a alterar, fases tracer-bullet, riscos, matriz de testes backend/frontend, criterios de aceite e plano de rollout. Nao alterar estoque, precos, Cliente, Cargo ou Filiais por meio da IA.
