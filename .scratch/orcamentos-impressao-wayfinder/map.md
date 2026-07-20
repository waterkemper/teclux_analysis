# Impressão de Orçamentos em PDF

Label: wayfinder:map

## Destination

Produzir uma análise Delphi–Laravel baseada em evidências e pronta para especificação da impressão individual e em lote de Orçamentos em PDF, separando regras funcionais do layout que será fornecido por imagens no Cursor.

## Notes

- Analisar PAS e DFM conjuntamente, especialmente `dmimprimeorcamento`, Cadastro e Consulta de Orçamentos, Qualidade da Venda, parâmetros, fotos e infraestrutura compartilhada de impressão.
- Fronteira de acesso: a análise Delphi é feita exclusivamente neste workspace. O Cursor/SpecKit recebe um pacote Delphi autocontido e inspeciona somente o Laravel; dúvidas sobre o legado retornam para investigação aqui.
- Comparar com a impressão Laravel já existente, sua composição compartilhada com e-mail, HTML/Blade, Browsershot, autorização sensível e infraestrutura de mescla de PDFs.
- Classificar achados como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- CONFIRMADO: Cadastro imprime um Orçamento gravado por F11; Consulta imprime os Orçamentos marcados em lote.
- CONFIRMADO: Cadastro chama `AutorizacaoAnalistaCredito`; Consulta Delphi não chama essa validação explicitamente.
- CONFIRMADO: a autorização depende de `qualidade_vendas.solicitar_senha_analista_credito` e da diferença entre Qualidade calculada e gravada; exige credencial de Analista de Crédito e persiste Qualidade/analista.
- CONFIRMADO: `Visualizar Situação Produtos` controla a informação calculada de situação do Produto.
- CONFIRMADO: `Observação Padrão Orçamento`, por Filial do Orçamento, é concatenada à observação própria.
- CONFIRMADO: o relatório inclui Produtos, Serviços, Planos/Parcelas, descontos, frete, seguro, validade, vendedor, dados do Cliente, Filial e totais.
- CONFIRMADO: a consulta da foto escolhe a primeira por `fotosprodutos.posicao` e monta URL a partir de `SITE EMPRESA`.
- CONFIRMADO: Laravel já possui PDF individual por HTML/Browsershot, mas abre diretamente em nova aba e não apresenta modal de opções.
- DIVERGENTE: o controller Laravel localizado autoriza apenas consulta, não executa a validação de Qualidade da Venda/Analista de Crédito.
- NÃO LOCALIZADO: impressão de Orçamentos em lote e testes específicos da impressão Laravel.
- Ignorar completamente `frpOrcamento.frf` e qualquer personalização por FastReport.
- O layout visual final será definido no Cursor com imagens da impressão Delphi; este mapa concentra conteúdo, regras, segurança e geração.
- `delphi/` e `laravel/` permanecem somente leitura; nenhuma implementação será feita neste workspace.

## Decisions so far

- [Documentar o fluxo completo de impressão Delphi](issues/01-documentar-impressao-delphi.md) — fixou que a evidência Delphi é consolidada neste workspace; o Cursor recebe o pacote pronto e inspeciona somente o Laravel.

- DECISÃO NOVA: impressão individual e em lote aplicam a mesma validação de Qualidade da Venda e autorização de Analista de Crédito.
- DECISÃO NOVA: no lote, cada Orçamento recebe resultado individual; impedimentos não podem contornar a autorização dos demais.
- DECISÃO NOVA: o lote gera um único PDF para os Orçamentos autorizados e apresenta resumo dos impedidos.
- DECISÃO NOVA: modal de impressão oferece `Incluir fotos dos Produtos`, inicialmente desmarcado.
- DECISÃO NOVA: quando marcada, imprimir somente a foto principal de cada Produto, a primeira por posição.
- DECISÃO NOVA: `Visualizar Situação Produtos` e `Observação Padrão Orçamento` continuam automáticos pelos Parâmetros do Sistema, sem override no modal.
- DECISÃO NOVA: Produtos, Serviços, descontos, frete, seguro, Planos e Parcelas são incluídos quando existirem, sem opções individuais no modal.
- DECISÃO NOVA: adotar um layout oficial de PDF; somente conteúdo e identidade visual configuráveis, sem modelo externo de relatório.

## Not yet specified

- Paridade exata dos cálculos, formatação, campos e agrupamentos do relatório Delphi frente ao composer Laravel.
- Regra quando alguns Orçamentos do lote exigem credenciais e outros não, incluindo quantidade de autenticações e validade da autorização.
- Ordem dos Orçamentos e separação/paginação dentro do PDF único.
- Limites operacionais de quantidade, tamanho e timeout, especialmente com fotos remotas.
- Comportamento para foto ausente, URL inválida, timeout ou imagem incompatível.
- Identidade visual efetiva da Filial do Orçamento versus Filial da sessão/base no legado.
- Destino de Orçamentos cancelados, expirados, sem Produtos ou sem Plano selecionado.
- Relação entre impressão e HTML usado no envio de e-mail: compartilhamento seguro de dados sem forçar o mesmo layout.

## Out of scope

- Implementar a impressão neste workspace.
- Reutilizar FastReport ou suportar `frpOrcamento.frf`.
- Definir aqui o desenho pixel a pixel do PDF; imagens serão fornecidas no Cursor.
- Permitir editar dados do Orçamento no modal de impressão.
- Criar opções de modal para ocultar arbitrariamente seções obrigatórias.
- Alterar Delphi ou executar builds, Composer, npm, migrations, formatadores ou geradores nas junctions.
