# Avaliar a stack PHP para comunicação fiscal direta

Type: research
Status: resolved
Blocked by: 02

## Question

Quais bibliotecas PHP/Laravel mantidas e verificáveis contra as especificações oficiais podem formar, validar, assinar, transmitir e gerar DANFE para NF-e/NFC-e sem serviço proprietário, e qual adapter evita acoplamento?
## Research

Relatório: [Avaliação da stack PHP para emissão fiscal direta](../research/03-stack-php-emissao-fiscal.md)

## Answer

Adotar como candidata a integração Composer direta com `nfephp-org/sped-nfe`, `sped-common` e `sped-da`, avaliando `sped-pos` apenas para térmica. Isolar NFePHP por portas próprias e `NfePhpFiscalGateway`.

A decisão final depende do ticket 02: aprovar versão estável apenas após matriz oficial, homologação por UF e validação do DANFE/DANFC-e. O ambiente atual também precisa incorporar e verificar as extensões PHP exigidas.
