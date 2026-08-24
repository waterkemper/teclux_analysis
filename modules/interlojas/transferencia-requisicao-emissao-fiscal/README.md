# Emissão Fiscal da Transferência de Requisição entre Filiais

Este diretório contém a especificação complementar para a emissão fiscal originada por Transferência de Requisição para Exposição.

## Artefatos

- [Especificação autoritativa](especificacao.md)
- [Prompt único para /speckit.specify](01-speckit-prompt-fiscal-transferencia.md)
- [Prompt de complementação da implementação real](02-speckit-prompt-completar-integracao-real.md)
- [Prompt incremental de consolidação da coreografia e DANFE](24-speckit-prompt-specify-consolidacao-coreografia-danfe.md)
- [Prompt corretivo pós-implementação do prompt 24](25-speckit-prompt-specify-correcao-pos-implementacao-24.md)
- [Prompt corretivo pós-implementação do prompt 25](26-speckit-prompt-specify-correcao-pos-implementacao-25.md)
- [Prompt corretivo pós-implementação do prompt 26](27-speckit-prompt-specify-correcao-pos-implementacao-26.md)
- [Prompt corretivo pós-implementação do prompt 27](28-speckit-prompt-specify-correcao-pos-implementacao-27.md)
- [Prompt de simplificação operacional e paridade Delphi](29-speckit-prompt-specify-simplificacao-operacional-paridade-delphi.md)
- [Prompt corretivo da primeira NF-e sem conteúdo fiscal](30-speckit-prompt-specify-correcao-primeira-nfe-conteudo-fiscal.md)

## Prompts complementares

- [Prompt 33 — PRÓXIMO: fechamento da NF-e, impostos legados, transmissão e DANFE](33-speckit-prompt-specify-fechamento-nfe-impostos-transmissao-danfe.md)
- [Prompt 34 — PRÓXIMO: modal operacional e sincronização da tela](34-speckit-prompt-specify-sincronizacao-pos-confirmacao-e-emissao.md)
- [Prompt 35 — homologação real da NF-e de transferência](35-speckit-prompt-specify-impostos-legados-e-transmissao-real.md)
- [Prompt 31 — Paridade de impostos e natureza de produção própria](31-speckit-prompt-specify-paridade-impostos-natureza-producao-propria.md)
- [Prompt 32 — Geração imediata da chave NF-e com paridade Delphi](32-speckit-prompt-specify-chave-nfe-imediata-paridade-delphi.md)
- [Prompt 43 — Templates versionados para etiquetas de volumes e migração de `.fr3`](43-speckit-prompt-specify-template-etiqueta-volume-modelosetiquetas.md)

Rascunhos posteriores, ainda não executar:

- [Rascunho IBS/CBS](33-speckit-prompt-specify-ibs-cbs-paridade-delphi-atualizado.md)
- [Rascunho transmissão ponta a ponta/DANFE](36-speckit-prompt-specify-fechamento-transmissao-ponta-a-ponta.md)

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
