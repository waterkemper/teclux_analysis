# Auditar superfície web, dados e integrações externas

Type: research
Status: resolved

## Answer

Auditoria estatica representativa concluida. Nao houve exploracao ativa nem implementacao. O inventario encontrou aproximadamente 1.689 declaracoes de rotas, 218 controllers, 582 FormRequests, 175 renderizacoes Inertia e 62 referencias a PDF; sao indicadores de superficie, nao contagem de endpoints publicados.

### Achados priorizados

| Prioridade | Evidencia | Risco e confianca |
|---|---|---|
| P1 | Os webhooks de Mercado Livre e Magalu sao CSRF-exempt e tem apenas throttle:60,1: laravel/backend/bootstrap/app.php:93-96 e laravel/backend/routes/web.php:250-256. Os controllers aceitam payload, procuram user_id/seller_id e despacham jobs sem assinatura, segredo, timestamp ou idempotencia: laravel/backend/app/Http/Controllers/MarketplaceWebhookController.php:25-76 e MagaluWebhookController.php:18-33. | Um terceiro que conheca identificadores pode induzir refresh/import, replay e consumo de fila/APIs. Rate limit nao autentica a origem. Confianca alta. |
| P1 | Magalu registra o payload inteiro: laravel/backend/app/Http/Controllers/MagaluWebhookController.php:20. | PII/dados comerciais em logs e log flooding. Confianca alta. |
| P1 | Testes SMTP aceitam host arbitrario, validando apenas formato/tamanho e porta: laravel/backend/app/Http/Requests/SendFilialEmailTestRequest.php:29-51 e SendUserEmailTestRequest.php:28-50; os servicos montam DSN com o host: FilialInternetMailTestService.php:22-68 e UserInternetMailTestService.php:22-68. Ambos desabilitam verify_peer e verify_peer_name: FilialInternetMailTestService.php:103-132 e UserInternetMailTestService.php:87-116. As rotas nao mostram throttle dedicado: laravel/backend/routes/web.php:879-883 e 1192-1225. | Primitiva de SSRF/egress e abuso de relay, com possivel exposicao de credenciais por MITM. Depende de quem possui viewAny. Confianca alta. |
| P1 | Upload de suporte nao tem regra de MIME/conteudo no FormRequest: UploadHelpAttachmentRequest.php:20-27. O controller confia no MIME declarado/configurado: HelpRequestController.php:25-59; nao foi encontrado scanner apesar de scan_status=pending. HelpRequestService.php:142-190 resolve client_upload_id com prefixo upl_ sem vincular ao usuario/sessao. | Conteudo malicioso pode entrar; upload obtido pode ser anexado por outro usuario. Os limites de quantidade/tamanho no submit nao substituem scan/ownership. Confianca alta. |
| P1 | Email de orcamento usa HTML cru em resources/views/vendas/orcamentos/email.blade.php:103-105 ({!! $textos_finais !!}). OrcamentoDocumentEmailComposer.php:127-129 usa apenas EncodingSanitizer::forOutput, que nao faz escaping HTML. | Injecao de HTML/XSS em cliente de email ou renderer PDF se a origem for editavel por menor confianca; no minimo HTML arbitrario no email. Sink confirmado; impacto XSS condicional. |
| P2 | Pareamento publico do agente nao mostra throttle: laravel/backend/routes/web.php:215-217. AgentPairingService.php:61-108 verifica e cria/consome codigo sem transacao/lock unico. | Guessing/DoS e corrida que pode criar mais de um agente ou estado inconsistente. Codigo de 8 caracteres/TTL mitigam. Confianca media. |
| P2 | Agente tem headers, janela de 60s, nonce, HMAC SHA-256 e hash_equals: AuthenticateDeviceAgent.php:20-37 e AgentAuthenticationService.php:23-69. A chave de replay nao e escopada pelo agente: AgentAuthenticationService.php:83-96. Heartbeat aceita arrays/capabilities sem limite de cardinalidade: AgentHeartbeatRequest.php:21-31. | Controles de autenticidade sao bons, mas ha DoS cruzado por nonce e payload autenticado excessivo. Confianca alta na evidencia; exploracao baixa-media. |
| P2 | URLs de foto derivam de base configuravel sem allowlist de host: ProductPhotoUrlBuilder.php:12-36 e ProductPhotoService.php:192-238. OrcamentoImpressaoPayloadBuilder.php:418-450 faz GET HTTP(S), aceita dois redirects e nao revalida host/IP a cada salto. | SSRF/egress se parametro privilegiado/dado comprometido apontar para rede interna. Nao foi provado URL diretamente controlado por request. Confianca media. |
| P2 | HttpCatalogoNormativoFetcher.php:24-53 executa Http::get($url) sem allowlist explicita, bloqueio de redirect ou limite de corpo. | SSRF/DoS de resposta via configuracao normativa; origem parece configuracao, nao input direto. Confianca media. |
| P2 | Muitos relatorios/PDF/exportacoes nao exibem throttle por usuario/concor­rencia, em contraste com rotas operacionais e suporte: routes/web.php:259-323, 353-359 e blocos 759-819, 989-1018, 2234-2267 e 3901+. Busca Assistida/testes SMTP tambem nao exibem limitador dedicado: routes/web.php:325-335, 879-883 e 1192-1225. | Usuario autenticado pode monopolizar CPU, Chrome, fila, disco ou APIs externas. Confianca alta para cobertura inconsistente. |
| P2 | Respostas devolvem mensagens de excecao: CobrancaSac/AtendimentosController.php:360-362, Financeiro/ExtratoContaController.php:209-211, Interlojas/TransferenciaRequisicaoExposicaoController.php:595-598, Erp/GridPreferencesController.php:147-221 e BuscaAssistidaTranscribeController.php:60-64. | Exposicao de caminhos, tabelas e detalhes de integracao; inconsistente com o envelope generico em DocumentEmailController.php:77-104. Confianca alta. |
| P3 | Arquivos usam nomes/chaves seguras e policy contextual: ArquivosAnexadosService.php:103-129, 573-580 e ArquivoAnexoPolicy.php:24-86. Na confirmacao de contrato nao ha ownership explicito do pending upload: ArquivosAnexadosService.php:220-278. SVG/HTML/XML aparecem na allowlist de resposta: ArquivosAnexadosService.php:554-570. | Possivel reuso de pending por outro autorizado e XSS de objetos legados inline. Path traversal local nao foi confirmado: basename/regex e UUID mitigam. Confianca media/condicional. |

