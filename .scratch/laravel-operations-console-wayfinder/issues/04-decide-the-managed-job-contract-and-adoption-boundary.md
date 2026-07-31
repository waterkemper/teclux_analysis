# Decide the managed-job contract and adoption boundary

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

What contract must a job adopt to support durable identity, sanitized inspection, progress, cancellation, and safe deletion, and how should unmanaged existing jobs degrade while job families migrate incrementally?

## Comments

## Answer

Adotar contrato por composição, sem classe-base: um serviço de despacho cria a **Execução Operacional** antes do job e middleware compartilhado registra cada **Tentativa de Execução** e sua correlação Laravel/Horizon.

- Níveis cumulativos: **Observado**, **Gerenciado**, **Controlável** e **Reconciliável**. A UI deriva ações do nível declarado e do estado atual; testes de conformidade validam cada promoção.
- O Resumo Operacional é projeção versionada e sanitizada no momento da escrita. Aceita apenas campos tipados e permitidos; nunca relê payload, modelos serializados, segredos, paths ou traces.
- Progresso registra etapa em pt-BR, percentual opcional e monotônico por tentativa, contagens opcionais, heartbeat e nota limitada. Sem cálculo honesto, exibe **Indeterminado**.
- Exclusão pendente exige identidade durável e remoção atômica antes da reserva. Após reserva, só jobs Controláveis aceitam pedido cooperativo; recusas por corrida também são auditadas.
- Suspensão exige cursor persistido e retomada idempotente; encerra a tentativa atual e a retomada cria outra. Cancelamento é terminal, sem rollback genérico. Cada família declara checkpoints e tempo máximo de resposta.
- Falhas inesperadas são sanitizadas pelo middleware e relançadas ao Laravel. Resultados esperados são tipados. Elegibilidade de retentativa é declarada pela família, nunca inferida do texto da exceção.
- A Execução nasce duravelmente com chave de idempotência; despacho ocorre após commit. Falha ao publicar mantém **Aguardando despacho** para reconciliação, sem duplicar a intenção.
- Despacho gerenciado fora do serviço oficial falha em desenvolvimento e testes. Testes de contrato cobrem identidade, transições, sanitização, heartbeat, controles e ambiguidade.
- Migração: relatórios ERP pesados primeiro; Marketplace como Gerenciado antes de promoções seletivas a Reconciliável; Busca Assistida depois, com agregação para evitar milhares de decisões individuais.
- Demais jobs continuam **Não gerenciados**, visíveis apenas como Jobs Observados e sem ações que dependam de garantias ausentes.
