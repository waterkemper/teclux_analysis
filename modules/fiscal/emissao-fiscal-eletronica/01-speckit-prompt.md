# Prompt para /speckit.specify — configuração fiscal e gateway NFePHP

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a Etapa 1 da plataforma de Emissão Fiscal Eletrônica no Laravel: configuração fiscal versionada e uma porta própria para o gateway NFePHP, verificável em homologação sem emitir documento em produção.

Não implemente nesta etapa. Inspecione o checkout Laravel e corrija hipóteses contrariadas pelo código. Não tente consultar o Delphi: `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md` é o pacote de decisões autoritativo. Classifique achados como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta entrega

- configuração por Filial, UF, modelo 55/65, ambiente, vigência, autorizador, endpoints, schemas, tabelas, CSC/QR Code e contingências permitidas;
- adoção candidata de `nfephp-org/sped-nfe`, `sped-common` e `sped-da`, sempre atrás de portas próprias e de `NfePhpFiscalGateway`;
- contratos internos sem tipos da NFePHP;
- diagnóstico executável que valide runtime PHP, extensões, versões, schemas, configuração e comunicação em homologação;
- política distinta para NF-e e NFC-e e mecanismo de atualização regulatória sem constantes globais;
- proteção de segredos em logs, filas, respostas e diagnóstico.

Não inclua certificado A1, persistência da Emissão Fiscal, numeração, assinatura/transmissão real, UI operacional ou produção. Esses itens pertencem aos prompts posteriores.

## Decisões obrigatórias

1. Baseline inicial: leiaute 4.00, MOC 7.0 e Notas Técnicas vigentes, versionados por vigência.
2. Homologação por UF/modelo é pré-condição de produção; sucesso genérico de biblioteca não basta.
3. NF-e admite apenas SVC, EPEC e FS-DA habilitados; NFC-e admite offline e EPEC somente quando autorizados pela UF.
4. A biblioteca é detalhe substituível de infraestrutura; domínio e aplicação não dependem de seus tipos.

## Critérios e testes obrigatórios

- configuração válida é resolvida deterministicamente para Filial/UF/modelo/ambiente/data;
- lacuna, sobreposição ou incompatibilidade produz diagnóstico acionável;
- o probe de homologação nunca aponta silenciosamente para produção;
- matriz de contrato cobre modelos 55/65, ambientes, versões válidas/inválidas e sanitização de segredos;
- a spec identifica os seams Laravel existentes a reutilizar ou criar e registra riscos de atualização da NFePHP.

Produza spec, plano, modelo de configuração, contratos das portas, matriz de compatibilidade e estratégia de testes. Não implemente durante `/speckit.specify`.
```
