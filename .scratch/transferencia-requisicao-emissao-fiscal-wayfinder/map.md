# Wayfinder — Emissão Fiscal da Transferência de Requisição entre Filiais

Label: wayfinder:map

## Destination

Produzir uma especificação complementar, rastreável e pronta para /speckit.specify que defina como a **Transferência de Requisição para Exposição** cria e conclui seus documentos fiscais, reutilizando a plataforma de Emissão Fiscal Eletrônica já especificada no Laravel e preservando a convivência com o Delphi.

O mapa deve esclarecer a fronteira entre confirmação operacional, NF-e de saída, eventual documento fiscal de entrada, estoque, financeiro, contratos/crédito, Artefatos Fiscais e projeções legadas. Não deve implementar o módulo nem reabrir silenciosamente o mapa operacional original.

## Notes

- Este é um esforço complementar ao mapa [Transferência de Requisição para Exposição](../transferencia-requisicao-exposicao-wayfinder/map.md), que deliberadamente excluiu emissão fiscal.
- A plataforma fiscal já especificada em [Emissão Fiscal Eletrônica no Laravel](../emissao-fiscal-eletronica-laravel-wayfinder/map.md) é autoridade para Emissão, Fotografia, numeração, certificado, SEFAZ, reconciliação, Artefatos, eventos e distribuição.
- O módulo operacional continua autoridade para Requisição, Transferência, Lote, Conferência, Estoque, Reserva, Movimento, cancelamento/reabertura e sua paridade Delphi.
- Usar /domain-modeling e o vocabulário de laravel/CONTEXT.md; distinguir Requisição entre Filiais, Transferência, Emissão Fiscal Eletrônica, Documento Fiscal de Saída, Documento Fiscal de Entrada, Filial e Contribuinte Fiscal.
- Toda decisão deve classificar evidências como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA.
- Não criar um contador, gateway, certificado, fila ou agregado fiscal paralelo. A saída fiscal deve usar o pipeline comum da plataforma fiscal.
- O mapa termina na publicação da spec/prompt complementar; a implementação fica fora deste esforço.

## Decisions so far

- [Pesquisar o fluxo fiscal da Transferência de Requisição no Delphi](issues/01-pesquisar-fluxo-fiscal-transferencia-delphi.md) — a jornada legada agrupa uma NF-e por Filial Requisitante, distingue transferência/venda/devolução pela raiz de CNPJ, numera antes do commit, transmite depois e admite persistência parcial em falhas.
- [Definir o documento e os papéis fiscais da transferência](issues/02-definir-documento-e-papeis-fiscais-transferencia.md) — NF-e modelo 55 de saída, FilialBase emitente, Filial Requisitante destinatária, sem NF-e de entrada automática e sem inferência por raiz de CNPJ.
- [Definir a fronteira entre confirmação e emissão](issues/03-definir-fronteira-atomica-confirmacao-emissao.md) — transação curta por grupo, fotografia/número/outbox antes do commit, rede depois e pendência explícita em falhas.
- [Definir o mapeamento para a Fotografia Fiscal](issues/04-definir-fotografia-mapeamento-fiscal-transferencia.md) — todos os dados resolvidos e imutáveis antes da selagem; conflitos bloqueiam.
- [Definir os efeitos do destino](issues/05-definir-efeitos-destino-financeiro-contabil.md) — projeção idempotente após autorização, sem NF-e de entrada, com efeitos legados condicionais para venda.
- [Definir a integração fiscal e convivência Delphi](issues/06-definir-integracao-plataforma-fiscal-e-delphi.md) — uso exclusivo do pipeline comum, numeração compartilhada, reconciliação e espelhamento.
- [Consolidar a spec fiscal da transferência](issues/07-consolidar-spec-fiscal-transferencia.md) — spec e prompt único publicados no módulo interlojas.
- [Auditar a implementação fiscal das transferências](issues/08-auditar-implementacao-e-atualizar-prompts.md) — a feature 332 foi comparada com a spec; as lacunas de produção foram registradas e o prompt 02 foi publicado.
- [Revisar o código atualizado e gerar prompt SpecKit de correção](issues/09-revisar-codigo-atual-e-gerar-prompt-specify.md) — após 861a351e, seis lacunas remanescentes foram registradas e o prompt 09 foi publicado; o escopo segue somente Transferencia.
- [Definir prontidão para teste real em homologação](issues/10-definir-prontidao-teste-real-homologacao.md) — a revisão confirmou que a ponte ainda não pode autorizar uma NF-e real: o gateway NFePHP permanece skeleton, além das lacunas F-01 a F-06; a auditoria 07 e o prompt 10 definem os bloqueadores, o checklist e o smoke test.

## Not yet specified

- A especificação incremental de prontidão para homologação real ainda precisa ser implementada; H-01/H-02 bloqueiam o primeiro teste real. O ambiente também depende de UF/filial, credenciamento, certificado, endpoint e runtime suportado.

## Out of scope

- Implementar Laravel, alterar Delphi, aplicar migrations ou alterar o banco.
- Reespecificar a plataforma fiscal NF-e/NFC-e já fechada; este mapa apenas define sua integração com a transferência.
- Reabrir as decisões operacionais do mapa original sem evidência de conflito.
