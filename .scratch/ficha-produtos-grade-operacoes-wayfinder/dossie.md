# Dossiê — Correção da grade e operações da Ficha de Produtos

Triage: ready-for-agent

## 1. Finalidade

Este documento é a fonte autoritativa e autocontida para especificar uma correção do módulo Laravel já implementado **Estoques → Ficha de Produtos**. O trabalho não cria o módulo novamente e não deve consultar o Delphi. A análise do legado e do Laravel atual já foi concluída.

O objetivo é corrigir exclusivamente:

- catálogo, defaults, grupos e apresentação das colunas de Movimentos e Lotes;
- ordem semântica das linhas;
- botões de visão que substituem operações legadas;
- legenda da operação;
- preferências da grade;
- busca e exportação;
- autorização de dados financeiros.

## 2. Regra de fontes para o futuro executor

O executor não possui acesso ao Delphi e não deve procurar, solicitar, citar ou depender de arquivos Delphi. Não criar tarefas de “investigar o legado” ou “confirmar no Delphi”. Este dossiê contém o contrato já levantado.

O executor deve inspecionar somente o Laravel atual para localizar os nomes concretos e integrar a mudança aos componentes, serviços, catálogos, DTOs, repositories, rotas e testes existentes. Divergência do Laravel em relação a este documento é lacuna de implementação, não dúvida de requisito.

## 3. Escopo e preservação obrigatória

### Incluído

- grades das perspectivas Movimentos e Lotes;
- catálogos e preferências do `ErpPreferenceDataGrid`;
- botões de visão e seus estados;
- operação compacta e suas 14 posições;
- busca da grade sobre o extrato completo;
- exportação do extrato completo;
- autorização financeira em todas as fronteiras;
- testes backend e frontend correspondentes.

### Preservar sem regressão

- filtros atuais de produto, lote, filiais, tipo, período e avulsos;
- geração síncrona e paginada já implementada;
- queries, snapshots, saldo anterior e cálculo de custo médio, salvo adaptação estritamente necessária para busca/exportação;
- lookups e validações existentes;
- perspectivas Movimentos/Lotes;
- seleção de linha e histórico por contrato;
- cancelamento, estados de carregamento, vazio, erro e resultado obsoleto;
- capacidades de acesso e escopo de filiais já existentes;
- natureza estritamente somente leitura.

### Fora de escopo

- criar, alterar ou excluir movimentos;
- edição inline, F5/salvar ou correção financeira;
- alterar triggers, snapshots ou regras de estoque;
- reformular filtros, lookups, saldo anterior ou histórico contratual;
- reescrever o módulo completo;
- criar atalhos de teclado;
- investigar Delphi.

## 4. Semântica: extrato do produto na filial

A grade é um **extrato histórico do produto na filial**. A sequência das linhas faz parte do significado e não é uma preferência do usuário.

Ordem canônica obrigatória:

1. `filial`;
2. `produto`;
3. `data`;
4. `lancto`;
5. somente se necessário, chave técnica estável do movimento/lote como desempate, sem mudar a precedência anterior.

Requisitos:

- remover ordenação interativa dos cabeçalhos;
- não persistir preferência de ordenação;
- manter a ordem em todas as páginas, perspectivas, buscas e exportações;
- filtrar/buscar pode reduzir linhas, nunca mudar sua ordem relativa;
- a ordem visual das **colunas** continua configurável e não se confunde com a ordem das linhas.

## 5. Catálogo informacional completo

As perspectivas devem possuir capacidade informacional equivalente para todos os conceitos aplicáveis. Movimentos lê o evento mestre; Lotes lê sua projeção por lote. Campo inaplicável ou ausente pode ser nulo, mas não se deve manter o catálogo de Lotes artificialmente reduzido a 13 colunas.

### Identidade, tempo e contexto

- número do movimento;
- lançamento (`lancto`);
- data;
- processamento com data/hora;
- filial e nome da filial;
- produto, quando necessário no payload/exportação para materializar a ordem, embora a consulta filtre um produto;
- tipo do movimento e descrição;
- ID/número do lote;
- contrato;
- referência;
- cliente/fornecedor.

### Evento e operação

