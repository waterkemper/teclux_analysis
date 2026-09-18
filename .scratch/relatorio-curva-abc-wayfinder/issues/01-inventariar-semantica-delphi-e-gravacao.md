# Inventariar semântica Delphi da Curva ABC e da gravação do resultado

Type: research
Status: resolved

## Question

Quais são, nos quatro fontes Delphi fornecidos, os parâmetros, tipos de análise, filtros, ordenação, linhas/colunas, cálculo/classificação, estados da tela, F6, F5/“Gravar”, preview, exportação e efeitos de `AtualizarResultadoCurvaABC`? Consolidar a evidência, incluindo a ordem das operações, limites, mensagens e dependências de banco/trigger, classificando cada achado e apontando o que deve virar contrato para o Laravel sem copiar bugs técnicos.

## Comments

- Pesquisa concluída sem resolver o ticket. Artefato: `.scratch/relatorio-curva-abc-wayfinder/research/01-semantica-delphi-e-gravacao.md`.
## Answer

Pesquisa consolidada em [01-semantica-delphi-e-gravacao.md](../research/01-semantica-delphi-e-gravacao.md). A tela Delphi confirma defaults, validacao A+B+C=100, seis tipos de Curva ABC, F6 para gerar, F5 para gravar, preview/impressao e exportacao Excel. A funcao abc_prod e as funcoes auxiliares de produto nao foram localizadas, portanto a formula completa e os cortes ABC permanecem nao confirmados.

AtualizarResultadoCurvaABC limpa globalmente produtos.resultadocurvaabc, percorre o resultado e grava o tipo por produtos.codigo, enviando veiodatriggercaracteristicas = true, seguido da persistencia/commit legado. Isso demonstra intencao de substituicao global, mas nao prova atomicidade nem que modos agregados tenham codigos de Produto gravaveis. Compras esta exposto sem ramo implementado; o parentesis excedente no filtro somente Inativo e possivel bug legado e nao deve ser copiado.
