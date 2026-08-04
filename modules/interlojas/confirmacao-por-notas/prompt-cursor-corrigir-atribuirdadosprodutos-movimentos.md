# Prompt direto para Cursor — corrigir materialização da nota de entrada

```text
Corrija a implementação Laravel existente de **Interlojas → Confirmação por Notas**, exclusivamente no fluxo transacional de confirmação de uma nota, para obter paridade comprovada com o Delphi na materialização de `produtosnotaspag`, no cálculo fiscal da entrada e na geração dos movimentos-raiz `STC`/`FTR`.

## Fontes obrigatórias

Leia integralmente antes de alterar código:

- `modules/interlojas/confirmacao-por-notas/pesquisa-atribuir-dados-produtos-e-movimentos.md`;
- `modules/interlojas/confirmacao-por-notas/pesquisa-transacao-delphi.md`;
- `modules/interlojas/confirmacao-por-notas/04-speckit-prompt-confirmacao-transacional.md`, apenas como contexto da fatia já implementada;
- `/docs/adr/304-confirmacao-notas-idempotencia-atomicidade.md`;
- `/docs/adr/0160-lancamentos-avulsos-trigger-aware-sync.md`;
- `/backend/app/Application/Interlojas/ConfirmacaoPorNotas/Commands/ConfirmarConfirmacaoPorNotasNotaCommand.php`;
- `/backend/app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConfirmacaoPorNotasBatchReadRepository.php`;
- `/backend/app/Infrastructure/Persistence/Legacy/Interlojas/ConfirmacaoPorNotasEntradaMapper.php`;
- `/backend/app/Infrastructure/Persistence/Legacy/Interlojas/LegacyConfirmacaoPorNotasWriteRepository.php`.

### Sequência exata no Delphi como base

Para cada nota, `ConfirmaTransferencia`: relê `dadosfiscais`, itens e vencimentos; cria `notaspag`; inicia cada `produtosnotaspag` e chama explicitamente `AtribuirDadosProdutos(..., TransferenciaEntrada, EstadoFilialBase)`; inclui financeiro; chama `CalcularImpostos`; bloqueia estoques; inclui `STC`/`FTR`; atualiza pedidos; aplica tudo atomicamente; depois registra ROS/ROE e recalcula romaneio. Preserve: materialização → cálculo fiscal → estoque/movimentos → pedidos → commit.

### Item antes da atribuição

```text
codigonota          = novo notaspag.codigo
numero              = produtosdadosfiscais.numero
filial              = FilialBase/destino
filial_estoque      = FilialEstoque resolvida
produto             = produtosdadosfiscais.produto
dadofiscal          = produtosdadosfiscais.dadofiscal
numeroprodutotabela = produtosdadosfiscais.numero
```

A chamada usa `CodigoFiscalProduto=nil`, `IPISuspenso=false`, `OrigemCalculo=TransferenciaEntrada` e `EstadoDestino=EstadoFilialBase`. Como `dadofiscal` e `numeroprodutotabela` são não zero, seleciona `SQLDadosProdutosNotasSaidas`.

### Binds e núcleo do SQL

```text
:dadofiscal=item.dadofiscal; :NumeroProduto=item.numeroprodutotabela
:produto=item.produto; :FilialBase=Filial destino
:codigonota=novo notaspag.codigo; :fornecedor=Filial emissora
:tipofornecedor='L'; :EstadoFilialBaseCalculoPreco=UF destino
```

```sql
FROM produtosdadosfiscais pdf
JOIN produtos p ON p.codigo = pdf.produto
JOIN estoques e ON e.produto = p.codigo
JOIN caracteristicas c ON c.codigo = p.caracteristica
LEFT JOIN tributosicms ti ON ti.codigo = c.incidencia
JOIN grupos g ON g.codigo = c.grupo
JOIN classes cl ON cl.codigo = c.classe
JOIN precos pr ON pr.caracteristica=p.caracteristica AND pr.codigo=p.preco
LEFT JOIN lotes l ON l.lote=pdf.lote
CROSS JOIN filiais f
WHERE pdf.dadofiscal=:dadofiscal
  AND pdf.numero=:NumeroProduto
  AND p.codigo=:produto
  AND e.filial=:FilialBase
  AND f.codigo=:FilialBase
