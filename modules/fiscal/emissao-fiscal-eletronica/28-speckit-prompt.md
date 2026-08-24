# Prompt Speckit — fechamento essencial do gerenciamento de certificados

Use este texto como entrada do `speckit.specify`.

## Contexto

A spec 27 implementou o lock da versão, a validação NF-e sem estabelecimento Cloud e criou testes PostgreSQL para canônico, `noop` e rehost. Como a troca de certificados é uma operação administrativa eventual, a concorrência entre administradores não é bloqueadora nesta etapa. A revisão encontrou, porém, pendências de prioridade prática:

- os testes PostgreSQL de concorrência são evidência adicional, mas não devem bloquear a prontidão funcional;
- o gerador de `.cursor/rules/specify-rules.mdc` removeu entradas de specs anteriores em vez de apenas eliminar cabeçalhos/blocos duplicados;
- os novos Markdown ainda possuem whitespace final detectado por `git diff --check`.

Revise o código atual e corrija somente as lacunas essenciais, preservando o comportamento funcional já implementado.

## Fora de escopo

- Não restringir ou mascarar CNPJ completo na administração.
- Não alterar NFS-e, API Nacional, emissor municipal ou modelo 98.
- Não implementar venda, transferência ou devolução entre filiais.
- Não alterar gateway SEFAZ, schemas, leiautes ou fluxo de homologação.
- Não criar tabela, índice ou migração de banco.

## RF-01 — Integridade essencial do canônico e dos vínculos

Revise a criação/reutilização do contribuinte canônico e os fluxos de vínculo:

- a troca administrativa deve criar ou reutilizar um único canônico no fluxo normal;
- criação, atualização do estabelecimento, vínculo e auditoria devem ser atômicas;
- falha após a criação deve deixar zero registro parcial e zero auditoria de sucesso;
- IDs existentes devem ser preservados e nenhum registro deve ser removido para corrigir inconsistência;
- manter o teste de colisão em savepoint e o teste de reuso já existentes.

Os testes de duas sessões PostgreSQL podem permanecer como `#[Group('postgres')]` opcional, mas não constituem critério bloqueador desta entrega. Se mantidos, não devem apresentar uma sequência serial como prova de corrida real.

## RF-02 — Reconciliação administrativa segura

Revise a reconciliação manual e o `noop`:

- cada comando autenticado deve gerar no máximo uma auditoria;
- `noop` deve gerar uma auditoria e nenhuma mutação de negócio;
- falha deve reverter canônico, estabelecimento, versão, vínculo e auditoria da tentativa;
- reexecução sequencial deve ser idempotente no domínio;
- não deve existir `noop` baseado em leitura claramente obsoleta.

O teste PostgreSQL de duas sessões é opcional e deve ser tratado como melhoria de robustez, não como bloqueio para homologação.

## RF-03 — Seleção correta do certificado NF-e/NFC-e

Revise `SelectCertificateService` e os testes da seleção:

- somente aceitar candidato quando estabelecimento, vínculo e versão pertencem ao mesmo contribuinte;
- ausência do estabelecimento Cloud deve recusar a seleção;
- candidato inconsistente de maior prioridade deve ser ignorado quando houver outro válido;
- todos inválidos devem resultar em falha determinística, sem emissão;
- seleção normal e `selectFromCandidates` devem ser equivalentes;
- não usar fallback por raiz de CNPJ;
- manter NFS-e inalterada.

## RF-04 — Rehost e ativação sem inconsistência

Preservar as correções já feitas:

- versão compartilhada não muda de dono;
- IDs são preservados;
- `vinculo_ids_impediram_rehost` permanece ordenado;
- criação e ativação validam o contribuinte do estabelecimento, vínculo e versão;
- a operação deve falhar sem deixar vínculo parcialmente ativo.

Locks adicionais e prova de corrida real entre criação/ativação e rehost ficam como melhoria posterior, desde que a validação e a atomicidade sequencial estejam cobertas.

## RF-05 — Gerador de contexto sem perda histórica

Corrigir `.specify/scripts/bash/update-agent-context.sh` e regenerar `.cursor/rules/specify-rules.mdc`:

- manter um único cabeçalho `## Active Technologies` no arquivo gerado;
- ao consolidar blocos repetidos, preservar a união de todas as entradas únicas existentes;
- não remover referências de specs anteriores ainda presentes no repositório, incluindo as faixas 315–375;
- deduplicar somente linhas/entradas idênticas ou o mesmo slug, sem apagar tecnologias de outros módulos;
- preservar `Project Structure`, `Commands`, `Code Style`, `Recent Changes` e adições manuais;
- executar o gerador duas vezes e confirmar que a segunda execução não produz diff adicional (idempotência).

## RF-06 — Higiene

- Remover whitespace final somente dos Markdown introduzidos ou alterados pelas specs 27/28.
- Fazer `git diff --check` passar para os artefatos desta fatia.
- Executar `php -l` em todos os PHP alterados.
- Não modificar arquivos históricos não relacionados apenas para limpar o repositório.

## Critérios de aceite

1. O gerenciamento administrativo cria/reutiliza o canônico corretamente e não deixa estado parcial.
2. `noop`, rollback, rehost compartilhado e seleção NF-e permanecem cobertos por testes sequenciais confiáveis.
3. Candidato NF-e sem estabelecimento Cloud não é aceito.
4. O contexto gerado preserva todas as specs existentes e possui um único bloco canônico de tecnologias.
5. A segunda execução do gerador é idempotente.
6. `git diff --check` e `php -l` passam nos artefatos alterados.
7. Concorrência PostgreSQL, se mantida, é teste opcional e não bloqueia homologação.
8. CNPJ administrativo, NFS-e e transferências continuam fora do escopo.

## Entrega esperada

Produzir uma spec implementável com testes essenciais, regras de consolidação do gerador e critérios de validação. Não implementar código neste prompt.
