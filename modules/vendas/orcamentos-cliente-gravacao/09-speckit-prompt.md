# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica para concluir no Laravel o fluxo de seleção, troca e remoção do Cliente no Cadastro de Orçamentos e revisar integralmente as validações e os efeitos da gravação.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação. Inspecione o código Laravel e a evidência Delphi antes de concluir e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta.

## Objetivo

O fluxo deve manter coerentes, de forma confirmável e atômica:

- identidade e tipo do Cliente;
- fotografia cadastral mantida no Orçamento;
- preços dos Produtos;
- totais, descontos, cupom, cashback e Crédito de troca;
- Planos e Parcelas;
- Ficha Financeira, alertas e Autorizações;
- contatos e demais vínculos do Orçamento;
- validações e persistência da inclusão e da alteração.

Use `Cliente` como termo canônico dentro do Orçamento mesmo quando o tipo legado selecionado for `F` ou `L`.

## Regras de investigação e evidência

Analise PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, units compartilhadas, eventos, actions, queries, SQL, permissões, Autorizações e Parâmetros do Sistema.

Compare o comportamento Delphi com o Laravel existente. Toda conclusão relevante deve apontar evidência concreta e receber uma das classificações:

- CONFIRMADO;
- INFERIDO;
- DÚVIDA;
- NÃO LOCALIZADO;
- DIVERGENTE;
- POSSÍVEL BUG LEGADO;
- DECISÃO NOVA.

Não transforme automaticamente uma limitação, inconsistência ou bug do Delphi em requisito Laravel. Separe claramente paridade intencional de decisões novas.

## Evidência Delphi já confirmada

### Seleção do Cliente

- [CONFIRMADO] O formulário guarda código e tipo anteriores quando o campo Cliente recebe foco e identifica a troca ao sair.
- [CONFIRMADO] O lookup pode restringir a seleção ao tipo `C` quando `SelecionarSomenteClientesnasVendas` está ativo; sem a restrição, considera o tipo legado selecionado.
- [CONFIRMADO] A seleção copia para o Orçamento dados como nome, tipo/número do documento, estrangeiro, e-mail, telefones, endereço, cargo e indicadores fiscais.
- [CONFIRMADO] O fluxo executa verificações de cashback e Crédito de troca.
- [CONFIRMADO] O fluxo consulta alerta de atualização cadastral, Ficha Financeira, restrição de Analista de Crédito e existência de Orçamentos em aberto.
- [CONFIRMADO] A abertura automática da inclusão de Produtos depende de a Ficha Financeira não ter sido apresentada e das demais condições do formulário.
- [CONFIRMADO] Existe ação manual para abrir a Ficha Financeira do Cliente.

### Ficha Financeira e alertas

- [CONFIRMADO] A Ficha Financeira considera parcelas vencidas, cheques devolvidos, parcelas futuras em aberto e cheques futuros em aberto.
- [CONFIRMADO] Alertas cadastrais e Atendimentos em aberto podem ser exibidos independentemente do painel de débito.
- [CONFIRMADO] `naoexibirfichafinanceira` pode impedir a exibição automática para o Cliente.
- [CONFIRMADO] `MostrarFichaSomenteAtraso` controla se a exibição automática depende de atraso ou de valores em aberto.
- [CONFIRMADO] `PerguntarAntesExibirFicha` controla a confirmação antes da abertura e apresenta os motivos encontrados.
- [CONFIRMADO] `CLIENTE_INADIMPLENTE_SO_COM_ANALISTA_DE_CREDITO`, em conjunto com a restrição do Usuário e a existência de débito, pode exigir Autorização contextual de Analista de Crédito.
- [CONFIRMADO] A existência de Orçamentos em aberto gera aviso no Delphi.
- [CONFIRMADO] `DiasAvisoAtualizarCliente` identifica cadastro desatualizado. Na gravação, a pendência pode impedir a continuidade até que o cadastro seja conferido ou revisado.

