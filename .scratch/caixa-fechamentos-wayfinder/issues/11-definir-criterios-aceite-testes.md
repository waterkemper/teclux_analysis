# Definir critérios de aceite e testes

Type: grilling
Status: resolved
Blocked by: 10

## Question

Quais são os critérios de aceite mensuráveis e a matriz mínima de testes para a Fundação de Caixa (abertura/fechamento no Usuário, schema de autenticacoes/eventos) e para o Fechamento de Caixa (totalização, aba Eventos, PDF, Fechar Caixa), cobrindo os casos dourados de totalização, os bloqueios de fechamento, a autorização sensível da aba Eventos e as seções condicionais do PDF?

## Answer

### Critérios de aceite — Fundação de Caixa

- [ ] `caixaaberto` só é verdadeiro quando `dataaberturacaixa > datafechamentocaixa` **e** `dataaberturacaixa` é hoje (ticket 03); um caixa aberto em dia anterior e nunca fechado aparece como fechado.
- [ ] `AbrirCaixa` (comando de domínio) seta `dataaberturacaixa := hoje` e exige autorização sensível de Gerente de Caixa (senha se já é gerente, login completo de outro gerente se não é) — sem rota/UI própria nesta entrega.
- [ ] O repositório de leitura de `autenticacoes` expõe os 14 tipos (`P/F/D/N/A/B/C/H/S/E/J/R/G/U`) com o predicado padrão de não-cancelado (`Not Exists` auto-join).
- [ ] Leitura mínima de `cheques` e `recebimentos` funciona (sem CRUD), suficiente para os tipos H e T.
- [ ] Nenhuma rota de escrita é criada para os ~13 tipos de lançamento fora de escopo.

### Critérios de aceite — Fechamento de Caixa

- [ ] Totalização reproduz a matriz dourada do ticket 06 (todos os totais, incluindo Saldo Atual pela fórmula única) usando `MoneyDecimal`.
- [ ] Fechar Caixa bloqueia corretamente nos 4 casos de guarda (transferência não confirmada, código de caixa vazio, data em branco, caixa de outro operador) — nenhum papel consegue fechar caixa alheio.
- [ ] Fechar Caixa gera o PDF antes de persistir o fechamento; se a persistência falhar por incompatibilidade de data, nada muda no Usuário.
- [ ] A segunda autorização (salvar Eventos) só é solicitada quando há ao menos uma linha alterada pendente.
- [ ] A aba Eventos permite editar `evento` e `parametros` em várias linhas, nunca cria linha nova, e salva em lote com uma única autorização sensível cobrindo todas as linhas alteradas.
- [ ] O PDF inclui todas as seções sempre presentes (cabeçalho, Entradas, Saídas, Outros, Detalhamento de Recebimentos) e as 12 seções condicionais respeitando os checkboxes/Parâmetros; linhas com valor zero são omitidas.
- [ ] `NumeroCopias`, ECF, impressora matricial e TEF não aparecem em nenhum lugar da implementação.

### Matriz mínima de testes

- **Saldo Atual**: caixa com saldo anterior positivo + mix de entradas/saídas de vários tipos → resultado bate com a fórmula única (soma aritmética), não com nenhuma das duas fórmulas descartadas.
- **Tipo D (Documento)**: uma entrada e uma saída no mesmo dia, mesma filial/caixa, verificando a classificação por comparação cronológica de saldo.
- **Tipo H (Cheque)**: um cheque à vista (`data >= vencto`), um a prazo (`data < vencto`) e um sem `cheque` vinculado (não identificado) — três classificações corretas.
- **Tipo T (Cartão/Pix)**: uma autenticação tipo T com recebimento tipo `C` (cartão crédito) e outra com tipo `P` (Pix) — valores creditados nos totais corretos via `recebimentos.valorlancto`, não via `autenticacoes.valor`.
- **Cancelamento**: uma autenticação cancelada (referenciada por outra tipo `C`) — excluída de todos os totais exceto do próprio contador de Cancelamento.
- **Transferência pendente**: uma transferência de saída com `entradapendente=true` e `confirmacao is null` — bloqueia Fechar Caixa com o aviso correspondente; uma transferência confirmada não bloqueia e entra no total.
- **Fechar caixa de terceiro**: usuário tenta fechar um caixa que não é o seu (mesmo sendo Administrador/Suporte/GerenteCaixa) → bloqueado.
- **Salvar Eventos sem pendência**: Gerente de Caixa fecha o caixa sem ter editado nada na aba Eventos → nenhuma segunda autorização é solicitada.
- **Salvar Eventos com pendência**: mesma situação, mas com 2 linhas editadas → uma única autorização cobre as duas.
- **PDF com seções desmarcadas**: gerar com todos os checkboxes de seção desligados → só cabeçalho/Entradas/Saídas/Outros/Detalhamento aparecem; com "Imprimir Detalhes" ligado → todas as seções aparecem independente dos checkboxes individuais.
- **Renegociação**: uma parcela com `contratos.primogenito` preenchido e múltiplas origens (`parcelas.origempagto`) → todas as origens aparecem como sub-linhas do Resumo de Renegociados.
- **Resumo por filial**: duas filiais de venda diferentes no mesmo dia/caixa → juros/descontos calculados linha a linha por parcela, agrupados corretamente por filial (cálculo independente da totalização geral).
