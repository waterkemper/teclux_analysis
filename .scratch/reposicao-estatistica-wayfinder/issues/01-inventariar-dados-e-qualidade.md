# Inventariar dados históricos e qualidade

Type: task
Status: resolved
Blocked by:

## Question

Quais dados realmente existem no Delphi e no Laravel para calcular reposição no nível `produto × filial × dia` — vendas, vendas perdidas, estoque/saldos, rupturas, reservas, trânsito, entradas/NF, transferências, pedidos, preços/promoções, calendário, produto, grupo, marca e filial — e quais são sua retenção, granularidade, chaves, atrasos, lacunas, inconsistências e limitações de consulta?

Documentar as fontes oficiais, exemplos de consultas/arquivos e um diagnóstico de qualidade que permita saber quais técnicas são viáveis e quais não são.

## Answer

**CONFIRMADO (estrutura):** o sistema possui as principais fontes necessárias para uma primeira versão de reposição no eixo produto × filial:

- `estoques` é o saldo atual por produto e filial, com `emestoque`, `reservado`, `transito`, `demonstracao`, `futuro`, `reservaprevia`, `estoquefisico`, `minimo`, `maximo`, `ultimaentrada`, `ultimavenda` e `data_alteracao`. A chave é `(produto, filial)`. Evidência: `laravel/backend/database/migrations/2026_04_13_000001_estoques_legacy_shape_sqlite.php` e `LegacyReposicaoEccEstoquesPoliticaRepository`.
- `movimentos` é a fonte histórica mais importante: a Consulta de Compras expõe produto, filial, tipo de movimento, quantidade, operação, data, documento/referência e snapshots dos saldos. Evidência: `delphi/apps/estoque/dmconsultacompras.pas` (campos de `qryMovimentos`) e `laravel/docs/architecture/estoque/ficha-produtos-read-model.md`, que define movimentos como eventos + snapshots e usa saldo inicial anterior ao período.
- Vendas e documentos fiscais são reconstruídos no legado por `movimentos`, `produtosdadosfiscais`, `dadosfiscais`, `produtosnotaspag` e `notaspag`. A Consulta já possui visões de vendas mensal, por filial, por grupo e diária, inclusive contrato/internet/loja. Evidência: `delphi/apps/estoque/dmconsultacompras.pas` e `delphi/apps/estoque/dmconsultacompras.dfm`.
- `vendasperdidas` existe no Laravel e registra filial, produto, data/hora, vendedor e observações. Ela é uma fonte explícita de demanda não atendida, mas não pode ser assumida como perda total: depende de o operador ter registrado o evento. Evidência: `laravel/backend/database/migrations/2026_07_14_180001_vendasperdidas_sqlite_stub.php` e `laravel/docs/architecture/venda-perdida-contrato.md`.
- `pedidosfiliais` preserva o fluxo de requisição entre filiais, com requisitante, requisitada, produto, quantidade pedida/recebida, situação, datas e lote. Pode alimentar demanda comprometida, lead time e avaliação de atendimento, sem criar outro fluxo de efetivação. Evidência: `laravel/backend/database/migrations/2026_07_21_220000_sqlite_pedidosfiliais_legacy_shape.php` e `laravel/docs/architecture/estoque/reposicao-ecc-revisao.md`.
- Produtos, características/grupos, marcas, fornecedores, filiais e promoções já são usados nos filtros e joins da Consulta de Compras. Isso fornece atributos para segmentação e features, mas não comprova que todos tenham histórico estável ou preenchido.

**CONFIRMADO:** o ECC atual já fotografa configuração e fatos da execução, mas seus snapshots são artefatos operacionais imutáveis, não um data lake histórico de demanda. O motor estatístico precisará ler eventos/saldos históricos ou uma projeção própria.

**INFERIDO:** é possível formar uma série diária agregando movimentos e documentos fiscais por produto/filial, usando snapshots anteriores para saldo inicial e separando movimentos de venda, entrada, transferência, ajuste e cancelamento. Essa classificação ainda precisa ser provada pelos códigos oficiais de `tipomovimento`, `operação`, situação fiscal e regras de estorno.

**DÚVIDA / NÃO LOCALIZADO no workspace:** não há uma amostra de banco de cliente nem um inventário executado com contagens, datas mínima/máxima, nulos, duplicidades, atraso de carga e cobertura por filial/produto. Também não está comprovado se toda venda perdida é registrada, se promoções têm histórico suficiente, nem se existe uma série confiável de rupturas/estoque-disponível por dia.

Conclusão: a base permite iniciar uma prova de conceito com baselines e política de estoque, mas a seleção de modelo e a reconstrução de demanda não devem ser fechadas antes do perfil real de qualidade e da taxonomia dos movimentos.