- quantidade;
- operação compacta original;
- EST — Em estoque;
- RES — Reservado;
- TRÂ — Trânsito;
- DEM — Demonstração;
- CON — Conserto;
- FUT — Futuro;
- DAN — Danificado;
- FÍS — Estoque físico;
- PRV — Reserva prévia;
- U.ENT — Última entrada;
- U.COMP — Última compra;
- FIN — Financeiro;
- TVEN — Totalização de venda;
- TCOM — Totalização de compra.

TCOM é obrigatório. O erro legado que o deixava fora do ciclo não é requisito.

### Saldos acumulados

- em estoque;
- reservado;
- trânsito;
- demonstração;
- conserto;
- futuro;
- danificada;
- estoque físico;
- reserva prévia.

Reserva prévia é obrigatória no grupo. Custo médio não pertence a Saldos.

### Custos, fiscal e pedidos

Protegidos por autorização financeira quando revelam custo/valor:

- financeiro acumulado;
- valor/custo do movimento;
- custo médio;
- preço com ICMS;
- preço sem ICMS;
- alíquota de IPI;
- moeda e descrição;
- valor em moeda.

Campos de pedidos disponíveis no catálogo:

- pedido de cotação;
- pedido em aberto.

### Auditoria

- ID e nome do executor/usuário logado;
- ID e nome do autorizador, anuláveis.

## 6. Visão padrão e disponibilidade manual

A visão padrão deve preservar o núcleo útil já entregue pelo Laravel, sem abrir automaticamente grupos analíticos extensos ou financeiros:

1. Movimento;
2. Lançamento;
3. Data;
4. Processamento;
5. Filial;
6. Nome da filial;
7. Tipo;
8. Descrição do tipo;
9. Lote;
10. Contrato;
11. Quantidade;
12. Operação compacta;
13. Executor.

Todas as demais colunas autorizadas ficam disponíveis em **Campos da Grade** e/ou nos botões de visão. O mesmo conceito de defaults deve valer em Movimentos e Lotes; Lote pode aparecer primeiro na perspectiva Lotes sem retirar os demais campos disponíveis.

Não autorizado significa inexistente no catálogo entregue ao cliente, e não apenas oculto por default.

## 7. Botões de visão

Não criar Alt+F5, Alt+F7, Alt+F8 nem outro atalho. Os botões são visíveis, autoexplicativos, combináveis e acessíveis por Tab/Enter/Espaço nativos.

### Referência

Ativa/desativa o conjunto de referência e identificação contextual, incluindo Referência e os identificadores relacionados já disponíveis na perspectiva.

### Operação

Ativa/desativa as 14 colunas EST–TCOM e mostra uma legenda visível. Cada posição apresenta seu caractere histórico e tooltip:

- `+`: adição;
- `-`: redução;
- `*`: posição ignorada nos fluxos conhecidos;
- qualquer outro caractere é preservado literalmente, sem significado inventado.

### Cliente/Fornecedor

Ativa/desativa a contraparte resolvida do movimento.

### Saldos do movimento

Ativa/desativa exatamente os nove saldos: Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Estoque físico e Reserva prévia.

Não inclui Custo médio nem outro campo financeiro.

### Visão de custos

Só existe no catálogo/UI para usuário com capacidade financeira. Ativa/desativa Financeiro, Valor/custo, Custo médio, Preço com ICMS, Preço sem ICMS, IPI, Moeda/descrição e Valor em moeda. É exclusivamente leitura.

### Restaurar visão padrão

Desativa todos os grupos temporários e retorna aos defaults, sem apagar preferências permanentes do usuário.

### Estado dos botões

- múltiplos botões podem ficar ativos simultaneamente;
- botão ativo possui estado visual e acessível inequívoco (`aria-pressed` ou padrão equivalente);
- clicar novamente desativa somente aquele grupo;
- estados são temporários durante a sessão/consulta;
- ao reabrir a tela, inicia-se na visão padrão;
- mudar entre Movimentos e Lotes deve aplicar coerentemente os grupos ativos aos conceitos existentes na perspectiva.

## 8. Preferências permanentes

Continuar reutilizando a infraestrutura existente da grade para persistir por usuário:

- ordem visual das colunas;
- largura;
- seleção manual em **Campos da Grade**.

