# Pesquisa: SQL, projeção e atualização da Consulta de Entrega de Produtos

## Escopo e fontes

Esta nota inventaria o comportamento observável de `dmConsultaEntregaProdutos.pas/.dfm`. O formulário só é citado nos pontos em que define filtros, modo romaneio, edição ou persistência. As linhas abaixo são do código-fonte legado; não são inferências de um schema que não foi fornecido.

Fontes primárias:

- `C:\projetos.vcl\apps\entrega\dmConsultaEntregaProdutos.dfm:7-18,19-64,65-597,598-616`
- `C:\projetos.vcl\apps\entrega\dmConsultaEntregaProdutos.pas:101-195,203-240,246-286,301-404`
- `C:\projetos.vcl\apps\entrega\fmConsultaEntregaProdutos.pas:140-188,268-319,339-391,467-506`

## Resumo executivo

- `qryConsultaEntregaProdutos` é uma projeção externa sobre duas consultas entre parênteses unidas por `UNION ALL`: a primeira parte de `dadosfiscais/produtosdadosfiscais` e a segunda de `produtoscontratos`.
- A primeira parte representa itens fiscais abertos; a segunda representa saldo ainda pendente do contrato. `UNION ALL` não elimina uma possível presença do mesmo contrato/produto nas duas partes.
- Os únicos parâmetros SQL são `TodoIntervalodeEntregas`, `DataInicial` e `DataFinal`. Filiais, períodos, fornecedor de transporte e romaneio entram como macros que alteram o texto SQL; várias são montadas por concatenação.
- A linha editável não carrega `pdf.numero` nem `pc.numero`. Ainda assim, a gravação atualiza por `(dadofiscal, produto)` ou `(contrato, produto)`, podendo atingir mais de uma linha se essas combinações não forem únicas no schema.
- O Laravel deve preservar a origem da linha explicitamente, usar binds/arrays tipados, pré-agregar saldos, validar cardinalidade e fazer atualização set-based transacional com revalidação de concorrência. Não deve copiar os loops e a concatenação SQL.

## Consultas e semântica dos filtros

### Períodos de entrega

`qryPeriodosEntrega` executa `select pe.*, false as marcar from periodosentrega pe order by pe.codigo`; não há filtro por `inativo`. O dataset é `Active = True`, `RequestLive = True` e `CachedUpdates = True` (`dmConsultaEntregaProdutos.dfm:783-800`). O formulário também chama `open` no construtor (`fmConsultaEntregaProdutos.pas:96-101`). Cada período expõe `codigo`, `descricao`, `horapadrao`, `inativo`, `inicio`, `fim` e o booleano local `marcar` (`dmConsultaEntregaProdutos.dfm:803-834`).

Ao abrir a consulta, datas vazias viram parâmetros nulos; datas preenchidas são convertidas localmente e atribuídas aos parâmetros (`dmConsultaEntregaProdutos.pas:111-121`). A tela exige pelo menos uma data quando `TodoIntervalodeEntregas` é falso e rejeita data inicial maior que a final (`fmConsultaEntregaProdutos.pas:168-188`). A abertura normal usa hoje como início e sem final; o modo romaneio usa todo o intervalo (`fmConsultaEntregaProdutos.pas:268-313`).

O filtro de data em cada branch é inclusivo:

```sql
case when :TodoIntervalodeEntregas then dataentrega is not null
     else between :DataInicial and :DataFinal
          -- ou >= :DataInicial
          -- ou <= :DataFinal
end
```

Isso aparece para `pdf.dataentrega` em `dmConsultaEntregaProdutos.dfm:283-304` e para `pc.dataentrega` em `dmConsultaEntregaProdutos.dfm:522-543`. Se nenhum parâmetro de data for informado com o booleano falso, nenhum dos `when` internos casa e o `and case ... end` fica nulo/falso; a validação da tela normalmente impede esse estado.

Quando há períodos marcados, o Delphi percorre o dataset e gera um `OR` de intervalos `horaentrega between inicio and fim`. O mesmo texto é copiado para `pdf` por `StringReplace('pc.','pdf.')` (`dmConsultaEntregaProdutos.pas:150-169`). Os valores de horário vêm de campos `TTimeField` e são envolvidos por `quotedstr`, mas continuam sendo SQL textual por macro.

