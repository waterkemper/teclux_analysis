Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 09, 10

## Question

Quais tools devem existir na primeira versao operacional e quais contratos server-side cada uma deve expor para resolver Produto, buscar candidatos, consultar estoque por Filial, calcular Preco Efetivo, comparar resultados e explicar evidencia, sem SQL livre, mutacao ou bypass de autorizacao?

## Answer

A primeira versao tera uma unica tool publica visivel ao agente: buscar_produtos. Ela recebe um contrato fechado e tipado, e devolve Produtos Ativos ja filtrados, ranqueados, enriquecidos e acompanhados de evidencia. Resolver identificadores, buscar candidatos lexical/semanticamente, consultar estoque, resolver Preco e ranquear sao etapas internas server-side, nao tools que o modelo combina livremente.

A entrada aceita somente campos allowlistados: texto_busca residual, identificadores detectados, filtros de Preco, filtro de emestoque e quantidade minima, contexto de Filial, Atributos Comerciais Evidenciados, ordenacao fechada e pagina/limite sujeito a limites server-side. Consulta original pode ser preservada para auditoria e explicacao, mas nao controla SQL ou operadores livres.

A saida e um envelope estruturado com status, filtros aplicados, itens, avisos e indicacao de fallback para a busca tradicional. Cada item pode carregar Produto, codigo visual, descricao, evidencia, aderencia, disponibilidade total, Preco efetivo autorizado e dados de apresentacao leves como thumb_url e foto_media_url. O resultado preserva o que a tela atual usa: imagem, preco, estoque, evidencia e selecao.

O detalhe comercial rico continua separado e autorizado pelo endpoint existente: galeria de fotos, descricao complementar HTML sanitizado, caracteristicas HTML sanitizado, preco detalhado e demais informacoes comerciais. A tool nao gera, altera ou transporta HTML rico como texto do modelo.

Comparacao e explicacao sao formas de apresentar o envelope retornado, nao novas operacoes da IA. A inclusao no Orcamento permanece no fluxo existente: a busca fornece os identificadores de selecao, e a funcao de inclusao revalida Produto Ativo, Preco, estoque e Filial Base no momento da operacao. A tool nunca inclui, reserva, altera estoque ou modifica Orcamento.

Todo acesso continua sujeito a autorizacao no servidor, validacao de contexto, limites de tempo/linhas/tokens e observabilidade. Nenhuma tool recebe SQL, tabela, coluna, credencial ou permissao para bypass.
