# Dossiê final — Controle de Recebimentos

## Resultado

O pacote especifica uma **Consulta Operacional de Recebimentos** para o
Laravel. A tela consulta registros existentes e permite somente as três
alterações que o Delphi expõe: **Alterar tipos de recebimentos**, **Confirmar
recebimentos** e **Estornar recebimentos**. Inclusão, exclusão e CRUD genérico
estão fora do domínio.

A identidade da linha é `recebimentos.codigo`; `controlerecebimento` agrupa
linhas para seleção, confirmação e alteração de tipo. A referência estrutural
é o snapshot PostgreSQL datado em
[`schema/postgresql-authoritative-2026-09-01.json`](schema/postgresql-authoritative-2026-09-01.json),
com manifesto e SHA no [README do schema](schema/README.md).

## Evidências consolidadas

| Tema | Decisão/limite |
|---|---|
| Consulta | filtros de emissão, vencimento, recebimento, Filiais, tipos, cliente, forma, TEF/POS e operação; situação fixa `N` |
| Alteração de tipo | somente recebimentos não confirmados; tipo editável se não houver confirmações relacionadas; recalcula grupo e rateia valores conforme o tipo |
| Confirmação | data, valor e deságio editáveis no modo próprio; valida data; grava confirmação e efeitos relacionados |
| Estorno | remove confirmação/data e desfaz efeitos relacionados, preservando identidades; não é exclusão |
| Grid | sem inclusão/exclusão; Catálogo de Grid, ordenação, preferências, exportação, seleção, cores e totalizadores conforme padrão Laravel |
| F5 | grava a alteração selecionada; autorização sensível antes da gravação |
| F6 | gera consulta; Cancelar imediato e cancelamento PostgreSQL real são requisitos novos do Laravel |
| F9 | usar modal padrão Laravel; a tela Delphi não possui pesquisa própria completa |
| parâmetro | `RecebimentosIntegradoComBancos`, com gate de data; leitura pela abstração Laravel de `parametros_valor(nome, filial)` |
| autorização | Analista de Crédito/senha ou login autorizado conforme evidência; menu/capability é superfície separada |
| relatório | não localizado no Delphi; se criado no Laravel, F6, Cancelar e mesmo resultado/leiaute lógico do grid são obrigatórios |
| NF-e | chave NF-e não localizada nesta tela; reutilizar componente compartilhado, sem inventar campo no módulo |

## Classificação das lacunas

- **DIVERGENTE/POSSÍVEL BUG LEGADO:** `valorlancto` parece editável na coluna,
  mas o field é `ReadOnly=True`; o contrato mantém somente leitura.
- **POSSÍVEL BUG LEGADO:** F5 pode ser habilitado no índice 0, enquanto o fluxo
  de gravação comum filtra confirmações para operação diferente de zero; a
  alteração de tipo usa `RecalcularRecebimentos`.
- **NÃO LOCALIZADO:** relatório, Cancelar durante `Open`, cancelamento de banco,
  menu/acessosmodulos e máscara NF-e na tela.
- **NÃO DETERMINADO PELO DELPHI:** estratégia formal de lock, idempotência,
  auditoria imutável, conflito Delphi/Laravel e capability individual por
  operação. O ticket Wayfinder próprio deve ser resolvido antes de fechar esses
  contratos no plano de implementação; nenhum prompt pode fingir paridade onde
  não há evidência.

## Regra de handoff

Executar os três prompts na ordem do [README](README.md), consultando apenas o
checkout Laravel e estes artefatos. `/speckit.specify` deve produzir
especificação, não código. Qualquer tabela, coluna, função, nulabilidade ou
join ausente do snapshot bloqueia o SQL afetado e exige nova captura datada.
