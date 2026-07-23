# Paridade da Quitação de Duplicata em Contas a Pagar

Label: wayfinder:map

## Destination

Produzir, em `modules/financeiro/contas-pagar/quitacao-duplicata/`, um dossiê específico e um prompt Spec Kit autocontido para o Cursor, confrontando a tela/modal atual de Duplicatas no Laravel com o fluxo alcançável de quitação no Delphi e especificando autorização, pagamento, parcial, desconto integral, cancelamento/refazer e todos os efeitos transacionais necessários.

## Notes

- Este esforço aprofunda exclusivamente a **Quitação da Duplicata dentro do Documento a Pagar**; reutiliza como contexto, mas não substitui, `modules/financeiro/contas-pagar/dossie.md` e a matriz do Wayfinder amplo.
- Usar a linguagem: **Autorização de Pagamento** é a evidência que permite a ação; **Quitação** é o fato financeiro confirmado; **Cancelamento da Quitação** desfaz os efeitos; **Refazer Pagamento** cancela e reaplica por comando privilegiado.
- Analisar sempre o Laravel atual antes de propor mudanças; preservar e estender `Cadastro.tsx`, `DuplicatasGrid`, `DuplicataDialog`, services, repositories, Policies, autorização sensível e testes já existentes.
- No Delphi, seguir `fmcontaspagar`/`dmcontaspagar`, `fmcadastroduplicatascontaspagar` e consumidores alcançáveis até fixar o contrato da quitação, sem migrar integralmente telas de lote/retorno.
- Rastrear `constante Delphi → texto canônico em clparametrossistema → efeito → ParameterService/parametros_valor('texto')`.
- Classificar evidências como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` ou `OPORTUNIDADE`.
- Segurança, Filiais, autorização server-side, transação, concorrência, idempotência, auditoria e reconciliação são requisitos de primeira classe.
- Este mapa planeja e gera a especificação; não implementa os ajustes no Laravel nem altera o Delphi.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Revalidar o prompt contra o Laravel atualizado](issues/06-revalidar-prompt-laravel-atualizado.md) — confirmou commands e infraestrutura já implementados, identificou lacunas de preview, idempotência, parcial/zero, Filial, proof, manifestos, Contabilidade e testes PG, e atualizou dossiê/prompt para corrigir sem duplicar.

- [Consolidar o dossiê e o prompt Spec Kit da Quitação de Duplicata](issues/05-consolidar-spec-quitacao-duplicata.md) — entregou o dossiê focado e o prompt `/speckit.specify` autocontido em `modules/financeiro/contas-pagar/quitacao-duplicata/`, concluindo a Destination sem implementar o Laravel.

- [Definir a matriz e o contrato seguro do comando de Quitação de Duplicata](issues/04-definir-matriz-comando-quitacao.md) — definiu módulo profundo com preview/Pay/Cancel/Rebuild, comandos HTTP versionados e idempotentes, proof/Filiais/locks, writers transacionais, auditoria/reconciliação, UX, adapters e fases de entrega.

- [Inventariar dados e efeitos transacionais da Quitação de Duplicata](issues/03-inventariar-efeitos-quitacao-delphi-laravel.md) — confirmou a unidade Documento/Duplicata, impostos, bancos origem `P` e Contabilidade com reconciliação/rollback; no Laravel, reutilizar transação, tributário e mapeamentos, criando writers financeiros, locks, idempotência e auditoria próprios.

- [Inventariar o fluxo funcional de Quitação de Duplicata no Delphi](issues/02-inventariar-fluxo-quitacao-delphi.md) — fixou estados, autorização, campos/defaults, validações, parcial/residual, desconto integral, cancelamento/refazer e diferenças entre tela, lote e retorno; efeitos transacionais ficam para o ticket 03.

- [Inventariar a Quitação de Duplicata na tela Laravel atual](issues/01-inventariar-quitacao-laravel-atual.md) — confirmou que Pagar hoje apenas autoriza a abertura do modal, descarta proof/autorizador e marca a linha localmente para posterior `replaceAll`; cancelamento/refazer, Filial de Pagamento e comando financeiro server-side não existem.

## Not yet specified

Nenhuma decisão permanece na névoa; os artefatos foram revalidados contra o Laravel atualizado.

## Out of scope

- Implementar a quitação durante este Wayfinder.
- Alterar o Delphi.
- Reespecificar todo o cadastro de Documento/Duplicatas fora do necessário para quitar com segurança.
- Migrar integralmente as UIs de quitação em lote, cancelamento em lote, remessa ou retorno; documentar apenas seus contratos como consumidores do mesmo motor.
- Reinf, Contabilidade cadastral completa e PIS/COFINS cadastral fora dos efeitos diretamente acionados pela quitação.
- Copiar login mágico, proteção exclusivamente visual, Filiais globais, SQL inseguro, `MAX+1` desprotegido ou estado financeiro vindo do cliente.
