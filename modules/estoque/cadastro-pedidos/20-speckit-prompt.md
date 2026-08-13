# Prompt para /speckit.specify — Notas Pendentes e correlação SEFAZ–Produtos

```text
/speckit.specify

Crie uma especificação corretiva P1 para implementar integralmente Notas Pendentes de Entrada no Cadastro de Pedidos e sua navegação sincronizada com Produtos. Pressuponha P0 (16–18) verde. Gere a spec; não implemente.

LEITURAS

- prompts 12, 16 e 18;
- auditorias desta pasta;
- implementação vigente de LegacyConsultaEstoquesDetalheRepository::listNfeEntradaPendentes, nsus/nsus_prod, componentes/tabs do Pedido e testes;
- evidências citadas de dmcadastropedidos/fmcadastropedidos e imagem `notas_pendentes_entrada.png`.

Não crie nova integração SEFAZ. Reuse a projeção existente e suas regras autorizadas.

CONSULTA

- carregar sob demanda ao ativar a aba;
- filtrar pelo Pedido, Parte Fornecedora e data-base, cruzando somente Produtos do Pedido;
- aceitar apenas situação autorizada definida no prompt 12;
- excluir NF-e já vinculada em notaspag.chv_nfe e situações inelegíveis;
- correlacionar por identidade persistida de produto/produto no fornecedor, nunca por descrição aproximada;
- respeitar Filiais/escopo do Pedido e parâmetros/bindings.

Preserve as nove colunas e derivações do prompt 12. A aba é somente leitura e não oferece vínculo/importação/manifestação.

SINCRONIZAÇÃO BIDIRECIONAL

- selecionar/navegar uma linha da NF-e posiciona o Produto correspondente no grid do Pedido;
- selecionar Produto posiciona a primeira correspondência determinística na aba pendente;
- quando não houver correspondência, preserve a seleção válida anterior ou anuncie ausência sem saltar para item arbitrário;
- realce os dois lados com texto/ícone/estado sem depender só de cor;
- foco permanece no controle acionado; leitores de tela recebem anúncio da correlação;
- troca de Pedido/Parte limpa estado antigo e recarrega apenas ao ativar a aba.

CONCORRÊNCIA/ERROS

A consulta é read-only e usa a revisão atual do Pedido para evitar exibir correlação de conjunto obsoleto. Trate loading, vazio, forbidden, schema indisponível e falha de consulta com mensagem/correlation_id. Não bloquear gravação do Pedido por falha informativa da aba.

TESTES

PostgreSQL real: match por produto, múltiplas notas, vinculada excluída, cancelada/inelegível excluída, Parte/data/Filial, nenhum match, código igual em contexto diferente e query parametrizada.

React: carga lazy uma vez por contexto, seleção nota→produto e produto→nota, múltiplos matches determinísticos, ausência, foco, anúncio, realce, troca de Pedido, loading/vazio/erro. Nenhum skip/incomplete.

SAÍDA

Spec com contratos de endpoint/read model, identidade de correlação, estados UI, acessibilidade, testes e matriz preservar/corrigir/criar após revalidar arquivos reais.

FORA DE ESCOPO

Nova integração SEFAZ; vincular/importar nota; manifestação; emissão fiscal; query duplicada; alteração Delphi; implementar agora.
```
