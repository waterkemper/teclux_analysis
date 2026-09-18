# Prompt para `/speckit.specify` — Reposição ECC: exceções, auditoria e indicadores

```text
/speckit.specify

Crie uma especificação funcional e técnica para a operação contínua da **Reposição ECC**, consumindo os prompts 12, 13 e 14 em /mnt/c/teclux_analysis/modules/estoque/consulta-compras/. Não implemente código. Defina a fila persistente de exceções, notificações, auditoria e indicadores que permitirão substituir o trabalho manual sem perder controle humano.

## Fila de exceções

Exceções são itens de negócio persistentes, distintos de alertas genéricos de infraestrutura. Cada registro deve permanecer ligado ao lote, item, Produto, Filial Requisitante, fonte candidata, motivo, fatos observados, responsável, timestamps e resolução. Nunca apagar a proposta original.

Motivos iniciais:

- configuração ausente ou inválida;
- nenhuma fonte elegível;
- estoque da fonte alterado;
- proteção de fonte concentradora;
- conflito de concentração;
- saldo insuficiente;
- duplicidade;
- aprovação de gerente;
- lote pendente;
- falha de infraestrutura.

Defina estados como aberta, em análise, resolvida, cancelada e dispensada, exigindo justificativa para resolução, cancelamento ou dispensa. A tela deve permitir filtrar por filial, rotina, idade, motivo, responsável e estado.

## Alertas e notificações

Alertas internos devem resumir backlog, falha de job e atraso de revisão, com acesso direto ao lote ou exceção. E-mail e webhook são opcionais, configuráveis por base de cliente e sem qualquer padrão global. Quando não configurados, o sistema não envia silenciosamente por canal externo.

Defina deduplicação, severidade, reconhecimento, reabertura quando nova execução reproduzir o problema e retenção dos fatos. Falha técnica não deve ser confundida com exceção de regra de negócio.

## Auditoria

Relacione ocorrência, execução, snapshot, lote, item, preparador, aprovador/gerente, edição, decisão, exceção e código de `pedidosfiliais` resultante. Registre fatos usados no cálculo e o motivo de cada rejeição ou redistribuição. A auditoria deve permitir responder quem preparou, quem autorizou, o que mudou, quando foi confirmado e qual saldo/proposta foi observado.

## Indicadores

Produza indicadores por período, rotina, Filial Requisitante, fonte e motivo:

- execuções e lotes;
- propostas geradas;
- `pedidosfiliais` confirmados;
- quantidade atendida e não atendida;
- exceções por motivo e idade;
- intervenções e edições humanas;
- aprovações de gerente;
- cancelamentos;
- cobertura, rupturas e excesso acima do máximo;
- transferências por filial e fonte.

Não criar metas padrão. Antes da ativação, registrar baseline do processo manual: volume de consultas e requisições, exceções e esforço das duas pessoas dedicadas. Metas futuras devem ser configuradas por cliente ou comparadas contra esse baseline.

## Aceite mínimo

- [ ] Exceções de negócio são persistentes e tratáveis individualmente.
- [ ] Alertas de infraestrutura e fila de exceções são conceitos separados.
- [ ] Nenhum item é apagado ao ser rejeitado, cancelado ou dispensado.
- [ ] Notificações externas só ocorrem quando configuradas por base.
- [ ] Auditoria liga proposta, decisão humana e `pedidosfiliais`.
- [ ] Indicadores distinguem cálculo, revisão, aprovação, confirmação e não atendimento.
- [ ] O baseline manual é registrado sem metas globais inventadas.
```

### Fontes obrigatórias

- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/06-definir-execucao-segura-e-auditoria.mdnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/07-definir-fila-de-excecoes-e-indicadores`/mnt/canalysis/.scratch/consulta-compras-automacao-wayfinder/map.md`;
- `doclog-new-tablesarchitecture/requisicao-filiais-nucleo.md`;
- `backend/app/Application/Operations/OperationalTaskRegistry.php`;
- contratos existentes de notificações, auditoria, execução operacional e indicadores no checkout Laravel.
