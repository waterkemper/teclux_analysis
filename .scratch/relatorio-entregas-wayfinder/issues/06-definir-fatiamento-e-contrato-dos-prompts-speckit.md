# Definir fatiamento e contrato dos prompts SpecKit do Relatório de Entregas

Type: grilling
Status: resolved
Blocked by: 05

## Question

Decidir quantos prompts `/speckit.specify` serão produzidos em `modules/entregas/relatorio-entregas/`, quais responsabilidades cada um terá, quais arquivos de pesquisa/schema serão pré-requisitos, como evitar duplicação entre prompts, quais decisões devem ser autoritativas e quais gates de aceite devem atravessar todas as fatias. O contrato precisa obrigar inspeção do Laravel atual, proibir reabertura direta do Delphi, evitar N+1/SQL textual/joins incorretos e cobrir grid, relatório, acesso, menu, parâmetros, F6/F9, cancelamento e breadcrumb.


## Answer

O pacote final terá quatro prompts `/speckit.specify`, nesta ordem, dentro de `modules/entregas/relatorio-entregas/`:

1. **01-speckit-prompt-fundacao-acesso-filtros.md**
   - capability/folha sob Entregas e Montagens → Entregas → Relatório de Entregas;
   - rota, middleware, Policy, Filial efetiva, UserBranchAccessService e breadcrumb;
   - command bar base, DTO/Form Request e contrato tipado de filtros;
   - períodos, situação por radio button, clientes, fornecedores e regiões;
   - F9 com modal padrão e lookups próprios;
   - manifest de parâmetros vazio enquanto não houver evidência específica;
   - não entrega SQL de resultado, grid principal ou fotografia.

2. **02-speckit-prompt-consulta-f6-grid-cancelamento.md**
   - schema gate e snapshot versionado como pré-requisito;
   - read model, identidade da linha, SQL parametrizado, pré-agregação de quantidade entregue e cardinalidade;
   - INNER/LEFT JOIN guiados por nulabilidade e regra de domínio;
   - F6 síncrono cancelável por padrão, runner/trace/PID, Cancelar server-side e fallback heavy mensurado;
   - grid de resultado com catálogo, paginação, ordenação, preferências e allowlist;
   - nenhuma query em loop, N+1, SQL textual, driver test ou hasTable;
   - exportação apenas pelo contexto canônico, sem criar uma segunda consulta.

3. **03-speckit-prompt-fotografia-relatorio-exportacao.md**
   - Fotografia de Relatório imutável e sua integridade/hash;
   - campos, títulos, quantidade, quantidade entregue, a entregar, endereço, região, contrato, produto, datas, filial e observação;
   - equivalência de grid, preview, PDF, impressão e exportação;
   - ordenação estável, agrupamento não exposto sem nova evidência e comportamento de vazio;
   - retenção, expiração, autorização, auditoria e resposta tardia;
   - reutilização de NfeAccessKey* somente se uma referência fiscal for realmente necessária.

4. **04-speckit-prompt-aceite-desempenho-observabilidade.md**
   - matriz de requisitos, testes PostgreSQL reais, cancelamento observável, ausência de N+1 e paridade entre saídas;
   - acesso direto às rotas, Filial, capability, F9, exportação e PDF;
   - schema/checksum, SQL allowlist, ordenação, filtros, vazio, erro e retry;
   - acessibilidade, atalhos, busy/cancel, concorrência de gerações e telemetria;
   - proibição explícita de teste de driver, `Schema::has*`/`hasTable` e `AbortController` como cancelamento.

O pacote também terá `README.md` com a ordem/dependências e uma pasta `schema/` com README, snapshot JSON, funções SQL quando aplicável, data/origem/commit/escopo/hash. Cada prompt deverá referenciar os quatro artefatos de pesquisa consolidados e consultar somente o checkout Laravel para seams atuais. Nenhum prompt poderá pedir nova inspeção direta dos fontes Delphi, reabrir decisões anteriores ou duplicar responsabilidade de outro prompt.

A decisão fecha o fatiamento e o contrato de handoff; o ticket 07 fica responsável apenas por produzir e validar os arquivos.
