Type: task
Status: claimed

## Question

Como esta é a primeira versão do ERP tecLUX liberada a usuários reais, o formulário de Help é a rede de segurança do lançamento — se o e-mail não chegar de fato em produção, bugs reportados por usuários somem no vazio sem ninguém perceber. A tarefa T027 da spec 161 ("Run manual validation checklist... queue worker + mail capture") nunca foi marcada como concluída.

Checklist a executar e confirmar em produção (ou no ambiente que efetivamente vai receber os usuários no lançamento), seguindo `laravel/specs/161-erp-help-zendesk/quickstart.md`:

- [ ] `HELP_SUPPORT_TO` está configurado corretamente no `.env` de produção (destinatário real, não placeholder).
- [ ] `MAIL_MAILER` e credenciais SMTP/API de e-mail de produção estão configurados e válidos (SPF/DKIM alinhados ao domínio `From`, conforme spec seção 8 T6).
- [ ] O worker de fila (`php artisan queue:work` ou equivalente supervisionado) está rodando de fato em produção — não só localmente.
- [ ] Um envio de teste ponta-a-ponta chega na caixa `suporte@tecsoft.com.br` com assunto, corpo (pedido + contexto técnico), Reply-To correto e anexo (se testado).
- [ ] Logs mostram `reference_code`/`trace_id` correlacionáveis para esse envio de teste.
- [ ] Time de suporte sabe que a caixa vai começar a receber esses e-mails e tem processo mínimo para triá-los (mesmo que informal/manual).

Esta é uma tarefa manual (HITL) — não pode ser resolvida só por um agente; precisa de alguém com acesso ao ambiente de produção e à caixa de e-mail de suporte para confirmar cada item.

## Checklist com comandos (rodar no servidor de produção/homologação real, não neste checkout de análise)

Confirmado neste checkout: `APP_ENV=local`, sem `MAIL_HOST`/`MAIL_FROM` configurados, e **nenhum supervisor/systemd para `queue:work` versionado em `laravel/docker/`** — ou seja, quem quer que suba o worker em produção faz isso fora deste repo (infra separada) ou precisa configurar.

1. **Config de e-mail e destinatário** (no servidor, dentro do container/host que roda o Laravel):
   ```bash
   cd /home/tecsoft/projects/teclux_cloud/backend
   grep -E "^(APP_ENV|HELP_SUPPORT_TO|MAIL_MAILER|MAIL_HOST|MAIL_FROM_ADDRESS)=" .env
   ```
   Esperado: `APP_ENV=production` (ou o nome usado), `HELP_SUPPORT_TO=suporte@tecsoft.com.br`, `MAIL_MAILER=smtp` (ou provedor real, não `log`/`array`), `MAIL_HOST`/`MAIL_FROM_ADDRESS` preenchidos com credenciais reais.

2. **Worker de fila rodando de fato** (não só disponível — em execução e supervisionado):
   ```bash
   ps aux | grep "queue:work"
   # ou, se usarem supervisor:
   supervisorctl status | grep queue
   ```
   Se não houver processo supervisionado, decidir e documentar como ele sobe (systemd unit, supervisor, Horizon, etc.) — isso ainda não está no repo.

3. **Envio ponta-a-ponta**: logar na aplicação como usuário real, abrir o Help, enviar um pedido de teste (tipo "Dúvida", assunto "Teste de validação operacional"), confirmar:
   - Resposta 202/200 na UI com `reference_code`.
   - E-mail chega em `suporte@tecsoft.com.br` com assunto, corpo (pedido + contexto técnico), `Reply-To` = e-mail do usuário de teste.

4. **Logs correlacionáveis**:
   ```bash
   grep "<reference_code do teste>" storage/logs/laravel.log
   ```
   Confirmar que `trace_id`/`reference_code` aparecem nos logs do envio.

5. **Time de suporte avisado**: confirmar informalmente que quem olha `suporte@tecsoft.com.br` sabe que vai começar a receber esses e-mails e tem um mínimo de processo pra triá-los (mesmo que seja só "ler e responder manualmente" no início).

Volte a este ticket com o resultado de cada item para eu fechar (Status → resolved) e registrar no mapa.
