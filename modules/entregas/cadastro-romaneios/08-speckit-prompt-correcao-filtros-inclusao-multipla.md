# Prompt para `/speckit.specify` — correção dos filtros da inclusão múltipla de Notas

```text
/speckit.specify

Audite e especifique a correção da tela Laravel de inclusão múltipla de Notas do Cadastro de Romaneios, correspondente ao `Incluir múltiplos`/F6 do Delphi `fmSelecaoMultiplasNotasRomaneio`. Este prompt é separado da inclusão unitária de Item de Romaneio e deve tratar somente a jornada de consulta, seus filtros, defaults, validação, localização por chave, estados e cancelamento. Não implemente nesta etapa.

Inspecione o checkout Laravel atual e produza uma especificação pronta para implementação, citando arquivos e linhas concretas. Consuma obrigatoriamente:

- `modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md`;
- `modules/entregas/cadastro-romaneios/consulta-f6-sql-performance-cancelamento.md`;
- `modules/entregas/cadastro-romaneios/02-speckit-prompt-consulta-f6-selecao-multipla.md`;
- `modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md`;
- `modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md`;
- `modules/entregas/cadastro-romaneios/schema/README.md` e o snapshot autoritativo;
- `delphi/apps/entrega/fmSelecaoMultiplasNotasRomaneio.pas`;
- `delphi/apps/entrega/fmSelecaoMultiplasNotasRomaneio.dfm`;
- `delphi/apps/entrega/dmcadastroromaneios.pas` e o DFM correspondente;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/InclusaoMultiplaModal.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/InclusaoMultiplaFiltrosPanel.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/hooks/useCadastroRomaneiosInclusaoMultipla.ts`;
- `laravel/backend/app/Application/Entregas/Romaneios/CadastroRomaneiosInclusaoMultiplaFiltros.php`;
- `laravel/backend/app/Http/Requests/Entregas/Romaneios/InclusaoMultipla/InclusaoMultiplaGerarRequest.php`;
- `laravel/backend/app/Http/Requests/Entregas/Romaneios/InclusaoMultipla/InclusaoMultiplaLocalizarChaveRequest.php`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosDateLimitsService.php`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosInclusaoMultiplaPageService.php`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosInclusaoMultiplaGerarService.php`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosInclusaoMultiplaLocalizarChaveService.php`;
- `laravel/docs/usuario/entregas/romaneios/inclusao-multipla.md`.

Classifique cada constatação como CONFIRMADO, DIVERGENTE, POSSÍVEL BUG ATUAL, POSSÍVEL BUG LEGADO, INFERIDO, DÚVIDA ou NÃO LOCALIZADO, sempre com evidência. Quando Delphi e Laravel tiverem comportamento diferente, diga qual é o comportamento canônico desejado e se a diferença é uma adaptação legítima da web ou precisa ser corrigida. O banco PostgreSQL legado continua sendo a autoridade; não copie SQL ou limitações acidentais do Delphi.

## Escopo visual e relação com o Delphi

O Delphi tem as abas `Parâmetros` e `Dados`. O Laravel pode manter uma única superfície web com regiões acessíveis de `Filtros`, `Resultados` e comandos; não recrie abas apenas para copiar o layout Delphi. A equivalência obrigatória é de comportamento, não de pixels:

- os filtros devem ficar sempre identificáveis e editáveis antes de Gerar;
- o resultado deve mostrar quando a consulta foi executada, está carregando, está vazio, foi cancelada ou falhou;
- `Gerar (F6)` deve ficar associado aos filtros;
- `Cancelar` deve ficar disponível imediatamente durante a consulta, mesmo sendo uma melhoria deliberada sobre o Delphi;
- a busca por chave pode estar no mesmo modal web, mas deve ter semântica própria e não pode alterar silenciosamente os filtros persistidos.

Não reabra a correção da tela de inclusão unitária, o seletor Nota/Cupom, Auto Incluir, lookup de Filial/Série/Número da inclusão unitária, frete do Item ou o contrato financeiro, salvo se a implementação atual compartilhar um componente e a auditoria provar uma lacuna transversal. Nesse caso, registre a dependência e não misture os dois prompts.

## Contrato canônico dos filtros

Especifique cada campo com rótulo, tipo, formato, default, nulabilidade, semântica de vazio, foco e mensagem de erro.

### Emissão

- `Emissão inicial` e `Emissão final` são obrigatórios, inclusivos, em data civil e devem iniciar com a data do servidor menos 15 dias e a data do servidor de hoje;
- o default deve ser calculado no servidor, respeitando o timezone de negócio, e enviado ao browser já normalizado em `Y-m-d`;
- rejeitar data inválida, inicial posterior à final, intervalo acima do máximo configurado e datas fora dos limites efetivos da Filial/parâmetro;
- validar no browser para feedback rápido, mas repetir toda validação no FormRequest/serviço antes de abrir a query;
- a mensagem deve indicar o campo ou intervalo inválido e devolver foco ao primeiro campo com erro;
- não usar a data do relógio do browser para substituir a data do servidor.

### Entrega

