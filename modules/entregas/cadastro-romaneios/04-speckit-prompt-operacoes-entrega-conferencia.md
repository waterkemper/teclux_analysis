# Prompt para /speckit.specify — operações de entrega e conferência

```text
/speckit.specify

Crie a especificação funcional e técnica das operações de conferência e entrega do Cadastro de Romaneios, quarta de seis specs, sobre as specs 01–03. Cubra Conferir volumes, recebimento, Liberar/Reter, justificativa, Atendimento/Reagendamento, movimentações e assinatura. Não altere CRUD/financeiro nem implemente relatórios.

Não implemente. Inspecione o checkout e cite integrações. Autoridades em modules/entregas/cadastro-romaneios/: pesquisa-interface-delphi.md, pesquisa-sql-dominio-efeitos-delphi.md, interface-operacoes-componentes.md, modelo-dominio-coexistencia-transacoes.md, seguranca-menu-parametros.md e schema/README.md + funções.

## Capacidades e provas

Backend calcula capacidades por módulo, ação, Filiais, Situação do Romaneio/Item e prova. UI apenas apresenta; cada comando revalida depois dos locks.

Recebimento, Liberar e Reter exigem prova curta de reautenticação do Autorizador, sem inventar perfil de gerente. A prova é de uso único, expira, vincula Operador, Autorizador, ação, Romaneio, Filiais, Itens/campos, revisão e hash do payload, e segue issued→reserved→consumed atomicamente. Operador ainda precisa da capability. Rate limit/auditoria não registram credencial.

## Conferência

Modal amplo exibe documentos, chave redigida quando aplicável, volumes e contadores conferidos/não conferidos. Leitura por Enter, Recomeçar com confirmação e F8 para gravar. Use RPS em PASSAGEM e ROS nos demais casos confirmados; somente documentos não cancelados.

Chame incluirconferenciadocumentos e respeite efeitos em conferencia, volumesdadosfiscais e volumesdadosfiscaisconferencia. Não os duplique em PHP. Gravação, situação, auditoria e idempotência são uma transação.

## Recebimento, liberação e retenção

- Recebimento segue guards confirmados de Romaneio Normal/situação de saída; horário anterior ao trânsito é tratado pela política autoritativa e instante PostgreSQL.
- Liberar F10 somente para Normal+CONFIRMADA, ação “LIBERAR ENTREGA”, gravando usuário/instante de trânsito.
- Reter no mesmo espaço F10 somente para Normal+EM TRÂNSITO, ação “RETER ENTREGA”, limpando campos mutáveis previstos e preservando auditoria.
- Ambas chamam Atualizar_situacao_romaneio e releem o resultado. Não engolir exceções.

## Justificativa e integrações

Modal Justificar nos estados confirmados. Diferencie limpar campos de registrar tentativa. Sem limpeza, Motivo tipo E, data/hora e observação são obrigatórios. Atendimento e Reagendamento abrem integrações contextuais somente se existirem no Laravel; ausência vira lacuna, não link inerte.

Movimentações é read-only set-based com tipo, Usuário, Filial, instante, volumes e resultado. Assinatura usa visualizador seguro; não exponha Base64 bruto, storage path ou dado não autorizado.

## Concorrência, interface e atalhos

Cada comando usa revisão, idempotência e locks da spec 01; relê capacidade/prova após locks; consome prova no commit. Escrita Delphi concorrente invalida revisão/prova. Falha em conferência, agenda, situação, prova ou auditoria reverte tudo.

Todos os fluxos usam modais do projeto com contexto, trap/retorno de foco, dirty state e uma superfície ativa. F8 confirma; Esc cancela o mais interno; modal suspende atalhos da página. Texto/ícone acompanham cor; busy tem feedback.

## Critérios de aceite

- [ ] Matriz de estados permite/proíbe cada operação no frontend e backend.
- [ ] RPS/ROS e incluirconferenciadocumentos são usados sem efeito duplicado.
- [ ] Recebimento/Liberar/Reter exigem prova e capability do Operador.
- [ ] Provas cross-action/Romaneio/Filial/revisão/payload, expiradas e repetidas são rejeitadas.
- [ ] F10 não mostra Liberar e Reter simultaneamente; F8 grava o modal.
- [ ] Justificativa valida/foca e limpar é intenção distinta.
- [ ] Histórico/assinatura não vazam dados nem executam N+1.
- [ ] Concorrência invalida revisão/prova sem commit parcial.
- [ ] Falhas são acionáveis e auditadas.

## Fora de escopo

- cancelar/estornar pagamento;
- criar Atendimento/Reagendamento inexistente;
- relatórios da spec 05;
- reimplementar funções/triggers em PHP.
```
