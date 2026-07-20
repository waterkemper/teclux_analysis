# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional e técnica para padronizar a visualização de Fotos de Produto no ERP tecLUX Laravel. A solução deve ser compartilhada e adotada, neste mesmo esforço, por todos os grids Laravel que já exibem fotos de Produto.

## Objetivo

Substituir os previews fragmentados por uma galeria modal reutilizável. A coluna `Foto` de cada grid será o ponto único de entrada: clicar na miniatura seleciona a linha e abre todas as fotos do Produto clicado. O modal também permite navegar entre os demais Produtos com fotos pertencentes ao contexto atual do grid.

O recurso é exclusivamente de visualização. Não implementar upload, edição, exclusão, ordenação, definição de foto principal ou download explícito.

## Decisões confirmadas

- [CONFIRMADO] A janela de fotos Delphi é compartilhada por Orçamentos, Contratos, consultas de Estoque e outros módulos; o Laravel deve manter essa natureza transversal.
- [DECISÃO NOVA] Usar uma galeria modal, sem painel lateral permanente.
- [DECISÃO NOVA] A miniatura na coluna `Foto` é o ponto único de entrada. Remover botões separados de fotos quando forem redundantes.
- [DECISÃO NOVA] Ao clicar na miniatura, selecionar a linha e abrir a galeria sem disparar edição da linha.
- [DECISÃO NOVA] Mostrar foto principal, miniaturas, código e descrição do Produto, contador, zoom, redução e ajuste à tela.
- [DECISÃO NOVA] Separar claramente a navegação entre fotos do Produto atual da navegação entre Produtos do contexto.
- [DECISÃO NOVA] A navegação de Produtos segue a ordem atualmente exibida pelo grid depois de filtros e ordenação.
- [DECISÃO NOVA] Eliminar repetições do mesmo Produto, preservando sua primeira ocorrência visível.
- [DECISÃO NOVA] Produtos sem fotos não participam da navegação entre Produtos.
- [DECISÃO NOVA] Produtos adicionados ao documento, ainda não salvos, participam quando já possuem identidade de Produto e fotos.
- [DECISÃO NOVA] Carregar sob demanda as fotos do Produto atual e pré-carregar somente os Produtos anterior e próximo.
- [DECISÃO NOVA] A autorização acompanha o contexto de consulta de origem, sem nova Permissão funcional de fotos.
- [DECISÃO NOVA] Em telas pequenas, o modal ocupa praticamente toda a tela e mantém controles acessíveis por toque.
- [DECISÃO NOVA] Distinguir carregamento, ausência de fotos, falha de comunicação e foto individual indisponível; permitir tentar novamente sem fechar.
- [DECISÃO NOVA] Mostrar na miniatura um indicador da quantidade de fotos quando houver mais de uma.

## Evidências Delphi

Validar PAS e DFM conjuntamente; não converter limitações ou bugs legados em requisitos.

- [CONFIRMADO] Em `delphi/apps/vendas/fmorcamentos.dfm`, próximo das linhas 2601–2713, `sbnVisualizarFoto` fica ao lado do grid de Produtos e possui a dica “Visualizar a imagem relacionada no site da empresa”.
- [CONFIRMADO] Em `delphi/apps/vendas/fmorcamentos.pas`, próximo das linhas 1785–1789, o clique chama `AcionarTelaVisualizarImageURL` com o Produto corrente.
- [CONFIRMADO] `delphi/repositorio/fmVisualizarImageURL.pas/.dfm` implementa a janela compartilhada.
- [CONFIRMADO] `delphi/repositorio/frVisualizarImageURL.pas/.dfm` consulta `fotosprodutos`, carrega miniaturas, cria botões dinamicamente e mostra a primeira foto como imagem principal.
- [CONFIRMADO] A origem das URLs usa o armazenamento configurado ou o endereço de fotos do site; existem variantes original e thumbnail.
- [CONFIRMADO] O frame compartilhado também é incorporado em Conferência de Produtos e anexos, e a função/janela é chamada em múltiplos módulos.
- [DIVERGENTE] O botão separado e a janela limitada do Delphi não devem ser copiados. A coluna de foto e a galeria modal são uma melhoria deliberada.

## Estado atual do Laravel

Preservar e evoluir a infraestrutura existente, evitando uma segunda implementação:

