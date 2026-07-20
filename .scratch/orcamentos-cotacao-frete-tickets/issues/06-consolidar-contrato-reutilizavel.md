# 06 — Consolidar o contrato reutilizável para documentos de Venda

**What to build:** concluir a Cotação de Frete como capacidade compartilhada, mantendo Orçamentos como primeiro consumidor e deixando Contratos apto a ser integrado posteriormente por meio de um adaptador, sem duplicar API, modal, validade ou persistência de evidência.

**Blocked by:** 03 — Persistir a evidência da cotação selecionada; 04 — Invalidar cotações quando o Orçamento mudar; 05 — Completar autorização e resiliência da Cotação de Frete.

**Status:** ready-for-agent

- [ ] O núcleo compartilhado trata chamada externa, normalização, lista, erros, seleção, assinatura e fotografia.
- [ ] O contexto de origem fornece identidade, Situação, autorização, Filial/CEPs, valor declarado, Produtos e campos aplicáveis.
- [ ] Efeitos financeiros e persistência específicos do Orçamento permanecem fora do núcleo genérico.
- [ ] Não existem condicionais espalhadas por nomes como `Orçamento` ou `Contrato` dentro da integração compartilhada.
- [ ] A interface compartilhada é demonstrada pelo consumidor de Orçamentos e por um teste de contrato para um segundo contexto simulado.
- [ ] A futura integração de Contratos não exige duplicar o cliente HTTP, modal ou regras de validade.
- [ ] A tela de Contratos não é modificada nesta entrega.
- [ ] A suíte final cobre o fluxo feliz, configuração local, evidência, stale, autorização, falhas e contrato reutilizável.
