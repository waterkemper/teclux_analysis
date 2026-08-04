# Prompt para /speckit.specify — consulta F6 e seleção múltipla

```text
/speckit.specify

Crie a especificação funcional e técnica da consulta F6 cancelável e do modal **Incluir múltiplos** do Cadastro de Romaneios, segunda de seis specs. Consuma a fundação da spec 01. Entregue filtros, read model, SQL set-based, paginação, ordenação, grid ERP, seleção/defaults, exportação e cancelamento PostgreSQL real. O commit dos Itens pertence à spec 03.

Não implemente. Inspecione o checkout e cite os seams concretos de CancelsPgsqlGerarQuery, PgsqlGerarQueryRunner, useErpGerarRequest/useErpHeavyGerarRequest, rotas cancelar-gerar, ErpPreferenceDataGrid e exportação. Autoridades:

- modules/entregas/cadastro-romaneios/consulta-f6-sql-performance-cancelamento.md
- modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md
- modules/entregas/cadastro-romaneios/schema/README.md e snapshot JSON
- modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md
- modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md

## Jornada e filtros

O modal mantém regiões Filtros e Resultados. F6 inicia Gerar e imediatamente oferece Cancelar. Resultado vazio não troca de página; cancelamento/erro preserva o último resultado completo; nova geração invalida resposta tardia.

Filtros: emissão inicial/final obrigatórias, inclusivas, válidas e ordenadas, com defaults PostgreSQL hoje−15 dias/hoje; Filiais e Clientes opcionais/múltiplos; entrega inicial/final opcional, mas ambos ou nenhum; somente NF com itens para entrega; e contexto canônico do Romaneio corrente. Filiais, Romaneio, sort e colunas usam allow-lists autorizadas.

## SQL e elegibilidade

- Consultar documentos fiscais elegíveis ainda não vinculados, preservando NF/Cupom, origem, cliente/destino e regras Normal/Transferência.
- Transferência mantém a mesma Filial de origem e destino/cliente; o primeiro Item pode classificar o tipo conforme evidência confirmada.
- Separar count, página-base e enriquecimentos em número fixo de queries. Relações em lote usam binds e IN/= ANY(array), com vazio e chunking explícitos.
- Proibir subconsulta correlacionada repetida, query em loop e lista/UNION textual.
- INNER JOIN nas FKs obrigatórias; LEFT JOIN somente para relações opcionais cuja ausência não elimina o candidato.
- Paginação/ordenação server-side, determinística e com tie-breaker canônico, sem limite silencioso.

Resultado: identidade estável, emissão, Cliente/endereço, frete, Filial, NF (série/número/chave), Cupom (ECF/intervenção/número), entrega, volumes, valores, observação, elegibilidade e dados para revalidação. Redigir a chave quando completa não for necessária.

## Cancelamento real

- Trace opaco preso a Usuário, screen key e geração; PID/backend registrado com cleanup seguro.
- pg_cancel_backend pela conexão administrativa compartilhada, durante count, base ou enriquecimento.
- Repetição é segura; ownership impede cancelar query alheia.
- Abortar HTTP ou ignorar resposta React não satisfaz o requisito.
- Cobrir corrida conclusão–cancelamento, falha do endpoint e restauração dos controles.

O padrão inicial é síncrono. Fila pesada só após medição real ultrapassar orçamento sustentado e mantendo cancelamento real.

## Grid, seleção e exportação

Use ErpPreferenceDataGrid com catálogo/screen key próprios, preferências, cópia, exportação e acessibilidade. Seleção usa IDs canônicos e esclarece se “marcar todos” cobre página ou conjunto. Permita aplicar Tipo de Frete, Entrega, Valor e Observação como rascunho. Alterar filtros invalida seleção/defaults mediante confirmação. F8 envia uma intenção em lote à spec 03.

Exportação usa os mesmos filtros, sort e snapshot lógico; não confia em IDs livres, não materializa tudo em memória e aplica a mesma autorização. Artefato assíncrono fica preso a Usuário/Filial e é reautorizado no download.

## Critérios de aceite

- [ ] Filtros isolados/combinados, vazios e inválidos estão cobertos.
- [ ] Quantidade de queries é limitada e independente da cardinalidade.
- [ ] Arrays vazios, lotes grandes e joins opcionais/obrigatórios têm contrato.
- [ ] Cancelar aparece imediatamente e o teste confirma a query encerrada no PostgreSQL.
- [ ] Usuário/trace não cancela consulta alheia e resposta tardia não substitui geração nova.
- [ ] Grid/exportação compartilham semântica, autorização e ordenação.
- [ ] EXPLAIN (ANALYZE, BUFFERS) e contagem de queries são evidências obrigatórias.
- [ ] PostgreSQL real é obrigatório; skip não aprova.

## Fora de escopo

- persistir Itens selecionados;
- CRUD, operações de entrega e relatórios;
- criar componente global paralelo de grid ou cancelamento.
```
