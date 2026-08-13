# Revisar a implementação da spec 22 e a prontidão do smoke real

Type: research
Status: resolved
Blocked by:

## Question

Depois da implementação da spec 22, o preflight XSD do dry-run está integrado de forma coerente ao diagnóstico, à validação/emissão e à resolução de caminhos Linux? Existe algum novo ajuste de código que precise ser publicado como prompt `/speckit.specify` antes do primeiro teste real em homologação?

## Scope

Transferência, NF-e modelo 55, homologação SEFAZ e runtime Linux. Venda entre filiais, `VendaTransferencia`, `DevolucaoTransferencia`, entrada fiscal automática, produção e implementação nesta revisão permanecem fora.

## Answer

A implementação da spec 22 está presente no `HEAD` `26cc593b`, sobre a base `58dcd34a`:

- o dry-run passa pelo serviço Application `TransferenciaFiscalXsdPackagePreflight`;
- a porta `FiscalXsdPackageIntegrityPort` está vinculada ao adapter NFePHP;
- códigos `SCHEMA_*` entram nos bloqueios e são persistidos como `FALHA_OPERACIONAL` quando o alvo é persistido;
- o resolver Linux usa a raiz da aplicação para referências relativas, confina `realpath`/symlink e mantém digest determinístico;
- os testes 368 cobrem hash, imports, CWD, caminho absoluto POSIX, symlink externo, persistência e ausência de SOAP no dry-run.

Não foi encontrado um novo descumprimento funcional claro que justifique o Prompt 23. O próximo trabalho é operacional: executar a suíte no container PHP 8.5, configurar um snapshot real de homologação, provar diagnóstico + dry-run + gate e só então fazer uma única transmissão controlada.

## Evidence

- `git diff 58dcd34a...HEAD`: 33 arquivos, incluindo implementação, contratos e testes 368.
- `php -l`: 16 arquivos PHP modificados, 0 falhas, usando os caminhos relativos corretos a partir de `backend`.
- `git diff --check`: apenas trailing whitespace em documentação/specs novas; nenhum erro funcional identificado.
- `docker compose config --services`: composição válida (`php`, `nginx`, `redis`).
- A execução da suíte não foi possível nesta sessão: PHP local 8.2.21 não atende ao requisito `^8.5`, e o daemon Docker não estava acessível.

## Operational verdict

`CÓDIGO_PRONTO_PARA_ENSAIO_CONTROLADO`, mas `NÃO_DECLARAR_SMOKE_REAL` até cumprir o runbook de homologação e arquivar as evidências sanitizadas. O gate é obrigatório e não transmite; o POST de emissão deve ocorrer no máximo uma vez para o mesmo grupo/idempotency key.

