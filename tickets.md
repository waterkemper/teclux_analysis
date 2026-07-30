# Tickets: Emissão fiscal eletrônica no Laravel

Implementar no Laravel o ciclo completo de NF-e e NFC-e de saída, mantendo inicialmente o comportamento operacional do Delphi e seguindo a [especificação](.scratch/emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md).

Trabalhe a **fronteira**: pode ser iniciado qualquer ticket cujos bloqueadores estejam concluídos.

## Validar configuração fiscal versionada e gateway NFePHP

**What to build:** permitir que a equipe configure uma filial para uma combinação de UF, modelo e ambiente e comprove, em homologação, que a configuração, os schemas fiscais e o gateway NFePHP selecionados são compatíveis antes de tentar emitir uma nota.

**Blocked by:** None — can start immediately.

- [ ] Uma configuração fiscal identifica explicitamente filial, UF, modelo, ambiente e versões aplicáveis.
- [ ] Configurações inválidas ou incompatíveis são recusadas com diagnóstico acionável.
- [ ] Uma verificação executável comprova comunicação e validação de schema no ambiente de homologação sem emitir em produção.
- [ ] Segredos e dados sensíveis não aparecem em logs, respostas ou mensagens de erro.
- [ ] O comportamento possui testes automatizados para configurações válidas, inválidas e incompatíveis.

## Gerenciar certificado A1 por filial

**What to build:** permitir que um usuário autorizado cadastre, valide, substitua e acompanhe o certificado A1 usado por uma filial, sem expor o arquivo ou sua senha.

**Blocked by:** None — can start immediately.

- [ ] Apenas usuários autorizados conseguem cadastrar ou substituir um certificado.
- [ ] Arquivo e senha são armazenados de forma criptografada e nunca são devolvidos em texto aberto.
- [ ] O sistema valida senha, integridade, CNPJ e período de validade antes de ativar o certificado.
- [ ] Vencimento e proximidade do vencimento ficam visíveis para operação.
- [ ] Cadastro, substituição, falha de validação e uso são auditados sem registrar segredos.
- [ ] Os cenários de sucesso, certificado inválido, senha incorreta e acesso negado possuem testes automatizados.

## Criar emissão de NF-e avulsa com fotografia fiscal e numeração

**What to build:** permitir que uma Nota Fiscal de Saída avulsa válida seja preparada para emissão no Laravel, reservando seu número uma única vez e preservando uma fotografia imutável dos dados fiscais enviados à fila.

**Blocked by:** Validar configuração fiscal versionada e gateway NFePHP.

- [ ] Uma nota avulsa válida cria uma única Emissão Fiscal com modelo, série, número, ambiente e origem rastreáveis.
- [ ] A fotografia fiscal não muda quando os cadastros de origem são alterados posteriormente.
- [ ] A numeração é alocada transacionalmente por filial, modelo, série e ambiente, sem duplicidade sob concorrência.
- [ ] Repetir o mesmo comando não cria outra emissão, número, tentativa ou mensagem de saída.
- [ ] A emissão preparada e sua pendência podem ser consultadas pelo usuário autorizado.
- [ ] Criação, numeração e enfileiramento possuem auditoria e testes automatizados, inclusive de concorrência e idempotência.

## Autorizar NF-e pelo fluxo normal

**What to build:** processar uma NF-e preparada até sua autorização normal na SEFAZ, apresentando protocolo e situação final ao usuário e mantendo a situação legada coerente.

**Blocked by:** Gerenciar certificado A1 por filial; Criar emissão de NF-e avulsa com fotografia fiscal e numeração.

- [ ] O processamento assina, valida e transmite a fotografia fiscal usando configuração e certificado da filial.
- [ ] Cada interação externa registra uma tentativa rastreável, sem duplicar a emissão.
- [ ] Autorização e rejeição explícita produzem estados distintos e compreensíveis para o usuário.
- [ ] A autorização registra chave de acesso, recibo, protocolo e datas relevantes.
- [ ] A projeção nas tabelas legadas ocorre de forma idempotente e não se torna a fonte do estado fiscal.
- [ ] O fluxo completo possui testes automatizados com respostas autorizada, rejeitada e falhas antes da transmissão.

## Reconciliar NF-e com resultado incerto

**What to build:** recuperar com segurança uma NF-e cujo resultado ficou desconhecido por timeout, queda ou resposta ambígua, consultando a SEFAZ antes de decidir por qualquer nova transmissão.

**Blocked by:** Autorizar NF-e pelo fluxo normal.

