# 02 — Validar a configuração local e aplicar uma cotação

**What to build:** permitir que o Usuário escolha uma opção disponível somente quando ela possuir configuração interna inequívoca, aplicando seus dados ao rascunho do Orçamento e atualizando os efeitos financeiros visíveis.

**Blocked by:** 01 — Consultar opções de frete no Orçamento.

**Status:** ready-for-agent

- [ ] A seleção exige correspondência única de `CodigoServico + Transportador` na configuração local de frete.
- [ ] Nenhuma correspondência ou múltiplas correspondências impedem a seleção e exibem mensagem específica.
- [ ] A configuração resolvida fornece o Fornecedor de frete e os códigos internos aplicáveis.
- [ ] `frete_transportadora` recebe o nome do Fornecedor local, sem confundi-lo com o texto retornado pela API.
- [ ] A seleção aplica valor, Fornecedor, transportadora, serviço, mensagem, prazo e códigos ao rascunho.
- [ ] Totais, financiamento e planos afetados são recalculados uma vez e refletem o novo frete.
- [ ] Escolher outra opção substitui a anterior, sem acumular valores ou disparar recálculos concorrentes.
- [ ] A lista de opções vem somente da API; regras legadas locais não são mescladas para criar novas opções.

