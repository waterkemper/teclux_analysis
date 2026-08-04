# Prompt para /speckit.specify — confirmação transacional

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a confirmação transacional de **Interlojas → Confirmação por Notas**, quarta e última fatia. Consuma as specs 01–03 e entregue F5 como comando seguro, idempotente e auditado que cria a Nota Fiscal de Entrada na Filial Requisitante/destino e aplica seus efeitos de estoque, pedidos, financeiro e romaneio.

Não implemente durante `/speckit.specify`. Inspecione o Laravel e o schema/funções do PostgreSQL compartilhado, citando evidências concretas. Não investigue fontes Delphi: use:

- `modules/interlojas/confirmacao-por-notas/pesquisa-transacao-delphi.md`;
- `modules/interlojas/confirmacao-por-notas/pesquisa-atribuir-dados-produtos-e-movimentos.md`;
- `pesquisa-sql-batching-delphi.md`;
- `pesquisa-parametros-autorizacoes-delphi.md`;
- `pesquisa-padroes-laravel-chave-nfe.md`;
- decisões Wayfinder.

Não copie fragilidades de commits separados, SQL textual, ausência de rollback ou autoria ambígua.

## Unidade de comando e lote

- Request recebe IDs estáveis das notas selecionadas, chave de idempotência e desafio de autorização de uso único da spec 02.
- Nunca recebe filial, dados fiscais calculados, produtos, quantidades, autoridade ou flags de administrador como verdade do cliente.
- Reconsultar e revalidar tudo no servidor.
- Lote processa cada nota separadamente e continua após falha individual.
- Uma transação PostgreSQL atômica por nota.
- Resultado por nota: `confirmed`, `already_confirmed`, `rejected` ou `failed`, com código/mensagem segura.
- Uma falha não reverte notas confirmadas antes nem impede as seguintes.
- Dentro de uma nota não existe confirmação parcial de itens.

## Pré-condições revalidadas sob lock

- filial destino = filial ativa autorizada;
- `dadosfiscais.cliente = filial ativa`, `tipocliente=''L''`, situação e natureza elegíveis;
- nota ainda não confirmada na filial destino;
- pedidos `F` existentes e somas exatas por produto;
- cabeçalho, produtos, vencimentos e configuração fiscal/financeira válidos;
- todas as linhas de estoque necessárias existem;
- natureza padrão e `Evento Pagto Duplicata Transferência entre empresa` existem quando aplicáveis;
- romaneio/vínculos permanecem compatíveis com o snapshot mostrado.

Falhar explicitamente para estoque, produto, pedido, parâmetro, natureza ou vencimento ausente; não ignorar item nem reproduzir acumuladores ambíguos.

## Locks e batching anti-N+1

- Definir ordem determinística de locks para nota/dado fiscal, pedidos por PK, estoques por par `(filial, produto)`, romaneio e identidades de destino.
- Usar `lockForUpdate` dentro de `DB::transaction(..., attempts: N)` e repetir invariantes depois dos locks.
- Uma leitura por conjunto para cabeçalhos/filiais, produtos, vencimentos, pedidos e estoques; zero queries por item.
- IDs simples: `whereIn` ou `ANY(array)`.
- Pares pequenos: tuplas com binds; pares maiores: `unnest(array_produtos, array_filiais) WITH ORDINALITY`.
- Deduplicar pares preservando primeira ordem; ordenar locks para reduzir deadlock.
- Nunca interpolar a cadeia OR do Delphi e nunca combinar dois arrays independentes criando pares cartesianos.
- Inserts/upserts em lote somente quando preservarem regras, triggers, numeração e auditoria.

## Idempotência e unicidade

- Guard crash-safe iniciado/concluído na mesma transação, com chave, Solicitante, filial, hash canônico do payload e resposta.
- Mesma chave + mesmo payload devolve resposta persistida.
- Mesma chave + payload diferente retorna 409.
- Definir/confirmar unicidade de domínio para uma entrada em `notaspag` por `dadofiscalreferenciado + filial destino`.
- Caracterizar constraints antes de criar índices; prever unicidades para itens, movimentos por item/tipo, documento financeiro, duplicatas e conferência documental.
- Corrida em unique relê o vencedor e retorna `already_confirmed` apenas quando o conteúdo coincide.
- Compatibilidade com confirmação concorrente realizada pelo Delphi deve ser testada.