### Preços e recálculos

- [CONFIRMADO] Ao resolver um Cliente, o Delphi configura o contexto de markup do Cliente e do cargo.
- [CONFIRMADO] Quando não há Cliente, limpa o markup do Cliente e pode usar `Cargo Tabela Preço Padrão`.
- [CONFIRMADO] Se já existem Produtos e o Orçamento é editável, as linhas são reprecificadas.
- [CONFIRMADO] A análise deve considerar pelo menos `Considerar Markup Clientes`, `Preços por Cargo` e `Cargo Tabela Preço Padrão`.
- [DÚVIDA] A especificação deve fechar, com evidência SQL e de código, a precedência completa entre markup do Cliente, markup/cargo, tabela, promoção e demais exceções.

### Gravação e sincronização cadastral

- [CONFIRMADO] A gravação Delphi exige ao menos um Produto ou Serviço.
- [CONFIRMADO] Havendo montagem, exige Filial de montagem.
- [CONFIRMADO] A gravação persiste Orçamento, Produtos, Serviços, Planos, Parcelas, usuários do site, contatos e outros datasets relacionados.
- [CONFIRMADO] Após a persistência, ainda pode executar Conferência de Produtos, disponibilidade para venda, observações, séries, agendamentos, recálculo de Plano padrão e enquete.
- [CONFIRMADO] Antes de persistir, `AtribuirDadosClienteOrcamentonoCliente` compara dados da fotografia do Orçamento com o cadastro mestre.
- [CONFIRMADO] Para tipo `C`, o Delphi pode atualizar em `clientes`: nome, cargo, tipo/número do documento, estrangeiro, endereço, telefones, e-mail, última alteração e data de alteração do endereço.
- [CONFIRMADO] Para tipo `F`, pode atualizar campos equivalentes em `fornecedores`.
- [CONFIRMADO] Se o endereço do Orçamento estiver incompleto, o Delphi pergunta e pode gravar o endereço da Filial no cadastro mestre.
- [NÃO LOCALIZADO] Não foi localizado nesse método tratamento equivalente explícito para tipo `L`.
- [DECISÃO NOVA] No Laravel, alterações nos dados da fotografia do Cliente dentro do Orçamento devem permanecer restritas ao Orçamento. Não atualizar automaticamente `clientes`, `fornecedores` ou o cadastro da Filial.
- [DECISÃO NOVA] Não reproduzir o fallback que substitui cadastro mestre incompleto pelo endereço da Filial.

### Planos

- [CONFIRMADO] O Delphi possui plano padrão do Cliente condicionado por `CLIENTES COM PLANO PADRÃO`.
- [CONFIRMADO] `PlanoOrcamentoPadrao` pode criar/recalcular um Plano quando o Orçamento permanece sem Planos.
- [CONFIRMADO] `PlanoVendaVista` participa de fluxos financeiros específicos e não deve ser confundido automaticamente com o Plano padrão do Orçamento.
- [DECISÃO NOVA] A precedência Laravel deve ser: Planos definidos manualmente no Orçamento; plano padrão do Cliente quando habilitado e existente; `PlanoOrcamentoPadrao` somente se ainda não houver Plano.
- [DECISÃO NOVA] Trocar Cliente não sobrescreve Planos manuais. Se eles precisarem ser recalculados ou substituídos, solicitar confirmação.

## Estado Laravel já confirmado

