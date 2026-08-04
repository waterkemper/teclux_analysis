# Resumir "como vai funcionar" o Caixa

Type: task
Status: resolved
Blocked by:

## Question

A partir da especificação já fechada em `.scratch/caixa-fechamentos-wayfinder/map.md` (Fundação de Caixa + Fechamento de Caixa, ainda não implementada), como descrever em linguagem operacional — sem termos internos (autenticacoes, ledger, tipos de lançamento, etc.) e sem prazos — o comportamento que o operador de caixa vai ver: abrir/fechar caixa, o que é totalizado, a aba de eventos, e o PDF de fechamento substituindo a impressão fiscal antiga?

## Answer

**Abrir o caixa.** No começo do dia, quando o operador tenta fazer a primeira operação que depende de caixa aberto, o sistema pergunta se ele quer abrir o caixa — e pede a senha do gerente de caixa (ou o login completo de um gerente, se quem está tentando abrir não tem esse perfil). A partir daí o caixa fica "aberto" pelo resto do dia daquele operador. Não existe uma tela separada de "abertura de caixa" — é uma pergunta que aparece na hora certa.

**O dia a dia.** Ao longo do dia, cada operação que passa pelo caixa fica registrada automaticamente: recebimento de parcelas e vendas na frente de caixa, recebimentos em cartão/Pix, cheques recebidos (à vista ou a prazo), devoluções de dinheiro ou de saldo de troca ao cliente, depósitos bancários, transferências de dinheiro entre caixas, pagamento de duplicatas a fornecedores, perdas, resgates de cheque e eventuais cancelamentos de lançamentos feitos por engano. O operador não precisa "fechar" nada disso manualmente — cada operação já vai alimentando o total do dia sozinha.

**Reclassificar quando necessário.** O gerente de caixa tem acesso a uma aba onde consegue revisar os lançamentos do dia e corrigir a que evento cada um pertence (por exemplo, reclassificar um recebimento para o evento certo), sempre com uma anotação de motivo. Ele pode corrigir várias linhas de uma vez e confirmar tudo junto com uma única senha — não precisa digitar a senha de novo para cada linha corrigida.

**Fechar o caixa (fim do dia).** Quando o operador fecha o caixa, o sistema primeiro confere se está tudo certo (por exemplo, se não há uma transferência de dinheiro para outro caixa ainda não confirmada do outro lado — isso bloqueia o fechamento até resolver). Cada operador só pode fechar o próprio caixa, nem gerente nem administrador fecham o caixa de outra pessoa. Ao fechar, o sistema:
- soma automaticamente tudo que entrou e saiu do dia (recebimentos, cartão, Pix, cheques, devoluções, transferências, depósitos, perdas etc.) e calcula o saldo final do caixa;
- gera um PDF de fechamento com esse resumo completo — substitui a antiga impressão em impressora fiscal/matricial;
- se o gerente havia corrigido alguma classificação de evento na aba de revisão, essa correção é salva no mesmo momento (só pede confirmação por senha se realmente houve algo alterado — antes era pedida sempre, mesmo sem alteração).

**O PDF de fechamento.** É o novo "espelho" do dia: mostra cabeçalho com filial, caixa e operador, o saldo do dia anterior, tudo que entrou (recebimentos, transferências, resgates de cheque etc.) e tudo que saiu (devoluções, cheques, cartões, Pix, duplicatas pagas etc.), o saldo final do caixa, e detalhamentos por tipo de movimento — cada seção só aparece se realmente tiver algo daquele tipo naquele dia, para não poluir o documento com linhas zeradas. Pode ser baixado/impresso pelo próprio navegador.

**O que muda na prática para quem opera o caixa:** nada de impressora fiscal ou matricial dedicada — é tudo tela e PDF; a soma do dia é automática, sem conferência manual; e existe um controle a mais de quem pode corrigir classificações (só o gerente, com senha, em lote).

Fontes: `.scratch/caixa-fechamentos-wayfinder/map.md` (mapa concluído, 13 decisões), `modules/caixa/fechamentos/01-speckit-prompt.md` (Fundação) e `02-speckit-prompt.md` (Fechamento).
