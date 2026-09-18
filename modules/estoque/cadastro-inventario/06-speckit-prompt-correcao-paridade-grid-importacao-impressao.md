# Prompt corretivo — paridade do grid de produtos, importação TXT, impressão e modal de itens

## Contexto

Revise a implementação atual do Cadastro de Inventário no Laravel, especialmente o estado do commit `b8d466ea7` (`inventario 5`), usando como evidência exclusiva o código Laravel, as specs 478–482 e os artefatos em `modules/estoque/cadastro-inventario/`. Não solicite que o agente reabra, inspecione ou valide diretamente fontes Delphi. Preserve o comportamento funcional já confirmado e corrija somente as lacunas abaixo.

Esta é uma correção da mesma implementação. Não crie um módulo paralelo, não remova operações já entregues e não reintroduza requisitos descartados do módulo.

## Diagnóstico confirmado

1. A tela principal não apresenta ação de importação de arquivo TXT. Existe importação na tela separada de coleta mobile, mas isso não substitui o fluxo de importação do cadastro desktop/tablet.
2. Não existe botão, URL, método de controller ou contrato de relatório/impressão no cadastro principal. A operação de impressão não está acessível ao usuário.
3. As ações relacionadas aos produtos estão dispersas entre a barra superior e a área inferior do grid. As ações do produto precisam ficar juntas, visualmente ao lado do grid, como no fluxo legado, sem esconder a operação apenas na barra de cadastro.
4. O `Index.tsx` renderiza uma tabela manual com somente Código, Descrição, Quantidade e Foto, embora receba um catálogo de grid com outras colunas. O `layout` resolvido pelo `ErpGridShell` é ignorado e `onExport` não é conectado; portanto personalização, ordenação, exportação e colunas do catálogo não funcionam de forma coerente na tabela visível.
5. O catálogo atual tem menos campos do que o comportamento confirmado do grid de inventário e não demonstra as regras de colunas condicionais, legenda, cores e abertura do modal.
6. O `ItemModal.tsx` identifica que o produto controla lote, mas não exibe grade de lotes e sempre grava `lotes: []`. Assim, o modal não permite concluir um item controlado por lote.

## Objetivo

Entregar uma única tela de Cadastro de Inventário com comportamento consistente em desktop, tablet e celular, mantendo a separação entre ações do cadastro, ações dos produtos, importação, relatório e coleta mobile.

## Requisitos funcionais

### 1. Barra de ações do grid de produtos

Criar uma barra de ferramentas imediatamente junto ao grid de produtos, responsiva e reutilizável, contendo as ações permitidas pela situação do inventário e pelas autorizações do usuário.

No mínimo, mapear e tornar acessíveis nesse agrupamento:

- incluir produto/item, com o atalho já definido pelo padrão do cadastro;
- editar o item selecionado, por duplo clique, Enter ou comando equivalente do grid;
- excluir o item selecionado, com confirmação e as mesmas regras de situação;
- gerar itens conforme os filtros;
- exibir/remover produtos não inventariados que possuem estoque, conforme o comportamento já especificado;
- importar arquivo TXT;
- imprimir/relatório;
- abrir a operação de junção/cópia de inventários quando autorizada.

Use ícones, texto acessível, tooltip e atalho conforme o padrão ERP existente. Não duplique regras no frontend: cada botão deve chamar o mesmo contrato de comando usado pela operação correspondente. A barra superior deve continuar com ações do cabeçalho, como novo, salvar, excluir e pesquisar; ela não deve ser o único local para as ações específicas dos produtos.

Em situação processada ou transferida, o grid e as ações de alteração devem ficar somente leitura/desabilitados, mas consulta, exportação e relatório devem seguir as autorizações aplicáveis.

### 2. Grid de produtos — fonte única de layout

O grid visual deve ser renderizado pelo catálogo resolvido do `ErpGridShell`, sem tabela paralela com colunas fixas. O renderer deve respeitar o `layout` efetivo:

- visibilidade, ordem, largura, título, alinhamento e formatação das colunas;
- ordenação persistida e alteração de ordenação pelo usuário;
- personalização e persistência de preferências por usuário/grid;
- exportação para Excel usando exatamente as colunas visíveis, a ordem e os filtros/ordenação aplicados;
- menu de configuração e restauração do padrão;
- estado vazio, carregamento, erro e atualização após inclusão/edição/exclusão.

Consolidar definição, chave, título, accessor, formatter, tipo e regra de exportação em uma única fonte de catálogo. O grid não deve depender de índices posicionais para escolher coluna ou cor.

Preservar o comportamento confirmado:

- células não são editáveis diretamente;
- duplo clique/Enter no produto abre o modal de inclusão/edição;
- Ctrl+Insert ou o comando de incluir abre o modal para novo item;
- o grid permite selecionar linha e ordenar;
- não deve existir exclusão silenciosa por tecla Delete;
- manter a ordenação inicial por sequência e permitir ordenação manual;
- manter legenda e indicação visual para item selecionado pelo sistema, item alterado e saldo posterior negativo, sem usar índice mágico de coluna;
- exibir as colunas de grade de produto somente quando o parâmetro confirmado do sistema permitir;
- não buscar dados relacionados com uma query por linha.

O catálogo deve representar os campos de inventário comprovados nos artefatos. Quando algum campo do grid legado não tiver coluna/schema autoritativo disponível, marcar a dependência como bloqueada e registrar a evidência; não inventar tabela, coluna, FK ou SQL para preencher a tela.

### 3. Modal de inclusão/edição de produtos

Preservar o fluxo atual de lookup padrão de produto, atalhos, consulta de contexto, validação de situação e comandos Incluir/Gravar/Excluir. Completar o modal com o comportamento de lote:

