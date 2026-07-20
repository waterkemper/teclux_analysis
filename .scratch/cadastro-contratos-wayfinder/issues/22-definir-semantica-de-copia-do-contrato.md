Type: task
Status: resolved
Blocked by: 04, 08, 09, 10, 12, 18

## Question

Ao copiar um Contrato ou itens selecionados, quais dados devem ser copiados, recalculados, omitidos ou perguntados para produzir um novo rascunho `O`, preservando origem e evitando clonar efeitos financeiros, fiscais, de estoque, logística, relacionamento e auditoria?

## Answer

### Duas operações, não uma “cópia”

- `CONFIRMADO` — o Delphi oferece duas operações diferentes: o botão/atalho de cópia do Contrato (`fmcadastrocontratos.pas:940,2787-2788,3111-3115`) e “Copiar produtos de outro contrato” (`:3891-3911`; botão no DFM em `:5715-5754`).
- `CONFIRMADO` — a primeira não é clonagem: cria outro Contrato com quantidades selecionadas e reduz/exclui essas quantidades na origem (`dmcadastrocontratos.pas:4517-4533,4823-4828`).
- `DECISÃO NOVA` — no Laravel os comandos serão nomeados **Desmembrar contrato** e **Importar produtos de outro contrato**. A interface nunca esconderá que o primeiro altera dois contratos e que o segundo não altera a origem.
- `DECISÃO NOVA` — são casos de uso, endpoints, capabilities e transações distintos. Nenhum será implementado como duplicação genérica de registros.

## Desmembrar contrato

### Elegibilidade e interface

- `CONFIRMADO` — o Delphi habilita o comando somente até `R` (`fmcadastrocontratos.pas:940`), exige ao menos um produto selecionado e pede confirmação (`dmcadastrocontratos.pas:4426-4436,4831-4833`).
- `DECISÃO NOVA` — somente Contratos persistidos em `O` ou `R`, com capability `contracts.split`, podem ser desmembrados. Serviços não participam; permanecem integralmente na origem, conforme confirmação do usuário.
- `DECISÃO NOVA` — a modal mostrará número/situação da origem e, por produto, quantidade original, já comprometida, máxima transferível, quantidade a transferir e saldo restante. Uma prévia exibirá totais, desconto, parcelas, logística e reservas de ambos antes da confirmação.
- `DECISÃO NOVA` — quantidade transferida deve ser positiva, respeitar precisão/unidade e não exceder a quantidade transferível. Ao menos uma linha é obrigatória. O comando recebe `sourceRevision`, seleção explícita e idempotency key.

### Situação e identidade

- `CONFIRMADO` — o Delphi copia `situacao` e `datareservado` da origem (`dmcadastrocontratos.pas:4604-4605,4815-4816`) e executa tratamento especial de movimentos quando `FOperacaoCopia` está ativo (`:12660-12691,13082-13103`).
- `DECISÃO NOVA` — preservar a situação: `O → O` e `R → R`. Contrato `O` não movimenta estoque. Em `R → R`, as reservas das quantidades selecionadas são transferidas atomicamente.
- `DECISÃO NOVA` — o destino recebe novo número pelo serviço canônico, nova revision e `origin_type=contract_split`, `origin_id=<origem>`, correlation/split id. A origem registra referência inversa ao mesmo evento; não se altera seu vínculo histórico com Orçamento.
- `DECISÃO NOVA` — datas comerciais originalmente pactuadas, inclusive emissão/reserva, são preservadas como fotografia; `created_at`, operador e evento de desmembramento registram quando a nova entidade foi materializada.

### Cliente e fotografia cadastral

- `CONFIRMADO` — o Delphi copia Cliente/tipo e uma fotografia extensa do cabeçalho, endereço, documentos, renda, cônjuge e referências campo a campo (`dmcadastrocontratos.pas:4541-4554,4606-4806`).
- `DECISÃO NOVA` — como é o desmembramento da mesma venda, copiar o vínculo e a fotografia de Cliente efetiva do Contrato de origem, sem consultar/alterar o Cliente mestre durante a operação. O destino mantém o mesmo tipo `C/F/L`.
- `POSSÍVEL BUG LEGADO` — a lista manual de dezenas de campos pode carregar dados sem significado atual e não é contrato de API. O Laravel copia o objeto de fotografia versionado definido na fatia de Cliente, não uma allowlist derivada do PAS.
- `DECISÃO NOVA` — avalista, dependentes e demais participantes pertencentes à proposta são preservados somente como fotografia necessária à mesma condição comercial; novas validações ocorrerão na próxima transição sensível.

