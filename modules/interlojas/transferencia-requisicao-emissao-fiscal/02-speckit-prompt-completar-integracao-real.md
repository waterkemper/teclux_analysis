# Prompt SpecKit — Completar a integração fiscal real das transferências

Use este prompt depois de revisar a implementação existente da feature 332. Esta é uma fatia de complementação; não recrie o MVP de grupos, idempotência e contratos que já existem.

## Contexto obrigatório

Leia:

- modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md
- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/05-auditoria-implementacao-transferencias.md
- laravel/specs/332-trf-exposicao-emissao-fiscal/spec.md
- laravel/specs/332-trf-exposicao-emissao-fiscal/contracts/*.md
- laravel/backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/
- laravel/backend/app/Infrastructure/Fiscal/
- laravel/backend/app/Application/Fiscal/
- laravel/backend/app/Infrastructure/Fiscal/Persistence/
- laravel/backend/tests/Feature/Interlojas/TransferenciaRequisicaoEmissaoFiscal/
- modules/interlojas/transferencia-requisicao-exposicao/README.md
- módulos e specs da plataforma fiscal 333 a 348

## Objetivo

Completar o que a implementação 332 ainda não entrega: emissão real pela plataforma fiscal, fotografia autoritativa derivada da transferência confirmada, projeção acionada por autorização real, reconciliação Delphi real e efeitos de destino honestos e idempotentes.

## Entregas obrigatórias

### 1. Plataforma real

- Implementar TransferenciaFiscalPlatformAdapter usando os serviços/repositorios reais da plataforma fiscal.
- Remover o binding global de FakeFiscalPlatformAdapter; Fake só pode ser selecionado explicitamente em teste/dry-run.
- Persistir fotografia, emissão, revisão, número, comando/outbox, tentativa, estado, artefatos e reconciliação nas estruturas duráveis da plataforma.
- Usar a linha real de seriesfiliais com FOR UPDATE; Cache nunca é contador, outbox ou fonte durável.
- Resolver certificado por Contribuinte Fiscal, Filial, UF, ambiente, modelo, operação e vínculo vigente; booleano vindo do request não é credencial.

### 2. Fotografia autoritativa

- O cliente deve enviar apenas o identificador da transferência/grupo e parâmetros de intenção permitidos.
- Carregar linhas no servidor a partir da Transferência confirmada e das revisões/estados operacionais; não aceitar linhas, filial requisitante, produto, quantidade, totais ou dados fiscais arbitrários como autoridade.
- Validar situação elegível, quantidade, lote marcado, reserva/estoque, filial de estoque, revisão concorrente e vínculo do usuário/filial.
- Resolver antes do seal participante completo, endereço, UF/IBGE, regime, produto, unidade, conversão, NCM/CEST/GTIN, preço, impostos, totais, transporte e volumes.
- Ausência ou conflito bloqueia com Pendência Fiscal Acionável. Não usar totais 0.00, unidade UN ou transporte padrão como substitutos silenciosos.
- Usar serialização canônica da plataforma e guardar todas as linhas de origem e versões; depois do seal nenhum adapter consulta cadastro atual.

### 3. Autorização e projeção

- Registrar subscription/listener real para o evento de autorização da plataforma fiscal.
- O handler deve consumir a emissão e a fotografia selada; nunca chamar markAuthorized, Fake ou alterar a situação fiscal.
- Só aplicar projeção quando a plataforma comprovar AUTORIZADA e a emissão/emitente/modelo/chave forem compatíveis.
- Manter a rota manual somente como reprocessamento administrativo idempotente, com verificação de AUTORIZADA e autorização reforçada.
- Aplicar somente a projeção idempotente de satisfação da `Transferencia`. `VendaTransferencia` e `DevolucaoTransferencia` estão fora do escopo desta ponte e devem ser rejeitadas, não implementadas.

### 4. Convivência Delphi

- Reconciliar por origem, FilialBase, requisitante, tipo, emitente, modelo, série, número, chave, fotografia/hash e artefatos usando dados legados autoritativos.
- Não usar seed de Cache como implementação de reconciliação.
- Documento Delphi existente deve ser importado/espelhado sem segunda emissão; divergência deve virar pendência e não mutar Delphi.

### 5. Segurança e estados

- Remover a autoridade de filial_requisitante, linhas e fotografia do request; usar o request apenas como intenção e filtro autorizado.
- Pendências e status devem consultar o grupo persistido e a plataforma; não reformar grupo a partir de payload arbitrário.
- Replay deve retornar o estado real da emissão e processamento; não fixar PENDENTE/AGUARDANDO.
- Manter confirmação operacional, situação fiscal, processamento e projeção como estados distintos.

## Testes obrigatórios

- Testes com a plataforma fiscal real/fake de contrato, sem fazer Fake ser o adapter de produção.
- PostgreSQL: concorrência, FOR UPDATE na seriesfiliais, rollback pré-commit, outbox, replay e ausência de consumo duplicado.
- Fotografia: dados completos, alteração cadastral pós-seal, linha não confirmada, lote/estoque insuficiente, conflito fiscal e ausência de endereço/tributo.
- Autorização: PENDENTE não projeta; AUTORIZADA projeta uma vez; rejeitada/ambígua não projeta; retry do evento é no-op.
- Delphi: documento real compatível, divergência de chave/série/número/hash/artefato e ausência de documento.
- Tipos fora do escopo: `VendaTransferencia` e `DevolucaoTransferencia` são rejeitados pela entrada e não possuem efeitos, pendências ou testes de implementação.

## Critérios de aceite

1. Em produção, nenhuma porta fiscal da transferência resolve para Fake ou Cache.
2. É impossível emitir com linhas/valores que não pertencem à transferência confirmada e autorizada.
3. É impossível projetar destino sem AUTORIZADA real.
4. Uma autorização repetida aplica exatamente um conjunto de efeitos idempotentes.
5. O retry usa a fotografia e o número persistidos pela plataforma.
6. A reconciliação Delphi usa dados reais e bloqueia divergências.
7. O caminho nominal produz XML/artefatos/estado pela plataforma comum, sem pipeline paralelo.

Não alterar o escopo operacional nem criar NF-e de entrada automática.
