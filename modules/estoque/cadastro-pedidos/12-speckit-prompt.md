# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, a aba **"Notas Pendentes de Entrada"** do Cadastro de Pedidos de Compra — NF-e que o fornecedor já emitiu contra o CNPJ da empresa (via Manifestação do Destinatário/distribuição SEFAZ) e que casam com produtos deste pedido, mas ainda não foram recebidas/vinculadas a uma nota de entrada local. Esta é a décima segunda fatia do Cadastro de Pedidos de Compra, construída sobre o cabeçalho/itens já especificados (specs 01-08) e sobre a integração SEFAZ **já implementada em outro módulo**.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` como requisito legado autoritativo, e `Evidência Laravel confirmada` como o estado já mapeado do checkout — mas **reconfirme-o por inspeção direta**, pois pode estar defasado. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

A entrega termina quando existir a aba "Notas Pendentes de Entrada" no Cadastro de Pedidos, listando por produto do pedido: código/descrição, filial, série, número da NF-e, emissão, chave de acesso, unidade, quantidade, valor — **reaproveitando a integração `nsus`/`nsus_prod` (Manifestação do Destinatário/SEFAZ) já implementada** para outro módulo, filtrada pelo pedido aberto na tela (fornecedor do pedido + produtos do pedido) em vez de por produto avulso.

Não inclua nesta entrega: qualquer nova integração com a SEFAZ (já existe); ação de vínculo/manifestação a partir desta aba (não confirmado que existe no legado — ver Dúvida); as 3 abas informativas simples (spec 11); qualquer alteração de cabeçalho/itens/grade já especificados.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/estoque/dmcadastropedidos.pas`/`.dfm`.
- Inspecione o checkout Laravel para confirmar o estado atual do repositório/query já existente (`LegacyConsultaEstoquesDetalheRepository::listNfeEntradaPendentes` ou o que a substituiu) — pode ter mudado desde esta análise.
- Se uma decisão depender de informação Delphi ausente (ex.: se existe ação de vínculo nesta aba específica), registre a pergunta exata para o workspace de análise — não infira.

## Investigação Laravel obrigatória

- `app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaEstoquesDetalheRepository.php`, método `listNfeEntradaPendentes` (comentário no código: "NFe de entrada pendentes via `nsus` + `nsus_prod` (semântica 233)") — **a mesma integração SEFAZ já implementada**, incluindo um `LEFT JOIN pedidos/produtospedidos` que já cruza o resultado com Pedidos de Compra em aberto;
- o endpoint/rota que já expõe esse repositório (provavelmente em Consulta de Compras ou Consulta de Estoques) — confirmar se pode ser reaproveitado com um filtro adicional por pedido, ou se precisa de um método novo no mesmo repositório;
- `10-speckit-prompt-correcao-nfe-requisicoes-filial.md` (`modules/estoque/consulta-compras/`) — spec já publicada que documenta o uso desta mesma integração em Consulta de Compras, para não duplicar contrato.

## Evidência Delphi confirmada

### Fonte de dados — Manifestação do Destinatário/SEFAZ (CONFIRMADO, `dmcadastropedidos.dfm:5614+`, query `qryConsultaProdutosEntradaSefaz`)

```sql
select nsus.*
from (
  select distinct
    fi.codigo as filial,
    f.codigo as fornecedor,
    coalesce(f.nome, f.razao) as nomefornecedor,
    cast(substring(nsus.chnfe from 23 for 3) as varchar(3)) as serie,
    cast(substring(nsus.chnfe from 26 for 9) as integer) as nrnfe,
    case nsus.cSitNFe
      when '1' then cast('AUTORIZADA' as varchar(10))
      when '2' then cast('DENEGADA' as varchar(10))
      when '3' then cast('CANCELADA' as varchar(10))
    end as nomecSitNFe,
    cast(nsus.dhemi as timestamp) as dhemi,
    nsus_prod.sequencial, nsus_prod.cprod, nsus_prod.cean,
    nsus_prod.xprod as descricaoprodutonfe,
    nsus_prod.ucom, nsus_prod.qcom, nsus_prod.vuncom,
    nsus_prod.vfrete, nsus_prod.vseg, nsus_prod.vdesc, nsus_prod.voutro,
    nsus.cSitNFe, nsus.tipo, nsus.chnfe, nsus.nsu,
    p.codigo as produto, p.codigovisual as produtovisual, p.descricao as descricaoproduto
  from ((nsus
    join fornecedores f on nsus.cnpjemitente = f.pessoanumero)
    join filiais fi on nsus.cnpj = fi.cnpj)
    join ((nsus_prod
      left join produtosfornecedores pf
        on (nsus_prod.cprod = pf.produtonofornecedor)
        and pf.fornecedor = :fornecedor and pf.tipofornecedor = 'F')
      -- ... join com produto local por código/descrição/informação adicional
    )
) nsus
```

`nsus`/`nsus_prod` = tabelas locais de staging da distribuição de DF-e da SEFAZ (Manifestação do Destinatário) — série/número da NF-e derivados da chave de acesso de 44 posições (posições 23-25 = série, 26-34 = número), situação (`cSitNFe`: 1=Autorizada, 2=Denegada, 3=Cancelada) e os itens da NF-e casados com o produto local via `produtosfornecedores`.

## Evidência Laravel confirmada

### A mesma integração já existe (CONFIRMADO, `app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaEstoquesDetalheRepository.php:278-397`)

```php
/**
 * NFe de entrada pendentes via `nsus` + `nsus_prod` (semântica 233).
 */
