# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, o Motor de Custo (formação de custo e preço de venda por item), como um **serviço próprio e reaproveitável** — não uma rotina interna do Cadastro de Pedidos de Compra. Esta é a primeira de 8 fatias que juntas cobrem o Cadastro de Pedidos de Compra completo (Estoque → Compras); esta fatia é fundação para as specs 02-05 (Motor de Impostos) e 06-08 (telas do Cadastro de Pedidos), e serve também de base a um futuro módulo de Notas Fiscais de Entrada/NF-e (fora desta entrega).

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir um serviço de Motor de Custo com 4 operações:

- **Calcular custo** do item (`custototal`/`custoparavenda`).
- **Calcular preço de venda** sugerido do item, com precedência de markup em 3 níveis.
- **Propagar/atribuir preço** entre linhas relacionadas do mesmo documento (mesma característica).
- **Auto-cadastrar preço** para produto comprado pela primeira vez, sem coluna de preço ainda cadastrada.

Parametrizável por **origem do documento** (hoje só "Pedido de Compra" tem consumidor real; deixe o parâmetro de origem no contrato do serviço para viabilizar reaproveitamento futuro por Nota de Entrada — não implemente o lado de Nota de Entrada agora).

Não inclua nesta entrega: o motor de impostos (specs 02-05, consumido aqui só como dado de entrada já calculado quando necessário); qualquer tela do Cadastro de Pedidos de Compra (specs 06-08, que vão consumir este serviço).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmCalcularCusto.pas` (motor compartilhado) e `apps/estoque/dmcadastropedidos.pas` (ponto de consumo por Pedidos).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- Se já existe um serviço de precificação read-only reaproveitado por Consulta de Compras (`qryDetalhesCompra`/`DefinirValorProduto`) — **é um motor distinto** (leitura, não escrita); não confundir nem reaproveitar a implementação dele para este serviço de escrita.
- Tabelas/entidades de markup por produto, grupo de produto e fornecedor (para a precedência de 3 níveis).
- `specs/054-configuration-center` — para os Parâmetros do Sistema listados abaixo.
- Repositórios de preço (`precos`/`colunasprecos` ou equivalente Laravel) para a operação de auto-cadastro.

## Evidência Delphi confirmada

### Escopo e relação com o motor read-only (CONFIRMADO, `apps/estoque/dmCalcularCusto.pas`, 1.020 linhas)

`TdtmCalcularCusto` herda de `TdtmBasico` (mesma base do Motor de Impostos, specs 02-05) — usa a mesma infraestrutura, mas é uma peça distinta com 4 métodos públicos. É o motor de **escrita**: calcula e grava `custototal`/`custoparavenda`/`precovenda`/`precoatribuido`. É **diferente** do motor de leitura já usado em Consulta de Compras (que só exibe uma sugestão informativa, precedência preço-com-ICMS → última compra → custo médio) — não reaproveitar um pelo outro.

Confirmado compartilhado por escrita entre Cadastro de Pedidos e o módulo de Notas Fiscais de Entrada já existente no legado (`dmcadastronotasfiscais.pas`, 20.610 linhas), via o parâmetro `ParSistema.LocalCalculoPreco` (lido em ambos os módulos).

### Cálculo de custo (CONFIRMADO, `dmCalcularCusto.pas:274-486`)

```
PrecoCusto = (preço unitário × quantidade)
           + IPI (se produto não é contribuinte de IPI)
           + frete/despesas rateados proporcionalmente ao peso do item no total do documento
           + ICMS-ST de custo
           + frete do item
           − desconto do item

