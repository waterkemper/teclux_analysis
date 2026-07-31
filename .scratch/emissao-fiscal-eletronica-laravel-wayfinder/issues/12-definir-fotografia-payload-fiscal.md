# Definir a fotografia imutável do payload fiscal

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Quais dados de `dadosfiscais`, `notas` e tabelas auxiliares devem formar uma fotografia imutável e versionada no instante da emissão, quais cálculos e regras fiscais pertencem antes dessa fronteira, e como impedir que alterações cadastrais posteriores mudem XML, DANFE ou reprocessamento?

## Answer

### Fronteira da Fotografia Fiscal

A Fotografia Fiscal é um documento autocontido de valores já resolvidos, não um conjunto de referências para cadastros mutáveis. Ela preserva os IDs de origem para rastreabilidade, mas geração, retentativa e explicação fiscal nunca voltam a consultar cliente, produto, Filial ou regra atual para completar uma revisão selada.

Quando aplicável a NF-e/NFC-e, ela contém:

- identificação fiscal e técnica da nota;
- emitente, destinatário, entrega e retirada com documentos e endereços completos;
- documentos referenciados;
- itens com valores comerciais, unidades, códigos fiscais, NCM, CFOP, rastreabilidade e informações setoriais;
- bases, alíquotas, enquadramentos, benefícios e valores de todos os tributos por item;
- totais tributários e comerciais;
- frete, desconto, seguro, despesas, acréscimos e respectivos rateios;
- transporte, transportadora, veículo, volumes e lacres;
- cobrança, duplicatas, pagamentos, troco e dados da integração de pagamento;
- intermediador, autorizados no XML e responsável técnico;
- informações adicionais ao Fisco e ao contribuinte;
- ambiente, finalidade, presença, consumidor final, destino e modalidade de emissão/contingência;
- versões de schema, regras, tabelas fiscais, QR Code e configurações usadas;
- valores derivados necessários ao XML e DANFE.

Segredos como senha do Certificado A1 e CSC não entram. A fotografia guarda apenas identificadores/versionamento da configuração e os resultados derivados necessários.

### Cálculo antes da selagem

Todas as decisões fiscais acontecem antes da fotografia ser selada: CFOP, CST/CSOSN, enquadramentos, bases, alíquotas, reduções, diferimentos, desonerações, créditos, ICMS, IPI, PIS, COFINS, IBS, CBS, demais tributos, rateios, arredondamentos e totais.

Depois da selagem, o adapter fiscal somente serializa valores, calcula elementos estritamente técnicos como o dígito da chave, valida XSD e assina. Ele não consulta cadastros nem recalcula impostos.

### Preparação, alocação e velocidade

A construção ocorre em duas fases:

1. fora da transação de numeração, o Laravel resolve, calcula e valida uma candidata;
2. dentro da transação curta que bloqueia `seriesfiliais`, revalida a origem, acrescenta número, série, ambiente, datas e valores dependentes da alocação, calcula o hash final e sela a revisão.

Para não penalizar o frente de caixa, a preparação cria um fingerprint da origem e o fechamento faz uma consulta agregada de revalidação. Divergência aborta antes de consumir o número e recalcula. Valores já consolidados na própria venda são a origem fiscal da operação, evitando releitura repetida dos cadastros de produto.

Valores técnicos não determinísticos são definidos uma vez e preservados, incluindo `dhEmi`, `cNF`, ambiente, `tpEmis`, schema/regras, QR Code e configuração utilizada. Reiniciar job não altera chave, XML ou DANFE.

### Revisões imutáveis

Antes da alocação há apenas preparação descartável. A alocação cria a revisão 1 selada. Toda correção posterior, inclusive após rejeição local ou da SEFAZ, cria nova revisão vinculada à anterior, com motivo, Usuário/processo e hash próprios. Retentativa puramente técnica reutiliza a mesma revisão e o mesmo XML assinado. Revisões não são apagadas e a autorizada bloqueia correções de conteúdo.

Cada revisão é persistida como JSON autocontido com `schema_fotografia`, conteúdo, versões de regras/tabelas, serialização canônica, SHA-256, instante, origem e revisão anterior. Colunas relacionais servem à consulta, estado e vínculos; somente o JSON selado alimenta a geração. Formatos futuros recebem nova versão e adaptador capaz de ler fotografias antigas.

Na primeira versão, a imutabilidade é garantida pelos contratos da aplicação: não há edição/exclusão e toda correção insere revisão. Triggers e segregação adicional de permissões no PostgreSQL ficam como endurecimento futuro.

### Contingência

Se uma modalidade de contingência alterar `tpEmis`, chave, data/hora ou outro campo do XML, nasce nova revisão ligada à mesma Emissão e ao Episódio de Contingência. Ela reutiliza os valores comerciais/tributários e muda somente os campos permitidos. A revisão normal permanece preservada, e a derivação só ocorre depois de reconciliar eventual autorização anterior ou pelo caminho oficialmente permitido.

### XML e DANFE

A cadeia é determinística:

`Fotografia Fiscal selada → XML pré-assinado → XML assinado/processado → DANFE`

Depois de existir XML assinado, DANFE e reimpressão usam esse Artefato Fiscal arquivado, nunca cadastros atuais nem recálculo direto da fotografia.

### Retenção e acesso

A Fotografia Fiscal de produção segue a retenção de seis anos dos Artefatos Fiscais, sujeita a prazo jurídico maior. O acesso é restrito e auditado; conteúdo integral não aparece em listagens ou logs. Ao fim da obrigação, sua eliminação acompanha a política do XML, sem anonimização isolada que destrua a explicabilidade do documento ainda preservado.
