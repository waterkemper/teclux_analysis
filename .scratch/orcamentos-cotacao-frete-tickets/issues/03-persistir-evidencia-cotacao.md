# 03 — Persistir a evidência da cotação selecionada

**What to build:** gravar junto ao Orçamento os campos operacionais de frete e uma fotografia mínima que permita comprovar qual cotação foi escolhida e quais dados foram efetivamente aplicados.

**Blocked by:** 02 — Validar a configuração local e aplicar uma cotação.

**Status:** ready-for-agent

- [ ] A gravação do Orçamento persiste todos os campos legados de frete aplicados ao rascunho.
- [ ] A evidência registra assinatura do payload, data/hora, Usuário e Filial de origem.
- [ ] A evidência registra códigos e nomes retornados, configuração local e Fornecedor resolvidos.
- [ ] Valores e prazos originais e aplicados, serviço e mensagem permanecem auditáveis.
- [ ] A fotografia é persistida atomicamente com os dados do Orçamento.
- [ ] Alterar a cotação cria a nova evidência sem apagar indevidamente a Auditoria mantida pelos gatilhos do sistema.
- [ ] Credenciais e URL com dados sensíveis não são gravadas na fotografia.
- [ ] Reabrir o Orçamento reconstrói corretamente a cotação selecionada e seu estado de validade.

