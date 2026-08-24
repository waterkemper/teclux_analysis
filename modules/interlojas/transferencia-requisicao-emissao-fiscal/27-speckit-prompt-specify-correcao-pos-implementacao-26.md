# Prompt /speckit.specify - pos-implementacao do prompt 26

Revise o Laravel no commit fe1f6de4 contra o prompt 26, a spec
specs/397-fix-trf-vinculo-lookup/, contratos, ADR e os contratos vigentes de
fiscal e Transferencia de Requisicao para Exposicao. Nao implemente codigo:
produza apenas spec, plano, tarefas, contratos, testes, aceite e quickstart.

## Decisoes fechadas

- Escopo somente Transferencia de Requisicao para Exposicao.
- A fonte autoritativa e pedidosfiliais.dadofiscal lido no banco no momento
  da operacao; payload da tela nunca prevalece.
- Mesmo dadofiscal positivo em todas as linhas: documento ja associado, sem
  nova numeracao, transmissao ou movimento.
- Nenhum dadofiscal positivo: nova preparacao Laravel, desde que movimentos
  exigidos estejam comprovados.
- Valores positivos diferentes ou associacao parcial: bloqueio e pendencia.
- Sem dadofiscal, nunca procurar NF Delphi orfa nem consultar genericamente
  notas/dadosfiscais. Com dadofiscal positivo, consultar somente esse numero
  ja conhecido.
- Vinculo fiscal e movimentos persistidos fecham a transferencia,
  independentemente da autorizacao SEFAZ.
- Cancelamento/inutilizacao sao de Estoque -> Notas Fiscais Avulsas.
- Fora de escopo: venda/devolucao, entrada, NFS-e, financeiro, etiquetas,
  DANFE simplificada, UniDANFE, impressoras e pipeline paralelo.

## Correcoes obrigatorias

### 1. Emitir: leitura atomica

O caminho emitir deve reler as linhas atuais completas por seus codigos e
bloquea-las com FOR UPDATE dentro da mesma transacao que:

1. classifica dadofiscal;
2. prova movimentos;
3. reserva numero com FOR UPDATE;
4. vincula pedidosfiliais e movimentos permitidos;
5. persiste o grupo Cloud.

Nao usar fotografia antiga mesclada apenas com dadofiscal/situacao. Testar
alteracao concorrente depois da abertura da tela e provar que a emissao
observa o valor atual sem alocacao indevida. Reutilizar repositorios,
servicos e contador existentes.

### 2. Saneamento: prova completa

Nao basta existir algum SPT/SET. O conjunto esperado deve ser derivado do
grupo e da regra operacional, conferindo pedido, produto, quantidade, filial,
referencia e campos contratuais. Considerar SPT, SET e, quando gerados pela
regra aplicavel, TPE, TFR e TEP.

Ausencia, duplicidade, divergencia ou dadofiscal de outro documento deve
gerar pendencia antes de numero/outbox. Saneamento apenas vincula/corrige
registros existentes: nunca insere movimento, recalcula saldo ou cria nova
confirmacao. Corrigir numerosConfirmacaoSemDadofiscal e o vinculo para
cobrirem todos os tipos permitidos. Replay apenas devolve estado persistido.

### 3. Emitir: pendencia duravel

Conflito de dadofiscal, associacao parcial, documento ilegivel, movimentos
incompletos e divergencias devem usar o servico de pendencia de grupo
existente, antes de propagar erro pelo controller/lote. A operacao deve ser
idempotente por grupo, request/correlation id e codigo, preservar fotografia,
identidade e documento, e retornar identificador/estado. Falha de prova nao
altera situacao nem reserva numero. Cobrir individual e lote.

### 4. DANFE: falha duravel e idempotente

Revisar GerarDanfeArtefatoService para proteger tambem leitura nfeProc e
consulta de reuso, alem de hash, renderer, persistencia, outbox e custodia.
Toda falha deve criar/atualizar pendencia duravel, inclusive sem grupo.
Pendencia sem grupo deve ter chave estavel por emissao/codigo e incrementar
tentativa, nao inserir incidente append-only. Sanitizar mensagem/codigo e
correlacao antes de auditoria/JSON; falha da auditoria nao pode impedir a
pendencia principal. Reimpressao reutiliza XML/hash/versao. DANFE nao reabre
transferencia nem altera autorizacao, movimentos ou vinculo.

### 5. Conformidade

Se ainda aplicavel, remover skipDelphiReconcile sem consumidor, centralizar
pendencia repetida sem mover regra para controller/DTO, manter predicados no
dominio e validacao no FormRequest, sanitizar legado e nao usar Schema.has*
em runtime.

## Testes e entregaveis

Provar: lock ate persistencia; dadofiscal atual; ausencia de busca generica;
documento ja vinculado sem efeitos duplicados; conjunto completo SPT/SET e
TPE/TFR/TEP quando aplicaveis; bloqueio sem numero/outbox; saneamento sem
movimentos; pendencias duraveis idempotentes em individual/lote; todas as
falhas DANFE; replay preservando estado; e ausencia de efeitos fora do
escopo.

Entregar spec, matriz achado-requisito-tarefa-teste, contratos de leitura,
prova, pendencia e DANFE, plano, quickstart, aceite e lista de exclusoes.
Nao alterar codigo nesta execucao do /speckit.specify.
