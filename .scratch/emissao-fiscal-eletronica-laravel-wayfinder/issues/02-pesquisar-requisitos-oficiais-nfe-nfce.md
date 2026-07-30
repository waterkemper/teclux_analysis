# Levantar os requisitos oficiais vigentes de NF-e e NFC-e

Type: research
Status: resolved
Blocked by:

## Question

Quais leiautes, serviços, eventos, ambientes, contingências, regras de certificado, QR Code, DANFE, prazos e obrigações de guarda vigentes em julho de 2026 limitam a arquitetura, incluindo variações por UF?

## Answer

O baseline vigente em 25/07/2026 é o leiaute 4.00/MOC 7.0 acrescido cumulativamente pelas Notas Técnicas e schemas ativos, incluindo RTC, CNPJ alfanumérico, QR Code v3, DANFE Simplificado Tipo 2, EPEC e distribuição DF-e. A arquitetura deve versionar schemas, regras, tabelas e vigências; resolver serviços por UF, modelo, ambiente e autorizador; usar A1 ICP-Brasil com cofre, rotação e auditoria; e persistir estados idempotentes, XML processado/protocolos/eventos e hashes.

NF-e e NFC-e exigem políticas distintas: NF-e admite SVC, EPEC e FS-DA conforme ativação; NFC-e usa contingência offline e EPEC apenas quando autorizado pela UF. Prazos, credenciamento, endpoints, CSC/QR Code, contingências e eventos devem ser configuração versionada por UF, nunca constantes globais. S3 pode ser o arquivo canônico imutável, mantendo a cópia temporária em dadosfiscais.xmlnfe e reconciliação transacional.

Relatório completo: [Requisitos oficiais de NF-e e NFC-e vigentes em julho de 2026](../research/requisitos-oficiais-nfe-nfce-julho-2026.md).
