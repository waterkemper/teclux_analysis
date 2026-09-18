# Decidir arquitetura do motor e integração com ECC

Type: grilling
Status: resolved
Blocked by:

## Question

O motor estatístico deve ser um módulo novo ao lado do ECC, uma camada de modelos dentro dele ou uma arquitetura híbrida? Onde ficam preparação de dados, treinamento, features, modelos/versionamento, snapshots, inferência, auditoria e fallback?

Comparar execução em Laravel/filas/jobs, serviço Python separado e eventual cooperação com Delphi, considerando PostgreSQL legado, volume, custo, operação offline, idempotência, observabilidade e a integração final com a revalidação e geração de `pedidosfiliais`.

## Answer

- O motor estatístico será um módulo separado ao lado do ECC. Laravel continuará dono de configuração, autorização, filas, fotografia, auditoria, revisão e integração com pedidosfiliais; ECC continuará dono de revalidação, disponibilidade, concentração e alocação; Delphi permanecerá como fonte/operador legado, sem lógica estatística.
- A primeira entrega será Laravel-only. Baselines, cálculos estatísticos iniciais, backtest e fallback executarão no Laravel. Um worker Python é uma evolução opcional, condicionada a ganho comprovado nos backtests.
- O cálculo será assíncrono em filas Laravel/Horizon. Cada execução será idempotente, reprocessável e registrará status, versão do algoritmo, métricas, dados e resultado. Não haverá persistência de modelos treinados na primeira entrega.
- Cada execução terá fotografia própria, com política, filtros, posição de estoque, dados de demanda, lead time, modelo, quantis, confiança e explicação. A proposta será enviada à revisão/revalidação do ECC, que relerá fatos vivos antes de efetivar.
- O motor receberá dataset canônico montado pelo Laravel através dos repositórios existentes; não acessará diretamente PostgreSQL legado nem gravará em pedidosfiliais.
- O cliente poderá configurar modelos permitidos por política/segmento; o backtest escolherá o vencedor e será possível fixar um modelo com justificativa. Candidatos, versão e fallback serão auditáveis.
- Haverá gate de qualidade e infraestrutura: dados atrasados/incompletos, fila indisponível ou falha de cálculo não produzirão recomendação atual inválida. O sistema registrará a falha e usará ECC/revisão manual como fallback.
