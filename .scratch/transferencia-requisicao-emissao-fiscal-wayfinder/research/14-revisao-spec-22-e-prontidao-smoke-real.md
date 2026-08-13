# Revisão da spec 22 e prontidão para smoke real

## Confirmado

- `TransferenciaFiscalXsdPackagePreflight` é chamado antes de calcular `pode_emitir`.
- O preflight usa resultado tipado e não expõe Infrastructure no controller.
- Pacote inválido gera `SCHEMA_*`, impede `pode_emitir=true` e, com persistência, grava `FALHA_OPERACIONAL`.
- Referências relativas Linux são resolvidas contra a raiz da aplicação; CWD, `..`, URI externa e symlink de escape não são autoridade.
- A mesma resolução de pacote continua usada pelo diagnóstico, `validateXsd` e caminho de emissão.
- O escopo permanece somente `Transferencia` NF-e 55. Não reabrir venda/devolução.

## Não bloqueador

- A revisão encontrou trailing whitespace em documentação/specs adicionadas pela feature. Isso é limpeza de estilo, não motivo para novo prompt funcional.
- A suíte automatizada precisa ser executada no ambiente autoritativo PHP 8.5/Linux; lint local não substitui essa execução.

## Próximo passo

Usar o runbook `docs/operations/fiscal-transferencia-homologacao-smoke.md`:

1. subir `php`, `redis` e `nginx` no Compose;
2. garantir `FISCAL_TRANSFERENCIA_SKIP_SEFAZ_TESTING=false` e `FISCAL_TRF_HOMOLOG_SMOKE_REQUIRE_SEFAZ=true`;
3. executar a suíte 357–368 no container;
4. executar diagnóstico com certificado explicitamente vinculado à filial base e esperar `cStat=107`;
5. executar dry-run persistido com pacote XSD íntegro e um único grupo;
6. executar o gate e exigir `liberado_rb03=true`;
7. fazer uma única chamada HTTP de emissão, acompanhar por chave/recibo e coletar o pacote de evidências.

Não publicar novo prompt `/speckit.specify` antes desse ensaio: o estado atual não apresenta lacuna de código demonstrada pela spec 22.

