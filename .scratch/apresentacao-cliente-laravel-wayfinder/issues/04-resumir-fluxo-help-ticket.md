# Resumir o fluxo Help → ticket em linguagem de negócio

Type: task
Status: resolved
Blocked by:

## Question

Como funciona hoje, de fato, o botão Help/reporte de bugs já implementado (spec `laravel/specs/161-erp-help-zendesk/`, decisões de escopo em `.scratch/formulario-help-bugs-wayfinder/map.md`)? Traduzir o fluxo real (onde fica o botão, o que o usuário preenche, captura de tela automática, para onde vai o e-mail, o que o usuário recebe de volta) para uma narrativa simples e não técnica, adequada para mostrar ao cliente como "reportar um problema é assim de fácil".

## Answer

O botão de ajuda fica na barra superior do ERP, sempre visível para qualquer usuário logado; nos primeiros acessos após o lançamento ele aparece como uma "pílula" que se expande sozinha com o texto "Precisa de ajuda?" para chamar atenção, depois volta a ser um ícone discreto.

Ao clicar, abre um formulário curto (modal no desktop, tela cheia no celular): o usuário escolhe o tipo (Bug/Erro, Melhoria, Dúvida), escreve um resumo com um roteiro guiado — "o que eu estava fazendo / o que eu esperava / o que aconteceu" —, marca o nível de impacto (baixa a crítica), e opcionalmente adiciona uma captura de tela automática (opt-in, um clique) e outros e-mails em cópia. Não há checkbox de consentimento LGPD bloqueando o envio — virou um aviso simples no rodapé avisando que dados técnicos da sessão vão junto, para ajudar o suporte a diagnosticar.

Ao enviar, o próprio servidor manda um e-mail para `suporte@tecsoft.com.br` (o usuário nunca envia e-mail diretamente) já com contexto técnico automático (tela, navegador, ações recentes) anexado — o usuário não precisa copiar URL nem descrever o ambiente. A confirmação na tela é imediata e vem com um **código de referência** que o usuário pode citar se precisar acompanhar. Não existe hoje uma tela "meus chamados" dentro do sistema — o único canal de acompanhamento é e-mail + esse código (decisão consciente do mapa `formulario-help-bugs-wayfinder`, fora do v1).

**Frase-chave para o slide:** "Reportar um problema leva menos de um minuto, sai com o print da tela automático e o contexto técnico já anexado — sem o usuário precisar explicar nada tecnicamente."

**Ressalva para a apresentação:** o fluxo está com o código pronto e testado, mas a validação operacional ponta-a-ponta em produção (SMTP configurado, worker de fila rodando, e-mail realmente chegando em `suporte@tecsoft.com.br`) ainda está pendente (`.scratch/formulario-help-bugs-wayfinder/issues/05-validacao-operacional-email-producao.md`). Apresentar como "pronto, ativando na virada para produção", não como "já está recebendo chamados hoje".

Fontes: `laravel/specs/161-erp-help-zendesk/`, `.scratch/formulario-help-bugs-wayfinder/map.md`.
