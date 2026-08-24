# Prompt SpecKit - Adaptador da Busca Assistida Operacional v2 em Orcamentos

Crie uma especificacao executavel e um plano de implementacao para integrar o nucleo da Busca Assistida Operacional v2 ao Cadastro de Orcamentos existente.

O nucleo compartilhado deve seguir os prompts 09-speckit-prompt.md, 10-speckit-prompt.md, 11-speckit-prompt.md e 12-speckit-prompt-operacional-v2.md do modulo estoque/busca-assistida-produtos.

Nao reabra voz, multisselecao, detalhe rico, sanitizacao, recuperacao hibrida, Restricao de Preco, cache ou contrato da tool. Este prompt trata apenas do adapter de Orcamentos.

## Regra de investigacao

Inspecione somente o Laravel atual. Confirme os contratos reais de Cadastro.tsx, ProdutosGrid, CadastroItemOrcamentoModal, CadastroItemVendaProdutoModal, OrcamentoProdutoInclusaoService, OrcamentoCadastroPageService, OrcamentosAuthorizationService, produto_lookup, handleConfirmProdutoModal e BuscaAssistidaPanel.

Nao investigue nem dependa de Delphi. Nao reescreva a maquina de estados do modal tradicional de bipe. Preserve handleConfirmProdutoModal, o upsert existente, applyProdutosTotais e agendarCascataValores().

## Objetivo do adapter

Adicionar a Busca Assistida ao Cadastro de Orcamentos como overlay sibling dos demais modais, com trigger proximo de Incluir item na toolbar de ProdutosGrid.

O vendedor pode buscar por texto natural, selecionar multiplos Produtos Ativos e aplicar a selecao no Orcamento em edicao. O painel nunca fecha sozinho apos Aplicar. O vendedor fecha apenas por X, Esc ou backdrop.

A busca e somente leitura. A inclusao continua sendo feita pelo fluxo existente e deve revalidar tudo no servidor.

## Contexto de negocio

Filial: o contexto de inclusao usa sempre a Filial Base da sessao; o adapter passa filiaisAutorizadasEfetivas = [filialBase]; nao criar composicao por Filial; a inclusao e sempre na Filial Base.

Estoque: a busca mostra o total de emestoque somando todas as Filiais, sem detalhar ou compor por Filial. Reserva, reservado, pre-reserva, transito, embalagem e conversao ficam fora.

Preco: a busca/detalhe mostra o preco da Filial Base. Com cliente identificado, o preco e Cargo-aware. Sem cliente, usa Cargo Tabela Preco Padrao. O preco mostrado deve ser identico ao preco recebido pela linha ao incluir.

Extraia de OrcamentoProdutoInclusaoService um servico compartilhado para resolver Cargo, markup e preco, sem alterar a inclusao tradicional. Preserve a precedencia existente e consuma o servico no fluxo tradicional e na Busca Assistida.

## Autorizacao e capabilities

Registre o contexto busca_assistida_orcamentos no mecanismo de autorizacao de fotos/detalhe, delegando para OrcamentosAuthorizationService::canAccessCadastro.

Para este hospedeiro: can_visualizar_precos = true para quem acessa o Cadastro; can_visualizar_comissoes = false; nao criar permissao nova; contexto ausente deve ser negado por padrao; repetir verificacoes no servidor.

## Contrato do painel

Use onApply(selections[]), currentSelection, callback desacoplado do Cadastro, contexto de cliente opcional, Filial Base no contexto de preco/inclusao e capabilities definidas acima. Nao redesenhe o painel.

## Aplicacao da selecao

Implemente o adapter no Cadastro:
1. para cada selecao, identificar Produto+Filial;
2. se ja houver linha com a mesma chave Produto+Filial em data.produtos, incrementar quantidade em 1;
3. se nao houver, resolver produto_lookup e incluir linha com quantidade 1;
4. aplicar o fluxo existente de totais e cascata;
5. processar itens independentemente;
6. reportar falhas item a item, sem perder sucessos;
7. remover da faixa apenas produtos aplicados;
8. manter o painel aberto.

Se o produto ficar inativo, sem estoque ou invalido entre busca e Aplicar, a inclusao falha apenas para aquele item e a mensagem explica o produto afetado. Reaproveite o flash local existente proximo da grade. Nao crie novo sistema de toast.

## Contratos de dados

Documente payloads reais de contexto de busca/detalhe, preco Cargo-aware, total de emestoque, selecao do painel, produto_lookup e erro parcial. A tool publica continua sendo apenas buscar_produtos.

## Fases tracer-bullet

1. extrair servico compartilhado de Cargo/markup/preco sem regressao;
2. registrar autorizacao busca_assistida_orcamentos;
3. adaptar busca/detalhe para Filial Base, cliente/cargo e total de estoque;
4. montar overlay e trigger no Cadastro;
5. implementar Aplicar com incremento por Produto+Filial e falha parcial;
6. cobrir testes e integracao com o painel compartilhado.

## Testes obrigatorios

Backend: Cargo e markup com cliente; sem cliente usando Cargo Tabela Preco Padrao; override de cargo; preco da busca igual ao da inclusao; total somado por emestoque; somente Filial Base na inclusao; autorizacao registrada e negacao por padrao; Produto inativo nunca retornado nem incluido.

Frontend: produto existente incrementa; produto novo entra com quantidade 1; falha de um item nao impede os outros; painel permanece aberto; flash informa sucessos e falhas; capabilities seguem contrato; modal tradicional de bipe permanece sem regressao.

## Criterios de aceite

Vendedor busca e seleciona Produtos Ativos no Cadastro; resultado mostra imagem, evidencia, preco da Filial Base e total de estoque de todas as Filiais; nenhum Produto inativo aparece; preco de busca/detalhe e inclusao sao identicos; Aplicar inclui ou incrementa por Produto+Filial; inclusao sempre usa Filial Base; falha parcial e reportada; painel nao fecha sozinho; detalhe rico segue autorizado; nenhuma comissao e exibida; busca tradicional e modal de bipe nao sofrem regressao; testes passam.

## Saida esperada do SpecKit

Produza especificacao executavel e plano, nao apenas analise. Liste requisitos, payloads, seams reais, componentes/endpoints a alterar, riscos, fases, testes, criterios de aceite e estrategia de rollout. Nao implemente voz de criacao de Orcamento nem altere estoque, precos, clientes ou Filiais.
