# Prompt 01 — Fundação, acesso e filtros

Execute /speckit.specify para especificar a fundação do módulo Consulta e Agendamento de Entregas no checkout Laravel atual.

## Contexto autoritativo

Leia as quatro notas de pesquisa deste diretório, o manifesto e o README do schema. Não reabra nem peça ao implementador para inspecionar dmConsultaEntregaProdutos ou fmConsultaEntregaProdutos diretamente. Consulte o código Laravel atual apenas para confirmar seams e nomes concretos.

## Escopo

Especificar:

1. A folha Cloud com o caminho visível Entregas e Montagens → Entregas → Relatório de Entregas, rota e capability próprias, sem reutilizar grant legado ou confundir a folha com a Consulta de Entrega de Produtos Delphi.
2. Migration idempotente de acessosmodulos com raiz, grupo e folha únicos; não criar grants automaticamente.
3. Serviço de acesso fail-closed e middleware aplicado a HTML, consulta F6, cancelar, F9, edição F5, F10, exportação, relatório, preview, impressão e PDF. Usuário ausente, catálogo ambíguo, rota ausente ou grant ausente negam.
4. Filial efetiva derivada da sessão e revalidada pelo serviço de acesso a filiais em toda leitura e comando. A seleção enviada pelo browser é intenção, nunca autoridade.
5. Breadcrumb padrão: Entregas e Montagens → Entregas → Relatório de Entregas. Usar AppLayout e command bar de consulta existentes.
6. DTO/Form Request tipado para intervalo de entregas inclusivo, Todas as entregas, filiais de venda, filiais do produto, períodos marcados, fornecedores de transporte e contexto de romaneio. Datas ausentes, início maior que fim, arrays duplicados e IDs fora do escopo devem ter erros explícitos.
7. Semântica de filtros: todas as entregas exige data não nula; intervalo aceita ambas as datas, somente início ou somente fim; períodos são faixas de hora inclusivas; fornecedores são IDs tipados; romaneio é contexto fiscal autorizado.
8. F9, quando exposto para filtros ou lookups, deve usar o hook de atalhos e o modal padrão paginado, com endpoint próprio, allowlist, restauração de busca, foco, teclado e autorização server-side.
9. F5, F6 e F10 devem ter ícones, labels acessíveis e atalhos declarados no command bar. F6 é Gerar; F5 é Gravar; F10 é Contrato. Não inventar F9 Delphi: o modal é requisito Laravel da pesquisa assistida.
10. Manifesto de parâmetros vazio nesta fatia. Não criar parâmetro de sistema sem evidência literal. Se um parâmetro futuro for descoberto, usar manifesto tipado e leitura em lote por Filial.

## Saída esperada

Entregar especificação com rotas, capability, middleware, modelo de request, erros, Filial, menu, breadcrumb, command bar, lookups F9 e critérios de aceite. Não definir ainda o SQL de resultado, a materialização do relatório ou a implementação dos comandos de edição; essas fronteiras pertencem aos prompts seguintes.

## Gates

Não confiar em autorização do browser, Tag legado ou existência visual no menu. Não usar SQL textual, N+1, teste de driver, hasTable, Schema::has* ou introspecção de schema em runtime.
