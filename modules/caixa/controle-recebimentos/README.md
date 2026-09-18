# Controle de Recebimentos — pacote SpecKit

Este diretório contém o dossiê de evidências, a auditoria da implementação existente e os prompts `/speckit.specify` para especificar/corrigir a migração da tela Delphi **Caixa → Controle de Recebimentos** para o Laravel. A rota implementada é `/caixa/controle-recebimentos`.

## Ordem de execução

1. [`01-speckit-prompt-fundacao-consulta-filtros-acesso.md`](01-speckit-prompt-fundacao-consulta-filtros-acesso.md) — escopo, consulta, filtros, SQL, schema, Filial, F9, menu, parâmetros, breadcrumb e rádio.
2. [`02-speckit-prompt-grid-operacoes-f5-autorizacao.md`](02-speckit-prompt-grid-operacoes-f5-autorizacao.md) — Catálogo de Grid, editabilidade, três alterações Delphi, F5, efeitos, autorização, senha e proteção.
3. [`03-speckit-prompt-relatorio-f6-cancelamento-aceite.md`](03-speckit-prompt-relatorio-f6-cancelamento-aceite.md) — relatório, mesmo read model/leiaute do grid, F6/Cancelar, exportação, schema gate e aceite.
4. [`auditoria-implementacao-laravel-vs-delphi.md`](auditoria-implementacao-laravel-vs-delphi.md) — divergências comprovadas na implementação atual.
5. [`04-speckit-prompt-correcao-ui-grid-comportamento.md`](04-speckit-prompt-correcao-ui-grid-comportamento.md) — correção de defaults, títulos, editabilidade, seleção e comandos.
6. [`05-speckit-prompt-correcao-gravacao-efeitos-financeiros.md`](05-speckit-prompt-correcao-gravacao-efeitos-financeiros.md) — equivalência de alterar tipo, confirmar, estornar e efeitos financeiros.
7. [`06-speckit-prompt-aceite-integrado-f6-relatorio.md`](06-speckit-prompt-aceite-integrado-f6-relatorio.md) — aceite integrado, F6 canônico, relatório e cancelamento.

8. [`07-speckit-prompt-correcao-read-model-e-lote-financeiro.md`](07-speckit-prompt-correcao-read-model-e-lote-financeiro.md) — read model, critérios de efeitos e processamento financeiro em lote.

9. [`08-speckit-prompt-paridade-contas-pagar-movtos-bancos.md`](08-speckit-prompt-paridade-contas-pagar-movtos-bancos.md) — paridade financeira com Contas a Pagar e Movimentos Bancários.

Cada prompt é autocontido e deve consultar o checkout Laravel atual e os
artefatos deste diretório. A saída de um prompt é entrada para o seguinte; os
prompts especificam, não implementam.

## Autoridades de pesquisa

- [`dossie-final.md`](dossie-final.md)
- [`contrato-dominio-laravel-delphi.md`](contrato-dominio-laravel-delphi.md)
- [`pesquisa-interface-fluxo-delphi.md`](pesquisa-interface-fluxo-delphi.md)
- [`pesquisa-sqls-parametros-delphi.md`](pesquisa-sqls-parametros-delphi.md)
- [`pesquisa-autorizacoes-menu.md`](pesquisa-autorizacoes-menu.md)
- [`pesquisa-padroes-laravel-prompts.md`](pesquisa-padroes-laravel-prompts.md)
- [`schema/postgresql-authoritative-2026-09-01.json`](schema/postgresql-authoritative-2026-09-01.json)
- [`schema/controle-recebimentos-schema-manifest.json`](schema/controle-recebimentos-schema-manifest.json)
- [`schema/README.md`](schema/README.md)

Os prompts não podem pedir reabertura ou inspeção direta dos fontes Delphi. A
evidência Delphi já está capturada nos documentos acima; nomes finais de
classes, rotas e componentes devem ser verificados somente no Laravel atual e
nos prompts existentes.

## Escopo fixado

O módulo é uma **Consulta Operacional de Recebimentos** e permite somente
Alterações de Recebimento em registros existentes. Não é Cadastro, não faz
Inclusão e não faz Exclusão. As únicas operações observadas são: alterar tipo,
confirmar e estornar recebimentos.

O relatório, o cancelamento PostgreSQL real, o menu/acessosmodulos e a máscara
NF-e compartilhada são requisitos Laravel não localizados na tela Delphi; os
prompts devem implementá-los como contratos novos sem atribuí-los ao legado.

