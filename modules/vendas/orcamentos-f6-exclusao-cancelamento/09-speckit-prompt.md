# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica para revisar e concluir no Laravel todas as funcionalidades do comando F6 — Excluir/Cancelar — no Cadastro de Orçamentos, comparando rigorosamente o comportamento Delphi com o estado atual do Laravel.

Não implemente nesta etapa. Produza uma especificação pronta para planejamento e implementação. Inspecione o código e o schema disponíveis antes de concluir e corrija qualquer hipótese deste prompt que seja contrariada por evidência concreta.

## Vocabulário obrigatório

- `Cancelamento do Orçamento`: preservação do registro e de seu histórico, com mudança da Situação para Cancelado e registro do motivo do encerramento.
- `Exclusão do Orçamento`: remoção física e definitiva de um Orçamento elegível e dos dados exclusivamente pertencentes a ele.
- `Descarte de rascunho`: abandono de um novo Orçamento que ainda não foi persistido; não é Cancelamento nem Exclusão de domínio.
- `Motivo de Cancelamento`: registro estruturado do Cadastro de Motivos que qualifica o Cancelamento.
- `Descrição do Cancelamento`: texto complementar informado pelo Usuário.
- `Atendimento de Cancelamento`: Atendimento vinculado ao Cliente e ao Orçamento para registrar a descrição do Cancelamento.

Não use Exclusão e Cancelamento como sinônimos.

## Regras de evidência

Analise PAS e DFM conjuntamente, incluindo formulário ancestral, data modules, queries, eventos, actions, atalhos, SQL, units compartilhadas, Parâmetros do Sistema, Permissões, Autorizações, triggers e constraints.

Compare cada comportamento com o Laravel existente. Classifique toda descoberta relevante como:

- CONFIRMADO;
- INFERIDO;
- DÚVIDA;
- NÃO LOCALIZADO;
- DIVERGENTE;
- POSSÍVEL BUG LEGADO;
- DECISÃO NOVA.

Toda conclusão deve indicar evidência concreta. Não converta automaticamente limitações, exclusões incompletas ou bugs do Delphi em requisitos.

## Evidência Delphi confirmada

### Modos do Parâmetro do Sistema

- [CONFIRMADO] `ExclusaoOrcamento` não é booleano. O Delphi define quatro valores: `exoEXCLUIR`, `exoCANCELAR`, `exoPERGUNTAR` e `exoNENHUMA`.
- [CONFIRMADO] Os valores persistidos são `E`, `C`, `P`; qualquer outro valor resulta em Nenhuma.
- [CONFIRMADO] O Cadastro de Orçamentos e a Consulta de Orçamentos resolvem esse parâmetro para decidir entre Cancelamento, Exclusão ou pergunta ao Usuário.

### Entrada pelo F6/botão

- [CONFIRMADO] O formulário de Orçamentos sobrescreve `InternoExcluir`, após o fluxo herdado.
- [CONFIRMADO] O botão de exclusão delega ao comportamento herdado, convergindo no mesmo fluxo.
- [CONFIRMADO] No timer inspecionado, o botão fica habilitado quando a Situação do Orçamento é `A`.
- [DÚVIDA] Investigue o formulário ancestral para identificar regras adicionais de F6, permissões, rascunho, confirmação e datasets em edição.

### Resolução da operação

- [CONFIRMADO] Em modo Cancelar, o Delphi entra diretamente no fluxo de Cancelamento.
- [CONFIRMADO] Em modo Perguntar, pergunta primeiro se o Usuário deseja Cancelar; se não, solicita nova confirmação para Excluir.
- [CONFIRMADO] Nos demais casos tratados como Exclusão, solicita confirmação explícita da remoção.
- [CONFIRMADO] O fluxo retorna à primeira aba após a operação.

### Cancelamento

