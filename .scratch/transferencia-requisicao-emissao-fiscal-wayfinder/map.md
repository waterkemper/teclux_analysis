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
- [Auditar o pós-status: emissão fiscal, estoque e impressão da Transferência](issues/18-auditar-pos-status-emissao-estoque-e-impressao.md) — após o status SEFAZ e certificados, a plataforma comum já aloca/transmite e gera DANFE padrão, mas a confirmação operacional já movimenta estoque e a ponte fiscal ainda não define a projeção legada, etiquetas ou DANFE simplificada.

- [Definir a coreografia de estoque, emissão e projeção legada](issues/19-definir-coreografia-estoque-emissao-e-projecao-legada.md) — confirmação e preparação fiscal atômicas; numeração com FOR UPDATE; movimentos existentes como único efeito de estoque, vinculados ao documento fiscal; transmissão após commit; estados operacional e fiscal separados; retries sem novo número e inutilização manual posterior no Delphi.
- [Definir DANFE padrão, DANFE simplificada e etiquetas da Transferência](issues/20-definir-danfe-simplificada-e-etiquetas.md) — DANFE padrão e volumes são comprovados; DANFE simplificada e etiquetas não foram localizadas no fluxo e exigem decisão explícita antes de qualquer renderer ou impressão adicional.
- [Decidir DANFE simplificada da Transferência](issues/22-decidir-danfe-simplificada-transferencia.md) — DANFE simplificada fica fora desta spec; será usado somente PDF DANFE padrão do nfeProc autorizado, via renderer fiscal comum, com artefato versionado, orientação retrato, uma cópia e sem UniDANFE/impressão automática.
- [Decidir etiquetas de mercadoria e volume da Transferência](issues/23-decidir-etiquetas-transferencia.md) — etiquetas ficam fora desta spec; não há regra Delphi comprovada e o tema será detalhado posteriormente em etapa/spec própria, sem ligação implícita com emiteetiqueta ou impressoras gerais.
- [Consolidar a spec completa da emissão da Transferência](issues/21-consolidar-spec-completa-emissao-transferencia.md) — prompt incremental 24 publicado com a coreografia atômica, numeração pessimista, vínculo fiscal dos movimentos, reconciliação Delphi, DANFE PDF e exclusões de etiquetas, DANFE simplificada, UniDANFE, entrada e financeiro.

- [Pesquisar lotes, agrupamentos e atendimento parcial da Transferência](issues/24-pesquisar-lotes-agrupamentos-e-saldo-parcial-delphi-laravel.md) — confirmou que o lote operacional não separa NF; o parâmetro de saldo já existe, com ajuste textual e validação da filial física pendentes no ticket de auditoria.

- [Definir reabertura por saldo pendente apos a emissao da Transferencia](issues/25-definir-reabertura-saldo-pendente-pos-emissao.md) — confirmou o ciclo atomico da linha original e da nova requisicao de saldo; autorizacao SEFAZ posterior nao reabre a transferencia.
- [Confirmar romaneio e etiquetas de volumes no encerramento da Transferência](issues/26-confirmar-romaneio-e-etiquetas-de-volumes-no-delphi.md) — confirmou a pergunta condicional de romaneio via Perpetrar/trigger, o vínculo antes da tela de etiquetas e a expansão de etiquetas de volume por quantidade; Laravel fica em PDF e sem impressão automática nesta etapa.

- [Auditar a implementação Laravel após as decisões de lotes e pós-emissão](issues/27-auditar-laravel-contra-lotes-saldo-romaneio-etiquetas.md) — confirmou agrupamento, locks, idempotência, vínculos fiscais, movimentos e saldo parcial; os prompts 40 e 41 cobrem somente o handoff de romaneio e o PDF de etiquetas por volume.

 - [Pesquisar `cBenef` no Delphi e no Laravel](issues/28-pesquisar-cbenef-delphi-laravel.md) — confirmou cálculo por item via `Codigo_cBenef` no Delphi e ausência de resolução/serialização no fluxo fiscal da Transferência; o prompt 42 cobre a lacuna sem reimplementar a regra do banco.

- [Pesquisar `modelosetiquetas` e `.fr3` para etiquetas de volumes](issues/29-pesquisar-modelosetiquetas-fr3-delphi-laravel.md) — confirmou que o Delphi referencia arquivos FastReport externos e carrega um layout padrão para volumes; o Laravel deve usar contrato de dados + templates versionados HTML/CSS sobre Browsershot, deixando `.fr3` para conversão futura; o prompt 43 corrige a fronteira do prompt 41.

## Not yet specified

No further in-scope decision is currently uncharted. The route ends with the
complementary prompts 40–43; implementation remains outside this map.



## Scope extension requested on 2026-08-20

The prior closed decisions 22 and 23 recorded DANFE simplificada and etiquetas as outside the then-current fiscal specification. The user has now supplied new Delphi evidence and explicitly reopened the investigation. Those decisions remain historical; they are not silently overwritten. Tickets 24–27 investigate and, only after evidence is resolved, may supersede the affected boundary in a new complementary spec.

Tickets 24–27 are resolved; the resulting scope is captured in prompts 40 and
41 below. Ticket 29 is also resolved; its template decision is captured in
prompt 43 below.

This extension covers only:

- operational lots/agrupamentos and their relationship to fiscal groups;
- parameterized creation of a new requisition for an unfulfilled quantity;
- the post-emission handoff to romaneio, volume records and labels.

The current labels extension also defines only the safe, PDF-oriented template
boundary for transfer volumes; product-label migration remains future work.

It does not authorize implementation or automatic printer integration. The final output remains one or more `/speckit.specify` prompts.

## Out of scope

- Implementar Laravel, alterar Delphi, aplicar migrations ou alterar o banco.
- Reespecificar a plataforma fiscal NF-e/NFC-e já fechada; este mapa apenas define sua integração com a transferência.
- Reabrir as decisões operacionais do mapa original sem evidência de conflito.
