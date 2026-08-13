# Prompt SpecKit — Revisão da emissão fiscal após 861a351e

Use este prompt para gerar uma nova especificação incremental. Não implemente código durante `/speckit.specify`.

```text
/speckit.specify

Revise a implementação Laravel atual da ponte fiscal de Transferência após o commit `861a351e` (`remocao vendas e devolucao transferencias`), comparando-a com a spec 349 e com o contrato da plataforma fiscal.

Leia obrigatoriamente:

- .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/06-auditoria-codigo-861a351e-e-prompts.md
- laravel/specs/349-trf-fiscal-plataforma-real/spec.md
- laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md
- laravel/specs/349-trf-fiscal-plataforma-real/contracts/*.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/03-speckit-prompt-correcao-pos-revisao.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/04-speckit-prompt-correcao-durabilidade-e-persistencia.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/05-speckit-prompt-correcao-fotografia-autoritativa.md
- modules/interlojas/transferencia-requisicao-emissao-fiscal/06-speckit-prompt-correcao-eventos-projecao-estados.md
- o diff `93eed411...861a351e` e todos os arquivos atuais da ponte em `laravel/backend`
- `laravel/backend/AGENTS.md` e as regras `.cursor/rules` aplicáveis

Produza somente uma especificação incremental de correção, sem alterar o código. Classifique cada achado como correto, incompleto, divergente, risco ou fora de escopo. Não reescreva o módulo operacional 326–332 nem a plataforma fiscal 333–348.

O único tipo ativo desta ponte é `Transferencia`. `VendaTransferencia` e `DevolucaoTransferencia` são valores históricos somente leitura: não podem formar grupo, preparar fotografia, emitir, reconciliar, projetar, gerar efeitos, pendências ou testes de implementação. Não criar contrato/crédito/vencimentos financeiros, referências de devolução ou baixa de origem.

Organize a especificação nesta ordem:

1. Estado durável: eliminar `pendingSeals`/`pendingEmissions` como autoridade; persistir fotografia/revisão, vínculo grupo-emissão, comandos, outbox e retomada entre processos; definir retry, concorrência, rollback e ownership.
2. Fotografia autoritativa: remover fixture global do caminho HTTP e da rota manual; remover CFOP/NCM/UF/unidade/descrição/totais/defaults fiscais; resolver todos os dados no servidor antes do seal; definir explicitamente a fronteira de dry-run com Fake.
3. Autorização e projeção: listener deve carregar a revisão/fotografia selada pela plataforma, validar status real, emitente, modelo, chave e tipo; rota manual deve exigir capability fiscal administrativa e usar exatamente a mesma fotografia; projeção deve aplicar somente satisfação de Transferencia.
4. Eventos, erros e estados: substituir SQL direto em Application/HTTP/listeners por portas/repositórios de Infrastructure; mapear rejeição corrigível, falha operacional e aguardando reconciliação para estados distintos; persistir pendência/retry/outbox; não tratar falha apenas com log ou `catch` silencioso.
5. Delphi, idempotência e qualidade: reconciliação deve comparar origem, filial base, requisitante, tipo, modelo 55, série, número, chave, fotografia/hash e artefatos; impedir segunda emissão; tornar upsert/projeção concorrente seguro; completar testes Unit/Feature/PostgreSQL e schema gate.

Para cada fatia especifique contratos de portas/repositórios, rotas/requests/respostas/erros, estados e transições, transação/lock/pós-commit/retry/idempotência, migração compatível, testes comportamentais e critérios de aceite rastreados à spec 349. Inclua uma matriz explícita de evidências para F-01 a F-06.

É proibido usar request, raiz de CNPJ, booleano de certificado, fixture, Cache, token em memória, texto no hash, Fake ou default fiscal como autoridade de produção. Não criar NF-e de entrada, pipeline paralelo ou efeitos de venda/devolução.
```
