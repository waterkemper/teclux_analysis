# Prompt para /speckit.specify — identidade de certificado para NFS-e por CNPJ completo

```text
/speckit.specify

Adapte a arquitetura de certificados e a seleção de credenciais para suportar corretamente NFS-e, sem aplicar automaticamente à NFS-e a regra de compartilhamento adotada para NF-e. Não implemente nesta execução; produza especificação funcional/técnica, decisão de domínio, contratos, testes e critérios de aceite.

## Contexto e decisão obrigatória

Temos um Contribuinte Fiscal com várias Filiais que compartilham a mesma raiz de CNPJ. Para NF-e, uma Versão de Certificado Fiscal pode ser compartilhada entre Estabelecimentos Fiscais quando houver Vínculos de Certificado Fiscal explícitos e compatibilidade oficial.

Para NFS-e do Emissor/Sefin Nacional, o requisito deve ser mais restritivo:

- o emitente do DF-e/DPS enviado à API deve ser o mesmo identificado no certificado usado para assinar o documento;
- para NFS-e emitida em nome de uma Filial, a credencial usada para assinatura/transmissão deve identificar o CNPJ completo daquela Filial, salvo confirmação documental específica de outro autorizador;
- certificado da matriz com a mesma raiz não deve ser considerado automaticamente válido para emissão da NFS-e da Filial;
- certificado da matriz pode ser tratado como credencial de consulta/distribuição do ADN somente quando o endpoint permitir validação por raiz. Essa exceção não libera emissão.

Base oficial a considerar:

- Manual de Contribuintes — Emissor Público API do Sistema Nacional NFS-e;
- Manual Integrado/Manual de Orientação aos Contribuintes do Sistema Nacional NFS-e;
- Manual do ADN para distribuição de DF-e, que possui regra própria para consultas/distribuição por mesma raiz.

Não transformar uma interpretação de NF-e em regra geral de NFS-e. Para município/autorizador diferente da Sefin Nacional, exigir política específica documentada.

## Cenário de aceite principal

Considere um Contribuinte Fiscal com 10 Filiais sob a mesma raiz: somente a Filial A possui certificado individual com CNPJ completo no legado Delphi; as demais possuem certificado da matriz ou certificado compartilhado de mesma raiz; algumas podem possuir certificado próprio de serviço separado do certificado de NF-e.

A especificação deve garantir que:

1. NFS-e da Filial A use o certificado cujo CNPJ completo é o da Filial A;
2. NFS-e das demais Filiais seja bloqueada antes da transmissão se não houver certificado compatível com o CNPJ completo da Filial emitente;
3. não exista fallback silencioso para matriz ou outra Filial;
4. certificado específico de NFS-e possa coexistir com certificado de NF-e na mesma Filial;
5. consulta/distribuição ADN que aceite mesma raiz seja capacidade distinta e nunca libere emissão.

## Modelo de domínio a especificar

### 1. Escopo da credencial

Estenda o modelo atual de Versão e Vínculo de Certificado Fiscal para representar, no mínimo:

- finalidade/capacidade: `NFE_ASSINATURA`, `NFE_TRANSMISSAO`, `NFSE_ASSINATURA`, `NFSE_TRANSMISSAO`, `NFSE_ADN_CONSULTA` ou enumeração equivalente;
- autorizador/provedor: Sefin Nacional NFS-e, Prefeitura/SEFIN própria, SEFAZ NF-e ou outro;
- município/UF e código do município quando aplicável;
- modelo/documento: NF-e, NFC-e, NFS-e ou outro;
- CNPJ completo identificado no certificado após inspeção do A1;
- Filial/Estabelecimento Fiscal autorizado pelo vínculo;
- ambiente, vigência, prioridade, estado de validação e estado operacional.

O CNPJ titular extraído do certificado deve ser comparado no servidor. Não confiar na raiz, no nome informado pelo operador ou nos dados do browser.

### 2. Regras de seleção

Defina chaves determinísticas por operação:

- NF-e/NFC-e: regra existente, respeitando Filial, UF, ambiente, modelo e capacidade;
- NFS-e emissão/assinatura: Filial emissora + CNPJ completo + município/provedor + ambiente + modelo/capacidade;
- NFS-e ADN consulta/distribuição: pode aceitar raiz somente quando o contrato oficial do endpoint permitir;
- nenhum escopo pode selecionar certificado de outra Filial por igualdade de raiz;
- ausência de certificado CNPJ-exato para NFS-e produz falha de pré-condição antes da geração/transmissão.

### 3. Assinatura versus transmissão

Verifique no manual vigente do provedor se assinatura do XML/DPS e autenticação TLS/transmissão usam a mesma credencial ou podem ser distintas. Modele as capacidades separadamente quando permitido, mas mantenha a regra mais restritiva para assinatura: CNPJ emitente igual ao CNPJ do certificado da assinatura.

Não assumir que certificado válido para autenticar o canal é válido para assinar DPS de outra Filial.

### 4. Delphi e migração

- Inventariar certificados individuais atualmente configurados no Delphi, identificando Filial, CNPJ completo, finalidade conhecida, validade e origem, sem copiar senha/material em claro.
- Importar somente metadados necessários para orientar a custódia Laravel.
- Definir como o certificado individual da Filial A será custodiado no Laravel e como certificados de serviço serão diferenciados dos certificados NF-e.
- Definir estado `sem_credencial_nfse_compativel`, alerta e bloqueio para as nove Filiais sem certificado CNPJ-exato.
- Não alterar certificado compartilhado de NF-e para fazê-lo parecer válido para NFS-e.

### 5. Tela de gerenciamento

A tela deve:

- mostrar Filiais reais do ERP e credenciais por finalidade/provedor;
- separar visualmente NF-e/NFC-e de NFS-e;
- indicar “certificado da mesma raiz — não válido para emissão NFS-e desta Filial” quando aplicável;
- indicar CNPJ do certificado de forma sanitizada e se corresponde exatamente ao CNPJ da Filial;
- permitir upload de versão específica de NFS-e e vínculo à Filial correta;
- não pedir razão social, raiz ou código de Filial em texto livre;
- impedir ativação de vínculo NFS-e com CNPJ incompatível;
- deixar explícito quando um certificado é permitido apenas para `NFSE_ADN_CONSULTA`.

### 6. Florianópolis / Emissor Nacional

Trate Florianópolis como integração do Sistema Nacional NFS-e enquanto o município utilizar o Emissor/Sefin Nacional, sem codificar isso como regra eterna. A especificação deve:

- registrar município/provedor e versão da documentação usada;
- consultar e versionar parâmetros do município e status de convênio/habilitação;
- testar em produção restrita com Filial cujo certificado tenha CNPJ completo compatível;
- testar negativamente certificado da matriz para emissão em nome de Filial;
- preservar evidência sanitizada de certificado, CNPJ emitente, endpoint, ambiente, município e resposta;
- bloquear transmissão quando a política vigente não puder ser determinada.

## Testes obrigatórios

Produza testes automatizados e roteiro manual para:

- NF-e usando certificado compartilhado explicitamente vinculado;
- NFS-e da Filial A usando certificado de CNPJ completo da Filial A;
- NFS-e da Filial B tentando usar certificado da matriz com mesma raiz — deve falhar antes da transmissão;
- NFS-e da Filial B usando certificado individual de serviço — deve ser selecionável e validável;
- certificado da matriz permitido somente em consulta ADN quando o endpoint autorizar;
- certificado válido para transmissão, mas incompatível para assinatura;
- CNPJ titular ausente, inválido, expirado, revogado ou divergente;
- município não conveniado, contribuinte não habilitado no CNC ou política desatualizada;
- homologação e produção isoladas;
- ausência de senha, PFX, chave privada e ciphertext em logs, auditoria, props, XMLs de erro e respostas;
- regressão da seleção NF-e/NFC-e e do gateway atual.

## Critérios de aceite

1. O sistema distingue certificado de NF-e/NFC-e, NFS-e emissão e consulta ADN.
2. Para NFS-e Nacional, não existe seleção automática por raiz de CNPJ.
3. A Filial só emite NFS-e com credencial compatível com CNPJ completo e provedor/município.
4. O cenário matriz + nove Filiais sem certificados individuais fica visível e bloqueado de forma explicável.
5. Certificado específico de serviço pode coexistir com certificado de NF-e.
6. A tela e os diagnósticos exibem a razão do bloqueio antes do envio.
7. A regra de mesma raiz para ADN não é reutilizada em emissão.
8. Alterações de política, vínculo, ativação e bloqueio são auditáveis e versionadas.

## Fora de escopo

- Implementar código durante `/speckit.specify`.
- Declarar que toda NFS-e municipal tem a mesma regra sem consultar o autorizador.
- Usar certificado da matriz para NFS-e da Filial apenas porque a raiz é igual.
- Alterar o fluxo de NF-e sem evidência específica.
- Armazenar certificados em S3 ou campos legados de senha.

Entregue a especificação, decisão/ADR de identidade por documento, matriz de capacidades, contrato de seleção, plano de migração dos certificados Delphi, testes de homologação e runbook operacional. Não implemente.
```
