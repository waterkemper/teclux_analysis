# Avaliação da stack PHP para emissão fiscal direta

Data: 2026-07-26

## Conclusão

A candidata é a família NFePHP via Composer: `nfephp-org/sped-nfe` (XML, validação, assinatura, SEFAZ e eventos dos modelos 55/65), `sped-common` (A1 e infraestrutura comum) e `sped-da` (DANFE/DANFC-e). Avaliar `sped-pos` apenas para ESC/POS.

Esta recomendação é **condicionada ao ticket 02**. Uma versão/tag só pode ser aprovada após comparação com cada leiaute, serviço, evento, contingência e UF oficial e homologação real. Declarações do projeto não substituem essa verificação. Evitar wrappers Laravel, que adicionam atraso regulatório, e o pacote antigo [nfephp-org/nfephp](https://packagist.org/packages/nfephp-org/nfephp), oficialmente abandonado.

## Evidências primárias

O [README do sped-nfe](https://github.com/nfephp-org/sped-nfe) declara geração, assinatura, envio à SEFAZ, modelos 55/65 em todos os estados e atualização para NT 2025.001, NT 2025.002 RTC e schemas recentes. Também admite documentação inicial: é evidência de escopo/manutenção, não certificação.

O [composer oficial](https://raw.githubusercontent.com/nfephp-org/sped-nfe/master/composer.json) mostra biblioteca Composer/PSR-4, PHP >=7.4 e extensões/dependências. O [Packagist](https://packagist.org/packages/nfephp-org/sped-nfe) registrava v5.2.6 em 2026-06-15 e ~1,64 milhão de instalações. Fixar release estável no lock, nunca `dev-master`.

A documentação de [funcionalidades](https://raw.githubusercontent.com/nfephp-org/sped-nfe/master/docs/Funcionalidades.md) separa `Make`, `Tools`, `Standardize` e `Complements`. [Tools](https://raw.githubusercontent.com/nfephp-org/sped-nfe/master/docs/Tools.md) documenta modelos, assinatura/XSD, SOAP injetável e atribui à aplicação persistir contingência. O [código](https://raw.githubusercontent.com/nfephp-org/sped-nfe/master/src/Tools.php) implementa envio, recibo, consulta, inutilização, status, CC-e e cancelamento. Estado, idempotência, retries, reconciliação e autorização continuam no ERP. [Complements](https://raw.githubusercontent.com/nfephp-org/sped-nfe/master/docs/Complements.md) compõe XML e protocolo; guardar request, response e processado separadamente, promovendo somente o protocolado validado.

[Certificate](https://raw.githubusercontent.com/nfephp-org/sped-common/master/src/Certificate.php) lê A1 PKCS#12, extrai chaves/cadeia, validade e identidade. Não oferece cofre, rotação, autorização ou auditoria: PFX/senha devem ser descriptografados somente no worker e nunca ir a fila/log. O [sped-common](https://raw.githubusercontent.com/nfephp-org/sped-common/master/composer.json) exige OpenSSL/SOAP/cURL/mbstring e analisa PHP até 8.5. Uma [issue histórica](https://github.com/nfephp-org/sped-nfe/issues/1038) reforça testar A1 reais no PHP/OpenSSL de produção.

O [sped-da](https://raw.githubusercontent.com/nfephp-org/sped-da/master/README.md) gera PDF/HTML do XML e ressalta que o XML, não o auxiliar genérico, é fonte. Seu [composer](https://raw.githubusercontent.com/nfephp-org/sped-da/master/composer.json) exige DOM, GD e mbstring. Validar layouts e impressoras; [sped-pos](https://github.com/nfephp-org/sped-pos) é opcional.

## Compatibilidade local

Laravel requer PHP ^8.3 e as imagens usam 8.5, sem conflito aparente. Os Dockerfiles, porém, não habilitam explicitamente todas as extensões exigidas, sobretudo SOAP, DOM/SimpleXML e GD. O spike deve ajustar build/web/worker e executar `composer check-platform-reqs`.

## Adapter recomendado

- portas `FiscalXmlEngine`, `SefazGateway`, `FiscalDocumentRenderer` e `CertificateProvider`;
- `NfePhpFiscalGateway` na infraestrutura; nenhum `Make`, `Tools`, `Certificate`, `stdClass` ou XML interno no domínio;
- DTOs imutáveis e resultados com `cStat`, motivo, protocolo/recibo e request/response;
- nova `Tools` por operação, configurando Filial, UF, ambiente, modelo e contingência;
- estado, fila, idempotência, reconciliação, S3, vínculos de certificado e autorizações na aplicação;
- contratos com fixtures oficiais/anônimas e homologação por UF.

## Gate após o ticket 02

Matriz oficial × versão/tag/schema; PHP 8.5/OpenSSL/extensões; XML/XSD/A1 por Contribuinte Fiscal e Vínculo de Certificado Fiscal; autorização, timeout/reconciliação, cancelamento, CC-e, inutilização e contingências; QR Code, DANFE/DANFC-e e impressoras; pin no lock e regressão regulatória.
