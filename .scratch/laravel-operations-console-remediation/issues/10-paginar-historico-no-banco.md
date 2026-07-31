# 10 — Paginar Histórico Operacional no banco

**What to build:** consultar o Histórico Operacional por uma projeção comum executada no banco, com filtros, contagem, ordenação e paginação estáveis. O Administrador navega por grandes volumes sem carregar todas as fontes em memória nem observar lacunas entre páginas.

**Blocked by:** 02 — Migrar consultas para controladores por recurso; 05 — Isolar toda a retenção por ambiente; 09 — Versionar Programações Operacionais.

**Status:** ready-for-agent

- [ ] As fontes existentes são normalizadas em uma projeção SQL comum sem criar uma cópia durável divergente.
- [ ] Ambiente, período, ator, tipo, alvo e resultado são filtrados pelo banco.
- [ ] Contagem e resultados derivam da mesma consulta e do mesmo conjunto de filtros.
- [ ] Ordenação possui desempate determinístico e paginação não repete nem omite eventos.
- [ ] Eventos de versões de Programações Operacionais aparecem com vigência, ator e motivo sanitizados.
- [ ] Nenhum payload bruto, segredo ou dado fora da allowlist é projetado.
- [ ] Testes Feature com múltiplas fontes, dois ambientes e volume representativo validam filtros, contagem e páginas sucessivas.

