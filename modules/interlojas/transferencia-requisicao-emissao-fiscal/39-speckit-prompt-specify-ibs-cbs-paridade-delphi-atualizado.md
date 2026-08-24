# Prompt 39 para `/speckit.specify` — IBS/CBS na NF-e de transferência conforme Delphi atualizado

## Objetivo

Implementar o suporte a IBS/CBS na emissão de NF-e modelo 55 do módulo Laravel de Transferência de Requisição para Exposição, mantendo paridade com o código Delphi atualizado e com as estruturas fiscais existentes no PostgreSQL.

O suporte deve abranger:

- cálculo ou recálculo fiscal de saída;
- leitura dos dados calculados por item e por documento;
- fotografia fiscal imutável;
- serialização das tags `IBSCBS` por item;
- serialização da tag `IBSCBSTot` no total;
- validação, idempotência e transmissão da NF-e.


## Escopo

Incluir somente:

- NF-e modelo 55;
- operação de saída da transferência de requisição para exposição;
- itens de produtos;
- IBS/CBS da saída;
- compatibilidade com `dadosfiscais`, `produtosdadosfiscais`, `xmlnfe` e artefatos Laravel.

Excluir:

- venda entre filiais;
- devolução;
- NFS-e;
- NFC-e modelo 65;
- IBS/CBS de serviços;
- entrada fiscal;
- cancelamento e inutilização;
- etiquetas e impressão;
- DANFE padrão ou simplificada;
- equivalência geral fotografia/legado/XML;
- alteração das regras de ICMS, IPI, PIS ou COFINS;


## Evidências do Delphi atualizado

### 1. Sequência da transferência

Em `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas`:

- o fluxo da transferência chama o cálculo fiscal de saída antes da emissão (`CalcularImpostos(..., TransferenciaSaida)`);
- a NF-e é montada por `ImprimirNFE`, que chama `NFe.GerarNFe(...)`;
- após a persistência operacional, o Delphi chama `CalcularImpostos(numero, 'S')`;
- o overload de `CalcularImpostos(numero, 'S')` executa a função PostgreSQL `fn_recalcula_saida(numero)`.

A especificação deve esclarecer qual chamada efetivamente grava `trib_saida_item_imposto` e `trib_saida_total_imposto` antes da montagem do XML. No Laravel, os valores de IBS/CBS precisam estar calculados e fotografados antes da serialização e transmissão. Não pode existir uma segunda etapa que recalcule os tributos somente depois de o XML já ter sido transmitido.

O recálculo deve ser idempotente e não pode criar novo movimento de estoque, novo número, nova chave ou novo documento fiscal.

### 2. Origem dos dados por item

Em `delphi/repositorio/dmDadosNFe.dfm` e `dmDadosNFe.pas`, a consulta de saída usa:

- `produtosdadosfiscais` como identificação do item;
- `dadofiscal`, `produto` e `numero` como chave de correlação;
- `trib_saida_item_imposto` relacionado a `trib_imposto`.

Para cada item, a consulta busca:

- de `CBS`: `codigo_cst`, `cclasstrib`, `vbc`, `paliq`, `vimposto`;
- de `IBSUF`: `paliq`, `vimposto`;
- de `IBSMUN`: `paliq`, `vimposto`.

O Delphi considera que `CST`, `cClassTrib` e a base são comuns aos três componentes e usa os dados associados a `CBS` como fonte comum. Não aceitar divergências silenciosas entre CBS, IBS UF e IBS município.

### 3. Tags IBS/CBS por item

Em `delphi/biblio/automacao/clnfe.pas`, no caminho de saída, quando `Abrir_Trib_Item_Imposto` encontra registro e `codigo_cst_cbsibs` e `cclasstrib_cbsibs` estão preenchidos, o Delphi gera:

```xml
<IBSCBS>
  <CST>...</CST>
  <cClassTrib>...</cClassTrib>
  <gIBSCBS>
    <vBC>...</vBC>
    <gIBSUF>
      <pIBSUF>...</pIBSUF>
      <vIBSUF>...</vIBSUF>
    </gIBSUF>
    <gIBSMun>
      <pIBSMun>...</pIBSMun>
      <vIBSMun>...</vIBSMun>
    </gIBSMun>
    <vIBS>vIBSUF + vIBSMun</vIBS>
    <gCBS>
      <pCBS>...</pCBS>
      <vCBS>...</vCBS>
    </gCBS>
  </gIBSCBS>
</IBSCBS>
```

As alíquotas são serializadas com quatro casas e os valores monetários com duas casas, conforme o código Delphi atual. A soma de `vIBS` deve ser calculada de forma determinística a partir de `vIBSUF + vIBSMun`, com a mesma escala usada no XML.

