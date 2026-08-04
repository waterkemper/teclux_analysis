# Auditar padrões Laravel reutilizáveis para a Confirmação por Romaneios

Type: research
Status: resolved
Blocked by:

## Answer

A auditoria foi consolidada em [pesquisa-padroes-laravel-reutilizaveis.md](../../../modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md). Os caminhos concretos do checkout foram verificados; um `README.md` opcional de Confirmação por Notas não existe, portanto a evidência foi mantida nos componentes, serviços, páginas, migrations, specs e testes existentes.

- Reutilizar `AppLayout`, `ErpConsultaOperationBar`, `ErpCadastroLookupModal` quando F9 for oferecido, `ErpPreferenceDataGrid`/`ErpGridShell`, `GridExportOrchestrator`, `ParameterService`, `BranchContextService`, `UserBranchAccessService`, `NfeAccessKey` e os serviços de autorização sensível. Não criar shell, grid, modal ou máscara NF-e paralelos.
- Criar catálogos de grid próprios, `screenKey` próprio, exportação server-side autorizada e endpoint de lookup F9 com paginação/ordenação allowlist. A tela Delphi é consulta/operação, não cadastro; não aplicar automaticamente o padrão de chave primária/situação.
- Usar os atalhos Delphi comprovados apenas se não colidirem: Gerar/F6, Confirmar/F5, Ctrl+Espaço e Enter para localizar. O botão Cancelar deve aparecer antes do primeiro `await`.
- O precedente de Confirmação por Notas tem cancelamento apenas visual: falta URL/rota `cancelar-gerar`. O novo fluxo deve usar `useErpGerarRequest` com endpoint próprio, `X-Trace-Id`, `PgsqlGerarQueryRunner`, registro de PID e `pg_cancel_backend()` com ownership por usuário/trace.
- Reaplicar escopo de Filial e autorização no backend para consultas, lookup, exportação, conferência e comandos; não confiar em filtros, linhas, SQL, IDs ou Filial enviados pela UI. Consultas e confirmação devem ser set-based, sem N+1.
- O componente compartilhado `NfeAccessKey` é a autoridade atual, corrigindo a evidência antiga que dizia não existir máscara NF-e. Não foi localizado relatório específico; a decisão de relatórios e o comando transacional permanecem para tickets posteriores.

Nenhuma implementação, migration aplicada, teste de driver ou `hashtablefs` foi executado.

## Question

Quais contratos atuais do Laravel devem ser reutilizados para shell, breadcrumb, modal F9, command bar, ícones/atalhos, grids com exportação/ordenação/personalização, chave NF-e, parâmetros, filial, autorização, relatórios e geração F6 cancelável com `pg_cancel_backend()`? Quais lacunas específicas deste módulo exigem novos contratos?

Inspecionar o checkout Laravel e os prompts já gerados para Cadastro de Romaneios e Confirmação por Notas. Registrar arquivos concretos, classificação da evidência e incompatibilidades. Não propor testes de driver ou `hashtablefs`.
