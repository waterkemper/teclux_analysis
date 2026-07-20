Type: task
Status: resolved
Blocked by: 11, 16

## Question

Quais casos dourados Delphi confirmam a quantidade restante e a cobertura `F/P/N`, a seleção parcial por item/lote/série, a separação de produtos e serviços, a escolha de Natureza Padrão/CFOP, os rateios financeiros e os efeitos distintos de venda normal, mercadoria sem trânsito e simples faturamento/remessa?

Produzir matriz de entradas, documento(s) planejado(s), movimentos, situação resultante, falhas e compensações. Não implementar emissor nem incluir `P/N` no primeiro spec do Cadastro.

## Answer

O Delphi confirma a cobertura fiscal como uma conta de quantidades documentadas, não como uma situação escolhida. Também confirma que simples faturamento, simples remessa, venda normal, mercadoria sem trânsito, produtos e serviços não podem ser reduzidos a um único fluxo. O novo desenho deve preservar esses resultados sem reproduzir a rotina monolítica de gravação/emissão.

### Identidade da obrigação e cobertura

- `CONFIRMADO` — Para produtos sem lote, o restante legado é `sum(quantidade - cancelado) - sum(quantidade em produtosdadosfiscais)`. Para produtos com lote, a mesma conta é feita por `produto + filial + lote`. Só entram documentos com `dadosfiscais.situacao = 'N'`; nota vinculada e simples faturamento são excluídos. Evidência SQL: `dmcadastrocontratos.dfm:5133-5426`.
- `CONFIRMADO` — O SQL legado tenta considerar o contrato atual e o `primogenito`: `RefazConsultaProdutosEntregar` envia ambos em `dmcadastrocontratos.pas:12606-12620`; o CTE e os dois ramos estão em `dmcadastrocontratos.dfm:5148-5265` e `5317-5407`.
- `DIVERGENTE` — `coalesce(numero, primogenito)` e uniões implícitas por linhagem tornam difícil provar qual linha comercial foi coberta. Não usar `primogenito` como identidade fiscal.
- `DECISÃO NOVA` — Cada linha comercial faturável recebe uma identidade estável de obrigação. Contrato derivado só herda cobertura mediante transferência explícita dessa identidade; `primogenito` permanece metadado. Restante é `obrigação vigente - alocações de documentos autorizados e não cancelados`.
- `DECISÃO NOVA` — `F/P/N` é projeção: `F` sem cobertura autorizada; `P` com cobertura parcial; `N` com cobertura integral de todas as obrigações fiscalizáveis. Rascunho, submissão ou rejeição não altera a situação.

### Matriz de casos dourados

| Caso | Entrada e seleção | Plano/documentos | Movimento | Situação e falha/compensação |
|---|---|---|---|---|
| Faturamento comercial | contrato `R`, produtos/serviços, financeiro e gates válidos | nenhum documento fiscal | consolida reserva/financeiro; sem baixa fiscal | `F`; falha atômica conserva `R` |
| Venda normal total | `F`, produto 10, selecionar 10 | um plano de venda com Natureza/CFOP resolvidos | autorização consome reserva 10 e vincula movimento | `N`; rejeição conserva `F` e reserva |
| Venda normal parcial | `F`, produto 10, selecionar 4 | um plano com alocação 4 | consome 4 após autorização | `P`, restante 6; segundo documento de 6 leva a `N` |
| Parcial por lote | produto 5: L1=3/L2=2; selecionar L1=3 | aloca obrigação e lote L1 | consome somente reserva de L1 | `P`; selecionar 4 de L1 falha antes de preparar |
| Produto seriado | quantidade 3; selecionar 2 e séries S1/S2 | duas séries ligadas à alocação | consumo das duas unidades na confirmação | `P`; série vazia, repetida ou já alocada falha |
| Produto + serviço não conjugado | produto 100, serviço 50 | documento de produto e documento de serviço ligados à mesma solicitação | estoque somente no produto | cobertura só integral quando ambos autorizados |
| Produto + serviço conjugado | mesma entrada, modalidade conjugada compatível | um documento contendo ambos | estoque somente no produto | autorização cobre ambas as obrigações |
| Simples faturamento | item de venda futura e parâmetro ativo | documento de simples faturamento | nenhum consumo físico; cria vínculo para remessa | não cobre a obrigação de saída; rejeição não muda cobertura |
| Simples remessa | documento de simples faturamento autorizado e saldo disponível | remessa referenciando o documento anterior | consome reserva/estoque e séries/lotes selecionados | cobertura de saída progride; cancelamento recalcula e compensa |
| Sem trânsito pelo estabelecimento | usuário informa que mercadoria não sai da empresa | natureza padrão específica | efeito derivado da natureza configurada, não da resposta isolada | ausência/ambiguidade de natureza bloqueia |
| Origem em outra filial | item de filial diferente, transferência automática permitida | venda + pedido de transferência correlacionado | movimento na origem e efeito de transferência idempotente | transferência não permitida bloqueia o plano |
| Cancelamento fiscal | documento autorizado cobrindo 4 de 10 | marca alocações inválidas/canceladas | movimentos compensatórios e eventual recomposição de reserva | `P→F` se nenhuma cobertura restar; nunca apagar histórico |

