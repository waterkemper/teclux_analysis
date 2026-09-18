# Pesquisa de testes, supply chain e entrega

## Achados verificáveis

### Testes

- O PHPUnit está configurado com suítes `Unit` e `Feature`, incluindo `app` como fonte; há configuração separada para PostgreSQL real. Fonte: [phpunit.xml](../../../laravel/backend/phpunit.xml#L1-L35), [phpunit.postgres.xml](../../../laravel/backend/phpunit.postgres.xml#L1-L29).
- O repositório contém aproximadamente 1.692 arquivos em `tests/Feature` e 960 em `tests/Unit`, além de muitos testes marcados `@group postgres` para concorrência, locks, triggers, schema e paridade com o legado. Isso demonstra amplitude, mas não mede cobertura efetiva nem garante execução no CI.
- O frontend declara Vitest e Testing Library, com script `test`; o backend declara script Composer `test` que executa `artisan test`. Fonte: [package.json](../../../laravel/backend/package.json#L6-L20), [composer.json](../../../laravel/backend/composer.json#L61-L64).
- Existem gates e runbooks para PostgreSQL real, homologação fiscal e fluxos críticos, mas vários testes explicitamente pulam quando o PostgreSQL real ou flags de homologação não estão disponíveis. Isso é apropriado para separar ambientes, mas cria uma dependência operacional que precisa de execução periódica garantida.

### CI/CD

- O workflow visível é `.github/workflows/docker-publish.yml`. Ele é acionado por tags `v*` ou execução manual, faz checkout, login no GHCR e publica imagens PHP-FPM e Nginx; não executa PHPUnit, Vitest, Pint, análise estática, `composer audit`, `npm audit` ou scan de imagem nesse workflow. Fonte: [docker-publish.yml](../../../laravel/.github/workflows/docker-publish.yml#L1-L67).
- O build de produção usa `npm ci`, `composer install` com `composer.lock`, `--no-dev`, autoload otimizado e `package:discover`. Isso melhora determinismo e reduz o conteúdo de runtime. Fonte: [production/Dockerfile](../../../laravel/docker/production/Dockerfile#L1-L36).
- O script de deploy recebe uma versão explícita, faz `pull`, health check do PHP, executa migrations/cache, preflight do Horizon e reinicia workers de modo controlado. Há versões PowerShell e Bash. Fonte: [deploy.sh](../../../laravel/deploy/deploy.sh#L1-L133), [deploy.ps1](../../../laravel/deploy/deploy.ps1#L1-L157).

### Supply chain e imagens

- O lockfile de Composer e o lockfile npm estão presentes e são usados nos builds. Entretanto, as imagens e a infraestrutura ainda usam tags mutáveis em alguns pontos: `node:22-bookworm`, `composer:2`, `php:8.5-*-bookworm`, `ubuntu-latest` e fallbacks `latest` no compose de produção. Isso deixa parte da cadeia sujeita a mudança sem alteração de código; o risco é maior quando não se fornecem tags de release explícitas.
- O Dockerfile de desenvolvimento instala Composer via `curl -fsSL https://getcomposer.org/installer | php`, sem verificação de assinatura visível no arquivo. É uma conveniência de ambiente de desenvolvimento, não prova de comprometimento, mas deve ser substituída ou protegida por verificação de integridade se o ambiente for considerado confiável.
- Não foram encontrados arquivos de configuração para PHPStan, Psalm, Rector, Infection, Semgrep, Trivy, Snyk, Sonar ou equivalente no checkout. Isso não prova que ferramentas não sejam executadas fora do repositório, mas não há contrato local reproduzível para essas verificações.

## Avaliação

A base de qualidade é forte em quantidade e em testes de regras difíceis do ERP: há suites unitárias/feature, grupos PostgreSQL, gates de concorrência e documentação operacional. O processo de entrega também tem boas propriedades: imagens multi-stage, lockfiles, health check, migrations explícitas, preflight e rollout de workers por release.

A maior lacuna sistêmica é a distância entre essa disciplina local e a automação verificável: o único workflow encontrado publica imagens, sem evidência de testes ou análise de segurança antes do push. A segunda lacuna é supply chain parcialmente mutável e sem scanner/analisador formal versionado. A prioridade deve ser confirmar o pipeline real usado fora deste repositório antes de concluir que esses controles estão ausentes em produção.

## Confiança

Alta para os arquivos e scripts presentes; média para a avaliação do processo organizacional, pois workflows externos, políticas do registry e jobs não versionados não foram observados.