### Estrutura externa e projeção comum

O `select` externo começa em `dmConsultaEntregaProdutos.dfm:65-113`. Ele retorna `entregas.*` e acrescenta:

- `fornecedor_transporte = coalesce(r.fornecedor, entregas.fornecedortransporte)`;
- `nomefornecedortransporte = coalesce(vft.nome, vfft.nome)`;
- `regiao = coalesce(regiao_bairro, regiao_cidade)`;
- `nomeregiao = coalesce(rg.nome, nomecidade)`;
- `limitequantidade`, somente quando `entregas.entregas` não é nulo;
- `contratonota`, uma string de agrupamento com bairro, contrato, NF, filial, série e romaneio (`dmConsultaEntregaProdutos.dfm:70-111`).

O limite procura a maior `limites_entregas_regioes.quantidade` para dia da semana `extract(dow from dataentrega)+1`, período exato ou período nulo como curinga, e região exata; usa `order by quantidade desc limit 1` (`dmConsultaEntregaProdutos.dfm:79-97`). Empates não têm desempate explícito.

Depois da subconsulta, há `left join` de romaneios com `vfornecedores`, outro `left join` de fornecedor de transporte e `left join regioes` pela região bairro/cidade. A ordenação é `dataentrega, descricaoperiodoentrega, rg.nome, cep, nomebairro, horaentrega` (`dmConsultaEntregaProdutos.dfm:575-597`).

`endereco` não vem do SQL: é campo calculado como rua, seguido opcionalmente de número e complemento (`dmConsultaEntregaProdutos.pas:382-394`; `dmConsultaEntregaProdutos.dfm:759-763`). Os campos auxiliares `auxdataentrega`, `auxhoraentrega` e `auxperiodoentrega` guardam a fotografia original usada para detectar edição (`dmConsultaEntregaProdutos.dfm:726-738`).

### Branch fiscal: `dadosfiscais` + `produtosdadosfiscais`

O primeiro `select` projeta contrato, `dadofiscal`, filial/série/número da nota, produto visual, produto, filial, descrição, saldo, datas/período originais, endereço, cidade, bairro, região, data do documento, romaneio, indicador de entrega e fornecedor de transporte (`dmConsultaEntregaProdutos.dfm:118-262`).

O saldo exibido é:

```sql
pdf.quantidade
- coalesce(sum(contratosdevolvidos.quantidade
              where contrato = df.contrato
                and produto = pdf.produto
                and situacao = 'N'), 0)
```

O branch exige `coalesce(pdf.entregar,false)`, `df.situacao = 'N'`, contrato não nulo, saldo positivo e ausência de romaneio recebido sem justificativa (`dmConsultaEntregaProdutos.dfm:306-319`). A cadeia principal é `df join pdf join produtos p`, `left join periodosentrega` e `join notas n` (`dmConsultaEntregaProdutos.dfm:266-277`). O `join notas` é um ponto de multiplicação se `notas.dadofiscal` não for único.

Endereço e região preferem os campos `localentrega_*` quando `localentrega_cidade` não é nulo; caso contrário usam os campos padrão de `df`. Nomes e regiões de cidade/bairro são obtidos por subconsultas correlacionadas a `cidades` e `bairros` (`dmConsultaEntregaProdutos.dfm:148-211`). Essas subconsultas pressupõem no máximo uma linha para cada combinação de código/estado/cidade.

O romaneio é o maior romaneio não recebido associado ao `df.numero`, via `romaneiosnotas`; se não houver, fica nulo (`dmConsultaEntregaProdutos.dfm:215-224`). `entregas` vale `1` apenas na primeira linha elegível de `produtosdadosfiscais` (`min(pdfm.numero)`) que tem data e saldo positivo; as demais linhas recebem nulo (`dmConsultaEntregaProdutos.dfm:227-260`). O número de linha é usado internamente, mas não é projetado para a tela.

### Branch contrato: `produtoscontratos`

