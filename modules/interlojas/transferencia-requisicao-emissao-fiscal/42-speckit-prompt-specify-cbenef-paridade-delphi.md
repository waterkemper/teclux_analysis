# Prompt `/speckit.specify` — `cBenef` por item com paridade Delphi

Revise o Laravel atual, a pesquisa
`/mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/28-cbenef-delphi-laravel.md`,
as specs fiscais anteriores deste módulo e os fontes Delphi citados abaixo.

Não implemente código nesta execução. Produza somente spec, plano, tarefas,
contratos, testes, critérios de aceite e quickstart.

## Evidência obrigatória

No Delphi (`delphi/biblio/automacao/clnfe.pas`):

- `16548-16578` resolve `Codigo_cBenef` com os argumentos produto, CRT do
  emitente, UF do emitente, CST, CSOSN, CFOP e código da natureza;
- `5543-5550` e `4337-4344` emitem `<prod><cBenef>` somente se o retorno
  não for vazio;
- a resolução é feita por item, não no cabeçalho da NF.

O corpo da função de banco não está versionado no repositório. A spec deve
tratar sua existência e comportamento como contrato de infraestrutura a ser
verificado no PostgreSQL de homologação.

## Lacuna atual

O Laravel possui `LegacyCaracteristicasCbenefRepository` para cadastro, mas
o fluxo fiscal da Transferência não calcula `cBenef`, o adapter não o
propaga e `NfePhpFotografiaSerializer::tagItem` não o serializa. A spec deve
corrigir somente essa lacuna, sem reimplementar as partes já concluídas.

## Requisitos

### Resolução na fotografia

Definir um port/repositório de resolução fiscal que, para cada item, receba
exatamente:

- código do produto;
- CRT e UF do emitente;
- CST e CSOSN efetivamente usados pelo item;
- CFOP efetivo do item;
- código da natureza efetiva do item.

Em produção PostgreSQL, o comportamento deve permanecer compatível com
`Codigo_cBenef(...)`. Não substituir a função por uma busca simplificada de
`caracteristicas_cbenef` apenas por UF, nem escolher o primeiro benefício sem
considerar natureza/CST/CSOSN/CFOP.

Definir também o comportamento operacional:

- retorno vazio: item sem benefício aplicável; não emitir a tag;
- retorno não vazio: congelar o código na fotografia fiscal daquele item;
- função ausente, erro de banco, parâmetros fiscais ausentes ou retorno
  ambíguo: bloquear antes de numerar/transmitir, com código de pendência
  determinístico, sem omitir silenciosamente um benefício que não pôde ser
  resolvido;
- o caminho de testes deve usar uma porta fake explícita ou fixture do
  contrato, sem alterar o resultado da produção e sem inventar defaults.

### XML e persistência

- Propagar `cbenef` pela fotografia, adapter e serializer comum NFePHP.
- Serializar como `cBenef` dentro de `<prod>` e nunca dentro de `<ICMS>`,
  PIS, COFINS ou no cabeçalho.
- Emitir a tag somente quando o valor congelado não for vazio.
- Garantir que o XML gerado e o `xmlnfe` legado contenham o mesmo resultado.
- Não criar coluna ou tabela paralela sem evidência de que o schema legado da
  emissão exige isso; a fonte primária do XML é a fotografia/artefato fiscal.
- Incluir o valor na impressão digital da fotografia e na auditoria sanitizada,
  sem expor segredos.

### Concorrência e idempotência

- Resolver depois da releitura bloqueada das linhas e antes da selagem/
  numeração.
- O retry da mesma fotografia deve reproduzir o mesmo `cBenef` sem nova
  resolução divergente ou nova nota.
- Mudança posterior em cadastro não pode alterar uma fotografia já selada.
- Não alterar movimentos, estoque, `pedidosfiliais.dadofiscal`, romaneio,
  DANFE ou fluxo de autorização fora do campo adicional do item.

## Limites preservados

Não reimplementar numeração, gateway, certificado, transmissão, impostos já
especificados, IBS/CBS, DANFE, etiquetas, NFS-e, venda/devolução entre filiais
ou cancelamento/inutilização. Não alterar Delphi nesta execução.

## Testes e aceite

Exigir testes para:

1. função retorna código e o XML contém `prod/cBenef` no item correto;
2. função retorna vazio e a tag não é criada;
3. dois itens com entradas fiscais diferentes recebem resultados
   independentes;
4. alteração de UF, CRT, CST/CSOSN, CFOP ou natureza altera a entrada da
   resolução e não reutiliza valor de outro item;
5. função ausente/erro/parâmetro ausente bloqueia antes de número, outbox e
   transmissão;
6. retry/idempotência preserva o valor congelado;
7. `xmlnfe` legado e artefato fiscal apresentam o mesmo `cBenef`;
8. nenhum `cBenef` aparece fora de `<prod>` ou é aplicado por default;
9. testes cobrem transferência com produção própria e terceiros sem
   confundir natureza de operação com o benefício fiscal.

Entregar matriz achado -> requisito -> tarefa -> teste, contrato da porta,
shape da fotografia, códigos de erro, quickstart e critérios de aceite. Não
alterar código nesta execução do `/speckit.specify`.
