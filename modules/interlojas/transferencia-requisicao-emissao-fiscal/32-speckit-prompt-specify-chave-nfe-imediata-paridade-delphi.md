# Prompt 32 — Geração imediata da chave NF-e com paridade Delphi

## Instrução para o agente

Você deve executar somente /speckit.specify. Não implemente código, não altere migrations e não faça transmissão à SEFAZ nesta etapa. Produza uma especificação implementável, com plano, contratos, testes e critérios de aceite.

O escopo é a NF-e modelo 55 originada de Transferência de Requisição para Exposição. Não incluir VendaTransferencia, DevolucaoTransferencia, NFS-e, cancelamento, inutilização, etiquetas ou impressão automática.

Importante: o Cursor não tem acesso ao código-fonte Delphi. Não tente abrir, localizar ou solicitar arquivos Delphi. A regra de geração da chave foi transcrita integralmente neste prompt e deve ser implementada apenas a partir desta referência e do código Laravel atual.

## Diagnóstico atual

Revise o código atual, especialmente:

- app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/AlocarEmissaoNfe55Service.php;
- app/Domain/Fiscal/ValueObjects/ChaveAcessoNfe55.php;
- app/Infrastructure/Fiscal/NfePhp/NfePhpFotografiaSerializer.php;
- normalizadores e repositórios de dadosfiscais, notas e fiscal_emissoes;
- testes de alocação, idempotência e transmissão.

A implementação atual reserva o número, mas grava chv_nfe nulo e deriva o cNF por SHA-256. Isso diverge do Delphi. O fato de a transmissão ocorrer depois não muda a identidade da NF: a chave deve existir imediatamente após a reserva do número.

## Algoritmo de referência compatível com Delphi

Reproduza exatamente a função Aleatorio(Data, NumeroNota), conforme a regra de referência fornecida:

1. forme AAMM com YYMM da data fiscal;
2. preencha o número reservado com zeros à esquerda até nove posições;
3. se o mês da data for par, forme o cNF com:
   - AAMM[1], número[6], AAMM[2], número[7], AAMM[3], número[8], AAMM[4], número[9];
4. se o mês for ímpar, forme:
   - número[6], AAMM[1], número[7], AAMM[2], número[8], AAMM[3], número[9], AAMM[4];
5. converta o resultado para inteiro e use-o como oito dígitos.

Esse algoritmo é determinístico e não é aleatório nem hash. Não manter SHA-256, UUID, fallback randômico ou outro algoritmo paralelo.

Depois forme a base da chave exatamente nesta ordem:

cUF + AAMM + CNPJ_emitente(14) + modelo(2) + série(3) + número(9) + tpEmis(1) + cNF(8)

Calcule o dígito verificador pelo mesmo módulo 11 e grave a chave final de 44 dígitos.

## Mapeamento obrigatório

A especificação deve fechar a origem de cada segmento:

- cUF: os dois primeiros dígitos do código IBGE do município da filial emitente, equivalente a CodigoCidadeIBGEFilialBase;
- AAMM: a mesma data fiscal persistida no documento, sem mudança de fuso entre alocação, XML e reprocessamento;
- CNPJ: CNPJ completo do emitente, com 14 dígitos;
- modelo: 55;
- série: série efetivamente reservada, com três dígitos;
- número: número efetivamente reservado, com nove dígitos;
- tpEmis/formaemissao: o mesmo valor que será enviado no XML;
- cNF/codaleatorio: resultado exato de Aleatorio.

Não aceitar uma chave montada com filial requisitante, CNPJ da matriz por conveniência, data UTC diferente, série sugerida diferente da série reservada ou qualquer valor da tela que não seja a identidade fiscal persistida.

## Momento e ordem transacional

Defina uma única sequência, protegida pela mesma transação e pelo mesmo FOR UPDATE da numeração:

1. bloquear e selecionar a série/contador;
2. reservar o número;
3. fixar a data fiscal, tpEmis, emitente, série e número;
4. calcular cNF, base e dígito verificador;
5. validar a chave;
6. selar a fotografia com a identidade fiscal;
7. gravar dadosfiscais, incluindo codaleatorio, formaemissao, digchaveacesso e chv_nfe;
8. gravar a chave correspondente em fiscal_emissoes.chave_nfe e nos demais espelhos/outbox previstos pelo contrato;
9. somente então publicar o estado pendente de transmissão.

Qualquer divergência entre as representações deve abortar a transação. Não gravar a NF com chv_nfe=null para preencher depois.

## Fonte única e idempotência

Reutilize ou estenda ChaveAcessoNfe55 como fonte única de montagem. O serializer, o gateway, o worker, a reconciliação e o PDF devem consumir a identidade persistida, e não recalcular outra chave.

Defina explicitamente:

- retries não podem mudar cNF ou chv_nfe;
- replay idempotente deve retornar a mesma chave;
- a chave identifica a NF, mas não significa autorização da SEFAZ;
- o estado pode permanecer aguardando transmissão com a chave já disponível;
- XML, legado, Cloud, fotografia e resposta da API devem apresentar a mesma chave de 44 dígitos;
- registros antigos com número reservado e chave nula não podem receber uma chave inventada silenciosamente: especificar reparo seguro usando a identidade autoritativa ou bloqueio administrativo.

## Compatibilidade com o serializer

O preflight do XML deve comparar a chave persistida com a chave que seria composta pelos campos do XML. Se houver divergência, falhar antes da transmissão e registrar diagnóstico acionável.

Não duplicar no serializer a regra de Aleatorio. Se a biblioteca fiscal exigir a chave derivada dos campos, a composição deve produzir exatamente o valor persistido pelo fluxo de alocação.

## Testes obrigatórios

Crie na especificação vetores determinísticos para:

1. mês par e mês ímpar;
2. número com menos de nove dígitos;
3. série com menos de três dígitos;
4. modelo 55, CNPJ completo e UF derivada do IBGE;
5. tpEmis/formaemissao usado no XML;
6. cálculo do módulo 11;
7. comparação entre a implementação Laravel e os vetores da regra de referência para o mesmo par data/número;
8. rollback quando a chave não puder ser validada;
9. retry após falha de transmissão, preservando a chave;
10. igualdade entre dadosfiscais.chv_nfe, fiscal_emissoes.chave_nfe, fotografia e XML.

Os testes devem demonstrar que a chave é calculada antes de qualquer transmissão e imediatamente após a reserva do número, sem depender de lote ou de resposta da SEFAZ.

## Entregáveis do /speckit.specify

Entregue:

- especificação funcional e técnica;
- contrato de identidade entre Laravel, legado, Cloud e XML;
- pseudocódigo do algoritmo compatível com Delphi;
- sequência transacional com locks;
- estratégia para registros históricos com chave ausente;
- plano incremental de implementação;
- testes unitários, integração e contrato;
- critérios de aceite observáveis.

Não implemente código nesta etapa.
