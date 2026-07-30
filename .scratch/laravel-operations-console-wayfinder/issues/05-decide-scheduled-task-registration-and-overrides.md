# Decide scheduled-task registration and overrides

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

How should code-defined operational tasks, predefined Administrator schedule overrides, enable/disable behavior, manual triggering, overlap locks, timezones, default restoration, and run history compose into one safe source-of-truth model?

## Comments

## Answer

Adotar um **Registro de Tarefas Operacionais** em código como catálogo e uma única rotina de tick por minuto, protegida por onOneServer e withoutOverlapping, como ponte com o Laravel Scheduler.

- Cada tarefa declara chave estável, nome/descrição pt-BR, executor não editável, programação padrão, presets permitidos, fuso padrão/permitidos, execução manual, política de sobreposição, timeout, risco e disponibilidade por ambiente.
- O Administrador nunca edita comando ou argumentos. Feature flags e bloqueios de segurança em código têm precedência e não podem ser contornados por override.
- Override persistido contém ativação, preset permitido, parâmetros tipados do preset, fuso e revisão otimista. Sem override, vale o código; **Restaurar padrão** remove o override; **Desativar** mantém override explícito.
- Presets globais: a cada 5/15/30 minutos, horária, diária, semanal e mensal; cada tarefa expõe somente o subconjunto seguro e limites mínimos definidos em código. Cron livre é proibido.
- O tick calcula ocorrências devidas, adquire lease atômico e cria Execução Operacional com chave única de tarefa + janela programada + fuso. Reinícios e múltiplas réplicas não duplicam a ocorrência.
- Alteração de programação afeta apenas ocorrências futuras. Não executa backfill automático; ocorrências perdidas ficam visíveis e exigem ação manual permitida.
- Execução manual usa o mesmo dispatcher, permissões, locks e Execução Operacional; nunca ignora sobreposição. Padrão é recusar enquanto ativa; enfileirar uma ou paralelismo só quando a tarefa declarar segurança.
- A UI pré-visualiza próximas execuções e impacto antes de salvar. Mudanças usam reautenticação, motivo, confirmação e Ação Administrativa conforme a política destrutiva.
- Histórico liga tarefa, origem agendada/manual, instante previsto, programação/revisão efetiva e Execução Operacional. O fuso e horário local pretendido são preservados; uma janela civil roda no máximo uma vez em transições de horário.
- Override cuja chave some do código vira configuração órfã, é ignorado com alerta e permanece auditável. Nova tarefa usa seu padrão até existir override.
- Migrar as definições atuais de ootstrap/app.php e outes/console.php para o Registro, preservando defaults e locks. Cada tarefa troca atomicamente de origem; nunca fica registrada nos dois caminhos.
- Teste de paridade compara o catálogo esperado, presets, disponibilidade e próximas ocorrências antes do corte. Após a migração, só o tick permanece no Laravel Scheduler.
