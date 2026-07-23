# Revalidar o prompt contra o Laravel atualizado

Type: task
Status: resolved
Blocked by: 05

## Question

Quais capacidades relativas à Quitação de Duplicata foram implementadas ou alteradas no Laravel após a consolidação inicial, quais premissas do dossiê e do prompt ficaram desatualizadas e que ajustes são necessários para que o prompt `/speckit.specify` preserve o código atual e especifique somente as lacunas reais?

## Answer

`CONFIRMADO` — O prompt precisava de atualização material. O Laravel passou a conter commands, requests, rotas, controller, UI e infraestrutura para autorização, Pay, Cancel, Rebuild, revisão, idempotência, locks, banco origem `P`, Contabilidade, parcelas, impressão e adapters. A instrução anterior de “criar” esses elementos induziria duplicação.

Foram revalidados os arquivos em `backend/app/Application/ContasPagar`, FormRequests, `DocumentosPagarController`, rotas, `Cadastro.tsx`, `DuplicataDialog` e testes. A implementação é um baseline em andamento, não contrato concluído.

Lacunas confirmadas: preview ausente; parcial automaticamente residual; desconto integral incompatível com Tipo/Conta obrigatórios; Filial de Pagamento enviada como Filial de Emissão; UUID novo por tentativa; idempotência com janela de crash fora da transação; origem aceita do cliente; `MAX+1` em residual/bancos; residual sem herança/parameterização; proof sem fingerprint financeira completa; Cancel/Rebuild sem `payment_id`, motivo, scope e manifesto; Rebuild não desfaz simetricamente; Contabilidade stub; reconciliação apenas cadastral; auditoria não transacional; principais testes PostgreSQL skipped.

Atualizações realizadas:

- [`dossie.md`](../../../modules/financeiro/contas-pagar/quitacao-duplicata/dossie.md) agora registra o baseline revalidado e as lacunas reais;
- [`speckit-prompt.md`](../../../modules/financeiro/contas-pagar/quitacao-duplicata/speckit-prompt.md) manda caracterizar, preservar, corrigir e completar os commands atuais, adicionar somente o preview/seams faltantes, ativar testes PostgreSQL e produzir matriz “implementado/incompleto/faltante/preservar”.

`DECISÃO` — A arquitetura e os requisitos financeiros permanecem válidos. Mudou a estratégia: não criar um segundo módulo, mas aprofundar a implementação existente e fechar seus riscos de integridade.
