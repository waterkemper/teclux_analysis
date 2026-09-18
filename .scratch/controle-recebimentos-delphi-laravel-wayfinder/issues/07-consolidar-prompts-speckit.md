# Consolidar dossiê e prompts SpecKit do módulo

Type: task
Status: resolved
Blocked by: 06

## Answer

Dossiê final e prompts `/speckit.specify` consolidados em `modules/caixa/controle-recebimentos/`.

- [`README.md`](../../../modules/caixa/controle-recebimentos/README.md) — navegação, ordem de execução, autoridades, escopo, rastreabilidade e guardrails.
- [`dossie-final.md`](../../../modules/caixa/controle-recebimentos/dossie-final.md) — síntese de evidências, limites, lacunas e handoff.
- [`01-speckit-prompt-fundacao-consulta-filtros-acesso.md`](../../../modules/caixa/controle-recebimentos/01-speckit-prompt-fundacao-consulta-filtros-acesso.md) — consulta, filtros, SQL, schema, Filial, F9, menu, parâmetros, breadcrumb, rádio e F6.
- [`02-speckit-prompt-grid-operacoes-f5-autorizacao.md`](../../../modules/caixa/controle-recebimentos/02-speckit-prompt-grid-operacoes-f5-autorizacao.md) — grid, catálogo, preferências, editabilidade, operações Delphi, F5, efeitos, capability e senha.
- [`03-speckit-prompt-relatorio-f6-cancelamento-aceite.md`](../../../modules/caixa/controle-recebimentos/03-speckit-prompt-relatorio-f6-cancelamento-aceite.md) — relatório, mesmo read model/leiaute do grid, F6/Cancelar, exportação, checksum e aceite.

O fatiamento em três prompts é o mínimo que separa fundação/consulta, alterações/grid e relatório/aceite sem duplicar contratos. Todos citam o schema datado, os dossiês e o checkout Laravel; instruem projeção explícita, binds, `IN`/`ANY(array)`/`unnest`, joins pela nulabilidade, ausência de N+1, F6 cancelável com `pg_cancel_backend`, F9 padrão, `acessosmodulos`, grid padrão, parâmetro, autorização, máscara NF-e e as regras de não usar driver/`hasTable`/`Schema::has*`/introspecção runtime.

Nenhum prompt foi executado e nenhum código do módulo foi implementado. O ticket 08 continua aberto para decidir proteção formal de concorrência, idempotência, auditoria e conflitos que não são determinados pelo Delphi.
## Question

Com base nas decisões fechadas e nos artefatos de pesquisa, produzir em `modules/caixa/controle-recebimentos/` o dossiê final, README de navegação e a quantidade mínima de prompts `/speckit.specify` necessários. Cada prompt deve ser autocontido e instruir: consultar o Laravel atual e os artefatos já gerados; não pedir inspeção direta dos fontes Delphi; não implementar durante specify; cobrir os contratos e guardrails; citar o snapshot de schema; evitar N+1 com `IN`/`ANY(array)`/`unnest`; escolher joins pela nulabilidade; não testar driver/`hasTable`; e preservar paridade funcional observável.

Validar rastreabilidade entre cada requisito do mapa e um prompt, incluindo filtros, SQL, parâmetros, autorizações/menu, grids/exportação/personalização, edição, operações/atalhos/ícones, F6 cancelável, relatórios, F9, máscara NF-e, breadcrumb, radio buttons, cadastro quando aplicável, testes e critérios de aceite. Não implementar nem executar os prompts.
