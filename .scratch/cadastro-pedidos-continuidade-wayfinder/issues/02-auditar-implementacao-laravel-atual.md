# Auditar a implementação Laravel atual do Cadastro de Pedidos

Type: research
Status: resolved

## Question

O que está implementado, parcial, divergente ou sem prova no Laravel atual em relação aos 15 prompts, cobrindo frontend, backend, migrations, autorização, integrações financeiras/fiscais, concorrência, observabilidade e testes?

## Answer

O Cadastro de Pedidos possui implementação ampla dos motores de custo/impostos, ciclo de cabeçalho/item, previsões, grade, lookup, menu/autorização, abas informativas, reordenação, e-mail e relatório. Permanecem lacunas materiais: Notas Pendentes de Entrada não foi localizada; Produtos Similares entrega apenas produto/código/descrição; o formulário fiscal é uma projeção reduzida; e não há prova de concorrência por revisão/locks nem suíte PostgreSQL dedicada.

Duas divergências são críticas. A gravação do cabeçalho chama os motores com `strict:false`, captura falhas e prossegue com valor mercadoria. A sincronização financeira apaga e recria Documentos a Pagar e Duplicatas sem bloquear parcelas pagas/autorizadas. Também há observabilidade apenas pontual e vários testes críticos passíveis de `markTestSkipped` por ausência de stubs.

Auditoria detalhada, classificação por prompt e referências exatas: [Auditoria da implementação Laravel atual](../../../modules/estoque/cadastro-pedidos/auditoria-implementacao-laravel-atual.md).
