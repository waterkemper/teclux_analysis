# Prompt para /speckit.specify — Produtos Similares completo

```text
/speckit.specify

Crie uma especificação corretiva P1 para completar o painel read-only de Produtos Similares conforme o prompt 14, preservando o produto ativo e os padrões do Cadastro de Pedidos. Pressuponha P0 verde. Gere a spec; não implemente.

LEIA

- prompts 07, 14 e 16;
- três auditorias desta pasta;
- PedidoCompraSimilaresReadService, repositories/componentes/testes atuais;
- read models de Consulta de Compras/estoque/grade já existentes e evidência Delphi citada.

PROBLEMA

O payload atual contém apenas produto, código visual e descrição. O contrato fechado exige também Linha, Coluna, Filial, Estoque, Reserva, quantidade Pedida, Valor e relação Produto/Similar.

CONTRATO DE LINHA

Cada linha identifica inequivocamente Produto e Filial e retorna:
- código e descrição;
- Linha e Coluna como rótulos de variante, não novos conceitos/códigos;
- Filial;
- estoque disponível/posição conforme read model compartilhado;
- reserva;
- quantidade já pedida no contexto definido pelo prompt 14;
- valor aplicável com moeda/fonte explícita;
- tipo/relação (Produto ou Similar) e identidade do produto origem.

Não invente zero para dado ausente; use null/indisponível com motivo. Não combine Filiais silenciosamente. Reutilize queries/projeções existentes e aplique escopo de Filiais autorizado.

COMPORTAMENTO

- read-only;
- reconsulta ao mudar produto ativo, Pedido ou Filial relevante;
- cancela/ignora resposta obsoleta;
- ordenação determinística com produto principal distinguido;
- vazio é estado válido;
- não altera item, estoque, reserva ou preço.

UX/ACESSIBILIDADE

Exiba todas as colunas/rótulos, com layout adaptável e sem depender apenas de cor. Preserve foco do item ativo, loading/vazio/erro e nomes semânticos.

TESTES

PostgreSQL real: produto com grade, similares, múltiplas Filiais, estoque/reserva/pedida/valor, ausência/null, autorização e parâmetros. React: dez campos, produto principal, troca rápida/cancelamento de resposta, vazio, erro, teclado. Sem skips críticos.

SAÍDA

Spec com contrato DTO/query, semântica das medidas, autorização, UX, testes, desempenho e arquivos mínimos revalidados.

FORA DE ESCOPO

Editar item; reservar estoque; criar similar; nova fórmula de preço; agregar Filiais; alterar Delphi; implementar agora.
```
