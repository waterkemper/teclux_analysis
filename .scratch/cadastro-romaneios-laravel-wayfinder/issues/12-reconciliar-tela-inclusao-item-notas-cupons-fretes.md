# Reconciliar tela de inclusão de Item de Romaneio com o fluxo Delphi

Type: task
Status: resolved
Blocked by: 08, 11

## Question

Como especificar a correção da tela Laravel de inclusão unitária de Item de Romaneio para recuperar a paridade operacional do Delphi, sem manter abas visuais Nota/Cupom, mantendo o suporte a Cupom Fiscal, iniciando Auto Incluir marcado para bipagem contínua, corrigindo os lookups de Filial/Série/Número e detalhando Tabela de Fretes, Valor de Tabela, Valor do Frete e os efeitos no documento a pagar?

## Contexto do feedback

Após a implementação, a tela Laravel de inclusão de notas não ficou equivalente ao Delphi. A inclusão mista Nota/Cupom deve continuar suportada, mas a composição visual deve ser uma superfície única, sem copiar as abas legadas. O mapa já concluído precisa receber uma especificação corretiva focada nessa tela e um prompt pronto para ajuste no checkout Laravel.

## Answer

A decisão corretiva é publicar um sétimo prompt de especificação para a inclusão unitária. A tela Laravel deve ser uma única superfície, sem abas visuais Nota/Cupom, mas com um modo explícito e acessível que preserve ambos os tipos fiscais. O modo Cupom não foi removido; apenas deixou de ser representado por uma aba.

Constatações principais:

- POSSÍVEL BUG ATUAL — ItemRomaneioModal.tsx:11-42, 300-375 fixa modo em Nota, inicia auto_incluir como false e não renderiza ECF, Intervenção, Nº Cupom, emissão, entrega, anulado, Tabela de Fretes, Valor de Tabela ou observação.
- POSSÍVEL BUG ATUAL — ItemRomaneioModal.tsx:321-342 oferece somente o lookup de Nº NF; CadastroRomaneiosPageService.php:267-276 e CadastroRomaneiosItemLookupController.php:22-80 expõem Série/Nº NF, mas não o lookup unitário de Cupom nem o lookup de Tabela de Fretes no modal.
- CONFIRMADO — fmcadastroitensromaneio.dfm:53-1156 e fmcadastroitensromaneio.pas:170-197,513-560 comprovam os dois modos fiscais, a cadeia de identificadores e o Auto Incluir voltado para scanner.
- CONFIRMADO — fmcadastroitensromaneio.dfm:788-1104 comprova a região de frete: Código/Descrição da Tabela, Valor de Tabela, Valor de Frete e Observação.
- CONFIRMADO — o schema autoritativo separa tabeladefretes.valorfornecedor de romaneiosnotas.valor; RomaneioFinancialOriginAdapter.php:59-89 calcula o total financeiro pela soma server-side de romaneiosnotas.valor não cancelado.
- CONFIRMADO — tabeladefretes.valorfornecedor é uma projeção do catálogo, não uma coluna de romaneiosnotas; a especificação manda não inventar persistência para essa grandeza.

O prompt [07-speckit-prompt-correcao-tela-inclusao-item.md](../../../modules/entregas/cadastro-romaneios/07-speckit-prompt-correcao-tela-inclusao-item.md) detalha composição, cadeia Filial→Série→Nº NF, lookup de Cupom, Auto Incluir marcado, foco pós-scan, Tabela de Fretes, separação entre Valor de Tabela e Valor do Frete, integração transacional e aceite.

O índice do pacote e o contrato de interface foram atualizados para substituir a decisão visual anterior de abas por essa decisão corretiva. Nenhum código Laravel/Delphi, migration ou banco foi alterado.
