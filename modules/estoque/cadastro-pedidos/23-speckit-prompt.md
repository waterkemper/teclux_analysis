# Prompt para /speckit.specify — Modo inline de custo e preço

```text
/speckit.specify

Crie uma especificação corretiva P2 para implementar na grade de Produtos o modo inline “Custo e Preço de Venda”, distinto do visualizador F11. Pressuponha specs 16–22 integradas e verdes. Gere a spec; não implemente.

LEITURAS

- prompts 01, 08, 13, 16, 17 e 22;
- auditoria Delphi de paridade e auditoria Laravel;
- grade/componentes atuais, MotorCusto, parâmetros LocalCalculoPreco e visualizador F11.

Não duplique a tela F11 e não crie fórmula no frontend.

CONTRATO

Uma ação explícita na grade (ícone textual acessível e atalho definido no prompt 24) alterna o modo inline. Ela só aparece/habilita quando `LocalCalculoPreco` permite cálculo no Pedido ou em ambos.

Ao ativar:
- obter/recalcular resultados pelo Motor de Custo autoritativo da spec 17 para a revisão atual;
- mostrar colunas: custo para venda, preço atual, variação atual×venda, preço de venda sugerido, variação venda×digitado, preço digitado, permitir atualizar, código fiscal, ICMS outras e ICMS isentas;
- identificar origem/instante/revisão dos valores;
- destacar variações não zero e preço digitado divergente com texto/ícone além da cor;
- preservar ordem, seleção e scroll da grade.

Ao desativar, ocultar somente as colunas; não apagar valores. Ao trocar Pedido, sair automaticamente do modo e limpar projeção anterior. Resposta assíncrona obsoleta não pode aparecer no novo Pedido.

EDIÇÃO

O modo é prioritariamente analítico. Qualquer campo editável já existente (preço digitado/permitir atualizar) usa a mesma flag e comandos das specs 13/22, com revisão/idempotência; não criar caminho paralelo.

F11 permanece visualizador read-only completo e separado. Rótulos/ajuda deixam clara a diferença.

TESTES

Backend/integração: permissão por LocalCalculoPreco, valores idênticos ao motor, revisão, stale response e erro sanitizado.

React: toggle, conjunto de colunas, destaques acessíveis, seleção/scroll, troca de Pedido, loading/erro, consistência da flag e F11 separado. Build/typecheck e testes sem skip.

SAÍDA

Spec com contratos de projeção, estados UI, integração com motor, acessibilidade, testes, desempenho e arquivos mínimos revalidados.

FORA DE ESCOPO

Nova fórmula; substituir F11; persistir valor ao apenas visualizar; recalcular no React; alterar Delphi; implementar agora.
```
