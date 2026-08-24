# Evolucao Operacional da Busca Assistida de Produtos

Label: wayfinder:map

## Destination

Produzir um dossie autocontido, pronto para virar prompt SpecKit, para uma Busca Assistida operacional v2, somente leitura, reutilizavel em Consulta de Estoques e Orcamentos. Ela deve interpretar consultas de vendedores e retornar Produtos Ativos relevantes, aplicando filtros explicitos de Preco, Estoque Fisico Disponivel, Filial e Atributos Comerciais Evidenciados, com ferramentas Laravel AI SDK seguras, respostas explicaveis e fallback para a busca tradicional.

## Notes

- Este mapa complementa, sem reabrir, os mapas de Busca Assistida de Produtos, Experiencia reutilizavel, adaptacao para Orcamentos e Restricao de Preco.
- Escopo confirmado: busca operacional; nenhuma alteracao de estoque e nenhuma inclusao automatica em Orcamento.
- Regras confirmadas: Produto inativo nunca aparece; com estoque significa Estoque Fisico Disponivel; atributos so filtram com evidencia do cadastro; ranking prioriza identificadores e filtros explicitos antes de sinais secundarios.
- Consultar laravel/CONTEXT.md, docs/adr/ e mapas anteriores. Usar domain-modeling, grilling, research e prototype conforme o ticket.
- Ferramentas devem ser somente leitura, com contratos estritos, autorizacao no servidor, limites de custo/tempo/linhas e evidencia de origem.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Decidir versao alvo e compatibilidade do SDK](issues/09-decidir-versao-alvo-e-compatibilidade-do-sdk.md) - a especificacao exige atualizar o Laravel AI SDK antes das novas tools; a migracao ocorre primeiro, com matriz de compatibilidade e regressao dos fluxos atuais, e somente depois vem a implementacao da v2.
- [Definir contrato de elegibilidade e dados dinamicos](issues/10-definir-contrato-de-elegibilidade-e-dados-dinamicos.md) - Produto Ativo e aplicado antes de candidatos e ranking; ausencia de estoque nao exclui sem filtro; no Orcamento mostra-se o total de todas as Filiais, sem composicao, com Preco e inclusao na Filial Base; atributos exigem evidencia.
- [Definir catalogo de tools somente leitura](issues/04-definir-catalogo-de-tools-somente-leitura.md) - a v2 expoe somente buscar_produtos com entrada allowlistada e saida estruturada; preserva cards com imagem, preco, estoque e evidencia, delega detalhe HTML ao endpoint existente e mantem inclusao de Orcamento fora da IA.
- [Definir filtros e ranking operacional](issues/05-definir-filtros-e-ranking-operacional.md) - filtros explicitos entram antes do ranking/corte; a v2 combina busca exata, lexical e semantica com RRF e reranker limitado, usa roteamento por custo e cache em camadas, e mantem Preco/Estoque frescos.
- [Prototipar resposta e explicabilidade](issues/06-prototipar-resposta-e-explicabilidade.md) - a Variacao A foi escolhida: cards compactos com imagem, Preco, estoque, evidencia e bloco Como entendi, mantendo detalhe rico e fallback fora do payload principal.
- [Definir avaliacao e criterios de rollout](issues/07-definir-avaliacao-e-criterios-de-rollout.md) - a v2 sera liberada de uma vez apos gates rigidos e de qualidade; exige zero violacoes, melhoria de NDCG/Recall, limite de custo/latencia, fallback e telemetria sem PII.
- [Consolidar dossie operacional](issues/08-consolidar-dossie-operacional.md) - o dossie autocontido para SpecKit foi criado com contratos, pipeline hibrido, resposta, custo, SDK, seguranca, avaliacao, gates e criterios de aceite; lacunas futuras ficaram separadas.

- [Definir contrato de interpretacao operacional](issues/01-definir-contrato-de-interpretacao-operacional.md) — a v2 usa apenas buscar_produtos, separa consulta original, texto residual e filtros; interpreta deterministicamente identificadores/preco/estoque/filial, usa IA estruturada para necessidade/atributos, valida tudo no servidor e permite executar ou pedir uma clarificacao.
- [Pesquisar tools e saida estruturada do Laravel AI SDK](issues/03-pesquisar-tools-e-saida-estruturada-do-laravel-ai-sdk.md) — a instalacao usa laravel/ai v0.3.2/Prism v0.99.22; tools PHP, schemas, validacao server-side, limites explicitos e observabilidade sao adequados, mas a versao alvo precisa ser decidida antes das tools.
- [Inventariar fontes e elegibilidade do Produto](issues/02-inventariar-fontes-elegibilidade-do-produto.md) — as fontes existem para identificadores, texto, emestoque, Filial e Preco, mas elegibilidade chega tarde, varias Filiais sao agregadas, atributos nao tem leitura estruturada comum e detalhe nao repete o predicate de Produto Ativo.

## Not yet specified

Nenhuma decisao pendente para o escopo da v2.

## Out of scope

- Alterar estoque, reservar Produto, gerar pedido ou executar qualquer outra mutacao por ferramenta de IA.
- Inclusao automatica de Produtos em Orcamentos; o adaptador de selecao existente permanece separado.
- Reabrir embeddings, topologia vetorial, voz, multisselecao, detalhe ou Restricao de Preco ja decididos nos mapas anteriores.
- Retornar Produtos inativos ou inventar atributos/equivalencias sem evidencia.
- Classificar Produto equivalente, substituto ou alternativa; isso exige um contrato proprio de evidencia em uma evolucao futura.
- Usar giro, popularidade, margem ou historico comercial no ranking; isso exige fonte confiavel, governanca e avaliacao de vies em uma evolucao futura.
