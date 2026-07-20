# Nomear o conceito de restrição de preço no domínio

Type: grilling
Status: resolved
Blocked by: 01

## Question

Qual o nome do novo conceito de domínio para "uma restrição de preço detectada e aplicada a partir da consulta em linguagem natural da Busca Assistida", sem colidir com "Faixa de Preço" (já reservado no glossário para a seleção de faixa de preço do Produto)? Deve ser registrado em `CONTEXT.md` com um `_Avoid_` explícito contrastando os dois termos.

## Answer

**Restrição de Preço** — operador e valor extraídos da consulta em linguagem natural, usados para filtrar candidatos pelo Preço Efetivo na Filial. Distinto de "Faixa de Preço" (seleção de preço do Produto dentro de sua Característica) e de "filtro" (o mecanismo de `ProductFilterRule`/`ProductFilterPanel`, que a Restrição de Preço não usa — decidido no ticket anterior). Registrado em `CONTEXT.md` com `_Avoid_`: faixa de preço, filtro de preço.
