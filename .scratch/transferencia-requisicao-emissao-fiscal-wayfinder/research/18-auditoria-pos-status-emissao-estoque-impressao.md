# Auditoria pós-status — emissão, estoque e impressão da Transferência

Data: 15 de agosto de 2026  
Base Laravel: `232edfce` (`fiscal 33`)

## Conclusão

O status de serviço no SEFAZ e o cadastro de certificados estão funcionando, mas isso apenas libera a infraestrutura fiscal comum. A emissão completa da Transferência ainda precisa fechar a coordenação com o fluxo operacional de estoque e os documentos auxiliares.

## CONFIRMADO no Laravel

- `TransferenciaFiscalPlatformAdapter` usa a plataforma fiscal comum: fotografia selada, `AlocarEmissaoNfe55Service`, série compartilhada, emissão durável e outbox `fiscal-nfe`.
- `ProcessarAutorizacaoNfeJobHandler` serializa, valida XSD, assina, transmite, reconcilia o resultado e registra `nfeProc`/demais artefatos da Tentativa.
- `GerarDanfeArtefatoService` consegue gerar `DANFE_PDF` somente a partir de `nfeProc` íntegro e autorizado, usando `nfephp-org/sped-da`.
- A confirmação operacional (`TransferenciaRequisicaoConfirmarGroupHandler`) já bloqueia estoque, insere movimentos `SPT`/`SET`, pode inserir `TPE`/`TFR`, fecha os pedidos confirmados e trabalha com uma transação por grupo.
- A ponte fiscal, em `TransferenciaFiscalEfeitosDestinoService`, produz atualmente somente o efeito lógico `satisfacao_transferencia`; não insere novos movimentos, não baixa estoque e não cria NF-e de entrada.
- A rota operacional de impressão gera o relatório da requisição, não DANFE, etiqueta ou documento auxiliar da NF-e.

## CONFIRMADO no Delphi já pesquisado

- `ConfirmaRequisicao` agrupa por Filial Requisitante e, no fluxo fiscal legado, prepara dados fiscais, itens, volumes, movimentos, pedidos e série antes do commit; a transmissão, XML, DANFE e e-mail ocorrem depois.
- O Delphi chama `ImprimirDanfe` após a transmissão e usa a impressora de mercadorias configurada; a pesquisa existente não comprova uma implementação separada de etiqueta para este DataModule.
- A rotina legada também contém caminhos de `VendaTransferencia` e `DevolucaoTransferencia`, mas ambos permanecem fora desta ponte Laravel.

## DIVERGÊNCIA relevante

No Laravel, confirmação operacional e emissão fiscal são hoje operações separadas. Se a emissão fiscal tentar repetir os movimentos do Delphi, haverá risco de duplicar estoque. Se somente a confirmação operacional movimentar estoque, ainda falta definir quando e como `dadosfiscais`/`notas`/vínculos dos pedidos receberão o `dadofiscal` sem quebrar a idempotência ou a convivência Delphi.

## NÃO LOCALIZADO / pendente de decisão

- Contrato final entre movimento já confirmado, número fiscal alocado e vínculo dos `pedidosfiliais` ao `dadofiscal`.
- Mapeamento fiscal completo server-side de preço, CFOP, ICMS, PIS, COFINS, GTIN, volumes e demais campos que o Delphi obtém por `AtribuirDadosProdutos`/`CalcularImpostos`.
- Regra funcional de DANFE simplificada: formato, conteúdo, momento de disponibilidade, reimpressão e distinção em relação ao `tpImp` retrato.
- Regra de elegibilidade e conteúdo das etiquetas de mercadoria/volume, incluindo origem dos códigos e impressora/dispositivo.

## Consequência para a próxima spec

Não basta adicionar um botão “Emitir NF”. A spec precisa definir uma única coreografia idempotente entre confirmação, movimentos, número fiscal, autorização, projeção legada, DANFE padrão, DANFE simplificada e etiquetas, usando o pipeline fiscal comum e sem reintroduzir venda/devolução entre filiais.
