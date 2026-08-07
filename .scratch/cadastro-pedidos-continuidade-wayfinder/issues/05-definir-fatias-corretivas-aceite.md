# Definir as fatias corretivas e os critérios de aceite do Cadastro de Pedidos

Type: grilling
Status: resolved
Blocked by: 04

## Question

Como agrupar as lacunas confirmadas em prompts incrementais `16+`, com dependências, sequência, contratos, testes, regressões, rollout e gates claros, evitando tanto prompts gigantescos quanto fragmentação por campo?

## Answer

Publicar dez prompts incrementais, `16` a `25`, cada um com uma única razão de mudança e contrato autocontido.

### Dependências

```text
16 Concorrência/sequence
  → 17 Motores autoritativos
    → 18 Financeiro seguro
      ├─→ 19 Cabeçalho/estado
      ├─→ 20 SEFAZ–Produtos
      ├─→ 21 Produtos Similares
      └─→ 22 Formulário fiscal
            ↓ regressão integrada P1
          23, 24, 25
```

- `16 → 17 → 18` é estritamente sequencial.
- `19–22` podem avançar em paralelo após o P0 integrado; `19` depende dos motores e `22` depende explicitamente do `17`.
- `23–25` começam somente após regressão integrada dos P1.

### Prompt 16 — Concorrência, idempotência e numeração

- Token de revisão derivado deterministicamente dos fatos persistidos relevantes do Pedido, capaz de detectar mudanças do Laravel e do Delphi. Se houver log legado confiável, pode compor o token; é proibida revisão que ignore o Delphi.
- Releitura sob locks determinísticos antes de escrever cabeçalho, itens, previsões, grade/ordem, exclusão e fatos financeiros.
- Conflito produz rollback e orienta recarregar; sem last-write-wins.
- Inclusões e gravações mutáveis são idempotentes: mesma chave+conteúdo retorna o mesmo resultado; mesma chave com conteúdo diferente retorna conflito.
- Eliminar `MAX(numero)+1`; sequence PostgreSQL é fonte exclusiva e falha interrompe a Inclusão.
- Erros estáveis: `ORDER_REVISION_CONFLICT`, `ORDER_NUMBER_SEQUENCE_UNAVAILABLE` e envelope com mensagem/correlation ID.
- Testes PostgreSQL não puláveis cobrem sobreposição, deadlock order, replay/mismatch e sequence.

### Prompt 17 — Motores fiscal e de custo autoritativos

- Remover fallback permissivo `strict:false` da gravação válida.
- Falha fiscal/custo causa rollback; não criar estado de pendência.
- Persistir resultados na mesma transação e reconciliar antes do commit; executar sem aplicar/verificar não é sucesso.
- Erros distinguem motor fiscal e custo, com mensagem e correlação, sem SQL.
- Regressão de motores, Pedido e Contas a Pagar; PostgreSQL para integração real.

### Prompt 18 — Sincronização segura com Contas a Pagar

- Fingerprint normalizado das Previsões decide se há mudança financeira; sem mudança, não tocar Documento/Duplicatas.
- Alteração não financeira permanece possível sem ressincronizar.
- Se a programação mudou e existe Duplicata autorizada ou paga, bloquear com mensagens diferentes e zero efeitos.
- Nunca apagar fatos protegidos; sincronização de programação elegível é atômica, idempotente e reconciliada.
- Erros estáveis para Duplicata autorizada/paga e correlação.
- Testes PostgreSQL reais cobrem inalterado, elegível, autorizado, pago, rollback no enésimo efeito, replay e concorrência; regressão de Contas a Pagar obrigatória.

### Prompt 19 — Cabeçalho, estados e observações

- Completar três Filiais, Parte Fornecedora, transportadora, datas, percentuais/valores acessórios e quadro de totais, com defaults, lookups e recálculos.
- Fornecedor só muda em Pedido Aberto sem quantidade recebida.
- Pedido Parcial: permitir entrega/observações; Filiais de Entrega/Cobrança somente sem invalidar recebimentos; Filial de Fatura somente se motores/financeiro puderem recalcular sem fatos protegidos.
- Alterar entrega de Pedido recebido exige aviso e desmarca `recebido` atomicamente.
- “Observações da Compra” é externa e integra relatório/e-mail; “Observações do Estoque” é interna, aparece no Cadastro/relatório interno e nunca é enviada ao fornecedor.
- Testes de componente e PostgreSQL; regressão dos motores e Contas a Pagar.

### Prompt 20 — Notas Pendentes e correlação SEFAZ–Produtos

- Implementar prompt 12 reutilizando `nsus/nsus_prod`, sem nova integração SEFAZ.
- Carga sob demanda por Pedido/Parte/data-base.
- Seleção bidirecional produto↔nota, preservação quando não há correspondência e realce semântico/acessível.
- Testes backend de filtros/vínculos e testes React de seleção/foco/estados vazios.

### Prompt 21 — Produtos Similares completo

- Completar prompt 14 com grade, Filial, estoque, reserva, quantidade pedida, valor, relação e identidade do Produto, além de código/descrição.
- Reusar read models existentes; painel permanece read-only e reage ao produto ativo.
- Testes de query/Filial e componente para colunas, vazio e recarga.

### Prompt 22 — Formulário fiscal completo

- Completar prompt 15: classificações, reduções oficial/custo, MVA, ICMS Simples, ST anterior, conversões, campos monetários e totais.
- Matriz de editabilidade condicionada; edição manual preserva flags/locks.
- Frontend não calcula tributos; consome resultados do motor do `17`.
- Testes de componente e integração PostgreSQL, com regressão dos motores.

### Prompt 23 — Modo inline custo/preço

- Distinguir do visualizador F11; mostrar/ocultar colunas na própria grade.
- Respeitar `LocalCalculoPreco`, recalcular pelos motores ao abrir, destacar divergências e resetar ao trocar Pedido.
- Nenhuma fórmula duplicada no React.

### Prompt 24 — Gestos operacionais e acessibilidade

- Duplo clique e teclado para inclusão/edição de itens/previsões; `Alt+↑/↓` para ordem.
- Ações equivalentes por botão/teclado, foco preservado, disabled real, nomes acessíveis, anúncios e ausência de dependência exclusiva de ícone/cor.
- Testes React obrigatórios.

### Prompt 25 — Exportação estruturada

- Gerar `.xlsx`; CSV fica fora desta fatia.
- Usar a mesma projeção autorizada do relatório do Pedido, sem query paralela divergente.
- Preservar hierarquia/campos autorizados e registrar data/hora, Filial e Usuário da exportação.
- Não criar exportador genérico nem reabrir layout do relatório.

### Formato obrigatório dos prompts

Cada prompt deve revalidar o checkout; referenciar somente prompts/decisões diretamente relevantes e as três auditorias; declarar preservar/corrigir/criar/remover; incluir contratos, erros, testes, regressões e fora de escopo; proibir fallback silencioso e estruturas paralelas.

### Definição de pronto

- Testes novos verdes, sem `skip`/`incomplete` em regras da fatia.
- Regressão do Cadastro e motores afetados; `17–19` incluem Contas a Pagar.
- PostgreSQL real para persistência, locks, sequence e consultas legadas.
- Build/typecheck e testes React para fatias visuais.
- Erros com código, mensagem acionável e `correlation_id`; nunca sucesso parcial/SQL exposto.
- Documentação de operação, rollout e falhas atualizada.
- P0 bloqueia ampliação de rollout; P1 e P2 respeitam a sequência acima. Browsershot opcional apenas para smoke visual.
