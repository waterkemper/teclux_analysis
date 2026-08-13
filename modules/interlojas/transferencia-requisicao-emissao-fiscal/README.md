# Emissão Fiscal da Transferência de Requisição entre Filiais

Este diretório contém a especificação complementar para a emissão fiscal originada por Transferência de Requisição para Exposição.

## Artefatos

- [Especificação autoritativa](especificacao.md)
- [Prompt único para /speckit.specify](01-speckit-prompt-fiscal-transferencia.md)
- [Prompt de complementação da implementação real](02-speckit-prompt-completar-integracao-real.md)

## Autoridade e fronteira

Este módulo integra três contratos já existentes:

1. O mapa operacional de [Transferência de Requisição para Exposição](../../../.scratch/transferencia-requisicao-exposicao-wayfinder/map.md) é autoridade para Requisição, Transferência, Lote, Conferência, Estoque, Reserva, Movimento, cancelamento, reabertura e paridade Delphi.
2. A especificação da [Plataforma de Emissão Fiscal Eletrônica](../../../.scratch/emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md) é autoridade para Fotografia Fiscal, numeração, certificados, SEFAZ, comandos, filas, reconciliação, Artefatos, eventos, distribuição e espelhamento Delphi.
3. Esta especificação é autoridade somente para a origem Transferência de Requisição e para a coordenação entre os dois contratos.

Não criar um gateway, contador, certificado, fila, agregado ou pipeline fiscal paralelo.

## Ordem de uso

Executar o prompt 01 para o desenho-base e o prompt 02 após revisar a implementação 332. O segundo prompt fecha a integração real, fotografia autoritativa, autorização por evento, efeitos idempotentes e reconciliação Delphi.

## Estado da implementação revisada

A feature 332 já possui grupos, idempotência, dry-run, endpoints e testes com Fake. Ela ainda não deve ser tratada como emissão fiscal de produção: o adapter real está incompleto, o container usa Fake, a projeção é manual e a fotografia aceita dados do request. Essas lacunas estão formalizadas em REQ-TRF-FISCAL-025 a 038.

Executar o prompt único consumindo os dois contratos acima. O resultado esperado do /speckit.specify é uma especificação de implementação, plano, contratos, testes e critérios de aceite; não implementar código durante a especificação.