### Produtos e cálculo comercial

- `CONFIRMADO` — o Delphi permite quantidade parcial e copia produto/Filial, preço de tabela/venda, descrição do preço, entrega/montagem, pedido do Cliente, brinde, vendedor e classificação fiscal (`dmcadastrocontratos.pas:4453-4508`).
- `DECISÃO NOVA` — criar novas identidades de linha no destino e preservar produto/variação, Filial, quantidade transferida, preço unitário efetivo, desconto/acréscimo de linha, vendedor e intenções comerciais. Não copiar ids técnicos de linha, hashes, flags de cancelamento, movimento, reserva nem fotografia fiscal obsoleta.
- `DECISÃO NOVA` — preços unitários e condições comerciais dos produtos permanecem iguais. O desconto geral é repartido proporcionalmente entre origem e destino pelo motor determinístico já definido, com regra de resíduos; a soma dos dois descontos deve ser exatamente igual ao desconto anterior.
- `DECISÃO NOVA` — recalcular em ambos subtotal, total bruto/líquido, bases comerciais e assinatura da proposta. Cupom/crédito promocional não é clonado como identificador consumível; seu benefício já materializado entra somente no rateio quando a política do cupom permitir, caso contrário o comando é bloqueado para decisão explícita.
- `POSSÍVEL BUG LEGADO` — o Delphi limpa desconto/frete/seguro do novo Contrato e subtrai apenas o total selecionado da origem (`dmcadastrocontratos.pas:4555-4559,4823-4827`), podendo dissociar totais da condição original. Isso não será reproduzido.

### Financeiro

- `CONFIRMADO` — o legado copia plano e taxa de juros, mas não há cópia explícita das parcelas no corpo de `CopiarContrato` (`dmcadastrocontratos.pas:4570-4573`).
- `DECISÃO NOVA` — preservar plano e condições da proposta, repartir a base pelo resultado comercial e recalcular separadamente as parcelas dos dois Contratos com o motor Laravel usado no Orçamento; parcelas permanecem separadas, sem agrupamento.
- `DECISÃO NOVA` — nunca copiar pagamentos, recebimentos, baixas, boletos, conciliações, crédito consumido ou lançamentos. Se houver realização financeira incompatível com o novo rateio, bloquear o desmembramento e encaminhar para operação financeira própria.
- `DECISÃO NOVA` — a transação só conclui quando os dois cronogramas fecharem exatamente seus novos totais e passarem as invariantes de arredondamento/calendário.

### Estoque, lotes e séries

- `DECISÃO NOVA` — em `O → O`, apenas recalcular disponibilidade; não criar movimento/reserva. Em `R → R`, transferir a quantidade reservada da origem para o destino preservando produto, Filial, lote, série e natureza da alocação.
- `DECISÃO NOVA` — a transferência ocorre sob os mesmos locks da reserva, sem janela de liberação/re-reserva. Falta, conflito de revision ou impossibilidade de transferir qualquer lote/série aborta toda a operação sem alterar origem/destino.
- `DECISÃO NOVA` — a conferência não é copiada: destino ganha identidade `CTR/<novo numero>` e estado de conferência próprio; eventual obrigatoriedade é reavaliada.

### Logística

- `DECISÃO NOVA` — copiar endereço/promessa de entrega e as modalidades previstas nas linhas transferidas. Serviços permanecem na origem.
- `DECISÃO NOVA` — não copiar valor/cotação de frete, transportadora confirmada, agenda, capacidade consumida, parada logística, entrega/retirada/montagem executada, comprovantes ou ocorrências. O destino recalcula/cota e agenda novamente.
- `DECISÃO NOVA` — efeitos logísticos já executados ou que impeçam separar quantitativamente os produtos bloqueiam o comando; não são repartidos por inferência.

### O que nunca é clonado

- `DECISÃO NOVA` — não copiar documentos/dados fiscais, séries fiscais, faturamento, devoluções, notas, atendimentos, contatos documentais, questionários/aplicações/respostas, venda perdida, anexos, e-mails, impressões, autorizações, logs ou auditoria.
- `DECISÃO NOVA` — o novo Contrato produz sua própria auditoria de criação por desmembramento. A origem registra before/after das quantidades/totais/reservas; ambos compartilham correlation id e autoria efetiva.
- `DECISÃO NOVA` — o comando é uma única unidade atômica para número, destino, mutações da origem, rateios, parcelas e reservas. Efeitos pós-commit usam outbox; retry retorna o mesmo destino.