- [CONFIRMADO] O cabeçalho possui lookup de Cliente, atribuição da fotografia cadastral e Cadastro Expresso.
- [DIVERGENTE] No fluxo inspecionado, a resolução do lookup atribui `tipocliente = C`, não cobrindo de forma comprovada os tipos `F` e `L` permitidos pelo Delphi.
- [CONFIRMADO] A página observa mudanças do código do Cliente e, havendo Produtos, chama um endpoint de reprecificação.
- [CONFIRMADO] O endpoint recebe Filial, Cliente, cargo e Produtos e recalcula preço e total das linhas.
- [DIVERGENTE] A mudança do Cliente é aplicada ao estado antes da conclusão da reprecificação.
- [DIVERGENTE] Se a reprecificação falha, o erro é ignorado e os preços atuais são mantidos, permitindo misturar novo Cliente com valores do contexto anterior.
- [CONFIRMADO] A atribuição do Cliente também dispara recálculo financeiro e sugestão de Crédito de troca.
- [CONFIRMADO] A consulta de Crédito de troca ignora silenciosamente falhas.
- [CONFIRMADO] Já existe módulo Laravel de Ficha Financeira com services, repositories, policies, Autorizações sensíveis e testes Feature/Unit.
- [NÃO LOCALIZADO] Não foi comprovada a integração automática completa dos alertas Delphi da Ficha Financeira ao fluxo de seleção do Cliente no Orçamento.
- [NÃO LOCALIZADO] Não foi comprovado no fluxo atual o bloqueio de gravação por atualização cadastral pendente conforme `DiasAvisoAtualizarCliente`.
- [CONFIRMADO] O serviço de gravação do Orçamento já usa transação de banco na inclusão e na alteração.
- [CONFIRMADO] O backend já valida ao menos um Produto/Serviço, exatamente um Plano selecionado, dados das Parcelas, Filial de montagem, entrega, elegibilidade de Produtos, preços, descontos, cupom e Autorizações relacionadas.
- [CONFIRMADO] A atualização rejeita Orçamento fora da Situação aberta/editável.
- [CONFIRMADO] O serviço sincroniza cabeçalho, Produtos, Serviços, Planos e Parcelas dentro da transação.
- [DÚVIDA] Verificar contatos, usuários do site, demais vínculos, alertas pós-gravação, concorrência e retorno autoritativo para identificar tudo que ainda está fora da fronteira transacional atual.

## Comportamento funcional obrigatório

### 1. Selecionar ou trocar Cliente

Modele a mudança como transição explícita, não como efeitos independentes disparados depois da mutação do formulário.

1. Resolver o Cliente e validar se seu tipo é elegível conforme `SelecionarSomenteClientesnasVendas`.
2. Obter a fotografia cadastral e o contexto comercial.
3. Se houver Produtos e a mudança puder afetar preços, calcular previamente o impacto.
4. Reavaliar preços, totais, descontos, cupom, cashback, Crédito de troca, Planos e Parcelas.
5. Reunir alertas cadastrais, financeiros e Orçamentos em aberto.
6. Identificar Autorizações necessárias.
7. Exibir ao Usuário um resumo do impacto e pedir confirmação quando houver reprecificação ou substituição financeira relevante.
8. Somente após confirmação aplicar a nova fotografia e todos os valores dependentes.
9. Se o Usuário cancelar, preservar integralmente Cliente, fotografia, Produtos, preços, descontos, benefícios, Planos e Parcelas anteriores.
10. Se qualquer consulta, recálculo ou Autorização falhar, não deixar estado parcial; apresentar erro útil e conservar o snapshot anterior.

Evite múltiplos efeitos concorrentes e respostas tardias. Associe a resposta a uma revisão/operação e impeça que ela sobrescreva uma seleção mais nova.

### 2. Fotografia cadastral

Copiar para o Orçamento os dados atuais necessários do Cliente, incluindo os campos comprovados no Delphi e os campos fiscais/operacionais já adotados no Laravel.

Alterações desses campos no Orçamento são uma fotografia específica da proposta. Ao salvar:

- persistir as alterações somente no Orçamento;
- não atualizar automaticamente Cadastro de Clientes, Fornecedores ou Filiais;
- não utilizar endereço da Filial como substituto para atualizar cadastro mestre;
- se houver necessidade de corrigir o Cadastro de Clientes, oferecer navegação/ação separada sujeita às permissões e validações daquele Cadastro, fora da transação do Orçamento.

