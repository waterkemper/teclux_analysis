# Auditoria atual e prontidão para homologação real

Data da revisão: 2026-08-12  
Base Laravel: `861a351e` — `remocao vendas e devolucao transferencias`

## Veredito

O sistema ainda não está apto a executar um teste real de autorização de NF-e em homologação. O bloqueio principal não é apenas a falta de certificado ou credenciamento: `NfePhpFiscalGateway` ainda é um skeleton. A serialização gera XML mínimo, a assinatura não usa PKCS#12 real e `autorizar`, consultas e eventos reais lançam exceção orientando o uso de Fake. Portanto, o diagnóstico de status da SEFAZ, mesmo quando configurado, não comprova um ciclo real de emissão.

A remoção de venda entre filiais e devolução entre filiais continua correta e deve ser preservada.

## Achados da revisão

| ID | Classificação | Achado | Consequência |
|---|---|---|---|
| F-01 | Incompleto | `pendingSeals` e `pendingEmissions` no adapter são arrays em memória. | Reinício de processo pode perder a fotografia, o vínculo da emissão e a retomada. |
| F-02 | Divergente | Fixture e defaults fiscais ainda entram no caminho de preparação/normalização. | A NF-e pode ser montada com CFOP, NCM, UF ou outros dados que não vieram da origem autoritativa. |
| F-03 | Incompleto | Listener e rota manual não carregam a fotografia selada real; a rota usa fixture e o listener captura falhas apenas em log. | Projeção pode ocorrer sem evidência fiscal autoritativa e sem capacidade/reautenticação adequada. |
| F-04 | Incompleto | Eventos distintos convergem para `AGUARDANDO_RECONCILIACAO`; listeners não têm pendência/retry durável. | Rejeição corrigível, falha operacional e ambiguidade não podem ser operadas de forma diferente. |
| F-05 | Divergente | Há SQL direto em Application, HTTP, listeners e adapter; a reconciliação não compara todo o contrato fiscal. | Fronteiras arquiteturais, auditoria e reconciliação com Delphi ficam incompletas. |
| F-06 | Bloqueador de verificação | O runtime disponível é PHP 8.2.21, mas o Composer exige PHP >= 8.4.1. | A suíte não inicializa; não há evidência local suficiente antes do teste externo. |
| H-01 | Bloqueador | `NfePhpFiscalGateway::autorizar`, consultas e eventos reais ainda lançam `RuntimeException`; o gateway instrui usar Fake. | Nenhuma autorização real de homologação pode concluir com o código atual. |
| H-02 | Bloqueador | Serialização, XSD e assinatura são skeletons; o XML não representa a fotografia fiscal completa e a assinatura não é PKCS#12 real. | Mesmo com credencial, a SEFAZ pode rejeitar ou o envio nem será executável. |
| H-03 | Bloqueador externo | Ainda faltam UF/filial emissora concretas, credenciamento de cada estabelecimento, IE/ambiente, certificado A1 e endpoint/autorizador correspondente. | Não é possível montar um caso de homologação reproduzível nem selecionar certificado/endpoint com segurança. |
| H-04 | Incompleto | O diagnóstico existente verifica runtime, extensões, configuração e status, mas não executa um caso de transferência ponta a ponta. | Falta evidência de autorização, protocolo, chave, artefatos, projeção e idempotência. |
| H-05 | Bloqueador de ambiente | Ainda é necessário preparar PHP suportado, extensões SOAP/OpenSSL/DOM/mbstring, NFePHP, CA/TLS, DNS/rede e serviços de fila, banco e armazenamento exigidos pelo fluxo. | O comportamento real pode divergir do ambiente de desenvolvimento. |
| H-06 | Risco de segurança | `FISCAL_TRANSFERENCIA_SKIP_SEFAZ_TESTING` tem default permissivo e pode manter o fluxo fora da SEFAZ. | Homologação poderia aparentar sucesso sem transmissão real; o gate deve falhar fechado. |

## Correções que o próximo specify deve exigir

