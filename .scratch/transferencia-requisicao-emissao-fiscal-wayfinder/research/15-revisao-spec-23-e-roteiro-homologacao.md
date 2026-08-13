# Revisão da spec 23 e roteiro final de homologação

## Confirmado

- O publicador não descarta mais `schema_package_hash`.
- O digest operacional não usa `sha256sum` do XSD raiz; usa o manifesto `teclux-xsd-pkg-v1` via a porta existente.
- Pacote sem hash, hash malformado, hash somente da raiz ou divergente é recusado sem persistência.
- Pacote `PUBLICADO` sem hash não é atualizado in-place; exige novo código.
- O snapshot recebe o hash persistido e o preflight 368 continua sendo a autoridade posterior.
- O diagnóstico, o dry-run e a emissão não ganharam um segundo algoritmo de manifesto.

## Verificações realizadas

- 14 arquivos PHP fiscais alterados passam em `php -l`.
- `git diff --check` acusa somente trailing whitespace em documentação/specs novas.
- A suíte PHPUnit não foi executada nesta sessão: o daemon Docker retornou `permission denied` para o engine Linux.

## Roteiro operacional

1. Reconstruir/recriar o serviço PHP e confirmar `extension_loaded('soap')`.
2. Configurar `FISCAL_ARTIFACTS_S3_BUCKET` e credenciais/endpoint sem colocá-los no git.
3. Garantir worker Horizon ativo para as filas fiscais.
4. Calcular o digest dentro do container:

```bash
docker compose exec -T php php artisan fiscal:xsd-package-digest \
  --schema-root-ref=vendor/nfephp-org/sped-nfe/schemes \
  --leiaute=4.00 --json
```

5. Publicar, em `--dry-run` e depois efetivamente, pacote + configuração SC/55/homologação com quatro endpoints SEFAZ oficiais e o digest retornado.
6. Limpar cache e executar o diagnóstico da filial base; exigir `veredito=APROVADO`, schemas verdes, certificado vinculado à filial e `cStat=107`.
7. Executar dry-run persistido com exatamente um grupo; exigir `pode_emitir=true`, `ELEGIVEL`, bloqueios vazios e `seguir_gate`.
8. Executar o gate; só com `liberado_rb03=true` fazer uma única emissão HTTP com `X-Request-Id`.
9. Acompanhar por chave/recibo, sem retransmissão cega, e gerar o pacote de evidências sanitizado.

## Conclusão

Nenhum novo prompt de correção funcional foi publicado após a spec 23. O próximo bloqueio deve ser resolvido por ambiente, dados de homologação ou evidência do diagnóstico — não por transmissão exploratória.

