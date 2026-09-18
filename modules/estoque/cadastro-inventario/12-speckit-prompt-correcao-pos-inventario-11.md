# Prompt corretivo 12 — revisão pós-inventário 11

## Contexto

Revise a implementação atual do Cadastro de Inventário no Laravel, commit af41b0b0b, após o prompt corretivo 11 e a especificação laravel/specs/488-fix-inventario-residuals/. Use os artefatos em modules/estoque/cadastro-inventario/. Não solicitar inspeção direta dos fontes Delphi. Este prompt é residual: preserve as correções existentes e corrija as divergências abaixo.

O fluxo do operador continua sendo um único comando Processar. A prévia pode ser interna para validação e autorização, mas não criar botão separado de Simular processamento.

## Correções obrigatórias

### 1. Interpretar a operacao gerada pelo banco

O Delphi grava os dados de entrada do movimento e o trigger/rotina autoritativa gera ou
normaliza movimentos.operacao e movimentoslotes.operacao. O Laravel não deve montar,
alterar ou substituir essa máscara e não deve consultar uma tabela tiposmovimentos para
recriar a regra sem evidência no schema/SQL capturado.

O cálculo atual de InventarioFotografiaCampos::movimentadoAssinado() considera apenas
posteriores_emestoque e não reproduz o SQL legado. Depois que o banco persistir operacao,
F6, prévia e processamento devem ler e interpretar a máscara persistida exatamente como o
Delphi:

- posição 1: sinal + soma e sinal - subtrai;
- posição 2: sinal + soma e sinal - subtrai;
- posição 3: considerar somente o sinal - conforme o SQL capturado, pois o sinal + está
  comentado;
- posição 9: sinal + soma e sinal - subtrai.

Não usar SUM(quantidade) simples, não usar tipomovimento como substituto de operacao e não
inventar mapeamento para outras posições. Documentar o mapeamento comprovado e aplicar a
mesma expressão assinada em F6, prévia interna, plano de processamento, movimentos e
movimentoslotes, inclusive nos campos movimentado, diferenca, saldo após processamento e
campos de processamento.

Manter a janela de projeção da spec: movimentos com data posterior à Data do Inventário e
até a Data do Processamento, inclusive. Concorrência por processamento/datahoraalteracao é
conceito separado e não pode ser somada novamente. Testar o resultado da operação persistida
após o trigger, posições, sinais, datas-limite e lote. Em SQLite, quando o trigger legado
não existir, separar o teste de compatibilidade da infraestrutura do teste funcional
PostgreSQL; não criar geração alternativa de operacao no Laravel.

### 2. Concorrência de lotes deve bloquear Processar

O plano usa somente concorrência do produto. Uma alteração posterior em movimentoslotes, relacionada a Produto, Filial e Lote do item, deve ser detectada e bloquear Processar como movimentos.

Obrigatório:
- agregar movimentos e movimentoslotes sem N+1;
- separar projeção, concorrência e saldo negativo;
- não contar duas vezes uma ocorrência representada por registro pai e detalhe de lote;
- retornar a origem correta, inclusive lote;
- usar a mesma identidade item/lote no F6, prévia e F8;
- testar somente movimentoslotes, somente movimentos e ambos.

### 3. Usar Filial e datas atualmente selecionadas

O F6 não pode enviar header.filial quando a tela tem outro valor selecionado, nem validar uma filial e persistir/encaminhar outra.

O valor selecionado deve ser enviado, autorizado e usado de forma consistente para persistir cabeçalho, montar payload, consultar, gerar fotografia, prévia e processar. Não fazer fallback silencioso para a filial antiga. Mudança de filial invalida prévia, hash e autorização. Criar teste com filial carregada e outra filial autorizada selecionada.

Data do Inventário define saldo inicial. Data do Processamento define limite final e permanece gravada após P. Recusar processamento menor que inventário sem mutação. Se filial ou datas forem alteradas e o usuário pressionar Processar sem F6, persistir e validar os valores atuais no contrato transacional ou bloquear explicitamente exigindo atualização; nunca usar silenciosamente valores antigos. F6, prévia e F8 não podem misturar fotografia antiga com valores novos. Manter LimitedeDiasParaProcessamentoInventario separado da ordem das datas.

### 4. Saldo após processamento

Revisar saldoaposprocessamento e campos do plano. O escalar não pode representar apenas emestoque quando o contrato Delphi usa saldo composto. Usar a composição documentada, incluindo emestoque, reservado, transito e reserva prévia quando aplicável, e expor componentes separados. F6, prévia e F8 devem coincidir. Testar múltiplas posições e lotes.

