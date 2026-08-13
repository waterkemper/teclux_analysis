# Prompt SpecKit 11 — Integridade do XML, chave e pacote normativo

```text
/speckit.specify

Revise e especifique a correção incremental da implementação de homologação real da NF-e 55 de Transferencia. Não implemente código nesta etapa.

Leia:

- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/08-revisao-implementacao-356-e-prompts-restantes.md
- /mnt/c/teclux_analysis/specs/356-trf-fiscal-homologacao/spec.md
- /mnt/c/teclux_analysis/specs/356-trf-fiscal-homologacao/contracts/gateway-homologacao-nfe55.md
- /mnt/c/teclux_analysis/specs/356-trf-fiscal-homologacao/contracts/fotografia-projecao-transferencia.md
- /mnt/c/teclux_analysis/backend/app/Infrastructure/Fiscal/NfePhp/NfePhpFotografiaSerializer.php
- /mnt/c/teclux_analysis/backend/app/Infrastructure/Fiscal/NfePhp/NfePhpToolsFactory.php
- /mnt/c/teclux_analysis/backend/app/Application/Fiscal/Emissao/AlocarEmissaoNfe55Service.php
- /mnt/c/teclux_analysis/backend/tests/Unit/Fiscal/NfePhpSerializeFromFotografiaTest.php
- /mnt/c/teclux_analysis/backend/composer.lock

Escopo exclusivo: Transferencia, NF-e modelo 55, homologação. VendaTransferencia e DevolucaoTransferencia continuam históricos de leitura e não podem formar grupos, fotografias, emissões, efeitos ou testes de implementação.

Especifique:

1. Fotografia selada como única fonte: nenhum default para campos fiscais obrigatórios ou semanticamente relevantes. Defaults permitidos somente quando definidos formalmente pelo schema e sem alterar a identidade fiscal; caso contrário, falha explícita antes do XML.
2. Mapeamento completo e validado da fotografia para NFePHP Make, incluindo identificação, `cNF`, `cDV`, `dhEmi`, série, número, ambiente, emitente, destinatário, itens, tributos, totais, transporte, pagamento e demais grupos aplicáveis ao caso.
3. A chave derivada do XML deve coincidir com a chave/identidade persistida da emissão; divergência deve bloquear transmissão e gerar erro tipado. Não gerar chave aleatória ou completar dados depois do seal.
4. Versão de leiaute, `versao` do XML, pacote de schemas, `schemes`, notas técnicas e endpoint devem vir do `FiscalConfigSnapshot` normativo vigente. Não usar `4.00`, `PL_009_V4`, `TECLUX`, UF, natureza, CRT, PIS/COFINS, transporte, pagamento ou totais como fallback silencioso.
5. `schemaRootRef` deve apontar para o pacote efetivamente usado pelo NFePHP; o gate deve verificar arquivos, imports/includes, versão/hash e compatibilidade com UF, ambiente e modelo.
6. Testes devem provar estrutura, XSD, assinatura, chave de 44 dígitos, digest, `cDV`, identidade com a emissão persistida, ausência de defaults e rejeição de fotografia incompleta. Fixtures devem ser explicitamente de teste/dry-run.

Entregue matriz de requisitos, contratos de erro, critérios de aceite e ordem de implementação. Não altere plataforma 333–348 além dos pontos indispensáveis à integridade da fotografia e do gateway.
```