### Controles positivos

- CSRF global e autenticacao contextual por usuario/filial: bootstrap/app.php:84-105 e InjectAuthContext.php:106-183.
- Inertia compartilha campos operacionais limitados e menu escopado por usuario/filial: HandleInertiaRequests.php:49-96. O cache de boosts de navegacao usa apenas usuario: :60-65; verificar se e filial-especifico.
- Filtros/ordenacao revisados usam allowlists, limites e SQL estatico: OrcamentosConsultaSearchRequest.php:114-209, RelatorioEntregasOrdenacao.php:17-80 e ConsultaPedidosCompraOrdenacao.php:16-63. Nao foi confirmado SQL injection na amostra.
- Policies de anexos/exportacoes evitam IDOR; FichaProdutosController.php:232-288 compara job, usuario e estado pronto.
- Engine de email verifica documento, usuario e filial; DocumentEmailEngine.php:40-85, 109-132, 364-384 e DocumentEmailController.php:77-104 usam erros genericos.
- dangerouslySetInnerHTML de produto recebe conteudo sanitizado: resources/js/Components/product/ProductDetailModal.tsx:442-457 e ProductCommercialDetailService.php:73-80.
- Alertas validam HTTPS, segredo forte, IP publico, fixacao DNS e assinatura: OperationalAlertAdministration.php:121-140 e OperationalAlertDeliveryService.php:85-106.
- Cliente WSDL bloqueia SSRF/XXE com allowlist, verify=true, sem redirects, limite de corpo e LIBXML_NONET: ConsultarWsdlNormativoService.php:43-100 e 123-180. Cliente de frete tambem valida host/IP, tamanho e schema: FreightQuoteHostAllowlist.php:14-83.
- Browsershot escapa campos de relatorio, mas noSandbox em BrowsershotPdfGenerator.php:96 aumenta impacto de HTML/recurso nao confiavel. Relatorios consultados usam Content-Disposition e Cache-Control privado/no-store.

### Recomendacoes

1. Autenticar webhooks por assinatura/segredo, timestamp, replay protection e event ID idempotente; limitar corpo e redigir logs.
2. Restringir SMTP a destinos/egress aprovados, aplicar rate limit/auditoria e habilitar validacao TLS.
3. Vincular upload a usuario/sessao/caso, validar MIME por bytes, escanear antes de anexar/servir e bloquear SVG/HTML/XML inline com nosniff.
4. Escapar ou sanitizar com allowlist estrita todos os sinks HTML, incluindo textos_finais, email, PDF e dangerouslySetInnerHTML; adicionar testes de payload.
5. Tornar pareamento atomico, limitar tentativas, escopar nonce por agente e limitar cardinalidade/bytes de heartbeat.
6. Centralizar politica HTTP: HTTPS, allowlist, bloqueio de IP privado, limite de tempo/corpo e redirects revalidados salto a salto.
7. Aplicar quotas/concurrency limits para PDF, relatorio, exportacao, transcricao e SMTP; revisar POSTs caros de Busca Assistida.
8. Remover getMessage() das respostas, usar correlation ID e logs seguros. Confirmar no edge CSP, HSTS, X-Content-Type-Options, frame policy e Referrer-Policy, nao evidenciados no app.

### Limites e conclusao

Auditoria estatica representativa; nao inclui producao, proxy/WAF, permissoes efetivas, headers do storage, execucao real do Chromium, scanner, DNS ou pentest. O risco transversal urgente e a combinacao de webhooks sem autenticacao de origem, SMTP arbitrario com TLS desabilitado e conteudo de upload/HTML sem validacao suficientemente forte. Nao foram feitas alteracoes de implementacao.
Blocked by:

## Question

Quais são as superfícies de entrada e saída — rotas Inertia/API, requests, filtros e ordenação, uploads, downloads, PDFs, HTML, e-mail, webhooks, agentes locais e serviços externos — e como são tratados validação, autorização, CSRF, XSS, SSRF, path traversal, injeção, exposição de dados, rate limiting e erros?