- [ ] Resultados ambíguos levam a emissão para uma situação de reconciliação, e não para reenvio automático cego.
- [ ] A reconciliação consulta recibo, chave ou outro identificador adequado e converge para a situação conhecida pela SEFAZ.
- [ ] Execuções concorrentes ou repetidas da reconciliação não duplicam autorização nem efeitos locais.
- [ ] Falhas persistentes permanecem acionáveis para operação, com próxima tentativa e último erro visíveis.
- [ ] Toda decisão e transição é auditada.
- [ ] Há testes automatizados para timeout antes e depois do aceite, autorização já existente, rejeição e indisponibilidade persistente.

## Corrigir e retransmitir NF-e rejeitada

**What to build:** permitir que um usuário corrija dados permitidos de uma NF-e explicitamente rejeitada e solicite nova transmissão sem perder seu histórico fiscal.

**Blocked by:** Autorizar NF-e pelo fluxo normal.

- [ ] Somente rejeições elegíveis oferecem a ação de correção e retransmissão.
- [ ] A correção cria nova revisão imutável da fotografia e preserva todas as revisões anteriores.
- [ ] O número é preservado ou substituído conforme a regra fiscal aplicável, sem reutilização indevida.
- [ ] A nova tentativa percorre o mesmo fluxo de validação, transmissão e reconciliação.
- [ ] Usuário, motivo, alterações e resultado ficam auditados.
- [ ] Elegibilidade, revisão, idempotência e retransmissão possuem testes automatizados.

## Custodiar XML fiscal e disponibilizar DANFE

**What to build:** preservar os documentos de uma NF-e autorizada e permitir que usuários autorizados recuperem seu XML e visualizem ou imprimam o DANFE mesmo após reinícios do processamento.

**Blocked by:** Autorizar NF-e pelo fluxo normal.

- [ ] XMLs relevantes passam por staging durável antes de serem enviados ao armazenamento definitivo.
- [ ] Cada artefato registra tipo, versão, tamanho, hash, localização e vínculo com a emissão ou tentativa.
- [ ] Repetir o armazenamento não cria cópias lógicas conflitantes.
- [ ] Falha no armazenamento definitivo permanece recuperável e visível para operação.
- [ ] XML autorizado e DANFE podem ser baixados ou impressos somente por usuários autorizados.
- [ ] Integridade, recuperação, autorização de acesso e geração do DANFE possuem testes automatizados.

## Emitir NF-e originada de contrato

**What to build:** permitir que uma operação elegível de contrato gere e autorize uma NF-e pelo mesmo fluxo fiscal usado pela nota avulsa, mantendo o contrato como origem rastreável.

**Blocked by:** Autorizar NF-e pelo fluxo normal; Custodiar XML fiscal e disponibilizar DANFE.

- [ ] Uma operação contratual elegível produz uma fotografia fiscal completa e vinculada ao contrato.
- [ ] Regras de numeração, assinatura, transmissão, reconciliação e custódia são compartilhadas com a emissão avulsa.
- [ ] Repetir o comando na mesma operação não cria outra emissão fiscal.
- [ ] O resultado fiscal atualiza a visão operacional do contrato sem torná-la a fonte da situação fiscal.
- [ ] O fluxo até autorização, XML e DANFE possui teste automatizado de ponta a ponta.

## Operar a Central de Emissões NF-e

**What to build:** oferecer ao usuário emissor uma Central de Emissões equivalente à operação atual do Delphi, reunindo pendências, situações e ações seguras de NF-e.

**Blocked by:** Reconciliar NF-e com resultado incerto; Corrigir e retransmitir NF-e rejeitada; Custodiar XML fiscal e disponibilizar DANFE.

- [ ] A Central lista e filtra emissões por filial, origem, período e situação operacional.
- [ ] Cada emissão mostra situação, última tentativa, erro acionável e artefatos disponíveis.
- [ ] Somente ações válidas para a situação atual são oferecidas e autorizadas no servidor.
- [ ] Usuários com permissão de emissão são direcionados à Central ao entrar quando houver nota pendente de ajuste de situação.
- [ ] Usuários sem permissão ou sem pendências não sofrem a abertura automática.
- [ ] Listagem, permissões, abertura automática e ações idempotentes possuem testes automatizados.

## Cancelar NF-e autorizada

**What to build:** permitir que uma NF-e autorizada e elegível seja cancelada pela Central, preservando protocolo, XML do evento e reflexos operacionais.

**Blocked by:** Operar a Central de Emissões NF-e.

