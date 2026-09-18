# Prompt corretivo 15 — residuais do inventário e foco na coleta mobile

## Contexto

Revisar a implementação atual do Cadastro de Inventário no Laravel após os commits
`0ed3f5023` e `5a8fb7a4b`, comparando com a spec 489 e os artefatos deste
diretório. A partir desta etapa, o foco principal é a coleta mobile por câmera/tablet,
sem abandonar as correções residuais que podem invalidar a fotografia do inventário.

Não solicitar inspeção direta dos fontes Delphi. Não criar botão, rota ou atalho de
“Simular processamento”. Preservar o fluxo único Processar, F6 cancelável, F8
transacional, duas datas, filial selecionada, trigger como autoridade de número/operacao,
inclusão rápida, importação TXT, junção e comportamento do grid.

## 1. Pendências residuais obrigatórias antes do foco mobile

### 1.1 Identidade e flags por lote

No plano atual, o lote ainda pode receber `count_pos`, `causa_posterior` ou bloqueio
herdados do Produto quando o posterior pertence somente ao Produto ou a outro lote.

Corrigir F6, prévia, plano e F8 para manter separados:

- posterior técnico do movimento pai sem lote;
- posterior técnico do detalhe de `movimentoslotes`;
- projeção por data;
- saldo negativo por Produto + Filial física + Lote.

Um lote positivo não pode receber a flag negativa de outro lote. Um lote sem posterior
próprio não pode ser marcado como alterado apenas porque outro lote do mesmo Produto foi
alterado. Se um movimento pai representar o Produto inteiro, documentar explicitamente
como ele afeta o resumo do Produto e quais linhas de lote são bloqueadas; não usar fallback
silencioso.

### 1.2 Lote efetivo e escopo

Usar a mesma identidade em projeção, negativos, concorrência, painel e posteriores:

`Produto + Filial física + COALESCE(movimentoslotes.loteproduto, movimentoslotes.lote)`.

Corrigir agregações ainda baseadas apenas em `ml.lote`, especialmente o agregado de
negativos. Movimento de lote externo ao conjunto de
`inventarioprodutoslotes` não pode alterar F6, prévia, plano, F8, painel ou flags.
Cobrir pai com `loteproduto`, pai sem lote e detalhe do mesmo movimento.

### 1.3 Tipagem e fotografia

Adicionar tipagem explícita ao parâmetro de `mapPosterioresNegativos`, conforme
`backend/AGENTS.md`.

F6, relatório, prévia e plano devem consumir a mesma fotografia e o mesmo contrato de
financeiro por lote. Confirmar numericamente, e não apenas com `assertNotSame`, que:

- `financeiro` é o saldo financeiro da fotografia;
- `financeiro_processamento` usa custo unitário vigente multiplicado pela quantidade
  inventariada quando a quantidade é diferente de zero;
- quantidade zero segue o fallback financeiro legado;
- dois lotes com custos e quantidades distintos permanecem distintos em todas as
  superfícies e nos campos `*processamento`.

## 2. Sessão mobile: modelo e concorrência

A coleta mobile deve ser uma sessão única por Inventário + Filial enquanto estiver
`ativa` ou `pausada`. Vários operadores/dispositivos podem contribuir na mesma sessão,
mas dois cliques ou dois dispositivos não podem criar sessões concorrentes silenciosas.

Implementar e testar uma política explícita para `iniciar` quando já existir sessão não
finalizada: reabrir/retornar a sessão autorizada ou rejeitar informando a sessão existente.
Usar transação, lock e índice/regra autoritativa do schema confirmado.

Revalidar servidor-side em toda operação:

- sessão pertence ao Inventário e Filial selecionados;
- usuário possui acesso à Filial e à operação;
- Inventário continua aberto;
- sessão está no estado correto;
- evento pertence à sessão;
- produto existe e a quantidade é positiva e válida conforme o parâmetro de casas
  decimais.

Pausa deve impedir novas bipagens no servidor, não apenas desabilitar o cliente.
Finalização deve bloquear novos eventos e exigir fila local vazia, nenhum evento em erro ou
conflito e nenhum envio de evento em andamento.

## 3. Câmera, leitor e ciclo de vida

Corrigir a implementação para que:

- iniciar/parar seja idempotente;
- uma solicitação `getUserMedia` que termine depois de “Parar câmera” não reative a
  câmera;
- toda stream criada seja encerrada em erro, parada, pausa, troca de sessão e
  desmontagem;
- `video.srcObject` seja limpo ao parar;
- falha de `play()`, permissão negada, câmera ausente e troca de orientação exibam
  estado recuperável;
- o loop não faça chamadas concorrentes a `detector.detect`;
- o mesmo código seja bloqueado somente enquanto a leitura/envio correspondente estiver
  em voo ou durante o debounce definido, podendo ser bipado novamente depois;
- câmera traseira seja preferida quando suportada, sem impedir seleção/fallback manual.

Não considerar “câmera aberta” como “bipagem funcionando”. Definir a compatibilidade dos
dispositivos móveis suportados. Se `BarcodeDetector` não existir no navegador-alvo,
usar o decoder suportado pelo projeto ou informar uma limitação de produto com fallback
manual claramente testado; não prometer leitura automática que não ocorre.

