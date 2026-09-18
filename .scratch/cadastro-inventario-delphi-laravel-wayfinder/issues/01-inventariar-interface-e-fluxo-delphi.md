# Inventariar interface e fluxo Delphi do Cadastro de Inventário

Type: research
Status: resolved
Blocked by:

## Answer

Pesquisa concluida. O dossie inventaria a interface e o fluxo funcional observavel do Cadastro de Inventario, com evidencias por arquivo e linha, classificacao das constatacoes e registro explicito de lacunas, divergencias e possiveis bugs legados. Foram consultadas as units-alvo e apenas as referencias necessarias para datasets, parametros, modal de produtos, copia de inventarios e relatorio.

Artefato: modules/estoque/cadastro-inventario/pesquisa-interface-fluxo-delphi.md.

O dossie tambem registra as restricoes para os futuros prompts Laravel, sem implementar Laravel, alterar fontes Delphi ou solicitar reabertura direta dos fontes no handoff.

## Question

Quais controles, abas, frames, datasets, estados e fluxos observáveis do Cadastro de Inventário devem ser preservados? Extrair filtros/defaults/validações, chave primária, Filial, Situação, seleção de Produtos, inclusão/exclusão, geração de produtos, importação, operações, mensagens, autorizações, atalhos, F6/F7/F9, impressão/relatórios, grids, colunas editáveis, ordenação, cores, totalizadores e eventos temporais.

Mapear os eventos para métodos e datasets sem perder a ordem do fluxo, registrar evidências por arquivo e linha, apontar o que não foi localizado e separar defeito legado de paridade exigida. Produzir `modules/estoque/cadastro-inventario/pesquisa-interface-fluxo-delphi.md`; não decidir ainda o contrato Laravel nem implementar.