Registre essa divergência deliberada na matriz Delphi × Laravel.

### 3. Ficha Financeira, alertas e crédito

Preservar o comportamento parametrizado, reutilizando o módulo de Ficha Financeira existente:

- respeitar `MostrarFichaSomenteAtraso`;
- respeitar `PerguntarAntesExibirFicha`;
- respeitar `naoexibirfichafinanceira` e variantes físicas já suportadas;
- respeitar a restrição do Usuário e `CLIENTE_INADIMPLENTE_SO_COM_ANALISTA_DE_CREDITO`;
- manter ação manual da Ficha Financeira;
- diferenciar Permissão permanente de Autorização contextual.

Débitos, parcelas, cheques, alertas e valores em aberto devem informar. Somente a política configurada de crédito pode bloquear e exigir Autorização.

Quando houver Orçamentos em aberto:

- exibir alerta informativo;
- oferecer ação para consultá-los;
- não bloquear a seleção;
- não desviar automaticamente o Usuário do Orçamento atual.

Quando `DiasAvisoAtualizarCliente` indicar cadastro desatualizado:

- alertar após a seleção;
- permitir marcar como conferido ou abrir o Cadastro para revisão;
- manter a pendência visível;
- impedir a gravação enquanto a conferência obrigatória permanecer pendente;
- não considerar a simples edição da fotografia do Orçamento como conferência do Cadastro.

### 4. Preços e Produtos

Feche e documente a precedência autoritativa de preços a partir do Delphi e do Laravel atual.

Considere explicitamente:

- markup específico do Cliente;
- `Considerar Markup Clientes`;
- cargo do Cliente;
- `Preços por Cargo`;
- `Cargo Tabela Preço Padrão` quando não houver Cliente/contexto aplicável;
- preço normal, promoção, tabela e demais exceções comprovadas;
- Filial do Produto e Filial do Orçamento;
- descontos de item e Autorizações existentes.

O backend deve reconstruir preços autoritativamente. Não aceite preços arbitrários enviados pelo navegador.

Após reprecificar, recalcular uma única vez e na ordem correta: linhas, total de Produtos, descontos/cupom/cashback, total financiável, Planos e Parcelas.

### 5. Planos de pagamento

Use a precedência:

1. Planos manuais já definidos no Orçamento;
2. plano padrão do Cliente quando `CLIENTES COM PLANO PADRÃO` estiver habilitado e houver plano válido;
3. `PlanoOrcamentoPadrao` somente quando o Orçamento continuar sem Plano.

Regras:

- não sobrescrever Plano manual apenas pela troca do Cliente;
- identificar se os Planos atuais ficaram incompatíveis com valores, Cliente ou regras de crédito;
- pedir confirmação antes de recalcular/substituir Planos manuais;
- recalcular Parcelas de forma coerente com o Plano efetivo;
- separar claramente o uso de `PlanoVendaVista` dos defaults acima;
- não conservar Plano ou Parcelas antigas quando o recálculo confirmado falhar;
- cancelar integralmente a transição do Cliente nesse caso.

### 6. Remover Cliente

Exigir confirmação. Depois de confirmada a proposta de remoção:

- manter Produtos e Serviços;
- limpar identidade e fotografia derivada do Cliente;
- recalcular Produtos sob a regra sem Cliente e cargo/tabela padrão aplicável;
- revalidar descontos, cupom, cashback e Crédito de troca;
- limpar benefícios exclusivos do Cliente removido;
- preservar Planos manuais somente se continuarem válidos;
- usar defaults apenas segundo a precedência definida;
- recalcular totais e Parcelas;
- apresentar alertas de ajuste.

Se qualquer etapa falhar, restaurar integralmente o Cliente e o snapshot anterior.

### 7. Gravação do Orçamento

