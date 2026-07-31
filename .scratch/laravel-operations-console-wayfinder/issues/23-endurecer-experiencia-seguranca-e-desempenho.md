# 23 — Endurecer experiência, segurança e desempenho

**What to build:** validar e corrigir a Console completa contra as jornadas críticas da primeira release. O Administrador consegue operar por teclado, compreender estados e confirmações, não recebe dado sensível e obtém tempos de resposta aceitáveis sob volume representativo.

**Blocked by:** 13 — Observar Filas, Processadores e Jobs; 16 — Controlar o ciclo de vida dos relatórios pesados; 18 — Administrar Programações e Execuções Manuais; 20 — Entregar Alertas Operacionais externos; 21 — Aplicar a Política de Retenção Operacional; 22 — Consultar Histórico e Auditoria da Console.

**Status:** done

- [ ] Cinco cenários representativos percorrem landing, Pendência Acionável, detalhe, ação permitida, estado terminal/reconciliação e auditoria sem usar Horizon ou banco diretamente.
- [ ] Navegação por teclado, foco, nomes semânticos, contraste, indicadores não dependentes de cor e diálogos destrutivos atendem WCAG 2.1 AA.
- [ ] Layouts suportados cobrem estados vazio, carregando, desatualizado, parcial, erro, conflito e responsive sem perder ambiente ou ação principal.
- [ ] Fixtures hostis provam ausência de credenciais, tokens, dados pessoais, headers, models, paths e traces em HTML, JSON, busca, logs da Console, métricas, alertas, webhook, export e auditoria.
- [ ] Usuário não administrador e identificador de outro ambiente são recusados por toda página, consulta, export e comando.
- [ ] Sob volume representativo de retenção e filas, landing e listas primárias atingem p95 de até dois segundos.
- [ ] Aceitação de Comando Administrativo Operacional atinge p95 de até um segundo, mantendo execução assíncrona e informação de frescor honesta.
- [ ] Testes de concorrência e fault injection não produzem efeito duplicado, perda de evidência, retry ilimitado ou sucesso presumido.
- [ ] Qualquer bloqueador crítico de segurança, dados, auditoria, acessibilidade, desempenho ou divergência permanece release-blocking e documentado.
- [ ] Build frontend e suítes relevantes executam sem a dependência ausente previamente observada no protótipo.
