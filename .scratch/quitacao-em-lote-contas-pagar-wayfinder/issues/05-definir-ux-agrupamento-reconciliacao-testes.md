# Definir a UX, o agrupamento bancário, a reconciliação e os testes

Type: task
Status: resolved
Blocked by: 04

## Answer

### Superfície e jornada

**DECIDIDO** — A Quitação em Lote será uma página completa do módulo Contas a Pagar, aberta pelo hub e protegida pelo acesso ao módulo, escopo de Filial e habilidade específica. O backend separará pesquisa, `preview` sem escrita, `confirm` e impressão pós-commit. A implementação seguirá ADR-0002 e reutilizará `AppLayout`, grid paginado (25 linhas), `SensitiveOperationAuthDialog`, `CatalogCodeLookup`, `BrIsoDateTextInput` e `BrNumericAmountField` (ou sucessores vigentes).

1. **Pesquisar (F6):** intervalo de vencimento, Filiais permitidas, Fornecedor, Carteira/Banco, Banco quando aplicável, DDA (`Todos`, `Sem DDA`, `Somente DDA`) e ordenação. O read model retorna identidade, revisão, autorização, elegibilidade e motivo por linha.
2. **Selecionar:** o grid detalhado é a fonte autoritativa e mostra checkbox, Fornecedor, documento/parcela, nota/complemento, vencimento, atraso, valor no vencimento, previsão calculada/editável, evento e autorização. A seleção persiste entre páginas por identidade + revisão; “Selecionar página” não significa todos os resultados.
3. **Agrupar a visualização:** `Detalhada`, `Por documento` e `Por fornecedor` são projeções. Selecionar um grupo materializa e exibe todas as identidades filhas; nunca envia somente uma chave agregada.
4. **Preencher dados comuns:** painel fixo exibe quantidade e totais e recebe `tipopagamento`, `contapagto`, `datapagto`, Filial, cheque/documento e opções de impressão. Alterar seleção, previsão ou campo financeiro invalida a prévia.
5. **Escolher o efeito bancário:** `Um movimento por duplicata` (`NONE`) ou `Cheque único para o lote` (`SINGLE_CHECK`). A segunda exige cheque e compatibilidade de Filial/conta/tipo. Agrupamento visual nunca muda essa escolha.
6. **Quitar (F5):** primeiro chama `preview`. Para cada `previsão < valor vencto`, abre diálogo sequencial e acessível, com progresso, para **Cancelar**, **Gerar outra parcela** ou **Desconto Obtido**. **Cancelar** encerra o lote, descarta as escolhas e não chama `confirm`; as outras respostas geram a prévia definitiva.
7. **Revisar e autorizar:** exibir itens, totais, descontos, parcelas residuais, estratégia, cheque e alertas; depois coletar a prova `ContasPagar/quitar_duplicatas_lote`, auditando operador e autorizador separadamente.
8. **Confirmar uma vez:** enviar token/hash, revisões, decisões e idempotência. Bloquear edição/duplo envio enquanto processa. `409/410` exige nova prévia; não existe sucesso parcial.
9. **Pós-commit:** recarregar a grade, mostrar identificador e efeitos persistidos e liberar recibo/cheque. Falha de impressão é aviso retomável, sem desfazer ou repetir o pagamento.

A previsão mostra valor calculado e editado; os totais distinguem vencimento, previsão e pagamento. Linhas inelegíveis ficam desmarcadas com motivo. Diálogos controlam foco e teclado; `Esc` no parcial equivale claramente a cancelar o lote. São obrigatórios estados de carregamento, vazio, acesso negado, validação por item, conflito, prévia expirada, processando, replay, sucesso e sucesso com falha de impressão.

### Efeito bancário e reconciliação

**DECIDIDO** — A prévia do servidor é a autoridade. Em `NONE`, há um `movtosbancos` e um evento por Duplicata. Em `SINGLE_CHECK`, exatamente um `movtosbancos` pelo total e um `movtosbancoseventos` por Duplicata. O cliente não fabrica `sequencia` nem `sequenciaevento`; o resultado confirma as chaves gravadas em cada Duplicata.