Os grupos temporários não são gravados como preferência permanente. Restaurar visão não apaga preferências. A evolução dos catálogos deve incrementar/reconciliar o schema para que preferências versão 1 não escondam silenciosamente novas colunas nem preservem IDs removidos.

Preferências são validadas contra o catálogo **autorizado para aquele usuário**. IDs financeiros não autorizados devem ser descartados server-side, inclusive de preferências antigas.

## 9. Somente botões, sem atalhos

- **Gerar** funciona pelo botão e não exibe/não implementa F6;
- Enter na data final não dispara consulta;
- **Campos da Grade** funciona pelo botão e não implementa Alt+G;
- **Exportar** funciona pelo botão e não implementa Ctrl+X;
- não implementar Alt+F5/F7/F8;
- remover menções visuais a esses atalhos neste módulo;
- manter somente o comportamento nativo de acessibilidade Tab/Enter/Espaço.

## 10. Busca server-side

Substituir a busca local sobre 50 linhas por busca no extrato completo no servidor:

- usa os mesmos filtros e escopo autorizado da geração;
- preserva a ordem canônica;
- reinicia na primeira página ao aplicar ou limpar o termo;
- informa “N resultados encontrados no extrato”;
- pesquisa somente campos textuais e identificadores allowlisted;
- não pesquisa nem revela campos financeiros ocultos;
- usa bindings e limites de tamanho;
- não transforma a busca em ordenação ou consulta separada sem o snapshot dos filtros gerados.

## 11. Exportação server-side

Substituir a exportação local da página carregada por exportação do extrato completo:

- usa os filtros exatos da consulta gerada e seu escopo de filiais;
- preserva a ordem `filial, produto, data, lancto`;
- exporta somente colunas visíveis/autorizadas, incluindo grupos temporários ativos e escolhas manuais;
- informa o total exportado;
- não oferece ordenação diferente;
- aplica allowlist server-side de IDs de coluna;
- não inclui metadados, colunas ou valores financeiros sem capacidade;
- respeita a capacidade de exportação existente;
- pode seguir a estratégia já estabelecida para volume, sem alterar a geração principal síncrona.

## 12. Autorização financeira end-to-end

O filtro atual somente no React não é suficiente. Para usuário sem capacidade financeira, dados financeiros devem estar ausentes de:

1. catálogo Inertia/JSON;
2. rows e saldo anterior;
3. DTO serializado;
4. opções e validação de preferências;
5. busca;
6. exportação;
7. logs e mensagens de erro.

O backend deve construir/filtrar o catálogo autorizado antes de enviá-lo ao navegador e usar a mesma visão autorizada na validação de preferências e exportação. Parâmetros manipulados nunca ampliam capacidade. **Visão de custos** não deve sequer aparecer para usuário não autorizado.

## 13. Formatação

- datas em `DD/MM/AAAA`;
- processamento inclui horário;
- quantidades e saldos seguem a máscara/precisão vigente do domínio;
- financeiro, custo, preços, IPI e pedido de cotação: duas casas quando aplicável;
- pedido em aberto: três casas;
- valor em moeda: seis casas;
- códigos compactos de operação mantêm label e tooltip;
- valores nulos permanecem distinguíveis de zero.

## 14. Responsividade e acessibilidade

- manter cabeçalho fixo e scroll horizontal/vertical para a grade extensa;
- botões podem quebrar linha sem sobrepor a grade;
- estado ativo não depende somente de cor;
- botões têm nome acessível e estado anunciado;
- seletor, legenda, paginação e mensagens são navegáveis por teclado padrão;
- não exigir gesto oculto, modificador ou clique em título de coluna.

## 15. Comportamentos proibidos

- ordenar linhas por cabeçalho;
- buscar ou exportar somente a página atual sem declaração;
- enviar catálogo financeiro e ocultá-lo apenas no frontend;
- reproduzir índices físicos de coluna do Delphi;
- omitir TCOM ou Reserva prévia por erro de limite;
- incluir Custo médio em Saldos do movimento;
- reexpor financeiro ao alternar visões;
- editar/salvar qualquer movimento;
- reimplementar atalhos;
- alterar filtros, queries históricas, snapshots ou painel contratual sem necessidade deste escopo.

## 16. Critérios de aceite

