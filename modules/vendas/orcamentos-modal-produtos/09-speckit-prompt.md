# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional e técnica para revisar e corrigir a modal de inclusão e edição de Produtos no Cadastro de Orçamentos do ERP tecLUX Laravel, comparando integralmente seu comportamento e suas informações com o Delphi.

## Problema

Há pelo menos dois bugs observados no Laravel:

1. a quantidade de uma linha existente não pode ser editada de forma confiável;
2. manter `F5` pressionado dispara confirmações repetidas e soma indefinidamente a quantidade.

O problema estrutural é que inclusão, edição, soma por novo bipe, quantidade preparada, lookup, refresh assíncrono e confirmação convergem no mesmo modal e compartilham estado residual. A especificação deve separar explicitamente intenções e garantir que cada interação física produza no máximo uma consequência de negócio.

Além dos bugs conhecidos, faça uma análise completa das discrepâncias de campos, tabs, parâmetros, permissões, validações e efeitos do modal Delphi em relação ao Laravel.

## Escopo

- O destino funcional é o Cadastro de Orçamentos.
- O modal Laravel é compartilhado por Produtos de Venda; preserve o núcleo reutilizável e crie regressão para outros consumidores.
- Não migrar regras específicas de Contratos ou de outros documentos nesta feature.
- Não reproduzir limitações visuais ou possíveis bugs Delphi.

## Evidências Delphi iniciais

Analise PAS e DFM conjuntamente, incluindo ancestors, data modules e units compartilhadas:

- `delphi/apps/vendas/fmprodutosorcamento.pas/.dfm` contém a modal de Produto do Orçamento.
- `delphi/apps/vendas/fmorcamentos.pas/.dfm` abre a mesma modal para inclusão ou edição, preparando antes o data module para a operação escolhida.
- `delphi/apps/vendas/dmorcamentos.pas/.dfm` contém criação/edição das linhas, seleção do Produto, regras de quantidade, consultas auxiliares, validações e cálculos.
- [CONFIRMADO] Na edição, a quantidade é vinculada à linha existente e a alteração representa substituição do valor.
- [CONFIRMADO] `ConfirmarQuantidade` registra que o Usuário alterou/confirmou deliberadamente a quantidade antes de informar o Produto.
- [CONFIRMADO] Sem quantidade confirmada, rebipar o mesmo Produto incrementa uma unidade, e um novo Produto não deve herdar a quantidade visível do anterior.
- [CONFIRMADO] `ValordaQuantidade` influencia o valor padrão/foco da inclusão nova, mas não transforma o rebipe de uma linha existente em incremento desse valor; rebipe comum representa `1`.
- [CONFIRMADO] `GravarProdutoContratoAutomaticamente` altera a confirmação após localizar o Produto.
- [CONFIRMADO] `AbrirConsultaAutomaticamente` pode abrir a pesquisa na inclusão.
- [CONFIRMADO] `FiliaisIndependentes` altera a apresentação/obrigatoriedade da Filial e dos estoques.
- [CONFIRMADO] Permissões e Autorizações controlam preço e desconto.
- [CONFIRMADO] O modal também contém/consulta estoque, similares, grades, pedidos, fornecedores, montagem, entrega, vendedor, observações e fotos.

Classifique cada descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO, POSSÍVEL BUG ATUAL ou DECISÃO NOVA, sempre citando a evidência.

## Estado atual do Laravel

Investigue como um conjunto:

- o modal compartilhado de Produto de Venda;
- o wrapper do modal de Orçamentos;
- a página de Cadastro de Orçamentos e seu grid de Produtos;
- helpers de quantidade;
- endpoints/services de lookup, pesquisa, agenda e autorização;
- recálculo de totais, cashback, frete, financiamento e planos;
- testes funcionais e unitários existentes.

Evidências iniciais:

- [CONFIRMADO] O Laravel já distingue internamente `inclusao` e `edicao`, hidrata a linha e faz refresh assíncrono de informações.
- [CONFIRMADO] Existe helper puro que calcula quantidade padrão, incremento `1`, quantidade confirmada e soma com máscara.
- [CONFIRMADO] Há testes unitários desse helper, mas não foi localizada cobertura suficiente do comportamento integral do modal.
- [POSSÍVEL BUG ATUAL] O listener global de `F5` não rejeita `event.repeat`.
- [POSSÍVEL BUG ATUAL] Vários keydowns podem chamar a confirmação antes de `loading` ser refletido na renderização.
- [DIVERGENTE] Inclusão, edição e soma automática usam um caminho comum de upsert/confirmar, deixando o significado da quantidade dependente de modo e estado residual.
- [DIVERGENTE] Após confirmar, o modal mantém a linha e a quantidade efetiva visíveis; sem um estado de comando consumido, novo `F5` pode reaplicar a operação.
- [CONFIRMADO] A linha automática existente é localizada por Produto e Filial.

