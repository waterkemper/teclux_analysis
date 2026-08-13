# Monitoramento de atualizações de leiaute e regras NF-e/NFC-e

Pesquisa da ticket 16, consultada em 2026-08-10. Escopo limitado a fontes primárias oficiais: Portal Nacional da NF-e, CONFAZ e portais SEFAZ/autorizadores.

## Conclusão executiva

O monitoramento deve ser tratado como um **catálogo regulatório versionado**, não como uma lista manual de links. O Portal Nacional da NF-e já expõe catálogos HTML oficiais para Manuais, Notas Técnicas, Informes Técnicos, Esquemas XML, Diversos/tabelas, Serviços Web, disponibilidade e avisos da SVC; o CONFAZ expõe catálogos por ano de Ajustes SINIEF e Atos COTEPE/ICMS; e os portais SEFAZ/autorizadores expõem páginas próprias de NFC-e, URLs de QR Code, CSC, webservices, cBenef, obrigatoriedade, homologação, produção, manutenção e incidentes. Essas fontes devem ser varridas por HTTP e comparadas por inventário de links, datas, títulos, versões, hashes dos artefatos e diffs semânticos.

Não identifiquei, nas páginas oficiais consultadas, um feed RSS/Atom anunciado como contrato primário para Portal Nacional da NF-e ou CONFAZ. Portanto, a arquitetura não deve depender de RSS. Se alguma SEFAZ estadual publicar RSS próprio, ele pode entrar como fonte adicional, mas o mecanismo base deve operar por verificação periódica HTTP dos catálogos oficiais e dos artefatos baixados.

Mudança detectada nunca deve ativar produção automaticamente. O robô pode abrir alerta, baixar evidências, classificar impacto, atualizar catálogo e disparar testes de contrato; mas qualquer alteração que toque MOC, NT, schema, regra de validação, tabela fiscal, URL de serviço, QR Code, CSC, TLS/cadeia, contingência ou prazo de vigência precisa de revisão humana, homologação e aprovação operacional antes de produção.

## Fontes oficiais que devem compor o catálogo

### Portal Nacional da NF-e

Fonte principal de baseline nacional para NF-e modelo 55 e NFC-e modelo 65:

