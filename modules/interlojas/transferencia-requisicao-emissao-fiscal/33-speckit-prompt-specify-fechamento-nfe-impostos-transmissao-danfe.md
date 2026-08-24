# Prompt 33 para /speckit.specify — fechamento da NF-e de transferência

## Ponto de partida

O último prompt implementado no Laravel foi o prompt 32. Os prompts posteriores deste diretório são rascunhos de revisão e não devem ser tratados como implementados.

O próximo trabalho deve fechar, em uma única especificação, a NF-e de transferência antes de iniciar IBS/CBS.

Este prompt cobre somente:

- ICMS/CSOSN;
- IPI;
- PIS;
- COFINS;
- geração imediata da chave;
- validação e assinatura;
- transmissão real para a SEFAZ em homologação;
- resultado fiscal;
- geração e abertura do DANFE PDF.

Não incluir IBS, CBS, NFS-e, venda entre filiais, devolução, etiquetas, impressão automática, cancelamento ou inutilização.

O Cursor não tem acesso aos fontes Delphi e não deve tentar abri-los. Os fatos Delphi necessários estão transcritos abaixo.

## Problemas observados no estado atual

1. A fotografia pode chegar sem valores calculados de ICMS/IPI/PIS/COFINS.
2. A projeção lê cadastro e natureza, mas não comprova a execução de uma etapa equivalente ao recálculo de impostos de saída do Delphi.
3. A emissão grava a nota, o número e a chave, mas cria apenas outbox de emissão pendente.
4. O fluxo da transferência não registra nem despacha o comando de autorização AUTORIZAR.
5. Por isso a tela informa emissão pendente/aguardando transmissão, mas não há tentativa real no gateway SEFAZ.
6. O DANFE PDF ainda não está conectado ao resultado autorizado.

## Comportamento fiscal de referência

No fluxo Delphi, a transferência:

1. completa os dados fiscais;
2. valida a série;
3. bloqueia estoque e confirma saldo;
4. preenche nota e dadofiscal;
5. inclui movimentos;
6. atualiza pedidosfiliais;
7. executa o cálculo de impostos de saída equivalente a CalcularImpostos(..., TransferenciaSaida).

O Laravel deve preservar os efeitos operacionais, mas não pode criar movimento adicional durante autorização ou geração do DANFE.

## Requisitos

### Impostos antes da numeração

- Reler os dados da filial emitente, filial requisitante, produto, característica, natureza, CFOP, quantidade e preço no momento de emitir.
- Definir a fonte autoritativa para origem, CST/CSOSN, modalidade, redução, alíquota, base e valor de ICMS/ST.
- Definir a fonte autoritativa para CST, enquadramento, base, alíquota e valor de IPI.
- Definir a fonte autoritativa para CST, base, alíquota e valor de PIS e COFINS.
- Mapear as funções/tabelas PostgreSQL do recálculo de saída, caso existam, e executá-las no ponto correto da transação.
- Se o recálculo exigir itens persistidos, projetar os itens, recalcular e reler os valores antes de selar a fotografia final.
- Não aceitar impostos enviados pelo navegador como autoridade.
- Não usar alíquota fixa nem preencher 0.00 quando houver imposto aplicável sem fonte.
- CSOSN sem ICMS próprio, como 102, deve permanecer sem ICMS próprio, sem bloquear PIS/COFINS válidos.
- Antes da reserva do número, bloquear item sem fonte fiscal obrigatória, informando produto, imposto, CST/CSOSN e origem ausente.
- Persistir os mesmos valores na fotografia, em dadosfiscais, nos itens legados e no XML.

### NF-e e transmissão completa

Depois da confirmação operacional, o fluxo emitir-nfe deve:

1. reler linhas com FOR UPDATE;
2. validar fotografia e impostos;
3. reservar série/número;
4. calcular e persistir imediatamente a chave NF-e;
5. projetar destinatário filial, itens, natureza, CFOP e impostos no legado;
6. selar fotografia/XML/hash;
7. validar XML contra XSD;
8. assinar com certificado da filial emitente;
9. criar comando idempotente de autorização;
10. criar outbox AUTORIZAR;
11. despachar a outbox para fiscal-nfe após o commit;
12. executar o worker real;
13. chamar o gateway NFePHP real no endpoint SEFAZ de homologação;
14. persistir tentativa, XML enviado, resposta, código, motivo, recibo e protocolo;
15. atualizar situação fiscal para autorizada, rejeitada ou ambígua;
16. exibir na tela número, série, chave, estado, motivo/protocolo e próxima ação.

