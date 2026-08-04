# Prompt para /speckit.specify — consulta, grids, batching e conferência

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a leitura e interface React de **Interlojas → Confirmação por Notas**, terceira de quatro fatias. Consuma as specs 01–02 e entregue consulta sem paginação, grids mestre–detalhe, buscas, seleção, exportação e integração não bloqueante com Conferir Produtos/NST.

Não implemente durante `/speckit.specify`. Inspecione o Laravel atual e cite arquivos concretos. Não abra Delphi: use como evidência autoritativa:

- `modules/interlojas/confirmacao-por-notas/pesquisa-interface-delphi.md`;
- `pesquisa-sql-batching-delphi.md`;
- `pesquisa-conferir-produtos.md`;
- `pesquisa-padroes-laravel-chave-nfe.md`.

Não duplique menu, capability, filial, parâmetros, filtros ou chave NF-e das specs anteriores.

## Elegibilidade e consulta mestre

Consultar notas de saída candidatas em `dadosfiscais d`, `notas n` e `filiais f`:

- `d.cliente = filial ativa`;
- `d.tipocliente = ''L''`;
- `d.situacao = ''N''`;
- período inclusivo de `d.data`;
- CFOP cujo módulo 1000 está em `150,151,152,155,156,408,409,552,557`, ou venda-transferência, ou nota de saída de devolução, preservando as funções/regras legadas;
- deve existir `pedidosfiliais` em situação `F`;
- quantidades fiscais e `qtderecebida` devem coincidir por produto.

Caracterize a divergência do SQL legado que pode não detectar produto existente só de um lado. Defina comparação correta set-based com pré-agregação e `NOT EXISTS`, sem aprovar nota com conjuntos diferentes apenas porque os produtos comuns coincidem.

Projeção explícita, sem `d.*`:

- `dadofiscal`, filial emissora/requisitada e nome;
- série, número, chave NF-e, emissão e valor;
- observações, código fiscal e venda-transferência;
- primeiro volume;
- último romaneio;
- situação do romaneio e da entrada;
- seleção como estado frontend, nunca coluna persistida.

Calcular último romaneio/situações uma vez por CTE, janela ou `LEFT JOIN LATERAL`; não repetir subconsultas correlacionadas. Fixar ordenação determinística com chave única final e allowlist para ordenação client-side do grid.

## Consulta detalhe e proibição de N+1

Uma geração deve executar:

1. uma consulta para todas as notas elegíveis;
2. uma única consulta para todos os produtos dessas notas.

Produtos são filtrados em lote por `dadofiscal`, juntam produto/característica e projetam: dado fiscal, número do item, produto, descrição, Linha, Coluna, quantidade e preço. Ordenar por `dadofiscal, numero` e agrupar em memória.

Regras obrigatórias:

- nenhuma consulta no `AfterScroll` equivalente, render, map ou loop;
- trocar a nota selecionada não consulta o banco;
- listas simples pequenas/médias: IDs inteiros normalizados, deduplicados e `whereIn`;
- listas maiores: `= ANY(?::bigint[])` com array produzido somente de inteiros validados;
- relações por par não podem usar `produto = ANY(...) AND filial = ANY(...)`;
- pares usam tuplas com binds ou `unnest(array_produtos, array_filiais) WITH ORDINALITY`, validando comprimentos e preservando ordem;
- `IN`/`ANY` não preservam ordem; usar `ORDER BY`, ordinality ou mapa explícito;
- vazio não gera SQL inválido;
- não quebrar silenciosamente em queries por chunk/item; qualquer chunking mantém teto documentado e mensurável.

Testes devem provar query count constante para 1 e N notas e ausência dos IDs literais no SQL.

## Sem paginação e grids padrão

Não implementar paginação. Carregar o conjunto completo autorizado e usar `ErpPreferenceDataGrid` com catálogos versionados próprios.

Grid Notas, seleção múltipla e linha corrente:

1. Filial Emissora/Requisitada;
2. Nome da Filial;
3. Série;
4. Número;
5. Chave NF-e;
6. Emissão;
7. Valor;
8. Selecionada;
9. Romaneio;
10. Situação do Romaneio;
11. Situação da Entrada.

Grid Produtos da linha corrente:

1. Número;
2. Produto;
3. Descrição;
4. Linha;
5. Coluna;
6. Quantidade;
7. Preço.

