# Inventariar interface, filtros e operações da Confirmação por Romaneios Delphi

Type: research
Status: resolved
Blocked by:

## Question

Qual é o contrato funcional comprovado de `fmconfirmarromaneiostransferencia.pas/.dfm` e das rotinas de interface alcançadas: filtros, estado inicial, abas, grids, campos, pesquisas F9, máscara de chave NF-e, seleção, botões, ícones, atalhos, mensagens, cores, foco, habilitação, conferência de volumes/produtos, confirmação e tratamento de romaneio de passagem? Classificar diferenças em relação ao padrão Laravel e bugs que não devem ser reproduzidos.

Fontes mínimas: os quatro arquivos em `C:\projetos.vcl\apps\interlojas`, com arquivo/linha e componente para cada achado. Consultar `modules/interlojas/confirmacao-por-notas/` apenas para seams compartilhados, não para substituir a evidência desta tela.

## Answer

Pesquisa concluída em [pesquisa-interface-delphi.md](../../../modules/interlojas/confirmacao-por-romaneios/pesquisa-interface-delphi.md). Foram confirmados estado inicial, período e limites de data, filial requisitante somente leitura, busca por chave/número, grids de Notas e Produtos, seleção, F5/F6/Ctrl+Espaço/Enter, conferência `NST`/`ROE`/`ROP`, visualização da conferência e Romaneio de Passagem.

Também foram registrados como divergências ou riscos a não reproduzir: F9 ausente explicitamente, legenda “CHAVE NFE/VOLUME” sem busca de volume observada, ausência de Cancelar no F6, hint incorreto de confirmação, carregamento de Produtos em `AfterScroll`, validação incompleta da chave e possível ambiguidade no ramo de autorização.
