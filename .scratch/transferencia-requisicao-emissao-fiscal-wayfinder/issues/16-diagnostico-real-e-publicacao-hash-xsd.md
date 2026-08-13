# Diagnosticar pré-condições reais e publicação do hash XSD

Type: research
Status: resolved
Blocked by:

## Question

O diagnóstico real de homologação para filial 1/SC/modelo 55 já permite avançar para SEFAZ? Os bloqueios são apenas de ambiente ou existe lacuna no caminho de publicação da configuração fiscal?

## Answer

O resultado é `REPROVADO` antes de qualquer chamada SEFAZ:

1. `soap` ausente no container PHP 8.5.4. O Dockerfile atual declara `docker-php-ext-install ... soap`; reconstruir/recriar a imagem é necessário.
2. Não há configuração publicada para SC/modelo 55/homologação na data atual. O baseline existente cobre SP e não deve ser reutilizado para inventar endpoints SC.
3. `FISCAL_ARTIFACTS_S3_BUCKET` está vazio. Configurar o bucket/credenciais do storage de artefatos e limpar o cache de configuração.

Foi encontrada também uma lacuna de código: o publicador aceita pacote regulatório, mas `CloudFiscalPublishRepository::publishPacote()` não grava `schema_package_hash`, enquanto o resolver o exige. Sem esse ajuste, a próxima execução falhará com `SCHEMA_HASH_AUSENTE` mesmo após a configuração SC ser publicada.

Prompt publicado:

- [23 — publicação do hash XSD e prontidão da configuração](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/23-speckit-prompt-specify-publicacao-hash-xsd-e-prontidao-config.md)

## Próximas verificações operacionais

```bash
docker compose build --no-cache php
docker compose up -d --force-recreate php redis nginx
docker compose exec -T php php -m | grep -i '^soap$'
docker compose exec -T php php artisan config:clear
```

Depois da implementação do Prompt 23, publicar um pacote/configuração própria para SC com endpoints oficiais confirmados, hash do manifesto XSD e vigência atual. Só então repetir o diagnóstico. O bucket deve estar configurado antes do veredito final, pois `infra_storage` é bloqueador em runtime não-testing.

