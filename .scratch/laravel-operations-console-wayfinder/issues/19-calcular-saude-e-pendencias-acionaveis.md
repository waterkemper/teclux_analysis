# 19 — Calcular Saúde Operacional e apresentar Pendências Acionáveis

**What to build:** transformar telemetria de Filas, Processadores, Execuções e Tarefas em Saúde Operacional temporal e uma caixa de Pendências Acionáveis na landing. O Administrador entende severidade, causa, duração e recurso afetado sem confundir falta de dados, saturação normal ou flapping com incidente.

**Blocked by:** 13 — Observar Filas, Processadores e Jobs; 15 — Gerenciar Execuções Operacionais de relatórios pesados; 17 — Registrar todas as Tarefas Operacionais.

**Status:** done

- [ ] Filas usam idade do pendente mais antigo como sinal primário e profundidade, crescimento, throughput, saturação e falhas como contexto.
- [ ] Defaults de `default/marketplace-sync` são Atenção em 2 minutos e Crítica em 10; `heavy-reports`, 15 e 45 minutos.
- [ ] Grupo de Processadores degrada após dois heartbeats ausentes e fica crítico após dois minutos sem consumidor esperado ou crash loop.
- [ ] Tick do scheduler degrada após dois minutos e fica crítico após cinco; cada tarefa respeita tolerância e risco declarados.
- [ ] Falhas usam janela, volume mínimo e percentual por família; Verificação necessária alerta imediatamente conforme risco.
- [ ] Estado Desconhecido é produzido por telemetria ausente e compõe a saúde geral sem ser tratado como Saudável.
- [ ] Histerese exige amostras consecutivas e recuperação sustentada abaixo do limite inferior por cinco minutos.
- [ ] A landing prioriza Pendências Acionáveis, permite abrir o detalhe sanitizado e mantém topologia como diagnóstico secundário.
- [ ] Thresholds administrativos permanecem dentro dos limites seguros do código e usam preview, revisão e Ação Administrativa.
- [ ] Testes determinísticos cobrem thresholds, composição, ausência de dados, flapping, recuperação e alteração permitida/recusada.
