# Prompt SpecKit — correção das abas da Consulta de Estoques

Crie uma especificação e um plano de implementação para corrigir **somente** as abas Estoques, Acumuladores, Financeiro, Preços/Preços por Cargo e Pedidos da Consulta de Estoques Laravel existente.

## Regra de investigação

Você tem acesso ao Laravel atual e deve inspecioná-lo detalhadamente antes de especificar mudanças. **Não procure, não solicite e não dependa de código Delphi**: todo o contrato legado necessário está descrito neste prompt. Trate o Laravel atual como ponto real de partida e preserve tudo que já estiver correto.

Não implemente um módulo novo. Reutilize a rota lazy, controller/service de detalhe, repositories, calculadores, motor de preços, manifesto de parâmetros, policies/capabilities, hook de carregamento, mutações auditadas, componentes e formatadores existentes.

## Escopo

Incluído:

- conteúdo, SQL, DTOs, AuthZ, parâmetros, layout e testes das cinco abas;
- resumo Pedidos dentro de Estoques;
- última nota/fornecedor/fiscal do Financeiro;
- NFe pendentes dentro de Pedidos;
- correções transversais necessárias para tipagem, segurança e stale responses.

Excluído:

- filtros e geração da consulta, grid mestre salvo dependência direta de localização/limites;
- lupa, Lotes, Similares, Grade, Modelos, Componentes, Atributos, Fornecedores, Licitações e Fotos;
- alteração de schema ou funções PostgreSQL, salvo se estritamente indispensável e demonstrado;
- reescrita visual ampla.

## Arquitetura obrigatória

Preserve `GET /produtos/{produto}/filiais/{filial}/detalhes/{detalhe}`. Ordem server-side: validar detalhe, acesso ao módulo, Filial autorizada, linha Produto+Filial e capability específica; somente depois consultar dados.

Toda resposta repete Produto+Filial. O hook mantém chave `produto:filial:detalhe`, aborta request anterior e rejeita resposta cuja geração/identidade não seja a ativa. Limpar seleção aborta e remove dados antigos.

Não use `Schema::hasTable/hasColumn` em request para devolver vazio. Erro estrutural deve ser observável. Não crie endpoints ou formatadores paralelos.

Crie DTOs nominais PHPDoc/TypeScript para as cinco abas; elimine `unknown`/`Record<string, unknown>` dos painéis. Números são números, datas ISO anuláveis e códigos/chaves texto. `null` difere de zero/false.

## Matriz de autorização

- Estoques/quantidades e Pedidos: acesso ao módulo.
- Qualquer preço, inclusive painel em Estoques e modo Cargo: `can_visualizar_precos` no servidor e React.
- Financeiro e Acumuladores: `viewGerencial`.
- Última compra: `viewGerencial` + `can_alterar_ultima_compra`.
- Localização/limites: `can_alterar_minmax_localizacao`.

Não entregue dado sensível no JSON para apenas escondê-lo no React. Se a aba ativa não for autorizada, faça fallback para Estoques antes do fetch.

## Aba Estoques

Preserve fórmulas:

```text
estoque_venda = emestoque + reservado + reservaprevia
estoque_total = estoque_venda + transito + demonstracao + conserto + danificada
custo_medio = financeiro / estoque_total, ou 0 se denominador 0
```

`futuro` e `estoquefisico` não participam. O frontend não recalcula.

Mostrar preços normal/promocional, alteração do normal, descrição e validade; depois todas as quantidades: Em estoque, Reservado, Reserva prévia, Demonstração, Conserto, Em trânsito, Danificada, Futuro, Estoque físico, Estoque venda, Estoque total e Pedidos. Promoção vencida tem valor nulo.

Localização, Sublocalização, Mínimo e Máximo permanecem no grid mestre e na mutação existente; não duplicar formulário na aba. Remover Financeiro/Custo do DTO público Estoques: pertencem ao detalhe gerencial.

Pedidos do resumo deve ser pendente da Filial selecionada pela função/regra canônica. Se **Filiais Independentes** estiver ativo, consolidar somente Filiais autorizadas e retornar modo/lista de Filiais explicitamente.

## Aba Acumuladores

Fonte `movimentos`, filtro Produto+Filial. Não usar `tiposmovimentos.operacao`. Classifique pelo snapshot:

- Venda: `substr(m.operacao,13,1)`; `+ => abs(qtd)`, `- => -qtd`.
- Compra: `substr(m.operacao,14,1)`; `+ => qtd`, `- => -abs(qtd)`.

Agregue no PostgreSQL por `date_trunc(''month'', data)` com agregação condicional, somente símbolos `+/-`, e ordene mês decrescente. Não carregar movimentos para agrupar em PHP.

Retorne Filial, `ano_mes` YYYY-MM, Compras e Vendas. Mostre Filial, MM/YYYY, Compras e Vendas. Sem total geral ou meses artificiais. Movimento irrelevante não cria linha 0/0; compensação real até zero mantém a linha.

## Aba Financeiro

Retorne/exiba:

- Custo médio, Financeiro, IPI percentual e Margem final;
- data/quantidade/valor da última compra, preços sem/com ICMS e última compra com ICMS;
- última entrada e última venda;
- última nota, Fornecedor e se está no Simples;
- CST/CSOSN da empresa, CST/CSOSN da NF do fornecedor e situação tributária atual do Produto.

Para CSOSN atual 101/102:

```text
ultima_compra_com_icms = valorultimacompra + (precocomicms - precosemicms)
```