Ambos devem seguir o padrão do projeto para ordenação client-side, resize, reorder, pin, visibilidade, Campos da Grade, importar/exportar configuração, aplicação global autorizada, foco, acessibilidade e Excel. Exportar todo o conjunto carregado/autorizado; no detalhe, os produtos da nota selecionada. `USAR GRADES PRODUTOS` controla Linha/Coluna e `Máscara Quantidade` formata quantidade.

## Seleção, cores e buscas

- Duplo clique e Ctrl+Espaço alternam a seleção da nota corrente.
- Buscar com sucesso posiciona e também alterna seleção, como no Delphi.
- Busca por chave usa o `NfeAccessKeyInput` da spec 01, exige chave completa/válida e igualdade canônica.
- Busca secundária é **Série + Número**; “Filial” era rótulo Delphi incorreto. Se Série estiver vazia, permitir fallback por Número e tratar ambiguidade de múltiplas notas explicitamente.
- Nota selecionada tem realce acessível além de cor.
- Reproduzir semântica visual percebida: romaneio Em Trânsito + entrada Não Confirmada, Confirmada ou Confirmada Parcial, com legenda, texto/ícone e contraste; cor nunca é o único indicador.
- Estados: Inicial, Carregando, Vazio, Resultado e Erro recuperável; filtros não se perdem.

## Operações e atalhos

- `ErpConsultaOperationBar` com ícones do padrão atual.
- Gerar/F6; Confirmar/F5 fica preparado/desabilitado até a spec 04; Conferir tem botão visível sem inventar atalho.
- Enter na data final equivale a Gerar.
- Bloquear atalhos durante loading/modal/campo incompatível e evitar Alt+G/Ctrl+X do grid.
- Confirmar habilita somente com pelo menos uma nota selecionada.

## Conferir Produtos/NST

- `NST` é Conferência de Produtos da Nota de Saída de Transferência, identificada por `dadofiscal`.
- Não reimplementar o motor dentro desta página.
- Especificar `NstConferenceAdapter` para o `ConferenceEngine` existente e navegar para rota dedicada equivalente a `/cadastros/conferencias/NST/{dadofiscal}`.
- Revalidar capability/filial e vínculo da nota antes de navegar/carregar.
- Persistência pertence ao motor em `conferencia`, `produtosconferencia` e componentes.
- Conferir é opcional e não bloqueia F5.
- Não confundir NST com os registros documentais ROS/ROE do romaneio.

## Contratos HTTP/TypeScript

Especifique endpoints de consulta completa, exportação/contexto se necessário, busca/localização e abertura da conferência; envelopes, DTOs, tipos, catálogos, hooks e cancelamento/ignorância de respostas atrasadas. Filtros semânticos vêm da spec 02; não aceitar paginação.

## Critérios de aceite

- [ ] Elegibilidade reproduz destino, situação, fiscal, pedidos e igualdade por produto.
- [ ] Mestre e todos os detalhes são carregados em exatamente duas consultas por geração.
- [ ] Trocar seleção executa zero queries.
- [ ] Não há SQL/interpolação ou consulta em loop; batching é tipado e sem cartesiano de pares.
- [ ] Grids têm recursos padrão, sem paginação, e exportam todo o conjunto autorizado.
- [ ] Busca por chave canônica e Série+Número alterna seleção.
- [ ] Seleção, situações e cores são acessíveis.
- [ ] F6/F5/Ctrl+Espaço/Enter e botões seguem o padrão Laravel.
- [ ] NST reutiliza `ConferenceEngine` e não bloqueia confirmação.

## Matriz mínima de testes

- elegibilidade por filial/destino, tipo L, situação, cada CFOP, venda/devolução, pedido F;
- produtos coincidentes, divergentes e presentes em apenas um lado;
- período nas bordas;
- 0, 1 e N notas; 0, 1 e N produtos;
- query count idêntico para 1 e 50 notas e zero ao trocar seleção;
- arrays vazios, duplicados, ordem não natural e IDs inválidos;
- pares produto–filial não cruzados;
- grids, preferências, exportação, parâmetros e acessibilidade;
- busca de chave válida/inválida/não encontrada e Série+Número ambíguo;
- seleção por mouse/teclado/busca;
- estados/races;
- Conferir autorizado/não autorizado, existente/novo e não bloqueante.

## Saída esperada

Produza spec e plano executáveis com SQL/Query Builder, CTEs/joins, batching, teto de queries, contratos HTTP/TypeScript, grids, estados, exportação, NST e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- confirmação/gravações F5, spec 04;
- paginação;
- Confirmação por Item ou por Romaneio;
- reimplementar todo o ConferenceEngine;
- implementar durante esta especificação.
```
