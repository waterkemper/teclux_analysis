# Consolidar o prompt SpecKit — Requisição entre Filiais + Integração com Pedido de Compra

Type: task
Status: resolved
Blocked by: 16, 11, 12, 14

## Question

Como consolidar as decisões de Requisição entre Filiais (11) e o contrato de integração de Gerar Pedido de Compra (12), mais os critérios de aceite/testes relevantes (14), num prompt autocontido para `/speckit.specify`, publicado em `modules/estoque/consulta-compras/03-speckit-prompt.md`, construído sobre a Fundação/Parâmetros (`01-speckit-prompt.md`, ticket 15) e o Motor de Sugestão de Compras (`02-speckit-prompt.md`, ticket 16), declarando explicitamente que o Cadastro de Pedidos de Compra em si fica fora de escopo?

## Answer

Consolidado em [`modules/estoque/consulta-compras/03-speckit-prompt.md`](../../../modules/estoque/consulta-compras/03-speckit-prompt.md), construído sobre as specs 01 e 02. Cobre as 4 fases da Requisição entre Filiais (com os 3 Parâmetros do Sistema descobertos) e o contrato de integração de Gerar Pedido de Compra (incluindo a correção do bug de cancelamento de modal e a divergência do filtro por `sugestao` mantida por decisão). Declara explicitamente o Cadastro de Pedidos de Compra fora de escopo, como esforço futuro próprio.

Com este ticket, o mapa está concluído — os três prompts SpecKit (Fundação/Parâmetros, Motor de Sugestão, Requisição+Integração) estão publicados e prontos para o Cursor.