EMISSAO_PENDENTE sozinho não significa transmissão. A API pode responder 202, mas somente depois de criar a autorização e a outbox correta. A tela deve acompanhar o identificador até um resultado terminal ou uma pendência explícita.

A transmissão não pode movimentar estoque novamente. Repetição do clique não pode criar novo número, chave, comando ou transmissão duplicada.

### DANFE PDF

### Modal operacional da emissão

Substituir a experiência confusa de mensagens dispersas por um modal simples, aberto imediatamente ao clicar em “Emitir NF-e da Transferência”. O modal deve:

- bloquear novo clique de emissão enquanto a operação estiver em andamento;
- mostrar uma única etapa ativa por vez, nesta ordem e com estes textos para o usuário:
  1. “Verificando status”;
  2. “Gerando XML”;
  3. “Retorno” — incluindo envio/retorno da SEFAZ, cStat, motivo, protocolo ou rejeição quando já houver resposta;
  4. “Gerando DANFE”;
- marcar visualmente a etapa concluída e manter a etapa atual evidente, sem exibir nomes de classes, outbox, jobs ou estados internos;
- usar o estado real do backend, e não temporizadores fictícios: a API de emissão/status deve informar fase, mensagem, número, série, chave, situação fiscal, erro/motivo e disponibilidade do DANFE;
- manter o modal aberto até uma destas situações: DANFE aberto, rejeição/erro terminal apresentado, ou pendência que exija ação do usuário;
- em timeout, indisponibilidade temporária de fila ou retorno ambíguo, informar claramente que a NF-e permanece pendente e oferecer consulta/reprocessamento seguro, sem afirmar que foi autorizada;
- não substituir o painel de detalhe persistente da tela por mensagens genéricas; o painel pode continuar disponível depois do encerramento do modal.

Para garantir a abertura automática mesmo com bloqueadores de pop-up, abrir uma aba vazia durante o gesto do clique do usuário e navegar essa aba para a URL segura do PDF somente quando o backend confirmar que o DANFE está disponível. Se a aba não puder ser criada, apresentar uma ação “Abrir DANFE” claramente identificada, sem perder o resultado da emissão.

O endpoint de status deve continuar seguro e idempotente, aceitar polling até estado terminal ou pendência durável e fornecer o identificador/URL necessário para o frontend. A URL do PDF deve respeitar a autorização da filial e a expiração da assinatura; não expor chave S3 nem segredo no navegador.

Os testes devem cobrir as quatro etapas do modal, polling, erro/pendência, bloqueio de duplo clique, aba vazia criada no gesto do usuário e navegação da aba para o PDF assinado.

- Depois da autorização, gerar e custodiar o DANFE em PDF a partir do XML autorizado.
- Não gerar DANFE definitivo para emissão pendente ou rejeitada.
- Se a autorização ocorrer antes do PDF, mostrar “NF-e autorizada, DANFE em geração” e consultar o estado.
- Assim que o PDF estiver disponível, a interface deve abrir uma nova aba do navegador com a URL segura.
- Não enviar automaticamente para impressora.
- Falha do PDF não desfaz a autorização; cria pendência reprocessável.

## Critérios de aceite

- Uma transferência válida produz ICMS/IPI/PIS/COFINS coerentes por item e nos totais.
- A fotografia, o legado e o XML possuem os mesmos valores.
- A chave é persistida antes da transmissão e é igual em todos os pontos.
- Existe comando/outbox AUTORIZAR, o worker é executado e o gateway real é chamado.
- Homologação retorna autorização ou rejeição real, com resposta persistida.
- NF autorizada gera DANFE PDF e abre nova aba.
- NF pendente/rejeitada não abre DANFE definitivo.
- Timeout ou repetição não duplica emissão nem transmissão.
- Confirmação e autorização não criam movimentos de estoque adicionais.

## Testes e homologação

Produzir testes unitários, integração PostgreSQL e gateway fake para os impostos, fotografia, XML, outbox e idempotência. Produzir também roteiro real de homologação validando certificado, configuração, XSD, Redis, worker, comando AUTORIZAR, chamada SEFAZ, protocolo, XML autorizado e abertura do PDF.

Não implementar código durante /speckit.specify; entregar especificação, contratos, sequência, testes e critérios de aceite.
