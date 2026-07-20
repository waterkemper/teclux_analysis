# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional e técnica para finalizar a migração da Conferência de Produtos do Cadastro de Orçamentos do ERP tecLUX, do Delphi para o Laravel.

## Objetivo

Disponibilizar no Cadastro de Orçamentos uma ação "Conferir produtos" que reutilize a tela e o motor de conferência já usados pelo Cadastro de Listas Padrão, introduzindo um contexto `ORC` verdadeiramente reutilizável e aplicando as consequências corretas sobre `disponibilizarparavenda`.

Não crie uma segunda tela ou um fluxo exclusivo duplicado. A conferência é um recurso transversal: cada módulo de origem fornece identidade, itens esperados, permissões, capacidades, navegação e consequências, enquanto o motor compartilhado trata leituras, divergências, persistência e apresentação comum.

## Vocabulário e regra central

Conferência de Produtos é a verificação quantitativa dos Produtos de um documento, comparando as quantidades esperadas com as quantidades lidas ou digitadas. Ela está completa somente quando, para todos os itens, `quantidade_lida == quantidade_esperada`. Tanto falta quanto excesso são divergências.

Esta funcionalidade não é cadastro de conferências, inventário ou conferência de estoque.

## Contexto confirmado pelo responsável de domínio

- [CONFIRMADO] Existem dois parâmetros que atuam conjuntamente:
  - `CONFERÊNCIA DE PRODUTOS NO ORÇAMENTO`;
  - `Mensagem de produtos não conferidos ao emitir a NF`.
- [CONFIRMADO] Somente quando os dois parâmetros estão ativos, um orçamento aberto com conferência divergente deve ficar indisponível para o Frente de Caixa.
- [CONFIRMADO] A atuação conjunta dos dois parâmetros é intencional, não um bug legado.
- [CONFIRMADO] A ação de conferência pode ser usada voluntariamente mesmo com um ou ambos os parâmetros desligados.
- [DECISÃO NOVA] Ao concluir exatamente a conferência, o orçamento deve ser marcado automaticamente e imediatamente como disponível, sem exigir nova gravação do cadastro.
- [DECISÃO NOVA] A reativação automática só pode ocorrer se a própria conferência tiver causado a indisponibilidade. Indisponibilidade manual ou causada por outra regra deve ser preservada.
- [CONFIRMADO] Se produtos do orçamento mudarem, produtos inalterados preservam leituras, produtos novos começam em zero, removidos deixam a conferência e alterações de quantidade preservam a leitura e recalculam falta/excesso.
- [CONFIRMADO] Se essa reconciliação criar nova divergência e os dois parâmetros estiverem ativos, a indisponibilidade deve ser reaplicada.
- [CONFIRMADO] Para `ORC`, produto inesperado deve ser rejeitado. Apenas o contexto de Lista Padrão (`LPA`) pode oferecer inclusão de inesperado.
- [CONFIRMADO] A tela deve continuar reutilizável por outros módulos.
- [CONFIRMADO] Visualização segue a permissão de consulta do orçamento. Ler/digitar, reiniciar e salvar exigem permissão de alteração do orçamento; não devem exigir permissão de Listas Padrão.

## Evidências Delphi

Analise PAS e DFM conjuntamente ao validar a especificação. Use as evidências abaixo, sem transformar limitações do legado em requisitos:

- [CONFIRMADO] `delphi/apps/vendas/fmorcamentos.pas`, próximo das linhas 1958–1962: `sbnConferir` é habilitado quando existe registro, a situação é `A` e não há gravação pendente.
- [CONFIRMADO] `delphi/apps/vendas/fmorcamentos.dfm`, próximo das linhas 2990–3058: existe o botão na área de Produtos com a dica "Conferir as quantidades dos produtos".
- [CONFIRMADO] `delphi/apps/vendas/fmorcamentos.pas`, próximo das linhas 2512–2525: a ação chama a função compartilhada `ConferirProdutos`, passando os produtos do orçamento, campos de código/descrição/quantidade, tipo `ORC`, código do orçamento e grades.
- [CONFIRMADO] A ação não depende dos dois parâmetros, o que comprova o uso voluntário.
- [CONFIRMADO] `delphi/apps/vendas/dmorcamentos.pas`, próximo das linhas 2687–2715: o orçamento é persistido antes da verificação; sob os parâmetros aplicáveis, itens pendentes produzem mensagem e podem definir `disponibilizarparavenda=false`.
- [CONFIRMADO] `delphi/apps/vendas/dmorcamentos.pas`, próximo das linhas 2717–2745: observações/séries dos produtos também podem causar indisponibilidade. Portanto, a conferência não é dona exclusiva do booleano.
- [CONFIRMADO] `delphi/apps/vendas/fmorcamentos.dfm`, próximo das linhas 1540–1547: a disponibilidade também é editável no cadastro.
- [CONFIRMADO] `delphi/apps/caixa/fmfrentecaixa.pas`, próximo das linhas 1942–1951: a consulta de orçamento do Frente de Caixa filtra `coalesce(o.disponibilizarparavenda,false)`, além de situação e validade.
- [CONFIRMADO] A tela compartilhada está em `delphi/repositorio/fmConferenciaProdutos.pas` e `.dfm`, herdando de `TfrmAjuda`, e é chamada por Orçamentos, Contratos, Lista Padrão, notas e transferências.
- [CONFIRMADO] A tela Delphi oferece código de barras/código do produto, `QTD*CODIGO`, quantidades esperada/lida/faltante/excedente, grades, composto, fotos, salvamento parcial, reinício total ou de divergentes e impressão.
- [CONFIRMADO] Produtos inesperados são incluíveis somente em `LPA`; para `ORC` são recusados.
- [CONFIRMADO] A persistência usa cabeçalho `conferencia`, linhas `produtosconferencia` e componentes `produtosconferenciacompostos`.
- [CONFIRMADO] Quando a característica do produto é composta e determina conferência de composto, os componentes são conferidos e o progresso do pai deriva do número mínimo de kits completos. Caso contrário, confere-se o produto principal.
- [CONFIRMADO] Em `ORC`, ocorrências repetidas de um produto são agregadas pela quantidade.
- [POSSÍVEL BUG LEGADO] `delphi/repositorio/dmDicionarioDados.pas`, próximo das linhas 372–506, considera pendência apenas quando esperado é maior que lido. Isso ignora excesso e pode comparar linhas isoladas contra uma leitura agregada. Não reproduzir: a regra de destino é igualdade exata após agregação autoritativa.
- [DIVERGENTE] O Delphi não reativa automaticamente o orçamento ao completar a conferência. A reativação é uma decisão nova explícita e deve ser implementada com proteção às demais causas de indisponibilidade.

## Estado atual do Laravel

Considere como base a implementação existente, mantendo suas partes reutilizáveis e removendo acoplamentos somente quando necessário:

- [CONFIRMADO] O núcleo existente inclui `app/Application/Cadastros/Conferencia/ConferenceEngine.php`, contrato de adaptador, resolvedor e persistência legada.
- [CONFIRMADO] Apenas o adaptador `LPA` está registrado atualmente.
- [CONFIRMADO] `LpaConferenceAdapter` carrega itens esperados, aceita inesperados e expõe capacidades próprias de Lista Padrão.
- [DIVERGENTE] `ConferenciasController` autoriza operações com policies de Lista Padrão e fornece navegação/relatório específicos de `LPA`, mesmo quando o motor recebe outro tipo.
- [DIVERGENTE] As rotas atuais de conferência estão no módulo de Listas Padrão.
- [DIVERGENTE] `resources/js/Pages/Cadastros/Conferencias/Show.tsx` aparenta ser compartilhável, mas contém endpoints, retorno e confirmação de salvamento específicos de Lista Padrão.
- [DIVERGENTE] A confirmação para excluir não lidos da lista deve existir apenas como capacidade de `LPA` e nunca aparecer em `ORC`.
- [DIVERGENTE] A apresentação atual pode colorir um item com somente excesso como concluído. Excesso deve ser divergente.
- [DIVERGENTE] A chave visual baseada apenas em produto/número não distingue adequadamente o mesmo componente usado por compostos pais diferentes.
- [DIVERGENTE] O salvamento atual aceita itens enviados pelo cliente com confiança excessiva. Em `ORC`, o servidor deve reconstruir e validar a lista autoritativa.
- [DIVERGENTE] A consulta atual pode criar o cabeçalho de conferência. Uma consulta autorizada apenas para visualização não pode produzir efeito persistente.
- [DIVERGENTE] A persistência atual apaga e reinsere linhas sem controle explícito de concorrência e ainda não persiste adequadamente o modo de componentes.
- [CONFIRMADO] Há testes funcionais da conferência `LPA`, incluindo fluxo, inesperados, reinício, salvamento, apresentação, relatório e extensibilidade. Eles devem permanecer como regressão.
- [CONFIRMADO] O Orçamento Laravel já possui policy de consulta/alteração, situação, estado dirty do formulário, comando de operações e o campo `disponibilizarparavenda`.
- [CONFIRMADO] Os dois parâmetros já são conhecidos no manifesto/bundle de parâmetros, embora o segundo ainda não participe do fluxo de orçamento.
- [NÃO LOCALIZADO] Não foi localizado no Laravel atual o consumidor de Frente de Caixa equivalente ao Delphi. O escopo desta especificação termina em manter corretamente a disponibilidade; não deve implementar o Frente de Caixa.
- [NÃO LOCALIZADO] Não foi localizado um token geral de revisão do orçamento que resolva a concorrência da conferência.

## Requisitos funcionais

### Ação no Cadastro de Orçamentos

1. Adicionar a ação `Conferir produtos` à barra/área apropriada do orçamento.
2. A ação deve apontar para a conferência do tipo `ORC` e do código do orçamento atual.
3. A ação deve ser utilizável quando o orçamento estiver persistido, em situação `A` (Aberto) e sem alterações locais não salvas.
4. Quando houver alterações locais, desabilitar a ação e indicar que é necessário salvar primeiro.
5. A visibilidade/uso voluntário da ação independe dos dois parâmetros de obrigatoriedade.
6. Respeitar `canView` para consulta e `canUpdate` para qualquer mutação.
7. O servidor deve repetir as validações de existência, situação e autorização; não confiar apenas no estado do botão.

### Itens esperados e identidade

8. Criar e registrar um contexto/adaptador `ORC` no resolvedor compartilhado.
9. Carregar os itens esperados exclusivamente dos produtos persistidos do orçamento atual.
10. Agrupar ocorrências do mesmo produto entre linhas/filiais e somar a quantidade esperada, evitando a comparação por linha do possível bug legado.
11. Para itens ordinários agregados de `ORC`, usar uma identidade estável e determinística; não derivar identidade de índice de tela.
12. Enriquecer a apresentação com código visual, descrição, códigos de leitura, grades e fotos disponíveis.
13. Não mostrar preço como requisito do contexto `ORC`; preço é capacidade específica quando o contexto realmente precisar.
14. Se o produto for composto e estiver configurado para conferência de componentes, expandir os componentes com esperado proporcional à quantidade do pai.
15. A identidade persistida/visual de componente deve distinguir ao menos tipo, origem, composto pai, componente e número da ocorrência.
16. Derivar o progresso do pai pelo número de kits completos possível a partir das leituras dos componentes e suas proporções.
17. Se o produto composto não estiver configurado para detalhamento, conferir o próprio produto pai.
18. Rejeitar qualquer produto inesperado em `ORC`, com erro de validação e nenhuma mutação no orçamento ou na conferência.