O segundo `select` projeta `pc.contrato`, nulos explícitos para `dadofiscal`, série e número da NF, filial de venda do contrato, produto, filial, descrição, saldo, datas/período originais, endereço, cidade, bairro, região, data do contrato, romaneio nulo, indicador de entrega e `ct.fornecedorfrete` (`dmConsultaEntregaProdutos.dfm:331-505`).

O saldo é:

```sql
pc.quantidade
- coalesce(sum(contratosdevolvidos.quantidade
              where situacao = 'F'), 0)
- coalesce(sum(pdf.quantidade join df
              where df.situacao = 'N'
                and df.contrato = ct.numero
                and pdf.produto = pc.produto), 0)
```

O branch exige `coalesce(pc.entrega,'N') = 'S'`, contrato em situação `F` ou `P`, `contratos_atual(ct.numero)`, data conforme os mesmos parâmetros e saldo positivo (`dmConsultaEntregaProdutos.dfm:508-570`). A cadeia é `pc join produtos p join contratos ct left join periodosentrega pe` (`dmConsultaEntregaProdutos.dfm:508-516`).

`entregas` vale `1` somente para o menor `pc.numero` do contrato que é elegível, tem data e saldo positivo após devoluções `F` e quantidades fiscais abertas; caso contrário é nulo (`dmConsultaEntregaProdutos.dfm:443-503`). Como no primeiro branch, `pc.numero` não é exposto na projeção.

### Macros e modo romaneio

As nove macros são declaradas no DFM (`dmConsultaEntregaProdutos.dfm:19-64`). Para filiais, o código concatena texto dentro de `in (...)`: vendas aplicam `ct.filialvenda` no branch contrato e `df.filialvenda` no branch fiscal; produtos aplicam `pc.filial` e `pdf.filial` (`dmConsultaEntregaProdutos.pas:123-147`).

Quando períodos são marcados, as macros `PeriodoEntrega` e `PeriodoEntrega_DF` recebem os ORs descritos acima. Quando `Romaneio` e `RomaneioDadoFiscal` são ambos diferentes de zero, `CondicaoRomaneio_DF` recebe `and df.numero = <inteiro>` e `CondicaoRomaneio` recebe `and false`; portanto o modo romaneio elimina todo o branch contrato e filtra somente o `dadofiscal`, não o número do romaneio, no SQL (`dmConsultaEntregaProdutos.pas:172-182`). O formulário preenche ambos os valores, mas o valor de `Romaneio` não é interpolado (`fmConsultaEntregaProdutos.pas:293-310`).

`ListaFornecedoresTransporte` é inserida como `and (<texto>)` depois de trocar literalmente `vf.` por `vft.` (`dmConsultaEntregaProdutos.pas:184-188`). Essa é uma condição SQL arbitrária, não uma lista tipada de IDs.

## Cardinalidade, nulabilidade e riscos

### Chaves naturais observadas

- Linha fiscal: o update usa `(dadofiscal, produto)` (`dmConsultaEntregaProdutos.pas:258-263`). A consulta também possui `pdf.numero`, usado para identificar a primeira linha, mas esse número não chega à tela nem ao update.
- Linha de contrato: o update usa `(contrato, produto)` (`dmConsultaEntregaProdutos.pas:264-268`). A consulta possui `pc.numero`, usado no indicador `entregas`, mas não o projeta.
- Localização na grade: `posicionarregistro` procura `(contrato, filialnf, série, número, produtovisual)` quando há série/número e, caso contrário, `(contrato, filialnf, produtovisual)` (`dmConsultaEntregaProdutos.pas:396-404`). Isso é localização de UI, não prova de unicidade de uma linha de banco.

### Multiplicação e duplicação