- [CONFIRMADO] O Delphi abre um modal de Motivos denominado `Cancelamentos do orçamento`.
- [CONFIRMADO] A query lista Motivos com `tipomotivo = 'V'`, ativos ou com inativação futura, ordenados por descrição.
- [CONFIRMADO] Um Motivo selecionado é necessário para `ExcluirOrcamento(Cancelar = true)` prosseguir.
- [CONFIRMADO] `ObrigarDigitacaoaoExcluir` controla a exigência do texto complementar.
- [CONFIRMADO] Havendo texto obrigatório, o Delphi chama `IncluirAtendimento_` com tipo `CancelamentoOrcamento`; o Cancelamento só prossegue se essa inclusão tiver sucesso.
- [CONFIRMADO] Se o Orçamento não possui Cliente e a digitação é obrigatória, o Delphi tenta criar e atribuir um novo Cliente antes do Atendimento.
- [POSSÍVEL BUG/DECISÃO LEGADA REJEITADA] Não reproduzir a criação automática de Cliente apenas para cancelar um Orçamento anônimo.
- [CONFIRMADO] No Cancelamento, o Delphi grava data do Cancelamento, Motivo, Situação `C` e descrição.
- [CONFIRMADO] O Delphi limpa o dataset de e-mails do Orçamento durante o Cancelamento.
- [CONFIRMADO] Produtos, Serviços, Planos e Parcelas não são explicitamente removidos no ramo de Cancelamento.

### Exclusão física

- [CONFIRMADO] O Delphi remove explicitamente Produtos, Parcelas, Planos, registros do dataset de e-mail e o cabeçalho do Orçamento.
- [NÃO LOCALIZADO] Não foi localizada no método inspecionado remoção explícita dos Serviços.
- [DÚVIDA] Verifique cascatas, triggers, constraints, ancestral e demais datasets para determinar se Serviços e outros vínculos são removidos implicitamente ou ficam órfãos.
- [DÚVIDA] Verifique se o Delphi realmente impede Exclusão quando existe Contrato, Documento Fiscal, Atendimento, envio processado ou outro uso; até agora, a proteção visível no formulário é a Situação aberta.

### Consulta em lote

- [CONFIRMADO] A Consulta de Orçamentos Delphi repete a resolução Cancelar/Excluir/Perguntar.
- [CONFIRMADO] Para Cancelamento em lote, usa o mesmo modal de Motivo/descrição e delega ao data module da consulta.
- [DÚVIDA] Documente atomicidade, tratamento por item e diferenças entre o lote e o Cadastro individual.

## Estado Laravel confirmado

### Interface

- [CONFIRMADO] O Cadastro registra um listener global de teclado e associa F6 à função de Cancelamento.
- [CONFIRMADO] A ação fica disponível para Orçamento persistido, com Permissão de exclusão e Situação `A`.
- [CONFIRMADO] A tela usa uma confirmação simples: `Deseja cancelar este orçamento?`.
- [CONFIRMADO] Após confirmação, sempre envia `acao = cancelar` e a descrição fixa `Cancelado pelo usuário`.
- [DIVERGENTE] A tela não resolve nem expõe os modos Excluir/Perguntar/Nenhuma.
- [DIVERGENTE] A tela não apresenta lookup de Motivo nem coleta a descrição configurável do Usuário.

### Parâmetro

- [CONFIRMADO] O manifesto Laravel declara `EXCLUSAO ORCAMENTO`.
- [DIVERGENTE] O serviço atual lê esse parâmetro como booleano, apesar de os valores legados serem `E`, `C`, `P` ou nenhum.
- [POSSÍVEL BUG ATUAL] A conversão booleana não representa a política funcional legada e pode permitir, negar ou converter operações incorretamente conforme a implementação de truthy.

### Backend

