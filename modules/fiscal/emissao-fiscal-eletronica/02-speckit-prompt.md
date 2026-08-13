# Prompt para /speckit.specify — certificado A1 por Contribuinte Fiscal e Filial

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para gerenciar Versões de Certificado Fiscal custodiadas por Contribuinte Fiscal e associadas por Vínculos de Certificado Fiscal a uma ou mais Filiais na plataforma fiscal Laravel. Uma Filial pode usar certificado compartilhado ou exclusivo. Esta Etapa 2 pode avançar em paralelo com `01-speckit-prompt.md`.

Não implemente nesta etapa. Inspecione somente o checkout Laravel; a especificação fiscal consolidada fornecida no workspace de análise é a autoridade sobre o legado. Não solicite fontes Delphi.

## Limite desta entrega

- upload administrativo de PKCS#12, validação de senha, cadeia, titular, CNPJ, validade e uso;
- histórico, fingerprint, período de validade, estado de ativação e rotação sem interrupção;
- PFX e senha cifrados no PostgreSQL com chaves externas, separadas e rotacionáveis;
- descriptografia pelo worker somente em memória e pelo menor tempo possível;
- alertas de vencimento, teste de recuperação, expurgo seguro e auditoria de upload, validação, ativação e uso;
- autorização server-side e interface administrativa mínima, sem devolver material privado.
- cadastro explícito de Contribuinte Fiscal, Estabelecimento Fiscal e Vínculo de Certificado Fiscal, com vigência, UF, ambiente, modelo, capacidade e prioridade;
- seleção determinística do certificado por Filial/contexto, sem fallback implícito apenas pela raiz de CNPJ;
- distinção entre certificado de assinatura XML e credencial de autenticação da transmissão quando o serviço exigir.

Não inclua geração de XML, comunicação SEFAZ, configuração regulatória, emissão ou eventos fiscais.

## Decisões obrigatórias

1. Certificado é versionado no Contribuinte Fiscal; substituição não apaga o histórico usado por Tentativas Fiscais.
2. Logs, filas, Artefatos, métricas e respostas nunca carregam PFX ou senha.
3. Ativação exige que o titular pertença ao mesmo Contribuinte Fiscal da Filial associada, Vínculo explícito e validação completa; não exige igualdade literal com o CNPJ da Filial quando a regra oficial permitir.
4. Falha de recuperação, expiração ou ausência de vínculo elegível bloqueia novas assinaturas/transmissões das Filiais afetadas, não consultas de documentos existentes.
5. Igualdade da raiz de CNPJ não cria vínculo automaticamente; credenciamento continua sendo validado por estabelecimento/UF.

## Critérios e testes obrigatórios

- acesso negado, arquivo inválido, senha errada, CNPJ de outro Contribuinte Fiscal, expirado e caminho feliz;
- rotação concorrente preserva uma versão preferencial por Vínculo/contexto e Tentativas referenciam versão e vínculo usados;
- uma versão compartilhada alerta/bloqueia todas as Filiais afetadas, enquanto certificado exclusivo não afeta as demais;
- certificado de assinatura e credencial de transmissão distintos, quando aplicável;
- teste comprova cifragem em repouso e sanitização de telemetria;
- alertas são idempotentes e configuráveis;
- spec inclui ameaça, estratégia de chaves, recuperação e trilha de auditoria.

Produza spec e plano executáveis. Não implemente durante `/speckit.specify`.
```
