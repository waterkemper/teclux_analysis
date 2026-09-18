# Prompt 31 - Aceite do modelo configuravel de Rotinas ECC

## Objetivo

Validar que o produto permite cadastrar novas rotinas com nome, agenda e regras proprias, sem regressao da automacao existente.

## Cenarios funcionais

1. Criar `Reposicao lojas centro` para uma filial, intervalo 20, filtros A/B, regra de ultima venda D-1 e politica de concentracao.
2. Criar `Novos produtos CD` para a mesma filial, intervalo 1, regra de entrada NF D-1 no deposito escolhido e filtros diferentes.
3. Renomear a primeira rotina e confirmar que UUID, snapshots e lotes antigos nao mudam.
4. Alterar somente a agenda e confirmar que somente janelas futuras usam a nova configuracao.
5. Duplicar uma rotina, editar o clone e confirmar independencia.
6. Deixar regras temporais vazias e confirmar que o sistema nao injeta vendas ou NF pelo nome.
7. Usar as politicas de gerente, concentradora e prefixos ja definidas e confirmar que a revisao/conclusao preserva o fluxo de `pedidosfiliais`.

## Cenarios tecnicos

- PostgreSQL 9.5/9.6: migrations, indices e constraints suportados.
- Idempotencia por `rotina_id`, janela e ciclo em concorrencia.
- Snapshot autocontido: configuracao viva pode mudar sem alterar resultado em processamento.
- Hash muda quando muda regra efetiva e nao muda ao apenas carregar a tela.
- Payloads desconhecidos, campos proibidos e referencias invalidas sao rejeitados antes da ativacao.
- Permissao de acesso ao modulo e autorizacao de gerente de vendas continuam distintas.

## Regressao legada

Executar os cenarios equivalentes aos tres registros antigos como configuracoes migradas:

- Geralzao: agenda 15, sem regra temporal extra;
- Vendido do dia anterior: agenda 1, ultima venda D-1;
- Produtos novos recebidos: agenda 1, entrada NF D-1 no deposito.

Esses cenarios sao apenas regressao. Nao devem justificar novos branches por `tipo` no codigo.

## Criterios de aceite

- O operador consegue cadastrar uma quarta, quinta ou vigesima rotina na filial sem deploy.
- O nome pode ser escolhido e alterado pelo cliente.
- Agenda, filtros, recortes temporais e politicas podem diferir entre rotinas.
- Nenhuma rotina nova recebe default de cliente.
- Uma execucao usa somente seu snapshot.
- A revisao continua humana e a confirmacao continua gerando `pedidosfiliais`.

