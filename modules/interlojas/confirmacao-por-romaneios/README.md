# Confirmação por Romaneios — prompts SpecKit

Este diretório contém a sequência autoritativa de prompts para especificar, em Laravel, a tela Delphi Interlojas → Confirmação por Romaneios. Os prompts não implementam código nem executam /speckit.specify.

## Ordem de leitura

1. 01-speckit-prompt-fundacao-dominio-seguranca.md
2. 02-speckit-prompt-consulta-f6-cancelavel.md
3. 03-speckit-prompt-confirmacao-transacional.md
4. 04-speckit-prompt-interface-grids-operacoes.md
5. 05-speckit-prompt-aceite-testes-observabilidade.md
6. 06-speckit-prompt-correcao-passagem-laravel.md
7. 07-speckit-prompt-correcao-previsao-documentospag-romaneio-t.md

## Pacote autoritativo

- pesquisa-interface-delphi.md
- pesquisa-sql-dominio-efeitos-delphi.md
- pesquisa-parametros-autorizacoes-menu.md
- pesquisa-padroes-laravel-reutilizaveis.md
- schema/README.md
- schema/postgresql-authoritative-2026-08-03.json
- ../../../laravel/CONTEXT.md

Fontes Delphi:

- C:\projetos.vcl\apps\interlojas\dmconfirmarromaneiostransferencia.pas/.dfm
- C:\projetos.vcl\apps\interlojas\fmconfirmarromaneiostransferencia.pas/.dfm
- C:\projetos.vcl\biblio\clparametrossistema.pas

## Decisões fechadas

- Paridade funcional com o Delphi é obrigatória; defeitos técnicos como N+1, commits parciais, concatenação SQL e cancelamento apenas visual não devem ser copiados.
- A tela é consulta/operação, não cadastro.
- F6 é query direta completa, sem paginação e sem fila pesada.
- F6 é set-based, parametrizada, sem N+1, com IN/ANY(array)/unnest/VALUES e arrays vazios explícitos.
- Cancelar aparece antes do primeiro await e cancela PostgreSQL com pg_cancel_backend().
- Cada Romaneio é unidade atômica, idempotente e concorrente; Delphi e Laravel compartilham o PostgreSQL legado.
- F5, F6, Ctrl+Espaço, Enter e F9 seguem os atalhos confirmados e os conflitos do shell Laravel.
- A máscara NF-e usa os componentes compartilhados NfeAccessKey*.
- Não testar driver nem hashtablefs; schema gate é CI/teste, nunca introspecção de negócio em runtime.

## Limites

Não executar migrations, não alterar PAS/DFM, não reabrir Cadastro de Romaneios ou Confirmação por Notas, não criar estado paralelo Laravel e não usar Schema::hasTable, information_schema ou pg_catalog no caminho normal da aplicação.