- [CONFIRMADO] Existe endpoint JSON genérico `GET /cadastros/produtos/{produto}/fotos`.
- [CONFIRMADO] `ProductPhotoService`, o repositório legado, o construtor de URLs e `ProductPhotoSort` já fornecem fotos ordenadas e suas variantes original, média, thumbnail e extra-small.
- [CONFIRMADO] A ordenação atual considera `posicao` e nome; a primeira foto ordenada é `mainPhoto`.
- [CONFIRMADO] A resposta já informa `productId`, `hasPhotos`, `mainPhoto` e `photos`.
- [CONFIRMADO] Existem `ProductPhotoThumbCell`, `ProductPhotoMediumModal`, `ProductPhotoViewer`, `ProductPhotoMain`, `ProductPhotoThumbnails` e `useProductPhotos`.
- [CONFIRMADO] A Conferência de Produtos já usa a galeria completa embutida.
- [CONFIRMADO] Orçamentos, detalhes de Contratos, modal de item de Venda, telas de Marketplace e manutenção de preços usam miniatura e/ou modal médio.
- [DIVERGENTE] O Orçamento abre somente a primeira `foto_media_url`, não todas as fotos.
- [DIVERGENTE] O modal médio não possui miniaturas, zoom nem navegação entre Produtos.
- [DIVERGENTE] O visualizador completo atual abre a imagem original em nova aba; o destino acordado não oferece ação explícita de download ou abertura externa.
- [DIVERGENTE] `useProductPhotos` usa cache global apenas por Product id e endpoint fixo, embora a base de fotos possa depender de Filial/parâmetro e a autorização dependa do contexto.
- [DIVERGENTE] `ProductPhotoAccessService` autoriza apenas Cadastro de Produtos ou Listas Padrão, apesar dos consumidores em Vendas, Estoque e Marketplace.
- [DIVERGENTE] Os payloads de grids normalmente carregam somente primeira miniatura e primeira imagem média; não há contagem uniforme para badge e elegibilidade eficiente.
- [CONFIRMADO] Existem testes funcionais do endpoint, de ordenação e de construção de URLs. Eles são o prior art principal.

## Consumidores a inventariar e migrar

Faça busca completa antes da implementação. O inventário inicial confirmou usos nos seguintes grupos, mas a spec deve abranger qualquer consumidor adicional encontrado:

- Cadastro de Orçamentos e suas colunas/grid de Produtos;
- detalhes de Produtos na Consulta de Contratos;
- modal compartilhado de item de Venda;
- Conferência de Produtos;
- preview/filtros de Marketplace;
- Produtos e vínculos nos módulos administrativos de Marketplace;
- rascunhos do Mercado Livre;
- manutenção de preços de Marketplace;
- componentes genéricos que importam o modal médio, a célula de miniatura, o viewer completo ou o hook de fotos.

Para cada consumidor, registrar no plano:

1. contexto funcional e autorização existente;
2. origem das linhas e Product id;
3. suporte a linhas ainda não persistidas;
4. ordenação/filtros usados pelo grid;
5. miniatura e metadados atuais;
6. modal, viewer ou botão atual a substituir;
7. comportamento especializado que precisa compor os novos primitives;
8. teste de integração necessário.

## Contrato do grid com a galeria

Definir um contrato compartilhado que não conheça nomes específicos de módulos. Ele deve receber ou derivar:

- contexto de autorização reconhecido pelo servidor;
- Product id válido;
- código visual e descrição para título;
- thumbnail da foto principal;
- quantidade autoritativa de fotos ou indicação confiável de existência;
- identidade estável da linha para seleção e restauração de foco;
- sequência atual das linhas após filtros e ordenação;
- callback para tornar a linha ativa;
- URLs/loader autorizados para obter todas as fotos.

Regras:

1. Ao clicar na miniatura, tornar a linha ativa, impedir propagação para edição/duplo clique e abrir o Produto clicado.
2. Construir a sequência de navegação a partir do row model visível e ordenado do grid.
3. Remover duplicados por Product id, preservando a primeira ocorrência.
4. Remover Produtos sem fotos da sequência.
5. Aceitar linhas não persistidas quando o Product id já for válido e o contexto de página estiver autorizado.
6. Célula sem foto não abre modal e não simula uma ação disponível.
7. Exibir badge de contagem quando houver várias fotos.
8. Ao fechar, restaurar foco na miniatura que abriu o modal e manter a linha selecionada.

## Galeria modal compartilhada

O modal deve possuir:

- semântica de dialog, título acessível e trap de foco;
- código e descrição do Produto atual;
- foto principal com `object-contain`, sem deformação;
- miniaturas de todas as fotos do Produto;
- indicação “foto X de Y”;
- controles de foto anterior/próxima;
- controles separados e rotulados “Produto anterior” e “Próximo produto”;
- indicação da posição do Produto na sequência elegível, quando útil;
- zoom limitado com ampliar, reduzir, ajuste à tela e roda do mouse;
- controles compatíveis com toque;
- fechamento por botão, Escape e clique no backdrop, sem conflito com interações internas;
- layout quase full-screen em viewport pequena e modal centralizado/bounded no desktop;
- estados de loading, retry, vazio defensivo e falha parcial;
- prevenção de scroll do fundo enquanto aberto;
- nenhuma ação explícita de upload, edição, exclusão, reordenação, download ou abrir original em nova aba.

A navegação entre fotos nunca muda o Produto. A navegação entre Produtos abre a foto principal do novo Produto e reinicia o zoom/posição da foto.

## Fotos, ordenação e resolução

1. Preservar `ProductPhotoSort` como fonte autoritativa da ordem.
2. Considerar a primeira foto ordenada como principal.
3. Exibir somente fotos do Product id exato; não usar automaticamente fotos de Característica, irmãos de grade ou Produtos relacionados.
4. Usar a variante média para exibição normal e a melhor variante disponível para zoom, com fallback seguro entre original, média, thumbnail e extra-small.
5. Uma foto com URL ausente ou que falhe ao carregar deve ser marcada como indisponível e permitir avanço para as demais.
6. Se todas as fotos confirmadas falharem, apresentar erro recuperável, não “Produto sem fotos”.
7. Não alterar registros, posição ou foto principal.

## Metadados e desempenho

Evitar uma requisição de galeria por linha apenas para descobrir quais Produtos têm fotos.

- Evoluir o enriquecimento/batch existente para fornecer ao grid, por Product id, primeira thumbnail e `photoCount` autoritativo, além de outros metadados mínimos necessários.
- O batch deve deduplicar Product ids e evitar N+1.
- Carregar a lista completa apenas ao abrir um Produto.
- Depois do carregamento do atual, prefetch assíncrono do anterior e próximo elegíveis.
- Não prefetch todos os Produtos do documento.
- Cancelar requisições obsoletas quando suportado e sempre ignorar respostas que não correspondam ao Produto/contexto ativo.
- A cache deve incluir Product id, Filial/base de fotos e contexto que possa alterar resposta ou autorização. Não manter chave apenas por Product id.
- Definir política clara de invalidação/retry. Um retry forçado deve ignorar a entrada com erro.
- Não deixar falha de prefetch alterar o estado visível do Produto atual.

## Autorização

Não criar Permissão de negócio específica para fotos. Se o Usuário pode consultar o grid/contexto de origem, pode visualizar as fotos nele apresentadas.

Entretanto, o backend deve comprovar esse contexto:

1. substituir o Gate limitado a Produtos/Listas Padrão por um resolvedor/registro explícito de contextos consumidores;
2. cada contexto delega à policy ou ao serviço de acesso do módulo correspondente;
3. rejeitar contexto desconhecido ou não autorizado;
4. não confiar em booleanos como `canView` enviados pelo cliente;
5. não permitir que informar arbitrariamente outro contexto contorne autorização;
6. aplicar a mesma autorização ao batch de metadados e à galeria completa;
7. permitir linhas ainda não persistidas porque a autorização é do contexto/página e o Product id já existe no Catálogo;
8. não exigir Permissão de Lista Padrão para fotos de Orçamento, Contrato, Estoque ou Marketplace;
9. registrar na spec como cada consumidor comprova seu contexto, preferindo um contrato único e extensível.

## Estados e falhas

- `loading`: skeleton/indicador sem conteúdo antigo do Produto anterior.
- `ready`: fotos ordenadas e controles coerentes.
- `no photos`: usado na célula/metadata; esse Produto não entra na sequência modal.
- `communication error`: mensagem com “Tentar novamente”, preservando modal e contexto.
- `individual image error`: placeholder daquela foto e possibilidade de navegar.
- `stale response`: descartada silenciosamente, sem substituir Produto ativo.
- `unauthorized`: fechar ou bloquear a galeria com mensagem apropriada, sem vazar metadados.

## Adoção integral

