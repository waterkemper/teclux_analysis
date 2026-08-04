# Prompt para /speckit.specify — consulta, grid e exportação

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a segunda de duas fatias do módulo Laravel **Interlojas → Consulta de Transferências**. Consuma integralmente a fundação e o contrato de filtros definidos pela spec 01 e entregue o repositório de leitura, endpoint paginado, interface de resultados, grid padronizada e exportação completa.

Não implemente durante `/speckit.specify`. Inspecione o checkout Laravel atual e cite arquivos concretos. Não investigue Delphi: este prompt e as pesquisas consolidadas em `modules/interlojas/consulta-transferencias/` são o contrato legado autoritativo. Não duplique capability, menu, resolução de filial, manifest ou DTO semântico da spec 01.

## Limite arquitetural

- Módulo somente leitura: não criar endpoints de inclusão, edição, confirmação, cancelamento, transferência, expedição ou recebimento.
- Repositório de leitura próprio sobre o banco legado compartilhado.
- GET Inertia leve; consulta e exportação em endpoints JSON/intencionais separados.
- Revalidar capability, filial ativa, parâmetros e escopo dos dois papéis de filial em cada endpoint.
- Não alterar tabelas legadas nem criar cópias de `pedidosfiliais`, `filiais`, `produtos`, `caracteristicas`, `estoques`, `dadosfiscais` ou `notas`.

## Consulta e filtros

A fonte é `pedidosfiliais pf`. Aplicar o contrato semântico da spec 01:

- período inclusivo por `pf.data`;
- arrays de situações `A|F|D|C`;
- Curva ABC `A|B|C|nao_definido`, sendo Não Definido `NULL` ou vazio;
- listas independentes e autorizadas de `pf.requisitante` e `pf.requisitada`.

Usar Query Builder/Eloquent com binds e `whereIn`. Nunca aceitar CSV, macros SQL, expressão, coluna ou direção não allowlisted. Preferir limites sargáveis para o período, comprovando equivalência inclusiva. Arrays vazios preservam a semântica definida na spec 01.

## Projeção obrigatória

Listar campos explicitamente; não usar `pf.*`. Projetar em lote, sem N+1:

- identidade e situação: `codigo`, `situacao`, descrição canônica, `data`, `hora`;
- produto: `produto`, código visual, descrição, Curva ABC, `valorgrade1`, `valorgrade2`, Linha, Coluna;
- tributos: CST, CSOSN, CST PIS e CST COFINS;
- filiais: códigos e nomes da Requisitante e Requisitada;
- quantidades: estoque da Requisitada, reserva prévia da Requisitada, quantidade pedida, quantidade recebida e estoque da Requisitante;
- fiscal: lote de transferência, data do dado fiscal/nota, filial, série e número da nota;
- `observacao`.

Relações legadas:

- joins obrigatórios de Filiais Requisitante/Requisitada e Produto/Característica;
- dados fiscais/notas são opcionais e não podem eliminar transferência sem documento;
- para estoque da Requisitada tipo `V`, usar a filial efetiva `coalesce(filial_estoque, codigo)`; para os demais tipos, o próprio código;
- preservar a transferência quando informação fiscal, estoque, tributo ou grade opcional estiver ausente;
- verificar cardinalidade de grades, estoques, tributos, dados fiscais e notas antes de trocar subconsultas por joins; impedir multiplicação de linhas;
- número de queries deve ser constante por página.

## Situações e correções de apresentação

- `A = Aberta`;
- `F = Fechada`;
- `D = Confirmada`;
- `C = Cancelada`.

Não expor “ATENDIDA” para D nem “FECHADADA”. Usar aliases semânticos explícitos para Linha e Coluna, sem reproduzir a inversão aparente dos getters Delphi. Exibir `estoquerequisitada` como **Estoque Requisitada** e `estoquerequisitante` como **Estoque Requisitante**.

## Paginação e ordenação server-side

- Padrão de 200 registros por página.
- Ordem inicial: `data ASC, hora ASC, codigo ASC`.
- Aceitar `page`, `per_page`, `sort` e `direction` somente no endpoint de leitura.
- Allowlist explícita das colunas ordenáveis e direções `asc|desc`.
- Toda ordenação pública deve acrescentar `codigo` como desempate determinístico quando necessário.
- Definir limites seguros de `per_page` sem permitir carga arbitrária.
- Retornar envelope paginado estável com itens, página, por página, total e metadados necessários.
- Página vazia é sucesso, não erro.

## Grid Laravel

Usar `ErpPreferenceDataGrid` com catálogo próprio versionado, `screenKey` e `gridId`. Manter recursos padrão do projeto:

- ordenação server-side integrada ao estado do grid;
- paginação de 200;
- preferências de visibilidade, ordem, largura, resize, reorder e pin;
- Campos da Grade;
- exportar/importar configuração e aplicação global conforme permissões existentes;
- indicador de posição, seleção única, loading, vazio e erro recuperável;
- acessibilidade de foco, teclado e cores;
- exportação Excel;
- atalhos globais já reservados pelo shell, como Alt+G e Ctrl+X.

Colunas base, na ordem legada:

1. Código;
2. Situação;
3. Descrição da Situação;
4. Data;
5. Hora;
6. Produto;
7. Produto Visual;
8. Descrição do Produto;
9. Curva ABC;
10. Valor Grade 1;
11. Valor Grade 2;
12. Linha;
13. Coluna;
14. CST;
15. CSOSN;
16. CST PIS;
17. CST COFINS;
18. Filial Requisitante;
19. Nome da Requisitante;
20. Filial Requisitada;
21. Nome da Requisitada;
22. Estoque Requisitada;
23. Reserva Prévia Requisitada;
24. Quantidade Pedida;
25. Quantidade Recebida;
26. Estoque Requisitante;
27. Lote da Transferência;
28. Data da Nota;
29. Filial da Nota;
30. Série da Nota;
31. Número da Nota;
32. Observação.

