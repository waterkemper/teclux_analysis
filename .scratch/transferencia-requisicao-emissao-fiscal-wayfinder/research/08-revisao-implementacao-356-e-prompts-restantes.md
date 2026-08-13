# Revisão da implementação 356 e prompts restantes

Data: 2026-08-12

## Base observada

O checkout local do submódulo `laravel` continua em `861a351e`. A implementação do prompt 10 está publicada na referência remota `origin/356-trf-fiscal-homologacao` (`1c7ad20d`), portanto esta revisão compara `861a351e..origin/356-trf-fiscal-homologacao` sem alterar o checkout.

## Veredito

A implementação fechou grande parte da durabilidade, projeção, binding real, testes e documentação, mas ainda não deve ser declarada pronta para o smoke real. Existem três blocos de correção que precisam virar especificações incrementais:

1. Integridade do XML, da chave e do pacote normativo.
2. Parsing SEFAZ e custódia de artefatos sem fabricar evidência.
3. Preflight e gate operacional realmente fail-closed.

## Achados

### R-11 — serializer ainda possui defaults fiscais e não fecha a identidade da NF-e

Em `NfePhpFotografiaSerializer` permanecem defaults para versão, natureza, `tpNF`, `tpImp`, `tpEmis`, `finNFe`, indicadores, `verProc`, totais tributários, transporte, pagamento, CRT, `indIEDest`, PIS/COFINS e dados de produto. Isso contradiz o contrato que exige fotografia selada completa, sem default fiscal.

Além disso, a alocação injeta `c_nf` e `dh_emi` na fotografia selada, mas o serializer não os utiliza. A chave de acesso, o `cDV`, a série, o número, o ambiente e o hash precisam ser calculados/conferidos de forma determinística. O teste atual apenas verifica presença de tags e aceita valores de fixture; não comprova chave válida nem igualdade com a emissão persistida.

### R-12 — parser pode classificar o `cStat` errado e fabricar `nfeProc`

`NfePhpSefazResponseParser` usa regex sobre o primeiro `cStat`, `xMotivo`, `nProt` e `chNFe`, sem distinguir envelope SOAP, retorno de lote e retorno de protocolo, nem namespaces. Em respostas com `cStat` externo e protocolo interno, isso pode classificar processamento como autorização ou rejeição.

`buildNfeProc` cria protocolo sintético quando a resposta autorizada não contém `protNFe`, com `tpAmb=2`, `verAplic=TECLUX` e `digVal` vazio. Isso não é artefato oficial da SEFAZ e não pode ser persistido como `nfeProc` autorizado. A consulta também retorna o SOAP bruto como `xmlProtocoloOuProc` quando encontra o texto `nfeProc`.

### R-13 — diagnóstico não prova binding real nem infraestrutura completa

`etapaFakeUnbound` identifica Fake apenas pelo nome da classe. Um double anônimo, mock ou decorator pode passar pelo gate. O teste existente usa uma implementação anônima para status e não demonstra que o gate a rejeitaria.

`etapaComunicacao` marca a etapa como `pass` sem avaliar se o `cStat` recebido representa serviço disponível, não limpa o `CertificateMaterial` obtido no preflight e não verifica banco, fila/worker, armazenamento de artefatos, CA/TLS ou endpoint efetivamente utilizado pelo NFePHP.

Não existe comando dedicado de smoke da transferência que recuse RB-03 quando o diagnóstico não está `APROVADO`; há runbook e helpers, mas a execução ainda depende de disciplina manual.

### R-14 — contrato de runtime ainda é inconsistente

O Docker usa PHP 8.5 e o diagnóstico exige PHP >= 8.4.1, mas `composer.json` ainda declara `php: ^8.3`. O ambiente pode instalar dependências num runtime que o próprio preflight rejeita. A suíte também não foi executada neste checkout porque o submódulo local permanece no baseline 861a351e e o runtime host é incompatível.

## Fora do escopo preservado

`VendaTransferencia` e `DevolucaoTransferencia` continuam fora da implementação ativa. Os prompts seguintes não devem criar NF-e de entrada, efeitos financeiros, baixa de origem, pipeline fiscal paralelo ou eventos de venda/devolução.
