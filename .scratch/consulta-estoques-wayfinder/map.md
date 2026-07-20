# Levantamento da Consulta de Estoques para migração Delphi–Laravel

Label: wayfinder:map

## Destination

Produzir um dossiê único, detalhado, baseado em evidências e pronto para `$to-spec` sobre **Estoques → Consultas**, documentando a paridade funcional do Delphi e confrontando-a com o estado atual do Laravel, com referências precisas aos arquivos e linhas de código.

## Notes

- O núcleo Delphi é `delphi/apps/estoque/dmconsultaestoque.pas/.dfm` e `delphi/apps/estoque/fmconsultaestoque.pas/.dfm`; incluir ancestrais, frames, units, datasets e rotinas compartilhadas somente quando forem necessários para explicar o comportamento observado.
- Inventariar abas, controles, filtros, defaults, validações, atalhos, estados visuais, resultados, operações, integrações, queries, SQL dinâmico, macros, parâmetros, configurações, Permissões e Autorizações.
- O Delphi é a referência para paridade funcional. Comportamentos estranhos, limitações e possíveis bugs devem ser preservados no levantamento como evidência, não silenciosamente corrigidos.
- Melhorias possíveis devem ficar em seção separada e nunca ser confundidas com comportamento obrigatório.
- Confrontar cada capacidade com o Laravel atual, procurando primeiro componentes, filtros, lookups, serviços, padrões de consulta, permissões e cadastros reutilizáveis.
- Cadastros e lookups externos existentes no Laravel são dependências reutilizáveis, não objetos de nova especificação. Registrar seu contrato, parâmetros e lacunas.
- Operações externas iniciadas pela Consulta de Estoques devem ser descritas até o limite da integração; não expandir o levantamento para migrar internamente os módulos chamados.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`, sempre com evidência.
- Usar o vocabulário do `CONTEXT.md`, em especial Filial, Usuário, Operador, Parâmetro do Sistema, Permissão, Autorização, Produto, Movimento e Saldo de Estoque.
- O artefato consolidado deve ser adequado como entrada direta de `$to-spec`; este mapa não implementa a migração nem gera ainda a especificação.

## Decisions so far

- [Inventariar interface, abas e filtros Delphi](issues/01-inventariar-interface-delphi.md) — A tela combina seleção múltipla obrigatória, Filial e flags com sete perspectivas de Produto e oito perspectivas internas; visibilidade, foco, validações, atalhos e estados condicionais foram documentados com evidência.
- [Inventariar datasets, queries e regras de cálculo Delphi](issues/02-inventariar-dados-queries-delphi.md) — Foram mapeados consulta mestre com registro estatístico, macros, campos derivados, perspectivas de Similares/Lotes/Componentes/Grade, datasets sob demanda, cálculos, escritas e riscos legados.

- [Inventariar Permissões, Autorizações e configurações Delphi](issues/03-inventariar-permissoes-parametros-configuracoes.md) — Confirmado `GerenteEstoque` como único gate local, inventariados Parâmetros do Sistema/Filial/ambiente e registrados riscos de proteção apenas visual, ausência de autorização contextual e de escopo de Filial por Usuário na tela.

- [Inventariar resultados, operações e integrações Delphi](issues/04-inventariar-resultados-operacoes-integracoes.md) — Consolidada a semântica dos resultados, cores e totais, as quatro integrações externas, as escritas locais e seus riscos; impressão/exportação não possuem operação comprovada na tela.

- [Mapear componentes e capacidades existentes no Laravel](issues/05-mapear-capacidades-laravel-existentes.md) — Análise de Estoques fornece shell, filtros, compiladores, Filiais, jobs, grid e exportação reutilizáveis; cadastros de Produto cobrem grande parte das dependências, mas a Consulta master-detail, histórico fiscal e proteção financeira são lacunas, e Filial vazia hoje remove o filtro SQL.

- [Construir matriz de paridade, reuso e lacunas](issues/06-construir-matriz-paridade-reuso-lacunas.md) — Fixada página própria com master-detail e abilities server-side, reutilizando a infraestrutura de Análise e cadastros; matriz classifica filtros, abas, queries, parâmetros, integrações, oito lacunas reais e nove bugs legados que exigem decisão explícita.

- [Consolidar dossiê da Consulta de Estoques para to-spec](issues/07-consolidar-dossie-to-spec.md) — Dossiê único pronto para `$to-spec` consolida escopo, master-detail, filtros, abas, cálculos, Permissões, parâmetros, reuso Laravel, lacunas, bugs, oportunidades, contratos e decisões pendentes.

## Not yet specified

Nenhuma névoa pendente para a especificação. Dependências internas só serão aprofundadas na implementação se os contratos observados não puderem ser atendidos pelos ativos existentes.

## Out of scope

- Implementar a Consulta de Estoques no Laravel.
- Gerar agora os prompts ou a especificação Spec Kit; isso será feito depois via `$to-spec`.
- Migrar internamente cadastros, relatórios ou outros módulos externos acionados pela consulta.
- Alterar o Delphi ou corrigir possíveis bugs legados.
- Copiar literalmente o layout visual Delphi quando o Laravel já possuir um padrão equivalente.