1. Completar o gateway real: serializer NF-e modelo 55 a partir da fotografia selada, validação XSD do pacote vigente, assinatura A1 PKCS#12, autorização, consulta de recibo/chave, eventos e reconciliação. Fake deve ficar explicitamente isolado em testes/dry-run.
2. Remover estado em memória e fixture/defaults da autoridade de produção. Persistir fotografia, revisão, hash, comando, outbox, emissão e pendência, com retomada após reinício.
3. Fazer listener e rota manual consumirem exatamente a fotografia selada persistida, validando grupo, emitente, destinatário, modelo, chave, tipo e revisão. A rota deve exigir capability fiscal administrativa e reautenticação conforme o contrato.
4. Separar estados e erros de rejeição corrigível, falha operacional e aguardando reconciliação; persistir retry, dead letter/pendência e evidência, sem `catch` silencioso.
5. Mover consultas para portas/repositórios de Infrastructure e completar a reconciliação com origem, filiais, tipo, modelo 55, série, número, chave, fotografia/hash e artefatos.
6. Substituir valores hardcoded de CNPJ, schema, versão e endpoint por configuração validada por UF, ambiente, modelo e pacote normativo vigente. O preflight deve falhar se houver configuração de Fake, credencial ausente ou schema desatualizado.

## Checklist de pré-condições para teste real

### Código e artefatos

- [ ] Gateway real de serialização, XSD, assinatura PKCS#12 e autorização implementado e coberto.
- [ ] Consultas por recibo/chave, eventos e reconciliação implementados.
- [ ] Fotografia fiscal completa, imutável, persistida e recuperável após reinício.
- [ ] XML assinado, `nfeProc` autorizado, protocolo, chave e demais artefatos armazenados conforme o contrato fiscal.
- [ ] Nenhum Fake, fixture, token em memória ou default fiscal ativo no caminho de homologação.

### Ambiente Laravel

- [ ] PHP >= 8.4.1 e dependências Composer instaladas sem ignorar requisitos.
- [ ] Extensões `soap`, `openssl`, `dom` e `mbstring` habilitadas; NFePHP e schemas disponíveis.
- [ ] CA roots, DNS, TLS, proxy/firewall e relógio do servidor validados contra o endpoint da UF.
- [ ] Banco, filas/worker, cache somente como infraestrutura não autoritativa, e S3/armazenamento de artefatos operacionais disponíveis.
- [ ] `FISCAL_TRANSFERENCIA_SKIP_SEFAZ_TESTING=false`, ambiente `homologacao` explícito e configuração de endpoint/schema atual validada.

### Credenciamento e certificado

- [ ] UF e estabelecimento emissor definidos; CNPJ, IE, regime e situação cadastral conferidos.
- [ ] Credenciamento de emissão em homologação confirmado para cada UF/estabelecimento que emitirá.
- [ ] Certificado A1 válido, senha disponível em secret manager e cadeia aceita pelo ambiente.
- [ ] Vínculo explícito do certificado ao contribuinte/estabelecimento, UF, ambiente, modelo e prioridade auditável.
- [ ] Autorizador e endpoint corretos para a UF, sem assumir endpoint nacional ou SVAN fora das UFs aplicáveis.

### Dados do caso de transferência

- [ ] Grupo de transferência real de homologação, com filial base e filial requisitante válidas.
- [ ] Produtos com NCM, CEST/GTIN quando aplicável, unidade, quantidade, preço e origem resolvidos.
- [ ] CFOP, CST/CSOSN, tributos, totais, endereços, municípios/IBGE, IE e demais campos validados para a operação e UF.
- [ ] Série compartilhada com Delphi conferida e lock de numeração testado.
- [ ] NT, schemas e regras vigentes no pacote usado pelo teste, registrados com versão/hash.

### Roteiro e evidências

- [ ] Rodar o diagnóstico de homologação e arquivar JSON/log sanitizado.
- [ ] Testar status de serviço por UF e registrar endpoint, ambiente e resposta.
- [ ] Emitir uma NF-e 55 de transferência em homologação, registrando idempotency key, grupo, fotografia/hash, série/número, XML assinado, recibo, protocolo, chave e resposta sanitizada.
- [ ] Confirmar transição até `AUTORIZADA` e projeção idempotente no destino, sem NF-e de entrada, financeiro ou efeitos de venda/devolução.
- [ ] Repetir o mesmo comando e comprovar que não há segunda emissão.
- [ ] Exercitar rejeição corrigível, timeout ambíguo e reconciliação por recibo/chave, verificando pendência e retry duráveis.
- [ ] Obter aprovação fiscal/operacional antes de qualquer canário; nenhum documento de homologação deve ser tratado como documento com validade jurídica.

## Resultado operacional

Até H-01 e H-02 serem resolvidos, o teste real está **bloqueado**. Depois disso, o teste ainda depende de informar a UF/filial emissora e concluir credenciamento, certificado, ambiente e dados. O comando de diagnóstico é pré-requisito, não substituto do smoke test ponta a ponta.