Se o grupo for aplicável, não gerar `IBSCBS` parcial. Se não for aplicável conforme o cadastro fiscal e a competência/layout vigente, não gerar grupo artificial com valores inventados.

### 4. Origem dos totais

A consulta de totais Delphi usa `trib_saida_total_imposto`, relacionada a `dadosfiscais` por `dadofiscal` e a `trib_imposto` pelos códigos:

- `CBS`;
- `IBSUF`;
- `IBSMUN`.

Ela soma:

- base CBS/IBS;
- valor CBS;
- valor IBS UF;
- valor IBS município.

A consulta somente considera os totais existentes quando houver pelo menos um valor calculado não nulo.

### 5. Tags IBS/CBS totais

Para a saída, `clnfe.pas` gera `IBSCBSTot` com:

- `vBCIBSCBS`;
- `gIBS.gIBSUF.vIBSUF`;
- `gIBS.gIBSMun.vIBSMun`;
- `gIBS.vIBS = vIBSUF + vIBSMun`;
- `gCBS.vCBS`.

O Delphi atual também gera explicitamente, no contexto dessa operação:

- `gIBSUF.vDif = 0`;
- `gIBSUF.vDevTrib = 0`;
- `gIBS.vCredPres = 0`;
- `gIBS.vCredPresCondSus = 0`;
- `gIBSMun.vDif = 0`;
- `gIBSMun.vDevTrib = 0`;
- `gCBS.vDif = 0`;
- `gCBS.vDevTrib = 0`;
- `gCBS.vCredPres = 0`;
- `gCBS.vCredPresCondSus = 0`.

No Laravel, esses zeros só podem ser utilizados quando o contrato do layout e o cenário fiscal da transferência determinarem que o campo é aplicável com valor zero. Não preencher campos opcionais por conveniência e não transformar ausência de cálculo em zero.

## Requisitos da especificação

### 1. Mapear a autoridade fiscal instalada

Inspecionar o PostgreSQL disponível e documentar:

- existência de `trib_imposto`;
- existência de `trib_saida_item_imposto`;
- existência de `trib_saida_total_imposto`;
- existência do catálogo `tributos_cst_ibscbs` ou equivalente;
- existência da função `fn_recalcula_saida`;
- colunas e chaves de correlação;
- regras vigentes de `CBS`, `IBSUF` e `IBSMUN`;
- competência, versão de leiaute e vigência que tornam o grupo aplicável.

Não inventar tabelas, colunas, CST, `cClassTrib`, alíquotas ou valores padrão.

Se a estrutura não existir ou não estiver publicada para o escopo da filial, bloquear a emissão antes de reservar número e produzir pendência operacional clara.

### 2. Definir a ordem correta do cálculo

A especificação deve definir uma única autoridade de cálculo:

- função PostgreSQL existente, se for a autoridade instalada; ou
- serviço fiscal Laravel, se não houver função utilizável.

O serializer não pode calcular IBS/CBS. Ele deve apenas serializar a fotografia fiscal já calculada.

O fluxo mínimo deve ser:

1. reler o documento e itens com os bloqueios transacionais existentes;
2. executar ou solicitar o cálculo de saída;
3. ler os registros calculados por item e total;
4. validar coerência e completude;
5. congelar os dados IBS/CBS na fotografia fiscal;
6. gerar o XML;
7. validar o XML contra o XSD vigente;
8. transmitir a NF-e;
9. persistir `xmlnfe` e artefatos já existentes.

Falha em qualquer etapa deve impedir transmissão e não pode duplicar movimentos ou numeração.

### 3. Definir o contrato da fotografia

Criar um contrato explícito para IBS/CBS por item e total, contendo no mínimo os campos necessários para reproduzir o XML:

Por item:

- `cst`;
- `c_class_trib`;
- `v_bc`;
- `p_ibs_uf`;
- `v_ibs_uf`;
- `p_ibs_mun`;
- `v_ibs_mun`;
- `v_ibs`;
- `p_cbs`;
- `v_cbs`.

Por total:

- `v_bc_ibs_cbs`;
- `v_ibs_uf`;
- `v_ibs_mun`;
- `v_ibs`;
- `v_cbs`;
- `v_dif_ibs_uf`;
- `v_dev_trib_ibs_uf`;
- `v_cred_pres_ibs`;
- `v_cred_pres_cond_sus_ibs`;
- `v_dif_ibs_mun`;
- `v_dev_trib_ibs_mun`;
- `v_dif_cbs`;
- `v_dev_trib_cbs`;
- `v_cred_pres_cbs`;
- `v_cred_pres_cond_sus_cbs`.

Os nomes podem ser adaptados ao padrão do projeto, mas a matriz de origem → fotografia → XML deve ser documentada.

