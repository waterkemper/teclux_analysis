# Decidir a automatização da recuperação de sync órfão

Type: grilling
Status: open
Blocked by: 03

## Question

Com a frequência e as causas dos sync states órfãos conhecidas (ticket 03), a recuperação deve passar a rodar automaticamente em agendamento (sem depender de execução manual do comando `marketplace:recover-sync`), ou o comportamento atual (recuperação sob demanda) é adequado? Se a causa raiz identificada for uma falha de confiabilidade mais profunda (timeout, configuração de fila), isso vira uma correção própria a decidir aqui também.