## Rastreabilidade

| Requisito | Prompt | Evidência |
|---|---|---|
| filtros, SQL, binds, listas set-based, joins pelo schema | 01 | pesquisa-sqls-parametros-delphi.md; schema/README.md |
| Filial autorizada, menu, `acessosmodulos`, breadcrumb, rádio | 01 | pesquisa-autorizacoes-menu.md; pesquisa-padroes-laravel-prompts.md |
| F9 pelo modal padrão | 01 | pesquisa-interface-fluxo-delphi.md; pesquisa-padroes-laravel-prompts.md |
| parâmetro bancário via `parametros_valor` | 01/02 | pesquisa-sqls-parametros-delphi.md |
| catálogo, ordenação, personalização, exportação e comportamento do grid | 02/03 | pesquisa-padroes-laravel-prompts.md; contrato-dominio-laravel-delphi.md |
| colunas editáveis, seleção, cores e totalizadores | 02 | contrato-dominio-laravel-delphi.md |
| alterar tipo, confirmar, estornar, F5, ícones e atalhos | 02 | contrato-dominio-laravel-delphi.md |
| Analista de Crédito, senha, capability e auditoria | 02 | pesquisa-autorizacoes-menu.md |
| relatório F6 com leiaute equivalente ao grid | 03/06 | requisito do mapa; ausência de relatório no Delphi registrada |
| F6/Cancelar e `pg_cancel_backend` real | 01/03/06 | pesquisa-padroes-laravel-prompts.md |
| schema datado, hash e gate | 01/03 | schema/README.md; manifesto |
| máscara NF-e compartilhada | 03 | pesquisa-padroes-laravel-prompts.md; ausência na tela registrada |
| N+1, `IN`/`ANY(array)`/`unnest`, sem `hasTable`/driver | todos | contrato-dominio-laravel-delphi.md |
| auditoria da implementação atual | 04/05/06 | auditoria-implementacao-laravel-vs-delphi.md |

## Guardrails comuns

- Não usar `select *`, concatenação de SQL, macros textuais, N+1, `Locate` por
  item ou `MAX()+1`.
- Usar projeções explícitas, bindings e consultas set-based; usar `IN`,
  `= ANY(array)` ou `unnest` quando a semântica for uma lista.
- Usar `INNER JOIN` quando a relação obrigatória estiver comprovada por
  `NOT NULL`, FK e semântica; usar `LEFT JOIN` somente para ausência opcional
  comprovada.
- Não usar teste de driver, `hasTable`, `Schema::has*`, `information_schema` ou
  `pg_catalog` no caminho de negócio. O schema só é consultado como artefato
  versionado/gate.
- Não criar operações, permissões, tabelas ou campos além dos contratos
  evidenciados. O ticket Wayfinder de proteção das alterações permanece uma
  dependência explícita para concorrência, idempotência e auditoria.
- Se houver futura tentativa de transformar o módulo em Cadastro, bloquear a
  especificação: a evidência confirma somente alteração de registros
  existentes.

10. [`09-speckit-prompt-fechamento-paridade-financeira.md`](09-speckit-prompt-fechamento-paridade-financeira.md) — fechamento das divergências residuais de Contas a Pagar e da transição bancária.
11. [`10-speckit-prompt-correcao-evento-destino.md`](10-speckit-prompt-correcao-evento-destino.md) — correção do evento destino na transição de data bancária.
12. [`11-speckit-prompt-fechamento-aceite-prompt10.md`](11-speckit-prompt-fechamento-aceite-prompt10.md) — higiene e fechamento do aceite da recusa atômica do Prompt 10.

13. [`12-speckit-prompt-reconciliacao-escopo-e-data-confirmacao-prompt11.md`](12-speckit-prompt-reconciliacao-escopo-e-data-confirmacao-prompt11.md) — reconciliação do escopo do Prompt 11, fotografia sem introspecção e data global vigente no F5.

A reauditoria mais recente está registrada em `auditoria-implementacao-laravel-vs-delphi.md` e no ticket Wayfinder 15. O Prompt 12 é necessário porque o aceite do Prompt 11 trouxe alterações fora de escopo e ainda não cobre a precedência da data global no F5.
Retificação: conforme orientação do usuário, o Prompt 12 trata exclusivamente da eliminação do N+1 na fotografia/aceite e da data global vigente do rodapé no F5. As demais alterações do checkout são intencionais e ficam fora desta rodada.