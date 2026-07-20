# 04 — Invalidar cotações quando o Orçamento mudar

**What to build:** impedir que uma opção calculada para dados antigos seja aplicada ou tratada como atual depois de alterações relevantes no Orçamento, oferecendo um fluxo explícito de revisão na gravação.

**Blocked by:** 03 — Persistir a evidência da cotação selecionada.

**Status:** ready-for-agent

- [ ] A assinatura considera Filial/CEP de origem, CEP de destino, valor declarado e todos os itens enviados à API.
- [ ] Produto/SKU, Filial relevante, quantidade, peso e dimensões participam da detecção de mudança.
- [ ] Alterar qualquer dado assinado marca a cotação como desatualizada.
- [ ] Uma resposta cujo payload não corresponde mais ao Orçamento atual é recusada antes da aplicação.
- [ ] A recusa preserva o rascunho e orienta o Usuário a refazer a cotação.
- [ ] Ao gravar com cotação desatualizada, o Usuário pode Prosseguir, Refazer cotação ou Cancelar.
- [ ] Refazer usa os dados atuais e somente uma resposta válida renova a assinatura.
- [ ] Prosseguir não falsifica a validade: a evidência continua indicando que a cotação usada estava desatualizada.

