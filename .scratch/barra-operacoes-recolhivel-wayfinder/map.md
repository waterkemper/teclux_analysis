# Wayfinder — Barra de operações recolhível nas telas Laravel

Label: wayfinder:map

## Destination

Produzir uma especificação funcional e técnica, pronta para `/speckit.specify`, para corrigir a barra lateral de operações que aparece após o scroll nas telas Laravel. A especificação deve permitir recolher ou esconder o rail sem perder as operações, sem bloquear campos/grids e sem exigir manutenção tela a tela quando o comportamento pertence ao shell compartilhado.

O artefato de handoff deve ficar em `modules/shared/barra-operacoes-recolhivel/` e cobrir inventário transversal, contrato de UX, acessibilidade, responsividade, migração, testes e critérios de aceite. Não implementar neste mapa.

## Notes

- Domínio: Plataforma Laravel, shell de navegação, cadastros e consultas operacionais.
- Antes de fechar termos, consultar `CONTEXT-MAP.md`, `laravel/CONTEXT.md` e ADRs Laravel relevantes.
- Seam primário confirmado: `laravel/backend/resources/js/Components/erp/cadastro/ErpCadastroShell.tsx` alterna a barra superior para `layout="rail"` após scroll em `#main-content` usando `useMainScrollPast`.
- Seams de apresentação confirmados: `ErpCadastroCommandBar.tsx` e `ErpConsultaOperationBar.tsx` renderizam rails `position: fixed`, à direita, no centro vertical, com `z-40`.
- Baseline da auditoria: 101 arquivos consumidores de `ErpCadastroShell` e 38 arquivos consumidores diretos de `ErpConsultaOperationBar`, excluindo testes e as próprias definições; a contagem deve ser refeita no momento da implementação.
- Consumidores especiais devem ser auditados explicitamente: Romaneios, Requisição para Exposição, Ficha Financeira, Orçamentos, Cobranca SAC, relatórios/consultas com `trailingActions` e telas que desabilitam `enableCompactRail`.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG ATUAL` ou `DECISÃO NOVA`, sempre com arquivo e evidência.
- Preservar atalhos, autorização, disabled/busy, foco, ações extras e semântica das operações; a mudança é de apresentação e controle de visibilidade.
- O mapa organiza decisões. Nenhuma implementação, migration ou alteração de operação de negócio deve ser feita dentro deste esforço.

## Decisions so far

<!-- Uma linha por ticket resolvido. Os tickets abertos estão em issues/ e não são repetidos aqui. -->

## Not yet specified

- Inventário completo dos consumidores do shell, dos rails e das variantes customizadas, incluindo telas que usam o shell sem a barra compartilhada.
- Contrato exato entre barra completa, rail expandido, rail recolhido e reexibição; especialmente se o estado deve persistir por tela/sessão.
- Comportamento responsivo, foco, leitores de tela, modais, nested scroll, zoom e telas pequenas.
- Estratégia de regressão para aplicar o contrato compartilhado sem alterar manualmente dezenas de telas nem deixar `trailingActions` fora do controle.
- Divisão final e validação do prompt `/speckit.specify` publicado em `modules/shared/barra-operacoes-recolhivel/`.

## Out of scope

- Alterar regras de negócio, endpoints, permissões, atalhos ou contratos de gravação/pesquisa/exclusão.
- Redesenhar todo o `AppLayout`, os grids ou os formulários.
- Remover definitivamente a barra completa sticky do topo sem evidência de que isso preserva a operação.
- Corrigir telas que não usam o shell/rail compartilhado, salvo quando o inventário comprovar que uma barra fixa equivalente pertence ao mesmo contrato.
- Implementar a solução neste mapa; a execução será feita a partir da especificação publicada.
