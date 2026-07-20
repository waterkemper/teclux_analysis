# Definir a máquina de estados do microfone

Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual máquina de estados e interação acessível deve substituir o botão “Ditar”: ícone e rótulo acessível em repouso, início e parada da gravação, indicação temporal/visual de “Gravando”, estado cancelável “Processando”, edição da transcrição e confirmação explícita “Deseja buscar?” antes de consumir a busca?

## Working decisions

- Depois da transcrição, apresentar confirmação inline no próprio painel, mantendo o texto visível e editável. Exibir “Deseja buscar?” com ações “Buscar agora” e “Corrigir texto”; Esc retorna à edição sem fechar o painel. Não empilhar modal.
- Usar um único controle alternável: em repouso, ícone de microfone; durante a captura, o mesmo botão fica vermelho, pulsa suavemente e troca para ícone de parada. Mostrar “Gravando mm:ss” ao lado; o segundo clique encerra. Anunciar início/fim por região viva sem vocalizar cada segundo.
- Após parar, entrar em “Processando áudio…” com spinner e ação “Cancelar processamento”. Cancelar aborta a requisição cliente, invalida sua geração e ignora resposta tardia, preservando o texto anterior. Nunca inicia busca automaticamente; a UI pode alertar que uma transcrição já enviada talvez tenha consumido cota.
- Limitar captura a 60 segundos: contador desde o início, aviso discreto aos 50 segundos e parada automática aos 60, seguindo para processamento. Preservar também o limite backend de 5 MB.
- Esc age por camadas: em gravação cancela a captura e mantém o painel; em processamento aborta/ignora a transcrição e mantém o painel; nos demais estados fecha. X/overlay durante operações encerram stream, timers e requests antes de fechar.
- Se a consulta estiver vazia, a transcrição a preenche; se já houver texto, acrescenta a transcrição ao final separada por espaço. Guardar snapshot anterior à captura e restaurá-lo em cancelamento/falha. Todo o texto permanece editável antes de buscar.
- Microfone indisponível/não suportado, permissão negada ou transcrição vazia retornam ao modo texto com mensagem específica, preservando conteúdo, Buscar quando possível, nova tentativa e lupa tradicional; nunca disparam ação automática.

## Answer

Adotar a máquina de estados explícita:

`ready → recording → processing_transcription → review_transcript → searching → results`.

Ramificações recuperáveis retornam a `ready` ou `review_transcript`, conforme haja texto. Fechar produz `closed`; cancelar captura/processamento não fecha.

### Controle

- Um botão circular de microfone em repouso, com `aria-label` e tooltip “Iniciar gravação”.
- Em `recording`, o mesmo botão fica vermelho, pulsa suavemente e mostra ícone de parada; texto adjacente “Gravando mm:ss”.
- Segundo clique para. Aviso aos 50 s e parada automática aos 60 s; backend mantém 5 MB.
- Estado não depende só de cor: ícone, texto, `aria-pressed` e região viva anunciam início/fim sem narrar cada segundo.

### Processamento e revisão

- Após parar, mostrar spinner e “Processando áudio…”, com “Cancelar processamento”.
- Usar AbortController + geração/request id; cancelamento e respostas tardias não alteram a consulta.
- Manter snapshot anterior. Texto vazio recebe a transcrição; texto existente recebe espaço + transcrição.
- Exibir a transcrição editável e confirmação inline “Deseja buscar?” com “Buscar agora” e “Corrigir texto”.
- Somente “Buscar agora” chama search. Esc na revisão volta à edição.

### Cancelamento, fechamento e falhas

- Esc em gravação cancela captura; em processamento cancela request; ambos mantêm o painel. Nos demais estados, fecha.
- X/overlay encerram recorder, tracks, timers, AbortControllers e gerações antes de fechar.
- Cancelar/falhar restaura snapshot e foco no textarea.
- MediaRecorder/MIME sem suporte, permissão negada, áudio vazio, limite/cota ou falha de transcrição mostram mensagens específicas e mantêm texto, nova tentativa, Buscar quando válido e lupa tradicional.
- Nenhuma falha abre lupa, inicia busca ou persiste áudio automaticamente.

### Contrato de implementação

Separar estado de voz do estado da busca para impedir combinações inválidas. O componente controla recorder/stream/timers/requests por uma sessão de captura identificada; toda transição possui cleanup idempotente. O endpoint continua transcrevendo apenas áudio, sem NLU/chat, persistência ou log de conteúdo.

Testes devem cobrir transições felizes, segundo clique, auto-stop, cancelamento/close/Esc, cleanup de tracks, stale response, combinação com texto, vazio, permissão, ausência de API/MIME, cota, foco e anúncios acessíveis.
