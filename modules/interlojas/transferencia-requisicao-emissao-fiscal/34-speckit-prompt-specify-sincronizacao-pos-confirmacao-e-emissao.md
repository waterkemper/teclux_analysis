# Prompt 34 para /speckit.specify — modal operacional e sincronização da tela

## Ponto de partida

O núcleo fiscal do prompt 33 já foi implementado no Laravel: a transferência cria a emissão, registra AUTORIZAR_NFE_55, acompanha o processamento, gera o DANFE e possui abertura automática do PDF quando ele fica disponível.

Este prompt trata somente da experiência da tela e da consistência visual após confirmar/emitir. Não reimplementar numeração, impostos, gateway, autorização ou DANFE, salvo correção diretamente necessária para fornecer o estado ao modal.

## Escopo

Implementar a experiência operacional simples, equivalente às mensagens do Delphi:

1. “Verificando status”;
2. “Gerando XML”;
3. “Retorno”;
4. “Gerando DANFE”.

Não incluir IBS, CBS, NFS-e, venda entre filiais, devolução, etiquetas, impressão automática, cancelamento ou inutilização.

## Requisitos do modal

- Abrir imediatamente ao clicar em “Emitir NF-e da Transferência” ou ao iniciar a confirmação que efetivamente dispara a emissão fiscal.
- Bloquear duplo clique e ações concorrentes enquanto houver emissão ativa.
- Mostrar uma única etapa ativa por vez, com texto simples para o usuário; não exibir nomes de jobs, outbox, classes, snapshots ou estados técnicos.
- Derivar a etapa do estado real retornado pelo backend, sem temporizadores fictícios:
  - preparação/consulta inicial: “Verificando status”;
  - fotografia, serialização, validação e assinatura pendentes: “Gerando XML”;
  - transmissão em andamento ou resposta SEFAZ disponível: “Retorno”;
  - autorização concluída e artefato DANFE pendente: “Gerando DANFE”.
- Na etapa “Retorno”, exibir número, série, chave, cStat, motivo e protocolo quando disponíveis.
- Em rejeição, falha operacional ou pendência durável, interromper o progresso e explicar a próxima ação sem afirmar autorização.
- Fechar o modal somente depois de abrir o DANFE, apresentar erro terminal ou deixar uma pendência explícita para o usuário.
- Manter o painel fiscal persistente após o fechamento do modal.

## DANFE e navegador

- Quando o polling receber `autorizada_pdf`/`danfe_disponivel=true`, solicitar a URL segura do DANFE e abrir o PDF em nova aba.
- Evitar duplicidade por emissão na mesma sessão.
- Não usar `window.print` nem enviar para impressora.
- Considerar bloqueador de pop-up: abrir uma aba vazia durante o gesto do usuário e navegar para a URL assinada quando ela estiver disponível; se isso não for possível, manter o botão “Abrir DANFE”.
- Nunca expor chave S3 ou segredo no navegador.

## Sincronização da tela

- Depois de confirmar ou emitir, consultar novamente os dados autoritativos com os mesmos filtros da tela.
- Substituir linhas e metadados pelos dados persistidos, incluindo situação, quantidade recebida/confirmada, estoque, revisão e `dadofiscal` quando aplicável.
- Não aplicar patch otimista para quantidades de estoque.
- A emissão não pode confirmar novamente nem criar movimentos adicionais.
- Em resposta de lote, preservar o estado e os dados de cada grupo; não projetar somente o primeiro grupo no topo.

## Contrato mínimo do estado

Documentar e testar um envelope que contenha, quando aplicável:

- `estado_visivel`, `mensagem_operador`, `proxima_acao`;
- `emissao_id`, `idempotency_key`, série, número e chave;
- situação fiscal e de processamento;
- cStat, motivo e protocolo;
- disponibilidade do DANFE;
- fase operacional consumível pelo modal.

Ausência de `estado_visivel` ou de um identificador de acompanhamento deve ser erro de contrato, com mensagem útil e correlação; não pode virar um “aguardando” genérico.

## Testes obrigatórios

- Modal apresenta as quatro etapas na ordem correta.
- Polling avança e encerra nas situações autorizada, rejeitada, falha e pendência.
- Duplo clique não gera duas emissões nem dois modais concorrentes.
- Chave, cStat, motivo e protocolo aparecem quando retornados.
- DANFE abre uma única vez por emissão e não usa impressão automática.
- Fallback manual funciona quando a aba automática é bloqueada.
- Após confirmação/emissão, a consulta autoritativa atualiza a grade e os metadados.
- Lote preserva os detalhes de todos os grupos.

## Entrega

Produzir a especificação de implementação, contratos frontend/backend, estados, acessibilidade mínima do modal, testes e critérios de aceite. Não implementar código durante `/speckit.specify`.

