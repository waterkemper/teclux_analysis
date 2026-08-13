# Prompt `/speckit.specify` — integrar integridade XSD ao dry-run em ambiente Linux

## Contexto

As specs 20–21 foram implementadas no `HEAD` atual. O diagnóstico fiscal chama o gateway e valida o manifesto completo do pacote XSD, mas o dry-run da transferência apenas resolve o `FiscalConfigSnapshot` e prepara a fotografia. Ele não executa a mesma validação do pacote antes de calcular `pode_emitir`.

Assim, um dry-run pode responder `pode_emitir=true` quando `schema_package_hash` está ausente/divergente ou quando um import está quebrado; a falha só aparece mais tarde na emissão. A spec 367 exige que `pode_emitir=true` dependa também do snapshot íntegro.

O runtime de homologação e produção deste projeto será Linux. Questões específicas de caminhos Windows estão fora deste prompt.

Não implementar nesta etapa. Gerar spec, contratos, tarefas, testes e atualização do quickstart. Preservar `Transferencia`, NF-e 55, homologação e runtime Linux; não reabrir venda, devolução ou entrada fiscal.

## Objetivos

1. Fazer o dry-run, o diagnóstico, a validação XSD e o gate usarem a mesma decisão verificável de integridade do pacote regulatório.
2. Tornar a resolução física do pacote correta e fail-closed no runtime Linux, mantendo o manifesto com caminhos relativos POSIX determinísticos.

## Requisitos de integridade no dry-run

- Definir uma porta/serviço de preflight reutilizável pela Application; não chamar uma implementação Infrastructure diretamente do controller.
- O preflight deve validar `schemaRootRef`, versão, UF/modelo/ambiente, árvore alcançável, imports/includes/redefine/override confinados e `schema_package_hash` do manifesto `teclux-xsd-pkg-v1`.
- `schema_package_hash_kind` deve ser `package`; ausência ou divergência deve produzir bloqueio tipado (`SCHEMA_HASH_AUSENTE`, `SCHEMA_HASH_DIVERGENTE`, `SCHEMA_HASH_RAIZ_OBSOLETO`, `SCHEMA_IMPORT_*`).
- Com `persistir_alvo=true`, preflight inválido deve persistir `FALHA_OPERACIONAL`, ecoar `estado_fonte=persistido`, retornar `pode_emitir=false` e orientar `repetir_dry_run`; não alocar série, selar fotografia, chamar SEFAZ ou transmitir.
- Com `persistir_alvo=false`, preflight inválido deve permanecer somente calculado, não criar/alterar alvo e nunca sugerir `seguir_gate` ou `emitir`.
- `pode_emitir=true` só pode ocorrer quando fotografia, fontes, snapshot e pacote XSD estão íntegros; o gate posterior continua obrigatório.
- Testar o mesmo snapshot/pacote no diagnóstico, dry-run, `validateXsd` e emissão, evitando que cada caminho tenha uma regra diferente.

## Requisitos de caminhos no Linux

- Normalizar somente o caminho lógico do manifesto para `/`, sem `.` ou `..`; não alterar os bytes dos arquivos antes do SHA-256.
- Aceitar referência absoluta POSIX e referência relativa à aplicação.
- Resolver o caminho relativo a partir da raiz correta da aplicação, sem depender acidentalmente do diretório de trabalho do processo.
- Rejeitar traversal, symlink que escape do diretório autorizado, `file:`, HTTP/HTTPS e dependência inexistente.
- Manter ordenação byte-wise estável e digest determinístico no runtime Linux.

## Testes de aceite

- Dry-run com hash XSD ausente/divergente/import quebrado retorna bloqueio tipado e nunca `pode_emitir=true`.
- Dry-run elegível com pacote válido mantém a resposta 367 e só permite seguir para o gate.
- Diagnóstico e dry-run rejeitam o mesmo pacote mutado.
- Resolver com pacote temporário em caminho absoluto POSIX e caminho relativo encontra a raiz e seus imports corretamente.
- Teste prova que symlink externo e `../fora.xsd` não entram no manifesto.
- Teste prova que o digest do manifesto é determinístico para a mesma árvore e os mesmos bytes.
- Suíte permanece sem segredos, sem chamada SEFAZ no dry-run e sem efeitos de série/emissão.

## Saída esperada

Publicar a spec incremental, contrato do preflight compartilhado, matriz de códigos, testes e quickstart atualizado. Não alterar código nesta chamada e não declarar prontidão sem suíte verde no PHP 8.5.