`movtosbancos.documento` recebe `chequepagto`. O histórico individual segue `[NF|DOC][ complemento] DUP <documento>/<parcela> - <fornecedor>`. No cheque único, o cabeçalho usa `PAGTO DIVERSAS DUPLICATAS` e os eventos preservam a rastreabilidade individual. A prévia apresenta os mesmos textos normalizados que serão persistidos.

Ainda dentro da transação, o reconciliador confere contra o `PaymentEffectManifest`:

- todas e somente as Duplicatas previstas pagas, com campos de pagamento e vínculos exatos;
- cardinalidade de cabeçalhos/eventos e, no cheque único, soma dos eventos igual ao cabeçalho com o sinal esperado;
- documento, histórico, conta, data, Filial, cheque e chaves sem órfãos ou vínculo alheio;
- residual/desconto, Contabilidade, tributos, parâmetros efetivos e Auditoria iguais ao plano;
- ausência de colisão de sequência, revisão perdida ou efeito fora do conjunto bloqueado.

Qualquer divergência reverte o lote inteiro. Após commit, a tela retoma o resultado por idempotência/identificador depois de timeout: payload idêntico retorna o mesmo resultado; payload diferente com a mesma chave conflita. Impressões usam job/outbox identificado pelo lote e podem ser repetidas sem repetir finanças.

### Matriz mínima de testes

**Unitários:** máquina de estados e invalidação da prévia; cálculos/totais; decisões de residual/desconto; planejadores `NONE`/`SINGLE_CHECK`; documento/histórico; hash/idempotência; ordem canônica de locks; reconciliador; filtros, inelegibilidade e seleção explícita.

**Feature Laravel:** rotas, módulo/Filial/habilidade/prova sensível; filtros/paginação; rejeição de ids ou revisões inválidas; `preview` sem escrita; erros `401/403/404/409/410/413/422/503`; cancelamento sem `confirm`; retomada e impressão somente pós-commit.

**PostgreSQL real:** lote completo e rollback quando o enésimo item falha; cardinalidades e somas nos dois modos; persistência de `chequepagto -> documento`, históricos, `sequencia` e `sequenciaevento`; residual, desconto, autorização automática e numeração segura; Contabilidade, tributos, Auditoria e rollback limpo; transações sobrepostas, alteração após prévia, colisão, ordem anti-deadlock e replay concorrente. A suíte financeira não pode continuar com `markTestSkipped`; indisponibilidade do PostgreSQL no grupo CI deve falhar visivelmente.

**Frontend:** filtros/paginação/seleção; independência dos dois agrupamentos; previsão/totais; loop parcial completo e Cancelar sem request; revisão/prova/duplo clique; conflito/expiração; foco/teclado; replay e retry de impressão sem novo pagamento.

**Regressão:** Quitação individual usa o mesmo motor; autorização continua pré-condição; Duplicata paga permanece imutável; Estorno consome vínculos/manifesto de `NONE` e `SINGLE_CHECK` sem busca textual.

## Evidence classification

- **CONFIRMADO:** padrões de página, grid, seleção e autorização sensível já existem no Laravel; filtros, previsão, visões, F5/F6 e impressão são alcançáveis no Delphi.
- **DECIDIDO:** seleção explícita, separação dos agrupamentos, prévia e loop parcial antes da autorização, cancelamento integral, reconciliação transacional e impressão retomável.
- **OPORTUNIDADE:** tornar PostgreSQL um gate real e compartilhar o manifesto com o Estorno.
- **NÃO LOCALIZADO:** página/rota Laravel atual para esta operação; deverá seguir as convenções vigentes, sem criar uma segunda infraestrutura.

## Source question

Qual deve ser a superfície verificável da tela e dos contratos para filtros, seleção, edição, totais, diálogo sequencial de **Cancelar**, **Gerar outra parcela** e **Desconto Obtido**, agrupamento opcional por cheque, chaves `sequencia`/`sequenciaevento`, documento/histórico, falhas e retomada; e quais testes unitários, feature, PostgreSQL, concorrência e regressão demonstram esse comportamento?
