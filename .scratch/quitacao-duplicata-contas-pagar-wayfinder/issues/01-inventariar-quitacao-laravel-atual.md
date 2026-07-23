# Inventariar a Quitação de Duplicata na tela Laravel atual

Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato real e completo da quitação hoje implementada dentro de `DocumentosPagar/Cadastro.tsx`, `DuplicatasGrid`, `DuplicataDialog` e respectivos types/helpers, incluindo habilitação, seleção, autorização sensível, campos/defaults, cálculo, validações, pagamento parcial/zero, refazer, cancelamento, payload enviado, feedback, atalhos e testes, e onde o frontend decide ou persiste fatos que deveriam ser server-side?

## Answer

### Síntese

`CONFIRMADO` — A tela Laravel atual não possui um comando de Quitação. Ela implementa uma **edição local dos campos de pagamento da Duplicata**, precedida por uma avaliação sensível no frontend, e persiste o resultado apenas quando o Usuário grava o Documento inteiro. O caminho real é:

```text
selecionar linha aberta
→ clicar Pagar
→ avaliar ContasPagar/quitar_duplicata no frontend quando autorizado=false
→ descartar proof/autorizador e abrir DuplicataDialog(mode=pay)
→ editar draft local
→ Confirmar substitui a linha no useForm
→ Gravar Documento envia todas as Duplicatas
→ backend executa replaceAll
```

`DECISÃO ENCAMINHADA` — O fluxo atual pode ser preservado como referência visual, mas não como contrato financeiro. A matriz deverá substituir o trecho após a intenção “Pagar” por comando server-side dedicado; o update cadastral não poderá persistir fatos de quitação.

### Habilitação, seleção e entrada no fluxo

- `DuplicatasGrid` considera paga qualquer linha com `datapagto` truthy (`components/DuplicatasGrid.tsx:102-104`).
- O botão **Pagar** exige apenas `canEdit`, ausência de processamento, linha selecionada e `selectedPaid=false` (`DuplicatasGrid.tsx:146-159`). `canEdit` recebe `canSavePermission`, que é somente `canUpdate` no Documento existente ou `canCreate` no novo (`Cadastro.tsx:458-461,1047-1065`).
- `canCreate/canUpdate` atualmente derivam da Policy genérica que equivale ao acesso ao módulo, não de ability de pagamento.
- `handlePayDuplicata` repete apenas os gates “há seleção” e “não tem `datapagto`” (`Cadastro.tsx:577-580`). Não verifica no frontend: Documento persistido, previsão, origem, quitação de imposto, Data Contábil contextual, perfil Pagamento, Filial de Pagamento ou vínculos bancário/contábil.
- `DIVERGENTE` — Como `canEdit` também é verdadeiro durante inclusão, uma Duplicata ainda não persistida pode abrir o fluxo de pagamento. Não há gate `isEdit/codigo !== null`, embora o fluxo Delphi exija Documento/Duplicata persistidos.
- Linha paga desabilita Pagar e Excluir, mas **Alterar** continua habilitado; o modal de alteração trava Vencimento e Pagamento quando detecta `datapagto`, enquanto complemento/data de referência/observação continuam editáveis (`DuplicatasGrid.tsx:130-159,240-268`; `DuplicataDialog.tsx:240-243`).
- Não foi localizado atalho Ctrl+P. O único atalho específico da página é F7 para Adiantamento; os demais são os atalhos cadastrais genéricos (`Cadastro.tsx:660-684`).

### Autorização sensível atual

- Duplicata com `autorizado=true` abre diretamente o modal. Caso contrário, a página chama `useSensitiveOperationAuth.runWithAuth` com `modulo='ContasPagar'`, `acao='quitar_duplicata'` e `entidadeId=datavencto|numero` (`Cadastro.tsx:581-598`; `types.ts:167-169`).
- O catálogo configura a ação como sempre ativa, perfil legado `pagamento`, permissão nominal `AUTORIZAR_PAGAMENTO`, sem reuso contextual e sem persistência automática do autorizador. Operador com perfil pode usar senha própria; demais informam login/senha de autorizador (`config/sensitive-operation-auth.php:285-298`).
- A avaliação usa a **Filial ativa da sessão**, não a Filial exibida no modal nem uma Filial de Pagamento escolhida (`SensitiveOperationAuthController.php:16-35,71-80`).
- `useSensitiveOperationAuth` retorna `provaAutorizacao` e `usuarioAutorizador`, mas o callback `openPay` não recebe argumentos. Ambos são descartados (`Cadastro.tsx:582-598`; `Hooks/useSensitiveOperationAuth.ts`).
- O proof não é incluído no form, não é validado/consumido pelo update e não é vinculado ao payload financeiro. A rota genérica `validate-proof` existe, mas este fluxo não a chama.
- `CRÍTICO` — A autorização apenas controla a abertura do modal no browser. Qualquer cliente com acesso ao POST pode enviar os mesmos campos sem desafio. A Duplicata também continua `autorizado=false` após uma autorização manual bem-sucedida, porque o callback não altera esse fato.
- `CRÍTICO` — `entidadeId=datavencto|numero` omite Documento, fornecedor, valor e Filial, e pode colidir entre Documentos. Não há `contextoId` nem assinatura/revisão financeira.