## Criação da Nota Fiscal de Entrada

### Materialização obrigatória dos itens — não presumir trigger

- Tratar `AtribuirDadosProdutos(..., TransferenciaEntrada, ...)` como lógica explícita do legado, não como trigger; reproduzir seu contrato por um serviço/oráculo nomeado.
- Implementar em projeção set-based o equivalente a `SQLDadosProdutosNotasSaidas`, com cardinalidade 1:1 por `(dadofiscal, numero, produto)` e fotografia fiscal/cadastral completa.
- Não fixar `origem = 0`, CRT/modelo genéricos ou totais ICMS/ST em zero quando a origem possui valores.
- Preservar/provar `produtosnotaspag.filial = FilialBase` e `filial_estoque = FilialEstoque`.
- Reproduzir o cálculo por item (`AtribuirDadosCalculosImpostos`) e o fechamento agregado (`CalcularImpostos`). Só declarar trigger como autoridade com DDL e teste PostgreSQL real.
- Resolver a divergência de estoque ausente: Delphi cria linha zerada; Laravel atual rejeita.
- Criar golden master PostgreSQL Delphi × Laravel para cabeçalho, itens, totais, `STC`/`FTR`, pedidos, financeiro e estoque.

Na filial destino, criar atomicamente:

- cabeçalho em `notaspag`, com novo código pelo seam canônico existente, fornecedor/Filial Requisitada, série/número, destino, modelo, chave NF-e canônica, emissão, data do servidor, CNPJ/IE, totais, observações, situação, venda-transferência, natureza e `dadofiscalreferenciado`;
- todos os itens em `produtosnotaspag`, incluindo nota, número, filial/filial de estoque, produto, dado fiscal, quantidades, preços, grades e atributos fiscais;
- cálculo/persistência de impostos conforme o oráculo explícito acima, com falha e rollback; não atribuir genericamente essa responsabilidade a triggers;
- movimentos de estoque equivalentes a `STC` e, quando houver futuro, `FTR` por `min(futuro, quantidade)`, após caracterizar sua semântica/triggers;
- atualização dos `pedidosfiliais` em situação `F`, consumindo `qtderecebida` corretamente por produto e mudando situação conforme a regra comprovada;
- documento a pagar e duplicatas quando `vendatransferencia`/vencimentos exigirem, usando o evento parametrizado e preservando parcelas/forma/situação;
- contexto de auditoria do banco e autoria da aplicação.

Não criar tabelas legadas inexistentes por migration; o trabalho opera sobre o schema compartilhado. Qualquer constraint nova exige plano de auditoria/backfill compatível com Delphi.

## Solicitante, Autorizador e segurança

- Revalidar capability da folha, filial e desafio no início do comando.
- Persistir/auditar `requested_by_user_id` e `authorized_by_user_id`, correlação, idempotência, filial, nota, horário e resultado.
- Usar Autorizador nos registros que representam autorização/conferência; definir explicitamente onde o usuário da sessão continua sendo ator técnico/financeiro.
- Não guardar credenciais.
- F5 abre confirmação humana clara com quantidade/lista de notas e efeitos; botão/atalho ficam bloqueados durante processamento.

## Romaneio: preservar semântica compartilhada

Após os efeitos da nota e dentro da mesma transação quando tudo está no mesmo PostgreSQL:

- para nota com romaneio, executar a semântica de `incluirconferenciadocumentos` para `ROS` e `ROE` com romaneio, filial destino, dado fiscal e Autorizador;
- executar a semântica de `Atualizar_situacao_romaneio(romaneio)`;
- antes de implementar, caracterizar assinatura, efeitos, idempotência, locks e cálculo dessas funções no banco compartilhado;
- reutilizar as funções como autoridade ou encapsular exatamente seu contrato; não inventar cálculo divergente;
- confirmar uma ou duas notas de romaneio com várias notas não pode concluir o romaneio prematuramente;
- manter compatibilidade com o módulo separado **Confirmação por Romaneio**.

