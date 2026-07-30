# Prompt para /speckit.specify — núcleo compartilhado

````text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para aprofundar, no Laravel, o núcleo compartilhado de **Requisição entre Filiais**, atualmente embutido na Requisição da Consulta de Compras. O resultado deve permitir que a Consulta de Compras e o futuro Cadastro manual **Interlojas → Requisição para Exposição** usem os mesmos parâmetros, persistência, locks, movimentos de estoque, auditoria e regras transacionais, sem compartilhar controllers, DTOs ou telas.

Não implemente nesta etapa. Inspecione o checkout Laravel e cite arquivos concretos. Você não precisa abrir fontes Delphi: a seção “Contrato legado e decisões confirmadas” deste prompt é o pacote autoritativo. Se o código Laravel divergir, registre a divergência e planeje a migração sem apagar comportamento já entregue pela Consulta de Compras.

## Estado Laravel que deve ser investigado

- `ConsultaComprasRequisicaoService`;
- `ConsultaComprasRequisicaoParameterManifest`;
- `LegacyPedidosFiliaisRepository`;
- `LegacyConsultaComprasRequisicaoMovimentoWriteRepository`;
- repositórios de candidatas/estoque usados pela Consulta;
- `QuantityDecimal`, `ParameterService`, `LegacyParameterBooleanValue`;
- `DatabaseAuditContext`;
- padrão de `clientes_log_new`, sua migration, gatilho e testes;
- testes existentes em `tests/Feature/Estoque/ConsultaCompras`.

É permitido renomear, extrair e aprofundar componentes prefixados por `ConsultaCompras`, desde que a Consulta continue funcionando. A Consulta mantém preview, candidatas, cobertura, distribuição, snapshots e soma de duplicata em sua própria orquestração.

## Contrato legado e decisões confirmadas

### Agregado e identidade

- A persistência canônica é `pedidosfiliais`.
- A criação gera o código no servidor, dentro da transação, por `pedidosfiliais_proximocodigo()`; PostgreSQL nunca usa `max + 1`.
- Requisição aberta tem situação `A`; somente aberta pode ser alterada ou cancelada.
- Quantidades usam representação decimal internamente. O Cadastro manual restringirá quantidade pedida a inteiro positivo.

### Parâmetros — descrições literais obrigatórias

Criar um manifesto neutro e resolver no servidor por `parametros_valor(descricao, filial_ativa_da_sessão)`:

1. `Transferir Produtos Compostos`;
2. `Permitir requisições de produtos duplicadas`;
3. `REQUISICAOSUBTRAIESTOQUE`;
4. `Informar o motivo do cancelamento do pedido`;
5. `USAR GRADES PRODUTOS`.

Nunca usar nomes de propriedades Delphi ou os nomes incorretos hoje presentes no Laravel (`Transferir_Produtos_Compostos`, `Permitir_Requisicoes_de_Produtos_Duplicadas`, `RequisicaoSubtraiEstoque`). Nunca aceitar valor efetivo do frontend. `''`, `NULL`, linha ausente, falso válido ou booleano inválido significam `false`. O valor corrente do parâmetro governa cada criação, edição e cancelamento, mesmo que tenha mudado desde a criação.

### Duplicidade

A identidade de duplicidade aberta é `(produto, requisitante, requisitada, situacao='A')`. Quando duplicatas forem proibidas, adquirir lock transacional determinístico da tríade antes de consultar:

- PostgreSQL: `pg_advisory_xact_lock`;
- SQLite de testes: substituto determinístico documentado.

A Consulta de Compras continua somando a quantidade à aberta. O Cadastro manual usará “criar” e retornará a aberta para edição, sem somar. O núcleo compartilha parâmetro, identificação e lock, mas expõe comandos distintos para essas intenções.

### Estoque e filial física

`REQUISICAOSUBTRAIESTOQUE=false`: persistir somente `pedidosfiliais`.

`REQUISICAOSUBTRAIESTOQUE=true`:

- resolver filial tipo `V` por `coalesce(filial_estoque, codigo)`;
- bloquear estoques em ordem determinística `(produto, filial física)`;
- reler saldos depois do `FOR UPDATE`;
- TEP move quantidade de `emestoque` para `reservaprevia`;
- falta de `emestoque` para criação/aumento/troca aborta toda a transação;
- aumento gera TEP da diferença; redução libera a diferença; quantidade igual não movimenta;
- troca de produto ou requisitada libera o antigo e reserva o novo atomicamente; falha no novo preserva tudo.

Referências novas compatíveis com o Delphi:

- TEP, ajustes e TFR: `REQUISICAO <codigo>`;
- TPE de cancelamento: `EXCLUSAO REQUISICAO <codigo>`.

Preservar `movimentos.usuariologado`, `trffilial` e numeração legada. Não reescrever movimentos antigos com `REQ <codigo>`.

### Liberação, Reserva Prévia e Venda Futura

Para redução, troca ou cancelamento:

```
quantidade_liberavel = min(quantidade_a_liberar, reservaprevia_atual)
para_reservado = min(futuro, quantidade_liberavel)
para_estoque = quantidade_liberavel - para_reservado
```

