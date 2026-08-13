# Definir o monitoramento de atualizações de leiaute e regras da SEFAZ

Type: research
Status: resolved
Blocked by:

## Question

Como o Laravel deve observar continuamente as publicações oficiais que alteram leiautes, schemas, Notas Técnicas, MOC, endpoints, certificados/cadeias, tabelas fiscais, QR Code, contingências e prazos de NF-e/NFC-e, detectando mudanças por UF, modelo, ambiente e vigência, classificando impacto e conduzindo homologação, aprovação, rollout e eventual resposta emergencial sem depender de memória manual da equipe?

## Scope

Comparar as fontes oficiais do Portal Nacional da NF-e, CONFAZ e portais das SEFAZ estaduais; definir catálogo/versionamento, captura e integridade dos documentos, diff semântico, alerta, matriz de impacto, prazo de adoção, testes de contrato, aprovação humana, publicação e rollback. Separar observação automática de ativação em produção.

## Answer

A plataforma terá um **Catálogo Normativo Fiscal** e um **Observador Regulatório**. O catálogo registra fontes, versões, vigência e artefatos oficiais; o observador coleta evidências e abre análise, mas nunca ativa produção automaticamente.

Fontes obrigatórias:

- Portal Nacional da NF-e: página principal/informes/avisos, Manuais/MOC, Notas Técnicas, Informes Técnicos, Esquemas XML, Diversos/tabelas, Relação de Serviços Web e Disponibilidade;
- CONFAZ: Ajustes SINIEF, Atos COTEPE/ICMS, retificações e republicações;
- portais de cada SEFAZ/autorizador no escopo: webservices, QR Code/CSC, cBenef, credenciamento, cronogramas, contingência, manutenção e avisos.

Não foi encontrado RSS/Atom oficial confiável para os catálogos nacionais. A base será polling HTTP, com RSS estadual apenas como fonte adicional. A periodicidade operacional recomendada é: 15 minutos para disponibilidade, contingência, manutenção crítica e TLS próximo do vencimento; uma hora para portal principal, serviços e portais dos autorizadores usados; diária para MOC, NTs, Informes, schemas, tabelas e CONFAZ; semanal para varredura ampla dos portais estaduais.

Cada página e artefato é preservado com URL canônica, autoridade, UF/autorizador, modelo, ambiente, ETag/Last-Modified quando houver, data de coleta, bytes originais, MIME, tamanho, SHA-256 bruto e hash normalizado. ZIPs mantêm inventário e hashes dos arquivos internos; XSDs, tabelas, endpoints, WSDLs, PDFs e cadeias TLS recebem diff adequado ao tipo.

O evento de mudança registra título, versão, datas de publicação/homologação/produção/vigência/efeitos, escopo, resumo do diff, impacto, evidência e revisão necessária. O diff deve detectar novo item, troca de link, versão/data alterada, retificação/republicação, mudança de XSD/tabela/endpoint/WSDL, URL de QR Code, cadeia TLS, regra de contingência ou prazo estadual.

O fluxo de governança é:

`OBSERVADA → ANALISADA → HOMOLOGAÇÃO → APROVADA → ATIVA → RETIRADA`

Alterações em MOC, NT, schema, tabela fiscal, endpoint, WSDL, QR Code/CSC, cadeia TLS, contingência, evento, rejeição ou prazo exigem revisão humana, homologação por UF/modelo/ambiente, aprovação auditada, plano de rollout e rollback. Produção consome somente versões `APROVADA`; a coleta pode continuar atualizando o catálogo enquanto a configuração produtiva permanece estável.

Impacto crítico suspende promoção automática e alerta administradores; mudança de contingência não altera `tpEmis` sozinha. Disponibilidade oficial e sondagem TLS são observabilidade operacional e não substituem teste real em homologação. A decisão foi fundamentada na [pesquisa oficial de monitoramento](../research/16-monitoramento-atualizacoes-layout-sefaz.md), que contém as fontes e URLs primárias.