Use uma única fronteira transacional de backend para inclusão e alteração. Antes da persistência, revalidar:

- Permissão de inclusão/alteração;
- Situação editável;
- revisão/concorrência do Orçamento;
- Cliente e tipo elegíveis;
- pendência de conferência cadastral;
- Autorizações de crédito/desconto aplicáveis;
- campos obrigatórios do cabeçalho;
- existência de ao menos um Produto ou Serviço;
- Produtos ativos/elegíveis;
- preços e descontos autoritativos;
- montagem e Filial de montagem;
- entrega, período, data e hora quando exigidos;
- Planos, seleção e Parcelas;
- contatos e demais vínculos incluídos no payload;
- regras de Conferência de Produtos e disponibilidade para frente de caixa já especificadas no projeto;
- demais validações Delphi comprovadas durante a investigação.

Persistir atomicamente tudo que compõe o Orçamento: cabeçalho, Produtos, Serviços, Planos, Parcelas, contatos e demais vínculos em escopo. Se qualquer validação, Autorização, recálculo ou persistência falhar, nenhuma alteração parcial pode permanecer.

Preservar a Auditoria fornecida pelos triggers `_log_new`; não criar uma segunda Auditoria duplicada na aplicação.

Após sucesso, retornar snapshot autoritativo completo, avisos e nova revisão. A interface deve estabelecer esse retorno como novo baseline persistido.

## Contrato de transição do Cliente

Especifique uma costura de backend de alto nível para preparar e confirmar a transição. Evite a sequência atual de mutar Cliente e depois disparar recálculos independentes.

A preparação deve receber, no mínimo:

- identidade/revisão do Orçamento ou identidade do rascunho;
- Cliente atual e novo Cliente/tipo, inclusive remoção;
- Filial e contexto relevante;
- Produtos, Serviços, descontos, benefícios, Planos e Parcelas atuais quando o Orçamento ainda for rascunho;
- prova de Autorização quando aplicável.

A resposta proposta deve conter:

- fotografia cadastral proposta;
- Produtos reprecificados;
- totais e descontos finais;
- cashback e Crédito de troca válidos/sugeridos;
- Planos e Parcelas propostos;
- alertas classificados como informativos, confirmação necessária ou bloqueio;
- Autorizações pendentes;
- resumo de diferenças em relação ao snapshot anterior;
- token/revisão da proposta para confirmação segura.

Defina respostas para Cliente inválido, tipo não permitido, falha de preço, cadastro desatualizado, Autorização necessária/negada, conflito de revisão, proposta expirada e falha financeira.

Se a arquitetura indicar que preparação e confirmação não precisam persistir nada, mantenha-as sem efeitos colaterais. A persistência definitiva ocorre na gravação do Orçamento.

## Concorrência, idempotência e interface

- Desabilitar seleções/trocas/remoções e gravações conflitantes enquanto uma operação estiver em andamento.
- Impedir duplo clique e submissões duplicadas.
- Ignorar ou cancelar respostas de uma seleção antiga.
- Detectar revisão desatualizada antes de gravar.
- Não sobrescrever silenciosamente mudanças de outra sessão.
- Não engolir erros de preço, Ficha Financeira, Crédito de troca, Plano ou gravação.
- Em falha, manter/restaurar o snapshot anterior completo.
- Em sucesso, atualizar todos os painéis dependentes a partir da resposta autoritativa.
- Manter foco e navegação previsíveis e alertas acessíveis por teclado.

## Costuras principais de teste

Use o nível mais alto possível e prefira poucas costuras:

1. `abrir Orçamento persistido com Cliente A, Produtos, descontos, Plano e Parcelas → selecionar Cliente B → receber impacto e alertas → confirmar → observar snapshot coerente → salvar → reabrir e comprovar persistência`;
2. `abrir o mesmo cenário → selecionar Cliente B → cancelar ou simular falha em qualquer etapa → comprovar que Cliente A e todos os valores continuam inalterados`.

