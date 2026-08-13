# Prompt SpecKit — Corrigir todos os achados da revisão da plataforma fiscal real

Use este prompt para gerar a especificação de correção pós-implementação. Não implemente código durante `/speckit.specify`.

```text
/speckit.specify

Corrija a implementação existente da feature 349 — `93eed411` — conforme a revisão Standards + Spec da diferença `93eed411^..93eed411`.

Leia obrigatoriamente:

- laravel/specs/349-trf-fiscal-plataforma-real/spec.md
- laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md
- laravel/specs/349-trf-fiscal-plataforma-real/contracts/*.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/02-speckit-prompt-completar-integracao-real.md
- o diff e os arquivos atuais em laravel/backend
- laravel/backend/AGENTS.md e as regras `.cursor/rules` aplicáveis

Produza uma especificação incremental para todos os achados. Preserve o que já está correto e classifique cada item como correto, incompleto, divergente, risco ou fora de escopo. Não reescreva o módulo operacional 326–332.

Organize a entrega nesta ordem:

1. Durabilidade: eliminar `pendingSeals`/`pendingEmissions` como fonte de verdade; persistir revisão/fotografia e vínculo; reutilizar a plataforma fiscal; remover SQL direto de Application/HTTP/listeners; substituir capturas silenciosas de Throwable; resolver série pela abstração comum.
2. Fotografia: carregar filial física corretamente, origem confirmada, preço, classificação, tributos, transporte, volumes, financeiro e referências; remover defaults e fixture de produção; preservar snapshot após seal.
3. Eventos: publicar pós-commit, carregar fotografia selada no listener, tratar falhas com pendência/retry durável, separar estados e aplicar capability administrativa reforçada.
4. Projeção de Transferencia/Delphi: projeção real idempotente; reconciliação completa por origem, documento, hash e artefatos; espelhamento sem segunda emissão. Não criar efeitos financeiros de venda/devolução.
5. Qualidade: schema gate completo, testes Unit/Feature/PostgreSQL, centralização dos eventos duplicados e documentação/runbook.

Para cada fatia entregue:

- contratos de portas, repositórios, eventos, rotas, requests, respostas e erros;
- modelo de estado e transições;
- estratégia de transação, lock, pós-commit, retry e idempotência;
- migração compatível sem DDL legado agressivo;
- testes de comportamento, não de implementação;
- dependências e ordem de implementação;
- critérios de aceite rastreados a R1–R5 e FR/SC da spec 349.

É proibido usar request, raiz de CNPJ, booleano de certificado, fixture, Cache, texto no hash, Fake ou default fiscal como autoridade de produção. Não criar NF-e de entrada nem pipeline paralelo.
```

Depois de aprovada a especificação, execute os prompts 04 a 08 em ordem.
