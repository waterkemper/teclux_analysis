# Preparar ajuste do Cadastro de Orçamentos Delphi

Type: task
Status: open
Blocked by: issues/01-confirmar-comportamento-contratos-delphi.md

## Basic prompt

No Delphi, ajuste o Cadastro de Orçamentos para que a seleção de planos de pagamento respeite `planosgrupos` e `planosclasses` com base nos produtos atuais do orçamento. Reaproveite o motor compartilhado existente, mas recomponha os grupos/classes imediatamente antes de listar os planos e valide novamente o plano escolhido antes de gravar parcelas. Considere todos os produtos: se qualquer grupo de produto não estiver coberto pelo plano, ele não pode aparecer nem ser confirmado. Trate explicitamente produto sem grupo/classe, plano sem vínculos, plano à vista e orçamento sem produtos. Analise em conjunto `dmorcamentos.pas/.dfm`, `fmorcamentos.pas/.dfm`, `dmcalculofinanciamento.pas/.dfm` e os eventos de inclusão, edição, exclusão, importação e recálculo. Preserve as demais regras financeiras e acrescente testes/reprodução para grupo compatível, grupo incompatível e mistura de grupos.

## Acceptance questions

- Os grupos são derivados das linhas atuais, inclusive alterações ainda não gravadas?
- O plano incompatível desaparece da consulta e é rejeitado se enviado manualmente?
- A regra é aplicada também ao plano padrão/venda à vista?
- A saída diferencia plano irrestrito de produto sem grupo?