## Regras de domínio da quantidade

Implemente e documente a seguinte matriz sem ambiguidades:

### Edição explícita

1. Abrir edição carrega a linha existente e sua quantidade.
2. A quantidade digitada é o valor final absoluto.
3. Se a linha possui `2` e o Usuário informa `5`, o resultado é `5`, nunca `7`.
4. Salvar edição não passa pela regra de incremento da inclusão.
5. Produto e Filial identificam a linha; não criar outra linha ao salvar edição.

### Inclusão e rebipe

6. Um novo bipe do mesmo Produto e Filial incrementa exatamente `1` quando não há quantidade preparada.
7. Se a mesma combinação tinha `5`, um rebipe comum resulta em `6`.
8. O mesmo Produto em outra Filial é uma linha distinta e não soma na Filial anterior.
9. A quantidade atualmente exibida do Produto anterior nunca serve implicitamente como quantidade do próximo.
10. Se o Produto atual mostra `5` e outro Produto é bipado sem preparação, o novo entra com `1`, ressalvado um parâmetro ativo de default de linha nova cuja semântica Delphi seja confirmada.
11. O parâmetro de default de linha nova nunca altera a regra de que rebipe comum de Produto existente soma `1`.

### Quantidade preparada

12. Com o campo de código vazio, alterar e confirmar a quantidade arma uma quantidade de uso único.
13. Se o Produto bipado ainda não existe, essa é sua quantidade inicial.
14. Se o Produto+Filial já existe, essa quantidade é o incremento. Exemplo: existente `5`, preparada `3`, resultado `8`.
15. A quantidade preparada é consumida uma única vez após uma identificação de Produto bem-sucedida.
16. Lookup inválido deve manter ou limpar a preparação segundo uma regra explícita e segura; preferir mantê-la para correção do código, desde que não possa ser reaplicada duas vezes.
17. F3/nova inclusão, fechamento e mudanças de modo limpam a preparação.

### Troca de Produto durante edição

18. Se o Usuário está editando uma linha e bipa outro Produto, a linha original permanece inalterada.
19. Alterações ainda não confirmadas na edição são abandonadas.
20. O Produto lido inicia uma nova inclusão com quantidade `1`/default válido de nova linha, sem herdar a quantidade original ou digitada.
21. A transição deve ser explícita, não um efeito lateral de comparar strings do campo.

### Pós-gravação

22. Manter o Produto recém-gravado visível para conferência.
23. Posicionar o foco no código do Produto e selecionar todo o conteúdo para o próximo bipe.
24. A quantidade mostrada é apenas informativa e não fica preparada.
25. O comando de gravação fica consumido até uma nova interação funcional: novo bipe, alteração deliberada de quantidade, seleção de Produto, F3 ou início de edição.

## Máquina de estados obrigatória

Defina no spec uma máquina de estados/reducer com eventos explícitos. Ela deve distinguir ao menos:

- `inclusao_limpa`;
- `quantidade_preparada`;
- `produto_carregado_para_inclusao`;
- `edicao_explicita`;
- `consultando`;
- `confirmando`;
- `gravado_aguardando_nova_interacao`;
- `erro_recuperavel`.

Eventos mínimos:

- preparar/alterar quantidade;
- bipar/informar código;
- lookup resolvido ou rejeitado;
- iniciar edição;
- iniciar nova inclusão;
- confirmar por F5 ou clique;
- excluir;
- abrir pesquisa;
- resposta de gravação;
- fechar;
- receber bipe durante operação;
- retry/cancelar.

Para cada transição, registre:

- quantidade exibida;
- quantidade preparada e se já foi consumida;
- identidade Produto+Filial;
- intenção `replace`, `insert` ou `increment`;
- foco esperado;
- comandos habilitados;
- efeito local e efeito remoto;
- comportamento diante de erro.

Não derive intenção de negócio apenas de valores exibidos, refs dispersas ou do fato de uma linha já existir.