- `Entrega inicial` e `Entrega final` são opcionais, mas devem ser informadas juntas ou permanecer ambas vazias;
- quando informadas, são inclusivas, válidas, ordenadas e submetidas às mesmas regras de intervalo máximo aplicáveis ao contrato;
- deixar ambas vazias significa não restringir pela data de entrega, e não significa usar automaticamente o período de emissão;
- limpar uma das datas deve limpar/invalidar a outra de forma explícita, sem enviar intervalo parcial;
- documentar se o filtro compara data, timestamp truncado ou data efetiva da entrega, com evidência do SQL legado.

### Filiais

- apresentar seleção múltipla de Filiais com código e nome, incluindo marcar todas e desmarcar todas;
- as opções do browser devem ser exatamente as Filiais autorizadas para o usuário, respeitando administrador, filial ativa e contexto do Romaneio;
- a ausência do filtro (`null`) deve significar todas as Filiais autorizadas, nunca todas as Filiais do banco;
- diferenciar ausência de filtro de seleção explicitamente vazia. Se a UI não permitir um conjunto vazio útil, não simular essa diferença com `null`: decidir e documentar o contrato real;
- o backend deve revalidar cada código, rejeitar Filial não autorizada e nunca confiar na lista recebida do browser;
- preservar a seleção quando a consulta falhar ou for cancelada, mas invalidar seleção de linhas/rascunho quando o usuário confirmar alteração de filtros;
- documentar como o filtro de Filiais interage com a Filial âncora e com Romaneio de Transferência.

### Clientes

O Laravel atual usa texto livre separado por vírgula/espaço/ponto e vírgula em `InclusaoMultiplaFiltrosPanel.tsx`. O Delphi usa `TfraSelecaoAleatoriaClientes`, com lista condicional, pesquisa por `Ctrl+F9` e exclusão por `Ctrl+Del`. Esta é uma divergência funcional relevante.

Especifique a solução web:

- preferir lookup/lista de seleção de Clientes reutilizando o padrão Laravel existente, com pesquisa paginada, código, nome e seleção múltipla;
- permitir remover um Cliente já selecionado sem exigir apagar e redigitar toda a string;
- preservar teclado acessível equivalente à pesquisa e remoção do Delphi, sem tornar os atalhos a única forma de operar;
- não descartar tokens inválidos silenciosamente. Informar códigos inválidos, inexistentes ou não autorizados e manter o restante do rascunho;
- `null` deve significar todos os Clientes dentro do escopo autorizado; uma lista não vazia deve restringir aos códigos selecionados; o comportamento de lista vazia explícita deve ser decidido, testado e não pode gerar `IN ()` inválido;
- o backend deve validar existência, autorização e escopo do Cliente, além de aplicar o filtro com bindings;
- não carregar todos os Clientes no browser se a cardinalidade não justificar isso.

### Somente NF com itens para entrega

- iniciar marcado, conforme `Checked = True`/`State = cbChecked` no DFM Delphi e o default Laravel atual;
- manter o texto exatamente compreensível: a opção restringe documentos Nota Fiscal com itens elegíveis para entrega;
- enviar booleano canônico, rejeitar tipo adulterado e aplicar o mesmo predicado tanto para geração quanto para localização por chave;
- documentar se Cupom Fiscal aparece no conjunto quando a opção está marcada. Não assumir que o rótulo “NF” transforma Cupom em Nota; conferir o SQL e a regra de elegibilidade.

### Chave NF-e

A chave não é um filtro comum da geração Delphi: ela aparece na aba `Dados`, é normalizada para números e o Enter chama `LocalizarNfe` na grade. No Laravel atual há um campo no painel de filtros, mas seu valor local é enviado por uma operação separada e não é aplicado por `patch` ao objeto de filtros.

Defina explicitamente:

- localizar por chave é uma ação separada de `Gerar`, com botão/Enter, validação de 44 dígitos pela autoridade compartilhada e mensagem de chave inválida;
- a localização deve usar os filtros atuais de emissão, Filiais, Clientes, entrega, `somente_nf_itens_entrega` e contexto do Romaneio;
- a localização não pode ampliar silenciosamente escopo, período, Filial ou elegibilidade para achar a chave;
- se a chave estiver em outra página do conjunto filtrado, retornar página/identidade canônica e selecionar o Documento Fiscal, sem selecionar pela posição visual;
- a chave não deve contaminar o próximo `Gerar` depois de localizada. Se fizer parte do estado persistido, deve haver semântica explícita para limpar e reaplicar; não manter estado duplicado escondido entre `chave_nfe` do filtro e estado local do input;
- definir o comportamento para chave válida não encontrada, documento inelegível, documento já vinculado, chave de Cupom ou resposta tardia;
- preservar foco no campo de chave após localizar, como no Delphi, sem perder filtros, resultado e seleção quando a operação não exigir nova consulta.

## Estado, comandos e diferenças de fluxo

Especifique uma máquina de estados sem ambiguidade:

