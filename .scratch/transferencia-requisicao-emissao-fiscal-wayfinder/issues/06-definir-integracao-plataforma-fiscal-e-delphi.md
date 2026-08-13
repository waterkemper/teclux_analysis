# Definir a integração com a plataforma fiscal e a convivência Delphi

Type: grilling
Status: resolved
Blocked by: 02, 03, 04, 05

## Question

Como a transferência invoca a plataforma comum de Emissão Fiscal Eletrônica: origem/idempotência, Fotografia, Série Fiscal, Contribuinte/Filial, Vínculo de Certificado, comandos, filas, SEFAZ, contingência, Artefatos, distribuição, espelhamento Delphi, eventos e Transferência Administrativa? Decidir como impedir pipeline fiscal paralelo e como reconciliar mudança ou emissão iniciada no Delphi.

## Answer

A origem cria uma Emissão Fiscal comum com chave idempotente por Transferência, Filial Requisitante, operação e hash das linhas. A fotografia é entregue ao pipeline existente, que controla série, certificado, comandos, filas, SEFAZ, contingência, artefatos, distribuição e reconciliação. Laravel e Delphi compartilham seriesfiliais e a identidade de origem; documento já criado no Delphi é reconciliado, e documento Laravel é apenas espelhado no Delphi. Não há gateway ou fila paralelos. Decisão consolidada em [especificacao.md](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md), DECISÃO-TRF-FISCAL-007 e REQ-TRF-FISCAL-014, 021 a 024.