- [CONFIRMADO] Existe um único endpoint DELETE que aceita `acao = cancelar|excluir`, Motivo e descrição.
- [CONFIRMADO] A policy atual usa a mesma capacidade `delete` para ambas as ações.
- [CONFIRMADO] O serviço rejeita Orçamento fora da Situação `A`.
- [CONFIRMADO] Se recebe Exclusão e o parâmetro booleano não a permite, converte silenciosamente a ação em Cancelamento.
- [DIVERGENTE] Não deve haver conversão silenciosa de Exclusão para Cancelamento; são operações com consequências distintas.
- [CONFIRMADO] O Cancelamento valida descrição somente quando `Obrigar digitação ao excluir` está ativo.
- [NÃO LOCALIZADO] Validação obrigatória de Motivo no serviço atual.
- [NÃO LOCALIZADO] Validação de que o Motivo existe, está ativo e pertence ao tipo de Vendas.
- [NÃO LOCALIZADO] Criação do Atendimento `CancelamentoOrcamento`.
- [NÃO LOCALIZADO] Invalidação de e-mails pendentes e preservação diferenciada do histórico processado.
- [NÃO LOCALIZADO] Registro explícito do Usuário responsável nos dados de Cancelamento, além da Auditoria geral por trigger.
- [CONFIRMADO] A Exclusão física usa transação e remove Planos/Parcelas, Produtos e cabeçalho.
- [DIVERGENTE] Existe repositório capaz de remover Serviços do Orçamento, mas ele não é usado pelo serviço de Exclusão atual.
- [NÃO LOCALIZADO] Verificação de Contrato, Documento Fiscal, Atendimento, comunicação ou outros vínculos antes da Exclusão física.

### Testes e lote

- [CONFIRMADO] Existe teste Feature que cancela um Orçamento aberto e verifica apenas a Situação `C`.
- [NÃO LOCALIZADO] Testes completos para Motivo, descrição, Atendimento, e-mail, preservação das linhas, Exclusão física, parâmetros E/C/P/N, Permissões específicas, concorrência e rollback.
- [CONFIRMADO] Existe endpoint de Cancelamento em lote que itera códigos e usa o mesmo serviço.
- [POSSÍVEL BUG ATUAL] O lote captura qualquer exceção e retorna apenas códigos `ignorados`, descartando o motivo de cada falha.
- [NÃO LOCALIZADO] Uso do endpoint de lote na interface Laravel inspecionada.

## Solução funcional obrigatória

### 1. Resolver o contexto do F6

Antes de apresentar ou executar qualquer ação, determinar:

- se existe Orçamento persistido ou apenas rascunho;
- Situação e revisão atuais;
- Filial aplicável aos Parâmetros do Sistema;
- valor enum de `ExclusaoOrcamento`;
- Permissões do Usuário;
- elegibilidade atual para Cancelamento;
- elegibilidade atual para Exclusão física;
- vínculos que bloqueiam a Exclusão.

Não confiar apenas em flags entregues ao navegador. Revalidar no backend no momento da operação.

### 2. Matriz dos modos

Defina o comportamento canônico:

- `C — Cancelar`: oferecer somente Cancelamento quando elegível.
- `E — Excluir`: oferecer Exclusão quando elegível; se bloqueada por vínculos, explicar os impedimentos e oferecer Cancelamento quando permitido.
- `P — Perguntar`: apresentar Cancelamento e Exclusão lado a lado, mas somente as ações elegíveis, com consequências claras.
- `N/ausente/desconhecido — Nenhuma`: desabilitar a ação e não inferir Cancelamento ou Exclusão.

O botão e o atalho F6 devem consumir a mesma resolução. F6 não pode disparar se um modal incompatível estiver aberto, se houver uma operação em andamento ou se o evento for repetição automática do teclado.

### 3. Descarte de rascunho

Para novo Orçamento ainda não persistido:

- pedir confirmação se houver dados informados;
- descartar somente o estado local;
- não chamar endpoint de Cancelamento/Exclusão;
- não gerar Motivo, Atendimento ou Auditoria de Orçamento;
- retornar ao estado/tela apropriado sem conservar efeitos assíncronos pendentes.