- [ ] A ação só é oferecida dentro das regras de situação, prazo e permissão aplicáveis.
- [ ] O cancelamento exige justificativa válida e confirmação explícita.
- [ ] O evento é assinado, transmitido e reconciliado de forma idempotente.
- [ ] Protocolo e XML do evento são custodiados e ficam disponíveis na emissão.
- [ ] Situação fiscal e projeção legada convergem sem apagar a autorização original.
- [ ] Elegibilidade, autorização, rejeição, resultado incerto e repetição possuem testes automatizados.

## Emitir Carta de Correção Eletrônica

**What to build:** permitir que um usuário autorizado emita CC-e para uma NF-e elegível e consulte toda a sequência de correções vinculada à nota.

**Blocked by:** Cancelar NF-e autorizada.

- [ ] A ação só aceita correções permitidas e exige texto e confirmação válidos.
- [ ] A sequência do evento é controlada sem colisão sob concorrência.
- [ ] Transmissão, reconciliação e repetição são idempotentes.
- [ ] Protocolo e XML de cada CC-e são custodiados e apresentados em ordem.
- [ ] O histórico original da NF-e permanece imutável e toda ação é auditada.
- [ ] Regras de elegibilidade, sequência, autorização e rejeição possuem testes automatizados.

## Inutilizar numeração fiscal

**What to build:** permitir que um usuário autorizado inutilize uma faixa elegível de números e acompanhe seu protocolo, impedindo o uso futuro da faixa.

**Blocked by:** Cancelar NF-e autorizada.

- [ ] A solicitação identifica filial, modelo, série, ambiente, ano, faixa e justificativa.
- [ ] Números já usados, reservados ou incompatíveis impedem a solicitação antes da transmissão.
- [ ] Faixas concorrentes ou sobrepostas não podem ser aprovadas localmente.
- [ ] A transmissão e eventual reconciliação são idempotentes.
- [ ] Protocolo e XML são custodiados e a faixa autorizada deixa de estar disponível para alocação.
- [ ] Validação, concorrência, autorização, rejeição e repetição possuem testes automatizados.

## Operar contingências de NF-e

**What to build:** permitir que a operação emita NF-e usando a modalidade de contingência habilitada para sua UF e retorne com segurança ao fluxo normal, sem duplicidade ou perda de rastreabilidade.

**Blocked by:** Reconciliar NF-e com resultado incerto; Custodiar XML fiscal e disponibilizar DANFE; Cancelar NF-e autorizada.

- [ ] Somente modalidades configuradas e válidas para UF, modelo e ambiente podem ser selecionadas.
- [ ] Entrada e saída da contingência exigem motivo, momento e responsável auditáveis.
- [ ] SVC, EPEC e FS-DA seguem suas regras próprias de autorização, impressão e regularização quando habilitadas.
- [ ] O retorno ao modo normal reconcilia pendências antes de permitir operações que possam duplicar documentos.
- [ ] Artefatos e DANFE identificam corretamente a modalidade utilizada.
- [ ] Cada modalidade habilitada, sua indisponibilidade e o retorno ao normal possuem testes automatizados.

## Autorizar NFC-e no frente de caixa

**What to build:** permitir que uma venda elegível no frente de caixa gere e autorize uma NFC-e prioritária, disponibilizando o documento auxiliar com QR Code sem bloquear outras vendas além do necessário.

**Blocked by:** Custodiar XML fiscal e disponibilizar DANFE; Operar a Central de Emissões NF-e.

- [ ] Uma venda elegível gera uma única emissão modelo 65 com fotografia e numeração próprias.
- [ ] CSC, QR Code, assinatura, transmissão e validação respeitam filial e ambiente.
- [ ] O processamento da NFC-e recebe prioridade adequada sem furar limites seguros de concorrência.
- [ ] Autorização disponibiliza XML e documento auxiliar para impressão no caixa.
- [ ] Rejeição ou falha apresenta orientação operacional sem duplicar venda ou emissão.
- [ ] O fluxo normal, prioridade, idempotência e impressão possuem testes automatizados.

## Operar NFC-e offline e regularizar posteriormente

**What to build:** manter o frente de caixa operando durante indisponibilidade, emitindo NFC-e offline e transmitindo-a posteriormente com tratamento seguro de autorização, rejeição ou substituição.

**Blocked by:** Autorizar NFC-e no frente de caixa; Cancelar NF-e autorizada.

