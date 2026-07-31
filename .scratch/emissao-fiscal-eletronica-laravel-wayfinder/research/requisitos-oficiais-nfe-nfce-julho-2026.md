# Requisitos oficiais de NF-e e NFC-e vigentes em julho de 2026

Pesquisa encerrada em **25 de julho de 2026**, limitada a fontes primárias do Portal Nacional da NF-e, CONFAZ e SPED. O resultado é uma fotografia técnica para decisões de arquitetura, não uma validação tributária de cada operação.

## Resumo executivo

- NF-e (modelo 55) e NFC-e (modelo 65) continuam no leiaute **4.00**, definido pelo MOC 7.0 e alterado cumulativamente por Notas Técnicas e pacotes de schemas. Não é seguro implementar apenas o PDF-base do MOC: em julho de 2026 estão vigentes, entre outras, alterações da Reforma Tributária do Consumo, CNPJ alfanumérico, QR Code v3, DANFE Simplificado Tipo 2 e EPEC. O próprio [catálogo oficial de documentos vigentes](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=6WfrpZYE4Ik%3D) identifica as versões correntes.
- A arquitetura deve separar um **núcleo fiscal versionado** (XML, assinatura, validação, protocolo e eventos) de adaptadores por modelo, ambiente, autorizador e UF. URLs, schemas, regras opcionais e datas de ativação devem ser dados atualizáveis, não constantes espalhadas no código.
- O artefato fiscal é o XML assinado agregado ao protocolo de autorização (`nfeProc`), mais os XMLs/protocolos dos eventos. DANFE e DANFE NFC-e são representações auxiliares e podem ser regenerados; não substituem os XMLs.
- Produção e homologação são ambientes fiscalmente independentes. Homologação exige dados de teste previstos nas regras, mas deve executar a mesma cadeia de geração, assinatura, transporte, persistência e reconciliação.
- NF-e e NFC-e não compartilham a mesma política de contingência. Para NF-e existem SVC-AN/SVC-RS, EPEC e FS-DA; para NFC-e a regra nacional é contingência off-line e, somente a critério da UF, EPEC. A operação precisa selecionar uma modalidade permitida para a UF/modelo e conservar justificativa, horário e posterior conciliação.

## Base técnica e evolução de leiaute

