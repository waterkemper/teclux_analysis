# Produzir e publicar a apresentacao HTML final

Type: task
Status: resolved
Blocked by: 10

## Question

Como produzir a apresentacao final em HTML, em pt-BR, usando o Mapa de estado como estrutura principal e mantendo fidelidade a matriz factual?

O artefato deve conter:

- ponto de partida: convivencia Delphi/Laravel, mesmo PostgreSQL e conversao por modulo;
- Mapa de estado dos dez dominios;
- comparacao por mudancas sentidas, nao por inventario de menus;
- quatro provas: transicao sem corte, Confirmacao entre filiais, Romaneios e Busca Assistida;
- Caixa e NF-e/NFC-e como especificacoes para evolucao, sem prazo;
- ressalvas de Help, mobile, marketplaces e impressao termica;
- encerramento com as tres perguntas de alinhamento.

Requisitos de apresentacao: visual executivo, claro e memoravel sem linguagem de venda; navegacao simples para apresentacao ao vivo; responsivo; sem overflow horizontal; estados visualmente distintos; cada afirmacao sensivel acompanhada de evidencia ou ressalva; nada de cronograma, SLA ou promessa de substituicao imediata do Delphi.

O resultado desta ticket e o artefato HTML publicado no repositorio e um contexto de uso para a reuniao. Os prototipos em 03-prototype/ e 06-prototype/ sao referencias descartaveis, nao devem ser promovidos diretamente.

## Answer

O artefato final foi produzido em [final/index.html](final/index.html), com guia de uso em [final/README.md](final/README.md).

Ele tem 12 slides em scroll-snap, navegacao por teclado e botoes, contador, pontos de acesso, tema claro/escuro, layout responsivo e modo de impressao. O roteiro segue as decisoes do mapa: convivencia, mapa dos dez dominios, comparacao por mudancas, quatro provas, Caixa/Fiscal especificados, ressalvas e perguntas de alinhamento.

As afirmacoes foram limitadas pela matriz factual: Help aparece com validacao de producao pendente; mobile, marketplaces e impressao termica exibem ressalvas; Caixa e NF-e/NFC-e nao aparecem como implementados; nao ha cronograma, SLA ou promessa de substituicao imediata do Delphi.
