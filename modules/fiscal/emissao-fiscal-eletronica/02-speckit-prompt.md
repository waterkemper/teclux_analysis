# Prompt para /speckit.specify — certificado A1 por Filial

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para gerenciar Certificado A1 versionado por Filial na plataforma fiscal Laravel. Esta Etapa 2 pode avançar em paralelo com `01-speckit-prompt.md`.

Não implemente nesta etapa. Inspecione somente o checkout Laravel; a especificação fiscal consolidada fornecida no workspace de análise é a autoridade sobre o legado. Não solicite fontes Delphi.

## Limite desta entrega

- upload administrativo de PKCS#12, validação de senha, cadeia, titular, CNPJ, validade e uso;
- histórico, fingerprint, período de validade, estado de ativação e rotação sem interrupção;
- PFX e senha cifrados no PostgreSQL com chaves externas, separadas e rotacionáveis;
- descriptografia pelo worker somente em memória e pelo menor tempo possível;
- alertas de vencimento, teste de recuperação, expurgo seguro e auditoria de upload, validação, ativação e uso;
- autorização server-side e interface administrativa mínima, sem devolver material privado.

Não inclua geração de XML, comunicação SEFAZ, configuração regulatória, emissão ou eventos fiscais.

## Decisões obrigatórias

1. Certificado é versionado; substituição não apaga o histórico usado por Tentativas Fiscais.
2. Logs, filas, Artefatos, métricas e respostas nunca carregam PFX ou senha.
3. Ativação exige correspondência com o CNPJ da Filial e validação completa.
4. Falha de recuperação ou expiração bloqueia novas assinaturas, não consultas de documentos existentes.

## Critérios e testes obrigatórios

- acesso negado, arquivo inválido, senha errada, CNPJ divergente, expirado e caminho feliz;
- rotação concorrente preserva uma versão ativa inequívoca e Tentativas referenciam a versão usada;
- teste comprova cifragem em repouso e sanitização de telemetria;
- alertas são idempotentes e configuráveis;
- spec inclui ameaça, estratégia de chaves, recuperação e trilha de auditoria.

Produza spec e plano executáveis. Não implemente durante `/speckit.specify`.
```