### 5. Paridade completa para lotes

F6 não pode calcular somente produto enquanto a consulta de lotes retorna apenas cadastro/quantidade atual. Para produto controlado por lote, buscar últimos saldos de movimentoslotes até Data do Inventário, projetar até Data do Processamento com sinais, e calcular por lote diferença, custo, financeiro, movimentado e saldo após processamento. Fechar totais do produto pela soma dos lotes quando exigido e usar a mesma fotografia no relatório F6, prévia, plano e F8.

Restringir movimentos aos lotes do inventário. Não mostrar duas ocorrências para o mesmo movimento pai e detalhe; usar identidade composta estável quando necessário. Usar consultas set-based com IN, ANY(array) ou unnest.

### 6. Revalidar exclusão de negativos

ExcluirItensNegativosInventarioCommand não pode confiar em produtos enviados pelo navegador. Revalidar Situação A, filial, revisão, autorização e confirmação; recalcular no servidor o conjunto negativo no corte atual; aceitar somente produtos negativos pertencentes ao inventário; rejeitar ou ignorar explicitamente produto positivo, inexistente, de outra filial ou fora do escopo; tratar lotes sem exclusão parcial silenciosa; manter transação, auditoria e ausência de movimentos/P. Testar produto positivo e produto fora do escopo.

Copiar negativos deve usar a mesma revalidação e abrir o novo inventário sem processá-lo.

### 7. Remover testes proibidos

Exceção de infraestrutura: quando a suíte usar SQLite, é permitido detectar o driver ou
verificar schema somente no bootstrap/helper de testes para preparar compatibilidade ou marcar
um teste específico de PostgreSQL/trigger como não aplicável. Essa verificação não pode
decidir o comportamento do módulo, escolher query silenciosamente, mascarar falha de schema
ou substituir teste funcional. Em produção não fazer introspecção de schema.

No escopo do Cadastro de Inventário, substituir testes que leiam código-fonte para procurar getDriverName, Schema::has, hasTable, allocator ou insertGetId. Nunca testar driver, hasTable ou equivalente para decidir comportamento.

A regra acima vale para comportamento funcional e produção; a exceção SQLite descrita neste
prompt é permitida apenas na infraestrutura da suíte.

Exercer comportamento com fixtures e ambiente autoritativo: verificar que INSERT de movimentos omite numero, que banco/trigger fornece o número e que o ID retornado é usado no lote, além de efeitos, rollback, concorrência, datas, filial e paridade F6/F8. Não condicionar testes a tabela, coluna ou driver. Não criar introspecção de schema em runtime. Não alterar o writer para alocar numero manualmente.

## Regras permanentes

As verificações de driver/schema permitidas são somente as de compatibilidade da infraestrutura
SQLite dos testes, isoladas do comportamento funcional e sem ocultar falhas.

Preservar: um único fluxo Processar; F6/relatório canceláveis desde o início; prévia sem escrita; F8 transacional; grid com ordenação, exportação, personalização, redimensionamento e catálogo; cores/negrito/precedência do Delphi; modal F9; inclusão rápida Enter grava e soma; importação TXT, coleta mobile, câmera, fila offline e junção.

Não usar N+1, SQL concatenado, testes de driver, hasTable, Schema::has* ou introspecção runtime. Usar INNER JOIN para relação obrigatória com campos NOT NULL e LEFT JOIN somente para relação opcional comprovada. Não inventar schema. Não pedir verificação direta dos fontes Delphi. Preservar o número de movimento gerado pelo trigger/estratégia autoritativa.

## Aceite mínimo

1. Operações em estoque, reservado, reserva prévia e lote produzem os mesmos valores em F6, prévia e F8.
2. Alteração posterior somente em movimentoslotes bloqueia Processar.
3. Filial e datas novas não são substituídas por valores antigos.
4. Saldo após processamento composto coincide em F6, prévia e F8.
5. Painel lista somente negativos e não duplica pai/lote.
6. Exclusão rejeita produto positivo ou fora do escopo.
7. Movimento é inserido sem numero e o ID retornado é usado no lote.
8. Nenhum teste do módulo consulta driver, hasTable, Schema::has* ou inspeciona fonte para decidir comportamento.
9. Testes cobrem limites temporais, filial, concorrência, lotes, negativos por posição, rollback e orçamento de queries.

Ao concluir, informe arquivos alterados, testes executados, bloqueios de schema e diferenças residuais em relação ao SQL legado capturado.
