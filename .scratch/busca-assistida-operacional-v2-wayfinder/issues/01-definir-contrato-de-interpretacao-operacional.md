Type: grilling
Status: resolved
Blocked by:

## Question

Qual contrato canonico representa uma consulta operacional do vendedor, incluindo intencao de busca, Produto ou necessidade, filtros, ordenacao, quantidade, confianca, evidencias e necessidade de clarificacao, sem permitir que a IA invente condicoes ou execute mutacoes?

## Answer

O contrato canonico da v2 representa uma unica intencao publica: buscar_produtos. Comparacao, substituicao e complementos nao fazem parte da primeira versao.

O payload e transitorio e separa:

- consulta_original: texto recebido, usado para explicacao e reprocessamento; nao precisa ser persistido.
- texto_busca: texto residual normalizado enviado a recuperacao lexical e semantica.
- filtros: somente condicoes reconhecidas e validadas, como Preco, Estoque Fisico Disponivel, Filial e Atributos Comerciais Evidenciados.
- ordenacao: enum fechado relevancia, menor_preco ou maior_emestoque; o padrao e relevancia.
- quantidade: numero opcional; quando explicito, compara diretamente com a coluna emestoque, sem conversao de embalagem ou unidade.
- status_interpretacao: executar ou pedir_clarificacao, com no maximo uma pergunta curta por rodada.
- confianca: registrada por interpretacao/campo, nao apenas como nota global.
- evidencias: trecho da consulta, campo/trecho do cadastro e fonte/horario de Estoque e Preco.

A interpretacao e hibrida: identificadores, numeros, Preco, estoque e Filial usam parsing deterministico; a IA pode classificar necessidade e atributos livres via saida estruturada. O servidor valida allowlist, tipos, operadores, autorizacao, limites e Produto Ativo antes de consultar. Campo desconhecido, atributo sem evidencia ou filtro invalido e descartado; nenhum modelo produz SQL ou mutacao.

Um atributo ambiguo nao elimina resultados: pode apenas ordenar. Conflito ou intencao insegura produz pedir_clarificacao; ausencia de conflito executa a busca e comunica a interpretacao. A evidencia exibida e confirmada pelo servidor, nunca fabricada pelo modelo.
