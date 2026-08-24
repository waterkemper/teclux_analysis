# Análise do manual de reposição versus Laravel

Classificação: CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO e DECISÃO NOVA.

## Matriz de cobertura

| Operação do manual | Cobertura atual | Classificação |
| --- | --- | --- |
| Abrir Consulta, selecionar filial/grupo e Gerar | A tela aceita os recortes e a geração usa job pesado. | CONFIRMADO |
| Analisar todas as filiais no Geralzão | O contrato suporta `todas_filiais`; nenhuma filial marcada equivale ao grupo inteiro. | CONFIRMADO |
| Vendido do dia anterior | Existe o filtro `ultima_venda`; não existe a rotina agendada com semântica “dia anterior”. | CONFIRMADO para filtro; NÃO LOCALIZADO para automação |
| Produtos novos do depósito 07 | Existe o filtro `entrada_nf`; não existe depósito configurável/agendamento/critério de ausência de histórico como perfil. | CONFIRMADO para filtro; NÃO LOCALIZADO para automação |
| Cobertura de 15/60 dias e tabela redutora | O motor calcula cobertura, sugestão, mínimo/máximo e tabela redutora. | CONFIRMADO como capacidade; DÚVIDA sobre metas por perfil |
| Depósito primeiro e depois lojas que não venderam | A ordenação atual usa grupo, filial não requisitante, dias de estoque desc., estoque desc., datas e código; não há prioridade explícita de depósito ou de loja que não vendeu. | DIVERGENTE / NÃO LOCALIZADO |
| Pré-alocar e limitar ao estoque candidato | A pré-alocação é limitada ao snapshot; a confirmação revalida o saldo. | CONFIRMADO; lacuna de embalagem |
| Regras M/D/U/F/O/C, concentrados e gerente | Não foram localizadas regras específicas desses códigos nem restrição de gerente no contrato da Consulta. | NÃO LOCALIZADO |
| Máxima 99999 vira 0 | Há mínimo/máximo decimal, mas não há regra documentada para traduzir o sentinel legado. | DÚVIDA / DECISÃO NOVA |
| Caixa/pacote fechado e múltiplos | `unidade` aparece em NF-e pendente, não como regra de quantidade da sugestão/requisição. | NÃO LOCALIZADO |
| Urgência/observações por item | Não há campo de observação no contrato de criação da requisição; observação aparece no fluxo de cancelamento/listagem. | NÃO LOCALIZADO |
| Confirmação humana | Preview, ajuste, snapshot, duplicidade e confirmação transacional já existem. | CONFIRMADO |
| Agendamento e sobreposição | Há infraestrutura operacional genérica, mas nenhuma tarefa de Consulta de Compras registrada. | CONFIRMADO como infraestrutura; NÃO LOCALIZADO para domínio |

## Conclusão

O Laravel já possui o núcleo de cálculo e confirmação necessário para evitar automação por simulação de cliques. Falta uma orquestração operacional que materialize perfis recorrentes, aplique políticas de elegibilidade, escolha fontes, produza justificativas e encaminhe exceções.

O manual combina regras determinísticas (recorte, janela, cobertura, exclusões, estoque e ordenação) com julgamento operacional (exceções, produtos restritos, embalagem, urgência e aprovação). A recomendação inicial, ainda INFERIDA, é começar por uma fila de propostas distribuídas e justificadas por filial/cenário, mantendo revisão humana para exceções e confirmação até que os demais tickets fechem as políticas.

## Base reutilizável e lacunas

- Reutilizável: `ConsultaComprasSugestaoService`, filtros `ultima_venda`/`entrada_nf`, tabela redutora, cálculo de cobertura, `ConsultaComprasRequisicaoService`, pré-alocação, revalidação e deduplicação.
- Lacunas de domínio: perfis/agendamento, M/D/U/F/O/C, gerente, concentração, embalagem/múltiplos, urgência e depósito prioritário.
- Lacunas operacionais: execução automática e itens, fila de exceções, aprovação, notificações, idempotência por janela/filial/cenário e métricas.

Fontes: [`procedimentos.pdf`](../docs/procedimentos.pdf), [`consulta-compras.md`](../../../laravel/docs/usuario/estoque/consulta-compras.md), [`consulta-compras-sugestao.md`](../../../laravel/docs/usuario/estoque/consulta-compras-sugestao.md), [`consulta-compras-requisicao-pedido.md`](../../../laravel/docs/usuario/estoque/consulta-compras-requisicao-pedido.md), `ConsultaComprasSugestaoService`, `ConsultaComprasRequisicaoService`, `RequisicaoCandidataOrdenacao` e `OperationalTaskRegistry`.