## Importar produtos de outro contrato

### Evidência e seleção

- `CONFIRMADO` — o modal Delphi pesquisa Contrato, lista produtos, permite selecionar todos/individualmente e confirma com F5: `fmcopiarprodutoscontratos.pas:93-147,160-205` e DFM `:195-405`.
- `CONFIRMADO` — ele alterna preço atual e histórico (`fmcopiarprodutoscontratos.pas:150-157`); a carga inicial escolhe preço atual (`dmcadastrocontratos.pas:15900-15909,15938-15956`).
- `DECISÃO NOVA` — manter a operação separada. A origem é somente leitura e pode ser consultada pela mesma experiência F9/Consulta; o destino deve estar em estado comercial mutável e possuir capability `contracts.products.import`.
- `DECISÃO NOVA` — modal intuitiva mostra origem, itens, quantidade a importar, preço histórico, preço atual do destino, preço escolhido e resultado de consolidação/nova linha.

### Preço e inclusão

- `CONFIRMADO` — o Delphi reconsulta produto/estoque e atributos vigentes ao incluir (`dmcadastrocontratos.pas:15978-16084`).
- `DECISÃO NOVA` — padrão **Preço atual**, calculado para Cliente, cargo, markup, Filial e parâmetros do destino. Capability específica permite escolher preço histórico da origem ou editar preço sugerido.
- `DECISÃO NOVA` — a importação preserva apenas identidade/intenção selecionada e passa pelo mesmo command/motor de inclusão de produto do Cadastro: reidrata catálogo, fiscalidade comercial, disponibilidade, conferência e defaults atuais.
- `DECISÃO NOVA` — nunca importar reserva, lote/série, movimento, classificação fiscal histórica, desconto geral, parcelas, logística executada ou qualquer efeito da origem.

### Consolidação de linhas

- `CONFIRMADO` — o Delphi soma quantidade quando encontra o mesmo produto/Filial, sem reconciliar preço (`dmcadastrocontratos.pas:15989-15996`).
- `DIVERGENTE` — o Laravel só consolidará quando produto/variação, Filial, preço unitário, desconto/acréscimo e demais atributos da identidade comercial forem compatíveis. Caso contrário cria nova linha.
- `DECISÃO NOVA` — a prévia informa “somará à linha X” ou “criará nova linha” e os novos totais. Confirmação executa tudo atomicamente com `destinationRevision`; falha em qualquer item não deixa importação parcial.
- `DECISÃO NOVA` — depois da inclusão, recalcular totais/proposta financeira e marcar conferência/logística dependentes como pendentes conforme seus engines. O Contrato de origem permanece inalterado.

## Capabilities e guardas

| Operação | Capability principal | Estados | Prova sensível | Concorrência |
|---|---|---|---|---|
| Desmembrar | `contracts.split` | origem `O/R` | exigida quando parâmetros/policies determinarem | lock de origem, reservas e numeração + `sourceRevision` |
| Importar produtos | `contracts.products.import` | destino comercialmente mutável | preço histórico/manual exige capability própria | `destinationRevision` e transação única |

- `DECISÃO NOVA` — capabilities vêm do servidor e são reavaliadas na execução. A visibilidade do botão não autoriza o comando.
- `NÃO LOCALIZADO` — não foi encontrado serviço Laravel para qualquer uma das duas operações; a busca por cópia/desmembramento de Contrato nos services/controllers/testes não retornou implementação equivalente.

## Spec boundary

Esta fatia comporta **dois `$to-spec` independentes**:

1. **Desmembrar Contrato** — operação multiagregado atômica, incluindo rateio financeiro e transferência de reservas.
2. **Importar produtos de outro Contrato** — seleção, política de preço, consolidação e inclusão pelo motor comercial.

O primeiro deve incluir casos dourados `O → O`, `R → R`, quantidade parcial/total, desconto com resíduo, parcelas, lote/série, conflito de revision e retry idempotente. O segundo deve cobrir preço atual/histórico, permissão, linha compatível/incompatível e rollback integral.
