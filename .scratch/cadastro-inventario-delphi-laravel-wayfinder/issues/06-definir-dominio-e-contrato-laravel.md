# Definir domínio e contrato Laravel do Cadastro de Inventário

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05

## Question

À luz das pesquisas Delphi, do schema e dos padrões Laravel, qual é o contrato funcional do Cadastro de Inventário? Fixar a identidade do Cadastro, chave primária, Situação, Filial, Produtos e lotes, editabilidade por campo/estado, operações autorizadas, efeitos de estoque, concorrência, auditoria, relatórios, cancelamento de consulta, F6/F7/F9, grid, exportação e fronteiras com consultas e movimentos de estoque.

Separar paridade funcional de correções técnicas necessárias, distinguir Permissão de autorização contextual, explicitar senha/reautenticação e definir o menor conjunto coerente de prompts `/speckit.specify` para handoff.

## Answer

Contrato confirmado com o solicitante, preservando o comportamento funcional do Delphi e aplicando os guardrails Laravel:

- O Inventário é um cadastro agregado com cabeçalho e Itens de Inventário; a identidade é o número gerado na inclusão, pesquisável por F9/Enter e bloqueado depois de carregado. A implementação não deve reproduzir `MAX()+1`; deve usar um alocador atômico compatível com o schema autoritativo.
- Em Situação A, Filial, datas, filtros e itens permanecem editáveis conforme as validações. A edição de item/lote ocorre em modal; a soma dos lotes deve fechar com a quantidade do item. Situações P e T são somente leitura.
- A geração de itens aplica filtros, preserva itens existentes e evita duplicidades. O cadastro guarda a conferência e a intenção de processamento; saldos, reservas, lotes e movimentos permanecem sob as regras compartilhadas do domínio de estoque.
- Operações de consulta, inclusão, alteração, exclusão e geração seguem as permissões do cadastro. O processamento exige autorização contextual de Gerente de Estoque, sem senha adicional não existente no Delphi, e deve ser auditável.
- O processamento continua sendo uma operação distinta de consulta/relatório, com os efeitos IE+, IE-, IR- e IP- atômicos: falha mantém A; sucesso completo muda para P. Não editar movimentos diretamente.
- Gravação e processamento validam Situação e versão dentro da transação. Conflito concorrente rejeita a operação sem sobrescrita silenciosa.
- Relatórios preservam conteúdo, critérios e leiaute Delphi, mas no Laravel são acionados por F6, com Cancelar durante a geração e grid equivalente. F8 permanece reservado ao processamento; F9 usa o modal padrão de pesquisa.
- O grid principal é de consulta/seleção, sem edição direta de células, com modal para itens/lotes e recursos padrão de ordenação, filtros, exportação, personalização e preferências persistidas. A saída do relatório usa o mesmo catálogo/leiaute.
- O snapshot atual é parcial. O prompt deve conter bloqueio explícito: nenhum SQL final ou nome de tabela/coluna pode ser inventado ou fechado antes de novo snapshot da base legada autoritativa.
- O menor conjunto é um prompt principal autocontido em `modules/estoque/cadastro-inventario/`, com referências técnicas aos dossiês; não dividir o contrato funcional em prompts concorrentes nem implementar nesta etapa.
