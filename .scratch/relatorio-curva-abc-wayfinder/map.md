# Wayfinder — Curva ABC no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/estoque/relatorio-curva-abc/` um dossiê autoritativo e prompts `/speckit.specify` para ajustar a geração existente em `/cadastros/estoque/relatorios/curva-abc`, alinhando-a aos padrões atuais de `heavy-reports` e especificando a gravação persistente do Resultado da Curva ABC com paridade funcional deliberada ao Delphi. Este mapa não implementa Laravel nem Delphi.

## Notes

- Contextos envolvidos: Plataforma Laravel e legado Delphi; consultar `CONTEXT-MAP.md`, `laravel/CONTEXT.md`, ADRs relevantes e usar o vocabulário já estabelecido.
- Fontes Delphi primárias: `delphi/apps/estoque/dmrelatoriocurvaabc.pas`, `.dfm`, `fmrelatoriocurvaabc.pas` e `.dfm`.
- Baseline Laravel: `laravel/backend/app/Http/Controllers/Estoque/CurvaAbcController.php`, `CurvaAbcService`, `GerarCurvaAbcJob`, `GerarJobStore`, repositório legado, página Inertia, grid e migrations de Curva ABC.
- Padrão operacional a auditar: `heavy-reports`, `ManagedHeavyReportJob`, `OperationalExecution`, projeções/lifecycle, fila Redis, timeout, retry, cancelamento, idempotência, observabilidade e retenção vigentes no Laravel.
- Consultar `/research`, `/grilling` e `/domain-modeling` ao resolver tickets. Fatos devem ser classificados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `DECISÃO NOVA`.
- A saída final deve ser autocontida, rastreável e ordenada para `/speckit.specify`; o SpecKit deve inspecionar o checkout Laravel vigente, mas não reabrir diretamente os fontes Delphi nem implementar durante a especificação.
- Não assumir que “gravar o resultado” significa somente guardar o payload do relatório: o Delphi chama `AtualizarResultadoCurvaABC`, que altera `produtos.resultadocurvaabc` e sinaliza `veiodatriggercaracteristicas`; essa semântica será decidida com evidência e com os contratos de concorrência/auditoria atuais.


<!-- Uma linha por ticket resolvido: título completo, link e síntese. -->

## Decisions so far

- [Consolidar dossie e prompts /speckit.specify da Curva ABC](issues/07-consolidar-dossie-e-prompts-speckit.md) - publicados README, dossie e dois prompts sequenciais em modules/estoque/relatorio-curva-abc; pacote validado e pronto para executar o SpecKit, sem implementacao neste mapa.

- [Decidir o fatiamento dos prompts /speckit.specify da Curva ABC](issues/06-decidir-fatiamento-dos-prompts-speckit.md) - dois prompts sequenciais: geracao efemera na tela sobre heavy-reports e gravacao transacional/autorizada da classificacao ABC; README e dossie sao artefatos compartilhados.

- [Definir o contrato operacional da Geracao da Curva ABC em heavy-reports](issues/05-definir-contrato-operacional-heavy-reports.md) - reutiliza o pipeline heavy-reports existente, entrega resultado efemero na tela e grava separadamente; sem historico, Fotografia persistente, retencao de negocio ou saidas PDF/impressao/Excel.

- [Inventariar semantica Delphi da Curva ABC e da gravacao do resultado](issues/01-inventariar-semantica-delphi-e-gravacao.md) - F6 gera e F5 grava; a rotina legada limpa globalmente resultadocurvaabc e reaplica A/B/C, mas a formula abc_prod, a atomicidade e a gravacao segura de modos agregados continuam nao confirmadas.
- [Auditar a geracao Laravel da Curva ABC contra o padrao recente de heavy-reports](issues/02-auditar-curva-abc-contra-heavy-reports.md) - dispatcher gerenciado, checkpoints e reconciliacao ja existem; faltam contrato duravel do resultado, heartbeat SQL, retencao, idempotencia ambiental e alinhamento operacional.
- [Mapear a autoridade persistente do Resultado da Curva ABC](issues/03-mapear-autoridade-persistente-do-resultado-abc.md) - produtos.resultadocurvaabc e autoridade compartilhada e possui leitores, triggers e auditoria; nao ha endpoint Laravel nem coordenacao Delphi/Laravel para escrita.

## Not yet specified

Nenhuma névoa restante. As decisões foram fechadas e o pacote de dossiê e prompts está publicado em `modules/estoque/relatorio-curva-abc/`, pronto para executar `/speckit.specify` no checkout Laravel.

## Out of scope

- Implementar código, migration, job, endpoint, tela, teste ou alteração Delphi durante este mapa.
- Executar `/speckit.specify`; os prompts serão somente preparados para execução posterior no checkout Laravel.
- Reproduzir o FastReport do Delphi pixel a pixel ou redesenhar a infraestrutura geral de relatórios/heavy-reports fora do seam necessário para Curva ABC.
- Alterar a Consulta de Compras, Reposição ECC, classificação comercial de Produtos ou regras não alcançadas pela geração/gravação da Curva ABC.