O catálogo poderá definir visibilidade inicial distinta sem remover dados autorizados:

- efeitos de grade obedecem a `USAR GRADES PRODUTOS`;
- Estoque Requisitante obedece a `REQUISICAOSUBTRAIESTOQUE`;
- quantidades usam `Máscara Quantidade`;
- Observação também aparece em painel somente leitura controlado pela linha selecionada.

Especifique claramente quais colunas são ocultáveis, ordenáveis e exportáveis. Campos de segurança internos nunca entram no catálogo.

## Jornada e operações

- A página chega da spec 01 no estado Inicial, sem resultado.
- Gerar ou F6 envia filtros e abre o estado Carregando.
- Sucesso com linhas mostra Resultado e foca a grid.
- Sucesso sem linhas mostra Vazio, preserva filtros e permite nova geração.
- Erro é recuperável e não apaga filtros nem resultado anterior sem decisão explícita.
- Mudança de página/ordenação mantém os filtros semânticos.
- Seleção única atualiza o painel Observações.
- Não há edição na grid.
- Usar `ErpConsultaOperationBar`, ícone e estados processing/disabled; F6 é o único atalho específico comprovado.

## Exportação

- Exportar todo o resultado filtrado, ordenado e autorizado, não somente os 200 registros da página atual.
- Usar o padrão server-side de contexto/token do projeto quando disponível.
- Recriar filtros, escopo, parâmetros e ordenação no servidor; nunca confiar em linhas, capability ou IDs autorizados enviados pelo cliente.
- Respeitar o catálogo de colunas exportáveis e os formatos de data, hora e quantidade.
- Definir política explícita para volume, streaming/chunking, expiração e uso único do token, erros e auditoria conforme os seams existentes.
- Exportação exige a mesma capability única e escopo de filiais da consulta.

## Contratos HTTP e TypeScript

Especifique:

- endpoint de consulta paginada;
- endpoint de criação de contexto/token e download da exportação, conforme padrão encontrado;
- Request/DTO de transporte que combina filtros da spec 01 com paginação/ordenação sem contaminar a identidade semântica;
- envelopes JSON, item projetado, metadados, erros 403/404/422 e falhas recuperáveis;
- tipos TypeScript, estado React, hook de consulta e integração com o grid;
- cancelamento/ignorância de resposta atrasada quando filtros, página ou ordenação mudarem rapidamente.

## Critérios de aceite

- [ ] SQL usa binds, allowlists, projeção explícita e nenhuma macro textual.
- [ ] Período, situações, ABC e os dois escopos de filial preservam o contrato da spec 01.
- [ ] Projeção completa tem número constante de queries e não multiplica nem elimina linhas opcionais.
- [ ] Filial tipo V resolve corretamente o estoque da Requisitada.
- [ ] Situações, estoques, Linha/Coluna e rótulos corrigidos aparecem conforme decisão.
- [ ] Paginação e ordenação são server-side, padrão 200, com desempate estável.
- [ ] Grid usa `ErpPreferenceDataGrid` e todos os recursos padrão de preferências e personalização.
- [ ] Parâmetros condicionam somente apresentação/formatação prevista.
- [ ] Gerar/F6, estados da tela, seleção e Observações funcionam sem edição.
- [ ] Exportação inclui todo o resultado autorizado e não confia em linhas do cliente.
- [ ] Nenhuma operação transacional ou permissão artificial é criada.

## Matriz mínima de testes

- período antes/nas bordas/depois e datas já validadas pela spec 01;
- nenhuma/uma/múltiplas/todas as situações;
- nenhuma/uma/múltiplas/todas as curvas, incluindo `NULL` e vazio;
- um/múltiplos filtros de cada papel de filial e adulteração de IDs;
- usuário comum versus administrador;
- transferência com/sem dado fiscal, nota, estoque, tributo e grade;
- filial Requisitada normal e tipo V, com/sem `filial_estoque`;
- empates de data/hora entre páginas sem duplicação ou omissão;
- primeira, intermediária, última e página vazia; `per_page` inválido;
- cada coluna/direção permitida e tentativa de ordenar campo não permitido;
- parâmetros de grade, estoque e máscara em valores válidos/ausentes/inválidos;
- Inicial, Carregando, Vazio, Resultado e Erro recuperável;
- F6, clique em Gerar, repetição rápida e resposta fora de ordem;
- seleção de linha e painel Observações;
- persistência/importação/exportação de preferências do grid;
- exportação com uma/múltiplas páginas, colunas ocultas/exportáveis, token expirado e tentativa de ampliar escopo;
- regressão dos módulos Interlojas e componentes de grid reutilizados.

## Saída esperada do SpecKit

Produza spec e plano executáveis com SQL/Query Builder proposto, verificação de cardinalidade, contratos HTTP/JSON/Inertia/TypeScript, árvore React, catálogo da grid, estados, exportação, acessibilidade, sequência de implementação e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- fundação, migration, capability e manifest já definidos na spec 01;
- qualquer mutação em transferências ou recebimentos;
- relatórios além da exportação padrão da grid;
- alterar schema ou fontes Delphi;
- implementar durante esta especificação.
```
