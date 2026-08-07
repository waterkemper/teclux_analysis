# Classificar as lacunas reais e prioridades do Cadastro de Pedidos

Type: grilling
Status: resolved
Blocked by: 01, 02, 03

## Question

Quais diferenças identificadas são lacunas reais, quais são decisões deliberadas ou falsos positivos, e qual prioridade deve ser atribuída a cada lacuna segundo risco funcional, fiscal, financeiro, segurança, operação e ausência de prova?

## Answer

### P0 — segurança e consistência bloqueantes

1. **Sincronização com Contas a Pagar**
   - Se as Previsões do Pedido não mudaram, não reconstruir Documento a Pagar nem Duplicatas.
   - Se mudaram e qualquer Duplicata estiver autorizada ou paga, bloquear a alteração financeira e exibir mensagem clara informando que as previsões não podem ser alteradas devido à situação financeira existente.
   - Alterações não financeiras do Pedido permanecem possíveis sem tocar no Documento a Pagar.
   - Nunca apagar/recriar fatos financeiros protegidos. A sincronização precisa ser idempotente, atômica e reconciliada com o Pedido.

2. **Motores obrigatórios e autoritativos**
   - Eliminar degradação silenciosa por `strict:false`: falha no motor fiscal ou de custo causa rollback integral e mensagem que identifica o cálculo que falhou.
   - Não criar estado novo de pendência fiscal/custo neste Cadastro.
   - Persistir os resultados fiscal/custo na mesma transação e reconciliá-los antes do commit; executar o motor sem aplicar/verificar o resultado não é sucesso.

3. **Concorrência**
   - Introduzir revisão otimista no contrato da tela e locks determinísticos nas mutações de cabeçalho, itens, previsões, grade, ordem, exclusão e financeiro.
   - Conflito produz zero efeitos e mensagem para recarregar o Pedido; não há last-write-wins silencioso.
   - Testar sobreposição de sessões em PostgreSQL real, incluindo financeiro e renumeração da ordem.

4. **Numeração**
   - Eliminar completamente o fallback `MAX(numero)+1`.
   - A sequence PostgreSQL é a única fonte de novos números; falha da sequence interrompe a Inclusão com mensagem e rollback.

5. **Prova e operação**
   - Testes PostgreSQL reais e não puláveis cobrem gravação, motores, persistência/reconciliação, sequence, Documento/Duplicatas e concorrência.
   - Logs estruturados com `correlation_id` cobrem falhas de gravação, cálculo, conflito e sincronização financeira.
   - Esses itens bloqueiam ampliação do rollout. Se a tela já estiver disponível, preservar o acesso atual, mas não ampliar uso antes dos gates.

### P1 — completude funcional e fiscal

1. **Cabeçalho e situação**
   - Completar campos, defaults e lookups das três Filiais, Parte Fornecedora, transportadora, datas, fretes, desconto/acréscimo, seguro, despesas e quadro de totais.
   - Recalcular ao trocar Filial de Fatura/Entrega, Parte Fornecedora, data-base ou valores acessórios, reutilizando motores existentes.
   - Manter “Observações da Compra” e “Observações do Estoque” como campos persistentes distintos, com validação e editabilidade por situação.
   - Fechar matriz Aberto/Parcial/Concluído/Cancelado/Liquidado; alterar entrega de Pedido recebido exige aviso e desmarca `recebido`.

2. **Notas Pendentes de Entrada**
   - Implementar o prompt 12 sobre `nsus/nsus_prod`, sem nova integração SEFAZ.
   - Carregar sob demanda e sincronizar seleção bidirecional produto↔nota, com realce acessível e comportamento definido quando não há correspondência.

3. **Produtos Similares**
   - Completar o contrato do prompt 14: grade, Filial, estoque, reserva, quantidade pedida, valor e relação, além de código/descrição.

4. **Formulário fiscal do item**
   - Completar campos/reduções oficial e custo, MVA, ICMS Simples, ST anterior, conversões, valores e matriz de editabilidade do prompt 15.
   - Todo cálculo vem dos motores; frontend não duplica fórmulas. Edição manual respeita flags e locks.

5. **Prova**
   - Remover skips condicionais dos fluxos corrigidos e criar testes executáveis para cabeçalho, SEFAZ, similares e formulário fiscal.

### P2 — acabamento operacional

1. **Modo inline custo/preço**: distinguir do F11; mostrar colunas condicionais, recalcular ao abrir, destacar divergências, respeitar `LocalCalculoPreco` e resetar ao trocar Pedido, sem nova fórmula.
2. **Gestos e acessibilidade**: duplo clique, inclusão/edição por teclado, `Alt+↑/↓`, foco preservado, disabled real e ações equivalentes por botão/teclado.
3. **Exportação estruturada/Excel**: completar a entrega superficial do prompt 08 usando a projeção autorizada do Pedido, sem reabrir layout do relatório ou criar exportador genérico.

### Não são lacunas desta continuidade

- Motores/fórmulas fiscais isolados já implementados; somente sua integração autoritativa integra P0.
- Menu e autorização própria, F9, abas Fornecedor/Notas/Contatos, cores, reordenação e marcar todos já implementados, sem prejuízo de endurecer seus testes.
- A abertura automática da ficha compartilhada do fornecedor é omitida deliberadamente; usar ação explícita somente se já houver ficha Laravel equivalente.
- Abilities separadas por ação e Auditoria imutável completa do Pedido são oportunidades futuras, pois não foram exigidas pelos prompts nem comprovadas no legado. Preservar o acesso de módulo atual.
- Logs estruturados/correlação são exigidos agora; não equivalem a criar uma nova Auditoria de domínio.
- Cópia autônoma, Consulta/Listagem, Cancelamento, Atendimento, Daico e emissão de NF-e permanecem fora de escopo.
- Bugs e código morto já rejeitados não voltam à especificação.

### Regra de prioridade

`P0` elimina possibilidade de corrupção/perda financeira, cálculo inconsistente, número duplicado e lost update; precede todo rollout. `P1` fecha contratos já publicados e lacunas funcionais centrais. `P2` melhora operação e completa acessórios sem alterar o núcleo. Browsershot pode permanecer opcional apenas para smoke visual; nunca prova regra financeira/fiscal.