### Operação compartilhada

19. Reutilizar o parser, motor, tela, totais, fotos e relatório compartilhados.
20. Receber do servidor URLs de estado, leitura, salvamento, reinício, relatório e retorno adequadas ao contexto, em vez de caminhos de Lista Padrão fixos no frontend.
21. Exibir breadcrumb e retorno para Vendas > Orçamentos > orçamento atual.
22. Oferecer alternância entre código de barras e código do produto conforme capacidades/parâmetros existentes.
23. Cada leitura unitária incrementa a quantidade lida em uma unidade.
24. Aceitar `QTD*CODIGO` somente quando a quantidade manual estiver habilitada; validar a permissão também no backend.
25. Validar quantidade não negativa, formato e precisão/máscara aplicável.
26. Exibir esperado, lido, faltante e excedente. Marcar em vermelho qualquer falta ou excesso e como concluído apenas o valor exato.
27. Exibir totais coerentes: quantidade de itens, conferidos, pendentes/divergentes, falta e excesso.
28. Manter foco na entrada após sucesso ou erro, evitar submissões duplicadas durante processamento e preservar o estado local quando uma operação falhar.
29. Permitir salvamento parcial; retornar mensagem de salvo com pendências e o estado da disponibilidade.
30. Oferecer reinício de todos e reinício somente de itens divergentes. Essas alterações podem permanecer locais até salvar.
31. Oferecer impressão/PDF compartilhado com dados e autorização do orçamento.
32. Nunca oferecer em `ORC` a confirmação para remover produtos não lidos da origem.

### Persistência, reconciliação e concorrência

33. Uma simples abertura/consulta não deve criar nem alterar registros. Criar o cabeçalho de forma preguiçosa na primeira mutação autorizada ou usar solução equivalente sem efeito de leitura.
34. No salvamento, recarregar os produtos esperados no servidor e validar todas as identidades e quantidades recebidas. O cliente não pode mudar esperado nem adicionar linhas arbitrárias.
35. Preservar usuário e data da gravação no cabeçalho e linhas conforme o modelo legado aplicável.
36. Persistir produtos compostos na estrutura própria sem colisões de chave.
37. Reconciliar quando os produtos do orçamento mudarem: inalterados mantêm lido; novos começam em zero; removidos são eliminados; mudança de esperado mantém lido e recalcula.
38. A reconciliação deve ocorrer nas operações relevantes de gravação do orçamento e de abertura/salvamento da conferência, garantindo estado autoritativo.
39. Retornar na abertura um token opaco de versão calculado sobre a fotografia dos itens esperados e o estado persistido relevante.
40. Exigir esse token na gravação. Se orçamento/conferência tiver mudado, retornar conflito `409`, não aplicar mutação parcial e orientar recarga.
41. Serializar/usar transação e bloqueio apropriados para que gravações simultâneas da mesma conferência ou alteração concorrente do orçamento não percam leituras nem reativem disponibilidade incorretamente.
42. Retornar após salvar a fotografia autoritativa, o novo token, a completude e a disponibilidade resultante.

### Parâmetros e disponibilidade no Frente de Caixa

