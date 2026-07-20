# Envio genérico de documentos por e-mail

Label: wayfinder:map

## Destination

Produzir uma análise de lacunas baseada em evidências e um contrato funcional/técnico para substituir o envio atual de Orçamentos no Laravel por um modal e uma capacidade genérica de envio de documentos, preparada para Contratos e outros módulos, pronta para posterior `$to-spec`, sem implementação neste workspace.

## Notes

- Tratar `delphi/` e `laravel/` como somente leitura. Analisar PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, units compartilhadas, queries, eventos, actions, parâmetros e permissões.
- Toda descoberta deve ser classificada como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA e apontar evidência concreta.
- Orçamentos é o primeiro e único consumidor integrado nesta entrega. Contratos e outros módulos devem poder adotar posteriormente o mesmo modal e serviço por contexto/adaptador.
- O modal terá múltiplos destinatários em `Para`, um por linha ou separados por ponto e vírgula; não terá CC nem CCO nesta etapa.
- O destinatário inicial será o e-mail do próprio Orçamento. Se ausente, ficará em branco; não usar o usuário logado como destinatário substituto.
- O Orçamento será enviado no corpo HTML, sem PDF anexado. Anexos ficam como capacidade futura.
- Assunto padrão: `Orçamento <código>`. Introdução e conclusão partem dos textos configurados, com defaults neutros quando ausentes. Referência parte de `Orçamento`.
- O corpo estruturado é gerado pelo sistema e somente visualizado; introdução, referência e conclusão são editáveis no modo Laravel.
- O modo de entrega é automático e informado, não escolhido pelo usuário: `UsaitecLUX` ativo grava em `email_orcamento`; inativo enfileira o envio pelo Laravel.
- No modo site/e-commerce, assunto e referência são somente leitura porque a tabela legada grava apenas `codigo`, `orcamento`, `introducao`, `conclusao` e `emaildestinatario`.
- No modo Laravel, o envio é assíncrono. Configurações técnicas de SMTP/remetente são resolvidas no servidor e não aparecem no modal.
- Registrar Atendimento: `envio solicitado/agendado` após inserção bem-sucedida no modo site; `enviado` somente após sucesso da fila Laravel; falhas devem produzir estado de falha com detalhe técnico seguro.
- Disponibilidade em Orçamentos: documento salvo, situação Aberto (`A`), autorização de analista de crédito quando exigida e permissão específica de envio.
- A solicitação deve ter identificador único e idempotência contra clique repetido/repetição HTTP. Um reenvio intencional por nova abertura do modal permanece permitido.
- Nenhuma implementação, migration, Composer, npm, build, formatador ou gerador será executado neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Origem e resolução exatas de `UsaitecLUX`, dos textos configurados e das credenciais/remetente por filial no Laravel.
- Contrato genérico entre o modal, o contexto do documento, o compositor HTML e os adaptadores de entrega.
- Conteúdo integral e regras de formatação de `MontarOrcamento`, incluindo produtos, serviços, planos, dados da filial e placeholders.
- Semântica operacional do consumidor externo de `email_orcamento`, inclusive sinalização de sucesso/falha após a inserção.
- Modelo persistente para acompanhar solicitações Laravel, idempotência, tentativas e resultado sem confundir aceitação com entrega.
- Matriz completa de permissões, parâmetros e pré-condições do Delphi e sua equivalência no Laravel.
- Forma de registrar Atendimento a partir de jobs assíncronos e de evitar registros duplicados.
- Estratégia de testes dos dois modos sem envio externo real.

## Out of scope

- Integrar Contratos ou qualquer outro módulo Laravel nesta entrega.
- Anexar PDF, arquivos, CC ou CCO.
- Alterar o modelo ou consumidor do site/e-commerce.
- Expor ou permitir editar host SMTP, usuário, senha ou remetente técnico.
- Alterar arquivos em `delphi/` ou `laravel/`.
- Implementar código funcional neste workspace.

