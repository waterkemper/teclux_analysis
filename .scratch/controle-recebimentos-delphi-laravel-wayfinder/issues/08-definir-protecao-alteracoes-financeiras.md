# Definir proteção das alterações financeiras não determinada pelo Delphi

Type: grilling
Status: open
Blocked by: 06

## Question

O Delphi comprova as alterações permitidas, efeitos e uma gravação agrupada, mas
não define uma estratégia formal de concorrência, idempotência, auditoria
imutável, conflito entre Delphi/Laravel ou matriz de capability por operação.
Qual é o contrato Laravel mínimo para confirmar, estornar e alterar tipo sem
ampliar as permissões observadas, preservando atomicidade e reconciliação? A
decisão deve distinguir comportamento confirmado, proteção nova obrigatória e
lacuna que deve bloquear a operação, sem atribuir ao Delphi uma regra que ele
não possui.
