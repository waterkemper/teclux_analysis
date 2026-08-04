# Prompt para /speckit.specify — cadastro, itens e Contas a Pagar

```text
/speckit.specify

Crie a especificação funcional e técnica do cadastro mestre–detalhe de Romaneios e seus comandos CRUD, terceira de seis specs. Consuma a fundação (spec 01) e a intenção selecionada da F6 (spec 02). Inclua o efeito atômico no Contas a Pagar. Conferência, recebimento, liberação/retenção, justificativa e relatórios pertencem às specs seguintes.

Não implemente. Inspecione o Laravel e cite arquivos. Autoridades: modelo-dominio-coexistencia-transacoes.md, seguranca-menu-parametros.md, interface-operacoes-componentes.md, pesquisa-interface-delphi.md, pesquisa-sql-dominio-efeitos-delphi.md e schema/README.md + snapshot/funções, todos em modules/entregas/cadastro-romaneios/.

## Página e Item

Use ErpCadastroShell/ErpCadastroCommandBar. Exiba número, abertura do servidor, tipo Normal/Transferência, Transportador, frete, situação, revisão, evidências operacionais, observação, grid de Itens e resumo financeiro somente leitura.

Barra: Novo F3, Gravar F8, Excluir F6, Localizar F9, Imprimir F7 reservado, Incluir Item e Incluir múltiplos. F5 não grava. Número/situação são canônicos; tipo fica imutável após o primeiro Item.

Modal unitário:

- Nota: Filial, série, número, “somente NF com itens para entrega” e chave;
- Cupom: Filial, ECF, intervenção e número;
- comuns: Auto Incluir, cancelado quando permitido, emissão, tipo/tabela/valor de frete, entrega e observação.

Use NfeAccessKeyInput e NfeAccessKey/NfeAccessKeyValid; não crie máscara/regex/DV local. Enter em chave válida localiza/preenche. Após F8 com Auto Incluir, limpe somente o novo Item e restaure foco. Erro fica associado ao campo.

ErpPreferenceDataGrid não persiste inline. Cada linha substituída vem do backend com a nova Revisão.

## Comandos

Especifique criar, alterar e excluir Romaneio; incluir, alterar, excluir e alternar cancelamento de Item com confirmação/capability; e inclusão múltipla atômica.

- Criação exige ao menos um Item e usa romaneios_proximonumero().
- Sob locks, revalidar Documento Fiscal, vínculo, elegibilidade, tipo, Filiais, cliente/destino, situação e revisão.
- Transferência preserva origem/destino coerentes. Defaults de frete não vêm como autoridade do browser.
- Atualizações em produtosdadosfiscais são set-based, tipadas e compatíveis com PostgreSQL 9.5; nunca UNION/lista textual por Item.
- Após efeitos, chamar Atualizar_situacao_romaneio uma vez e reler agregado/situação/revisão.
- Exclusão só em ABERTA e bloqueia com entrega, Duplicata paga/protegida ou dependência financeira não removível.
- Lote recebe IDs + defaults, relê tudo e faz commit único; um inválido rejeita o conjunto com diagnóstico por documento.

Todo comando exige capability, Filiais, revisão e idempotência da spec 01. Conflito oferece recarga, nunca merge/overwrite.

## Contas a Pagar

Resolver os dois parâmetros em uma leitura por Filial. Desativado não cria novo financeiro. Ativado exige evento válido antes de efeitos e chama o seam compartilhado dentro da mesma transação.

O adapter fornece total canônico não cancelado, evento, Filial, fornecedor/tipo, emissão, lançamento, vencimento, complemento, referência e previsão somente quando Delphi + snapshot + DTO financeiro confirmarem. Campo não comprovado bloqueia o SQL.

Criar/manter um Documento a Pagar ligado ao Romaneio e exatamente uma Duplicata, usando documentospag_proximonumero() via núcleo existente. Retry/concorrência não duplica. Duplicata paga não muda; autorizada/protegida segue as regras Laravel. Falha financeira desfaz Romaneio e falha posterior desfaz financeiro. Sem HTTP, segundo grant, repository duplicado ou commit interno.

## Critérios de aceite

- [ ] CRUD/lote preservam agregado, functions/triggers e uma transação.
- [ ] F8 é Gravar; modais protegem dirty state/foco.
- [ ] Chave NF-e compartilha autoridade frontend/backend e cobre scanner/colar/DV.
- [ ] Tipo e regras Normal/Transferência são revalidados no servidor.
- [ ] Nenhuma query/escrita por Item; lotes são set-based.
- [ ] Replay, payload divergente e revisão obsoleta estão cobertos.
- [ ] Excluir respeita entrega e proteções financeiras.
- [ ] Financeiro reutiliza o núcleo, mantém uma Duplicata e compartilha rollback.
- [ ] Falhas injetadas não deixam mestre, item, situação, auditoria ou financeiro parcial.
- [ ] Concorrência Laravel–Laravel e Delphi-equivalente–Laravel roda em PostgreSQL real.

## Fora de escopo

- cancelar/estornar pagamento;
- operações de entrega da spec 04;
- relatórios/acabamento da spec 05;
- rollout/feature flag.
```