Demais códigos mantêm o valor. Margem = `((preco_efetivo-custo_medio)/preco_efetivo)*100`, nula sem preço ou preço zero.

Resolva a última nota de entrada de compra por Produto **e Filial selecionada**, excluindo fornecedor tipo `L`, através de `produtosnotaspag`, `notaspag` e `fornecedores`, com ordenação determinística. Mapeie incidência/CSOSN e `cst_nf/csosn_nf`; não mantenha `simples=false` ou `cst=null` hardcoded. Se a Filial não puder ser comprovada, não busque nota global.

Preserve a mutação de última compra por Produto+Filial, autorização, transação, auditoria, idempotência e snapshot. Nunca use update somente por Produto.

## Aba Preços / Preços por Cargo

Resolva parâmetros pela Filial selecionada. DTO discriminado `modo: convencional|cargo`.

- parâmetro Cargo false: painéis convencional/promoção;
- parâmetro Cargo true: grade Cargo substitui convencional;
- Preço por Cliente é adicional e não deve ser apresentado como concluído por arrays vazios.

No modo Cargo, use `produtoscargos` + `cargos` + existência de estoque Produto+Filial. Calcule:

```sql
estoques_preco(produto, filial, produtoscargos.markup)
```

Não leia `produtoscargos.preco` e não reimplemente a função. Retorne Cargo, Descrição, Markup e Valor; mostre Cargo, Descrição Cargo e Valor, ordenado por descrição+código. Promoção/validade não participa do modo Cargo. Sem vínculos é vazio válido; vínculo com valor nulo aparece como `—`.

## Aba Pedidos

Retorne dois datasets independentes.

### Pedidos comerciais

`produtospedidos` + `pedidos`, Produto, situações A/P e `filialentrega` dentro das Filiais autorizadas. Calcule:

```sql
pedidos_estoquepedido_semnotaparcial(pp.produto, p.filialentrega, pp.pedido)
```

Conserve somente pendente > 0. Previsão = `coalesce(pp.dataentrega,p.entrega)`. Mostre Pedido, Filial, quantidade pendente e previsão; totalize pendente. Não renomeie quantidade original como saldo.

Use rota nomeada para abrir Pedido e respeite autorização do destino.

### NFe pendentes de entrada

Substitua a fonte provisória `notas_entrada_pendentes`. Use a semântica:

- `nsus` + `nsus_prod` por CNPJ/NSU/tipo;
- Fornecedor pelo CNPJ emitente e Filial pelo CNPJ destinatário autorizado;
- `resNFe`, NFE/NFCe, XML existente;
- chave ainda ausente de `notaspag`;
- Produto reconhecido por `produtosfornecedores` (código, descrição ou infAdProd) ou `produtoscodigobarras`;
- fornecedor compatível, tipo F;
- excluir situação cancelada e evento 110111;
- deduplicar quando vários critérios reconhecem o mesmo item.

Mostre Filial, Fornecedor, Série, Número NFe, Situação e Emissão. Identidade: Filial+tipo+NSU+chave. Não use ID interno inventado nem abra histórico fiscal de nota já lançada. Só linke se existir viewer SEFAZ compatível.

## UI e formatação

Reutilize painéis e formatadores. Extraia tabela readonly leve comum para Acumuladores, Cargo e Pedidos somente se reduzir duplicação sem esconder regras de domínio.

- quantidade pela máscara configurada;
- moeda BRL;
- IPI/margem/markup como percentual;
- datas pelos helpers comuns;
- códigos, Série, NSU e chave como texto;
- null `—`, zero formatado como zero real;
- chaves React de domínio, nunca índice.

Estados vazios devem ser específicos e independentes. Erro estrutural não é vazio.

## Testes e aceite

Inclua no plano e implemente testes proporcionais:

1. Matriz de capabilities e ausência real de campos sensíveis.
2. Duas Filiais com dados distintos em cada aba; nenhuma Filial não autorizada em linha ou total.
3. Fórmulas de saldos, custo, ICMS e margem; null versus zero.
4. Acumuladores com snapshot, posições/sinais, mês, virada de ano, irrelevantes e agregação SQL.
5. Cargo com parâmetro por Filial, markups distintos, função de preço, vazio/nulo e ausência de promoção.
6. Pedidos com saldo parcial diferente do original, status, previsão, Filiais autorizadas e total.
7. NFe reconhecida por cada critério, deduplicada, lançada/cancelada/não autorizada excluída.
8. Mutações por Produto+Filial, capability, validação, auditoria/idempotência e outra Filial intacta.
9. Hook com troca rápida de Produto, Filial e aba; abort/geração/limpeza.
10. Componentes com colunas, rótulos, formatos, vazios, modos, links e aba proibida.
11. Queries críticas PostgreSQL sem N+1 e sem `Schema::hasTable` silencioso.

Considere concluído somente quando backend e React concordarem nos DTOs, testes relevantes passarem e não houver regressão na consulta mestre, filtros, seleção, lazy loading ou mutações existentes.

## Saída esperada do SpecKit

Produza uma especificação executável que:

- liste requisitos funcionais e não funcionais;
- detalhe contratos/payloads e regras por aba;
- identifique arquivos/classes Laravel atuais a alterar após inspecioná-los;
- proponha fases de implementação seguras;
- apresente critérios de aceite e matriz de testes;
- registre decisões deliberadas de segurança que diferem de comportamentos inseguros do legado;
- não solicite investigação do Delphi.