O [MOC 7.0 — Anexo I](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=J+I+v4eN00E%3D) define o leiaute e as regras de validação comuns aos modelos 55 e 65. A família documental inclui visão geral, leiaute/regras, DANFE/código de barras e manuais próprios de contingência NF-e e NFC-e, conforme o [índice oficial de manuais](https://www.nfe.fazenda.gov.br/PORTAl/listaConteudo.aspx?tipoConteudo=ndIjl+iEFdE%3D).

Em 25/07/2026, o baseline não é apenas “MOC 7.0”:

- a **NT 2025.002 v1.50** introduz adequações de NF-e/NFC-e à RTC, incluindo o regime específico de combustíveis; as tabelas externas de CST, classificação tributária e crédito presumido estão no [Informe Técnico 2025.002 v1.60](https://www.nfe.fazenda.gov.br/Portal/exibirArquivo.aspx?conteudo=jxTMMQeEVM8%3D);
- a **NT 2026.004 v1.01** atualiza schemas para CNPJ alfanumérico; a [NT oficial](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=2%2FTP%2FAP+Pb4%3D) explicita que tipos CNPJ e chaves de acesso passam a admitir o novo padrão. Logo, CNPJ não deve ser modelado como inteiro nem validado apenas por regex numérica;
- as **NT 2026.002 e 2026.003** acrescentam operações presenciais/não presenciais e o DANFE Simplificado Tipo 2;
- a **NT 2025.001 v1.03** define QR Code v3 da NFC-e e resposta síncrona para lote unitário; a especificação informa que o v3 autentica por assinatura os dados de contingência e elimina a necessidade de CSC nesse modelo, mas a eliminação total do CSC ficou sem data — portanto é preciso suportar coexistência conforme cronograma/UF ([NT oficial](https://www.nfe.fazenda.gov.br/Portal/exibirArquivo.aspx?conteudo=NvuzQGYd6E8%3D));
- em julho foram publicadas a **NT 2014.002 v1.40** (distribuição DF-e) e a **NT 2014.001 v1.40** (EPEC). Ambas constam do [catálogo oficial vigente](https://www.nfe.fazenda.gov.br/PORTal/listaConteudo.aspx?tipoConteudo=04BIflQt1aY%3D).

Consequência: manter registro da versão de schema/regras usada em cada tentativa, validar localmente contra o XSD vigente e permitir implantação coordenada por data de homologação/produção. Tabelas fiscais publicadas separadamente precisam de importação versionada e rastreável.

## Assinatura, certificados e transporte

O XML da NF-e/NFC-e e os eventos sujeitos a assinatura usam certificado digital ICP-Brasil. As regras do [MOC 7.0 — Anexo I](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=J+I+v4eN00E%3D) validam no TLS a existência, cadeia ICP-Brasil, validade, revogação e uso para autenticação de cliente; também validam autoria e integridade da assinatura XML. Um A1 (`PKCS#12`, normalmente `.pfx/.p12`) é compatível com processamento automático, mas essa é uma escolha operacional: a norma não autoriza ignorar expiração, revogação ou vínculo do titular.

Requisitos arquiteturais mínimos:

- cofre criptografado por certificado e filial, senha separada, acesso mínimo e nenhuma exposição em logs;
- validação no upload (cadeia, validade, titular e compatibilidade com o emitente), ativação explícita, histórico e alertas;
- seleção determinística do certificado por emissão e retenção do seu identificador/fingerprint na auditoria;
- relógio confiável e trilha de auditoria, pois assinatura, validade, emissão, eventos e contingência dependem de data/hora;
- TLS mútuo e assinatura XML implementados conforme o MOC; nunca alterar/canonicalizar o XML depois de assinado.

A **NT 2026.001 v1.02a** criou a especificação do Provedor de Assinatura e Autorização (PAA), conforme [documento oficial](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=17%2F3gkpGzPY%3D). Ela não obriga este projeto a terceirizar a emissão: se a decisão é assinatura A1 pelo próprio Laravel, PAA deve ficar como capacidade futura isolada, não misturada ao caminho local.

## Serviços, ambientes e autorizadores

Os serviços 4.00 relevantes são autorização, retorno de autorização quando aplicável, consulta protocolo/situação da chave, status do serviço, recepção de evento, inutilização e, onde necessário, consulta cadastro. A lista de URLs de **produção e homologação**, versões e autorizadores deve vir da [Relação oficial de Serviços Web](https://www.nfe.fazenda.gov.br/portal/WebServices.aspx/consultaEPECConciliacao.aspx).

Há roteamento por UF: várias UFs usam SVRS, outras autorizadores próprios; na contingência, as UFs são divididas entre SVC-AN e SVC-RS. A relação oficial vigente lista, por exemplo, SVC-AN para AC, AL, AP, CE, DF, ES, MG, PA, PB, PI, RJ, RN, RO, RR, RS, SC, SE, SP e TO, e SVC-RS para AM, BA, GO, MA, MS, MT, PE e PR. Essa relação é operacional e pode mudar.

O cliente deve, portanto:

1. resolver endpoint por UF, modelo, serviço, ambiente e modalidade de contingência;
2. preservar request/response bruto e `cStat`, distinguindo rejeição fiscal, denegação quando ainda aplicável, timeout e falha técnica;
3. usar idempotência por chave/evento e consultar protocolo após resposta ambígua antes de retransmitir ou inutilizar;
4. admitir resposta síncrona de lote unitário conforme NT 2025.001, sem assumir que todo fluxo ou autorizador é sempre síncrono;
5. monitorar status e avisos de ativação da SVC, mas não interpretar indisponibilidade local como autorização automática para qualquer contingência.

## Eventos e ciclo de vida

Para o escopo de saída, o núcleo deve tratar pelo menos:

- **autorização** e consulta/reconciliação de protocolo;
- **cancelamento**, somente de documento autorizado e nas condições/prazo legal da UF;
- **Carta de Correção eletrônica (CC-e)** da NF-e, respeitando campos que não podem ser corrigidos e a sequência de eventos; o XML do evento e seu protocolo integram o histórico, não se sobrescrevem;
- **inutilização** de faixa não utilizada, com justificativa, ano, CNPJ, modelo, série e intervalo; ela não cancela documento autorizado e não deve ser usada antes de excluir autorização incerta;
- **EPEC** e sua conciliação quando adotado para NF-e ou permitido pela UF para NFC-e;
- **cancelamento por substituição da NFC-e**, criado para duplicidade decorrente de emissão em contingência.

O MOC descreve os fluxos e encadeamento de eventos na [Visão Geral oficial](https://www.confaz.fazenda.gov.br/legislacao/arquivo-manuais/moc7-visao-geral.pdf). A legislação nacional de base é o [Ajuste SINIEF 07/05 (NF-e) e suas alterações](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=3GhDwJ%2FZeSI%3D) e o Ajuste SINIEF 19/16 (NFC-e). Prazos estaduais podem ser mais restritivos; por isso, não devem ser hard-coded como uma única regra nacional.

Parâmetros-base que exigem confirmação na UF do estabelecimento antes de produção:

- cancelamento ordinário de NF-e: regra nacional usual de até 24 horas após autorização, sem circulação, mas a UF disciplina cancelamento extemporâneo;
- cancelamento ordinário de NFC-e: até 30 minutos após autorização, sem saída/circulação, podendo haver disciplina estadual;
- cancelamento por substituição de NFC-e: teto nacional de 168 horas, que a UF pode reduzir; o [MOC](https://www.confaz.fazenda.gov.br/legislacao/arquivo-manuais/moc7-visao-geral.pdf) registra expressamente essa possibilidade;
- inutilização: até o décimo dia do mês subsequente ao da quebra de sequência, sujeita às regras do serviço/UF.

Logo, ações irreversíveis devem ser explícitas, autorizadas por perfil, precedidas de consulta e auditadas; jobs podem alertar e preparar a ação, mas não inferir automaticamente que um número sem resposta deve ser inutilizado.

## Contingência

Para **NF-e**, o [Manual de Contingência NF-e](https://www.nfe.fazenda.gov.br/PORTAl/exibirArquivo.aspx?conteudo=cMjGAyYrb%2Fs%3D) contempla:

- SVC-AN ou SVC-RS, somente quando ativada para a UF;
- EPEC, que registra previamente informações essenciais e exige posterior transmissão/conciliação da NF-e;
- FS-DA, com impressão em formulário de segurança e posterior transmissão.

SCAN e formulário de segurança antigo são históricos/desativados e não devem virar caminhos novos. Uma troca de SVC altera `tpEmis`, chave/forma de emissão e destino, portanto não é simples retentativa do mesmo payload.

Para **NFC-e**, a modalidade nacional é **off-line** (`tpEmis=9`); EPEC (`tpEmis=4`) somente a critério da UF. O Portal Nacional, ao anunciar indisponibilidade da SVRS, orienta explicitamente NFC-e para contingência off-line, enquanto NF-e usa SVC ([aviso oficial](https://www.nfe.fazenda.gov.br/PORTAL/informe.aspx?UF=DF&ehCTG=true)). O XML off-line deve ser assinado, o DANFE NFC-e entregue no ato com indicação de contingência e QR Code adequado, e o documento transmitido tão logo cesse o problema, dentro do limite configurado pela UF.

A máquina de estados precisa registrar: motivo, `tpEmis`, início da contingência, operador, XML/DANFE entregue, tentativas, autorização posterior, duplicidade e eventual cancelamento por substituição. NFC-e offline exige fila local/durável e operação do caixa mesmo sem SEFAZ; a reconciliação não pode depender da sessão HTTP do PDV.

## QR Code e documentos auxiliares

O DANFE da NF-e segue o Anexo II do MOC e contém chave/código de barras; o DANFE NFC-e segue o **Manual de Padrões Técnicos v6.0**, disponível no [histórico oficial](https://www.nfe.fazenda.gov.br/portal/listaHistorico.aspx?tipoConteudo=Ef+Y1blZDbU%3D). Eles devem ser gerados do XML correspondente ao estado fiscal, sem serem tratados como fonte canônica.

O [Manual DANFE NFC-e/QR Code](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=k%2FIuuaW4YiY%3D) define formatos distintos online e off-line e coexistência dos QR Codes v2 e v3. URLs de consulta e parâmetros são publicados por UF; QR Code v2 depende de CSC/identificador administrado na UF, enquanto v3 usa assinatura no cenário de contingência. Assim, o cadastro por filial/UF deve comportar CSC enquanto exigido, versão ativa do QR Code e URL de consulta por ambiente.

Impressão deve ser uma etapa idempotente derivada do XML autorizado ou do XML assinado de contingência. Reimpressão precisa indicar o mesmo estado fiscal; após autorização/eventos, consultas e PDFs devem apresentar a situação atual sem adulterar o XML original.

## Guarda, distribuição e integridade

Emitente e destinatário devem manter o arquivo digital e protocolo pelo prazo da legislação tributária e disponibilizá-los ao Fisco. O Ajuste SINIEF 07/05 também exige que o emitente disponibilize o XML autorizado ao destinatário, como registra o [histórico legislativo oficial do Portal](https://www.nfe.fazenda.gov.br/POrtal/listaConteudo.aspx?tipoConteudo=3GhDwJ%2FZeSI%3D). Na prática de retenção tributária, projetar **mínimo de cinco anos mais o ano corrente**, mas parametrizar conforme obrigação aplicável e política jurídica da empresa; armazenamento em S3 não reduz a obrigação do banco/ERP de localizar e entregar o documento.

Guardar, de forma imutável e correlacionada:

- XML pré-assinado (opcional para diagnóstico), XML assinado transmitido, resposta e XML processado com protocolo;
- cada pedido/resposta/evento e respectivo protocolo;
- hash criptográfico, chave, CNPJ/filial, modelo, série, número, ambiente, schema, certificado/fingerprint e timestamps;
- DANFE/DANFE NFC-e como derivado, com versão do renderizador;
- trilha de acesso, reprocessamento, download e ações manuais.

S3 deve usar criptografia, versionamento/Object Lock se adotado pela política, controles de acesso e verificação periódica de hash. O banco pode manter a cópia legada em `dadosfiscais.xmlnfe`, mas o ponteiro para objeto, hash e metadados não pode ser gravado antes de confirmar upload; uma outbox transacional ou reconciliador deve eliminar o “gravou no banco, perdeu no bucket”. Não se deve contar com o serviço de distribuição DF-e para recuperar XML próprio perdido: a obrigação primária de guarda é do emitente.

## Variações por UF que precisam virar configuração

Antes de habilitar cada filial, validar no portal estadual:

- credenciamento separado de produção/homologação para NF-e e NFC-e;
- autorizador normal, SVC correspondente, URLs e cadeia TLS;
- disponibilidade de NFC-e, regras de uso por tipo de contribuinte/operação e EPEC NFC-e;
- CSC/ID Token e versão de QR Code aceita, URLs de consulta por ambiente;
- prazo máximo de transmissão da contingência off-line e tolerância de atraso;
- prazos/procedimentos de cancelamento normal, extemporâneo, substituição e inutilização;
- Código de Segurança do Responsável Técnico (CSRT), quando a regra estiver ativada para a UF;
- regras estaduais opcionais do MOC/NTs, benefícios, campos e credenciamentos especiais.

O [Portal Nacional](https://www.nfe.fazenda.gov.br/portal/WebServices.aspx/consultaEPECConciliacao.aspx) é fonte para topologia e endpoints; a legislação/portal da UF é fonte final para opções e prazos locais. Cada conjunto deve ter vigência (`valid_from`/`valid_to`), autoria e histórico, evitando “configuração atual” sem rastreabilidade.

## Restrições que devem constar da futura especificação

1. Motor de documentos versionado por modelo, schema, NT e data de vigência; atualização normativa sem reescrever o domínio de vendas.
2. Adaptador de autorizador/UF/ambiente dirigido por configuração versionada e publicado por rollout de filial.
3. Estados persistentes e idempotentes; nenhuma retransmissão depois de timeout sem consulta por chave/recibo.
4. Numeração reservada atomicamente antes da emissão e nunca reutilizada; falhas seguem para retransmissão, reconciliação ou inutilização explícita.
5. Cofre e rotação de A1 por filial com validação prévia e auditoria; emissão deve registrar exatamente qual certificado assinou.
6. NFC-e síncrona no PDV com fila durável para off-line; NF-e pode ser predominantemente assíncrona.
7. S3 como arquivo canônico imutável, com hash e metadados no banco, cópia temporária em `dadosfiscais.xmlnfe` e reconciliador de consistência.
8. Geração própria de DANFE/DANFE NFC-e conforme manuais vigentes, incluindo contingência, QR Code v2/v3 e DANFE Simplificado Tipo 2 quando aplicável.
9. Monitoramento periódico do catálogo oficial de schemas, NTs, informes, tabelas e URLs; mudanças fiscais são dependência operacional contínua, não projeto encerrado.
10. Matriz de homologação por UF/modelo/cenário: autorização, rejeição, duplicidade, timeout com autorização, cancelamento, CC-e, inutilização, SVC/EPEC, NFC-e off-line, QR Code e expiração/troca de certificado.

## Fontes oficiais principais

- [Portal Nacional — documentos vigentes/Notas Técnicas](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=6WfrpZYE4Ik%3D)
- [Portal Nacional — manuais/MOC](https://www.nfe.fazenda.gov.br/PORTAl/listaConteudo.aspx?tipoConteudo=ndIjl+iEFdE%3D)
- [MOC 7.0 — Anexo I, leiaute e validações](https://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=J+I+v4eN00E%3D)
- [Portal Nacional — Relação de Serviços Web](https://www.nfe.fazenda.gov.br/portal/WebServices.aspx/consultaEPECConciliacao.aspx)
- [CONFAZ — MOC 7.0, Visão Geral](https://www.confaz.fazenda.gov.br/legislacao/arquivo-manuais/moc7-visao-geral.pdf)
- [Portal Nacional — legislação/Ajustes SINIEF](https://www.nfe.fazenda.gov.br/portal/listaConteudo.aspx?tipoConteudo=3GhDwJ%2FZeSI%3D)
- [SPED — legislação de NF-e](https://sped.rfb.gov.br/item/show/1521)

