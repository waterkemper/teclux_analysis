# Definir o PDF do Fechamento

Type: grilling
Status: resolved
Blocked by: 06, 02

## Question

Como estruturar o PDF do Fechamento de Caixa (substituindo ECF/impressora matricial/FastReport, seguindo o precedente de `modules/vendas/orcamentos-impressao`) preservando o conteúdo do relatório atual — cabeçalho (filial, caixa, data, status aberto/fechado), seções Entradas/Saídas/Outros, detalhamento de recebimentos por tipo, e as seções condicionais controladas por Parâmetro do Sistema ou pelo checkbox "Imprimir Detalhes" (cancelamentos, cheques a prazo/vista, depósitos, devoluções, devoluções de saldo, documentos entrada/saída, duplicatas, perdas, recebimentos, resgate de cheque, resumo de vendas/renegociados, transferências/pendentes), assinaturas e número de cópias?

## Answer

### Stack confirmado (CONFIRMADO, `orcamentos-impressao`)

O checkout já usa Blade + Browsershot (`OrcamentoImpressaoPdfRenderer`) como stack de PDF — mesmo padrão a reaproveitar aqui, sem FastReport/`.fr3`/comandos ECF.

### Estrutura do documento (preserva o conteúdo do relatório atual)

- **Cabeçalho**: razão social, "Resumo Geral de Caixa", Filial (código + nome), Caixa (código + nome do operador), data/hora, status Aberto/Fechado (usando a regra de `caixaaberto` do ticket 03), "Referente à movimentação de [data]".
- **Saldo Anterior do Caixa**.
- **Seção Entradas**: Recebimentos (prestações − juros), Recebimentos de Juros, Descontos Concedidos, Documentos de Entrada, Entrada de Transferências, Resgate de Cheques, Ajuste de Saldo de Devolução/Troca — cada linha só aparece se o valor for diferente de zero (replicando o Delphi) — e o TOTAL.
- **Seção Saídas**: Devoluções de Numerário, Devoluções de Saldo de Troca, Documentos de Saída, Saída de Transferência, Depósitos Bancários, Cheque à Vista, Cheque a Prazo, Cheque não identificado, Duplicatas de Fornecedores, Cartões de Crédito/Débito, Pix — mesma regra de omitir zeros — e o TOTAL.
- **Seção Outros**: Saldo do Caixa no Dia (fórmula única confirmada no ticket 06), Número de Autenticações Canceladas (se houver), Perdas (se houver).
- **Detalhamento dos Recebimentos**: agrupado por tipo de recebimento (`tiposrecebimentos`), com sub-linhas por descrição de tipo dentro de cada grupo.
- **Seções condicionais** (cancelamentos, cheques a prazo/à vista, depósitos, devoluções, devoluções de saldo, documentos entrada/saída, duplicatas, perdas, recebimentos, resgate de cheque, resumo de vendas por filial + resumo de renegociados, transferências + pendentes): cada uma lista os lançamentos detalhados do tipo correspondente com total ao final.
- **Rodapé**: três linhas de assinatura (`Assinatura1/2/3`), data/hora de geração.

### Decisões

1. **Checkboxes de seção mantidos**: o usuário continua escolhendo quais das 12 seções condicionais (mais o "Imprimir Detalhes" que força todas) entram no PDF antes de gerar, com os Parâmetros do Sistema (ticket 02) como padrão inicial marcado — não é só sobre economia de papel, também sobre foco/tamanho do documento gerado.
2. **`NumeroCopias` fica fora desta migração**: o PDF gerado tem sempre uma via única; impressão física de múltiplas vias, se necessária, é responsabilidade do diálogo de impressão do navegador/leitor de PDF, não do documento em si.
3. Linhas com valor zero continuam omitidas (replicando o padrão Delphi de só imprimir o que é diferente de zero).
