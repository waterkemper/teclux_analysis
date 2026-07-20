Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 10

## Question

Como combinar busca textual e semântica, filtros dinâmicos, relevância, diversidade, disponibilidade, limiar de abstenção e explicações por evidência, e com qual conjunto de consultas e métricas validar que o ranking é útil e não inventa relações?

## Answer

### Pipeline de recuperação

1. Normalizar a consulta sem persistir seu texto.
2. Detectar identificador exato: código interno, código visual, referência ou código de barras.
3. Recuperar até 100 candidatos lexicais em `produtos.busca`.
4. Recuperar até 100 partes por HNSW/pgvector e consolidar pela melhor parte de cada Produto.
5. Unir os rankings por Reciprocal Rank Fusion, inicialmente com pesos iguais.
6. Validar no legado Produto ativo/em linha e bloqueio administrativo.
7. Aplicar Filiais autorizadas, disponibilidade, preço e demais filtros dinâmicos.
8. Aplicar diversidade, limiar e evidências; retornar os melhores Produtos.

Identificador exato tem precedência determinística e não depende do score semântico. Scores de `ts_rank` e cosseno não são somados diretamente porque possuem escalas incompatíveis. Tamanho dos conjuntos, constante e pesos da fusão são configuração versionada; só mudam após avaliação.

### Filtros e disponibilidade

Na Consulta de Estoques, **Somente com disponibilidade** inicia ligado. O vendedor pode desligar para localizar Produto sem saldo ou para encomenda.

- “Em estoque”, “disponível agora” ou equivalente torna disponibilidade filtro obrigatório.
- Filial e faixa de preço mencionadas na interface ou frase tornam-se filtros obrigatórios.
- Preço, saldo e Filial nunca alteram o embedding ou o score semântico.
- Disponibilidade pode desempatar resultados semanticamente equivalentes.
- A fórmula de disponibilidade pertence à Consulta de Estoques e deve reutilizar sua regra canônica.
- Todos os escopos e Permissões são aplicados no servidor depois da recuperação candidata e antes da resposta.

### Diversidade de variantes

Produto permanece a unidade selecionável. Inicialmente são exibidos no máximo dois Produtos de uma mesma Característica de Produto, escolhendo variantes relevantes e disponíveis, com ação **Ver outras variantes**.

Consulta que menciona grade, tamanho, cor, Modelo ou referência específica prioriza a variante correspondente e pode expandir o limite. Identificador exato nunca é ocultado por diversidade. Produtos de Características diferentes não são agrupados somente por semelhança textual.

### Confiança, evidência e abstenção

Não existe limiar universal. Cada geração do índice é calibrada no catálogo do cliente:

- identificador exato ignora limiar semântico;
- resultado sem Evidência Comercial utilizável é descartado;
- abaixo do limiar: abstenção;
- faixa próxima ao limiar: **Resultado aproximado**, com linguagem neutra;
- acima do limiar e com fonte específica: resultado normal;
- empate/margem pequena apresenta alternativas, não vencedor artificial;
- score aparece somente na avaliação administrativa;
- nova geração recalibra seu próprio limiar antes da ativação.

Cada resultado mostra até duas Evidências Comerciais literais, escapadas e com origem. Associação indireta é permitida, mas não cria afirmação ausente da fonte. Conteúdo genérico, contraditório ou insuficiente reduz confiança ou leva à abstenção.

### Conjunto de avaliação

Cada cliente prepara inicialmente 150 a 300 consultas reais ou representativas:

- identificadores e descrição exata;
- necessidades em linguagem natural;
- atributos, Marca, Modelo, grade e variantes;
- Filial, disponibilidade e preço;
- digitação incorreta e fala transcrita;
- ambiguidade e ausência de Produto adequado;
- entradas irrelevantes ou com dados que não devem persistir;
- Produtos bloqueados, inativos e sem saldo.

Um vendedor experiente avalia; um responsável pelo catálogo revisa divergências. Relevância:

- 3: muito relevante;
- 2: relevante;
- 1: relacionado, mas fraco;
- 0: inadequado.

O conjunto não é enviado a modelo de chat.

### Gates de ativação

Obrigatórios:

- identificador exato correto em primeiro: 100%;
- zero vazamento de Produto inativo, bloqueado ou fora das Filiais autorizadas;
- 100% das evidências existem literalmente na fonte;
- recall HNSW mínimo de 95% contra busca exata;
- zero persistência de consulta/transcrição em texto.

Qualidade inicial:

- `Recall@10` para notas 2/3: ≥ 85%;
- `nDCG@10`: ≥ 0,75 e superior ao lexical isolado;
- precisão de abstenção em consultas sem resposta: ≥ 90%;
- itens nota 0 entre os cinco primeiros: < 5%.

Operação:

- p95 da busca digitada dentro da meta da implantação;
- lupa sem dependência/impacto de IA;
- falhas e consumo dentro das cotas.

Falha em gate obrigatório impede ativação. Meta de qualidade pode ser endurecida, nunca relaxada silenciosamente.

### Melhoria controlada

Seleção, útil e não ajudou alimentam métricas agregadas, sem Usuário, Cliente ou texto original. Feedback negativo gera fila de revisão, não mudança automática.

Mudança de peso/limiar exige conjunto revisado e cria versão de ranking. A candidata roda em modo sombra antes da ativação e permite rollback. Popularidade pode desempatar relevância equivalente, mas nunca ultrapassa relevância, bloqueio, filtro ou autorização.

### Testes verificáveis

Cobrir identificador exato, RRF, lexical isolado versus híbrido, partes consolidadas, filtros/Permissões, disponibilidade, diversidade/expansão, evidência, abstenção, empate, métricas, HNSW versus exato, gates, modo sombra, versionamento e rollback. Avaliação deve ser repetível sem chamadas a chat.