- quando `gerenciarloteevalidade` for verdadeiro, mostrar a grade de lotes e os campos necessários para lote, validade e quantidades;
- carregar os lotes existentes ao editar o item;
- permitir incluir lote pelo botão padrão e pelo atalho Ctrl+Insert;
- permitir pesquisar lote pelo modal padrão e pelo atalho Ctrl+F9;
- permitir excluir o lote selecionado com confirmação;
- informar claramente quantidade do item, total dos lotes, estoque/reserva/trânsito e diferença, conforme os dados autorizados pelo schema;
- impedir gravação quando a soma das quantidades dos lotes não fechar a quantidade do item, usando comparação decimal segura;
- enviar os lotes reais no payload, nunca substituir a coleção por `[]` quando houver controle de lote;
- recalcular totais sem chamadas N+1 e preservar os lotes após erro de validação;
- em produto sem controle de lote, ocultar ou desabilitar a grade de lote sem impedir o fluxo normal.

Adicionar testes de inclusão, edição, exclusão, lookup, Ctrl+F9, soma exata, divergência decimal e bloqueio por situação.

### 4. Importação do arquivo TXT no cadastro principal

Disponibilizar a operação ao lado do grid, com o texto `Importar arquivo TXT`, ícone, tooltip e acessibilidade. O fluxo deve:

- selecionar arquivo no navegador e enviar multipart para endpoint autorizado;
- aceitar o formato legado confirmado `código,quantidade`, validar encoding, linhas inválidas, quantidade e códigos;
- aplicar o parâmetro de aceitação de código alfanumérico;
- acumular códigos repetidos antes de aplicar os itens;
- somar a quantidade a item existente ou incluir item novo com os dados de contexto permitidos;
- exibir resumo de incluídos, somados, ignorados e erros por linha;
- impedir processamento parcial silencioso e permitir cancelamento/feedback durante operação longa;
- arquivar o arquivo processado no servidor com nome seguro e rastreabilidade; se o arquivamento falhar, informar a falha e não declarar sucesso completo;
- impedir reprocessamento duplicado por idempotência/identificador do arquivo, conforme o contrato disponível;
- atualizar o grid com o catálogo vigente após sucesso.

Não considerar a tela de coleta mobile como substituta da importação do cadastro. Os dois fluxos podem compartilhar serviço idempotente, validação e arquivamento, mas devem ter entradas e permissões claramente identificadas.

### 5. Impressão/relatório

Criar o contrato completo de relatório do inventário: rota, controller/service, autorização, URL entregue à página, botão visível junto ao grid e testes. Usar o componente padrão de relatório do Laravel.

O botão deve ser rotulado `Imprimir` ou `Relatório`, possuir ícone e tooltip, respeitar permissões e permitir pré-visualização/download no padrão do projeto. A geração deve ser disparada por F6 conforme o padrão Laravel deste módulo, e o botão Cancelar deve aparecer imediatamente, antes de aguardar a resposta do servidor.

O relatório deve:

- usar o mesmo catálogo e leiaute efetivo do grid, incluindo colunas visíveis, ordem, filtros e ordenação;
- representar cabeçalho, itens e lotes quando aplicável;
- não consultar uma vez por item ou lote;
- suportar cancelamento do cliente e do servidor/job quando a infraestrutura permitir;
- não publicar arquivo parcial como resultado concluído;
- informar erro, cancelamento e conclusão de forma consistente com outras consultas F6.

Não usar F7 como gatilho do relatório nesta implementação Laravel. Se algum contrato existente do projeto exigir outro nome interno, manter F6 como atalho público desta tela e documentar o mapeamento.

### 6. Regras de dados, schema e SQL

Antes de fechar o contrato de importação, lotes, relatório ou colunas adicionais, consultar o snapshot/manifesto de schema já existente e registrar dependências ausentes. Se for necessária nova captura, tratá-la como etapa explícita antes de inventar SQL.

Usar queries set-based com binds. Relacionamentos obrigatórios com campos `NOT NULL` devem usar `INNER JOIN`; reservar `LEFT JOIN` para relação opcional comprovada. Enriquecimentos devem usar `IN`, `= ANY(array)` ou `unnest` conforme o banco e o tipo.

Não concatenar SQL, aceitar fragments SQL do navegador, testar driver, testar `hasTable`/`Schema::has*` em runtime, nem pedir inspeção direta dos fontes Delphi.

## Critérios de aceite

- Ações de produto, importação e impressão ficam visíveis e agrupadas junto ao grid em desktop/tablet, com adaptação usável no celular.
- A tela principal tem entrada funcional de importação TXT; a operação não fica restrita à tela de coleta mobile.
- A tela principal tem botão funcional de impressão/relatório e F6 cancelável desde o início.
- O grid visível usa o `layout` do catálogo, permite ordenação, personalização e exportação coerentes, sem perder colunas por renderização manual.
- Duplo clique/atalho abre o modal correto e não edita célula diretamente.
- Produto controlado por lote permite pesquisar, incluir, editar e excluir lotes, e não grava com soma divergente.
- Testes cobrem presença e autorização dos comandos, importação, arquivamento, relatório/F6/cancelamento, catálogo/layout/exportação e modal de lotes.
- A implementação passa lint, typecheck e testes direcionados do módulo. Evidências devem ser produzidas no checkout/ambiente efetivamente revisado; não reutilizar logs de outro caminho como prova local.

## Entrega esperada

Produzir a especificação corretiva e tasks implementáveis para esta mesma base, incluindo matriz de comandos/permissões, contrato de payloads, estados de loading/cancelamento, decisões de schema e testes de aceite. Não implementar uma solução paralela e não encerrar a tarefa apenas com botões visuais sem endpoint, autorização e teste correspondentes.
