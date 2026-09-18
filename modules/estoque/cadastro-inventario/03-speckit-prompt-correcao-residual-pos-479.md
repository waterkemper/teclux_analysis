# Prompt corretivo residual — Cadastro de Inventário pós-479

## Contexto

Revise o estado atual do checkout Laravel no commit `422f05576`, comparando-o com:

- `specs/479-fix-inventario-aceite/spec.md` e `tasks.md`;
- `specs/478-cadastro-inventario/`;
- `modules/estoque/cadastro-inventario/01-speckit-prompt-cadastro-inventario.md`;
- `modules/estoque/cadastro-inventario/02-speckit-prompt-correcao-implementacao.md`.

Corrija a implementação existente in-place. Não crie implementação paralela e não reabra nem peça para verificar fontes Delphi.

## Pendências confirmadas

1. O F6 recebe apenas `inventario`; o controller/job/serviço não revalida a Filial autorizada do Inventário. Um usuário com acesso ao módulo pode solicitar F6 de número de outra Filial e o job lê os itens sem escopo de Filial.
2. A UI define `f6Status = queued`, mas nunca atualiza para `running` por meio do progresso do hook. O aceite exige estado de execução antes do primeiro `await` e teste de cancelamento/resultado obsoleto.
3. `AplicarArquivoColetaCommand` ainda faz `foreach ($parsed['grupos_ok'])` e chama resolver, leitura/escrita e evento por grupo. Isso viola o requisito set-based e o orçamento de consultas para N grupos.
4. Erro de Produto encontrado durante a aplicação do arquivo recebe `line_no = 0`; o parser já perdeu a origem do grupo. O resultado não consegue apontar a linha real e linhas inválidas do parser não viram eventos de erro auditáveis.
5. O contrato do arquivo especifica multipart, mas a Request e a tela enviam `conteudo` como JSON. Deve existir um contrato único para upload de TXT e seu nome original.
6. `Coleta.tsx` apenas abre e fecha `getUserMedia`; não usa `BarcodeDetector`, vídeo ou leitura de código. Portanto, o botão Câmera não efetua bipagem.
7. A fila offline só é descarregada no evento `online`; não há flush inicial/retry explícito, consulta de eventos ou apresentação de conflitos. A tela permite Finalizar enquanto `fila.length > 0`.
8. Evento e sessão aceitam `dispositivo` opcional e canal livre; o contrato exige identidade de dispositivo e canais controlados para auditoria.
9. `EstoqueInventarioServiceProvider` decide bindings por driver/configuração (`defaultDriverIsSqlite`). Isso ainda é teste de driver no caminho do módulo, contrariando a regra de não ramificar por tipo de banco.
10. Upsert e exclusão validam apenas se a Filial informada pelo cliente é autorizada; não comparam essa Filial com a Filial real do Inventário. O upsert também não audita a alteração.
11. O painel mostra somente algumas abas e o método `gravar` não envia/persiste o contrato completo de filtros/cabeçalho. O botão “Gerar pelos parâmetros” continua dependendo de filtros persistidos, não necessariamente das regras atuais exibidas.
12. `vitest.config.ts` aponta para `resources/js/test/setup.ts`, arquivo ausente no checkout. Os testes de UI não são evidência válida até corrigir o setup. As tarefas 479 estão marcadas concluídas sem log verificável de PHPUnit/Vitest/Pint.

## Correções obrigatórias

### F6 e escopo de segurança

- Exigir Filial no payload F6 ou resolver a Filial de modo não manipulável a partir do Inventário; validar existência, situação, Filial autorizada e usuário antes do dispatch.
- Persistir no job o escopo validado e revalidá-lo no job/status/resultado. Nunca consultar somente por número sem filtro de Filial/usuário.
- Exibir estado `running` e Cancelar antes do primeiro `await`, usando o callback de progresso de `useErpHeavyGerarRequest`.
- Garantir `trace_id` por geração, descarte de resposta antiga, cancelamento servidor antes do abort local e testes que provem que uma geração cancelada não publica linhas.
- Manter o catálogo do grid para resultado e exportação, sem colunas ou pipeline paralelo.

### Importação TXT em conjunto