TPE libera a Reserva Prévia. Havendo Venda Futura, TFR direciona primeiro `para_reservado` para `reservado`, reduzindo `futuro`; só `para_estoque` volta a `emestoque`.

Se movimentação avulsa tiver reduzido a Reserva Prévia, prosseguir com o disponível e retornar alerta estruturado/persistível com quantidade esperada, movimentada e diferença. Isso não é erro nem requisição parcial.

Cancelamento de situação `A` é permitido mesmo com `qtderecebida > 0`: essa quantidade representa preparação, não envio parcial. Usar `qtdepedida` como expectativa, limpar `qtderecebida`, gravar situação `C`, observação e motivo, com TPE/TFR na mesma transação.

### Auditoria e revisão comum ao Delphi

Criar `pedidosfiliais_log_new` segundo o padrão de `clientes_log_new`, sem alterar nem substituir `pedidosfiliais_log`.

- gatilho PostgreSQL cobre INSERT, UPDATE e DELETE de qualquer cliente;
- preservar usuário do banco e registrar `app_user_id`, login, nome, `app_source` e `request_id` quando houver `DatabaseAuditContext`;
- escritas Delphi deixam campos de aplicação nulos, mas continuam auditadas;
- UPDATE registra diff; INSERT/DELETE registram tuple;
- o maior `trigger_id` aplicável ao conjunto da requisição é a Revisão da Requisição.

Alterar/cancelar deve bloquear a requisição, recalcular a revisão dentro da transação e rejeitar revisão esperada divergente sem movimentos. `datahoraalteracaousuario` permanece compatível, mas não é o token exclusivo porque o Cadastro Delphi nem sempre o atualiza.

Delphi e Laravel são escritores equivalentes: não criar campo de origem que conceda propriedade exclusiva.

## Limite arquitetural

Compartilhar:

- manifesto de parâmetros;
- persistência e leituras básicas do agregado;
- comandos transacionais de criar, alterar e cancelar;
- locks de duplicidade/estoque;
- política TEP/TPE/TFR;
- revisão e auditoria.

Manter específicos:

- Consulta: preview, candidatas, sugestão, distribuição, snapshots, soma de duplicata, controllers/requests/DTOs/tela;
- Cadastro: manutenção unitária, requisitante selecionável, pesquisa, controllers/requests/DTOs/tela.

Não criar DTO, controller, policy ou tela universal.

## Critérios de aceite

- [ ] As cinco descrições literais são as únicas consultadas e a matriz de falsos está testada.
- [ ] Os comandos resolvem parâmetros pela filial ativa e ignoram tentativas do frontend de defini-los.
- [ ] Criação usa a função legada no PostgreSQL.
- [ ] Duplicidade concorrente é serializada e preserva as diferenças Consulta/Cadastro.
- [ ] Locks e revalidação ocorrem dentro da transação e em ordem determinística.
- [ ] Criação, aumento, redução, troca e cancelamento produzem exatamente os deltas definidos.
- [ ] Liberação nunca excede a Reserva Prévia e prioriza Venda Futura.
- [ ] Divergência de Reserva Prévia confirma com alerta estruturado.
- [ ] Falha em qualquer etapa desfaz requisição, movimentos, estoques, log e revisão.
- [ ] `pedidosfiliais_log_new` identifica Laravel e detecta escrita Delphi; o log legado permanece intacto.
- [ ] Revisão obsoleta rejeita edição/cancelamento sem efeitos.
- [ ] Toda a suíte da Consulta de Compras permanece verde após ajustar somente fixtures com descrições erradas.

## Matriz mínima de testes

- parâmetro verdadeiro e cada forma falsa, com filial ativa diferente da requisitante;
- duplicatas permitidas/proibidas e duas transações simultâneas para a mesma tríade;
- TEP sem saldo, saldo exato e saldo alterado enquanto aguarda lock;
- aumento, redução, troca bem-sucedida e troca sem saldo com rollback total;
- liberação com Venda Futura menor, igual e maior; Reserva Prévia menor que a esperada;
- cancelamento aberto com `qtderecebida > 0`; cancelamento de situação não aberta;
- falhas injetadas após cabeçalho e após primeiro movimento;
- UPDATE direto simulando Delphi invalida a revisão Laravel;
- INSERT/UPDATE/DELETE no gatilho novo com e sem `DatabaseAuditContext`;
- duas operações com locks em ordem de entrada inversa terminam sem deadlock;
- regressão dos contratos HTTP e da soma de duplicata da Consulta.

Os testes de gatilho, advisory lock e concorrência devem rodar em PostgreSQL real; `markTestSkipped` não conta como aceite. Manter também cobertura SQLite para a suíte rápida.

## Saída esperada do SpecKit

Produza especificação e plano executáveis que identifiquem arquivos atuais a extrair/renomear, contratos públicos do núcleo, sequência segura de migração da Consulta, migrations de auditoria, estratégia PostgreSQL/SQLite e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- interface, menu, rotas e pesquisas do Cadastro manual;
- consulta geral, separação, transferência, expedição ou recebimento;
- alterar `qtderecebida` fora do cancelamento;
- reescrever Delphi, `pedidosfiliais_log` ou movimentos históricos;
- Pedido de Compra e demais recursos da Consulta;
- senha de supervisor, requisição parcial ou propriedade exclusiva por origem.
````
