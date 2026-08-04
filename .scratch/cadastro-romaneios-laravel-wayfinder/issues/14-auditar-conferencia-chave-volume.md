# Auditar conferencia por chave e por chave + volume

Type: task
Status: resolved
Blocked by: 07, 08, 11, 12, 13

## Question

Como funciona hoje a tela Laravel de conferencia de notas/volumes no Cadastro de Romaneios, em comparacao com o fluxo Delphi, especialmente nos modos de conferencia por chave NF-e e por chave + volume? Quais erros, estados, validacoes, efeitos transacionais, autorizacoes, feedbacks e lacunas devem ser corrigidos, e qual prompt autocontido deve orientar o ajuste sem implementar o modulo nesta jornada?

## Answer

A auditoria confirmou que a tela atual nao implementa a conferencia por leitura: o campo recebe texto, mas ConferirVolumesModal.tsx:80-85 descarta o valor e useCadastroRomaneiosOperacoes.ts:172-190 incrementa o primeiro Documento Fiscal pendente. O POST envia apenas dadofiscais (useCadastroRomaneiosOperacoes.ts:214-230), e o handler aceita somente o conjunto completo de Documentos elegiveis (ConferirRomaneioHandler.php:64-76). Portanto, a tela nao distingue chave, chave + volume, duplicidade, volume especifico ou conferencia parcial.

### Semantica confirmada

- CONFIRMADO — chave: romaneios.tipo = 'N'. fmcadastroromaneios.pas:628-638 passa o tipo do Romaneio a tela; fmConferenciaDocumentos.pas:227-251 localiza chv_nfe.
- CONFIRMADO — chave + volume: romaneios.tipo = 'T'. fmConferenciaDocumentos.pas:257-283 localiza chv_nfevolumes; fmConferenciaDocumentos.dfm:480-484 comprova a composicao chv_nfe + lpad(nrvolume,3) + lpad(volume,3).
- CONFIRMADO — identidade de persistencia: uma unidade e (tipo,codigo,dadofiscal,numerovolume,nrvolume), pela chave pkvolumesdadosfiscaisconferencia no snapshot postgresql-authoritative-2026-08-01.json.
- CONFIRMADO — granularidade: Delphi marca a linha encontrada e grava volumesdadosfiscaisconferencia (fmConferenciaDocumentos.pas:223-289,699-712); nao transforma uma leitura em todos os volumes do Documento.
- CONFIRMADO — parcialidade: o fluxo Delphi permite salvar o conjunto atual e recalcula a situacao; nao exige todos os Documentos completos antes de salvar (fmConferenciaDocumentos.pas:699-712, dmcadastroromaneios.pas:1076-1081).
- CONFIRMADO — ptipo: RPS para situacao PASSAGEM, ROS nos demais casos (fmcadastroromaneios.pas:628-638). Isso e distinto do modo de leitura N/T.

### Erros e divergencias identificados

- POSSIVEL BUG ATUAL: o conteudo lido nao participa do matching; Enter vazio tambem pode alterar contadores.
- POSSIVEL BUG ATUAL: o frontend escolhe o primeiro Documento pendente e simula uma contagem local, sem identidade estavel de volume.
- POSSIVEL BUG ATUAL: LegacyRomaneioConferenciaRepository.php:21-25 chama incluirconferenciadocumentos por Documento Fiscal. A funcao SQL functions-2026-08-01.sql:162-168,206-243 gera/marca todos os volumes do Documento, incompativel com uma leitura individual.
- POSSIVEL BUG ATUAL: o handler rejeita o salvamento parcial ao comparar o payload com todos os Documentos elegiveis.
- POSSIVEL BUG ATUAL: o bootstrap conta linhas de volumesdadosfiscais (LegacyRomaneioConferenciaBootstrapReadRepository.php:62-65) em vez de expandir coalesce(nullif(volumes,0),1) por generate_series; uma declaracao de tres volumes pode aparecer como uma unidade.
- POSSIVEL BUG ATUAL: o bootstrap executa a contagem de volumes dentro do loop de Documentos e, portanto, tem N+1.
- DIVERGENTE: resetConferirLocal restaura o snapshot inicial, enquanto o Recomecar Delphi limpa as marcacoes da sessao em edicao; o prompt deve separar Recomecar, Cancelar/Esc e F8.
- DIVERGENTE: chave_nfe_redigida e apresentacao e nao pode ser usada para matching; o contrato atual nao fornece modo N/T nem unidades esperadas.
- POSSIVEL BUG LEGADO, nao reproduzir: Locate('chv_nfe') e uma busca por chave sem uma identidade explicita de proxima unidade quando existem varios volumes; a adaptacao Laravel deve consumir deterministicamente o proximo nrvolume pendente no modo N.
- DECISAO NOVA: preservar a granularidade de volume no Laravel, aceitar gravacao parcial e usar payload por (dadofiscal,numerovolume,nrvolume), com revalidacao e locks no backend.

O prompt corretivo novo e autonomo esta em modules/entregas/cadastro-romaneios/09-speckit-prompt-correcao-conferencia-chave-volume.md. Ele deve ser executado depois do prompt 04 ja aplicado, sem reexecuta-lo. Separa ptipo de modo de leitura, exige bootstrap set-based, matching exato, feedback para desconhecida/duplicada/cancelada, Recomecar correto, F8 parcial, persistencia trigger-aware, concorrencia, idempotencia e suite PostgreSQL real.

Nenhum codigo Laravel/Delphi, migration aplicada ou banco foi alterado; foram atualizados somente o prompt, o indice, o glossario, este ticket e o mapa.
