# Auditar fluxo Normal/Transferência, conferências e estados

Type: task
Status: resolved
Blocked by: 01, 02, 03, 06, 07, 08, 11, 14

## Question

Qual é o fluxo completo do Cadastro de Romaneios para os tipos Normal e Transferência, desde a inclusão dos Documentos Fiscais até a conferência de notas, conferência de volumes e transições de situação, e quais divergências existem na implementação Laravel atual? Consolidar em uma nova especificação pós-implementação, autocontida e baseada somente nas evidências legadas já registradas em modules/ e no checkout Laravel; não exigir que o Cursor consulte o código Delphi.

## Answer

**CONFIRMADO** — Normal (`N`) e Transferência (`T`) compartilham o agregado `romaneios`/`romaneiosnotas`, mas não compartilham a mesma semântica operacional. Normal inicia frete Emitente, aceita documentos não classificados como transferência, confere saída em ROS (ou RPS em PASSAGEM), libera em CONFIRMADA, transita e recebe/justifica por item. Transferência inicia frete Destinatário, exige documentos classificados por `ehnotafiscalsaidatransferencia`, mesma origem e mesmo destino/cliente, e deriva seus estados de ROS/ROE/ROP/RPS e da entrada de transferência; não deve receber as operações de venda de Normal.

**CONFIRMADO** — `Atualizar_situacao_romaneio` delega a `situacao_romaneio`; `situacao_romaneio_saida` é a autoridade por Documento. Para Normal, a função observa ABERTA/CONFIRMADA PARCIAL/CONFIRMADA antes do trânsito e EM TRÂNSITO/ENTREGUE PARCIAL/ENTREGUE após trânsito, com ENTREGA NÃO EFETUADA no estado por Documento e FECHADA por pagamento. Para Transferência, a função observa ABERTA/CONFIRMADA PARCIAL na saída e, após a saída, EM TRÂNSITO/PASSAGEM/ENTREGUE PARCIAL/ENTREGUE conforme ROE/ROP/RPS e `notaspag` de transferência; FECHADA tem precedência por pagamento.

**POSSÍVEL BUG ATUAL** — `CreateRomaneioHandler` usa frete `'1'` como fallback para qualquer tipo e não aplica âncoras de Transferência aos itens iniciais; `UpsertRomaneioItemHandler` também não passa âncoras na inclusão unitária. A proteção de mesma origem/cliente fica mais forte na inclusão múltipla do que nos demais caminhos. `CadastroRomaneiosAuthorizationService` anuncia recebimento para qualquer Romaneio, apesar de o guard aceitar apenas Normal. Leituras de situação/agregado ainda usam campo persistido diretamente, e o agregado conta linhas de `volumesdadosfiscais` em vez de unidades expandidas.

**POSSÍVEL BUG ATUAL / DIVERGENTE** — A arquitetura Laravel ainda descreve `incluirconferenciadocumentos` como escritor da conferência interativa, em conflito com o prompt 09: a função gera/marca todos os volumes do Documento e não pode ser usada para simular uma leitura individual.

**DECISÃO NOVA** — Foi publicado o prompt pós-implementação `modules/entregas/cadastro-romaneios/10-speckit-prompt-auditoria-fluxo-normal-transferencia-status.md`. Ele é independente dos prompts 04 e 09, incorpora as conclusões legadas e não manda o Cursor consultar o Delphi. O prompt exige contratos, correções, matriz tipo × situação × operação, conferência de notas/volumes, ROS/RPS/ROE/ROP, capabilities honestas, transações, testes e comparação com o Laravel atual.