- `UNION ALL` preserva todas as linhas. O mesmo contrato/produto pode aparecer como item fiscal e como saldo de contrato, por regras de saldo diferentes; não substituir por `UNION` sem confirmação funcional (`dmConsultaEntregaProdutos.dfm:331-334`).
- `join notas`, `romaneios`, `vfornecedores` e as tabelas de dimensão precisam ser verificados contra o schema para garantir um-para-um. Se não forem únicos, a projeção multiplica linhas e o loop de gravação pode gerar updates repetidos.
- As duas atualizações não usam o identificador de linha (`pdf.numero`/`pc.numero`). Se houver duas linhas com a mesma chave aparente, uma edição visual pode atualizar várias linhas.
- A string `contratonota` e os agrupamentos da grade são apresentação; não devem ser usados como chave de escrita (`dmConsultaEntregaProdutos.dfm:101-111`; `fmConsultaEntregaProdutos.pas:513-567`).

São potencialmente nulos: datas/horários/período, `dadofiscal`/NF no branch contrato, romaneio sem vínculo, fornecedor, região, cidade, bairro, endereço e descrições de período. O DFM marca `nomefornecedortransporte` como `Required = True`, embora a projeção use `left join` e `coalesce` que ainda pode resultar nulo (`dmConsultaEntregaProdutos.dfm:739-745,575-589`). Isso é uma restrição do dataset, não evidência de uma garantia relacional.

### Injeção e N+1

- Datas e booleano usam parâmetros; listas de filiais, períodos, fornecedor e o filtro de romaneio são macros textuais (`dmConsultaEntregaProdutos.pas:111-188`). As listas e a condição de fornecedor podem injetar SQL se sua origem não for estritamente controlada. `StringReplace` não é parser nem validação.
- O `inttostr` do romaneio reduz o risco de texto arbitrário, mas ainda deixa o desenho dependente de SQL gerado; deve ser um bind inteiro.
- As subconsultas correlacionadas de saldo, cidade, bairro, romaneio, primeira linha e limite não são N+1 HTTP/PHP, mas podem reexecutar trabalho por linha no PostgreSQL (`dmConsultaEntregaProdutos.dfm:128-260,306-319,348-362,445-503`). Devem ser candidatas a pré-agregações, joins únicos e `exists` após medir o plano.
- `GravarDados` percorre o dataset inteiro, concatena uma instrução `update` para cada linha alterada e faz uma única chamada `execsql` no fim (`dmConsultaEntregaProdutos.pas:246-283`). Não é uma chamada ao banco por linha no código mostrado, mas é O(n) de SQL textual, pode gerar um lote grande e não tem binds.
- `GravarDadosEntrega` percorre novamente o dataset para copiar a alteração para todas as linhas com o mesmo `(contrato,dadofiscal)` (`dmConsultaEntregaProdutos.pas:316-378`). Isso confirma que a tela pode conter duplicatas deliberadas ou acidentais; não deve ser reproduzido como loop por registro no Laravel.

## Atualização e comportamento da tela

O dataset principal e `qryAtualizar` compartilham banco/transação e ambos têm `CachedUpdates = True`/`RequestLive = True` (`dmConsultaEntregaProdutos.dfm:7-18,841-855`). Depois de cada `post`, o `AfterPost` apenas marca `editando = true`; a chamada de persistência está comentada naquele evento (`dmConsultaEntregaProdutos.pas:301-313`). O botão Salvar chama `GravarDados` (`fmConsultaEntregaProdutos.pas:387-391`).

`GravarDados` compara os campos editáveis com os campos auxiliares originais. Se mudou data, hora ou período e ambos contrato e dado fiscal estão presentes, atualiza `produtosdadosfiscais` por `dadofiscal` e produto; em qualquer outro caso atualiza `produtoscontratos` por contrato e produto (`dmConsultaEntregaProdutos.pas:246-280`). Valores de data/hora e período são todos concatenados em SQL; a data/hora usa formatos explícitos e `quotedstr`, mas não bind.

O método não inicializa explicitamente o resultado quando não há SQL a executar (`dmConsultaEntregaProdutos.pas:276-286`). Também não há, neste arquivo, uma verificação de quantidade de linhas afetadas nem uma cláusula de concorrência baseada nos valores auxiliares.

