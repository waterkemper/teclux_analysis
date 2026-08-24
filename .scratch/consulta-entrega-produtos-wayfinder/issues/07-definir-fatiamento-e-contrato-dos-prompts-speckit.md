# Definir fatiamento e contrato dos prompts SpecKit da Consulta de Entrega de Produtos

Type: grilling
Status: resolved
Blocked by: 05, 06

## Answer

Fatiamento aprovado: cinco prompts /speckit.specify sequenciais em modules/entregas/consulta-entrega-produtos/.

1. 01-speckit-prompt-fundacao-acesso-filtros.md: folha Cloud e rota, middleware e capability fail-closed, Filial server-side, breadcrumb, command bar, DTO/Form Request, filtros tipados, F9/modal, parametros sem manifesto enquanto nao houver evidencia e atalhos confirmados.
2. 02-speckit-prompt-consulta-f6-grid-schema-cancelamento.md: snapshot/manifest como gate, duas branches UNION ALL, read model, source_kind/chave real, SQL parametrizado, pre-agregacoes, cardinalidade, INNER/LEFT JOIN guiados por schema, grid com catalogo/ordenacao/preferencias/exportacao e F6 cancelavel por pg_cancel_backend.
3. 03-speckit-prompt-edicao-agendamento-f5-conflitos.md: campos editaveis data/hora/periodo, regras de faixa e sincronizacao, dirty state/change set, F5 atomico, idempotencia, revisao esperada, auditoria, revalidacao e conflito sem commit parcial; nenhum campo derivado editavel.
4. 04-speckit-prompt-relatorio-fotografia-exportacao.md: resultado canonico compartilhado por grid, preview, relatorio, PDF, impressao e exportacao; fotografia/envelope versionado se materializada, agrupamentos, totais, vazio, autorizacao, expiracao, hash e paridade de identidade.
5. 05-speckit-prompt-aceite-desempenho-observabilidade.md: matriz de requisitos, testes PostgreSQL reais, ausencia de N+1, cancelamento observavel, cardinalidade, SQL allowlistado, F9, acesso/Filial, concorrencia, acessibilidade, busy/cancel, telemetria e respostas tardias.

Todos os prompts devem referenciar as quatro notas de pesquisa e o snapshot/manifesto proprio, consultar somente o checkout Laravel atual para seams, preservar as classificacoes de evidencia e nao pedir nova inspeção direta do Delphi. O README deve declarar a ordem e as dependencias; cada prompt tem uma fronteira unica e nao duplica implementacao de outro.

Gates comuns: binds/IN/ANY(array), nenhum SQL textual ou N+1, joins definidos por nulabilidade/cardinalidade, F6 com Cancelar antes do primeiro await e cancelamento PostgreSQL real, F5 como command transacional, F9 pelo modal padrao, acesso fail-closed, schema sem introspeccao em runtime e proibicao de teste de driver/hasTable/Schema::has*.

## Question

Decidir quantos prompts /speckit.specify serao produzidos em modules/entregas/consulta-entrega-produtos/, a ordem e fronteira de cada um, os artefatos de pesquisa/schema obrigatorios, os gates comuns e como evitar duplicacao. Cobrir fundacao/acesso/filtros, consulta F6/grid/schema/cancelamento, edicao/agendamento, relatorio/fotografia/exportacao e aceite, sem pedir nova inspeção direta do Delphi.