- [ ] O modo offline só é usado quando permitido e registra motivo, data e hora de entrada.
- [ ] O documento auxiliar identifica corretamente a emissão em contingência e contém o QR Code aplicável.
- [ ] Emissões offline entram em fila prioritária e são transmitidas dentro do prazo operacional configurado.
- [ ] Resultado incerto é reconciliado antes de retransmissão ou substituição.
- [ ] Rejeições posteriores oferecem apenas as ações fiscais válidas, preservando vínculos entre original e substituta.
- [ ] Entrada, emissão, retomada, autorização tardia, rejeição e substituição possuem testes automatizados.

## Espelhar emissões realizadas pelo Delphi

**What to build:** apresentar no Laravel as emissões ainda controladas pelo Delphi para que a equipe tenha uma visão operacional única, sem permitir que os dois sistemas disputem a posse da mesma nota.

**Blocked by:** Reconciliar NF-e com resultado incerto; Custodiar XML fiscal e disponibilizar DANFE.

- [ ] Emissões do Delphi aparecem identificadas como espelhadas e com sua origem e responsável atuais claros.
- [ ] Situação, chave, protocolo e artefatos disponíveis são sincronizados de forma idempotente.
- [ ] O Laravel não transmite eventos ou documentos enquanto a posse permanecer com o Delphi.
- [ ] Divergências de estado ou artefatos ficam visíveis para ação administrativa.
- [ ] A sincronização não altera retroativamente a fotografia fiscal original.
- [ ] Espelhamento, repetição, divergência e bloqueio de ações possuem testes automatizados.

## Transferir uma emissão do Delphi para o Laravel

**What to build:** permitir que um administrador transfira explicitamente uma emissão elegível do Delphi para o Laravel, garantindo que somente um sistema possa agir sobre ela após a transição.

**Blocked by:** Gerenciar certificado A1 por filial; Espelhar emissões realizadas pelo Delphi.

- [ ] A transferência exige permissão administrativa, confirmação, motivo e pré-condições verificáveis.
- [ ] A emissão não pode ser transferida enquanto houver processamento ativo ou estado divergente não reconciliado.
- [ ] Um marcador durável de posse impede novas ações pelo Delphi antes de habilitá-las no Laravel.
- [ ] Repetir ou concorrer a transferência produz um único resultado consistente.
- [ ] Em caso de falha parcial, a posse permanece inequívoca e a recuperação é acionável.
- [ ] Pré-condições, concorrência, falha parcial, sucesso e auditoria possuem testes automatizados.

## Distribuir documentos fiscais por e-mail

**What to build:** permitir o envio auditável de XML e representação auxiliar ao destinatário e a contatos adicionais, usando primeiro o e-mail configurado na filial e, na ausência dele, o e-mail do usuário como no Delphi.

**Blocked by:** Custodiar XML fiscal e disponibilizar DANFE; Cancelar NF-e autorizada; Emitir Carta de Correção Eletrônica.

- [ ] O envio seleciona os artefatos corretos para autorização, cancelamento e CC-e.
- [ ] Destinatários fiscais e contatos adicionais são validados antes do enfileiramento.
- [ ] O SMTP da filial é usado quando configurado; na ausência dele, tenta-se o SMTP do usuário responsável.
- [ ] Ausência de ambos os remetentes gera pendência acionável, sem marcar a distribuição como concluída.
- [ ] Tentativas, remetente escolhido, destinatários, resultado e erro são auditados sem expor credenciais.
- [ ] Seleção de artefatos, fallback, repetição, falha e sucesso possuem testes automatizados.

## Controlar rollout, observabilidade e operação assistida

**What to build:** permitir que responsáveis ativem a emissão por filial de forma gradual, observem sua saúde e suspendam novas emissões com segurança, apoiados por runbooks e evidências de homologação.

**Blocked by:** Emitir NF-e originada de contrato; Operar contingências de NF-e; Operar NFC-e offline e regularizar posteriormente; Transferir uma emissão do Delphi para o Laravel; Distribuir documentos fiscais por e-mail.

- [ ] Cada filial pode operar nos modos `off`, `mirror` ou `active`, com transições autorizadas e auditadas.
- [ ] A suspensão emergencial impede novas emissões sem interromper consulta, reconciliação e recuperação de trabalhos já iniciados.
- [ ] Painéis e alertas cobrem filas, idade das pendências, rejeições, resultados incertos, certificados, armazenamento e distribuição.
- [ ] Runbooks documentam recuperação, reconciliação, contingência, retorno ao normal, transferência e suspensão.
- [ ] Um roteiro de homologação cobre NF-e, NFC-e, eventos, contingências, integrações de origem e convivência com o Delphi.
- [ ] A ativação exige evidências registradas de homologação e aceite do usuário responsável.
- [ ] Transições de modo, suspensão, métricas críticas e critérios de ativação possuem testes automatizados.