custoparavenda = custototal / quantidade / fatorconversao
```

Exceto em importação, `custoparavenda` **subtrai** ICMS e PIS/COFINS quando o regime tributário aplicável não é Simples Nacional e o produto não está em substituição tributária. `ParSistema.NaorateardescontoparacalculodeprecodevendanaNFE`, se ativo, faz a base de custo-para-venda ignorar (somar de volta) o desconto do item.

### Cálculo de preço de venda — precedência de markup (CONFIRMADO, `dmCalcularCusto.pas:489-704`)

```
markup = markup_produto_1 → markup_grupo_1 → markup do fornecedor → 0
```

(3 níveis de precedência — usar apenas esta versão; existe uma versão local mais simples em `dmcadastropedidos.pas`, código morto, ver seção "Achados a não replicar"). Reversão markup→preço quando `ParSistema.SugestaoPeloPrecoVenda` está ativo (preço de venda alvo → custo derivado, em vez de custo → markup → preço). Arredondamento final por múltiplo configurável (`ArredondarPrecoProduto`, precedência produto → grupo → classe → `ParSistema.MultiploPreco`).

### Propagação de preço entre linhas (CONFIRMADO, `AtribuirPreco`, `dmCalcularCusto.pas:114-258`)

Depois de calcular um preço sugerido para uma característica, varre todas as linhas do mesmo documento com a mesma característica+custo (ou mesma característica+código de preço) e atualiza o preço atribuído — **só se o novo valor for maior** que o já atribuído (modo "calculado": maior vence) ou **incondicionalmente** se foi edição manual (modo "digitado"). Se essa sugestão deve efetivamente atualizar o preço de venda **cadastrado** do produto (não só sugerir na linha), respeita `ParSistema.NaoAtualizarPrecoMenorQueAtual` (nunca baixar um preço cadastrado já maior).

### Auto-cadastro de preço para produto novo (CONFIRMADO, `IncluirPrecosNaoCadastrados`, `dmCalcularCusto.pas:722-1012`)

Para produtos sem coluna de preço cadastrada ainda: elegibilidade via `ParSistema.GerarPrecoAutomatico` + `ParSistema.LocalCalculoPreco` (mais, especificamente para Nota de Entrada — não relevante para Pedido de Compra agora — faixas de CFOP); tenta reaproveitar um código de preço de outra linha do mesmo documento com mesma característica+custo; senão, cria um novo registro de preço do zero. Produtos comprados pela primeira vez ganham preço de venda automaticamente ao gravar o pedido, sem passo manual em Manutenção de Preços.

### Parâmetros do Sistema desta fatia (CONFIRMADO)

| Parâmetro | Efeito |
|---|---|
| `GerarPrecoAutomatico` | Flag mestre: se falso, preço de venda não é recalculado automaticamente |
| `LocalCalculoPreco` (`lcpPEDIDO`/`lcpNOTAENTRADA`/`lcpAMBOS`) | Onde o cálculo roda — compartilhado com Nota de Entrada |
| `RetirarPISCONFINSCalPreco` | Se PIS/COFINS entram na fórmula de preço de venda |
| `SugestaoPeloPrecoVenda` | Inverte a direção da fórmula (preço-alvo → custo) |
| `MultiploPreco` | Arredonda o preço calculado para um múltiplo configurado |
| `NaoAtualizarPrecoMenorQueAtual` | Trava: não baixa um preço cadastrado já maior |
| `PrecoUnitarioCasasDecimais` | Casas decimais de arredondamento |
| `RegimeTributarioparaCalculodoCusto` | `4` = regime real; qualquer outro valor = força um regime fixo só para custo |
| `NaorateardescontoparacalculodeprecodevendanaNFE` | Se true, ignora o desconto na base de custo-para-venda |
| `Nao_somar_PISCONFINS_no_calculo_do_preco_de_venda` | Zera alíquotas de PIS/COFINS especificamente na fórmula de preço de venda (distinto do parâmetro acima, que afeta o custo) |

### Achados a não replicar

- `CalcularPrecoSugestao`/`CalcularPrecoSugestaoProdutos` (versão local em `dmcadastropedidos.pas`) são **código morto** — declaração de interface comentada, órfãs, nenhum ponto do sistema as invoca. O caminho real e ativo é sempre `CalcularCusto`/`CalcularPrecoVenda`, cascas finas que delegam a este serviço. Não reimplementar a versão local.

## Decisões obrigatórias

1. O serviço é desenhado como peça própria e reaproveitável, parametrizável por origem do documento (mesmo só implementando o lado Pedido de Compra agora).
2. Não confundir com o motor read-only já usado em Consulta de Compras — são dois serviços distintos, este é de escrita.
3. Fórmula de markup usa sempre a precedência de 3 níveis (produto → grupo → fornecedor → 0); não replicar a versão local simplificada (código morto).
4. Propagação de preço entre linhas respeita a regra "maior vence" (calculado) vs. incondicional (digitado), e a trava `NaoAtualizarPrecoMenorQueAtual`.
5. Produto novo sem preço cadastrado recebe preço automaticamente ao gravar o documento, condicionado a `GerarPrecoAutomatico`.

## Critérios de aceite

- [ ] `PrecoCusto`/`custoparavenda` do item batem com a fórmula documentada, incluindo os bypasses de importação/Simples/substituição tributária.
- [ ] Rateio de frete/despesas acessórias no custo é proporcional ao peso do item no total do documento.
- [ ] Fórmula de markup usa a precedência de 3 níveis (produto → grupo → fornecedor → 0); a versão local simplificada não é replicada.
- [ ] `NaoAtualizarPrecoMenorQueAtual` impede que a propagação de preço baixe um preço já maior.
- [ ] Produto comprado pela primeira vez (sem coluna de preço) recebe preço de venda automaticamente ao gravar o documento, condicionado a `GerarPrecoAutomatico`.
- [ ] `SugestaoPeloPrecoVenda` inverte corretamente a direção do cálculo quando ativo.

## Matriz mínima de testes

- **Rateio de custo**: documento com frete/despesas no cabeçalho e 3 itens de pesos diferentes → rateio proporcional bate, último item absorve o resto de arredondamento.
- **Produto novo sem preço**: item cuja característica não tem coluna de preço cadastrada → preço de venda é criado automaticamente ao gravar, respeitando `GerarPrecoAutomatico`.
- **Propagação — maior vence**: duas linhas com mesma característica, uma calculada com preço menor que a já atribuída → preço atribuído não muda; preço maior → atualiza.
- **Propagação — edição manual incondicional**: usuário edita manualmente o preço de uma linha → propaga incondicionalmente, mesmo sendo menor.
- **`NaoAtualizarPrecoMenorQueAtual` ativo**: sugestão calculada abaixo do preço cadastrado atual → preço cadastrado não é baixado.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais das 4 operações do Motor de Custo;
- identifiquem os repositórios/serviços Laravel atuais a estender ou criar, após inspecioná-los;
- detalhem as fórmulas de custo, preço de venda, propagação e auto-cadastro acima;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem o serviço como reaproveitável por origem de documento (Pedido de Compra hoje; Nota de Entrada como extensão futura, não implementada agora);
- não mandem investigar Delphi, nem inventem lógica de motor de impostos ou de telas do Cadastro de Pedidos.

## Fora de escopo

- implementar durante `/speckit.specify`;
- o motor de impostos (specs 02-05) — consumido aqui só como entrada já calculada, quando necessário;
- qualquer tela do Cadastro de Pedidos de Compra (specs 06-08);
- o lado Nota de Entrada do parâmetro de origem — documentar o contrato para viabilizar, não implementar;
- alterar o schema Delphi ou desativar qualquer tela Delphi.

estrutura das tabelas no banco:

                             Tabela "public.pedidos"
             Coluna             |          Tipo          |     Modificadores     
--------------------------------+------------------------+-----------------------
 numero                         | integer                | não nulo
 emissao                        | date                   | não nulo
 fornecedor                     | integer                | não nulo
 filialfatura                   | smallint               | não nulo
 filialentrega                  | smallint               | não nulo
 filialcobranca                 | smallint               | não nulo
 referencia                     | character(15)          | 
 database                       | date                   | não nulo
 fornecedortransporte           | integer                | 
 motivo                         | smallint               | 
 fretenota                      | numeric(5,2)           | 
 fretectr                       | numeric(5,2)           | 
 desconto1                      | numeric(5,2)           | 
 desconto2                      | numeric(5,2)           | 
 desconto3                      | numeric(5,2)           | 
 desconto4                      | numeric(5,2)           | 
 acrescimo1                     | numeric(5,2)           | 
 acrescimo2                     | numeric(5,2)           | 
 acrescimo3                     | numeric(5,2)           | 
 acrescimo4                     | numeric(5,2)           | 
 estado                         | character(2)           | 
 entrega                        | date                   | 
 observacoes                    | character varying(500) | 
 cancelado                      | date                   | 
 situacao                       | character(1)           | não nulo
 concluido                      | date                   | 
 contato                        | character varying(30)  | 
 observacoes_estoque            | character varying(500) | 
 valorconhecimentofrete         | numeric(11,2)          | 
 valorprodutos                  | numeric(11,2)          | 
 icmsconhecimentofrete          | numeric(11,2)          | 
 freteinterno                   | numeric(11,2)          | 
 baseicmscalculada              | numeric(15,2)          | 
 baseicmssubstituicaocalculada  | numeric(15,2)          | 
 vbcstretdesp                   | numeric(11,2)          | 
 valoricmscalculada             | numeric(15,2)          | 
 valoricmssubstituicaocalculada | numeric(15,2)          | 
 vicmsstretdesp                 | numeric(11,2)          | 
 valoripicalculada              | numeric(15,2)          | 
 valornotacalculada             | numeric(15,2)          | 
 baseicmssubstituicao           | numeric(15,2)          | 
 valoricmssubstituicao          | numeric(15,2)          | 
 desconto                       | numeric(11,2)          | 
 descontoitem                   | numeric(11,2)          | 
 acrescimo                      | numeric(11,2)          | 
 seguro                         | numeric(11,2)          | 
 despesasacessorias             | numeric(11,2)          | 
 totalvalorpis                  | numeric(11,2)          | 
 totalvalorcofins               | numeric(11,2)          | 
 valorproduto                   | numeric(11,2)          | 
 crt                            | smallint               | 
 regimetributario               | smallint               | 
 recebido                       | boolean                | valor padrão de false
Índices:
    "pkpedidos_numero" PRIMARY KEY, btree (numero)
Restrições de verificação:
    "ckpedidos_situacao" CHECK (situacao = 'A'::bpchar OR situacao = 'C'::bpchar OR situacao = 'L'::bpchar OR situacao = 'P'::bpchar OR situacao = 'Q'::bpchar)
    "pedidos_crt_check" CHECK (crt = ANY (ARRAY[1, 2, 3]))
    "pedidos_regimetributario_check" CHECK (regimetributario = ANY (ARRAY[1, 2, 3]))
Restrições de chave estrangeira:
    "fknpedidos_filialcobranca" FOREIGN KEY (filialcobranca) REFERENCES filiais(codigo)
    "fknpedidos_filialentrega" FOREIGN KEY (filialentrega) REFERENCES filiais(codigo)
    "fknpedidos_filialfatura" FOREIGN KEY (filialfatura) REFERENCES filiais(codigo)
    "fkpedidos_estado" FOREIGN KEY (estado) REFERENCES estados(codigo)
    "fkpedidos_fornecedor" FOREIGN KEY (fornecedor) REFERENCES fornecedores(codigo)
    "fkpedidos_fornecedortransporte" FOREIGN KEY (fornecedortransporte) REFERENCES fornecedores(codigo)
    "fkpedidos_motivo" FOREIGN KEY (motivo) REFERENCES motivos(codigo)
Referenciada por:
    TABLE "documentospag" CONSTRAINT "fkdocumentospag_pedido" FOREIGN KEY (pedido) REFERENCES pedidos(numero)
    TABLE "previsoespedidos" CONSTRAINT "fkprevisoespedidos_pedido" FOREIGN KEY (pedido) REFERENCES pedidos(numero) ON DELETE CASCADE
    TABLE "produtosnotaspag" CONSTRAINT "fkprodutosnotaspag_pedido" FOREIGN KEY (pedido) REFERENCES pedidos(numero)
    TABLE "produtospedidos" CONSTRAINT "fkprodutospedidos_pedido" FOREIGN KEY (pedido) REFERENCES pedidos(numero) ON DELETE CASCADE
    TABLE "pedidosnotaspag" CONSTRAINT "pedidosnotaspag_pedido_fkey" FOREIGN KEY (pedido) REFERENCES pedidos(numero) ON DELETE CASCADE
Gatilhos:
    pedidos_antesinserir BEFORE INSERT ON pedidos FOR EACH ROW EXECUTE PROCEDURE pedidos_antesinserir()

     Tabela "public.previsoespedidos"
   Coluna   |     Tipo     | Modificadores 
------------+--------------+---------------
 pedido     | integer      | não nulo
 numero     | smallint     | não nulo
 dias       | smallint     | não nulo
 percentual | numeric(5,2) | não nulo
Índices:
    "pkprevisoespedidos" PRIMARY KEY, btree (pedido, numero)
Restrições de chave estrangeira:
    "fkprevisoespedidos_pedido" FOREIGN KEY (pedido) REFERENCES pedidos(numero) ON DELETE CASCADE
Gatilhos:
    previsoespedidos_antesinserir BEFORE INSERT ON previsoespedidos FOR EACH ROW EXECUTE PROCEDURE previsoespedidos_antesinserir()

                           Tabela "public.produtospedidos"
           Coluna            |          Tipo          |        Modificadores         
-----------------------------+------------------------+------------------------------
 pedido                      | integer                | não nulo
 produto                     | bigint                 | não nulo
 numero                      | integer                | não nulo
 quantidade                  | numeric(11,3)          | não nulo
 preco                       | numeric(17,8)          | não nulo
 desconto                    | numeric(7,2)           | 
 valoripi                    | numeric(11,2)          | 
 valoricms                   | numeric(11,2)          | 
 importadodaico              | boolean                | valor padrão de false
 fatorconversao              | numeric(10,6)          | valor padrão de 1
 despesasacessorias          | numeric(11,2)          | 
 frete                       | numeric(11,2)          | 
 iivalor                     | numeric(15,2)          | 
 acrescimo                   | numeric(11,2)          | 
 seguro                      | numeric(11,2)          | 
 aliquotaipi                 | numeric(5,2)           | 
 icmsvalorstcusto            | numeric(11,2)          | 
 fatorsubstituicao_custo     | numeric(5,4)           | 
 aliquotaicmsst_custo        | numeric(5,2)           | 
 pisaliquota                 | numeric(5,2)           | 
 pisvalor                    | numeric(15,2)          | 
 cofinsaliquota              | numeric(5,2)           | 
 cofinsvalor                 | numeric(15,2)          | 
 icmsvalor                   | numeric(15,2)          | 
 aliquotaicms                | numeric(5,2)           | 
 pcredsn                     | numeric(11,2)          | 
 vcredicmssn                 | numeric(15,2)          | 
 csosn                       | character(3)           | 
 incidencia                  | character(2)           | valor padrão de '00'::bpchar
 piscst                      | character(2)           | 
 cofinscst                   | character(2)           | 
 codigofiscal                | integer                | 
 classificacaofiscal         | character varying(8)   | 
 cst_produto                 | character(2)           | 
 csosn_produto               | character(3)           | 
 cst_nf                      | character(2)           | 
 csosn_nf                    | character(3)           | 
 markup_grupo                | numeric(5,2)           | 
 markup_fornecedor           | numeric(5,2)           | 
 markup_produto              | numeric(5,2)           | 
 produtodigitado             | character varying(32)  | 
 valordescontoitem           | numeric(11,2)          | 
 unidadenf                   | character(8)           | 
 unidade                     | character(8)           | 
 qtdeestoque                 | numeric(11,3)          | 
 percentualreducaobase       | numeric(6,2)           | 
 valorreducaobase            | numeric(6,2)           | 
 icmsbasecalculo             | numeric(15,2)          | 
 pmvast                      | numeric(5,2)           | 
 predbcst                    | numeric(5,2)           | 
 reducaobasest               | numeric(11,2)          | 
 icmsbasecalculost           | numeric(11,2)          | 
 aliquotaicmsst              | numeric(5,2)           | 
 icmsvalorst                 | numeric(11,2)          | 
 ipicst                      | character(2)           | 
 ipibasecalculo              | numeric(11,2)          | 
 valoripidigitado            | boolean                | valor padrão de false
 valoricmsdigitado           | boolean                | valor padrão de false
 icmsoutrasdigitado          | boolean                | valor padrão de false
 valorpisdigitado            | boolean                | valor padrão de false
 valorcofinsdigitado         | boolean                | valor padrão de false
 valoricmsstdigitado         | boolean                | valor padrão de false
 descontodigitado            | boolean                | valor padrão de false
 fretedigitado               | boolean                | valor padrão de false
 natureza                    | integer                | 
 baseicms                    | numeric(11,2)          | 
 descricaoproduto            | character varying(120) | 
 genero                      | smallint               | 
 extipi                      | character varying(3)   | 
 icmsmodalidade              | smallint               | 
 icmsmodsubst                | smallint               | 
 tribcodigoean               | character varying(14)  | 
 tribunidade                 | character varying(6)   | 
 tribquantidade              | numeric(12,4)          | 
 tribunitario                | numeric(16,4)          | 
 enquadramento               | smallint               | 
 iibasecalculo               | numeric(11,2)          | 
 iidespaduaneira             | numeric(15,2)          | 
 iiiof                       | numeric(15,2)          | 
 pisbasecalculo              | numeric(15,2)          | 
 cofinsbasecalculo           | numeric(15,2)          | 
 icmsbasecalculostcusto      | numeric(11,2)          | 
 icmsbasecalculo_custo       | numeric(15,2)          | 
 embalagem                   | numeric(15,2)          | 
 thc                         | numeric(15,2)          | 
 naotribipi                  | numeric(15,2)          | 
 naotribicms                 | numeric(15,2)          | 
 fatorsubstituicao           | numeric(5,4)           | 
 vbcstret                    | numeric(11,2)          | 
 vicmsstret                  | numeric(11,2)          | 
 icmsisentas                 | numeric(15,2)          | 
 icmsoutras                  | numeric(15,2)          | 
 ipioutras                   | numeric(15,2)          | 
 ipiisentas                  | numeric(15,2)          | 
 naogerarcreditoicms         | boolean                | valor padrão de false
 naogerarcreditoipi          | boolean                | valor padrão de false
 naocalcularipisobrefrete    | boolean                | valor padrão de false
 aliquotaicms_custo          | numeric(5,2)           | 
 icmsvalor_custo             | numeric(15,2)          | 
 icmssobreipi                | boolean                | valor padrão de false
 origem                      | integer                | 
 percentualreducaobase_custo | numeric(6,2)           | 
 valorreducaobase_custo      | numeric(15,2)          | 
 predbcst_custo              | numeric(6,2)           | 
 valorreducaobasest_custo    | numeric(15,2)          | 
 ipicst_nf                   | character(2)           | 
 icmssobredespesasacessorias | boolean                | valor padrão de false
 vbcstretdesp                | numeric(11,2)          | 
 vicmsstretdesp              | numeric(11,2)          | 
 percreducaomva              | numeric(5,2)           | 
 pfcp                        | numeric(7,4)           | 
 vfcp                        | numeric(15,2)          | 
 vbcfcpst                    | numeric(15,2)          | 
 pfcpst                      | numeric(7,4)           | 
 vfcpst                      | numeric(15,2)          | 
 vbcfcp                      | numeric(15,2)          | 
 vbcfcpstret                 | numeric(15,2)          | 
 pfcpstret                   | numeric(7,4)           | 
 vfcpstret                   | numeric(15,2)          | 
 vbcfcpufdest                | numeric(15,2)          | 
 pst                         | numeric(7,4)           | 
 atualizarprecovenda         | boolean                | valor padrão de false
 dataentrega                 | date                   | 
Índices:
    "pkprodutospedidos" PRIMARY KEY, btree (pedido, numero, produto)
    "iprodutospedidos_pedido" btree (pedido)
    "ixprodutospedidos_produto" btree (produto)
Restrições de chave estrangeira:
    "fkprodutospedidos_natureza" FOREIGN KEY (natureza) REFERENCES naturezas(codigo)
    "fkprodutospedidos_pedido" FOREIGN KEY (pedido) REFERENCES pedidos(numero) ON DELETE CASCADE
    "fkprodutospedidos_produto" FOREIGN KEY (produto) REFERENCES produtos(codigo)
Referenciada por:
    TABLE "produtosnotaspag" CONSTRAINT "fkprodutosnotaspag_produtospedidos" FOREIGN KEY (pedido, numeroprodutotabela, produto) REFERENCES produtospedidos(pedido, numero, produto) ON UPDATE CASCADE





```