## F5, comandos e concorrência

1. Ignorar `KeyboardEvent.repeat` para `F3`, `F5`, `F6` e demais comandos mutantes.
2. Estabelecer uma trava síncrona/ref antes do primeiro `await`; não depender apenas do próximo render de `loading`.
3. Botão Gravar e F5 usam exatamente o mesmo command gate.
4. Uma interação física gera no máximo uma mutação.
5. Após sucesso, repetir F5 sem nova interação não altera nada.
6. Associar operações assíncronas a um id/revisão e ignorar respostas stale.
7. Durante lookup/gravação, aceitar no máximo um próximo bipe em fila.
8. Processar esse bipe uma única vez depois da operação atual.
9. Se outro bipe chegar quando a posição já estiver ocupada, não perder silenciosamente: bloquear/avisar com feedback operacional definido.
10. Bipes físicos completos são eventos distintos; repetição automática de tecla não é bipe.
11. Escape, fechamento e unmount cancelam/invalidam operações pendentes para impedir atualização tardia.
12. Em erro recuperável, liberar o command gate sem repetir automaticamente a mutação.

## Informações e tabs a comparar

Produza uma matriz Delphi–Laravel com evidência e decisão para:

- quantidade, unidade e máscara;
- código interno/visual/código de barras e pesquisa;
- descrição, referência, Característica e grades;
- Filial do item e Filiais independentes;
- preço normal, preço aplicado, descrição do preço e promoção;
- desconto em valor e percentual, limites e prova de Autorização;
- vendedor e regras do Usuário vendedor;
- estoque por Filial/depósito, reservado e disponibilidade;
- Produtos similares e troca por similar;
- grades e troca por variação;
- pedidos/quantidades pendentes;
- fornecedores e sua restrição de acesso;
- observações de venda;
- fotos do Produto;
- Produto composto/conjunto quando aplicável;
- montagem;
- entrega, data, hora, período, agenda e aplicação para todos;
- botões, mensagens, cores/indicadores e estados vazios;
- F3, F5, F6, F9, Enter, Escape, duplo clique e foco inicial.

Não assuma que a presença visual de uma tab comprova a regra. Verifique query, evento, service, endpoint, autorização e teste.

## Parâmetros e Permissões

Documente e aplique a matriz dos Parâmetros do Sistema e capacidades que alteram o modal, incluindo ao menos:

- valor/default da quantidade e foco inicial;
- gravação automática após localizar Produto;
- abertura automática da pesquisa;
- Filiais independentes e visualização de estoque por depósito;
- uso de grades;
- preço por cargo;
- alteração de preço;
- desconto do Produto e limites;
- Produto para venda futura;
- montagem e entrega;
- demais parâmetros encontrados no PAS/data module e no payload Laravel.

Para Permissões/Autorizações:

- edição do Orçamento deve estar autorizada e sua Situação permitir alteração;
- preço, desconto, fornecedor/estoque gerencial e vendedor devem seguir as capacidades específicas comprovadas;
- validações críticas devem ser repetidas no servidor;
- ocultar/desabilitar controles não é autorização suficiente;
- não exigir uma Permissão de outro documento por causa do componente compartilhado.

## Efeitos sobre o Orçamento

1. Inclusão, edição, soma e exclusão atualizam a lista local por identidade/número correto.
2. Recalcular total da linha pela quantidade efetiva, preço e desconto.
3. Atualizar totais de Produtos e demais agregados afetados.
4. Recalcular cashback, frete, financiamento e planos somente quando as regras existentes exigirem.
5. Evitar POSTs de recálculo duplicados ou concorrentes; coalescer alterações quando apropriado.
6. Aplicar dados de entrega para todos somente às linhas elegíveis e uma única vez.
7. Marcar o Orçamento dirty após mutação bem-sucedida.
8. Ao fechar a modal com mudanças, preservá-las e tentar o fluxo de gravação/recalculo aplicável.
9. Se faltarem pré-requisitos, manter mudanças na tela principal e informar que o Orçamento ainda precisa ser gravado.
10. Uma falha de persistência/recalculo não deve apagar silenciosamente as linhas editadas; definir rollback ou estado pendente de forma explícita.

## Componente compartilhado