1. Movimentos e Lotes oferecem o catálogo completo dos conceitos aplicáveis; Lotes não permanece limitado a 13 colunas.
2. A visão padrão contém exatamente as 13 colunas definidas, com Lote podendo liderar sua perspectiva.
3. Cabeçalhos não ordenam linhas e nenhuma preferência armazena ordenação.
4. Todas as páginas preservam `filial, produto, data, lancto` e desempate estável.
5. Referência, Operação, Cliente/Fornecedor, Saldos e Custos são botões combináveis com estado anunciado.
6. Operação exibe as 14 posições, inclusive TCOM, e a legenda visível.
7. Saldos contém os nove campos, inclusive Reserva prévia, e nunca Custo médio.
8. Visão de custos é somente leitura e inexiste para usuário sem capacidade.
9. Restaurar visão remove grupos temporários sem apagar preferências permanentes.
10. Reabrir a tela não restaura grupos temporários da sessão anterior.
11. Movimentos e Lotes aplicam coerentemente os mesmos grupos conceituais.
12. Campos da Grade persiste somente apresentação permitida e reconcilia o novo schema.
13. Usuário sem financeiro não recebe IDs, metadados ou valores financeiros em nenhuma fronteira.
14. Gerar, Campos da Grade e Exportar são botões sem indicação/handler de atalho.
15. F6, Enter na data final, Alt+G, Ctrl+X e Alt+F5/F7/F8 não disparam ações.
16. Busca consulta o extrato completo no servidor, preserva ordem, pagina e informa total.
17. Busca não considera dados financeiros ocultos.
18. Exportação contém o extrato completo filtrado, não apenas a página, na ordem canônica.
19. Exportação contém exatamente colunas visíveis e autorizadas e informa total.
20. Seleção de linha e histórico por contrato continuam funcionando.
21. Filtros, lookups, geração síncrona, saldo anterior, snapshots e cálculos não sofrem regressão.
22. Não existem endpoints ou controles de escrita.

## 17. Testes mínimos

### Backend

- catálogo Movimentos/Lotes completo e defaults esperados;
- catálogo autorizado com/sem financeiro;
- preferência manipulada com ID financeiro rejeitada/descartada;
- ordem estável com duas filiais, datas e lançamentos iguais;
- busca sobre registros fora da primeira página;
- busca preservando ordem e bloqueando campo financeiro;
- exportação com mais de uma página, filtros e ordem canônica;
- exportação autorizada e não autorizada;
- ausência de rotas de escrita;
- regressão dos testes atuais da Ficha.

### Frontend

- cada botão ativa/desativa somente seu grupo;
- combinações de grupos;
- estado visual/acessível ativo;
- legenda e 14 posições, inclusive TCOM;
- Restaurar visão versus preferências permanentes;
- troca Movimentos/Lotes;
- ausência de Visão de custos sem capability;
- ausência de handlers/labels de atalhos;
- cabeçalho sem sorting;
- busca server-side, total e reset de página;
- exportação envia colunas/grupos autorizados;
- responsividade e navegação padrão por teclado.

## 18. Estado Laravel conhecido que deve ser corrigido

- Movimentos possui 27 colunas/16 visíveis; Lotes somente 13;
- DTO já possui parte dos dados ausentes dos catálogos;
- `operacao_posicoes` e `operacao_legend` já são calculados, mas não renderizados;
- catálogo financeiro completo ainda chega ao cliente e é filtrado no React;
- busca e sorting são locais à página;
- exportação genérica serializa somente rows carregadas;
- F6 é apenas texto decorativo na barra;
- Alt+G e Ctrl+X vêm do grid genérico;
- preferências persistem visibilidade, ordem visual e largura por perspectiva;
- a tela e as rotas já são somente leitura.

O executor deve reutilizar e adaptar essas peças, não duplicá-las nem reconstruir o módulo.

## 19. Próximo passo

Executar:

`$to-spec .scratch/ficha-produtos-grade-operacoes-wayfinder/dossie.md`

O prompt produzido deve ser salvo junto aos demais documentos do módulo, sugerido como:

`modules/estoque/ficha-produtos/10-speckit-prompt-correcao-grade-operacoes.md`

Ele deve ser autocontido, mandar o executor inspecionar somente o Laravel atual e proibir investigação no Delphi.
