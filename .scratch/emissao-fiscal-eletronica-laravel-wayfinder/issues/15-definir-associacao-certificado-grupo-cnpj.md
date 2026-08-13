# Definir a associação de Certificados A1 a grupos de CNPJ e Filiais

Type: research
Status: resolved

## Question

Como modelar Filiais que compartilham a mesma raiz de CNPJ quando o Certificado A1 pode ser compartilhado entre estabelecimentos ou pode existir uma versão específica para cada Filial, sem inferir equivalência apenas pela raiz e sem assinar uma emissão com identidade incompatível?

## Scope

Revisar as decisões e requisitos existentes sobre Certificado A1, Fotografia Fiscal, identidade da Emissão, seleção de configuração, rollout, observabilidade, artefatos e espelhamento Delphi. Determinar quais fatos devem ser confirmados por fonte oficial/UF e quais regras são contratos internos do domínio.

## Answer

O modelo deve separar **Contribuinte Fiscal** (a pessoa jurídica e o vínculo comum de seus estabelecimentos) de **Estabelecimento Fiscal** (cada matriz ou Filial que emite, possui inscrição/credenciamento e participa da identidade fiscal da nota). A raiz de CNPJ é uma evidência cadastral importante, mas não autoriza sozinha o uso de um certificado.

O Portal Nacional da NF-e informa que o certificado de qualquer estabelecimento da empresa pode ser usado para os demais estabelecimentos da empresa, e que não é necessário adquirir um certificado para cada estabelecimento. Também separa a assinatura do XML, que deve identificar estabelecimento da empresa emitente, da autenticação de transmissão, que pode usar certificado que identifique a empresa credenciada. O credenciamento, entretanto, continua sendo tratado por estabelecimento e por UF. Fontes: [Perguntas Frequentes — Certificação Digital](https://www.nfe.fazenda.gov.br/portal/perguntasFrequentes.aspx?AspxAutoDetectCookieSupport=1&tipoConteudo=FBya9bipr34%3D), [Perguntas Frequentes — estabelecimento e credenciamento](https://www.nfe.fazenda.gov.br/PORTal/perguntasFrequentes.aspx?AspxAutoDetectCookieSupport=1&tipoConteudo=auR4yGlWmRY%3D), [Ajuste SINIEF 7/05](https://www.confaz.fazenda.gov.br/legislacao/ajustes/2005/AJ007_05), [Ajuste SINIEF 19/16](https://www.confaz.fazenda.gov.br/legislacao/ajustes/2016/AJ_019_16).

Decisão interna:

- uma Versão de Certificado Fiscal é custodiada no nível do Contribuinte Fiscal e pode ser associada explicitamente a várias Filiais; também pode existir uma versão exclusiva para uma Filial;
- cada associação é um Vínculo de Certificado Fiscal, com vigência, escopo de UF/ambiente/modelo, prioridade e auditoria;
- a seleção de certificado é determinística por Estabelecimento Fiscal + UF + ambiente + modelo + operação, e não escolhe automaticamente outro certificado apenas porque compartilha a raiz;
- a validação exige que o CNPJ titular do certificado corresponda a um estabelecimento do mesmo Contribuinte Fiscal e que o vínculo/credenciamento esteja habilitado para o contexto da emissão; se a relação cadastral não puder ser comprovada, a ativação é bloqueada;
- assinatura XML e autenticação de transmissão são capacidades distintas e podem ter credenciais distintas, quando a UF/serviço exigir;
- a Emissão Fiscal continua identificada pela Filial emitente, e não pela versão do certificado. A rotação ou revogação de uma versão compartilhada afeta todas as Filiais vinculadas e gera bloqueios/alertas para cada contexto afetado;
- cada Tentativa Fiscal registra a versão, o vínculo selecionado e o motivo da seleção. O XML assinado não é alterado por troca posterior de certificado;
- rollout e numeração continuam por Filial, modelo, ambiente e Série Fiscal. O compartilhamento de certificado não cria contador, lock, modo de operação ou autoridade comuns entre Filiais.

Esta decisão corrige a redação anterior de “Certificado A1 por Filial” e a exigência de CNPJ titular exatamente igual ao CNPJ da Filial. A regra correta é “certificado custodiado por Contribuinte Fiscal, associado explicitamente a Estabelecimentos Fiscais, com compatibilidade oficial verificada”.
