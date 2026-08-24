# Prompt 31 — Paridade de impostos e natureza de produção própria

## Instrução para o agente

Você deve executar somente /speckit.specify. Não implemente código, não crie migrations e não altere arquivos da aplicação nesta etapa. Produza uma especificação implementável, com plano, contratos, testes e critérios de aceite.

Revise somente o código Laravel atual para a emissão de NF-e modelo 55 originada exclusivamente de Transferência de Requisição para Exposição, operação TransferenciaSaida.

Importante: o Cursor não tem acesso ao código-fonte Delphi. Não tente abrir, localizar ou solicitar arquivos Delphi. As regras comportamentais necessárias foram transcritas neste prompt e devem ser tratadas como referência de paridade já fornecida.

Esta especificação não abrange VendaTransferencia, DevolucaoTransferencia, NFS-e, cancelamento, inutilização, impressão automática, etiquetas ou qualquer operação fiscal fora da transferência simples.

## Fontes obrigatórias

No Laravel, inspecione pelo menos:

- app/Domain/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalNaturezaPadrao.php
- app/Domain/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalNaturezaCodigoResolver.php
- app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalFormarGruposService.php
- app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalPrepararFotografiaService.php
- app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalAtribuirImpostosSaida.php
- app/Infrastructure/Interlojas/TransferenciaRequisicaoEmissaoFiscal/LegacyTransferenciaFiscalLinhasReadRepository.php
- app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalProjetarDocumentoLegadoService.php
- os testes e contratos já existentes para fotografia, natureza, impostos e projeção de produtosdadosfiscais.

## Referência comportamental Delphi já fornecida

Use os fatos abaixo como contrato de paridade; não dependa de acesso ao Delphi:

- na transferência simples, os produtos são agrupados por produto/filial de estoque e quantidade recebida;
- o fluxo chama um único cálculo fiscal de saída para a operação TransferenciaSaida, com UF da filial requisitante;
- a seleção da natureza carrega os campos de naturezaspadrao e naturezas, e os campos preenchidos da natureza prevalecem individualmente sobre os campos correspondentes do produto;
- a carga fiscal do produto inclui origem, classificação ICMS, CSOSN, base e modalidade ICMS, redução de base, alíquota dependente do destino, IPI, PIS, COFINS, GTIN e classificação fiscal;
- os impostos são calculados antes da projeção para produtosdadosfiscais e seus valores devem alimentar os totais;
- o preço da transferência usa custo médio, depois último custo médio e, por fim, valor da última compra.

Não copie nomes de componentes visuais nem crie um segundo motor fiscal.

## Diagnóstico que a especificação deve resolver

O Laravel já possui uma distinção parcial de natureza por producao_propria, porém a especificação deve comprovar e completar toda a cadeia:

1. A fonte autoritativa é caracteristicas.producaopropria do produto, lida novamente no momento de montar a fotografia/emissão. Dados enviados pela tela ou pelo request não podem substituir o banco.
2. Quando o produto for de produção própria, a descrição exata da natureza do item deve ser:

   TRANSFERÊNCIA DE MERCADORIAS - S - PRODUCAO PROPRIA

3. Quando o produto não for de produção própria, a descrição exata da natureza do item deve ser:

   TRANSFERÊNCIA DE MERCADORIAS - S

4. A consulta da natureza deve reproduzir a seleção do Delphi (naturezaspadrao + naturezas + codigosfiscais), carregando também os campos fiscais da natureza. Não basta retornar somente descrição, natureza e CFOP.
5. Uma mesma NF pode conter linhas com producaopropria=true e false. A flag de produção própria não deve ser critério de separação da NF.
6. Natureza padrão, código da natureza e CFOP são resolvidos no nível de cada produto/item. O CFOP efetivamente aplicado pode ser diferente entre itens da mesma NF, inclusive por produto de produção própria, UF de destino e regra fiscal.
7. A natureza e o CFOP resolvidos para cada item devem permanecer iguais na fotografia, no documento legado e no XML. Ausência, duplicidade ou inatividade da natureza aplicável a qualquer item deve impedir a emissão antes de reservar número.

## Requisitos de paridade tributária

A especificação deve definir a matriz completa de origem, precedência, cálculo, arredondamento e projeção dos impostos conforme a referência comportamental fornecida acima. Não aceite zeros artificiais para tributos aplicáveis.

### Dados do produto

Verifique o carregamento e a disponibilidade, no agregado fiscal da linha, de todos os campos usados no Delphi, incluindo:

- NCM/classificação fiscal, origem, GTIN/CEAN;
- baseicms, classificação/incidência ICMS, csosn, modalidade ICMS e modalidade ST;
- percentual de redução de base e redução de base ST;
- alíquota ICMS própria e alíquota ICMS-ST determinada para UF de destino;
- ipicst, alíquota IPI e os demais campos necessários à base, valor e outras do IPI;
- piscst, cofinscst, alíquotas PIS e COFINS;
- caracteristicas.producaopropria;
- custo médio, último custo médio e última compra, na mesma ordem de fallback do Delphi.

O preço da transferência deve preservar a regra do Delphi: custo médio; se ausente, último custo médio; se ainda ausente, valor da última compra. Qualquer diferença deve ser explicitamente justificada na especificação.

### Precedência natureza versus produto

Documente e implemente na especificação a precedência tributária fornecida na referência comportamental:

- quando a natureza padrão tiver classificação fiscal preenchida, ela prevalece para ICMS/CSOSN, IPI, PIS e COFINS;
- quando o campo da natureza estiver vazio, usa-se o campo correspondente do produto;
- a regra deve ser aplicada por tributo e campo, sem substituir um bloco inteiro por valores incompletos;
- a natureza de produção própria não pode ser apenas uma descrição: seus campos fiscais precisam participar do cálculo exatamente como a natureza comum.

### ICMS

Defina os casos de ICMS tributado, não tributado, CSOSN e ST conforme o regime e a classificação efetivamente carregados. A especificação deve cobrir:

- classificação final (CST/CSOSN) e origem;
- seleção da alíquota conforme UF de destino;
- base, redução, alíquota e valor;
- modalidade e informações de ST quando aplicáveis;
- compatibilidade entre classificação e campos monetários;
- comportamento explícito para operações sem incidência.

Não aceitar uma estrutura icms apenas classificatória quando a operação exigir valores. Se a fonte necessária estiver ausente ou inconsistente, a emissão deve falhar com diagnóstico fiscal antes de criar uma NF parcial.

### IPI

Defina a mesma origem e precedência para ipicst e produto/natureza, além de base, alíquota, valor e outras quando aplicáveis. Não manter v_ipi=0 como valor fixo sem demonstrar que o CST final da operação exige isso.

### PIS e COFINS

Preserve o componente existente de cálculo, mas complete sua paridade com o Delphi:

- CST final por precedência natureza/produto;
- base, alíquota e valor;
- regras de não incidência;
- arredondamento monetário;
- totais da NF e projeção de cada item.

Não criar um cálculo paralelo no serializer ou somente no momento de transmissão.

## Totais e persistência

A especificação deve exigir que os mesmos valores calculados sejam usados em:

- fotografia fiscal;
- totais do documento;
- produtosdadosfiscais;
- dadosfiscais;
- XML que será transmitido;
- DANFE/PDF posteriormente.

Inclua todos os campos ICMS, IPI, PIS e COFINS exigidos pela referência comportamental e suportados pelo esquema legado. O documento não pode ser considerado pronto se possui apenas v_prod e alguns totais PIS/COFINS.

Toda validação fiscal deve ocorrer antes da reserva definitiva da numeração. A reserva não pode ser usada para mascarar ausência de produto, natureza ou imposto.

lotetransferencia é metadado operacional e não deve ser transformado em requisito fiscal adicional para formar a fotografia ou calcular impostos.

## Testes e critérios de aceite

Defina testes determinísticos para, no mínimo:

1. produto normal e produto com caracteristicas.producaopropria=true;
2. naturezas comum e de produção própria, incluindo os campos fiscais preenchidos;
3. natureza com campo fiscal preenchido e produto divergente;
4. natureza com campo fiscal vazio e fallback para produto;
5. ICMS tributado, não tributado, CSOSN e ST, conforme dados reais disponíveis;
6. IPI aplicável e não aplicável;
7. PIS/COFINS tributados e não tributados;
8. transferência local e interestadual, validando a alíquota dependente da UF;
9. ausência de cadastro fiscal obrigatório, que deve falhar antes da numeração;
10. comparação dos valores e campos projetados contra a matriz de paridade transcrita neste prompt.

Os testes devem provar que uma mesma fotografia pode conter as duas classificações de produção própria, que cada item recebe exatamente sua natureza e seu CFOP, e que nenhum imposto aplicável é silenciosamente zerado.

## Entregáveis do /speckit.specify

Entregue:

- especificação funcional e técnica;
- matriz da referência comportamental fornecida → Laravel de campos e precedência;
- decisão sobre os campos legados que precisam ser projetados;
- sequência transacional e pontos de falha;
- plano de implementação em pequenos passos;
- testes unitários, integração e contrato;
- critérios de aceite observáveis;
- lista de lacunas ainda dependentes de configuração fiscal real.

Não implemente código nesta etapa.