Essas costuras devem exercitar tela, contratos reais de backend e transação. Testes unitários de helpers não substituem os testes de comportamento.

## Cenários mínimos de teste

### Tipos e fotografia

- seleção `C` com restrição ativa;
- tentativa `F`/`L` com restrição ativa;
- `C`, `F` e `L` quando permitidos;
- troca com e sem Produtos;
- remoção de Cliente;
- edição de nome, documento, endereço, telefones e e-mail no Orçamento;
- salvar e comprovar que `clientes`/`fornecedores` não foram alterados;
- comprovar que endereço incompleto não grava endereço da Filial no cadastro mestre.

### Preços e recálculos

- Cliente com markup;
- Cliente com cargo/preço por cargo;
- Cliente sem cargo;
- ausência de Cliente usando cargo/tabela padrão;
- promoção e preço normal;
- vários Produtos/Filiais;
- falha de reprecificação;
- resposta tardia de seleção anterior;
- confirmação e cancelamento do impacto;
- uma única cascata final de totais e financiamento.

### Ficha Financeira e alertas

- ficha sempre exibida;
- somente com atraso;
- atraso ou valores em aberto;
- `PerguntarAntesExibirFicha` ativo/inativo;
- `naoexibirfichafinanceira`;
- parcelas vencidas, cheques devolvidos e valores futuros;
- restrição de Analista de Crédito com Autorização concedida, negada e cancelada;
- alerta de Orçamentos em aberto com ação de consulta não bloqueante;
- ação manual da Ficha Financeira;
- cadastro dentro e fora do prazo de `DiasAvisoAtualizarCliente`;
- conferência cadastral concluída e pendente no momento de salvar.

### Planos

- Plano manual válido preservado;
- Plano manual incompatível com confirmação de recálculo;
- cancelamento da substituição;
- plano padrão do Cliente habilitado/desabilitado;
- Cliente sem plano padrão;
- fallback para `PlanoOrcamentoPadrao`;
- nenhum default disponível;
- Parcelas inválidas;
- falha de financiamento com rollback completo.

### Gravação

- inclusão e alteração bem-sucedidas;
- nenhum Produto nem Serviço;
- somente Serviço;
- Produto inativo/inelegível;
- montagem sem Filial;
- entrega incompleta;
- ausência ou multiplicidade de Planos selecionados;
- Parcela sem data ou tipo de recebimento;
- Orçamento em Situação não editável;
- Permissão negada;
- conflito de revisão;
- falha ao persistir cada agregado, comprovando rollback;
- contatos e demais vínculos preservados;
- retorno autoritativo e reabertura com o mesmo estado;
- Auditoria criada apenas pelos triggers existentes.

## User stories obrigatórias

Produza uma lista extensa e numerada cobrindo, no mínimo:

1. selecionar Cliente elegível;
2. suportar tipos `C`, `F` e `L` segundo Parâmetro do Sistema;
3. copiar fotografia cadastral;
4. visualizar impacto antes da troca;
5. cancelar sem alterações;
6. reprecificar Produtos;
7. respeitar markup do Cliente e preços por cargo;
8. recalcular totais e financiamento uma vez;
9. preservar Planos manuais;
10. aplicar a precedência dos Planos padrão;
11. revalidar cashback e Crédito de troca;
12. visualizar Ficha Financeira segundo parâmetros;
13. obter Autorização contextual de crédito;
14. consultar Orçamentos em aberto sem bloqueio;
15. resolver cadastro desatualizado;
16. impedir gravação com conferência pendente;
17. editar fotografia sem alterar Cadastro de Clientes;
18. remover Cliente mantendo Produtos e Serviços;
19. salvar atomicamente todos os vínculos;
20. receber erro útil e rollback integral;
21. detectar concorrência e repetição;
22. reabrir o Orçamento com o mesmo snapshot persistido;
23. manter Auditoria pelos triggers existentes;
24. distinguir bugs/limitações Delphi de requisitos.

