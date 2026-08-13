# Revisão do preflight XSD, dry-run e caminhos

## Confirmado

- O commit 367 calcula o hash do manifesto `teclux-xsd-pkg-v1`, incluindo a árvore alcançável de `schemaLocation`.
- Imports quebrados, traversal e URLs externas são rejeitados pelo resolver.
- O diagnóstico chama `assertSchemasAvailable()`, que resolve e valida o pacote completo.
- O dry-run devolve estado persistido/calculado corretamente e não aloca série, número ou emissão.
- A suíte adicionou testes de mutação de import, hash da raiz obsoleto e estado do dry-run.

## Lacunas

- O dry-run não executa o preflight XSD e não transforma hash ausente/divergente em bloqueio de `pode_emitir`.
- A normalização de `C:/...` em `canonicalizeLogical()` não reconhece unidade Windows como caminho absoluto antes de aplicar `getcwd()`.
- Os testes existentes cobrem a árvore em diretórios temporários, mas não cobrem caminho Windows absoluto nem a igualdade de digest entre separadores.

## Decisão

Publicar o Prompt 22. Até sua implementação e validação, o diagnóstico pode estar verde enquanto o dry-run não é uma prova completa de prontidão do alvo.

## Ambiente de verificação

Os arquivos críticos passam em `php -l` com PHP local 8.2.21. A aplicação declara PHP `^8.5`; a suíte PHPUnit não foi executada neste host. Também não há arquivo Compose no workspace raiz para iniciar o serviço automaticamente.

