# Definir critérios de aceite e testes

Type: grilling
Status: resolved
Blocked by: 08

## Question

Quais são os critérios de aceite mensuráveis e a matriz mínima de testes para o MVP da integração Amazon (conexão de conta, sincronização de categorias, publicação e manutenção de produtos/estoque/preço), cobrindo os casos dourados de paridade com ML/Magalu e os riscos específicos da Amazon (categoria pendente de aprovação, atributo obrigatório faltante, rate limit)?

## Answer

### Critérios de aceite

- [ ] Conexão de conta Amazon segue a granularidade por Filial (ticket 03), com fluxo OAuth2/LWA reaproveitando `MarketplaceOAuthProviderRegistry` sem nenhum campo de IAM/ARN na UI.
- [ ] Vínculo de classificação por produto guarda o product type Amazon, não um código de categoria (ticket 04).
- [ ] Nenhuma publicação é tentada sem checagem prévia de `getListingsRestrictions`; bloqueio exibe motivo e próximo passo quando disponível.
- [ ] Estoque enviado usa a mesma regra de percentual da spec 190, sem ajuste.
- [ ] Preço deduz a taxa de referral da tabela de referência antes de aplicar a margem-alvo (ticket 06).
- [ ] Produtos com grade publicam como família pai/filho nativa da Amazon (`parentageLevel`), reaproveitando `FamilyPayloadContract`/`FamilyProductLoader` sem alterar o contrato genérico da spec 202.
- [ ] Rate limiter aplica limites distintos por operação (Listings Items, Catalog Items, Feeds), não um limite único por canal.
- [ ] Sincronização usa o outbox/orquestração da spec 187 sem nenhuma infraestrutura paralela.
- [ ] Pedidos não aparecem em nenhum fluxo desta entrega.

### Matriz mínima de testes

- **Conexão de conta**: conectar uma Filial via OAuth2/LWA, token expira em 1h e é renovado via refresh token sem intervenção manual.
- **Categoria/product type**: produto vinculado a um product type sem os atributos obrigatórios do schema → bloqueado com erro claro antes de tentar publicar.
- **Restrição de listagem**: produto de categoria/marca gated → bloqueado por `getListingsRestrictions` antes de qualquer tentativa de `putListingsItem`; produto elegível para isenção de GTIN → fluxo de isenção sinalizado.
- **Preço com taxa de referral**: produto de categoria com taxa de referência alta (ex. eletrônicos) vs. baixa → preço final reflete a dedução corretamente antes da margem-alvo.
- **Estoque**: variação do percentual de estoque site → quantidade enviada bate com a mesma fórmula de ML/Magalu.
- **Família pai/filho**: produto com 3 variantes de grade → publica 1 item PARENT + 3 itens CHILD; alteração de uma variante reconcilia automaticamente via `FamilyProductLoader`; produto sem grade publica como item único (`parentageLevel: NONE` ou ausente).
- **Rate limit**: rajada de chamadas a `putListingsItem` respeita o limite configurado (5 req/s) sem estourar; `createFeed` respeita seu limite (bem mais restritivo) separadamente.
- **Regressão ML/Magalu**: nenhuma mudança na orquestração/outbox/regras comerciais afeta o comportamento já validado desses dois canais.
