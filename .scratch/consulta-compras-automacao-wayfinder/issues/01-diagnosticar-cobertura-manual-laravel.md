# Diagnosticar cobertura do manual de reposição no Laravel

Type: task
Status: resolved
Blocked by:

## Question

Quais etapas e regras dos três procedimentos do manual já estão cobertas pelo Laravel/Consulta de Compras, quais podem ser reutilizadas diretamente para uma automação e quais lacunas impedem automatizar a operação com segurança?

Inspecionar o manual, os contratos/documentos do módulo e os pontos de entrada do código. Produzir uma matriz de cobertura com classificação da evidência e indicar as decisões que devem virar os próximos tickets.

## Answer

### Diagnóstico

A matriz completa está em [análise do manual versus Laravel](../docs/analise-manual-vs-laravel.md).

O núcleo existente cobre a geração da sugestão, os filtros de última venda e entrada de NF, a tabela redutora, a cobertura, a pré-alocação de candidatas, a revalidação do estoque e a confirmação transacional da requisição. A infraestrutura operacional genérica também já oferece ocorrências, histórico, execução manual e prevenção de sobreposição.

O que não está coberto como automação de negócio é a camada que executa o manual recorrente: perfis quinzenal/diário, janelas “dia anterior”, depósito prioritário, preferência por lojas que não venderam, políticas M/D/U/F/O/C, gerente, concentração, sentinel 99999→0, múltiplos de embalagem, observações de urgência, aprovação e fila de exceções. Não há tarefa de Consulta de Compras registrada no OperationalTaskRegistry.

### Direção recomendada (INFERIDO, ainda não decidido)

A automação deve ser uma orquestração acima dos serviços atuais, sem automatizar a UI. O primeiro estágio deve gerar propostas distribuídas e justificadas em uma fila por filial/cenário; a confirmação automática só deve ser considerada após resolver as políticas e os gates humanos.

### Próximos tickets

Este diagnóstico tornou precisas as decisões dos tickets 02 a 05: limite de autonomia, perfis/agendamento, elegibilidade/dados mestres e alocação/quantidade/urgência. A execução segura, auditoria e idempotência dependem dessas decisões e ficam no ticket 06; a fila de exceções e métricas ficam no ticket 07.

### Evidência principal

- [procedimentos.pdf](../docs/procedimentos.pdf), páginas 1–7.
- [consulta-compras-sugestao.md](../../../laravel/docs/usuario/estoque/consulta-compras-sugestao.md).
- [consulta-compras-requisicao-pedido.md](../../../laravel/docs/usuario/estoque/consulta-compras-requisicao-pedido.md).
- Código Laravel: ConsultaComprasSugestaoService, ConsultaComprasRequisicaoService, RequisicaoCandidataOrdenacao, RequisicaoAlocacaoFilial e OperationalTaskRegistry.
