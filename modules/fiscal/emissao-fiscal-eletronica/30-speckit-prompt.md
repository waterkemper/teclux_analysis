# Prompt para `/speckit.specify` — catálogo oficial de Web Services e adaptação SC → SVRS

```text
/speckit.specify

Revise o código Laravel atual e produza uma especificação pronta para implementação para adaptar a configuração normativa fiscal ao catálogo oficial de Web Services da NF-e.

Não implemente código nesta execução. Especifique os contratos, a origem oficial, a publicação versionada e os testes necessários. O primeiro caso de aceite é NF-e modelo 55, Filial de SC, ambiente de homologação, incluindo consulta de status do serviço.

## Escopo que prevalece

1. Escopo funcional: plataforma comum de emissão fiscal, com primeiro aceite em NF-e modelo 55/Transferência/homologação.
2. NFS-e, Emissor Nacional, regras municipais e modelo 98 permanecem fora.
3. `VendaTransferencia`, `DevolucaoTransferencia`, entrada fiscal automática e produção permanecem fora.
4. O runtime alvo é Linux.
5. Certificados continuam na tela própria, com vínculo explícito à Filial. Não criar fallback por raiz de CNPJ.

## Fatos oficiais a incorporar

O Portal Nacional da NF-e informa que Santa Catarina utiliza a SVRS para os demais serviços relacionados à NF-e. O catálogo oficial da SVRS publica as URLs por autorizador, serviço e ambiente e permite consultar o WSDL acrescentando `?wsdl`.

Fontes oficiais de referência para o desenho e para o runbook:

- Portal Nacional — disponibilidade: https://www.nfe.fazenda.gov.br/portal/disponibilidade.aspx
- Catálogo SVRS — relação de serviços: https://dfe-portal.svrs.rs.gov.br/NFE/Servicos
- Manual de Integração/MOC da NF-e, que documenta os endereços dos Web Services em seção própria.

Para o primeiro teste de NF-e modelo 55 em homologação, o catálogo oficial atualmente apresenta o serviço de status da SVRS como:

`https://nfe-homologacao.svrs.rs.gov.br/ws/NfeStatusServico/NfeStatusServico4.asmx`

Esse valor é uma evidência normativa atual, não deve ser tratado como constante eterna. A especificação deve definir como registrar a fonte, a data de conferência, o ambiente, o serviço, a versão e o autorizador no snapshot publicado.

## Diagnóstico do código obrigatório

Inspecione e classifique como CONFIRMADO, PARCIAL, DIVERGENTE ou NÃO LOCALIZADO:

- `FiscalConfigurationResolver`;
- `CloudFiscalPublishRepository`;
- `FiscalConfigSnapshot`;
- `NfePhpEndpointApplicator`;
- `NfePhpFiscalGateway`;
- `cloud_fiscal_configuracoes` e `cloud_fiscal_pacotes_regulatorios`;
- `fiscal:publicar-config`;
- `fiscal:xsd-package-digest`;
- `fiscal:diagnostico-homologacao`;
- prompt 29 e o runbook de homologação.

Confirme que:

- o resolvedor já usa a UF da Filial para selecionar a configuração;
- os endpoints são lidos da configuração publicada, e não descobertos pelo XSD;
- não existe no código um catálogo completo SC→SVRS;
- o baseline atual não constitui configuração normativa completa para SC;
- o diagnóstico para SC/modelo 55 fica em `LACUNA` sem uma publicação vigente.

## Decisão arquitetural obrigatória

Separar explicitamente três artefatos:

### 1. Pacote XSD

Responsável por estrutura, tipos, namespaces, imports/includes e validação XML.

O XSD não deve ser usado para descobrir URL, autorizador ou ambiente.

### 2. Catálogo oficial de Web Services

Responsável por:

- UF/autorizador ou agrupamento de autorizador;
- modelo/documento;
- ambiente;
- serviço (`status_servico`, `autorizacao`, `retorno_autorizacao`, `consulta_protocolo`, `inutilizacao`, `recepcao_evento`);
- versão do serviço;
- URL efetiva;
- URL do WSDL, quando aplicável;
- fonte oficial;
- data de consulta/aprovação;
- versão do documento normativo ou catálogo.

### 3. Snapshot de configuração publicado

Responsável por congelar, para uma vigência, o pacote XSD, o autorizador e os endpoints aprovados. Emissão e diagnóstico devem consumir o snapshot publicado, sem depender de consulta online ao portal do governo.

## Requisitos funcionais

### RF-01 — Perfil normativo SC/SVRS

Especificar a publicação de uma configuração para:

- UF: `SC`;
- modelo: `55`;
- ambiente: `homologacao`;
- autorizador: `SVRS`;
- leiaute compatível com o pacote XSD publicado;
- vigência definida;
- endpoints oficiais por serviço.

Para o primeiro caso, validar especialmente:

```text
status_servico:
https://nfe-homologacao.svrs.rs.gov.br/ws/NfeStatusServico/NfeStatusServico4.asmx
```

Não misturar URLs de NF-e modelo 55 com URLs de NFC-e modelo 65. NFS-e não entra nesta configuração.

### RF-02 — Proveniência e atualização

Definir metadados obrigatórios da fonte:

- URL oficial consultada;
- tipo da fonte (`portal_nfe`, `portal_svrs`, `moc`, `comunicado_sefaz`);
- data/hora da consulta;
- ambiente;
- autorizador;
- serviço;
- versão do serviço;
- versão/referência do documento oficial;
- responsável pela aprovação;
- motivo da publicação;
- hash do payload/manifesto normativo, quando aplicável.

O sistema deve permitir publicar uma nova versão quando o catálogo oficial mudar. Não sobrescrever silenciosamente um snapshot já publicado ou usado por emissões.

### RF-03 — Tela administrativa

Especificar uma tela administrativa de catálogo/configuração normativa que permita:

- consultar perfis por UF, autorizador, modelo e ambiente;
- visualizar todos os serviços e URLs do snapshot;
- importar ou editar uma proposta de configuração antes do `dry-run`;
- informar a fonte oficial e a data de conferência;
- validar URLs de ambiente, formato, serviço obrigatório e coerência com o autorizador;
- opcionalmente consultar o WSDL durante a validação administrativa;
- publicar com motivo obrigatório;
- manter histórico e auditoria;
- exibir divergências entre a proposta e a última versão publicada.

Não permitir que usuários operacionais editem endpoint diretamente na tela da Filial.

### RF-04 — Validação de endpoint

Especificar validações para:

- homologação nunca apontar para produção;
- produção nunca apontar para homologação;
- URL obrigatória para cada serviço utilizado pelo gateway;
- autorizador compatível com a UF/modelo;
- serviço `status_servico` presente para o diagnóstico;
- versão do endpoint compatível com o leiaute;
- host e caminho registrados exatamente como aprovados;
- TLS/CA/rede verificados no preflight, sem transformar falha de rede em publicação válida.

Não fazer fallback automático para outra UF, outro autorizador ou outro endpoint quando a URL publicada falhar.

### RF-05 — Resolução pela Filial

Manter a resolução:

```text
Filial
→ UF do cadastro
→ modelo
→ ambiente
→ snapshot normativo vigente
→ endpoint do serviço solicitado
```

O parâmetro `--uf` do diagnóstico deve ser opcional:

- ausente: usar a UF da Filial;
- presente e igual: aceitar;
- divergente: bloquear antes da rede.

A chamada ao gateway deve receber o endpoint do snapshot resolvido. O gateway não deve conter tabela fixa SC→SVRS nem montar URL por concatenação heurística.

### RF-06 — Status de serviço

O diagnóstico deve provar:

- snapshot SC/55/homologação resolvido;
- endpoint `status_servico` vindo do snapshot;
- endpoint efetivo aplicado ao NFePHP;
- requisição SOAP feita com o certificado da Filial correta;
- resposta sanitizada com `cStat`, `xMotivo`, autorizador e evidência do endpoint;
- `cStat=107` como serviço disponível;
- distinção entre resposta da SEFAZ, erro SOAP/TLS/rede e bloqueio de precondição.

Publicação, dry-run, validação XSD e consulta ao WSDL não devem ser confundidos com uma consulta real de status da SEFAZ.

## Testes obrigatórios

Criar testes Unit/Feature/PostgreSQL para provar:

- configuração SC/55/homologação com autorizador SVRS;
- URL oficial de status no snapshot publicado;
- fonte, data e versão normativa preservadas;
- alteração de endpoint exige nova publicação;
- endpoint de produção em homologação recusado;
- endpoint de NFC-e recusado em configuração NF-e;
- endpoint ausente bloqueia diagnóstico;
- XSD não fornece endpoint automaticamente;
- Filial SC resolve snapshot SVRS sem informar UF manualmente;
- UF divergente bloqueia antes da rede;
- duas Filiais SC compartilham snapshot, mas não certificado;
- gateway não possui fallback ou tabela fixa de URLs;
- endpoint do snapshot é aplicado efetivamente ao NFePHP;
- `cStat=107` classificado como disponível;
- timeout/TLS/SOAP e `cStat` não disponível são classificados separadamente;
- nenhuma publicação ou consulta WSDL chama a autorização de NF-e;
- nenhum segredo aparece em tela, log ou evidência.

## Atualização do runbook de homologação

Documentar:

1. acessar o catálogo oficial da NF-e/SVRS;
2. confirmar SC no agrupamento SVRS;
3. confirmar serviço, versão e ambiente;
4. registrar a fonte e a data de conferência;
5. montar o payload com pacote XSD e endpoints;
6. executar `fiscal:xsd-package-digest`;
7. executar `fiscal:publicar-config --dry-run`;
8. publicar o snapshot SC/55/homologação;
9. executar o diagnóstico da Filial sem `--uf`;
10. confirmar `comunicacao_homologacao` e `cStat=107`;
11. só depois executar o gate e o smoke de Transferência.

O runbook deve indicar que os catálogos oficiais podem mudar e precisam ser revalidados antes de nova publicação. Não usar endpoints copiados de blogs, exemplos antigos ou configuração do UniNFe sem confirmação oficial.

## Critérios de aceite

- O projeto sabe que SC utiliza SVRS por meio de configuração normativa publicada com fonte oficial, não por regra escondida no gateway.
- O status de SC/55/homologação usa o endpoint oficial vigente do catálogo SVRS.
- O XSD permanece responsável apenas pela validação estrutural do XML.
- A tela administrativa permite auditar e atualizar endpoint sem editar PostgreSQL diretamente.
- A tela da Filial apenas resolve e mostra a configuração efetiva pela UF.
- Emissão e diagnóstico usam snapshots publicados e não fazem descoberta online de URL.
- Alteração oficial exige nova versão, aprovação e auditoria.
- Nenhum fallback silencioso para produção, outro autorizador, outra UF ou outro modelo é permitido.
- O escopo permanece NF-e modelo 55/Transferência/homologação Linux, sem NFS-e.

## Entregáveis

Entregar:

1. `spec.md` do catálogo oficial e da proveniência normativa;
2. contrato do perfil de Web Services;
3. contrato do snapshot publicado;
4. contrato da tela administrativa;
5. matriz UF/autorizador/modelo/ambiente/serviço;
6. matriz de códigos de bloqueio;
7. tarefas de backend, frontend, banco, validação WSDL e testes;
8. runbook SC/55/homologação atualizado;
9. evidência das fontes oficiais utilizadas;
10. lista explícita do que permanece fora do escopo.

Não alterar código nesta chamada e não declarar prontidão sem configuração publicada, fonte oficial registrada, diagnóstico aprovado e evidência sanitizada.
```