Testar mocks de câmera com: resolução tardia após parada, rejeição de permissão, rejeição
de `detect`, `detect` lento, dois frames iguais, dois códigos diferentes, pausa,
retomada, desmontagem e troca de sessão.

## 4. Bipagem rápida, entrada manual e lotes

Câmera, leitor físico/manual com Enter e arquivo devem produzir o mesmo evento tipado:
sessão, Inventário, Filial, código recebido, quantidade, canal, dispositivo e
`event_id` idempotente.

Preservar o comportamento Delphi de bipar o mesmo Produto várias vezes: cada bipagem
confirmada incrementa a quantidade, sem duplicação por frames consecutivos e sem perder
leituras legítimas.

Para Produto controlado por Lote, não incrementar silenciosamente apenas o total do
Produto se a regra exigir identificação do lote. Definir no contrato mobile se o código
escaneado resolve Produto, Lote ou ambos; exigir seleção/validação do Lote quando
necessário e manter o fechamento `inventarioprodutoslotes`. Cobrir Produto sem lote,
Produto com lote e código não resolvido.

## 5. Offline, sincronização e finalização

A fila offline deve ser durável e observável:

- falha de leitura/gravação do armazenamento local não pode ser convertida em fila vazia;
- quota, JSON inválido e indisponibilidade do storage devem gerar mensagem recuperável;
- cada evento permanece até resposta explícita `aceito`;
- respostas `erro`, `conflito`, vazias ou desconhecidas não podem remover o evento;
- retry é idempotente pelo `event_id`;
- eventos de outra sessão, Inventário ou Filial não bloqueiam a sessão atual nem são
  enviados ao endpoint errado;
- mostrar pendentes, em envio, aceitos, erros e conflitos por linha;
- reconexão, botão Retry e múltiplos eventos `online` não podem iniciar flush concorrente;
- finalizar fica desabilitado durante qualquer envio, inclusive evento online recém
  criado, e o servidor revalida tudo sob lock.

Preferir o mecanismo de armazenamento persistente já adotado pelo projeto; se
`localStorage` continuar sendo usado, tratar explicitamente limite, falha e recuperação,
sem perda silenciosa.

## 6. Arquivo TXT e arquivamento mobile

Manter o formato legado `codigo,quantidade`, soma de linhas repetidas e registro das
linhas de origem. Rejeitar quantidade zero/negativa ou documentar uma exceção de domínio
com teste. Produto inexistente deve gerar erro por linha sem criar item silenciosamente.

O arquivo deve ser arquivado de forma idempotente por sessão + checksum. Em falha de banco
ou armazenamento, não deixar registro apontando para arquivo inexistente nem aplicar
quantidades parcialmente. Exibir progresso, linhas aceitas, linhas rejeitadas e possibilidade
de nova tentativa.

## 7. Layout mobile/tablet e acessibilidade operacional

Validar em viewport de celular e tablet:

- câmera e leitura manual são ações primárias e visíveis;
- botões têm área de toque adequada, foco automático no código e Enter funciona com
  teclado físico;
- celular usa fluxo vertical sem grid denso, hover ou duplo clique;
- tablet pode usar duas colunas câmera/lista;
- último Produto, quantidade, progresso, pendências e conflitos permanecem visíveis;
- câmera negada não bloqueia código manual nem TXT;
- mensagens não dependem somente de cor;
- orientação, teclado virtual e área segura não escondem o botão Aplicar/Finalizar.

## 8. Testes mínimos

Adicionar ou corrigir testes de componente, integração e backend para:

1. duas tentativas de iniciar a mesma sessão;
2. múltiplos dispositivos na mesma sessão;
3. evento repetido com o mesmo `event_id`;
4. câmera lenta, parada durante `getUserMedia`, parada durante `detect` e
   desmontagem;
5. mesmo código em dois momentos e códigos diferentes em sequência;
6. fila offline com erro de storage, retry, conflito e resposta desconhecida;
7. finalização durante evento em voo;
8. pausa/retomada rejeitando evento no servidor;
9. Produto com lote, código desconhecido, quantidade inválida e parâmetro de quantidade;
10. arquivo repetido, parcialmente inválido e falha de arquivamento;
11. layout celular/tablet, acessibilidade dos controles e fallback sem câmera;
12. identidade de lote, flags por lote e financeiro de processamento do cadastro.

Não testar driver, `hasTable`, `Schema::has*` ou código-fonte para decidir comportamento.
SQLite continua restrito à infraestrutura de testes.

## Aceite

1. Nenhum lote herda silenciosamente posterior, negativo, custo ou financeiro de outro
   lote.
2. F6, prévia, relatório e F8 permanecem numericamente coerentes.
3. Existe no máximo uma sessão não finalizada por Inventário + Filial, com reentrada
   explícita e segura.
4. Câmera, manual e arquivo compartilham contrato e idempotência.
5. Não há corrida que reative stream parada, duplique `detect` ou perca evento offline.
6. Finalização não ocorre com envio, pendência, erro ou conflito.
7. A bipagem repetida legítima soma quantidade como no Delphi.
8. Produtos com lote respeitam a identidade do lote.
9. Celular e tablet têm fluxo operacional completo, inclusive fallback sem câmera.
10. Não há botão ou rota de “Simular processamento”.

Ao concluir, informar arquivos alterados, testes executados, dispositivos/navegadores
validados e qualquer bloqueio de schema, storage ou decoder. Não alterar Delphi.