- abertura: carregar defaults do servidor, sem executar consulta automaticamente;
- edição de filtro: marcar a consulta anterior como potencialmente obsoleta; se houver linhas selecionadas ou rascunho aplicado, confirmar descarte antes da mudança;
- `Gerar/F6`: enviar payload canônico, iniciar `busy` antes do primeiro await, invalidar respostas antigas e limpar seleção de linhas somente quando a nova consulta for aceita;
- carregando: `Cancelar` aparece imediatamente, fica acessível e cancela a geração corrente no servidor PostgreSQL pelo trace correto;
- sucesso com dados: publicar somente a resposta da geração corrente, manter filtros/sort canônicos e mostrar Resultados;
- sucesso vazio: mostrar estado vazio sem fingir que houve falha e sem selecionar linhas;
- cancelamento: manter o último resultado completo, não mostrar erro de negócio e descartar resposta tardia;
- erro de validação: permanecer na região de filtros, associar mensagens aos campos e preservar o que o usuário digitou;
- erro de consulta: não apagar filtros nem rascunho sem decisão explícita; distinguir erro da consulta de cancelamento;
- fechar/reabrir: resetar estado transitório e recarregar defaults do servidor, sem deixar seleção da consulta anterior;
- paginação e ordenação: reaplicar exatamente os filtros canônicos da última geração e não perder o contexto de Filial/Romaneio;
- `F8`: permanece reservado à confirmação da inclusão/seleção múltipla conforme o contrato da spec 02/03; não transformar F8 em Gerar.

Corrija ou documente o fato de que o Laravel atual deixa `NfeAccessKeyInput` dentro do painel de filtros, enquanto o Delphi só o expõe nos Dados, e de que o hook localiza usando filtros atuais porém mantém a chave em estado separado. A adaptação visual é aceitável; a duplicidade de estado e a semântica de aplicação não são.

## Payload e segurança

Defina um payload único e versionado para Gerar e outro, derivado do mesmo snapshot, para Localizar por Chave. O payload deve conter somente filtros, paginação e ordenação permitidos. O servidor deve:

- resolver o contexto canônico do Romaneio e seu tipo Normal/Transferência;
- aplicar as Filiais efetivas autorizadas, mesmo quando o request omitir o filtro;
- validar datas, Clientes, Filiais, booleanos, `sort`, `direction`, página e `per_page`;
- rejeitar campos proibidos e valores fora das allow-lists;
- aplicar a mesma elegibilidade a Gerar, Localizar, grid e exportação;
- não permitir que uma chave NF-e, Cliente ou Filial escape do escopo autorizado;
- usar query set-based, bindings, paginação server-side e ordenação determinística;
- devolver filtros canônicos, metadados suficientes para a UI e identidade estável do Documento Fiscal;
- revalidar IDs selecionados no F8/gravação, pois o resultado da consulta não reserva o Documento.

Para Romaneio de Transferência, explicitar quais filtros são aceitos e como filial/cliente âncora restringem a consulta. Não deixar o frontend decidir a elegibilidade.

## Critérios de aceite

- [ ] Defaults de emissão são servidor−15 dias até servidor hoje e aparecem iguais em nova abertura.
- [ ] Datas inválidas, invertidas, parciais e fora dos limites produzem erro de campo e foco correto.
- [ ] Filiais vazias, todas marcadas e subconjunto marcado têm semântica documentada e testada; nenhum usuário consulta Filial não autorizada.
- [ ] Clientes usam seleção/lookup ou, se o texto for mantido por decisão justificada, não descartam tokens inválidos silenciosamente e cobrem `null`, lista e lista vazia.
- [ ] `somente_nf_itens_entrega` começa marcado e é usado de modo idêntico em Gerar e Localizar.
- [ ] Chave NF-e é validada, localizada dentro dos filtros atuais, não contamina o próximo Gerar e mantém foco/estado coerentes.
- [ ] Alterar filtro com seleção/rascunho exige confirmação e não deixa linhas de uma consulta antiga serem incluídas.
- [ ] F6 exibe Cancelar imediatamente; o cancelamento encerra a query PostgreSQL e não publica resposta tardia.
- [ ] Resultado vazio, erro, cancelamento, paginação, ordenação e reabertura têm testes de estado.
- [ ] Grid, exportação e F8 usam o mesmo snapshot canônico de filtros e autorização.
- [ ] Testes HTTP/feature cobrem payload adulterado, Filial/Cliente não autorizado, intervalo inválido, chave fora do conjunto e Romaneio de Transferência.
- [ ] Testes frontend cobrem pesquisa/remoção de Clientes, foco, teclado, confirmação de descarte e respostas fora de ordem.
- [ ] Teste de integração comprova que arrays vazios não geram SQL inválido nem ampliam escopo.

## Fora de escopo

- alterar a tela de inclusão unitária ou o comportamento de Auto Incluir;
- redesenhar a grade de documentos além do necessário para filtros, identidade e seleção;
- criar cópia Laravel de `dadosfiscais`, `notas`, `cupons`, `filiais` ou Clientes;
- persistir Documento Fiscal selecionado nesta etapa;
- alterar o contrato financeiro, tabela de fretes ou valor do Item;
- reintroduzir abas Nota/Cupom na inclusão unitária;
- alterar Delphi, criar migration de negócio ou usar introspecção de schema em runtime.
```
