# Auditar o pós-status: emissão fiscal, estoque e impressão da Transferência

Type: research
Status: resolved
Blocked by:

## Question

Depois de o status de serviço do SEFAZ funcionar e os certificados estarem cadastrados, o que o Laravel atual já executa na emissão de Transferência e o que ainda diverge do Delphi para estoque, movimentos, vínculo dos pedidos, DANFE, etiquetas e DANFE simplificada?

## Answer

Auditoria registrada em [18-auditoria-pos-status-emissao-estoque-impressao.md](../research/18-auditoria-pos-status-emissao-estoque-impressao.md).

- A plataforma fiscal comum já aloca a emissão, número, fotografia, outbox, autorização e artefatos `nfeProc`/DANFE padrão.
- A confirmação operacional Laravel já movimenta estoque (`SPT`/`SET`, com `TPE`/`TFR` quando aplicável) e fecha pedidos; a ponte fiscal não pode repetir esses efeitos.
- A ponte fiscal ainda aplica apenas `satisfacao_transferencia` após autorização e não fecha o contrato de projeção em `dadosfiscais`/`notas`/`pedidosfiliais`.
- Não há contrato implementado para etiquetas ou DANFE simplificada; `tp_imp=1`/DANFE retrato não deve ser tratado automaticamente como “simplificada”.

Próximas decisões: coreografia estoque–emissão e projeção legada; contrato Delphi/Laravel de DANFE, DANFE simplificada e etiquetas; depois consolidação da spec complementar.