43. Definir `gate_ativo = orçamento em situação A AND parâmetro de conferência ativo AND parâmetro de mensagem ativo`.
44. Com `gate_ativo=false`, não bloquear por conferência e não produzir advertência obrigatória; a conferência voluntária continua disponível.
45. Com `gate_ativo=true` e divergência, salvar o orçamento normalmente, definir `disponibilizarparavenda=false`, registrar de forma durável que a conferência causou o bloqueio e retornar advertência com produtos pendentes e CTA para `Conferir produtos`.
46. O fluxo não deve fingir que o orçamento não foi salvo: a resposta e a interface precisam deixar claro o estado persistido.
47. A advertência pode oferecer continuidade e abertura da conferência, mas não deve reproduzir sem análise a semântica confusa de cancelamento posterior à gravação do Delphi.
48. Ao salvar uma conferência exata com `gate_ativo=true`, marcar imediatamente `disponibilizarparavenda=true` somente se um marcador durável comprovar que a conferência causou o `false` e nenhuma outra causa continuar ativa.
49. Não inferir a origem apenas pelo valor atual do booleano. Definir no planejamento uma representação durável e auditável da proveniência do bloqueio.
50. Preservar indisponibilidade manual, validações de séries/observações ou qualquer outro bloqueio presente.
51. Ao salvar conferência parcial/divergente sob gate ativo, manter `false` e o marcador de origem da conferência.
52. Se produtos mudarem depois de uma conclusão e recriarem divergência sob gate ativo, reaplicar `false` e o marcador.
53. Avaliar os valores atuais dos parâmetros dentro de cada operação relevante. Se um deles for desligado, remover em operação futura apenas o bloqueio cuja origem seja comprovadamente a conferência e somente se nenhuma outra causa impedir disponibilidade.
54. Atualização da conferência, marcador e disponibilidade deve ser atômica.

### Autorização e auditoria

55. Consultar a conferência exige a permissão de consulta do orçamento.
56. Leitura/digitação, definição de quantidade, reinício e salvamento exigem permissão de alteração do orçamento.
57. Nenhuma operação `ORC` pode depender de policy, middleware ou permissão de Listas Padrão.
58. Não aceitar alteração por URL direta quando o orçamento estiver fora do estado permitido.
59. Usar os gatilhos de log já existentes no banco como auditoria de alterações; não criar um sistema duplicado de histórico.
60. Remover/evitar logs de depuração de payloads operacionais na conferência. Logs técnicos necessários não devem expor conteúdo sensível.

## Arquitetura esperada

- Manter um único motor e uma única tela de conferência.
- Fazer o contexto/adaptador declarar capacidades como: inesperados permitidos, remoção de não lidos da fonte, colunas adicionais, componentes, autorização, navegação e consequências pós-gravação.
- Retirar acoplamentos de `LPA` do controller/rotas/frontend compartilhado somente na extensão necessária, preservando o comportamento existente de Lista Padrão.
- O adaptador não deve virar um objeto superficial enquanto regras específicas permanecem espalhadas em condicionais por string. Preferir contratos explícitos e funções de contexto.
- Centralizar a definição de completude e divergência para que backend, frontend, relatório e regra de disponibilidade usem a mesma semântica.
- Centralizar a consequência de disponibilidade em serviço de domínio/aplicação transacional que conheça proveniência e outras causas de bloqueio.
- Não executar migrations, Composer, npm, builds, formatadores ou geradores neste workspace de análise. A implementação e os testes serão realizados no checkout de desenvolvimento dentro do WSL/Cursor.

## Critérios de aceitação

