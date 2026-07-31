# 08 — Agregar dados operacionais antes de expurgar

**What to build:** produzir Resumos Operacionais agregados em janelas fechadas antes que detalhes sejam elegíveis ao expurgo. Operadores preservam tendências de cinco minutos, hora e dia sem conservar payloads, identificadores pessoais ou dados de negócio.

**Blocked by:** 05 — Isolar toda a retenção por ambiente.

**Status:** ready-for-agent

- [ ] Janelas de cinco minutos são mantidas por trinta dias, horárias por noventa dias e diárias por treze meses.
- [ ] A granularidade seguinte é produzida e evidenciada antes da remoção da anterior.
- [ ] Identidade por ambiente, classe, granularidade, janela e versão da política torna geração e retentativa idempotentes.
- [ ] Concorrência não duplica contagens nem cria lacunas.
- [ ] Campos agregados seguem allowlist e excluem payload, exceção bruta, dados pessoais e identificadores de negócio.
- [ ] Expurgo não remove uma faixa detalhada sem evidência de agregação concluída ou Preservação Operacional considerada.
- [ ] Testes com relógio determinístico cobrem fronteiras temporais, promoção, isolamento ambiental, idempotência e sanitização.

