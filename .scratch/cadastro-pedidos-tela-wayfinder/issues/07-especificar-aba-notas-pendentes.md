# Especificar a aba "Notas Pendentes de Entrada"

Type: grilling
Status: resolved
Blocked by:

## Question

A aba "6-Notas Pendentes de Entrada" (`notas_pendentes_entrada.png`) lista, por item do pedido, notas fiscais eletrônicas pendentes de entrada: código/descrição do produto, filial, série, número da NF-e, emissão, chave de acesso completa, unidade, quantidade, valor. Localizar em `dmcadastropedidos.pas`/`.dfm` a query que alimenta este grid. Confirmar: a origem é a mesma integração de NF-e do fornecedor já mapeada em outro lugar do sistema (ex.: XML de NF-e recebido, pendente de vínculo/entrada)? Existe alguma ação disponível aqui (vincular a NF-e a um recebimento, cancelar pendência) ou é puramente informativo? Esta aba parece estar relacionada à mesma superfície de "notas pendentes" já usada pelo botão de NF-e pendentes em Consulta de Compras (`10-speckit-prompt-correcao-nfe-requisicoes-filial.md`) — confirmar se é a mesma fonte de dados, para reaproveitar em vez de reespecificar.

## Answer

### Confirmado: é a integração de Manifestação do Destinatário/SEFAZ (`nsus`/`nsus_prod`), já implementada em Laravel para outro módulo (CONFIRMADO)

A query do Delphi (`qryConsultaProdutosEntradaSefaz`, `dmcadastropedidos.dfm:5614+`) confirma que a fonte é **`nsus`/`nsus_prod`** — as tabelas locais de staging da distribuição de DF-e/NF-e da SEFAZ (Manifestação do Destinatário: NSU = Número Sequencial Único do protocolo SEFAZ). Colunas: `filial`, `fornecedor`, `nomefornecedor`, `serie`/`nrnfe` (derivados da chave de acesso de 44 posições), `nomecsitnfe` (Autorizada/Denegada/Cancelada), `dhemi`, e os itens da NF-e (`nsus_prod`: `cprod`/`xprod`/`cean`/`ucom`/`qcom`/`vuncom`/`vfrete`/`vseg`/`vdesc`/`voutro`), casados com o produto local via `produtosfornecedores` (por código/descrição no fornecedor).

**Achado maior**: `laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaEstoquesDetalheRepository.php:278-397` (método `listNfeEntradaPendentes`, comentário "semântica 233") **já implementa essa mesma junção `nsus`+`nsus_prod`**, para o módulo de Consulta de Estoques/Consulta de Compras — incluindo um `LEFT JOIN pedidos/produtospedidos` que já cruza o resultado com Pedidos de Compra em aberto (`pe.situacao = 'A'`), casando produto+fornecedor+data de emissão da NF-e ≥ data-base do pedido. Ou seja: a integração SEFAZ **não precisa ser construída do zero** para esta aba — já existe, já casa com Pedidos, e a aba do Cadastro de Pedidos é, na prática, **o mesmo dado filtrado pelo pedido aberto na tela** em vez de filtrado por produto solto.

### Ações disponíveis (INFERIDO — não confirmado se há ação de vínculo nesta aba específica)

Não foi localizado no `.dfm` desta aba (`tstNotasPendentesdeEntrada`) nenhum botão de ação própria (grid sem handler de duplo-clique specific a este tab) — parece puramente informativa dentro do Cadastro de Pedidos, mesmo que o dado subjacente (`nsus`) seja acionável em outros pontos do sistema (vínculo/manifestação). Não inventar uma ação de vínculo aqui sem confirmação.

### Decisão

Especificar esta aba como um **filtro adicional** sobre a query/repositório `nsus`/`nsus_prod` já implementado (`LegacyConsultaEstoquesDetalheRepository::listNfeEntradaPendentes` ou equivalente), parametrizado pelo pedido aberto (fornecedor do pedido + produtos do pedido) em vez de por produto avulso — reaproveitar a query existente, não duplicar a integração SEFAZ. Publicado como prompt `12-speckit-prompt.md`, separado das 3 abas simples (prompt 11) por depender dessa infraestrutura maior.