- [Página principal do Portal Nacional da NF-e](https://www.nfe.fazenda.gov.br/) — traz informes recentes, avisos de contingência SVC-AN, agendamentos SVC-AN e relação de UFs no Cadastro Centralizado de Contribuintes.
- [Manuais](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=ndIjl+iEFdE%3D) — lista o MOC 7.0 NF-e/NFC-e, Anexo I de leiaute e regras, anexos de DANFE/código de barras, manual de contingência NF-e, manual DANFE NFC-e/QR Code, manual de contingência offline NFC-e e histórico de versões.
- [Notas Técnicas vigentes](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=6WfrpZYE4Ik%3D) — lista NTs vigentes com versão, data de publicação e resumo, por exemplo EPEC, Distribuição DF-e, PAA, CNPJ alfanumérico, RTC, DANFE Simplificado Tipo 2 e alterações de regras.
- [Informes Técnicos vigentes](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=B%2F6oigHgyAw%3D) — publica tabelas e mudanças auxiliares, como classificação tributária, CST, crédito presumido, alíquotas CBS, meios de pagamento, NCM, combustíveis, FCP e alteração de URL de QR Code.
- [Esquemas XML](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=BMPFMBoln3w%3D) — separa “versões oficiais/em uso” e “versões anteriores/em desuso”; a página oficial mostra pacotes ZIP de schemas NF-e/NFC-e, eventos, Distribuição DF-e e pacotes vinculados a NTs.
- [Diversos](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=%2FNJarYc9nus%3D) — hospeda tabelas vigentes, como CNPJs alfanuméricos de homologação, cClassTrib, cCredPres, CBS, índice de biocombustível, meios de pagamento, combustíveis e ABI.
- [Relação de Serviços Web](https://www.nfe.fazenda.gov.br/portal/webservices.aspx) — publica autorizadores, serviços, versões e URLs por UF/autorizador, além da relação de UFs na SVAN, SVRS, SVC-AN e SVC-RS.
- [Consultar Disponibilidade](https://www.nfe.fazenda.gov.br/portal/disponibilidade.aspx) — publica última verificação, versão dos webservices, situação por autorizador/serviço, tempo médio e legenda de verde/amarelo/vermelho.
- [Perguntas Frequentes — Certificação Digital](https://www.nfe.fazenda.gov.br/portal/perguntasFrequentes.aspx?tipoConteudo=FBya9bipr34%3D) — confirma regras oficiais de certificado digital para assinatura/transmissão, inclusive certificado de pessoa jurídica A1/A3, ICP-Brasil e uso de certificado de um estabelecimento para outros estabelecimentos da empresa.
- [Avisos do Portal Nacional](https://www.nfe.fazenda.gov.br/portal/informe.aspx?ehCTG=false&page=55&pagesize=5) — já publicou alterações de cadeia de certificado no ambiente de produção; logo, avisos também são fonte de mudanças TLS/cadeia.

### CONFAZ

Fonte normativa nacional:

- [Ajustes SINIEF — CONFAZ](https://www.confaz.fazenda.gov.br/legislacao/ajustes) — índice oficial por ano dos Ajustes SINIEF e convênios SINIEF. Deve ser monitorado para alterações em bases como NF-e e NFC-e.
- [Atos COTEPE/ICMS — CONFAZ](https://www.confaz.fazenda.gov.br/legislacao/atos) — índice oficial por ano de Atos COTEPE/ICMS. A página do Portal Nacional também lista [Atos COTEPE de NF-e](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=AX0vPC2u8xc%3D), incluindo Ato COTEPE ICMS 69/20 sobre especificações técnicas da NF-e, DANFE e WebServices conforme Ajuste SINIEF 07/05.
- [Secretarias de Fazenda, Finanças e Tributação — CONFAZ](https://www.confaz.fazenda.gov.br/menu-de-apoio/secretarias%20de%20fazenda%20financas%20e%20tributacao) — índice oficial para semear e revisar os portais estaduais.

### Portais SEFAZ e autorizadores

O Portal Nacional não substitui os portais estaduais. Eles publicam regras e datas locais, especialmente para NFC-e.

Exemplos oficiais:

- [NFC-e SP — página principal](https://portal.fazenda.sp.gov.br/servicos/nfce/) — publica obrigatoriedade estadual, notícias de homologação/produção, CSC e avisos; em consulta de 2026-08-10, a página citava obrigatoriedade paulista da NFC-e a partir de 2026 e avisos de atualização de protocolo no ambiente de testes.
- [NFC-e SP — WebServices](https://portal.fazenda.sp.gov.br/servicos/nfce/Paginas/WebServices.aspx) — publica URLs de homologação e produção, EPEC, QR Code e consulta pública.
- [NFC-e SP — Downloads](https://portal.fazenda.sp.gov.br/servicos/nfce/Paginas/Downloads.aspx) — publica manuais e schemas estaduais/legados.
- [NF-e SP — cBenef](https://portal.fazenda.sp.gov.br/servicos/nfe/Paginas/cBenef.aspx) — publica tabela CST x cBenef em PDF, Excel e ODS.
- [SVRS — Avisos NF-e](https://dfe-portal.svrs.rs.gov.br/Nfe/Avisos) e [SVRS — Avisos NFC-e](https://dfe-portal.svrs.rs.gov.br/Nfce/Avisos/2973) — publicam datas de homologação/produção, manutenção, mudanças de protocolo, testes de CNPJ alfanumérico, RTC e regras de validação.
- [SVRS — aviso de manutenção e contingência](https://dfe-portal.svrs.rs.gov.br/DFE/Avisos/2930) — exemplo oficial em que manutenção do ambiente de autorização NF-e/NFC-e da SVRS aciona SVC-AN para NF-e e contingência offline para NFC-e.
- [SVRS — atualização de certificados digitais](https://dfe-portal.svrs.rs.gov.br/Mdfe/Avisos/2983) — exemplo oficial de troca de certificados TLS/cadeia em ambiente RS/SVRS, com orientação de cadeia ICP-Brasil/SERPRO.

## O que pode ser monitorado automaticamente

### Catálogos HTML oficiais

Monitorar por HTTP GET periódico, com normalização de HTML e extração de itens:

- Portal Nacional: principal, Manuais, Notas Técnicas, Informes Técnicos, Esquemas XML, Diversos, Relação de Serviços Web, Disponibilidade, EPEC e páginas de avisos.
- CONFAZ: índices de Ajustes SINIEF e Atos COTEPE/ICMS; páginas anuais; páginas de retificação/republicação; páginas dos atos base relevantes.
- SEFAZ/Autorizadores: páginas de NF-e/NFC-e, avisos/notícias, downloads, webservices, QR Code/consulta pública, CSC, contingência, cBenef, credenciamento e legislação estadual.

Para cada página:

1. registrar URL canônica, ambiente quando aplicável, UF/autorizador, modelo fiscal e periodicidade;
2. guardar cabeçalhos HTTP disponíveis, status code, content-type, content-length, ETag/Last-Modified quando existirem;
3. salvar hash do HTML bruto e hash de texto normalizado;
4. extrair inventário de links com texto, href, seção, data publicada/atualizada, versão, “vigente”, “não vigente”, “minuta”, “corrigido”, “retificação”, “republicação”, “homologação”, “produção”, “efeitos a partir”, “a partir de”;
5. comparar inventário novo contra o anterior.

Mesmo sem ETag/Last-Modified, a comparação de hash e inventário detecta inclusão, remoção, troca de link, mudança de seção vigente/desuso e alteração textual.

### Artefatos baixáveis

Monitorar por download e hash:

- PDFs de MOC, anexos, NTs, Informes Técnicos e manuais;
- ZIPs de schemas XML;
- XLS/XLSX/ODS/CSV/PDF de tabelas;
- arquivos de cadeia/certificado quando publicados;
- páginas de webservices e, quando público, WSDL.

Para cada artefato:

1. guardar `sha256`, tamanho, mime, URL de origem, data de coleta e item do catálogo que o referenciou;
2. se ZIP, guardar lista de arquivos, nomes, tamanhos, hashes internos e datas internas;
3. se XSD/XML, extrair namespaces, versão de schema, elementos novos/removidos, tipos alterados, cardinalidade, regex, enumerações e regras relacionadas;
4. se PDF, extrair texto para diff e manter o PDF original como evidência; PDF com texto alterado precisa de revisão humana, porque extração automática pode perder tabela, nota de rodapé e diagrama;
5. se tabela, carregar em representação tabular normalizada, comparar chaves naturais e classificar inclusão/remoção/alteração de código, descrição, vigência, UF, CST, NCM, cBenef, cClassTrib, cCredPres, combustível, meio de pagamento etc.

### Serviços Web e disponibilidade

A [Relação de Serviços Web](https://www.nfe.fazenda.gov.br/portal/webservices.aspx) deve ser extraída para uma matriz:

`modelo` + `UF` + `autorizador` + `ambiente` + `serviço` + `versão` + `URL` + `fonte` + `primeira_vista_em` + `última_vista_em`.

A [página de disponibilidade](https://www.nfe.fazenda.gov.br/portal/disponibilidade.aspx) deve ser monitorada separadamente como telemetria operacional oficial. Ela informa última verificação, versão 4.00, status por serviço/autorizador, tempo médio e legenda de falhas. Esse dado ajuda a distinguir instabilidade operacional de mudança de contrato, mas não substitui testes reais com certificado e XML em homologação.

Para URLs de webservice:

- monitorar alteração de URL e versão na página oficial;
- validar DNS, handshake TLS, cadeia, emissor, SAN, CN, `notBefore`, `notAfter`, fingerprint SPKI e protocolo/ciphers aceitos;
- consultar WSDL quando público e comparar `targetNamespace`, operações, SOAPAction, endpoints e tipos;
- chamar `StatusServico` apenas nos ambientes e UFs sob escopo operacional, com rate limit e certificado apropriado, porque alguns serviços exigem autenticação mTLS e uso indevido pode parecer abuso.

### Contingência e SVC

Monitorar:

- avisos de “Contingência Ativada na SVC-AN” e “Contingência Agendada na SVC-AN” na [página principal do Portal Nacional](https://www.nfe.fazenda.gov.br/);
- [Disponibilidade](https://www.nfe.fazenda.gov.br/portal/disponibilidade.aspx), que mostra status por autorizador/serviço;
- [Relação de Serviços Web](https://www.nfe.fazenda.gov.br/portal/webservices.aspx), que lista UFs atendidas por SVC-AN e SVC-RS;
- portais dos autorizadores, como [SVRS Avisos](https://dfe-portal.svrs.rs.gov.br/DFE/Avisos/2930), pois a SVRS publica manutenção em que NF-e vai para SVC-AN e NFC-e deve operar offline.

Automação pode abrir alerta e preparar runbook; não deve mudar o tipo de emissão automaticamente sem regra operacional aprovada por UF, modelo e ambiente.

### QR Code e CSC da NFC-e

Monitorar:

- manual nacional DANFE NFC-e/QR Code em [Manuais](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=ndIjl+iEFdE%3D);
- Informes Técnicos que citam alteração de URL de QR Code, como o catálogo de [Informes Técnicos vigentes](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=B%2F6oigHgyAw%3D), que inclui exemplo de alteração de URL do QR Code da NFC-e para Goiás;
- páginas estaduais de NFC-e. A página [NFC-e SP — WebServices](https://portal.fazenda.sp.gov.br/servicos/nfce/Paginas/WebServices.aspx) publica URLs de QR Code e consulta pública separadas por homologação e produção; a [NFC-e SP principal](https://portal.fazenda.sp.gov.br/servicos/nfce/) também trata de CSC.

Mudança de URL de QR Code ou regra de assinatura/hash do QR Code é alteração de produção com alto risco: precisa de revisão humana, atualização de configuração versionada, testes de QR Code em homologação e validação de impressão/DANFE.

### Cadeias TLS e certificados dos servidores

Monitorar em duas camadas:

1. **Publicação oficial**: avisos do Portal Nacional e portais SEFAZ. O Portal Nacional já publicou alteração de cadeia/certificado de `nfe.fazenda.gov.br` e `www1.nfe.fazenda.gov.br`; a SVRS já publicou substituição de certificados dos ambientes RS/SVRS e orientação de cadeia ICP-Brasil/SERPRO.
2. **Sondagem técnica dos hosts oficiais**: para cada host listado na Relação de Serviços Web ou página estadual, coletar cadeia TLS, datas de validade, emissor, SAN, fingerprint e protocolo. Mudança de certificado não é necessariamente mudança normativa, mas pode quebrar clientes, truststore, containers e ambientes legados.

Qualquer troca de raiz/intermediária, vencimento próximo, incompatibilidade de TLS ou mudança de host em produção deve abrir alerta de revisão humana.

## Fontes que exigem verificação periódica

Como não há contrato RSS/Atom confiável identificado nas páginas oficiais consultadas, a verificação periódica é obrigatória para:

- catálogos do Portal Nacional;
- página principal/informes/avisos do Portal Nacional;
- histórico de versões dos manuais e NTs;
- página de Esquemas XML e ZIPs vinculados;
- página Diversos/tabelas;
- Relação de Serviços Web e Disponibilidade;
- páginas CONFAZ de Ajustes SINIEF, Atos COTEPE/ICMS, retificações e republicações;
- portais SEFAZ de cada UF/autorizador;
- hosts de webservices e consulta QR Code;
- páginas de avisos de SVRS/SVAN/SVC e páginas estaduais de contingência.

Periodicidade recomendada:

- **A cada 15 minutos**: disponibilidade oficial, avisos de contingência SVC, páginas de manutenção dos autorizadores críticos e TLS com vencimento inferior a 30 dias.
- **Horária**: página principal do Portal Nacional, Relação de Serviços Web, portais dos autorizadores usados pela empresa, páginas estaduais de NFC-e/QR Code.
- **Diária**: Manuais, Notas Técnicas, Informes Técnicos, Esquemas XML, Diversos/tabelas, CONFAZ Ajustes/Atos, páginas estaduais de legislação/downloads/cBenef.
- **Semanal**: varredura completa de todos os portais SEFAZ via sementes CONFAZ, incluindo links profundos e validação de links quebrados.

## Detecção de documento novo ou alterado

Um documento é “novo” quando aparece novo item no catálogo oficial, novo href, nova versão, nova data de publicação, nova seção “vigentes”, novo arquivo dentro de ZIP ou novo ato CONFAZ/SEFAZ.

Um documento é “alterado” quando:

- o mesmo item aponta para outro arquivo;
- o hash do arquivo mudou;
- o título/data/versão mudou;
- o item mudou de “vigente” para “não vigente” ou vice-versa;
- aparece “corrigido”, “atualizado”, “retificação” ou “republicação”;
- ZIP tem XSD novo/removido/alterado;
- PDF tem diff textual relevante;
- tabela teve código, vigência, UF, descrição ou chave natural alterada;
- webservice mudou URL, versão, host, WSDL, SOAPAction ou disponibilidade;
- certificado TLS/cadeia mudou ou está próximo de expirar;
- uma página estadual publicou data de homologação, produção, obrigatoriedade, postergação, exceção, janela de manutenção ou regra “data a definir”.

Todo evento deve gerar um registro imutável:

```text
source_id
source_url
source_owner: Portal Nacional | CONFAZ | SEFAZ-UF | SVRS | SVAN | SVC
model: 55 | 65 | ambos | desconhecido
uf_scope: BR | UF | autorizador
environment_scope: homologacao | producao | ambos | nao_aplicavel
artifact_kind: MOC | NT | schema | tabela | endpoint | tls | qrcode | contingencia | aviso | legislacao
official_title
official_version
official_publication_date
effective_dates_detected
raw_hash
normalized_hash
diff_summary
impact_class
human_review_required
production_activation_allowed: false
```

## Classificação de impacto

### Impacto crítico

Requer parada de rollout automático e revisão urgente:

- schema XSD novo/alterado/removido em pacote oficial em uso;
- NT ou MOC alterando XML, assinatura, autorização, eventos, retorno, QR Code, contingência, distribuição, inutilização, cancelamento, manifestação ou rejeições;
- mudança de URL de autorização, retorno, consulta, status, evento, distribuição, QR Code ou consulta pública;
- mudança de certificado/cadeia TLS em host usado em produção;
- prazo de produção com data próxima ou retroativa;
- publicação “corrigida”, “retificada” ou “republicada” de documento já implementado;
- portais oficiais informando alteração emergencial, bloqueio, falha de protocolo ou comportamento diferente entre homologação e produção.

### Impacto alto

Requer planejamento e homologação:

- tabela fiscal alterada que afeta geração/validação de XML;
- regra de validação nova com datas de homologação e produção;
- mudança de autorizador, SVC ou ambiente;
- QR Code/CSC/consulta pública alterados;
- mudança por UF em cBenef, obrigatoriedade, credenciamento ou prazo de cancelamento;
- alteração de manual DANFE, DANFE NFC-e/QR Code ou contingência offline.

### Impacto médio

Requer análise, mas pode não mudar código:

- novo informe explicativo sem artefato técnico;
- mudança de descrição sem mudança de arquivo;
- inclusão de tabela futura/minuta;
- atualização de página estadual sobre cronograma ainda “a definir”.

### Impacto baixo

Registrar e revisar em lote:

- link quebrado não usado;
- atualização estética de página sem alteração de inventário;
- nova notícia sem termos fiscais relevantes.

## Sinais que precisam de revisão humana antes de produção

Revisão humana obrigatória quando o diff detectar:

- MOC, anexo ou manual novo/alterado;
- NT nova, versão nova ou data de vigência alterada;
- schema XSD alterado, mesmo que o catálogo mantenha o mesmo título;
- tabela fiscal nova/alterada/removida;
- regra por UF ou exceção estadual;
- nova data de homologação/produção/efeitos, inclusive “data a definir”;
- alteração de endpoint, autorizador, SVC, URL de QR Code, consulta pública ou WSDL;
- mudança de cadeia TLS, emissor, raiz/intermediária, fingerprint ou vencimento próximo;
- termo “minuta”, “corrigido”, “retificação”, “republicação”, “suspenso”, “prorrogado”, “revogado”, “obrigatório”, “facultativo”, “produção”, “homologação” ou “contingência”;
- divergência entre Portal Nacional, CONFAZ e SEFAZ estadual;
- mudança publicada em portal estadual que antecipa/retarda regra nacional para uma UF;
- instabilidade ou manutenção com instrução operacional, como SVC para NF-e e contingência offline para NFC-e.

## Cobertura por assunto

### MOC e manuais

Monitorar a página de [Manuais](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=ndIjl+iEFdE%3D), seus links e históricos de versão. Ela lista o MOC 7.0 NF-e/NFC-e, Anexo I de leiaute e regras, anexos de DANFE, manual de contingência NF-e, manual DANFE NFC-e/QR Code v6.0 e manual de contingência offline NFC-e v2.0. Mudança em qualquer manual deve abrir revisão humana.

### Notas Técnicas

Monitorar [Notas Técnicas vigentes](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=6WfrpZYE4Ik%3D) e históricos. A página mostra versões e datas; em 2026 inclui documentos sobre EPEC, Distribuição DF-e, PAA, CNPJ alfanumérico, RTC, DANFE Simplificado Tipo 2 e alteração de regras. A cada nova versão, baixar PDF, comparar texto e extrair datas de implantação por ambiente.

### Schemas

Monitorar [Esquemas XML](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=BMPFMBoln3w%3D). A página separa versões oficiais/em uso e anteriores/desuso e lista pacotes de NF-e/NFC-e, eventos e Distribuição DF-e vinculados a NTs. O diff relevante é no ZIP e em cada XSD interno, não só no título do item.

### Tabelas

Monitorar [Diversos](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=%2FNJarYc9nus%3D), [Informes Técnicos](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=B%2F6oigHgyAw%3D) e páginas estaduais como [cBenef SP](https://portal.fazenda.sp.gov.br/servicos/nfe/Paginas/cBenef.aspx). Tabelas precisam de versionamento próprio, vigência e escopo por UF/modelo quando aplicável.

### Endpoints

Monitorar [Relação de Serviços Web](https://www.nfe.fazenda.gov.br/portal/webservices.aspx) e páginas estaduais, como [NFC-e SP WebServices](https://portal.fazenda.sp.gov.br/servicos/nfce/Paginas/WebServices.aspx). A relação nacional lista autorizadores, UFs na SVRS/SVAN, SVC-AN/SVC-RS e URLs por serviço; páginas estaduais podem acrescentar endpoints específicos de NFC-e, EPEC, QR Code e consulta pública.

### TLS/cadeias

Monitorar avisos oficiais e sondagem TLS dos hosts oficiais. O Portal Nacional publicou alterações de cadeia de certificados em avisos; a SVRS também publicou substituição de certificados e cadeia ICP-Brasil/SERPRO. Qualquer mudança deve ser testada em containers/servidores de homologação antes de produção.

### QR Code

Monitorar manual DANFE NFC-e/QR Code, Informes Técnicos e páginas estaduais. SP publica URLs de QR Code de homologação e produção em página oficial de WebServices; Informes Técnicos nacionais podem anunciar alteração de URL de QR Code por UF. Mudança de QR Code afeta DANFE NFC-e, impressão, app do consumidor e validação pública.

### Contingência

Monitorar Portal Nacional, disponibilidade, Relação de Serviços Web e portais de autorizadores. A SVRS tem aviso oficial em que manutenção do ambiente NF-e/NFC-e aciona SVC-AN para NF-e, enquanto NFC-e deve usar contingência offline. Logo, o catálogo precisa separar decisão por modelo: NF-e pode ter SVC/EPEC conforme regra; NFC-e frequentemente exige offline conforme UF/autorizador.

### Prazos por UF/modelo/ambiente

Extrair datas de:

- NTs e Informes Técnicos nacionais: publicação, homologação, produção, vigência e efeitos;
- CONFAZ: publicação DOU, vigência, efeitos, revogação, retificação e republicação;
- SEFAZ estadual: obrigatoriedade por UF, datas de homologação/produção, exceções, cronogramas locais e “data a definir”;
- páginas de contingência/manutenção: início/fim por UF/autorizador;
- endpoints: entrada/desativação de URLs por ambiente.

O modelo de dados deve permitir várias datas por item:

```text
effective_date {
  kind: publicacao | homologacao | producao | vigencia | efeitos | desativacao | manutencao_inicio | manutencao_fim
  uf: BR | UF | autorizador
  model: 55 | 65 | ambos
  environment: homologacao | producao | ambos
  source_url
  confidence: extracted | human_confirmed
}
```

## Recomendação operacional

Implementar um “Regulatory Watcher” com três etapas:

1. **Coleta e evidência**: crawlers por fonte oficial, sem contornar captcha ou área restrita; baixar apenas páginas e artefatos públicos; guardar snapshot bruto.
2. **Diff e classificação**: comparar catálogo, artefatos, XSDs, tabelas, endpoints, TLS e prazos; gerar impacto e tarefas de revisão.
3. **Governança de ativação**: nenhuma mudança entra em produção sem aprovação humana, ticket de implementação, testes em homologação por UF/modelo/ambiente, validação de XML, assinatura, transmissão, retorno, DANFE/QR Code, contingência e rollback configuracional.

Produção deve consumir apenas versões `approved`, com vínculo para evidência oficial, hash do artefato, aprovação, plano de rollout e data de ativação. O robô pode atualizar o catálogo em tempo real, mas a configuração produtiva deve ser promovida por release controlado.

## URLs oficiais principais

- Portal Nacional NF-e: https://www.nfe.fazenda.gov.br/
- Manuais: https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=ndIjl+iEFdE%3D
- Notas Técnicas: https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=6WfrpZYE4Ik%3D
- Informes Técnicos: https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=B%2F6oigHgyAw%3D
- Esquemas XML: https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=BMPFMBoln3w%3D
- Diversos/tabelas: https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=%2FNJarYc9nus%3D
- Relação de Serviços Web: https://www.nfe.fazenda.gov.br/portal/webservices.aspx
- Disponibilidade: https://www.nfe.fazenda.gov.br/portal/disponibilidade.aspx
- Certificação digital — FAQ: https://www.nfe.fazenda.gov.br/portal/perguntasFrequentes.aspx?tipoConteudo=FBya9bipr34%3D
- Avisos/cadeia de certificados: https://www.nfe.fazenda.gov.br/portal/informe.aspx?ehCTG=false&page=55&pagesize=5
- CONFAZ Ajustes SINIEF: https://www.confaz.fazenda.gov.br/legislacao/ajustes
- CONFAZ Atos COTEPE/ICMS: https://www.confaz.fazenda.gov.br/legislacao/atos
- CONFAZ Secretarias estaduais: https://www.confaz.fazenda.gov.br/menu-de-apoio/secretarias%20de%20fazenda%20financas%20e%20tributacao
- Portal NF-e — Atos COTEPE: https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=AX0vPC2u8xc%3D
- NFC-e SP: https://portal.fazenda.sp.gov.br/servicos/nfce/
- NFC-e SP WebServices/QR Code: https://portal.fazenda.sp.gov.br/servicos/nfce/Paginas/WebServices.aspx
- NF-e SP cBenef: https://portal.fazenda.sp.gov.br/servicos/nfe/Paginas/cBenef.aspx
- SVRS Avisos NF-e: https://dfe-portal.svrs.rs.gov.br/Nfe/Avisos
- SVRS Avisos NFC-e: https://dfe-portal.svrs.rs.gov.br/Nfce/Avisos/2973
- SVRS manutenção/contingência: https://dfe-portal.svrs.rs.gov.br/DFE/Avisos/2930
- SVRS certificado/cadeia: https://dfe-portal.svrs.rs.gov.br/Mdfe/Avisos/2983