### Modal de Pagamento: defaults, campos e bloqueios

`DuplicataDialog` possui apenas os modos `insert | edit | pay` (`DuplicataDialog.tsx:22`). Não existem modos `cancel` ou `rebuild`.

Ao abrir `pay`:

- clona a linha selecionada;
- bloqueia campos de Vencimento, valor de vencimento, desconto, juros, multa e Banco em cobrança;
- preenche Data de Pagamento com a **data do navegador** se vazia;
- preenche Valor Pago com o valor existente positivo ou `calcDuplicataValorAPagar(...)` (`DuplicataDialog.tsx:94-130,240-247`);
- mantém complemento, data de referência e observação editáveis;
- habilita Data de Pagamento, Valor Pago, Tipo de Pagamento, Conta e cheque;
- mostra Filial somente leitura usando `filialemissao` do Documento (`DuplicataDialog.tsx:524-568`);
- mostra Banco/Agência derivados da Conta escolhida somente na sessão do modal (`DuplicataDialog.tsx:595-658`).

`DIVERGENTE` — Não existe campo persistido de Filial de Pagamento no tipo `DuplicataLinha`; a UI usa Filial de Emissão como rótulo, enquanto a autorização usa Filial ativa da sessão. São três conceitos potencialmente diferentes sem reconciliação.

`DIVERGENTE` — Data default é calculada por `new Date()` no cliente, apesar de a página já receber `dataServidor` do backend. Mudança de timezone/relógio pode alterar o dia.

`NÃO IMPLEMENTADO` — “Refazer o pagamento” aparece como checkbox permanentemente desabilitado, sem estado, handler ou payload (`DuplicataDialog.tsx:589-592`).

### Cálculo exibido

- `calcDuplicataValorAPagar` espelha no TypeScript `calcular_valor_pagar`: considera Vencimento útil, calendário, multa única, juros diários, tipos valor/percentual e desconto (`types.ts:374-403`; testes em `types.calcDuplicataValorAPagar.test.ts`).
- O modal chama o cálculo com `referenceDate` omitida, portanto usa novamente a data do navegador (`DuplicataDialog.tsx:244-247`).
- Se a linha já está paga, o helper retorna `valorvencto - valordesconto`, sem recalcular atraso (`types.ts:387-402`).
- O grid calcula “juros do pagamento” ou “desconto do pagamento” somente pela diferença entre `valorpagto` e o valor exibido a pagar (`types.ts:405-420`; `DuplicatasGrid.tsx:90-118`). Isso é projeção de UI, não campos/fatos persistidos separados.
- `RISCO` — O cálculo é autoridade apenas no cliente durante a intenção de pagar; não foi localizado recálculo equivalente no backend antes de persistir `valorpagto`.

### Validações do modal

Ao confirmar `pay`, o frontend exige:

1. Data de Pagamento;
2. Data ≥ `DATA CONTABIL` e ≥ Emissão via `validateDatapagtoMinima`;
3. Valor Pago estritamente maior que zero;
4. Tipo de Pagamento;
5. Conta (`DuplicataDialog.tsx:268-299`).

O backend repete apenas parte das datas: FormRequest valida Data e, quando preenchida, compara com Data Contábil/Emissão. Para os campos financeiros, as regras aceitam `valorpagto >= 0` e tornam Tipo/Conta opcionais (`StoreDocumentoPagRequest.php:101-151,327-353`).

`DIVERGENTE` — Quitação com valor zero/100% de desconto não pode ser confirmada pela UI, embora `valorpagto=0` seja aceito pelo request. Não há confirmação específica nem limpeza derivada de Conta/Tipo/cheque.

`NÃO IMPLEMENTADO` — Não há decisão de pagamento parcial, criação de residual ou conversão da diferença em desconto. Qualquer valor positivo diferente do calculado é aceito pelo modal e aparece como juros/desconto no grid.