- Substituir usos de modal de imagem única pela galeria quando o objeto for Produto.
- Padronizar a célula de miniatura e seu badge.
- Remover botões externos cuja única função seja abrir fotos do Produto selecionado.
- Onde uma foto está embutida permanentemente, como na Conferência, preservar a visualização contextual e usar a galeria compartilhada para inspeção ampliada.
- Não transformar previews de objetos que não sejam Produto, como anexos genéricos, em consumidores deste contrato.
- Não deixar duas experiências concorrentes de visualização de Produto após a migração.

## Critérios de aceitação

1. Todo grid Laravel existente que exibe foto de Produto usa a célula/galeria compartilhada ou compõe seus primitives documentadamente.
2. Clicar na miniatura seleciona a linha, abre o Produto correto e não dispara edição.
3. O modal mostra todas e somente as fotos do Product id selecionado na ordem autoritativa.
4. A primeira foto ordenada é aberta inicialmente.
5. Miniaturas, setas de foto e contador navegam apenas dentro do Produto atual.
6. “Produto anterior” e “Próximo produto” navegam apenas entre Produtos elegíveis do grid.
7. A sequência reflete filtros e ordenação atuais, elimina duplicados e exclui sem-foto.
8. Produtos identificados em linhas ainda não salvas podem participar.
9. Badge mostra corretamente a multiplicidade de fotos.
10. Célula sem foto é não interativa e o Produto não entra na sequência.
11. O Produto atual é carregado sob demanda; somente vizinhos são prefetched.
12. Navegação rápida nunca exibe resposta atrasada de outro Produto.
13. Cache não mistura Filiais, bases de fotos ou contextos incompatíveis.
14. Zoom, redução, ajuste à tela e roda do mouse funcionam com limites seguros.
15. Ao mudar de Produto, a foto principal e o zoom são reiniciados.
16. Modal funciona por mouse, teclado e toque, com layout responsivo.
17. Escape fecha e o foco retorna à miniatura de origem.
18. Falha de comunicação oferece retry sem fechar.
19. Foto corrompida não impede visualizar as demais.
20. Usuário autorizado pelo contexto abre fotos sem Permissão adicional.
21. Usuário não autorizado ou contexto fabricado recebe rejeição sem metadados.
22. Orçamento não exige Permissão de Produtos ou Listas Padrão para consultar suas fotos.
23. Botões externos redundantes são removidos dos consumidores migrados.
24. Não existe ação explícita de download, abrir original, upload, edição ou exclusão.
25. A Conferência preserva sua foto embutida e ganha a mesma inspeção detalhada.
26. Ordenação, construção de URLs e consumidores existentes não sofrem regressão.

## Estratégia de testes

Use o maior seam funcional disponível:

- ampliar os testes HTTP existentes do endpoint de fotos para shape, ordem, foto principal, variantes, vazio, batch/count, Filial/base, contexto autorizado, contexto desconhecido e negação;
- testar que batch deduplica ids e não realiza N+1;
- testar a galeria compartilhada no frontend pelo comportamento observável: abertura, seleção, foco, sequência filtrada/ordenada, deduplicação, exclusão de sem-foto, navegações independentes, zoom, responsive, loading, retry e imagem quebrada;
- testar lazy load, prefetch dos vizinhos e descarte de resposta stale observando requisições e UI, não detalhes internos do hook;
- manter somente um teste fino por consumidor comprovando contexto, candidatos e abertura;
- preservar testes existentes de `ProductPhotoSort`, URL builder, controller, Conferência, Orçamento, Contrato e Marketplace.

## Fora de escopo

- Upload, alteração, exclusão, reordenação ou definição de foto principal.
- Download explícito ou abertura do original em nova aba.
- Fotos de Produtos relacionados, Características ou variações de grade.
- Produtos sem fotos na navegação modal.
- Migração do armazenamento físico das imagens ou da tabela `fotosprodutos`.
- Redesenho geral dos grids além da coluna de foto e controles redundantes.
- Visualização de anexos que não sejam Fotos de Produto.

Antes de decompor tarefas, a especificação deve registrar:

1. inventário final de consumidores;
2. contrato TypeScript da galeria e dos candidatos de Produto;
3. contrato HTTP individual e batch;
4. registro de contextos e matriz de autorização;
5. máquina de estados de carregamento/erro/navegação;
6. estratégia de cache, prefetch, cancelamento e invalidação;
7. comportamento responsivo, acessível e de foco;
8. plano de retirada dos modais/botões antigos;
9. critérios de aceite e testes no maior seam;
10. qualquer descoberta classificada como DÚVIDA, DIVERGENTE ou POSSÍVEL BUG LEGADO.
```
