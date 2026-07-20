# Experiência reutilizável da Busca Assistida de Produtos

Label: wayfinder:map

## Destination

Produzir um dossiê autocontido, pronto para posteriormente virar prompt SpecKit, que detalhe a evolução da Busca Assistida de Produtos já implementada: comando por microfone com estados explícitos, confirmação antes da busca, multisseleção com adaptação ao hospedeiro e detalhe rico reutilizável com fotos, conteúdo HTML, preço e estoque.

## Notes

- Este mapa complementa, sem reabrir, as decisões de [Busca Assistida de Produtos](../busca-assistida-produtos-wayfinder/map.md) e a implementação Laravel/spec `235-busca-assistida-produtos`.
- O Laravel atual é a fonte real: auditar `BuscaAssistidaPanel`, Trigger, contratos HTTP, Consulta de Estoques, filtros, galeria de fotos, permissões de preço/estoque e testes antes de decidir alterações.
- Usar `/grilling` e `/domain-modeling` para decisões de interação e para fixar termos como Consulta Assistida, Seleção de Produtos, Aplicação ao Hospedeiro e Detalhe Comercial.
- O componente deve ser reutilizável em Consulta de Estoques, Orçamentos, Contratos e outros módulos administrativos; não pode conhecer diretamente as regras internas de cada tela hospedeira.
- Na Consulta de Estoques, aplicar produtos selecionados significa inseri-los nos filtros existentes e não criar movimentos, orçamento ou contrato.
- Preservar lupa tradicional, autorização por Filial, proteção de preços, consulta de estoque em tempo real, economia de tokens, abstenção e demais decisões anteriores.
- HTML comercial deve ser sanitizado e renderizado com segurança; nunca executar script, eventos inline ou URLs perigosas.
- Este mapa planeja e especifica; não implementa e não gera ainda o prompt SpecKit.

## Decisions so far

<!-- Uma linha por ticket resolvido. -->

- [Auditar a experiência Laravel atual](issues/01-auditar-experiencia-laravel-atual.md) — confirma painel/voz/search/fotos reutilizáveis, mas encontra filtros ignorados, DTO divergente, seleção apenas unitária, estados de voz incompletos e ausência de detalhe/HTML sanitizado.
- [Definir a máquina de estados do microfone](issues/02-definir-maquina-estados-voz.md) — fixa microfone alternável com timer/auto-stop, processamento cancelável e stale-safe, transcrição acumulada editável e confirmação inline explícita antes de qualquer busca.
- [Definir multisseleção e contrato com o hospedeiro](issues/03-definir-multisselecao-e-contrato-hospedeiro.md) — painel sempre multisseleção com faixa persistente entre refinamentos (limite 15), `onApply(selections[])` explícito sem fechar sozinho, `currentSelection` ampliado para array; adaptador da Consulta de Estoques faz full sync das linhas `item_produto.codigo eq`, sem revalidação extra e sem alterar o Gerar.
- [Prototipar resultados e detalhe comercial rico](issues/04-prototipar-resultados-e-detalhe-rico.md) — protótipo de 3 variantes; escolhida a **C (modal sobreposto)** para o detalhe, com faixa de seleção sempre visível e ordem fixa de blocos no detalhe (galeria, descrição HTML sanitizada, características, preço, estoque por Filial).
- [Definir dados, carregamento e segurança do detalhe](issues/05-definir-contrato-dados-detalhe-seguranca.md) — novo contexto de autorização `busca_assistida` (só Consulta de Estoques por ora); preço usa a Filial Base, estoque por Filial exige consulta nova; `league/html-sanitizer` no backend; endpoint combinado (descrição+características+preço+estoque) além do endpoint de fotos existente; sem cache novo; falha parcial inline por seção.
- [Validar acessibilidade, responsividade e reuso](issues/06-validar-acessibilidade-responsividade-e-reuso.md) — mobile fica fora de escopo por agora (desktop/tablet apenas); demais decisões anteriores (voz, multisseleção, modal de detalhe, autorização por contexto) já cobrem teclado/leitor de tela/foco/seams sem lacunas novas.
- [Consolidar o dossiê da evolução da Busca Assistida](issues/07-consolidar-dossie-experiencia.md) — dossiê autocontido em [`dossie.md`](dossie.md), pronto como fonte primária para uma futura conversão em prompt SpecKit.

## Not yet specified

Nenhuma névoa adicional após a auditoria; os pontos descobertos foram absorvidos pelos tickets já abertos.

## Out of scope

- Alterar recuperação híbrida, embeddings, indexação, cache, modelo de IA ou orçamento de tokens já definidos.
- Substituir a lupa tradicional.
- Inserir automaticamente itens em Orçamentos ou Contratos nesta entrega; apenas definir contrato reutilizável para futura adoção.
- Editar descrição complementar, características, fotos, preço ou estoque pelo painel.
- Gerar o prompt SpecKit antes de o mapa estar concluído.
