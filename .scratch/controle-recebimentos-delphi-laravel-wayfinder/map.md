# Controle de Recebimentos — Delphi para Laravel

Label: wayfinder:map

## Destination

Produzir um dossiê de evidências e os prompts `/speckit.specify` necessários em `modules/caixa/controle-recebimentos/` para especificar a migração funcional do módulo Delphi **Caixa → Controle de Recebimentos** para o Laravel, sem implementar o módulo neste esforço.

Os prompts devem ser autocontidos, citar os artefatos de pesquisa versionados e instruir a inspeção do Laravel atual e dos prompts já gerados, sem pedir a reabertura direta dos fontes Delphi.

## Notes

- Fontes Delphi autorizadas para a pesquisa: `C:/projetos.vcl/apps/caixa/dmcontrolerecebimentos.pas`, `.dfm`, `fmcontrolerecebimentos.pas` e `.dfm`; o caminho inicialmente informado tinha o typo `prjetos.vcl`.
- Consultar também a unit compartilhada `clparamtrossistema.pas` e todas as units ancestrais/referenciadas necessárias para entender parâmetros, autorizações, datasets, relatórios e operações.
- O inventário deve classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE` ou `POSSÍVEL BUG LEGADO`, sempre com arquivo, linha, controle, campo, SQL ou outro vestígio.
- Os prompts devem cobrir: filtros; SQLs; parâmetros via `parametros_valor('', '')`; grids com catálogo, ordenação, personalização e exportação; edição e comportamento de colunas; operações, ícones e atalhos; F6 com Cancelar e cancelamento PostgreSQL real; F9 pelo modal padrão de pesquisa; relatórios com F6 e leiaute de grid equivalente; schema versionado; autorização, senha e `acessosmodulos`; menu Caixa; máscara de chave NF-e; breadcrumb; radio buttons; e padrões de cadastro quando houver cadastro.
- Regras obrigatórias: evitar N+1 com consultas set-based e `IN`/`= ANY(array)`/`unnest` quando aplicável; usar `INNER JOIN` quando a relação/colunas obrigatórias forem `NOT NULL`; deixar `LEFT JOIN` apenas para relações opcionais comprovadas; não testar driver; não testar `hasTable`/`Schema::has*`; não pedir para verificar os fontes Delphi diretamente no prompt final.
- Skills a consultar quando cada decisão for trabalhada: `research`, `grilling`, `domain-modeling` e, na consolidação, os padrões de `to-spec`/`implement` apenas como referência de handoff. Wayfinder permanece planejamento: não implementar código.

## Decisions so far

<!-- Preenchido somente quando tickets forem resolvidos. -->

- [Auditar padrões Laravel e prompts já gerados](issues/04-auditar-padroes-laravel-e-prompts-existentes.md) — confirmou os seams de grid, exportação, F6 cancelável, F9, máscara NF-e, relatórios, parâmetros, autorização e menu, com divergências proibidas registradas.

- [Capturar snapshot autoritativo do schema envolvido](issues/05-capturar-schema-autoritativo.md) — capturou JSON/manifesto datados do PostgreSQL autoritativo, com hash conferido, cobertura completa das relações/funções requeridas e regras de uso sem introspecção runtime.

- [Definir domínio e contrato Laravel do Controle de Recebimentos](issues/06-definir-dominio-e-contrato-laravel.md) — fixou Consulta Operacional sem CRUD, somente alterações Delphi (alterar tipo, confirmar e estornar), identidade, editabilidade e separação entre evidência e requisitos novos do Laravel.

- [Consolidar dossiê e prompts SpecKit do módulo](issues/07-consolidar-prompts-speckit.md) — consolidou README, dossiê final e três prompts mínimos com rastreabilidade completa, sem executar specify ou implementar o módulo.

- [Auditar implementação Laravel e gerar prompts corretivos](issues/09-auditar-implementacao-e-gerar-prompts-corretivos.md) — auditou a rota existente, comparou UI/grid e efeitos de gravação com os artefatos Delphi, e criou os prompts corretivos 04–06.

- [Inventariar autorizações, senha e menu do Controle de Recebimentos](issues/03-inventariar-autorizacoes-senha-e-menu.md) — separou autorização sensível de Analista de Crédito, escopo de Filial, parâmetro bancário e acesso de menu/acessosmodulos; confirmou o padrão Laravel de grants e prova contextual.

- [Extrair SQLs, parâmetros e dados do Delphi](issues/02-extrair-sqls-parametros-e-dados-delphi.md) — catalogou a consulta principal, datasets auxiliares, macros, gravação, parâmetro de integração bancária e objetos candidatos ao snapshot de schema.

- [Inventariar interface e fluxo Delphi do Controle de Recebimentos](issues/01-inventariar-interface-e-fluxo-delphi.md) — confirmou abas, filtros, operações, F5/F6/F9, grid/editabilidade, autorizações e lacunas de relatório/cancelamento/schema/menu.

- [Reauditar read model e efeitos financeiros em lote](issues/10-reauditar-read-model-e-lote-financeiro.md) — confirmou os itens 04–06 já incorporados e criou o Prompt 07 para as lacunas restantes.

- [Auditar Contas a Pagar e Movimentos Bancários](issues/11-auditar-contas-pagar-e-movtos-bancos.md) — identificou divergências de valor líquido, datas, vínculos, transição de data bancária e N+1; criou o Prompt 08.

## Not yet specified

<!-- O restante está representado pelos tickets abertos. -->

- A identidade do módulo-fonte desta nova solicitação ainda precisa ser reconciliada: o texto cita `apps/estoque/dmcadastroinventario.*` e `fmcadastroinventario.*`, mas o destino/menu e os artefatos existentes são `Caixa → Controle de Recebimentos`, baseado em `apps/caixa/dmcontrolerecebimentos.*` e `fmcontrolerecebimentos.*`.
## Out of scope

- Implementar o módulo, migrations, componentes React, endpoints, policies, SQL de produção ou alterações no Delphi.
- Executar `/speckit.specify` neste esforço; produzir apenas prompts e dossiês para posterior execução.
- Reproduzir concatenação SQL, N+1, teste condicional de driver, `hasTable`/`Schema::has*` ou introspecção de schema em runtime.
- Pedir que o agente futuro reabra os arquivos Delphi; as evidências devem ser capturadas em artefatos de pesquisa dentro de `modules/caixa/controle-recebimentos/`.

- [Reconciliar fonte de Inventário e destino Controle de Recebimentos](issues/16-reconciliar-fonte-inventario-e-destino-controle-recebimentos.md) — a nova solicitação foi confirmada como Cadastro de Inventário e será conduzida no mapa próprio; este mapa continua restrito a Controle de Recebimentos.

- [Fechar paridade financeira residual](issues/12-fechar-paridade-financeira-residual.md) — a reauditoria após o Prompt 08 encontrou aplicação parcial; o Prompt 09 restringe o próximo trabalho aos campos exatos de Contas a Pagar e à troca de identidade bancária.
- [Corrigir evento destino bancário](issues/13-corrigir-evento-destino-bancario.md) — a implementação do Prompt 09 ainda sobrescreve evento destino; o Prompt 10 exige nova sequência ou recusa segura.
- [Fechar aceite do Prompt 10](issues/14-fechar-aceite-prompt10.md) — o comando já recusa atomicamente sem alocador bancário; o Prompt 11 fecha testes sem driver, orçamento set-based e snapshot financeiro integral.

- [Reauditar implementação do Prompt 11 e data global de confirmação](issues/15-reauditar-implementacao-prompt11-e-data-global.md) — a implementação do Prompt 11 fechou parte da recusa, mas contaminou a fatia com alterações de produção, manteve introspecção em helpers tocados e não propaga a data do rodapé alterada depois da seleção; criado o Prompt 12.
- Retificação do ticket 15 — escopo reduzido por orientação do usuário: somente N+1 da fotografia/aceite e data global do rodapé no F5; demais alterações são intencionais.
