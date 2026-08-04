# Prompt para /speckit.specify — leitura, grid e Confirmados

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a leitura paginada e a interface React da **Consulta de Requisições para Exposição**, segunda de quatro fatias. Consuma a fundação da spec 01 e entregue filtros, grid Pedidos, seleção, estados de tela e detalhe Confirmados. Não implemente ações transacionais nem relatório nesta fatia.

Não implemente durante `/speckit.specify`. Inspecione o Laravel atual, inclusive a UI do Cadastro em `Interlojas/RequisicaoParaExposicao`, `ErpPreferenceDataGrid`/`DataGrid`, padrões Inertia e repositórios legados. Não abra Delphi: os requisitos abaixo são autoritativos.

## Limite arquitetural

Crie read repository próprio da Consulta. Não amplie o F9 de abertas até ele virar consulta histórica e não faça a página depender do estado completo de `Cadastro.tsx`. Reutilize sanitização, revisão, formatação e componentes pequenos quando seus contratos coincidirem.

## Consulta Pedidos

Filtros: filial ativa/requisitante fixa, período inclusivo e uma situação A/F/D/C. Use binds, nunca macros/interpolação. Ordenação determinística:

`requisitada ASC, produto ASC, codigo ASC`.

Projete em lote, sem N+1:

- identidade: `codigo`, `produto`, `requisitante`, `requisitada`, `revisao`;
- produto: código visual, descrição, referência, `valorgrade1/2`, nomes/títulos de grade;
- requisição: data/hora, `qtdepedida`, `qtderecebida`, situação, observação, `dadofiscal`, motivo;
- fiscal/relatório: nota número/série, `lotetransferencia`, `resultadocurvaabc`;
- contexto: nome da requisitada, estoque da requisitante, estoque da requisitada e Reserva Prévia;
- filial física: resolver filiais tipo V por `coalesce(filial_estoque, codigo)` através do seam existente.

Não eliminar linha por ausência de nota, estoque ou característica quando a semântica for opcional.

## Grid Pedidos

Colunas visuais, nesta ordem:

1. Produto;
2. Descrição;
3. Linha;
4. Coluna;
5. Data/Hora;
6. Filial Requisitada;
7. Estoque Requisitada;
8. Reserva Prévia;
9. Estoque Requisitante;
10. Pedida;
11. Recebida.

Linha/Coluna aparecem somente com `USAR GRADES PRODUTOS`. Reserva Prévia aparece somente com `REQUISICAOSUBTRAIESTOQUE`. Quantidades usam `Máscara Quantidade`. Observação fica em painel somente leitura.

Somente Pedida pode entrar em edição e apenas para situação A; a persistência é da spec 03. Recebida nunca é editável. Linhas: C vermelho, F amarelo, D teal, A normal/zebrada, preservando foco/acessibilidade. Data e Nota/Série devem ser opções visíveis/configuráveis; não reproduzir Alt+clique oculto.

## Jornada React

- abre sem resultado, hoje/hoje e Aberto;
- estados explícitos: Inicial, Carregando, Vazio, Resultado e Erro recuperável;
- Gerar e F7 executam; Enter na Data Final equivale a Gerar;
- filtros não se perdem em erro;
- seleção única dirige observação, futura edição/cancelamento e Confirmados;
- botões visíveis são primários; F7/F5/F6/F12 são atalhos complementares;
- paginação no servidor e preferências de grid não alteram a semântica dos filtros.

## Aba Confirmados

Só aparece quando a linha selecionada tem situação F. Consulta read-only por `dadofiscal`, com ordem `produto, codigo`, trazendo Produto, Descrição, Linha, Coluna, Grupo/Setor e Situação. Use left join para não ocultar produto sem característica. Linha/Coluna obedecem ao parâmetro de grades. Troca de seleção deve cancelar/ignorar resposta atrasada para não exibir detalhe de outra linha. Não há comandos nessa aba.

## Contratos HTTP

Especifique página, endpoint paginado Pedidos e endpoint Confirmados, com envelopes, paginação, filtros, revisão por linha, erros e autorização da spec 01. O relatório da spec 04 reutilizará a mesma especificação semântica de filtros/ordenação, não o envelope paginado.

## Critérios de aceite

- [ ] Período é inclusivo, situação exata e SQL parametrizado.
- [ ] Isolamento por filial ativa é provado e a ordem é estável entre páginas.
- [ ] Projeção completa não gera N+1 e resolve filial física corretamente.
- [ ] Estados, colunas, cores, parâmetros e mutabilidade correspondem ao contrato.
- [ ] Rótulos são Aberto/Fechado/Confirmado/Cancelado.
- [ ] Confirmados só aparece para F, não perde itens sem característica e não sofre race de seleção.
- [ ] F9 e Cadastro permanecem com suas responsabilidades atuais.

## Matriz mínima de testes

- registros antes/nas bordas/depois do período para cada A/F/D/C;
- duas filiais, produtos repetidos e múltiplas páginas sem duplicação/omissão;
- isolamento por requisitante, filtro malformado e tentativa de injeção;
- filial comum e V para ambos os estoques e Reserva Prévia;
- nota/estoque/característica ausentes;
- detalhe sem `dadofiscal`, com um/múltiplos itens e mudança rápida de seleção;
- Feature dos envelopes, revisão, parâmetros, autorização e 422;
- Vitest de defaults, Gerar/Enter/F7, estados, seleção, cores, colunas condicionais, edição só de Pedida e aba Confirmados;
- regressão do F9 e da UI do Cadastro.

## Saída esperada do SpecKit

Produza spec e plano executáveis com SQL/projeções, paginação, contratos JSON/Inertia/TypeScript, árvore React, estado, acessibilidade, sequência e matriz de testes. Não implemente nesta etapa.

## Fora de escopo

- capability/fundação já definida na spec 01;
- persistir quantidade ou cancelar (spec 03);
- PDF (spec 04);
- incluir, somar, alterar produto/filiais/observação ou `qtderecebida`;
- separação, transferência, expedição e recebimento;
- copiar tecnologia/aparência Delphi.
```