Os valores não podem vir do payload da tela. A tela pode iniciar a operação, mas não pode informar CST, `cClassTrib`, alíquotas, bases ou valores fiscais.

### 4. Validar coerência

Bloquear a emissão quando ocorrer qualquer uma destas situações:

- item com apenas parte do grupo IBS/CBS;
- CST ou `cClassTrib` ausente quando o grupo for aplicável;
- CST divergente entre CBS, IBS UF e IBS município;
- `cClassTrib` divergente entre CBS, IBS UF e IBS município;
- `vIBS` diferente da soma dos componentes;
- total divergente da soma dos itens, respeitando a escala definida;
- base, alíquota ou valor incompatível com a regra fiscal cadastrada;
- total existente sem itens correspondentes;
- item existente sem total quando o leiaute exigir total;
- cálculo executado depois da fotografia ou depois da geração do XML.

Cada bloqueio deve informar documento, produto, campo, origem e ação corretiva. Nenhum bloqueio deve reservar nova numeração.

### 5. Serialização NFePHP

Estender o serializer atual para usar a API efetivamente instalada do `nfephp-org/sped-nfe`.

Antes da implementação, verificar no container:

- classes e propriedades disponíveis para `IBSCBS`;
- classes e propriedades disponíveis para `IBSCBSTot`;
- nomes exatos dos campos `CST`, `cClassTrib`, `gIBSCBS`, `gIBSUF`, `gIBSMun`, `gCBS`;
- suporte aos campos de diferença, devolução tributária e crédito presumido;
- ordem dos grupos e compatibilidade com o XSD vigente.

Não montar XML manualmente se a API NFePHP fornecer os objetos oficiais. Não usar propriedades inexistentes ou assumir que o nome Delphi é igual ao nome da biblioteca PHP.

### 6. Compatibilidade legada

IBS/CBS deve ser persistido no contrato fiscal Laravel sem alterar os campos legados já utilizados pelo Delphi.

Manter:

- `dadosfiscais.xmlnfe` com o XML efetivamente transmitido/autorizado;
- `produtosdadosfiscais` com os campos já existentes;
- movimentos de estoque sem duplicação;
- `dadofiscal` e vínculos de `pedidosfiliais`;
- projeção e artefatos de DANFE existentes.

Não tentar criar artificialmente novas colunas legadas sem comprovar a necessidade no banco instalado.

## Testes obrigatórios

Criar testes determinísticos, sem SEFAZ real, para provar:

- leitura de uma configuração fiscal IBS/CBS válida do PostgreSQL;
- cálculo/re cálculo idempotente para um documento de transferência;
- persistência de registros por item e por total;
- CST e `cClassTrib` comuns aos três componentes;
- `vIBS = vIBSUF + vIBSMun` por item e total;
- escalas de quatro casas para alíquotas e duas para valores;
- geração de `IBSCBS` por item;
- geração de `IBSCBSTot` no total;
- campos de diferença, devolução e crédito conforme regra vigente, inclusive zeros explicitamente autorizados;
- ausência de `IBSCBS` parcial;
- bloqueio antes da numeração quando faltar configuração ou cálculo obrigatório;
- valores oriundos do banco/cálculo, nunca do request;
- retry idempotente sem duplicar tributos, estoque, número ou chave;
- XML validado pelo XSD vigente;
- `xmlnfe` contendo o mesmo XML que foi transmitido;
- autorização e geração da DANFE padrão continuando a funcionar.

Usar fixtures determinísticas dos registros de item/total e do XML esperado, sem exigir comparação de equivalência com o Delphi.

## Critérios de aceite

1. Uma transferência com IBS/CBS aplicável gera todos os grupos de item e total exigidos.
2. Os valores vêm da autoridade fiscal instalada e são congelados antes do XML.
3. Não há CST, `cClassTrib`, alíquota ou valor inventado.
4. A soma de IBS UF e IBS município é consistente em item, total e XML.
5. A emissão é bloqueada antes da numeração quando os dados exigidos estão ausentes ou inconsistentes.
6. O retry não duplica registros tributários nem efeitos operacionais.
7. O XML validado é salvo em `dadosfiscais.xmlnfe` e segue para transmissão.
8. O fluxo de transmissão, autorização, DANFE e reimpressão permanece compatível.
9. O suporte limita-se à NF-e de saída modelo 55 da transferência.

## Entrega

Produzir a especificação completa com:

- mapeamento Delphi → PostgreSQL → fotografia Laravel → NFePHP/XML;
- decisão sobre a autoridade do cálculo;
- contratos e estruturas de dados;
- sequência transacional;
- erros e pendências;
- migrations somente se comprovadamente necessárias;
- testes e fixtures;
- estratégia de habilitação por competência/leiaute;
- rollout seguro sem alterar NF-e já autorizada.

Não implementar código durante `/speckit.specify`.