```

A projeção também usa `grades`, `unidades`, `ipi`, `ncmtabela`, `estadosicms`, `vfornecedores` e apropriações anteriores em `produtosnotaspag`/`notaspag`.

### Quantidade ainda apropriável

```sql
pdf.quantidade - COALESCE((
 SELECT SUM(pnp.quantidade)
 FROM produtosnotaspag pnp JOIN notaspag np ON np.codigo=pnp.codigonota
 WHERE np.situacao='N' AND pnp.produto=pdf.produto
   AND pnp.numeroprodutotabela=pdf.numero
   AND pnp.dadofiscal=pdf.dadofiscal
   AND pnp.codigonota<>:codigonota
),0)
```

O princípio “original menos já apropriado” também vale, quando presentes, para bases/valores de ICMS, ICMS-ST, IPI, PIS, COFINS, ST retido, descontos, frete e despesas. Preserve-o sem N+1.

### Campos materializados

O ramo atribui `quantidade=quantidade calculada`, `precounitario=pdf.precovenda`, `fatorconversao=1` e `qtdeestoque=pdf.quantidade`. Também materializa: identidades fiscal/original; `origem`; `composto`; descrição/códigos/referência/grades; unidades e GTIN; NCM, gênero, EX TIPI, enquadramento e IBPT; lote/validade/fabricação; pesos/dimensões; CST/CSOSN cadastrais e CST/CSOSN da NF em campos distintos (`cst_nf`/`csosn_nf`); modalidade/base/alíquota/valor de ICMS e ICMS-ST; ICMS devolvido, ST retido, FCP e crédito SN; CST/base/alíquota/valor de IPI, PIS e COFINS; descontos, redução, acréscimo, frete, seguro, despesas e isentas/outras.

Depois executa cálculo/revisão por item (`AtribuirDadosCalculosImpostos`, `TransferenciaEntrada`, `reverNatureza=true`, UF destino), copia/rateia valores da nota relacionada e, fora do loop, executa `CalcularImpostos` agregado. Um insert simples não substitui essas etapas sem prova do DDL PostgreSQL.

### Cabeçalho `notaspag`

```text
codigo=notaspag_proximocodigo(); fornecedor/tipo=Filial emissora/'L'
filial=Filial destino; serie/numero=dadosfiscais.serie/numeronota
estado/modelodocto/chv_nfe=fotografia fiscal
clientecontribicms/crt=cadastro/regime da emissora
emissao=dadosfiscais.data; data=data servidor
cnpj/IE=emissora; valornota e totais ICMS/ICMS-ST/FCP=dado fiscal
observacoes=dado fiscal; vendatransferencia=origem real
dadofiscalreferenciado=dadosfiscais.numero; situacao='N'
```

A natureza distingue compra por transferência, entrada de devolução e entrada comum de transferência. Não hardcode modelo, CRT ou totais zerados.

### Movimentos-raiz

O Delphi percorre não compostos antes de compostos. `STC`: `numero=movimentos_proximonumero()`, produto, `filial=item.filial_estoque`, `cliente/tipo=item.filial/'L'`, quantidade do item, `valor=round(quantidade*precounitario,2)`, referência `NF-{numero} S-{serie} TRANSFERENCIA`, `codigonota` e `numerocontrole=item.numero`. Se `estoque.futuro>0`, cria `FTR` com `min(futuro, quantidade)` e valor proporcional. A aplicação escolhe tipos/inputs; triggers completam operação, saldos, financeiro, projeções e derivados.

### Estoque ausente

O Delphi procura `estoques(produto, FilialBase)` antes do SQL. Se ausente, cria linha com `emestoque`, `reservado`, `transito`, `demonstracao`, `conserto`, `futuro`, `danificada`, `estoquefisico`, `reservaprevia`, `acabados` e `semiacabados` zerados. Use isso como referência ao tomar a decisão arquitetural exigida adiante.

## Premissa que deve ser corrigida

Não presuma que `AtribuirDadosProdutos` seja uma trigger.

No Delphi, para cada item da transferência, `IncluirProdutos` chama explicitamente:

`AtribuirDadosProdutos(qryProdutosNotasPag, qryNotasPag, nil, false, TransferenciaEntrada, EstadoFilialBase, ...)`

Essa chamada seleciona `SQLDadosProdutosNotasSaidas`, materializa a fotografia fiscal/cadastral do item e executa cálculo/revisão fiscal. Depois, `ConfirmaTransferencia` chama `CalcularImpostos` para fechar o documento. Somente após isso são inseridas as intenções de movimento `STC` e `FTR`.

As triggers de `movimentos` podem ser autoridade para operação, saldos, financeiro, projeções e movimentos derivados. Elas não podem ser tratadas, sem prova concreta, como substitutas de `AtribuirDadosProdutos`, `AtribuirDadosCalculosImpostos` ou `CalcularImpostos`.

## Objetivo da implementação

Substitua a “paridade parcial” atual por um contrato explícito e testável de materialização da Nota Fiscal de Entrada por transferência.

A solução deve:

1. carregar em lote, sem N+1, todos os dados necessários para materializar os itens;
2. produzir uma linha `produtosnotaspag` completa e semanticamente equivalente ao ramo `TransferenciaEntrada` do Delphi;
3. preservar a fotografia fiscal de origem e distinguir valores fiscais da nota dos defaults cadastrais;
4. calcular ou delegar corretamente impostos por item e totais do cabeçalho, com autoridade comprovada;
5. alimentar `STC`/`FTR` com os dados já materializados da entrada;
6. manter atomicidade, locks, idempotência, pedidos, financeiro e romaneio existentes.

## 1. Criar um materializador explícito

Crie um serviço/repositório com nome de domínio claro, por exemplo:

- `ConfirmacaoPorNotasEntradaItemMaterializer`;
- `LegacyConfirmacaoPorNotasEntradaItemProjectionRepository`.

Não concentre a nova regra em arrays soltos dentro do command ou em um mapper genérico.

Entrada mínima do materializador:

- cabeçalho/dado fiscal de origem;
- conjunto de itens identificados por `(dadofiscal, numero, produto)`;
- Filial Base/destino;
- Filial de Estoque resolvida;
- natureza de entrada resolvida;
- UF e regime/contribuição tributária necessários.

Saída:

- DTOs imutáveis ou arrays tipados prontos para persistência em `produtosnotaspag`;
- erros de domínio explícitos para item ausente, ambíguo ou fiscalmente inválido.

## 2. Reproduzir `SQLDadosProdutosNotasSaidas` de forma set-based

Implemente uma projeção em lote equivalente ao SQL Delphi, combinando conforme o schema real:

- `produtosdadosfiscais`;
- `produtos`;
- `estoques` da Filial Base/destino;
- `caracteristicas`;
- `tributosicms`;
- `grupos`;
- `classes`;
- `precos`;
- `lotes`;
- `filiais`;
- tabelas auxiliares de IPI/NCM/IBPT utilizadas pela consulta Delphi;
- apropriações anteriores em `produtosnotaspag`/`notaspag`, quando a regra Delphi as desconta.

Não execute uma consulta por item.

Use uma consulta para o conjunto de chaves, por `VALUES`, `unnest(... WITH ORDINALITY)`, tuplas com binds ou estratégia equivalente compatível com PostgreSQL 9.6. Preserve a ordem dos itens e não cruze arrays independentes.

Exija cardinalidade exatamente 1:1 por `(dadofiscal, numero, produto)`:

- zero linhas: falhar a nota com código seguro de item/oráculo ausente;
- mais de uma linha: falhar a nota como ambiguidade/integridade;
- nunca ignorar, escolher arbitrariamente ou duplicar item.

## 3. Corrigir os campos de `produtosnotaspag`

Compare campo a campo o resultado Delphi e o schema PostgreSQL real. Materialize pelo menos, quando existentes e aplicáveis:

- `codigonota`, `numero`, `produto`, `dadofiscal`, `numeroprodutotabela`;
- `filial = FilialBase/destino`;
- `filial_estoque = FilialEstoque`;
- `quantidade`, `precounitario`, `qtdeestoque`, `fatorconversao`;
- `origem`, `composto` e vínculos do item original;
- descrição, referência, unidade, unidade NF/tributável e código digitado;
- grade, lote, validade e fabricação;
- NCM/classificação fiscal, gênero, EX TIPI, EAN tributável e enquadramento;
- incidência/CST e CSOSN, mantendo separação entre cadastro e fotografia da NF (`cst_nf`/`csosn_nf`, se existentes);
- modalidade ICMS, alíquota, base e valor;
- ICMS-ST, FCP, ST retido e crédito Simples Nacional;
- IPI, PIS e COFINS: CST, base, alíquota e valor;
- redução de base, desconto, valor de desconto, acréscimo, frete, seguro e despesas acessórias;
- demais campos comprovadamente preenchidos pelo ramo Delphi `TransferenciaEntrada`.

Remova defaults incorretos. Em especial:

- não force `origem = 0` quando a origem fiscal possui valor;
- não use `filial_estoque` no campo `filial`;
- não zere dados fiscais existentes apenas porque o mapper anterior não os carregava;
- não derive `ipicst` diretamente do código de IPI sem comprovação semântica;
- não use `Schema::hasColumn` como forma de esconder contrato de produção PostgreSQL obrigatório. Respeite ADR 0007/fail-fast; compatibilidade SQLite deve ficar em adapters/stubs de teste explícitos.

## 4. Corrigir o cabeçalho `notaspag`

Compare `IncluirNota` do Delphi com `ConfirmacaoPorNotasEntradaMapper::mapNotaPag`.

Não force valores genéricos quando `dadosfiscais` oferece a fotografia correta. Corrija, conforme o schema:

- `vendatransferencia` conforme a origem real, não sempre `true`;
- `modelodocto` conforme o dado fiscal;
- CRT/regime tributário da Filial emissora;
- base/valor de ICMS;
- base/valor de ICMS-ST;
- FCP/FCP-ST/FCP-ST-retido;
- totais PIS/COFINS e demais totais usados pelo Delphi;
- natureza/código fiscal resolvidos pela regra de entrada correspondente;
- CNPJ, IE, contribuição ICMS, emissão, chave NF-e, observações e referência ao dado fiscal.

Não altere a numeração canônica por `notaspag_proximocodigo()`.

## 5. Determinar a autoridade do cálculo fiscal

Antes de decidir a implementação, inspecione o DDL PostgreSQL real das triggers/funções relacionadas a:

- `notaspag`;
- `produtosnotaspag`;
- `movimentos`;
- naturezas/códigos fiscais usados pela entrada.

Registre em comentário de código ou documento de implementação:

- trigger/função encontrada;
- evento e ordem de execução;
- campos que calcula ou altera;
- quais responsabilidades Delphi continuam obrigatórias na aplicação;
- evidência de paridade.

Se não existir autoridade PostgreSQL equivalente a `AtribuirDadosCalculosImpostos` e `CalcularImpostos`, implemente um seam Laravel específico para o cálculo de entrada por transferência, reutilizando funções/oráculos existentes comprovadamente equivalentes. Não invente fórmulas fiscais aproximadas e não chame genericamente `MotorImpostosService` sem demonstrar que seu contrato cobre esta origem.

Atualize a ADR 304 para remover/corrigir a afirmação “Impostos: autoridade PostgreSQL (triggers)” caso ela não seja comprovada.

## 6. Corrigir a regra de estoque ausente

O Delphi, dentro de `AtribuirDadosProdutos`, cria uma linha zerada em `estoques(produto, FilialBase)` quando ela não existe. O Laravel atual rejeita com `estoque_ausente`.

Caracterize o schema, constraints e triggers e tome uma decisão explícita:

- preferencialmente, reutilize um seam legado/canônico concorrente e idempotente que garanta a linha de estoque sem escrever saldos calculados; ou
- mantenha a rejeição apenas se houver justificativa arquitetural/documentada de divergência deliberada e teste que mostre o impacto operacional.

Não faça `updateOrInsert` cego, não sobrescreva saldos e não duplique responsabilidades das triggers de estoque.

## 7. Preservar e validar `STC`/`FTR`

Mantenha a criação explícita dos movimentos-raiz:

- `STC` para a quantidade total do item;
- `FTR` somente quando `futuro > 0`, com `min(futuro, quantidade)`;
- valor `round(quantidade_do_movimento * precounitario_materializado, 2)`;
- referência `NF-{numero} S-{serie} TRANSFERENCIA`;
- `codigonota`, `numerocontrole`, cliente destino e tipo `L` corretos;
- Filial física de estoque correta.

Use o item materializado, não o snapshot fiscal parcial, como fonte de quantidade/preço/vínculos.

Não escreva manualmente operação, saldos posteriores, financeiro calculado, `estoques`, movimentos derivados ou projeções que sejam responsabilidade comprovada das triggers.

Preserve a ordem semântica não composto antes de composto ou demonstre por teste PostgreSQL que as triggers tornam a ordem irrelevante.

## 8. Transação e desempenho

Todas as correções permanecem dentro da transação por nota existente. Qualquer falha de projeção, cálculo, item, movimento ou trigger deve reverter cabeçalho, itens, pedidos, financeiro e romaneio.

Não introduza N+1. Adicione teste de query count comparando uma nota com 1 item e uma com muitos itens. O crescimento do número de itens não pode gerar consultas por item.

Não enfraqueça:

- locks determinísticos;
- idempotência HTTP e de domínio;
- revalidação server-side;
- separação entre Solicitante e Autorizador;
- processamento individual por nota;
- compatibilidade concorrente Laravel/Delphi.

## 9. Testes obrigatórios

Crie ou ajuste testes para cobrir:

1. materialização completa de um item simples;
2. múltiplos itens em uma consulta set-based;
3. zero e múltiplas linhas para a mesma chave fiscal;
4. `filial` diferente de `filial_estoque`;
5. origem, CST/CSOSN da NF e valores cadastrais preservados separadamente;
6. ICMS, ST, IPI, PIS, COFINS, descontos, frete e despesas não zerados quando presentes;
7. cabeçalho sem CRT/modelo/totais hardcoded;
8. estoque ausente conforme a decisão documentada;
9. `STC` simples;
10. `FTR` com futuro menor, igual e maior que a quantidade;
11. não composto e composto;
12. rollback quando materialização, cálculo ou trigger falha;
13. query count para 1 e N itens;
14. idempotência/replay sem duplicar itens ou movimentos;
15. teste de integração no PostgreSQL real exercitando triggers e projeções.

Adicione um golden master Delphi × Laravel usando uma nota de saída controlada. Compare no mínimo:

- `notaspag` campo a campo relevante;
- todas as linhas `produtosnotaspag`;
- totais fiscais;
- movimentos-raiz `STC`/`FTR`;
- saldos/projeções após triggers;
- pedidos e financeiro afetados.

Normalize apenas valores comprovadamente não determinísticos, como códigos sequenciais e timestamps. Não normalize diferenças fiscais.

## 10. Entrega

Ao terminar:

- liste os arquivos alterados;
- explique a divisão final de autoridade entre Laravel e triggers;
- apresente o SQL/projeção set-based adotado;
- mostre o mapeamento Delphi → Laravel dos campos corrigidos;
- informe a decisão sobre estoque ausente;
- informe qualquer divergência deliberada restante;
- execute os testes focados, testes de arquitetura/fail-fast e a suíte relevante;
- reporte comandos, resultados e limitações ambientais reais.

```
