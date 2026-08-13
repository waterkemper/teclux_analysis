# Transferência de Requisição para Exposição — prompts SpecKit

Este diretório contém o contrato autoritativo para implementar no Laravel a tela **Interlojas → Transferência de Requisição para Exposição**, preservando o comportamento operacional observado no Delphi.

## Ordem de execução

1. [Fundação, domínio e segurança](01-speckit-prompt-fundacao-dominio-seguranca.md)
2. [Consulta F6, grid e cancelamento](02-speckit-prompt-consulta-f6-grid-cancelamento.md)
3. [Núcleo transacional e confirmação](03-speckit-prompt-nucleo-transacional-confirmacao.md)
4. [Lotes e conferência](04-speckit-prompt-lotes-conferencia.md)
5. [Interface, integração e aceite](05-speckit-prompt-interface-integracao-aceite.md)

Cada prompt é uma entrada independente do `/speckit.specify`, mas deve consumir os anteriores na ordem acima. Não implementar o módulo durante a execução do `/speckit.specify`; produzir especificação, plano, contratos, dependências e critérios de aceite.

## Evidências primárias e snapshot

- `pesquisa-interface-delphi.md` — `fmtransferenciarequisicaoexposicao.pas/.dfm` e dependências imediatas.
- `pesquisa-sql-dominio-efeitos-delphi.md` — `dmtransferenciarequisicaoexposicao.pas/.dfm`, SQL, efeitos e riscos de concorrência.
- `pesquisa-parametros-autorizacoes-menu.md` — `clparametrossistema.pas`, acesso legado, menu e padrões Laravel.
- `pesquisa-padroes-laravel-reuso.md` — reuso de requisições, romaneios, consulta, grid, F9, NF-e e cancelamento PostgreSQL.
- `schema/postgresql-authoritative-2026-08-06.json` — snapshot do banco `tecsoft`, schema `public`, SHA-256 `02F944BFEB2D97F47D3F124803E28F99989AE55040E01E56B6BA9073455A86DB`.
- `schema/README.md` — método de coleta, limites e gate de schema.

Também devem ser consultados, sem duplicar seus contratos: `modules/interlojas/requisicao-para-exposicao/`, `modules/interlojas/consulta-requisicoes-exposicao/` e `modules/entregas/cadastro-romaneios/`.

## Decisões transversais já confirmadas

- Comportamento funcional igual ao Delphi; não introduzir semântica nova de negócio.
- Emissão, transmissão, consulta, impressão ou cancelamento de NF-e e qualquer regra de “venda entre filiais” estão fora deste escopo operacional e são tratados no [mapa complementar de emissão fiscal da transferência](../../../.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/map.md).
- Grades/painéis Delphi de compras, grupos e filiais são obsoletos e não devem ser recriados.
- A consulta não terá paginação. A grade principal carrega o conjunto filtrado e mantém ordenação, exportação e preferências ERP.
- Consultas são SQL parametrizado e set-based. É proibido N+1; usar `IN` ou `= ANY(array)` para listas, com semântica explícita para lista vazia.
- `INNER JOIN` é obrigatório para relação necessária por FK/`NOT NULL`; `LEFT JOIN` somente para relação opcional comprovada no snapshot.
- F6 deve mostrar Cancelar desde o início da geração e cancelar a execução no PostgreSQL, além de abortar a interface localmente.
- F9 usa o modal padrão de pesquisa. A página usa Breadcrumb padrão e radio buttons quando a escolha é exclusiva.
- A chave NF-e reutiliza `NfeAccessKey`/`NfeAccessKeyInput`; não criar regex, DV ou máscara local.
- Não criar nem executar testes de driver, PDO como driver, `hashtablefs` ou `hastablefs`.
- O schema gate pertence a teste/CI; o caminho de negócio não consulta `information_schema`, `pg_catalog` ou `Schema::has*`.

## Contrato comum de cada prompt

Cada especificação deve declarar: objetivo e fronteira da fatia; evidências com arquivo/linha; comportamento Delphi confirmado; decisões novas, inferências, dúvidas e divergências; SQL/schema e estratégia anti-N+1; parâmetros, filial e autorização server-side; dependências; critérios de aceite; testes permitidos; e exclusões explícitas.
