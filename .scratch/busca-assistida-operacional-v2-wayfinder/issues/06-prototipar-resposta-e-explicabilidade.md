Type: prototype
Status: resolved
Blocked by: 01, 04, 05

## Question

Como deve ser o contrato de resposta e a apresentacao minima para mostrar resultados, filtros interpretados, confianca, evidencia, disponibilidade, Preco Efetivo, ausencia de resultados e fallback sem sobrecarregar o painel reutilizavel?

## Answer

O prototipo visual confirmou a Variacao A como base: cards compactos em painel leve, com leitura rapida para vendedores. Cada card apresenta imagem/miniatura, Produto e codigo visual, descricao, evidencia proxima do resultado, Preco Efetivo, emestoque e acesso ao detalhe comercial rico existente.

Acima dos cards, a resposta mostra um bloco Como entendi com a intencao interpretada, filtros aplicados e confianca. A confianca e uma indicacao da interpretacao, nao substitui a evidencia nem permite relaxar filtros server-side.

O mesmo painel deve representar quatro estados: resultados; clarificacao unica quando a consulta e ambigua; nenhum resultado quando os hard filters nao encontram Produto Ativo; e fallback explicito para a busca tradicional quando a Busca Assistida estiver indisponivel ou se abstiver.

O detalhe HTML, galeria, descricao complementar e demais informacoes comerciais continuam no endpoint autorizado existente. A resposta da Busca Assistida permanece leve e nao sobrecarrega o painel.

O artefato descartavel esta em [BuscaAssistidaRespostaPrototype.tsx](../../laravel/backend/resources/js/Pages/Prototype/BuscaAssistidaRespostaPrototype.tsx), na rota local /prototype/busca-assistida-resposta, com as variacoes A, B e C e estados simulaveis. O build do frontend passou.
