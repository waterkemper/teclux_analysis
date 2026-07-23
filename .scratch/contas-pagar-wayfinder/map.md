# Paridade de Contas a Pagar Delphi–Laravel

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/`, um dossiê de paridade baseado em evidências e um prompt Spec Kit autocontido para o Cursor, confrontando integralmente o comportamento alcançável de `dmcontaspagar`/`fmcontaspagar` no Delphi com o Laravel atual e definindo os ajustes necessários sem exigir nova investigação do legado.

## Notes

- O núcleo legado está em `delphi/apps/contaspagar/dmcontaspagar.pas/.dfm` e `fmcontaspagar.pas/.dfm`; seguir units, consultas, rotinas e telas auxiliares até compreender os fluxos alcançáveis, sem transformar dependências externas em migrações integrais.
- Paridade funcional com o Delphi é o baseline. Divergências intencionais, melhorias e possíveis bugs legados devem ser classificados e justificados, nunca absorvidos ou corrigidos silenciosamente.
- Antes de propor qualquer requisito, confrontar a evidência Delphi com a estrutura Laravel existente. Classificar cada capacidade como reuso direto, reuso com extensão, divergência, lacuna ou comportamento legado não desejável.
- Reutilizar por padrão componentes, filtros, lookups, Filial, serviços, repositories, auditoria, testes e padrões de UI/autorização já implementados no Laravel; duplicação exige justificativa explícita.
- Preservar a semântica de Permissões e Autorizações, mas aplicar proteção server-side conforme o padrão Laravel, incluindo Policies/abilities, escopo de Filial e consistência entre backend e UI.
- Para Parâmetros do Sistema, rastrear `constante Delphi → texto canônico em delphi/biblio/clparametrossistema.pas → chamadas/efeitos → parametros_valor('texto canônico') no Laravel`. O texto canônico, não o identificador Pascal, é a identidade persistida.
- A matriz de parâmetros deve registrar chave textual, origem, valor/default observado, precedência, efeito, pontos de uso e comportamento diante de ausência ou valor inválido.
- A UI Laravel preserva capacidades, estados, validações, atalhos relevantes e feedback, seguindo os padrões visuais atuais do ERP em vez de copiar literalmente o DFM.
- Ajustes em ativos compartilhados são permitidos quando necessários, com impacto mapeado, extensão compatível e testes de regressão.
- Usar evidências precisas de arquivos e linhas e classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Este mapa planeja e resolve decisões; não implementa os ajustes Laravel.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Inventariar interface, estados e fluxos Delphi de Contas a Pagar](issues/01-inventariar-interface-fluxos-delphi.md) — confirmou Documento mestre com Duplicatas/pagamentos, Adiantamento, Contabilidade, impostos, PIS/COFINS, impressão e logs; Reinf 2010/2040 está desativado e não integra a paridade obrigatória.
- [Inventariar dados, regras e integrações Delphi de Contas a Pagar](issues/02-inventariar-dados-regras-integracoes-delphi.md) — fixou Documento+Duplicatas como agregado transacional ligado a impostos, Contabilidade e movimentos bancários, com motor compartilhado por tela, lote, cancelamento e retorno e riscos explícitos de concorrência/idempotência.
- [Inventariar Permissões, Autorizações e Parâmetros Delphi de Contas a Pagar](issues/03-inventariar-autorizacoes-parametros-delphi.md) — separou acesso, capabilities permanentes, autorização sensível e gates contextuais; fixou nove textos canônicos de parâmetros e exigiu escopo server-side de Filial, evidência de autorizador e substituição de login mágico.
- [Inventariar o Laravel atual e os ativos reutilizáveis para Contas a Pagar](issues/04-inventariar-laravel-e-reusos.md) — revisão sobre a árvore atual confirmou Documento/Duplicatas, Adiantamento, datas, impostos e testes já implementados; priorizou corrigir autorização/Filial/integridade e completar pagamento transacional, Contabilidade, PIS/COFINS, bancos, logs, impressão, lote e retorno.
- [Construir a matriz de paridade, reuso e ajustes de Contas a Pagar](issues/05-construir-matriz-paridade-ajustes.md) — fixou extensão do cadastro atual em fases P0–P6, separou rascunho de comandos financeiros idempotentes e ordenou segurança/Filial/integridade antes de pagamento, bancos, Contabilidade, impostos e integrações.
- [Consolidar o dossiê e o prompt Spec Kit de Contas a Pagar](issues/06-consolidar-dossie-prompt-speckit.md) — publicou o dossiê autoritativo e um prompt `/speckit.specify` autocontido em `modules/financeiro/contas-pagar/`, com fases, reusos, contratos, segurança, parâmetros, testes, aceite e exclusões.

## Not yet specified

- Nenhum; o destino deste mapa foi alcançado.

## Out of scope

- Implementar os ajustes no Laravel durante este Wayfinder.
- Alterar o Delphi.
- Copiar vulnerabilidades de autorização, SQL inseguro ou proteções exclusivamente visuais do legado.
- Migrar integralmente módulos auxiliares chamados por Contas a Pagar; documentar somente o contrato e o limite de integração necessários.
- Duplicar componentes Laravel existentes sem demonstrar incompatibilidade de contrato.