- Manter no núcleo compartilhado: máquina de quantidade, command gate, parsing/máscara, lookup básico, foco/atalhos, apresentação comum e contratos de tabs.
- Fornecer pelo contexto de Orçamento: URLs, autorização, linhas existentes, identidade, parâmetros/capacidades, efeitos em totais/planos e fechamento.
- Evitar condicionais espalhadas por nome de módulo.
- Inventariar todos os consumidores do modal compartilhado e registrar quais contratos legítimos precisam permanecer.
- Adicionar teste fino de regressão para cada consumidor, sem migrar suas regras específicas.

## Critérios de aceitação

1. Editar quantidade `2` para `5` resulta em `5`.
2. Rebipar o mesmo Produto+Filial sem preparação soma exatamente `1`.
3. Rebipar o mesmo Produto em outra Filial não soma na linha anterior.
4. Preparar `3` e bipar Produto novo inclui `3`.
5. Preparar `3` e bipar existente `5` resulta em `8`.
6. A preparação é consumida e o próximo Produto não herda `3`.
7. Produto anterior visível com `5` seguido de outro bipe inclui o novo com `1`/default novo confirmado, nunca `5`.
8. Bipar outro Produto durante edição preserva a linha original e inicia inclusão limpa.
9. Uma gravação bem-sucedida mantém o Produto visível, seleciona o código e desarma quantidade.
10. Manter F5 pressionado gera uma única confirmação.
11. Repetir F5 sem nova interação não altera a quantidade.
12. F5 e botão simultâneos não iniciam duas confirmações.
13. Resposta stale não sobrescreve Produto, quantidade ou modo atual.
14. Um próximo bipe durante operação é processado uma vez; excesso de fila recebe feedback.
15. Quantidade zero, negativa ou inválida é rejeitada sem mutação.
16. Máscara decimal é preservada em exibição, cálculo e payload.
17. Lookup/erro permite correção sem duplicar a operação anterior.
18. F3 limpa edição e preparação.
19. F6 exclui somente a linha selecionada e atualiza totais uma vez.
20. F9/pesquisa e gravação automática respeitam seus parâmetros.
21. Campos e tabs da matriz possuem decisão e evidência explícitas.
22. Preço/desconto/vendedor/fornecedores respeitam Permissão e validação backend.
23. Montagem e entrega não confirmam dados obrigatórios incompletos.
24. Aplicar entrega para todos afeta somente linhas elegíveis.
25. Totais e planos refletem o conjunto final sem requisições concorrentes duplicadas.
26. Fechar com mudanças salva/recalcula quando possível.
27. Sem pré-requisito, as mudanças permanecem pendentes e o Usuário recebe instrução clara.
28. Outros consumidores do modal compartilhado mantêm seus comportamentos legítimos.

## Estratégia de testes obrigatória

Use como seam principal o comportamento funcional do modal de Orçamentos, simulando interações reais e observando linhas, mensagens, foco e requisições.

- Testar toda a matriz de quantidade e identidade.
- Disparar keydowns repetidos com `repeat=true` e combinações rápidas de F5/clique.
- Controlar promises para testar confirmação concorrente, resposta stale, fila de um bipe, erro e retry.
- Verificar contagem e ordem de lookups/recalculos, não detalhes internos de hooks.
- Manter testes unitários do helper apenas para parsing, máscara e aritmética pura.
- Usar feature tests HTTP existentes do Orçamento para lookup, parâmetros, autorização, desconto, entrega e validações.
- Criar um teste fino por consumidor do modal compartilhado.
- Testar resultados externos, não nomes de states, refs ou funções privadas.

## Fora de escopo

- Redesenhar todo o Cadastro de Orçamentos.
- Migrar regras específicas de Contratos ou outros documentos.
- Copiar a disposição visual ou possíveis bugs do Delphi.
- Alterar a identidade Produto+Filial fora deste fluxo.
- Implementar funcionalidades não comprovadas na matriz de lacunas.

Antes de decompor tarefas, a especificação deve apresentar:

1. diagrama/tabela da máquina de estados e eventos;
2. matriz de quantidade com exemplos numéricos;
3. inventário completo de campos/tabs Delphi–Laravel;
4. matriz de Parâmetros, Permissões e validações;
5. contratos de contexto do modal compartilhado;
6. estratégia de command gate, id de operação e fila de bipe;
7. sequência de efeitos no Orçamento e tratamento de falhas;
8. critérios de aceite e plano de testes no maior seam;
9. divergências, dúvidas e possíveis bugs classificados com evidência.
```
