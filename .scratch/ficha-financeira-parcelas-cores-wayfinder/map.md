# Paridade visual da aba Parcelas da Ficha Financeira Delphi–Laravel

Label: wayfinder:map

## Destination

Produzir um prompt simples e autocontido para ajustar no Laravel a apresentação visual da aba **Parcelas** da Ficha Financeira, reproduzindo as regras de cor observáveis em `dmfichafinanceira.pas/.dfm` e `fmfichafinanceira.pas/.dfm`, sem alterar a semântica financeira nem implementar o ajuste durante este Wayfinder.

## Notes

- Contextos: ERP transversal e Plataforma Laravel; usar o vocabulário de `CONTEXT.md` e `laravel/CONTEXT.md`.
- Fontes Delphi em escopo: `delphi/repositorio/dmfichafinanceira.pas`, `dmfichafinanceira.dfm`, `fmfichafinanceira.pas` e `fmfichafinanceira.dfm`.
- Alvo Laravel já existente: Ficha Financeira de Contratos, especialmente `FichaFinanceiraContratoParcelasPanel`, o grid JSON e os tipos/payloads relacionados.
- Paridade visual deve preservar a precedência das condições do Delphi e converter as cores legadas para uma representação clara no prompt; não copiar vulnerabilidades ou transformar cor em autorização/regra financeira.
- O resultado esperado é documentação/prompt simples para execução posterior, não alteração de código Laravel ou Delphi.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO` ou `DIVERGENTE`, usando caminhos e linhas quando possível.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

## Not yet specified

- Se todos os estados necessários para pintar cada parcela já estão disponíveis no payload Laravel ou se algum estado precisa ser exposto pelo backend.
- Se a equivalência visual deve ser aplicada somente à grade principal de Parcelas ou também às grades de Recebimentos e Parcelas da transação.

## Out of scope

- Implementar ou testar o ajuste no Laravel neste mapa.
- Alterar os arquivos Delphi.
- Redesenhar a Ficha Financeira, mudar colunas, modificar cálculos, pagamentos, Situações ou regras de autorização.
- Criar uma nova legenda visual ou um novo domínio de cores sem necessidade para a paridade solicitada.