### Seleção, lotes e séries

- `CONFIRMADO` — O Delphi persiste uma marca booleana `incluirnanotafiscal`, impede selecionar item cancelado/já emitido e oferece marcar todos. Evidência: `dmcadastrocontratos.pas:9762-9838` e evento da tela `fmcadastrocontratos.pas:3564-3568`.
- `CONFIRMADO` — Depois da marcação, o legado calcula o restante e limita a quantidade ao reservado, com `FOR UPDATE` sobre estoque e estoque por lote. Evidência: `dmcadastrocontratos.pas:10438-10464`, `10523-10646` e `10685-10835`.
- `INFERIDO` — A interface marca a linha inteira e o backend escolhe o restante possível; não foi localizada entrada autoritativa de quantidade parcial arbitrária por linha. O Laravel precisa de seleção explícita porque emissão parcial é requisito do domínio, não cópia da limitação visual.
- `CONFIRMADO` — Séries capturadas no faturamento são copiadas para `produtosdadosfiscaisseries` conforme a quantidade selecionada. As já usadas em documento `N` do mesmo contrato são removidas da lista disponível. Evidência: `dmcadastrocontratos.pas:9554-9578` e SQL `dmcadastrocontratos.dfm:12435-12468`.
- `NÃO LOCALIZADO` — Não há prova de unicidade global da série entre contratos; o filtro Delphi restringe a busca ao contrato atual.
- `DECISÃO NOVA` — A preparação deve bloquear alocações por identidade de linha/lote/série e garantir unicidade de `produto + série` entre solicitações ativas/documentos válidos. Quantidade seriada deve ser inteira e igual ao número de séries.

### Produtos, serviços e rateios

- `CONFIRMADO` — O Delphi gera documento conjugado quando configurado; caso contrário, produtos e serviços seguem documentos separados, com séries fiscais e vencimentos próprios. Evidência: `dmcadastrocontratos.pas:11136-11233`.
- `CONFIRMADO` — Acréscimo, descontos financeiro/geral/cashback, frete, seguro, IPI e desconto de item são rateados pela quantidade selecionada. No último lote/documento, o legado aplica o resíduo para fechar o total original. Evidência: `dmcadastrocontratos.pas:8959-9113`; agregados emitidos estão no SQL `dmcadastrocontratos.dfm:9837-9870`.
- `DECISÃO NOVA` — O planejador usa os valores faturados imutáveis, rateia proporcionalmente em precisão fiscal e atribui o resíduo à última alocação elegível. Documentos não recriam parcelas; vencimentos são fotografia/rateio do compromisso de `F`.
- `DECISÃO NOVA` — Produto e serviço são obrigações separadas, mesmo quando materializadas em documento conjugado. Isso permite cobertura, rejeição e consulta sem inferir pela quantidade de cabeçalhos fiscais.

### Natureza Padrão, CFOP e modalidades

