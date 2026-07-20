Type: task
Status: resolved
Blocked by: 01, 02

## Answer

### Decisão

A aba Pedidos terá dois datasets readonly e semanticamente distintos:

1. **Pedidos pendentes**: pedidos comerciais A/P com saldo calculado pela função legado, globais ao Produto dentro das Filiais autorizadas e com Filial de entrega explícita.
2. **Notas pendentes de entrada**: documentos SEFAZ autorizados ainda não lançados no contas a pagar/entrada, identificados em `nsus/nsus_prod`, também limitados às Filiais autorizadas.

A Filial selecionada continua compondo a identidade lazy e precisa ter estoque para o Produto, mas a grade da aba é uma visão multi-Filial autorizada, como no Delphi. Já o número “Pedidos” da aba Estoques segue o contrato próprio: Filial selecionada, ou consolidado explicitamente parametrizado.

### Autorização e escopo

- Exigir acesso ao módulo, Filial da URL autorizada e linha `estoques(produto, filial)` existente.
- Obter no servidor o conjunto de Filiais autorizadas do usuário. Nunca aceitar uma lista arbitrária do cliente para ampliar o escopo.
- Pedidos: conservar somente linhas cuja `pedidos.filialentrega` esteja nesse conjunto.
- Notas SEFAZ: conservar somente documentos cujo CNPJ destinatário resolva uma `filiais.codigo` autorizada.
- Não classificar a aba como gerencial: segue acesso normal da Consulta de Estoques. Dados de preço/custo não entram no payload.
- Resposta repete Produto, Filial selecionada e `escopo: ''filiais_autorizadas''` para tornar a abrangência explícita.

### Pedidos pendentes

Fonte e regra:

```sql
SELECT
    pp.pedido,
    pp.produto,
    pp.quantidade AS quantidade_original,
    COALESCE(pp.dataentrega, p.entrega) AS previsao_entrega,
    p.filialentrega,
    pedidos_estoquepedido_semnotaparcial(
        pp.produto,
        p.filialentrega,
        pp.pedido
    ) AS quantidade_pendente
FROM produtospedidos pp
JOIN pedidos p
  ON p.numero = pp.pedido
WHERE pp.produto = :produto
  AND p.situacao IN (''A'', ''P'')
  AND p.filialentrega IN (:filiais_autorizadas)
```

- Aplicar `quantidade_pendente > 0` sobre o resultado calculado. Não usar `pp.quantidade > 0` como substituto.
- `quantidade_original` pode permanecer no DTO para conferência, mas a grade de paridade mostra **Pedido**, **Filial**, **Quantidade pendente** e **Previsão de entrega**.
- Situações diferentes de A/P são excluídas. A função é a autoridade para atendimento parcial/notas parciais; não reconstruir saldo em PHP.
- Ordenação determinística: previsão nula por último, previsão crescente, pedido crescente. Se a prioridade operacional preferida no sistema já for pedido, documentar e testar a alternativa; nunca depender de ordem do banco.
- Totalizador da grade: soma das quantidades pendentes retornadas, rotulado “Total pendente nas Filiais autorizadas”. Esse total é uma conveniência Laravel; não substitui o resumo da aba Estoques.

### Resumo Pedidos na aba Estoques

- Modo padrão: `pedidos_estoquepedido(produto, filial_selecionada)`/regra canônica equivalente para a Filial selecionada.
- Quando o parâmetro legado **Filiais Independentes** estiver ativo, usar modo consolidado e somar a mesma função para todas e somente as Filiais autorizadas que participam do contexto. Não copiar a varredura irrestrita de todas as Filiais do Delphi.
- Payload explícito: `pedidos`, `pedidos_modo: ''filial'' | ''consolidado_autorizado''` e, quando consolidado, `filiais_consideradas`.
- Parâmetro resolvido pelo manifesto central. Não consolidar por inferência da UI nem misturar essa regra à listagem detalhada, que já é multi-Filial autorizada.

### Notas pendentes de entrada SEFAZ

Não usar a tabela provisória `notas_entrada_pendentes`. Reproduzir a semântica Delphi:

- `nsus` unido a `nsus_prod` por CNPJ, NSU e tipo;
- fornecedor por `nsus.cnpjemitente = fornecedores.pessoanumero`;
- Filial por `nsus.cnpj = filiais.cnpj` e restrição às Filiais autorizadas;
- documento `tipoxmlretorno = ''resNFe''`, tipo `NFE`/`NFCe`, XML existente;
- excluir chave já existente em `notaspag.chv_nfe`;
- reconhecer o Produto por relacionamento de fornecedor (`produtonofornecedor`, descrição, informação adicional) ou código de barras de `produtoscodigobarras`;
- exigir vínculo ao mesmo fornecedor e `produtosfornecedores.tipofornecedor = ''F''`;
- excluir `cSitNFe = ''3''` e cancelamento posterior por evento `110111`, seguindo a função/consulta XML canônica já disponível.

Campos visíveis:

- Filial;
- código e nome do Fornecedor;
- Série, extraída da chave NFe;
- Número da NFe, extraído da chave;
- Situação (`AUTORIZADA`, `DENEGADA`, `CANCELADA`, embora canceladas sejam filtradas; códigos desconhecidos ficam explícitos);
- Emissão (`dhemi`).

O DTO pode incluir descrição do produto NFe, unidade, quantidade comercial, valor unitário, frete, seguro, desconto e outros para futura expansão, mas esses dados devem ser tipados e não precisam ser colunas nesta paridade.

### Identidades e navegação

- Pedido: identidade `pedido` (número interno). Link usa rota nomeada/canônica do cadastro de Pedidos; não montar URL literal no componente. Ausência de permissão do cadastro omite/desabilita o link sem ocultar a linha.
- Nota SEFAZ pendente não possui `notaspag.codigo`, pois justamente ainda não foi lançada. Sua identidade estável é composta por `filial + tipo + nsu + chnfe` (a chave NFe é a identidade externa principal).
- Não abrir histórico fiscal interno usando um ID inventado da tabela provisória. Só oferecer navegação se existir viewer readonly de documento SEFAZ que aceite a identidade composta/chave; caso contrário, manter a linha sem link nesta entrega.
- Não reproduzir o handler Delphi que aciona abertura de Pedido ao dar duplo clique na grade de NFe.

### Payload

```text
produto: int
filial: int
escopo: ''filiais_autorizadas''
pedidos: Array<{
  pedido: int
  filial_entrega: int
  quantidade_original: number
  quantidade_pendente: number
  previsao_entrega: string|null
}>
pedidos_total_pendente: number
notas_pendentes: Array<{
  filial: int
  fornecedor: int
  fornecedor_nome: string
  tipo: string
  nsu: string
  chave_nfe: string
  serie: string|null
  numero_nfe: int|null
  situacao_codigo: string|null
  situacao_descricao: string
  emissao: string|null
}>
```

DTO nominal no TypeScript; chaves React `pedido:filial_entrega` para pedidos e `filial:tipo:nsu:chave_nfe` para notas, nunca índice do array.

### Formato, vazio e erros

- Quantidades usam máscara configurada; previsão/emissão usam helpers de data/data-hora; códigos e chaves permanecem texto.
- Estados vazios independentes: “Nenhum pedido pendente nas Filiais autorizadas.” e “Nenhuma nota de entrada pendente identificada no SEFAZ.”
- Um dataset vazio não oculta o outro.
- Ausência estrutural de função/tabela/coluna ou erro de XPath/XML é erro observável, não arrays vazios via `Schema::hasTable`.
- Documento com mapeamento ambíguo de Produto/Fornecedor deve ser deduplicado pela identidade da nota/item para não repetir a mesma NFe por múltiplos critérios verdadeiros.

### Testes obrigatórios

1. Pedidos A/P incluídos; demais situações excluídas; saldo zero/negativo excluído.
2. Provar saldo parcial da função diferente de `pp.quantidade` e totalizador pela quantidade pendente.
3. Duas Filiais autorizadas aparecem; Filial não autorizada nunca aparece; Produto/Filial selecionado sem estoque gera 404.
4. Previsão usa `pp.dataentrega` com fallback `p.entrega`; ordem e nulos determinísticos.
5. Resumo Estoques: modo Filial e modo consolidado autorizado pelo parâmetro, com lista de Filiais e sem Filial não autorizada.
6. NFe reconhecida por cada critério de produto (código fornecedor, descrição, infAdProd, código de barras) e deduplicada quando vários coincidem.
7. NFe já em `notaspag`, cancelada por situação ou evento 110111, fornecedor/tipo incompatível e Filial não autorizada são excluídos.
8. Extração de série/número, situação e emissão; documento malformado tratado sem quebrar toda a lista.
9. Navegação de Pedido por rota canônica/capability; Nota sem ID interno não usa histórico fiscal errado.
10. Componente: colunas, duas mensagens vazias independentes, máscaras, datas, chaves estáveis e resposta obsoleta descartada.
11. Erro estrutural não retorna listas vazias.

### Classificação dos gaps atuais

- Quantidade original renomeada como pendente: defeito funcional crítico.
- Pedidos sem Filial explícita e sem restrição às autorizadas: defeito de escopo/apresentação.
- Situação/previsão presentes mas omitidas: gap visual.
- `notas_entrada_pendentes` simplificada: scaffold incompatível com a fonte Delphi SEFAZ.
- Histórico fiscal aberto por ID provisório: identidade/navegação incorreta.
- Listagem detalhada global ao Produto: paridade válida somente quando limitada às Filiais autorizadas.
- Consolidação do resumo: permitida apenas por parâmetro e com modo explícito.

## Question

Qual deve ser o contrato corrigido da aba Pedidos no Laravel, incluindo Pedidos abertos/pendentes e Notas de Entrada pendentes, saldo/quantidade, status excluídos, Produto+Filial, identidades para navegação, colunas, totais, vazio, permissões e testes?
