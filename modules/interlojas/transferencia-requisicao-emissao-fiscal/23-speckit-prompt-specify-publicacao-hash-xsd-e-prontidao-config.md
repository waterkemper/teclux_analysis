# Prompt `/speckit.specify` — fechar publicação da configuração e do hash do pacote XSD

## Contexto confirmado

O diagnóstico executado no runtime Linux PHP 8.5.4 para `filial=1`, `UF=SC`, `modelo=55` retornou:

- `PRECONDICAO_EXT`: a imagem em execução não expõe a extensão `soap`;
- `LACUNA`: não existe configuração fiscal publicada cobrindo SC/modelo 55/homologação/data atual;
- `PRECONDICAO_INFRA`: bucket de artefatos não configurado.

Além desses bloqueios operacionais, a revisão do código encontrou uma lacuna funcional: `FiscalConfigurationResolver` lê `cloud_fiscal_pacotes_regulatorios.schema_package_hash`, porém `CloudFiscalPublishRepository::publishPacote()` não persiste o campo `schema_package_hash` recebido no payload. O comando `fiscal:publicar-config` pode aparentar publicar o pacote, mas o diagnóstico/dry-run ficará inevitavelmente bloqueado por `SCHEMA_HASH_AUSENTE`.

Não implementar nesta etapa. Gerar spec, contratos, tarefas, testes e quickstart. O runtime alvo é Linux. Preservar `Transferencia`, NF-e modelo 55 e homologação. Não reabrir `VendaTransferencia`, `DevolucaoTransferencia`, entrada fiscal automática, produção ou um segundo pipeline fiscal.

## Objetivo

Fechar a publicação versionada do pacote regulatório para que a configuração de homologação carregue, de forma verificável, o digest do manifesto XSD `teclux-xsd-pkg-v1` que já é consumido pelo diagnóstico, dry-run, `validateXsd` e emissão.

## Requisitos

1. O payload de `fiscal:publicar-config` deve aceitar `pacote.schema_package_hash` e não pode descartar esse campo ao persistir em `cloud_fiscal_pacotes_regulatorios.schema_package_hash`.
2. O contrato deve definir `schema_package_hash` como SHA-256 hexadecimal de 64 caracteres do manifesto completo do pacote, nunca como SHA-256 isolado do XSD raiz. O tipo lógico deve permanecer `package`.
3. A geração/conferência do digest deve reutilizar a autoridade do resolver XSD existente. Não copiar o algoritmo em um segundo gateway, comando ou serializer divergente.
4. Definir uma forma operacional segura de obter o digest do pacote publicado no filesystem Linux — comando ou saída documentada — sem expor caminhos sensíveis, bytes XML ou segredos.
5. `--dry-run` do publicador deve validar e mostrar a intenção sanitizada; publicação efetiva deve ser imutável/versionada e rejeitar hash ausente, formato inválido ou pacote incompatível conforme o contrato escolhido.
6. O snapshot resolvido para `UF=SC`, modelo 55 e ambiente `homologacao` deve receber o hash de pacote persistido. A ausência não pode ser convertida em valor default.
7. Cobrir com testes:
   - payload com hash de manifesto persiste o valor;
   - payload sem hash é rejeitado ou permanece explicitamente inelegível, conforme decisão da spec, nunca verde;
   - `dry-run` não grava configuração;
   - hash de raiz é rejeitado como `SCHEMA_HASH_RAIZ_OBSOLETO` ou equivalente tipado;
   - pacote mutado após publicação é recusado pelo diagnóstico e pelo dry-run com `SCHEMA_HASH_DIVERGENTE`;
   - configuração publicada para SC/modelo 55/homologação resolve o mesmo snapshot esperado pelo diagnóstico;
   - nenhum segredo aparece no JSON, logs ou evidências.
8. Atualizar o runbook com a sequência: construir imagem Linux com `soap`, configurar bucket, publicar pacote + configuração, limpar cache, executar diagnóstico, dry-run e gate. Não instruir transmissão para descobrir erro de configuração.

## Critérios de aceite

- O comando de publicação não ignora mais `schema_package_hash`.
- Uma configuração válida de SC/modelo 55/homologação chega à etapa `schemas` com o hash de pacote disponível.
- Pacote sem hash, hash de raiz ou hash divergente continua fail-closed.
- Diagnóstico e dry-run usam a mesma decisão de integridade XSD.
- A alteração não cria migração se a coluna existente for suficiente.
- Nenhuma chamada SEFAZ ocorre durante publicação, dry-run ou validação de pacote.
- O escopo permanece exclusivamente Transferência NF-e 55 em homologação Linux.

