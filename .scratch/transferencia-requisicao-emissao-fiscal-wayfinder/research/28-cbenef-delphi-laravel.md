# Pesquisa — `cBenef` no Delphi e no Laravel

## Conclusão

Há uma lacuna real no fluxo de emissão fiscal da Transferência no Laravel.
O Delphi calcula `cBenef` por item através da função de banco
`Codigo_cBenef(...)` e escreve o resultado no grupo `<prod>` da NF-e somente
quando o retorno não é vazio. O Laravel atual possui a tabela e a tela de
cadastro de `caracteristicas_cbenef`, mas não resolve o código no contexto
fiscal da emissão e não o envia ao serializer NFePHP.

## Evidência Delphi — CONFIRMADO

- `delphi/biblio/automacao/clnfe.pas:183-184,493` declara o getter e a
  propriedade indexada `cBenef`.
- `delphi/biblio/automacao/clnfe.pas:16548-16578` executa:
  `select Codigo_cBenef(:pCodigodoProduto, :pEmit_CRT, :pEmit_UF, :pCST, :pCSOSN, :pCodigoFiscal, :pCodigoNatureza) as cbenef`.
- `delphi/biblio/automacao/clnfe.pas:5543-5550` e `4337-4344` chamam a
  propriedade para cada item e geram `TagCompleta('cBenef', fcBenef)` somente
  quando o resultado é diferente de vazio.
- Os argumentos são, portanto, produto, CRT do emitente, UF do emitente,
  CST, CSOSN, código fiscal/CFOP e código da natureza. A regra não é uma
  simples busca por UF na tabela de benefícios.
- O corpo da função PostgreSQL `Codigo_cBenef` não foi localizado nos fontes
  versionados. Isso é uma **DÚVIDA de infraestrutura**, não autorização para
  reimplementar a regra em PHP.

## Evidência Laravel — CONFIRMADO

- `laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyCaracteristicasCbenefRepository.php`
  lista, insere e remove linhas de `caracteristicas_cbenef`, mas não possui
  resolução por CRT/UF/CST/CSOSN/CFOP/natureza.
- `laravel/backend/tests/Feature/Estoque/ProdutoCaracteristicaFiscalCbenefTest.php`
  cobre apenas a leitura da aba fiscal do cadastro do produto.
- `LegacyTransferenciaFiscalLinhasReadRepository` carrega ICMS, IPI, PIS,
  COFINS, CFOP/natureza e CRT/UF são resolvidos na preparação da fotografia,
  mas o item não recebe `cbenef`.
- `TransferenciaFiscalPlatformAdapter` normaliza os itens sem `cbenef`.
- `NfePhpFotografiaSerializer::tagItem` preenche o grupo `<prod>` sem
  atribuir `cBenef` ao objeto do produto.
- Não foi localizado teste de emissão da Transferência que verifique
  `cBenef` no XML.

## Decisão

`CONFIRMADO`: deve existir prompt complementar para que o `cBenef` seja
resolvido no fechamento da fotografia fiscal, por item, e serializado no XML
antes da transmissão. O prompt deve usar a função legada como autoridade
quando disponível, diferenciar retorno vazio de erro de infraestrutura e não
inventar regra alternativa.

`CONFIRMADO`: `cBenef` pertence ao grupo `<prod>`, não ao grupo ICMS, e
não deve ser aplicado uma única vez ao cabeçalho ou a todos os itens da NF.
