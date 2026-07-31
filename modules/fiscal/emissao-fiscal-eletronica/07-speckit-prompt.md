# Prompt para /speckit.specify — custódia de Artefatos e DANFE

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para custodiar Artefatos Fiscais e disponibilizar XML/DANFE de NF-e autorizada. Depende de `04-speckit-prompt.md`.

Não implemente. Inspecione os adapters de storage, autenticação e geração de documentos existentes no Laravel antes de propor novos seams.

## Limite desta entrega

- catálogo PostgreSQL e fila `fiscal-artefatos`;
- staging durável no PostgreSQL até upload, validação de hash e confirmação do objeto;
- S3 privado, versionado, Object Lock Governance e chave `fiscal/ambiente/filial/modelo/AAAA/MM/emissao_uuid/artefato_uuid.ext`;
- preservação separada de XML pré-assinado, assinado, pedidos/respostas, `nfeProc` e DANFE efetivamente usado;
- SHA-256, tamanho, MIME, versão do objeto, origem e metadados fiscais;
- DANFE derivado exclusivamente do XML arquivado, registrando renderizador e hash;
- download autenticado e URL pré-assinada de cinco minutos;
- quarentena por divergência de hash e recuperação de upload incompleto.

Não inclua distribuição por e-mail, XML de eventos ainda não implementados ou réplica regional.

## Invariantes

1. Resultado fiscal não depende da disponibilidade do S3.
2. Objetos nunca são sobrescritos nem normalizados.
3. Produção retém por seis anos ou prazo jurídico maior; homologação, 180 dias salvo evidência preservada.
4. Reimpressão nunca consulta cadastros atuais.

## Testes obrigatórios

- upload feliz, retry idempotente, indisponibilidade do S3 e recuperação após reinício;
- hash divergente causa QUARENTENA e bloqueia acesso/distribuição futura;
- autorização de download e expiração da URL;
- DANFE reimpresso corresponde ao XML arquivado;
- retenção e metadados são verificáveis.

Produza spec, plano, ciclo de vida do Artefato, política S3 e testes. Não implemente durante `/speckit.specify`.
```
