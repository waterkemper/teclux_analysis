# Avaliar testes, supply chain e processo de entrega

Type: research
Status: resolved
Blocked by:

## Question

Qual é a cobertura e distribuição efetiva de testes unitários, integração, banco real, contrato, frontend e fluxos críticos; como lint, análise estática, CI/CD, Docker, backups, migrations e upgrades de dependências são governados; e quais lacunas comprometem segurança, velocidade e confiabilidade de entrega?

## Answer

Existe uma base extensa de PHPUnit/Vitest, grupos PostgreSQL, gates de concorrência e runbooks, além de builds multi-stage com lockfiles e deploy versionado com health check, migration, cache e preflight Horizon. A evidência versionada de CI, porém, mostra apenas publicação de imagens; não há nesse workflow execução de testes, análise estática, auditoria de dependências ou scan de imagem. Também há tags mutáveis e instalação de Composer via curl sem verificação visível no Dockerfile de desenvolvimento. Essas lacunas precisam ser confirmadas contra o processo externo real antes de virar conclusão operacional. Detalhes: [Pesquisa de testes, supply chain e entrega](../research/07-testes-supply-chain-entrega.md).
