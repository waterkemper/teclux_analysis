# Prototipar páginas representativas em tema escuro

Type: prototype
Status: resolved
Blocked by: 02, 03

## Answer

O protótipo foi disponibilizado em /prototype/tema-escuro?variant=A|B|C e validado com npm run build. Ele usa o AppLayout real e inclui barra superior, menu lateral desktop/mobile, subbarra de área, formulário denso, grid, rail de operações, modal, busy/toast e estados de sucesso, atenção e erro.

A decisão validada é disponibilizar três presets de paleta para o tema escuro, sem criar três implementações de telas:

- A — Grafite + turquesa ERP;
- B — Azul petróleo + ciano;
- C — Grafite quente + âmbar.

As paletas são uma preferência visual separada do modo. O contrato passa a combinar Modo (Sistema/Claro/Escuro) e Paleta (A/B/C). A paleta será aplicada pelos mesmos tokens semânticos e persistida junto à preferência local; ela não deve alterar a semântica das cores de estado. O modo Claro será sempre o padrão inicial do produto e continuará disponível independentemente da paleta. O modo Sistema somente será aplicado quando o usuário o escolher explicitamente.

O protótipo é descartável e serve para validar contraste, hierarquia, foco e legibilidade do shell e das telas representativas. A implementação definitiva deve levar os presets para o contrato de tokens, validar cada combinação relevante e manter relatórios, PDFs, imagens e artefatos legados com o tratamento decidido na arquitetura.

## Question

Como o tema escolhido se comporta em uma amostra concreta da plataforma, e quais lacunas visuais só aparecem quando shell, formulário, grid, modal e estados operacionais estão juntos?

Prototipar ou montar uma amostra barata com AppLayout, cadastro com formulário denso, consulta com grid, modal/dialog, toast, operação busy/erro/sucesso, rail de operações e uma tela com cores legadas/semânticas. O artefato deve permitir validar contraste, hierarquia, foco, leitura e exceções antes da migração ampla; não transformar o protótipo em implementação da feature.