Defina também o comportamento quando um Orçamento persistido possui alterações locais não salvas: o Usuário deve escolher abandonar as alterações e operar sobre a revisão persistida ou voltar; não salvar silenciosamente antes de cancelar/excluir.

### 4. Cancelamento do Orçamento

O Cancelamento deve:

1. exigir Orçamento persistido, aberto e revisão atual;
2. exigir Permissão de Cancelamento;
3. exigir um Motivo ativo com `tipomotivo = 'V'`;
4. coletar descrição;
5. exigir descrição quando `Obrigar digitação ao excluir` estiver ativo;
6. exibir confirmação final com número do Orçamento, Cliente quando houver, Motivo e consequências;
7. atualizar Situação para `C`;
8. registrar data/hora, Usuário, Motivo e descrição;
9. preservar Produtos, Serviços, Planos, Parcelas, contatos e demais históricos;
10. quando houver Cliente e descrição obrigatória, criar Atendimento do tipo `CancelamentoOrcamento` vinculado ao Orçamento e Cliente;
11. quando não houver Cliente, não criar Cliente nem Atendimento artificial; manter Motivo/descrição no próprio Orçamento;
12. invalidar mensagens de e-mail ainda pendentes;
13. preservar e-mails processados, enviados ou com erro como histórico;
14. persistir todas as mutações na mesma transação;
15. retornar snapshot/resultado autoritativo.

O Cancelamento não deve apagar linhas comerciais ou financeiras. Não deve cancelar automaticamente Contrato, Documento Fiscal ou Venda derivados; a existência desses vínculos deve ser avaliada como impeditivo ou regra específica comprovada, nunca ignorada.

### 5. Exclusão física

A Exclusão é irreversível e excepcional. Só permitir quando:

- o Orçamento estiver persistido e aberto;
- o Usuário possuir Permissão explícita para Exclusão física;
- a configuração permitir a ação;
- não houver Contrato gerado;
- não houver Documento Fiscal, Venda ou dado fiscal associado;
- não houver Atendimento ou histórico de Cliente relevante;
- não houver envio de e-mail registrado/processado;
- não houver outro vínculo externo ou derivação relevante;
- a revisão informada ainda for atual.

Antes de fechar a spec, faça um inventário completo de referências ao Orçamento no schema e no código. Classifique cada tabela como:

- dado exclusivamente pertencente ao Orçamento e removível;
- histórico/vínculo que bloqueia Exclusão;
- dado compartilhado que nunca deve ser removido;
- dúvida que exige decisão.

A transação de Exclusão deve:

1. bloquear/reler o Orçamento;
2. revalidar Situação, revisão, Parâmetro e Permissão;
3. revalidar todos os bloqueadores;
4. remover filhos exclusivamente pertencentes ao Orçamento em ordem segura;
5. incluir, no mínimo quando existentes, Parcelas, Planos, Produtos, Serviços e filas pendentes descartáveis;
6. remover o cabeçalho por último;
7. falhar integralmente diante de constraint, vínculo novo ou erro;
8. preservar a Auditoria fornecida pelos triggers `_log_new`.

Não apague Atendimentos, e-mails históricos, Contratos ou dados fiscais para tornar o Orçamento elegível. A existência deles bloqueia a Exclusão e direciona para Cancelamento.

### 6. Motivo e descrição

O modal deve usar lookup paginado/pesquisável de Motivos ativos do tipo Vendas. Não confiar no código do Motivo enviado pelo navegador: validar novamente no backend.

Apresentar:

- operação escolhida;
- número do Orçamento;
- Cliente, quando houver;
- Motivo;
- descrição com contador/limite;
- aviso de preservação no Cancelamento;
- aviso de irreversibilidade na Exclusão;
- bloqueadores da Exclusão.

Para Exclusão física, decida com base em evidência e política se Motivo/descrição também devem ser exigidos para a Auditoria. Não reutilize automaticamente a semântica de Motivo de Cancelamento sem registrar a decisão.