1. Um orçamento salvo, aberto e sem mudanças locais apresenta a ação de conferência; um orçamento novo, não aberto ou dirty não permite iniciá-la.
2. Um usuário de consulta abre a tela sem criar registros; ele não consegue ler/digitar, reiniciar ou salvar.
3. Um usuário de alteração abre a conferência do orçamento sem possuir permissão de Lista Padrão.
4. A tela retorna ao mesmo orçamento e não contém textos/URLs/ações exclusivos de Lista Padrão.
5. Os itens esperados correspondem aos produtos atuais persistidos, agregados corretamente quando repetidos.
6. Produto inesperado em `ORC` retorna validação e não cria linha nem altera o orçamento.
7. Falta e excesso são exibidos como divergência; somente igualdade exata é completa.
8. Entrada unitária e `QTD*CODIGO` autorizado atualizam os valores corretamente; quantidade manual desabilitada é recusada também pelo servidor.
9. Salvamento parcial persiste leituras válidas e retorna estado pendente sem excluir produtos do orçamento.
10. A confirmação de remover não lidos continua disponível somente para `LPA` e nunca para `ORC`.
11. Reinício total e de divergentes funcionam sem afetar itens fora do conjunto solicitado.
12. Componentes de compostos são persistidos sem colisão, inclusive quando dois pais usam o mesmo componente.
13. A conferência do pai composto reflete kits completos; produto não configurado para componentes é conferido pelo pai.
14. Produtos inalterados mantêm leituras após editar o orçamento; novos iniciam em zero; removidos desaparecem; quantidade alterada recalcula divergência preservando leitura.
15. Com qualquer combinação dos parâmetros diferente de ambos ativos, a conferência não veta a disponibilidade.
16. Com ambos ativos e divergência, salvar o orçamento funciona, retorna advertência/CTA e deixa-o indisponível.
17. Completar exatamente a conferência reativa imediatamente um orçamento bloqueado pela conferência.
18. Completar a conferência não reativa orçamento bloqueado manualmente ou por outra validação.
19. Alterar produtos após a conclusão e recriar divergência reaplica o bloqueio quando ambos os parâmetros estão ativos.
20. Um token obsoleto retorna `409`, preserva o estado persistido e oferece recarga.
21. Operações concorrentes não causam perda silenciosa nem reativação indevida.
22. A consulta não persiste efeitos e payload adulterado não muda itens esperados.
23. O salvamento retorna estado autoritativo, completude, disponibilidade e novo token.
24. O relatório/PDF funciona no contexto do orçamento e respeita sua autorização.
25. Todos os testes existentes de `LPA` continuam passando, incluindo as capacidades exclusivas desse contexto.

## Estratégia de testes obrigatória

Priorize testes funcionais HTTP no maior seam observável para `ORC`:

- abertura sem efeito persistente;
- consulta versus alteração;
- elegibilidade por situação/registro;
- agregação de esperado;
- falta, excesso e igualdade;
- parsing e bloqueio de quantidade manual;
- rejeição de inesperado e payload adulterado;
- componentes e chaves sem colisão;
- salvamento parcial e retomada;
- quatro combinações dos parâmetros;
- bloqueio, proveniência e reativação protegida;
- reconciliação após editar produtos;
- conflito de versão e concorrência;
- relatório e navegação.

Mantenha testes de regressão de `LPA`. Use testes frontend apenas para comportamento exclusivamente visual, como estado do comando, foco, cores, mensagens, URLs fornecidas pelo servidor e ausência da confirmação de exclusão no contexto `ORC`. Use testes unitários menores para parser e cálculo puro de kits quando isso não puder ser coberto claramente pelo seam funcional.

## Fora de escopo

- Implementar o Frente de Caixa no Laravel.
- Migrar conferência de Contratos, notas, transferências ou outros tipos.
- Alterar regras funcionais de Lista Padrão, exceto separação compatível de capacidades e correção compartilhada da indicação de excesso.
- Redesenhar o cadastro completo de Orçamentos ou Produtos.
- Alterar o cadastro administrativo dos parâmetros.
- Executar backfill em massa de conferências antigas.
- Reproduzir o bug legado de aceitar excesso ou comparar linhas isoladas.
- Converter limitações do Delphi em requisitos sem decisão explícita.

Antes de propor tarefas de implementação, documente no spec:

1. o modelo de estados da conferência e da disponibilidade;
2. a representação durável da origem do bloqueio;
3. o contrato do adaptador/contexto `ORC` e as capacidades específicas de `LPA`;
4. a identidade dos itens normais e compostos;
5. o token/estratégia de concorrência;
6. as transações e locks necessários;
7. os contratos HTTP e respostas de erro/advertência;
8. a matriz de parâmetros, permissões e situações;
9. o plano de testes no maior seam funcional;
10. as decisões que ainda precisarem ser classificadas como DÚVIDA ou DECISÃO NOVA.
```
