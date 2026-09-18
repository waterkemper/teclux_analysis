# Prompt 26 — Aceite integrado da configuração ECC e dos snapshots efetivos

## Objetivo

Validar ponta a ponta que a configuração feita pela nova interface é exatamente a configuração usada pelo job, respeitando overlays fixos por tipo e sem alterar o núcleo de cálculo/confirmacão.

## Backend e snapshot

> SUPERSEDED: os testes abaixo cobrem overlays fixos por tipo. Usar o prompt 31 para o aceite do modelo configuravel; manter estes cenarios somente como regressao legada quando aplicavel.

Criar uma matriz de testes para a mesma configuração base aplicada a cada tipo:

- `periodo.numero_dias` é deslizado para o dia civil da execução;
- `intervalo_dias = 20` produz janelas D+20, D+40 a partir da ativação, respeitando horário e timezone;
- `intervalo_dias = 1` reproduz a agenda diária e `intervalo_dias = 15` reproduz a agenda quinzenal;
- Geralzão não injeta `ultima_venda` nem `entrada_nf` por regra do tipo;
- Vendido do dia anterior injeta `ultima_venda = D-1..D-1`;
- Produtos novos injeta `entrada_nf = D-1..D-1` com o depósito da rotina;
- `parametros_efetivos_json`, `motor_efetivo_json` e `payload_hash` são imutáveis no snapshot;
- o payload vivo pode ser alterado para a próxima execução sem alterar snapshots anteriores;
- alterar `intervalo_dias` não reprocessa janelas antigas nem altera snapshots já persistidos;
- mesma rotina/filial/cenário continua respeitando idempotência e lote pendente único.

## Interface e contratos

Validar:

- props de catálogos/lookups presentes e protegidas pelo grant ECC;
- payload enviado pela tela igual ao payload retornado pelo `show` após normalização;
- nenhuma seleção de filial, grupo, marca ou depósito é criada pelo backend sem entrada do operador;
- dados incompletos impedem ativação com mensagem acionável;
- alias visual não muda tipo, agenda, dispatcher ou hash semântico da rotina;
- clone copia configuração, mas nasce inativo e independente.

## Regressões

Executar, via Docker PHP e Vitest, a matriz da Consulta de Compras e as regressões ECC 427–436, incluindo:

- rotina, timezone e autorização;
- dispatcher, janela diária/quinzenal e recovery;
- cálculo, prefixos, máximo, concentração, multi-fonte e gerente;
- snapshot, idempotência, revisão OCC e lote pendente;
- revisão/confirmacão e geração de `pedidosfiliais`;
- exceções, alertas e indicadores.

## Critérios de aceite

- Um operador com acesso ao módulo consegue criar e parametrizar uma rotina sem API manual.
- Os filtros salvos na rotina reaparecem na edição sem perda.
- O intervalo de execução pode ser alterado independentemente do tipo.
- A tela deixa claro o que é configurável e o que é fixo do tipo.
- A execução usa os filtros configurados e os overlays corretos.
- Nenhum default de cliente é introduzido.
- Não há alteração na confirmação de pedidos entre filiais nem no fluxo de aprovação de gerente.