`NÃO LOCALIZADO` — Validação de saldo de Adiantamento, compatibilidade/saída do Tipo de Pagamento, Conta/Filial autorizada, Evento, integração bancária, cheque em outra data, período do Documento, Documento previsão/originado, imposto quitado ou autorização durável.

### Confirmação local e payload HTTP

- “Confirmar” no modal não faz request. `handleDuplicataConfirm` substitui a linha no array do `useForm`, fecha o modal e marca a página dirty (`Cadastro.tsx:601-620`).
- O botão “Cancelar” do modal apenas fecha/descarta o draft. Não significa Cancelamento da Quitação (`DuplicataDialog.tsx:663-675`).
- A quitação só é enviada no submit geral do Documento. `serializeDuplicatasForApi` remove apenas nomes de UI e envia, entre outros, `datapagto`, `valorpagto`, `tipopagamento`, `contapagto`, `chequepagto`, `autorizado` e `dda` para todas as linhas (`Cadastro.tsx:430-440`; `types.ts:171-186`).
- `StoreDocumentoPagRequest::authorize()` retorna `true`; update herda a classe. As regras aceitam diretamente todos os fatos financeiros e `autorizado` (`StoreDocumentoPagRequest.php:13-18,327-353`).
- `DocumentoPagCadastroPageService::update` mapeia esses valores e chama `LegacyDuplicataRepository::replaceAll` para a coleção inteira dentro da transação do Documento (`DocumentoPagCadastroPageService.php:348-386,571-620`).
- O save chama a sincronização tributária nas ocasiões de cadastro e pagamento, mesmo sem comando específico; não foi localizada coordenação com movimento bancário, Contabilidade, usuário pagador, autorizador ou log (`DocumentoPagCadastroPageService.php:369-384`).
- `CRÍTICO` — Um POST artesanal pode marcar qualquer linha como paga/autorizada, alterar ou limpar pagamento existente, trocar Conta/Tipo/cheque e substituir todas as Duplicatas sem proof, ability de pagamento, expected revision ou lock da parcela.

### Cancelamento, refazer e feedback

- `NÃO IMPLEMENTADO` — A grade não transforma o botão em Cancelar quando a linha está paga; ela simplesmente desabilita Pagar. Não há handler/endpoint de Cancelamento da Quitação.
- `NÃO IMPLEMENTADO` — Refazer é somente checkbox disabled.
- Para “pagamento” local, o único feedback é fechar o modal e atualizar a grade; ainda não houve commit. O feedback de sucesso aparece apenas no save geral como “Documento a pagar atualizado com sucesso”.
- Se o Usuário navegar antes de salvar, dirty guard avisa; descartar elimina a suposta quitação. Se o save falhar, a intenção permanece no form, mas não existe estado de retry/idempotência específico.
- `DIVERGENTE` — A UI apresenta situação “Pago” assim que `datapagto` entra no array local, antes de qualquer validação server-side, efeito financeiro ou commit (`types.ts:423-424`).

### Cobertura de testes localizada

`CONFIRMADO` — Existem testes para:

- cálculo de valor a pagar, multa/juros e calendário;
- validação frontend da Data de Pagamento contra Emissão/Data Contábil;
- validação Feature da Data de Pagamento no POST geral;
- persistência genérica de Duplicatas por `replaceAll`.

`NÃO LOCALIZADO` — Não há teste de componente/jornada para botão Pagar, modal pay, desafio sensível, proof/autorizador, Documento já/não persistido, ability Pagamento, Filial, parcial, zero, cancelamento, refazer, duplo clique, adulteração HTTP, concorrência, retry, movimento bancário, Contabilidade, auditoria ou sincronização tributária acionada por uma quitação real.

### Contrato que a matriz deverá substituir ou preservar

**Preservar/estender:** seleção e grade, modal visual, lookups de Tipo/Conta, cálculo como prévia, validação de datas, bloqueio durante processamento, componentes ERP e framework sensível.

**Substituir:** callback que descarta proof; mudança local que marca Pago; persistência via update integral/`replaceAll`; gate `canEdit`; data do navegador; Filial de Emissão como Filial de Pagamento; aceitação de fatos financeiros no FormRequest cadastral.

**Criar:** comando dedicado de Quitação com identidade completa, expected revision, idempotency key, Filial de Pagamento, proof/contexto, recálculo server-side e resposta pós-commit; comandos separados de Cancelamento e Refazer; estados/abilities por ação; testes de adulteração, concorrência e efeitos.
