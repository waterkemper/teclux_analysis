# 01 — Consultar opções de frete no Orçamento

**What to build:** permitir que o Usuário abra a Cotação de Frete do Orçamento e receba, pela API configurada no site do cliente, uma lista comparável de opções válidas e serviços indisponíveis. O backend monta os dados autoritativos, protege URL/credencial e o navegador conhece apenas o endpoint interno do ERP.

**Blocked by:** None — can start immediately.

**Status:** ready-for-agent

- [ ] A ação fica disponível quando existem CEP de origem, CEP de destino e ao menos um Produto; ausências são explicadas antes da chamada.
- [ ] O backend resolve `URL FRENET` e `chave frenet` no contexto da Filial de origem sem expor seus valores ao frontend ou aos logs.
- [ ] O payload contém CEPs, valor declarado e Produtos com SKU, quantidade, peso, altura, largura, comprimento e diâmetro.
- [ ] A resposta no formato Frenet é normalizada e preserva códigos, nomes, serviço, valor, prazo, mensagem, valores originais, tempo e erro.
- [ ] A modal preserva inicialmente a ordem da API, não seleciona opção automaticamente e permite ordenação manual.
- [ ] Opções válidas e serviços indisponíveis são apresentados separadamente; serviços com erro não podem ser selecionados.
- [ ] Peso ou dimensões zeradas são enviados e sua aceitação permanece responsabilidade da API.
- [ ] Testes usam fake HTTP e comprovam que nenhuma chamada externa real ocorre.