- Definir um contrato único: preferencialmente multipart com `sessao_id`, Filial/Inventário conferidos pela sessão, arquivo TXT e nome original; se o padrão Laravel do checkout exigir texto, documentar formalmente o mesmo contrato sem manter dois formatos implícitos.
- Parser deve manter linha/grupo de origem: número da linha, código normalizado, quantidade decimal, status e mensagem. Produto inexistente deve conservar todas as linhas que o originaram.
- Resolver todos os códigos em lote e aplicar os grupos em conjunto, com decimal exato, atualização/inclusão aditiva e eventos persistidos em lote. Não fazer uma query ou `upsert` por grupo.
- Eventos aceitos e rejeitados devem ser auditáveis; erro de uma linha não deve apagar a aplicação de linhas válidas. Segundo envio do mesmo checksum/sessão continua sem nova soma.
- Usar armazenamento privado do projeto, verificar falha de escrita e evitar arquivo órfão quando a transação de metadados falhar.
- Criar teste com dezenas/centenas de grupos e orçamento de consultas que falhe caso o número de queries cresça linearmente.

### Câmera, offline e finalização

- Implementar leitura real: `BarcodeDetector` quando disponível, vídeo/stream com ciclo de vida seguro e fallback manual/arquivo quando indisponível ou negado. Solicitar permissão não é bipagem.
- Gerar e enviar `dispositivo` estável por sessão/evento; validar canal em `camera|manual|arquivo`. Não aceitar evento sem usuário autenticado e dispositivo identificável.
- Fazer flush da fila ao montar a tela se houver conexão, ao voltar online e por botão Retry. Manter o mesmo `event_id`, remover somente após confirmação do servidor e exibir erro/conflito individual.
- Consultar e renderizar eventos de erro/conflito por sessão. Desabilitar Finalizar quando houver fila local, pendências ou conflitos; o servidor também deve exigir um estado de sincronização verificável antes de finalizar.
- Não oferecer F8 nem processamento offline.

### Binding e persistência

- Remover a seleção de implementação por driver/configuração do provider de produção. Produção deve usar o adapter/contrato oficial do deploy; doubles SQLite devem ser registrados explicitamente no harness de testes, sem lógica de driver em código de negócio.
- Para toda mutação, carregar o Inventário em transação, comparar Filial real com a Filial autorizada, exigir situação A e aplicar revisão concorrente. Não confiar na Filial enviada pelo navegador.
- Auditar upsert, exclusão, redução/correção e motivo com usuário, Inventário, Filial, revisão e valores anterior/novo. A tela/modal deve enviar a revisão atual.

### Filtros

- Expor todas as abas exigidas pelo contrato do `ProductFilterPanel`, incluindo item/produto, grupo, classe, marca, modelo, especificação, promoção, CST/CSOSN, lista, localização, lote e atributo, além de fornecedor/flags/cabeçalho quando aplicável.
- Persistir e recarregar o contrato tipado de regras/exceções junto ao Inventário. “Gerar pelos parâmetros” deve usar explicitamente as regras atuais ou as regras persistidas, deixando a origem visível e testada.
- Manter compiler whitelistado, binds, `IN`/`ANY`/`unnest`, sem fragmento SQL vindo do browser.

## Aceite e validação

Adicionar testes reais para:

- F6 de Inventário fora da Filial autorizada, job com escopo, estado `running`, cancelamento e resposta obsoleta;
- aplicação de arquivo multipart, linhas inválidas com número correto, Produto inexistente, arquivo arquivado e dezenas/centenas de grupos sem N+1;
- câmera que detecta código, fallback negado, flush inicial/retry, conflito visível e bloqueio de Finalizar com fila pendente;
- evento sem dispositivo/canal inválido, sessão cruzada e mutações com Filial divergente;
- upsert/exclusão auditados com revisão e motivo de redução;
- todas as abas/filtros persistidos e usados pela geração.

Corrigir `resources/js/test/setup.ts` ou o caminho do Vitest para o checkout atual e executar os testes efetivamente. Executar PHP somente por `./scripts/docker-php.sh`; anexar saída real de PHPUnit, Vitest e Pint. Não marcar tarefas como concluídas sem evidência.

O gate do schema continua obrigatório: se o manifesto ainda tiver relações legadas ausentes, não declarar SQL/mapper/migration legado concluído nem inventar estrutura. Não usar `hasTable`, `hasColumn`, introspecção ou teste de driver para decidir comportamento.
