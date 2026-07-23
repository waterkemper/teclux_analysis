# Definir o estado imutável e o contrato do Estorno do Pagamento

Type: task
Status: resolved
Blocked by: 01, 02

## Answer

### Vocabulário e máquina de estados

- O termo canônico é **Estorno do Pagamento**. **Cancelamento da Quitação** fica como nome legado; **Exclusão** é remoção cadastral; **Refazer Pagamento** deixa de existir como operação de domínio.
- Para este contrato, a Duplicata é `OPEN` (não paga/não autorizada), `AUTHORIZED` (não paga/autorizada) ou `PAID` (Quitação concluída). Só existe `PAID` após confirmação e reconciliação de todos os efeitos obrigatórios.
- A única transição a partir de `PAID` é `Estorno do Pagamento: PAID -> AUTHORIZED`. Update cadastral/financeiro, Exclusão, nova Quitação, autorização, geração/substituição ou Refazer sobre a paga devem falhar no backend, inclusive para administrador/suporte.
- A imutabilidade alcança a Duplicata e mudanças no Documento que alterariam sua identidade ou significado econômico. Outras Duplicatas abertas podem ser mantidas se a operação não tocar/invalidate fatos da paga e o agregado reconciliar.

### Entrada e pré-condições

- Entrada: identidade completa (`documentopag`, `datavencto`, `numero`), `expected_revision`, `idempotency_key`, prova sensível de `estornar_pagamento_duplicata` e `origem` opcional.
- Exigir ability canônica `reversePayment`/equivalente, acesso às Filiais do Documento e Pagamento, prova válida, Duplicata `PAID`, revisão atual e ausência de bloqueadores tributários/contábeis.
- Em uma transação, travar Documento, Duplicata e movimentos/eventos/lançamentos envolvidos. Validar todos os vínculos antes da primeira mutação destrutiva.
- O alvo é uma Duplicata. Estorno de cheque/lote inteiro deve ser orquestração explícita de conjunto fechado, com locks, prova, revisão e atomicidade; nunca ampliar silenciosamente.

### Estado depois do Estorno

- Limpar `datapagto`, `valorpagto` para o vazio canônico (`0` se não nullable), `filialpagto`, `tipopagamento`, `contapagto`, `chequepagto`, `contacredito`, `evento`, `sequencia`, `sequenciaevento`, `nrlotecontabil`, `datapagtoaux`, `contapagtoaux`, `chequepagtoaux` e o Usuário de pagamento quando `usuario` representar quem quitou.
- Restaurar mutações causadas por Quitação parcial — valores, desconto, juros/multa e eventual Duplicata residual — pela fotografia/auditoria confiável. Sem fotografia e sem restauração inequívoca, bloquear para reconciliação manual.
- Preservar identidade, dados originais da obrigação não transformados pela Quitação, complemento, observação e banco de cobrança.
- Resultar em `autorizado = true`, preservando Autorizador e evidência/data da Autorização de Pagamento original. O Estorno não fabrica nova Autorização; sua prova pertence à Auditoria do Estorno.

### Efeitos obrigatórios

- **Bancos:** determinar pela fotografia da Quitação se Movimento Bancário era exigível; adiantamento e integração legitimamente inativa podem não produzir. Quando exigível, localizar cabeçalho por `(conta,datapagto,sequencia)` e evento por `(conta,datapagto,sequencia,evento,sequenciaevento)`, sempre com origem `P` e valores reconciliados.
- Movimento exclusivo: excluir eventos e cabeçalho. Agregado: excluir só o evento exato e recalcular o cabeçalho pelos restantes; sem eventos, excluí-lo; com um, restaurar documento/observação/evento individuais; com vários, manter representação agregada. Não escolher o “último evento” nem depender só de subtração.
- **Contabilidade:** se desativada no contexto da Quitação, nada a reverter; se ativa, identificar e eliminar/recompor exatamente seus lançamentos. Adapter indisponível bloqueia e provoca rollback.
- **Impostos retidos:** pagamento derivado já quitado bloqueia. Nos demais casos, reverter/sincronizar apenas efeitos da Quitação e reconciliar antes do commit.
- **Lote/auxiliares:** remover associações da Duplicata e recompor/excluir o agregado; nenhuma chave órfã pode permanecer.

### Falha segura, concorrência e idempotência

- Vínculo obrigatório ausente, incompleto, ambíguo, de outra origem, com valor divergente ou pertencente a outro pagamento retorna conflito de domínio `409`; não limpar, adivinhar nem corrigir histórico.
- Histórico sem Movimento só estorna automaticamente quando a ausência é demonstrável pela modalidade e Parâmetros do Sistema vigentes no pagamento. Sem evidência, exigir reconciliação manual.
- `expected_revision` protege o agregado e locks impedem corrida. Revisão divergente retorna `409` antes dos efeitos.
- Mesma `(origem,ação,idempotency_key)` e hash retorna o resultado confirmado com `replayed=true`; chave igual/payload diferente conflita. Nova chave sobre Duplicata já estornada retorna `409`, sem repetir efeitos.
- Falha em banco, Contabilidade, impostos, Auditoria ou reconciliação causa rollback integral. Sucesso somente após commit e prova de situação `AUTHORIZED` e agregados reconciliados.

### Auditoria e arquitetura

- Persistir Auditoria de domínio imutável, não só log técnico: identidade, situações/revisões anterior e posterior, campos limpos/restaurados, vínculos e valores afetados, Usuário no papel de Operador, Autorizador da prova, Filiais, origem, request id, idempotency key e instante. Não persistir segredo/prova reutilizável.
- Preservar comandos financeiros dedicados, repositories/writer, Filiais, proof, revisão, idempotência, transação e reconciliação. Substituir Cancel por Estorno e eliminar Rebuild ponta a ponta.
- A decisão supersede parcialmente a ADR-0246: mantém a separação rascunho/comandos financeiros, mas revoga a oficialização de Refazer Pagamento. A documentação final deve registrar isso explicitamente.

## Question

Qual é o contrato único e verificável para a Duplicata `PAID`, a transição de Estorno do Pagamento, os campos antes/depois, a eliminação exata dos efeitos bancários e demais efeitos obrigatórios, autorização resultante, concorrência, idempotência, Auditoria e falha segura em vínculos incompletos ou agregados?