No reagendamento, o formulário edita a linha localizada, e, após `OK`, faz `post`, chama `GravarDadosEntrega` e recarrega o agrupamento (`fmConsultaEntregaProdutos.pas:467-506`). `GravarDadosEntrega` apenas propaga valores no dataset em memória; não executa `qryAtualizar`. A persistência efetiva fica dependente do caminho posterior de Salvar/infraestrutura de updates (`dmConsultaEntregaProdutos.pas:316-378`). Uma tradução Laravel deve tornar esse contrato explícito: comando de reagendamento deve persistir de forma atômica ou retornar claramente que é apenas uma alteração em rascunho.

## Guardrails para uma tradução Laravel segura

1. **Preservar a origem e a identidade.** Mantenha duas branches ou uma CTE equivalente com uma coluna não ambígua, por exemplo `source_kind = fiscal|contrato`, e projete a chave real da linha (`pdf.numero` ou `pc.numero`) somente depois de confirmar no schema seus tipos e unicidade. Não use `contratonota`, posição da grade ou `produtovisual` como chave.

2. **Bind em todos os valores.** Use datas, booleano, romaneio, períodos e fornecedores como parâmetros tipados. Para IDs, valide inteiros e use `whereIn`/bindings ou `= ANY(:ids::integer[])`; nunca monte `in (` a partir de texto recebido. Para horários, passe intervalos estruturados e componha predicados fixos com binds. O fornecedor deve ser uma lista de códigos, não uma expressão SQL recebida do cliente.

3. **Preservar a semântica de filtros.** Mantenha `UNION ALL`, limites de data inclusivos, `TodoIntervalodeEntregas => data is not null`, os status distintos de devolução (`N` no branch fiscal e `F` no contrato), `contratos_atual`, `not exists` do romaneio recebido e a preferência pelos campos `localentrega_*`. Decida explicitamente como tratar intervalo vazio e período que atravessa meia-noite; o Delphi usa `between inicio and fim` sem lógica especial.

4. **Reduzir trabalho repetido sem alterar cardinalidade.** Pré-agregue devoluções e quantidades fiscais por suas chaves; use `exists` para testes de presença; faça joins com dimensões somente após confirmar que são um-para-um. Para romaneio/limite, use `row_number`, `distinct on` ou `lateral` apenas com desempate e regras equivalentes. Teste planos e resultados antes de substituir subconsultas correlacionadas.

5. **Atualizar set-based e com concorrência.** Separe updates fiscais e de contrato por `source_kind`, agrupe mudanças por chave real e execute em transação. Inclua a chave completa e, se o fluxo exigir, os valores originais (`aux*`) ou uma revisão/`updated_at` na cláusula `where`; rejeite conflito quando a quantidade afetada não for a esperada. Valide período, data/hora e elegibilidade novamente no comando. Não aceite do cliente uma tabela-alvo derivada somente de nulos.

6. **Definir a unidade transacional e cancelamento.** O arquivo usa uma transação compartilhada, mas não mostra a implementação de `perpetrar` (`dmConsultaEntregaProdutos.pas:276-280`). No Laravel, encapsule leitura de conflito + updates em uma transação PostgreSQL, use `lockForUpdate`/locks apropriados somente no agregado necessário e propague cancelamento/timeout ao driver PostgreSQL; não trate cancelamento apenas como estado visual da requisição.

7. **Testar cardinalidade como contrato.** Crie casos para: várias linhas `pdf` no mesmo `dadofiscal`; várias linhas `pc` no mesmo contrato/produto; múltiplas `notas`; mais de um romaneio; fornecedor/região ausente; empate no limite; presença nas duas branches; data nula; período sem data; e atualização com zero ou várias linhas afetadas. A paridade deve comparar conjunto, chaves, somas de `saldo_quantidade`/`entregas` e destino de escrita, não apenas a quantidade visual de registros.

## Conclusão

O comportamento legado é uma consulta operacional composta, com apresentação agrupada e uma atualização textual em lote baseada em chaves incompletas para o nível de linha. A migração segura pode ser mais set-based e parametrizada, mas só deve simplificar depois de confirmar no schema as cardinalidades de `pdf.numero`, `pc.numero`, `notas.dadofiscal`, romaneios, fornecedores e dimensões geográficas. A maior salvaguarda é transportar explicitamente a origem e a identidade da linha desde a projeção até o comando de atualização.
