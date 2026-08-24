# Prompt SpecKit - Fechamento residual de filial efetiva na Consulta

Revise a implementacao atual apos os prompts 13, 14 e o commit de hardening 393. Produza especificacao e plano de implementacao somente para os dois residuos abaixo. Nao reabra Interpreter, tool, assembler, Orçamentos ou a arquitetura do Executor.

## Evidencia a confirmar

Em `BuscaAssistidaPlanValidator`, quando o plano textual traz `filial_solicitada` autorizada, `filiaisEfetivas` vira apenas essa filial. Entretanto:

- `filialPreco` ainda pode permanecer o `context->filialPreco` original;
- `priceFilter`/`priceMap` do contexto Consulta podem estar fechados sobre a primeira filial da requisicao;
- `BuscaAssistidaProductSearchEngine` ainda recebe `context->filiaisEstoque` em pontos de pre-filtro, em vez de garantir o escopo efetivo do plano.

Confirme o fluxo real antes de propor alteracao. A regra de dominio e:

- Consulta: filial textual autorizada deve recortar estoque e preço para a filial efetiva solicitada; sem filial textual, mantém o conjunto autorizado da requisicao e a filial de preço definida pelo adapter.
- Orçamentos: `filial_solicitada` diferente da Filial Base clarifica; a Base continua preço/inclusao e o estoque apresentado continua soma de todas as filiais.

## Requisito 1 - HostContext efetivo sem ampliar escopo

Defina um seam único para o Executor obter o contexto efetivo depois da validação, sem permitir que o modelo autorize filial:

- pre-filtro de `emestoque`, preço e ordenação devem usar as mesmas `filiaisEfetivas` e `filialPreco` do plano validado;
- revalidação e projeção devem usar exatamente o mesmo escopo;
- o preço da Consulta não pode ser calculado na filial 1 quando o plano autorizado pede filial 2;
- o caso sem filial solicitada não pode mudar o comportamento existente;
- Orçamentos não pode perder a regra Base + estoque total.

Não duplicar closures por camada. Se necessário, estender `BuscaAssistidaHostContext` ou criar um resolver de escopo validado, preservando o Executor compartilhado.

## Requisito 2 - Atributo estruturado fail-closed

Um atributo presente no payload, mas com nome vazio, valores vazios, estrutura inválida ou tipo incorreto, não pode desaparecer em `InterpretationPlan::fromArray()` e deixar a busca seguir apenas com o texto residual.

- atributo incompleto deve gerar `plano_invalido`, `atributo_ausente` ou clarificação segura;
- não remover silenciosamente filtro solicitado;
- não inventar atributo, não consultar SQL livre e não ampliar candidatos;
- atributos válidos continuam sujeitos ao catálogo/evidência e ao filtro existente.

## Testes obrigatórios

1. Consulta autorizada com `filial_solicitada=2`: preço, pré-filtro de estoque, ordenação e revalidação usam 2, não a primeira filial original.
2. Consulta sem `filial_solicitada`: mantém paridade com o comportamento atual multi-filial.
3. Orçamento com filial diferente da Base: clarifica, não altera sessão, não troca preço e não muda o total de estoque.
4. Produto barato/estoque somente na filial solicitada aparece; produto elegível somente em outra filial não aparece.
5. Atributo `{}`, nome vazio, valores vazios, valores não-array e atributo parcialmente malformado produzem resposta segura sem busca irrestrita.
6. Atributo válido continua filtrando pelo catálogo e não sofre regressão.
7. Regressão de `baixo de 200`, Produto Ativo, envelope rico, fotos, paginação, tool e inclusão na Base.

Execute no container PHP 8.5. Não declarar a suíte verde usando a CLI PHP 8.2.

## Saída esperada

Entregar requisitos, seam real, DTO/contrato de escopo efetivo, matriz de testes, riscos e rollout. Não implementar nesta etapa. Não criar outro prompt se estes dois resíduos forem suficientes.