### 7. Atendimento e e-mails

Reutilize as infraestruturas genéricas existentes.

Atendimento:

- criar no mesmo compromisso transacional do Cancelamento, ou definir compensação segura se a arquitetura impedir a mesma conexão/transação;
- vincular Orçamento, Cliente, tipo de Cliente, Situação e descrição conforme o contrato já existente;
- evitar duplicação em retry;
- não criar quando não houver Cliente.

E-mails:

- identificar estados pendente, reservado/processando, enviado e erro;
- impedir que pendentes sejam enviados após o Cancelamento;
- tratar corrida entre worker e Cancelamento;
- preservar conteúdo, destinatário, resultado e timestamps de envios já processados;
- não limpar indiscriminadamente histórico como o Delphi.

### 8. Permissões e Autorizações

Inventarie a Permissão atual representada por `delete`. Recomenda-se separar:

- Permissão para Cancelar Orçamento;
- Permissão mais restrita para Excluir fisicamente.

Se a matriz existente não comportar novas capacidades sem migration, proponha a alternativa mínima e registre o trade-off. Em todos os casos, a ocultação/desabilitação na tela não substitui a autorização no backend.

### 9. Consulta e operação em lote

O Cancelamento em lote deve reutilizar exatamente o mesmo contrato por Orçamento:

- mesma validação de Motivo/descrição;
- mesma Situação e Permissão;
- mesmo Atendimento/e-mail/Auditoria;
- mesma proteção de revisão quando aplicável;
- nenhuma Exclusão física em massa sem decisão explícita e proteção mais forte.

Defina claramente se o lote é:

- atômico como um todo; ou
- parcial por Orçamento.

Recomendação: parcial por Orçamento, com uma transação por item, desde que o retorno detalhe para cada código `cancelado`, `já cancelado`, `não elegível`, `sem permissão`, `conflito`, `motivo inválido` ou `falha`, sem capturar e ocultar a causa.

### 10. Concorrência, idempotência e resposta

- Enviar revisão/versão esperada do Orçamento.
- Bloquear/revalidar dentro da transação.
- Impedir duplo clique, repetição de F6 e requests simultâneos.
- Usar chave idempotente ou semântica idempotente explícita.
- Não converter silenciosamente Exclusão em Cancelamento.
- Se um vínculo surgir entre a abertura do modal e a confirmação, recusar Exclusão e retornar o bloqueador.
- Se o Orçamento já estiver cancelado, definir resposta idempotente sem duplicar Atendimento ou invalidação.
- Retornar operação efetivamente executada, nova Situação/revisão, registros afetados, avisos e bloqueadores.
- Após sucesso, impedir edição do snapshot antigo e redirecionar/atualizar a tela a partir do resultado autoritativo.

## Contratos de API

Prefira um contrato de comando explícito em vez de depender semanticamente de um DELETE ambíguo para duas operações diferentes.

Especifique contratos para:

1. consultar resolução/elegibilidade do F6;
2. cancelar um Orçamento;
3. excluir fisicamente um Orçamento;
4. cancelar Orçamentos em lote.

As respostas devem distinguir:

- sucesso de Cancelamento;
- sucesso de Exclusão;
- descarte local sem request;
- parâmetro sem ação;
- Situação não elegível;
- Motivo ausente/inválido/inativo;
- descrição obrigatória ausente;
- Permissão negada;
- bloqueio por Contrato;
- bloqueio fiscal;
- bloqueio por Atendimento;
- bloqueio por comunicação;
- outro vínculo impeditivo;
- conflito de revisão;
- comando repetido;
- falha transacional.

Não exponha detalhes internos ou SQL na interface, mas retorne códigos estáveis e mensagens úteis.

## Costura principal de teste

Use como costura principal, no nível mais alto possível:

`abrir Orçamento persistido no Cadastro → pressionar F6 → resolver modo por Filial e elegibilidade → escolher/confirmar ação → informar Motivo/descrição quando aplicável → executar o backend real → observar resultado autoritativo → reabrir/consultar e comprovar estado persistido e vínculos`.

Essa costura deve cobrir interface, atalho, parâmetros, Permissão, validações e transação. Testes isolados de services não a substituem.

Use como costura complementar:

`selecionar vários Orçamentos na Consulta → cancelar em lote → observar resultado detalhado por item → comprovar que cada sucesso e falha respeitou o mesmo contrato individual`.

## Testing Decisions

### Parâmetro e interface

- modos `E`, `C`, `P`, `N`, vazio e desconhecido;
- resolução por Filial;
- botão e F6 equivalentes;
- modo Perguntar com ambas as ações elegíveis;
- Exclusão bloqueada oferecendo Cancelamento;
- F6 durante modal, loading e input;
- `event.repeat`, duplo clique e retry;
- acessibilidade por teclado, foco e mensagens.

### Rascunho

- rascunho vazio descartado;
- rascunho preenchido com confirmação;
- desistência do descarte;
- nenhuma chamada mutável ao backend;
- efeitos assíncronos pendentes não reaplicam estado após descarte.

### Cancelamento

- Orçamento aberto com Cliente;
- Orçamento aberto sem Cliente;
- Motivo ativo tipo Vendas;
- Motivo inexistente, inativo ou de outro tipo;
- descrição obrigatória presente/ausente;
- descrição opcional;
- Atendimento criado uma vez quando aplicável;
- nenhum Cliente/Atendimento artificial sem Cliente;
- Produtos, Serviços, Planos, Parcelas e contatos preservados;
- Situação, data/hora, Usuário, Motivo e descrição gravados;
- e-mail pendente invalidado;
- e-mail enviado/erro preservado;
- falha em Atendimento, e-mail ou cabeçalho com rollback integral;
- Orçamento não aberto;
- já cancelado e retry idempotente.

### Exclusão física

- Orçamento vazio/elegível;
- Produtos, Serviços, Planos e Parcelas próprios removidos;
- cabeçalho removido por último;
- bloqueio por Contrato;
- bloqueio por Documento Fiscal/Venda;
- bloqueio por Atendimento;
- bloqueio por e-mail histórico;
- cada outro vínculo descoberto no inventário;
- vínculo criado concorrentemente antes da confirmação;
- constraint/falha intermediária com rollback;
- nenhum órfão após sucesso;
- Auditoria do delete criada pelos triggers.

### Segurança e concorrência

- sem Permissão de Cancelamento;
- sem Permissão de Exclusão física;
- chamada direta ignorando interface;
- revisão desatualizada;
- duas sessões cancelando;
- Cancelamento concorrente com Exclusão;
- repetição da mesma chave/comando;
- nenhum Atendimento ou efeito duplicado.

### Lote

- todos cancelados;
- mistura de sucessos e falhas;
- Motivo inválido para todos;
- item já cancelado;
- item com conflito;
- resultado detalhado por código;
- transação independente por item conforme decisão;
- nenhuma exceção reduzida apenas a `ignorado` sem causa.

Reutilize o teste Feature existente de Cancelamento, os testes de Cadastro de Orçamentos, as policies e a infraestrutura de parâmetros. Amplie a cobertura para o comportamento externo completo e adicione teste de componente/página para o F6 real.

## User stories obrigatórias

Inclua lista extensa e numerada cobrindo, no mínimo:

1. resolver F6 conforme `E/C/P/N`;
2. distinguir Cancelamento, Exclusão e descarte;
3. descartar rascunho sem criar histórico falso;
4. exigir Motivo ativo para Cancelamento;
5. exigir descrição conforme Parâmetro do Sistema;
6. preservar linhas e histórico no Cancelamento;
7. registrar data/hora e Usuário;
8. criar Atendimento quando houver Cliente e regra aplicável;
9. não criar Cliente artificial;
10. invalidar somente e-mails pendentes;
11. bloquear Exclusão quando houver vínculos;
12. excluir todos os filhos próprios quando elegível;
13. oferecer Cancelamento quando Exclusão estiver bloqueada;
14. aplicar Permissões no backend;
15. impedir repetição e conflito;
16. executar transação atômica;
17. receber resultado detalhado em lote;
18. preservar Auditoria por triggers;
19. compreender claramente as consequências na interface;
20. reabrir/consultar e comprovar o resultado.

Amplie para fluxos felizes, limites, falhas, parâmetros, permissões, concorrência, idempotência e acessibilidade.

## Critérios de aceite

1. O Parâmetro `ExclusaoOrcamento` é interpretado como enum `E/C/P/N`, nunca como booleano.
2. F6 e botão executam a mesma resolução contextual.
3. Rascunho não persistido é apenas descartado.
4. Cancelamento e Exclusão são apresentados como operações distintas.
5. Cancelamento exige Motivo ativo do tipo Vendas.
6. Descrição respeita `Obrigar digitação ao excluir`.
7. Cancelamento preserva Produtos, Serviços, Planos, Parcelas e histórico.
8. Cancelamento registra Situação, data/hora, Usuário, Motivo e descrição atomicamente.
9. Atendimento de Cancelamento é criado uma única vez quando aplicável.
10. Orçamento sem Cliente não cria Cliente ou Atendimento artificial.
11. E-mails pendentes são invalidados; históricos são preservados.
12. Exclusão física só é permitida sem vínculos impeditivos.
13. Contrato, Documento Fiscal, Atendimento ou comunicação histórica bloqueiam Exclusão.
14. Exclusão elegível remove todos os filhos próprios, incluindo Serviços, sem órfãos.
15. Exclusão não apaga históricos externos para forçar elegibilidade.
16. Nenhuma ação é convertida silenciosamente em outra.
17. Permissões são revalidadas no backend.
18. Falhas e conflitos produzem rollback integral e mensagem útil.
19. Comandos repetidos não duplicam Atendimento, e-mail ou mutação.
20. Lote usa o mesmo contrato e retorna resultado detalhado por item.
21. Auditoria permanece a cargo dos triggers existentes, sem duplicidade.
22. Testes no nível da tela e backend comprovam todos os modos e resultados.

## Implementation Decisions a registrar

Sem fixar nomes de arquivos, explicite:

- enum e resolução por Filial;
- matriz modo × elegibilidade × ação;
- tratamento de rascunho e alterações não salvas;
- contrato de Motivo/descrição;
- fronteira transacional do Cancelamento;
- integração com Atendimento;
- máquina de estados dos e-mails;
- inventário/classificação de dependências;
- fronteira transacional da Exclusão física;
- separação de Permissões;
- contratos de API e respostas;
- revisão, locking e idempotência;
- semântica do lote;
- Auditoria por triggers;
- costuras e fixtures de teste.

## Out of Scope

- Alterar o Delphi.
- Implementar durante `/speckit.specify`.
- Cancelar ou excluir Contrato, Documento Fiscal ou Venda derivados.
- Apagar histórico externo para permitir Exclusão.
- Reativar Orçamento cancelado, salvo se evidência comprovar dependência inseparável.
- Redesenhar completamente Cadastros de Motivos, Atendimentos, e-mail ou Auditoria.
- Criar migrations sem necessidade comprovada.
- Migrar outras funcionalidades do Cadastro de Orçamentos.

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
9. matriz `E/C/P/N × elegibilidade × ação`;
10. inventário de dependências e bloqueadores da Exclusão;
11. sequência e fronteira transacional do Cancelamento;
12. sequência e fronteira transacional da Exclusão;
13. contratos de API e erros;
14. matriz de Parâmetros, Permissões e Autorizações;
15. critérios de aceite verificáveis;
16. dúvidas remanescentes separadas dos requisitos.
```
