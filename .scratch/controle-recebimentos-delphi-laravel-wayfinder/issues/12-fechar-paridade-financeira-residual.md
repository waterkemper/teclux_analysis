# Fechar paridade financeira residual

Status: open

## Objetivo

Aplicar o Prompt 09 somente às divergências que continuam após a aplicação
parcial do Prompt 08, cobrindo os campos exatos de Contas a Pagar e a transição
de identidade em `movtosbancos`.

## Evidências

- `documentospag` ainda recebe `complemento = null`, referência baseada na
  observação de contrato e `administrador = false` constante.
- A projeção não expõe o `tiporec` textual usado pelo Delphi em documento e
  duplicata.
- Mudança de data remove o efeito antigo, mas não cria/reutiliza o movimento e
  evento novos nem grava a nova identidade no recebimento.
- A existência do efeito novo é verificada depois de mutações anteriores; a
  validação deve ocorrer antes da primeira escrita.

## Saída

Usar `modules/caixa/controle-recebimentos/09-speckit-prompt-fechamento-paridade-financeira.md`.
Após a implementação, executar os testes PostgreSQL de campos, mudança de
data, identidade composta, rollback e orçamento de consultas. Só encerrar
quando a reauditoria não encontrar divergência FIN-09–FIN-14.
