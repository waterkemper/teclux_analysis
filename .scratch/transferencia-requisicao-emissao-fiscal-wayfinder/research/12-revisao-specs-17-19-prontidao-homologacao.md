# Revisão das specs 17–19 e prontidão para homologação

## Resultado

### Fechado pelas specs 17–19

- A preparação HTTP deixou de depender de defaults fiscais inventados e passou a registrar fontes para natureza, código fiscal e indicadores `ide`.
- O caminho de reconciliação não aceita mais `nfeProc` textual sem passar pelo builder e pela revalidação de identidade.
- Status, autorização, consulta por chave e consulta por recibo passam pelo aplicador de endpoint e registram evidência do endpoint efetivo.
- O XSD é selecionado pelo snapshot, sem `glob` como autoridade, e exige hash declarado.
- O gate exige grupo `Transferencia` elegível, alvo coerente com diagnóstico, snapshot vigente e ausência de bloqueios.
- O escopo continua restrito a transferência; venda e devolução entre filiais não devem entrar no smoke.

### Bloqueadores encontrados

1. A comunicação do diagnóstico recebe material vinculado à filial, mas o gateway de `statusServico` faz nova seleção com `filialCodigo: null`. Isso viola a identidade operacional do emitente e é especialmente perigoso quando filiais compartilham a raiz do CNPJ.
2. O hash persistido como `schemaPackageHash` cobre somente o XSD raiz; o fechamento precisa cobrir a árvore determinística de imports/includes do pacote.
3. A resposta do dry-run devolve o estado do agregado em memória, não necessariamente o estado que `ensureGrupoAlvo` persistiu após os bloqueios.

## Prompts publicados

- [20 — certificado por filial e identidade do smoke](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/20-speckit-prompt-specify-certificado-filial-e-identidade-smoke.md)
- [21 — hash do pacote XSD e estado honesto do dry-run](../../../modules/interlojas/transferencia-requisicao-emissao-fiscal/21-speckit-prompt-specify-hash-pacote-xsd-e-dry-run.md)

## Próximo passo

Implementar os prompts 20 e 21, executar a suíte no runtime PHP 8.5, configurar uma filial base de homologação com certificado explicitamente vinculado, rodar diagnóstico, dry-run e gate, e só então transmitir uma única NF-e de transferência controlada.

