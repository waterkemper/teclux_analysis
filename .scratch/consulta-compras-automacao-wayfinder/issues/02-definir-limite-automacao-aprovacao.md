# Definir limite entre automação e aprovação humana

Type: grilling
Status: resolved
Blocked by: 01

## Question

Em quais condições o sistema apenas sugere, cria uma fila para revisão, confirma automaticamente uma Requisição entre Filiais ou bloqueia para aprovação de gerente/comprador? Definir a política de autonomia por cenário e por tipo de exceção.

## Comments

### Decisões e clarificações da sessão

- Primeira fase: o sistema calcula, filtra e distribui propostas automaticamente, mas a confirmação da Requisição entre Filiais continua dependendo de um Usuário autorizado.
- A exigência de Gerente é determinada em conjunto: o grupo de Produtos possui o booleano somente_gerentes_solicitacao_ecc, e o Usuário que confirma deve possuir usuarios.gerentevendas = true quando essa exigência estiver ativa.
- Propostas mistas serão separadas em duas filas: Produtos comuns podem ser confirmados pelo comprador autorizado; Produtos de grupos restritos exigem Usuário com gerentevendas.
- Produtos restritos continuam sendo calculados e visíveis para qualquer Usuário com acesso ao módulo; a restrição ocorre somente na conclusão da solicitação, quando o sistema exige Usuário e senha com perfil de Gerente de Vendas.
- O Gerente de Vendas que autoriza pode ser diferente do Usuário que preparou a proposta. A auditoria deve registrar ambos, além da data e hora; a senha não deve ser armazenada.
- Quando um lote tiver itens elegíveis e itens com exceção, os itens elegíveis devem ser confirmados; somente os itens afetados permanecem na fila de exceções.
- Uma exceção pode ocorrer porque o estoque da Filial Requisitada/Atendente foi consumido ou reservado enquanto a proposta aguardava aprovação. A Filial Requisitante é o destino e não deve ser confundida com a origem do estoque.

## Answer

### Decisão

A primeira fase terá autonomia para preparar, mas não para efetivar, as Requisições entre Filiais. Os três cenários do manual podem gerar propostas automaticamente, porém a confirmação sempre passa por Usuário autorizado.

- Propostas e Produtos restritos são visíveis a qualquer Usuário com acesso ao módulo.
- Produtos comuns podem ser confirmados pela sessão atual de um Usuário com a Permissão normal do módulo, sem senha adicional.
- Quando o grupo do Produto tiver somente_gerentes_solicitacao_ecc, a conclusão exige autenticação contextual com Usuário e senha de um Usuário cujo usuarios.gerentevendas seja verdadeiro.
- O Gerente autorizador pode ser diferente do Usuário que preparou a proposta. A auditoria registra preparador, autorizador, data e hora; a senha não é persistida.
- Propostas mistas são separadas em escopos comuns e restritos.
- A confirmação é parcial: itens elegíveis são confirmados, enquanto itens afetados por exceções permanecem pendentes.
- Antes da confirmação, o estoque da Filial Requisitada/Atendente é revalidado. Se a origem perdeu saldo, o sistema pode tentar redistribuir para outra origem elegível; somente o saldo que não puder ser atendido vira exceção.

Esta decisão define o limite de autonomia. A modelagem do job, da tela de revisão, dos lotes persistidos, da revalidação, da redistribuição e da fila de exceções será detalhada nos tickets seguintes.

Classificação: DECISÃO NOVA, baseada nas confirmações do cliente durante a sessão.
