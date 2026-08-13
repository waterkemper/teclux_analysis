# Revisar integração do preflight XSD no dry-run e compatibilidade de caminhos

Type: research
Status: resolved
Blocked by:

## Question

Depois das specs 20 e 21, o dry-run impede `pode_emitir=true` quando o pacote XSD está inválido? O resolver funciona com referências absolutas Windows e POSIX sem quebrar o manifesto ou permitir escape do diretório autorizado?

## Scope

Transferência, NF-e modelo 55, homologação e preparação do smoke. Nenhuma implementação nesta revisão. Venda, devolução, entrada fiscal e produção permanecem fora.

## Answer

As specs 20–21 implementaram a seleção do certificado por filial, o manifesto completo de imports do XSD e o estado persistido honesto do dry-run.

Ainda há duas lacunas:

1. O controller do dry-run não chama `NfePhpXsdPackageResolver`, `assertSchemasAvailable` nem uma porta equivalente. Ele pode retornar `pode_emitir=true` apenas com bloqueios da fotografia vazios, sem verificar o hash do pacote XSD. Isso não atende FR-367-011, que exige snapshot íntegro para `pode_emitir=true`.
2. `NfePhpXsdPackageResolver::canonicalizeLogical()` converte barras, mas identifica como relativo um caminho Windows absoluto com unidade (`C:/...`) e pode prefixar `getcwd()`. O caminho de imports em um pacote Windows pode ser rejeitado incorretamente ou não ser confinado como previsto.

Prompt publicado:

- [22 — preflight XSD no dry-run e caminhos multiplataforma](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/22-speckit-prompt-specify-preflight-xsd-dryrun-e-caminhos.md)

## Veredito operacional

`NAO_LIBERAR_SMOKE_REAL` até o preflight XSD ser compartilhado pelo dry-run, diagnóstico e emissão, os testes Windows/POSIX passarem e a suíte completa ser executada no runtime PHP 8.5.