- `CONFIRMADO` — O usuário pode informar se os produtos saem da empresa quando `Possuivendasemtransitopeloestabelecimento` está ativo; isso escolhe Natureza Padrão distinta para venda normal/produção própria sem trânsito. Evidência: `dmcadastrocontratos.pas:2710-2715` e `9513-9526`.
- `CONFIRMADO` — O Delphi resolve naturezas distintas para venda normal, produção própria, substituto/substituição, brinde, garantia, cortesia, prestação, simples faturamento e simples remessa. Evidência: `dmcadastrocontratos.pas:9400-9526` e `11763-11904`.
- `CONFIRMADO` — Simples faturamento é detectado por `NotasSimplesFaturamentoemVendaFutura`; a remessa posterior guarda `dadofiscalsimplesfaturamento` e ajusta CFOP conforme produção própria. Evidência: `dmcadastrocontratos.pas:7616-7621`, `7748-7757` e `11764-11791`.
- `CONFIRMADO` — Na fase simples faturamento, o legado pula a criação dos movimentos; na remessa vinculada, volta ao fluxo de estoque. Evidência: guardas em `dmcadastrocontratos.pas:10189`, `10295`, `10526` e `10704`.
- `DÚVIDA` — A resposta “não sai da empresa” muda claramente a Natureza, mas o efeito físico final depende de `tipomovimento/ind_mov_fisica` configurados. Não assumir que “sem trânsito” sempre baixa ou nunca baixa estoque.
- `DECISÃO NOVA` — `FiscalDocumentPlanner` particiona a seleção por perfis fiscais compatíveis e resolve Natureza Padrão, CFOP, tipo de movimento, indicador de movimento físico, modalidade produto/serviço e vínculos. Configuração ausente ou ambígua bloqueia; não existe fallback silencioso.
- `DIVERGENTE` — O Laravel possui cadastros e consultas de `naturezas`, `naturezaspadrao`, CFOP e tipo de movimento, mas não um planejador fiscal de Contrato. Evidência: `NaturezaVendaService.php`, `LegacyNaturezaRepository.php` e `LegacyNaturezasPadraoRepository.php`.

### Estados duráveis, falhas e compensações

- `DECISÃO NOVA` — Dividir o futuro fluxo em: `PrepararSolicitacaoFiscal` (fotografia, alocações, locks curtos, natureza/CFOP e rateios), `SubmeterDocumentoFiscal` (integração idempotente) e `ConfirmarResultadoFiscal` (autorização, cobertura, estoque, vínculos e outbox).
- `DECISÃO NOVA` — Estados mínimos: `preparada`, `submetida`, `autorizada`, `rejeitada`, `cancelada`. Preparação expirada/rejeitada libera alocações sem movimento; autorização aplica efeitos uma vez; cancelamento cria compensações e recalcula cobertura.
- `DECISÃO NOVA` — Chave idempotente inclui contrato, revisão faturada, modalidade e comando. Locks incidem sobre restante, reserva, lote e série. Duas preparações concorrentes não podem alocar a mesma unidade.
- `CONFIRMADO` — O legado liga ao `dadofiscal` produtos, séries, movimentos, transferências e compostos: `dmcadastrocontratos.pas:11938-11989`.
- `CONFIRMADO` — O Laravel atual apenas projeta `F/P/N` e consulta documentos; não foi localizado planejador, transmissão ou confirmação fiscal de Contrato. `ContratoSituacaoDocumentalMapper.php` reconhece os estados, enquanto Consulta/Ficha leem `dadosfiscais`.

## Spec boundary

- **Pronto para `$to-spec`:** `FaturarContrato` de `R→F`, usando os gates de séries, reserva, conferência e financeiro já confirmados, sem criar documento fiscal.
- **Pronto para um `$to-spec` fiscal próprio:** preparação/seleção e planejamento, incluindo cobertura, produtos/serviços, lotes, séries, Natureza/CFOP e rateios.
- **Deve permanecer em specs posteriores:** submissão ao emissor/SEFAZ e confirmação/compensação. `P/N`, simples faturamento/remessa e venda sem trânsito não entram no primeiro spec do Cadastro.

## Próximo passo

O caminho fiscal está delimitado até o planejamento. A próxima fronteira numérica é [Confirmar casos dourados de modalidades e capacidade logística](19-confirmar-casos-dourados-de-modalidades-e-capacidade-logistica.md). Rollout e ordem final dos specs permanecem no nevoeiro até as demais fatias abertas serem resolvidas.
