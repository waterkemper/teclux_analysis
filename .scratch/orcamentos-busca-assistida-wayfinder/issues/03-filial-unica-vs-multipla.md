# Decidir escopo de Filial (única vs. múltipla) no painel em Orçamentos

Type: grilling
Status: resolved
Blocked by: 01

## Question

O painel foi desenhado para Filiais múltiplas (`filiaisAutorizadasEfetivas: number[]`, Consulta de Estoques), mas o Orçamento tem uma única Filial (`cabecalho.filial`). O que a busca, a revalidação de estoque/preço e o detalhe (estoque por Filial) devem considerar neste hospedeiro: só a Filial do Orçamento, ou um conjunto maior de Filiais autorizadas ao vendedor para checar disponibilidade cruzada antes de incluir?

## Answer

Filial única — `filiaisAutorizadasEfetivas = [filialBase]`, usando a **Filial Base** (`filial_ativa_codigo` da sessão, mesmo mecanismo já estabelecido para Consulta de Estoques), não uma derivação separada de `cabecalho.filial`. Na prática as duas coincidem hoje, pois `cabecalho.filial` já é resolvido a partir do mesmo contexto de sessão (`OrcamentoCadastroPageService::resolveFilialCodigo()`) — mas a decisão arquitetural é reaproveitar o padrão/mecanismo de Filial Base uniformemente entre hospedeiros, em vez de fiar o painel a um campo específico do Orçamento.

Achado que sustenta isso: `OrcamentoProdutoInclusaoService` (o `produto_lookup` real usado na inclusão) já exige uma única Filial para tudo — preço (`resolvePrecoVenda`), estoque (`resolveEstoque`, `where('filial', $filial)`) e até a resolução de Cargo (`resolveEmpcargo`) — não existe checagem cruzada entre Filiais em nenhum ponto dessa cadeia hoje. Sem disponibilidade cruzada: um item só pode ser incluído neste Orçamento saindo da Filial Base; qualquer coisa além disso seria informação que não pode virar ação aqui.