public function listNfeEntradaPendentes(int $produto, array $filiaisAutorizadas): array
```

A query já implementada faz `INNER JOIN nsus_prod`/`INNER JOIN filiais`/`INNER JOIN vfornecedores`, filtra `tipoxmlretorno = 'resNFe'`, `xmlnfe IS NOT NULL`, `tipo IN ('NFE','NFCE')`, `csitnfe = '1'` (só autorizadas), exclui NF-e já vinculadas (`NOT EXISTS ... notaspag npg WHERE npg.chv_nfe = n.chnfe`), e casa produto por `produtosfornecedores` (código/descrição/info adicional no fornecedor) ou por `produtoscodigobarras` (EAN). **Já inclui um `LEFT JOIN pedidos/produtospedidos`** cruzando com Pedidos de Compra em situação Aberta, casando produto+fornecedor+`dhemi >= data-base do pedido` — ou seja, o cruzamento com Pedidos **já existe no código**, só precisa ser exposto/filtrado para o contexto desta tela (por pedido, não por produto avulso).

### Dúvida a confirmar

Não foi localizado no `.dfm` desta aba nenhuma ação de vínculo/manifestação disparável a partir dela — parece puramente informativa dentro do Cadastro de Pedidos. **Não inventar** um botão de "vincular esta NF-e a uma entrada" sem confirmação — se existir, é ação de outro módulo (recebimento/Nota de Entrada), fora de escopo aqui.

## Decisões obrigatórias

1. Reaproveitar a query/repositório `nsus`/`nsus_prod` já implementado — não recriar a integração SEFAZ.
2. Adaptar o filtro: em vez de "por produto avulso" (uso atual em Consulta de Estoques/Compras), filtrar pelo pedido aberto (fornecedor do pedido + todos os produtos do pedido).
3. Aba é somente leitura — nenhuma ação de vínculo/manifestação nesta entrega, salvo confirmação explícita em contrário.
4. Reaproveitar exatamente a tradução de situação já usada (`cSitNFe`: 1=Autorizada, 2=Denegada, 3=Cancelada) e a derivação de série/número pela chave de acesso.

## Critérios de aceite

- [ ] Aba lista NF-e pendentes de entrada para os produtos do pedido aberto, reaproveitando a query `nsus`/`nsus_prod` já existente.
- [ ] Colunas: código/descrição do produto, filial, série, número da NF-e, emissão, chave de acesso, unidade, quantidade, valor.
- [ ] NF-e já vinculadas a uma nota de entrada local (`notaspag.chv_nfe`) não aparecem na lista.
- [ ] Só NF-e autorizadas (`cSitNFe = '1'`) aparecem, mesma regra já usada na integração existente.
- [ ] Nenhuma ação de escrita/vínculo é exposta nesta aba, a menos que uma investigação adicional confirme que o legado tem essa ação aqui.

## Matriz mínima de testes

- **NF-e pendente casando por código de produto**: NF-e emitida pelo fornecedor do pedido, com produto casando por `produtonofornecedor` → aparece na lista com todos os campos corretos.
- **NF-e já vinculada não aparece**: NF-e já linkada em `notaspag.chv_nfe` → não aparece na lista de pendentes.
- **NF-e cancelada não aparece**: NF-e com `cSitNFe = '3'` (cancelada) → não aparece.
- **Pedido sem NF-e pendente**: pedido cujo fornecedor não tem nenhuma NF-e não vinculada → lista vazia, sem erro.
- **Derivação de série/número pela chave de acesso**: confirmar que série (posições 23-25) e número (posições 26-34) da chave de 44 dígitos são extraídos corretamente.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais da aba, deixando explícito que reaproveita a integração SEFAZ já existente;
- identifiquem o repositório/endpoint atual a estender (ou o novo método a adicionar no mesmo repositório), após inspecioná-los;
- detalhem o filtro por pedido (fornecedor + produtos do pedido) sobre a query já existente;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que nenhuma nova integração SEFAZ é construída, e que nenhuma ação de vínculo é assumida sem confirmação.

## Fora de escopo

- implementar durante `/speckit.specify` além do que os critérios acima descrevem;
- qualquer nova integração com a SEFAZ — já existe e é só reaproveitada;
- ação de vínculo/manifestação a partir desta aba, salvo confirmação explícita;
- as 3 abas informativas simples (spec 11);
- qualquer alteração de lógica de negócio do cabeçalho/itens/grade já implementados (specs 01-08);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