Amplie a lista para todos os cenários felizes, limites, falhas, permissões, parâmetros, concorrência e acessibilidade.

## Critérios de aceite

1. Seleção, troca e remoção respeitam os tipos permitidos pelo Parâmetro do Sistema.
2. A mudança com impacto comercial só se torna efetiva após confirmação.
3. Cancelamento ou falha restaura integralmente o snapshot anterior.
4. Nenhuma falha de reprecificação ou Crédito de troca é silenciosamente ignorada.
5. Produtos usam preços autoritativos e a precedência comprovada.
6. Totais, descontos, benefícios, Planos e Parcelas pertencem ao mesmo contexto do Cliente atual.
7. Planos manuais não são sobrescritos sem confirmação.
8. A precedência de Plano manual, Cliente e sistema é determinística e testada.
9. Ficha Financeira e alertas respeitam parâmetros e Permissões.
10. Débitos informam; somente política de crédito configurada bloqueia.
11. Orçamentos em aberto geram aviso não bloqueante com ação de consulta.
12. Cadastro desatualizado impede salvar enquanto a pendência obrigatória não for resolvida.
13. Dados editados no Orçamento não alteram automaticamente o Cadastro de Clientes/Fornecedores/Filiais.
14. Remover Cliente mantém Produtos e Serviços e revalida todos os dados dependentes.
15. Gravação revalida o estado no backend e é transacional.
16. Nenhuma falha deixa cabeçalho, linhas, Planos, Parcelas ou contatos parcialmente persistidos.
17. Conflitos de revisão e comandos repetidos são tratados sem sobrescrever dados.
18. A resposta de sucesso contém o snapshot autoritativo e torna-se o baseline da tela.
19. Reabrir o Orçamento reproduz o estado confirmado.
20. A matriz Delphi × Laravel registra evidência, divergências deliberadas, dúvidas e possíveis bugs.

## Implementation Decisions a registrar

Sem fixar nomes de arquivos, explicite:

- modelo da transição de Cliente;
- fronteira de rollback da interface;
- contrato de preparação/confirmação;
- política para `C`, `F` e `L`;
- fotografia cadastral e isolamento do Cadastro de Clientes;
- motor/preferência autoritativa de preços;
- ordem dos recálculos;
- integração com Ficha Financeira e Autorizações existentes;
- precedência e compatibilidade de Planos;
- fronteira transacional da gravação;
- contrato de resposta autoritativa;
- concorrência, revisão e idempotência;
- tratamento da Auditoria por triggers;
- costuras e fixtures de teste.

## Out of Scope

- Alterar o Delphi.
- Implementar nesta etapa de `/speckit.specify`.
- Redesenhar integralmente o Cadastro de Clientes ou a Ficha Financeira.
- Atualizar automaticamente o Cadastro de Clientes a partir do Orçamento.
- Reproduzir o fallback Delphi que grava endereço da Filial no cadastro mestre.
- Alterar regras de preço, crédito ou financiamento não relacionadas ao Cliente e à gravação do Orçamento.
- Migrar outras abas do Orçamento já tratadas em especificações próprias.
- Criar migrations sem necessidade arquitetural comprovada.

## Formato esperado

Produza obrigatoriamente:

1. Problem Statement;
2. Solution;
3. User Stories extensas e numeradas;
4. Implementation Decisions;
5. Testing Decisions;
6. Out of Scope;
7. Further Notes;
8. matriz de evidências Delphi × Laravel;
9. sequência/estado da transição do Cliente;
10. matriz de Parâmetros, Permissões e Autorizações;
11. precedência de preços e Planos;
12. fronteira transacional da gravação;
13. contratos de API e respostas de erro;
14. critérios de aceite verificáveis;
15. dúvidas remanescentes separadas dos requisitos.
```