`ROS`/`ROE` não são a conferência NST da spec 03.

## Atomicidade, efeitos e recuperação

- Nota de entrada, itens, impostos, movimentos, pedidos, financeiro e atualização de romaneio no mesmo banco confirmam ou sofrem rollback juntos.
- Usar exceções para rollback; não retornar sucesso após falha de imposto/pedido/estoque.
- Efeitos realmente externos usam outbox transacional e despacho pós-commit; não criar outbox para dividir gravações do mesmo banco.
- UI atualiza/remover notas confirmadas somente após resultado confirmado.
- Especificar reconciliação idempotente para detectar entrada sem itens, movimento/pedido/financeiro divergente, ROS sem ROE, romaneio não recalculado e autoria ausente; correção automática apenas quando segura.

## Contrato HTTP

Especifique endpoint de confirmação em lote, request, chave de idempotência, desafio, envelope por nota, 403/409/422/erro recuperável, correlação e comportamento de retry/timeout. O endpoint deve ser seguro contra clique duplo, repetição de F5 e resposta perdida.

## Critérios de aceite

- [ ] Uma transação atômica por nota e resultado individual do lote.
- [ ] Toda autoridade e dado de negócio são reconsultados server-side.
- [ ] Locks têm ordem determinística e invariantes são repetidos após lock.
- [ ] Número de queries por conjunto é constante; não há query em loop.
- [ ] Idempotência e unicidade impedem duplicação Laravel/Laravel e Laravel/Delphi.
- [ ] `notaspag`, itens, impostos, movimentos, pedidos e financeiro são completos ou sofrem rollback.
- [ ] Materialização equivalente a `AtribuirDadosProdutos` set-based, 1:1 e validada por golden master Delphi × Laravel.
- [ ] `filial`/`filial_estoque`, origem, CST/CSOSN, composição, quantidade/preço e totais fiscais preservam a fotografia correta.
- [ ] Estoque/pedido/configuração ausente falha explicitamente.
- [ ] Solicitante e Autorizador são auditados separadamente.
- [ ] ROS/ROE e situação do romaneio preservam as funções compartilhadas e confirmação parcial entre notas.
- [ ] Retry, concorrência e falha em qualquer estágio não deixam efeito parcial.

## Matriz mínima de testes

- uma e várias notas, todas válidas, mistura de sucesso/rejeição/falha;
- mesma nota duas vezes, mesmo/diferente idempotency key e payload alterado;
- dois comandos concorrentes e confirmação concorrente pelo Delphi;
- alteração da nota/pedido/estoque após listagem;
- pedidos/estoques presentes, ausentes, duplicados e quantidades divergentes;
- nota sem/com venda-transferência e vencimentos;
- parâmetro/natureza/evento inválido;
- falha em cabeçalho, item, imposto, movimento, pedido, financeiro, ROS, ROE e atualização do romaneio, provando rollback;
- zero/uma/múltiplas linhas no oráculo; estoque ausente; `filial` diferente de `filial_estoque`; composto/não composto;
- golden master PostgreSQL comparando uma entrada Delphi e Laravel, inclusive efeitos das triggers de `movimentos`;
- romaneio com uma, duas e várias notas: nenhuma, parcial e todas confirmadas conforme função compartilhada;
- deadlock/retry, timeout/resposta perdida e clique duplo;
- query count para 1 e N itens/notas e pares não cruzados;
- Solicitante autorizado, outro Autorizador, desafio inválido/reutilizado e adulteração de identidade;
- reconciliação de cada divergência prevista.

## Saída esperada

Produza spec e plano executáveis com application command, serviços/repositórios, transação, SQL/batching, locks, idempotência, contratos HTTP, auditoria, romaneio, reconciliação, sequência de implementação e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- Confirmação por Item e Confirmação por Romaneio como telas completas;
- paginação;
- alterar Delphi;
- criar um segundo cálculo de situação de romaneio;
- implementar durante esta especificação.
```
