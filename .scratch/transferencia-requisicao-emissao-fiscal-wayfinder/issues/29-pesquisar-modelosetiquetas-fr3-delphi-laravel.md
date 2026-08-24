# Pesquisar `modelosetiquetas` e `.fr3` para etiquetas de volumes

Label: wayfinder:research
Type: research
Status: resolved
Blocked by:

## Question

Como o Delphi resolve `modelosetiquetas`, armazena e executa layouts `.fr3` e escolhe o modelo para as etiquetas de volumes da NF-e de transferência? Qual solução deve ser especificada agora no Laravel para gerar o PDF das etiquetas de volumes, mantendo uma fronteira reutilizável para a futura migração de `apps/estoque/dmemissaoetiquetas`, sem implementar código neste esforço?

## Required output

- Evidências primárias no código Delphi, no esquema legado e no código Laravel atual.
- Identificação do formato de armazenamento, seleção, dados e renderer dos modelos de etiqueta.
- Separação entre fatos confirmados, inferências, dúvidas e decisões novas.
- Recomendação arquitetural e prompt `/speckit.specify` complementar, restrito inicialmente a volumes da transferência.
- A solução não deve autorizar impressora automática nem a migração completa do módulo de etiquetas.

## Answer

**CONFIRMADO:** `modelosetiquetas` fornece metadados e uma referência textual
`arquivo`; a consulta Delphi não demonstra armazenamento do binário `.fr3` no
banco. A rotina de volumes liga a consulta de `volumesdadosfiscais`, expande
uma linha por volume, calcula a chave derivada do volume e carrega
`frxEtiquetasNfSaidaVolumes.fr3` pelo diretório do executável. Variantes `.fr3`
existem, mas não foi localizado mecanismo comprovado que as selecione
dinamicamente nessa rotina.

**DIVERGENTE:** a tabela de volumes possui pesos, mas a query do relatório
observada não os seleciona. O contrato Laravel não deve exigi-los sem uma
projeção explícita.

**NÃO LOCALIZADO:** o Laravel não possui suporte a `modelosetiquetas`, execução
de `.fr3` ou `frxEtiquetasNfSaidaVolumes`. Ele possui geração HTML/CSS→PDF com
Browsershot, que é a base adequada para Linux.

**DECISÃO NOVA RECOMENDADA:** separar data provider normalizado, registro
versionado de templates seguros e renderer HTML/CSS→PDF. O `.fr3` será apenas
insumo de inventário/conversão futura, nunca código executado no backend. A
etapa atual implementa conceitualmente somente `NF_SAIDA_TRANSFERENCIA_VOLUME`,
PDF em nova aba e sem impressora; o contrato fica reutilizável pelo futuro
`dmemissaoetiquetas`.

### Artefatos

- [Pesquisa completa](../research/29-modelosetiquetas-fr3-delphi-laravel.md)
- [Prompt `/speckit.specify` de templates e renderer](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/43-speckit-prompt-specify-template-etiqueta-volume-modelosetiquetas.md)
