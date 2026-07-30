# 11 — Exportar o Histórico Operacional completo

**What to build:** exportar exatamente o conjunto filtrado exibido pela pesquisa, processando-o em lotes e sem o limite silencioso de cem registros. O auditor recebe arquivo completo, sanitizado, criptografado, auditado e temporário.

**Blocked by:** 10 — Paginar Histórico Operacional no banco.

**Status:** ready-for-agent

- [ ] Exportação reutiliza a mesma consulta, ambiente, filtros e ordenação da pesquisa.
- [ ] Um conjunto com mais de cem registros é exportado integralmente.
- [ ] Processamento usa cursor ou lotes com consumo limitado de memória.
- [ ] Eventual limite máximo é informado e recusado antes da geração; arquivo parcial nunca é apresentado como completo.
- [ ] Arquivo contém somente campos allowlisted, é criptografado no armazenamento e expira em até vinte e quatro horas.
- [ ] Solicitação, conclusão, download, expiração e falha produzem auditoria sanitizada.
- [ ] Testes Feature comparam total e conteúdo da exportação com a pesquisa equivalente e cobrem autorização e isolamento ambiental.

