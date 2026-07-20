# Restrição de preço na consulta da Busca Assistida

Label: wayfinder:map

## Destination

Produzir um dossiê autocontido, pronto para posteriormente virar prompt SpecKit, que especifique como a Busca Assistida de Produtos passa a reconhecer uma **restrição de preço em linguagem natural** dentro da própria consulta (ex.: "puxadores de ouro abaixo de 50,00") e aplicá-la aos resultados — nos dois hospedeiros já existentes (Consulta de Estoques e Orçamentos). Só preço; nenhuma outra restrição (estoque, marca, cor etc.) entra nesta entrega.

## Notes

- Complementa, sem reabrir, [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/dossie.md) (recuperação híbrida, embeddings, cache), [Experiência reutilizável da Busca Assistida de Produtos](../busca-assistida-produtos-experiencia-wayfinder/dossie.md) (voz, multisseleção, detalhe) e [Adaptar a Busca Assistida de Produtos para Orçamentos](../orcamentos-busca-assistida-wayfinder/dossie.md) (Filial Base, preço por Cargo — já implementado, existe `OrcamentoBuscaAssistidaSearchService`).
- Fatos-chave já levantados (ver ticket de auditoria): não existe hoje nenhuma extração de número/comparação da consulta em lugar nenhum do app; o preço só é conhecido **depois** do corte de 50 candidatos (`candidate_cap`) na recuperação, o que torna um filtro pós-corte potencialmente incompleto; existe vocabulário de operador `gt/gte/lt/lte` usado em outras telas, mas a Busca Assistida hoje é isolada desse mecanismo (filtro bespoke só para `item_produto.codigo`).
- Cuidado de nomenclatura: "Faixa de Preço" já é termo do domínio com outro significado (seleção de faixa de preço do Produto). O novo conceito precisa de nome próprio, sem colidir — usar `/domain-modeling` para isso.
- Usar `/grilling` para as decisões de estratégia de extração e de aplicação no pipeline; fatos de código são levantados diretamente, não perguntados ao usuário.
- Este mapa planeja e especifica; não implementa e não gera ainda o prompt SpecKit.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

- [Auditar o pipeline atual de preço e filtros da Busca Assistida](issues/01-auditar-pipeline-preco-busca.md) — nenhuma extração de restrição existe hoje; preço só é conhecido depois do corte de 50 candidatos; filtro atual é bespoke, isolado do registro `gt/gte/lt/lte` já existente; nenhum parser de frase em português existe no app; "Faixa de Preço" já está tomado no glossário.
- [Definir a estratégia de extração da restrição de preço da consulta](issues/02-estrategia-extracao-restricao-preco.md) — parser determinístico sem IA; vocabulário fixo de frases (abaixo de/até/acima de/a partir de/entre); conservador com frases não reconhecidas; trecho removido do texto de busca; chip na UI com opção de remover.
- [Definir como a restrição de preço se aplica sem perder resultados por causa do corte de candidatos](issues/03-aplicacao-restricao-sem-perder-resultados.md) — pré-check leve de preço antes do corte de `candidate_cap`, não depois; sem reaproveitar `ProductFilterFieldOperatorRegistry`, fica bespoke; vale para os dois hospedeiros.
- [Nomear o conceito de restrição de preço no domínio](issues/04-nomear-conceito-restricao-preco.md) — "Restrição de Preço", registrado em `CONTEXT.md` com `_Avoid_` contrastando com "Faixa de Preço" e "filtro de preço".
- [Consolidar o dossiê da restrição de preço na Busca Assistida](issues/05-consolidar-dossie-filtro-preco.md) — dossiê autocontido em [`dossie.md`](dossie.md), pronto como fonte primária para uma futura conversão em prompt SpecKit.

## Not yet specified

Nenhuma névoa adicional identificada além dos tickets já abertos — o destino é estreito o suficiente para já especificar tudo que se sabe hoje.

## Out of scope

- Restrições numéricas/atributo além de preço (estoque, marca, cor, dimensões etc.) — generalização futura, não decidida aqui.
- Reabrir recuperação híbrida, embeddings, cache, voz, multisseleção, detalhe ou a adaptação de Orçamentos já decididas nos mapas anteriores.
- Redesenhar a UI do painel além do necessário para comunicar a restrição de preço detectada.
