# Finalizar Atendimentos no Cadastro de Orçamentos

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Cadastro de Orçamentos do Laravel já apresenta a ação Atendimento/F10 e tenta abrir o Cadastro de Atendimentos embutido, mas o host `orcamentos` não é reconhecido pelo contrato do modal, impedindo o fluxo completo. Também não existe a aba Atendimentos para consultar, em modo somente leitura, o histórico exclusivo do Orçamento corrente. O Usuário precisa registrar e consultar Atendimentos sem abandonar o Orçamento nem correr o risco de vincular o registro ao Cliente ou ao Orçamento errado.

## Solution

Completar a integração do Cadastro de Orçamentos com o módulo de Atendimentos existente. Adicionar uma aba Atendimentos, autorizada por `viewAny`, que carregue somente os Atendimentos do Orçamento salvo e os apresente do mais recente para o mais antigo, seguindo o padrão visual da Consulta de Contratos. Tornar funcional o botão Atendimento/F10 por meio do modal existente, com host `orcamentos`, Cliente e Orçamento predefinidos e protegidos no servidor. Após uma Inclusão bem-sucedida, fechar o modal, preservar todo o estado do Cadastro de Orçamentos e atualizar somente o histórico da aba.

## User Stories

1. Como Usuário autorizado a consultar Atendimentos, quero ver a aba Atendimentos no Cadastro de Orçamentos, para acompanhar o histórico do Orçamento corrente.
2. Como Usuário, quero que a aba liste somente registros cujo vínculo seja o Orçamento atual, para não confundir históricos de propostas diferentes.
3. Como Usuário, quero ver os Atendimentos do mais recente para o mais antigo, para encontrar primeiro a interação mais atual.
4. Como Usuário, quero identificar código, Usuário responsável, Filial, data/hora, assunto ou informes e Situação do Atendimento, para compreender cada interação.
5. Como Usuário, quero uma mensagem clara quando o Orçamento não possui Atendimentos, para distinguir ausência de dados de falha de carregamento.
6. Como Usuário, quero ver um estado de carregamento ao abrir a aba, para saber que a consulta está em andamento.
7. Como Usuário, quero ver um erro em português e poder tentar novamente, para recuperar a aba sem recarregar o Cadastro inteiro.
8. Como Usuário sem Permissão de visualização, não quero receber nem visualizar o histórico, para preservar o controle de acesso do módulo de Atendimentos.
9. Como Usuário com Permissão de criação, quero usar Atendimento/F10 em um Orçamento ativo, salvo e com Cliente identificado, para registrar uma nova interação sem sair do Cadastro.
10. Como Usuário sem Permissão de criação, quero que a ação Atendimento permaneça indisponível, mesmo que eu possa alterar o Orçamento.
11. Como Usuário, quero ser orientado a selecionar ou cadastrar expressamente um Cliente quando houver apenas nome livre, para não criar Cliente implicitamente.
12. Como Usuário, quero que o modal indique que sua origem é Orçamentos e mostre o número do Orçamento e o Cliente, para confirmar o contexto antes de gravar.
13. Como Usuário, quero que Cliente, tipo de Cliente e Orçamento venham preenchidos e bloqueados, para evitar alteração acidental do vínculo.
14. Como Usuário, quero que o novo Atendimento use o contexto funcional de Orçamento, para receber os tipos e valores padrão adequados a esse host.
15. Como Usuário, quero que o servidor valide novamente a existência, Situação e Cliente do Orçamento, para impedir gravações forjadas ou desatualizadas.
16. Como Usuário, quero que cliques repetidos ou F10 repetido abram apenas um modal, para não criar Inclusões concorrentes acidentais.
17. Como Usuário, quero corrigir erros de validação dentro do modal, sem perder o Orçamento que estava consultando.
18. Como Usuário, quero confirmação antes de descartar alterações não gravadas, para não perder trabalho por engano.
19. Como Usuário, quero que uma Inclusão bem-sucedida feche o modal e informe o código criado, para saber que a operação terminou.
20. Como Usuário, quero permanecer na mesma aba, posição e estado do formulário após gravar, para continuar trabalhando sem interrupção.
21. Como Usuário autorizado a visualizar, quero que somente o histórico da aba seja atualizado após a Inclusão, para ver imediatamente o novo Atendimento sem recarregar a página inteira.
22. Como Usuário, quero que cancelar o modal não atualize nem altere o histórico, para preservar o estado quando nenhuma Inclusão ocorreu.
23. Como Usuário, quero continuar vendo o histórico de um Orçamento salvo mesmo quando sua Situação não for ativa, para consultar interações passadas.
24. Como Usuário, quero que a Inclusão seja bloqueada quando a Situação do Orçamento não for ativa, para respeitar a elegibilidade definida para esta etapa.
25. Como equipe de produto, queremos reutilizar o Cadastro de Atendimentos embutido e o padrão visual de Contratos, para evitar uma segunda implementação das mesmas regras.
26. Como equipe de manutenção, queremos conservar o comportamento atual da Consulta de Contratos, para que a extensão do host `orcamentos` não cause regressões nos hosts existentes.

## Implementation Decisions

- A aba é histórico somente leitura; não abre, altera nem exclui Atendimento.
- Visualização e Inclusão usam separadamente `AtendimentoPolicy::viewAny` e `AtendimentoPolicy::create`. Permissão do Cadastro de Orçamentos não substitui nenhuma delas.
- A aba fica disponível para qualquer Orçamento salvo, independentemente de sua Situação, desde que o Usuário possa visualizar Atendimentos.
- O carregamento é lazy na primeira ativação da aba, com nova consulta quando mudar o Orçamento, quando o Usuário solicitar retry ou após Inclusão bem-sucedida.
- O contrato de leitura filtra no servidor exclusivamente por `atendimentos.orcamento = Orçamento corrente` e ordena por data/hora de inclusão descendente, com código descendente como desempate. Follow-ups não recebem agrupamento visual especial.
- A apresentação reutiliza ou generaliza o painel de históricos de Atendimentos da Consulta de Contratos: cabeçalho adaptado para Orçamento, Situação mais recente e linhas com código, Usuário, Filial, data/hora e informes; assunto é fallback quando informes estiver vazio.
- A ação Atendimento/F10 exige: Permissão `create`, Orçamento persistido, Situação ativa `A`, Cliente identificado e ausência de processamento/modal já aberto.
- Apenas nome livre não satisfaz Cliente identificado. O sistema não cria Cliente automaticamente; orienta seleção ou Cadastro Expresso.
- O host `orcamentos` passa a ser suportado pelo contrato de embed. Cliente, tipo de Cliente e Orçamento são campos fixos no contexto.
- O servidor deriva ou confronta o contexto com o Orçamento persistido tanto no bootstrap quanto na gravação. Divergência, inexistência, Orçamento inativo ou ausência de Cliente gera resposta de validação e nenhuma persistência.
- O rascunho usa o contexto principal de Orçamento (`O`) e catálogo compatível, preservando as regras centrais do Cadastro de Atendimentos.
- Gravação bem-sucedida fecha o modal, fornece feedback com o código criado, preserva o estado local do Cadastro de Orçamentos e invalida apenas a consulta do histórico.
- Não há alteração de schema prevista; a solução consome o vínculo legado `atendimentos.orcamento`.

## Testing Decisions

- O seam principal é um teste funcional do Cadastro de Orçamentos e dos contratos HTTP de histórico/bootstrap/store, observando respostas, autorização e persistência em vez de detalhes internos.
- Cobrir `viewAny` e `create` separadamente, inclusive acesso direto sem Permissão.
- Verificar filtro exclusivo pelo Orçamento, ordem por inclusão/código, estado vazio e payload de apresentação.
- Verificar bootstrap e store do host `orcamentos`, campos fixos e rejeição de contexto adulterado, Orçamento inexistente, inativo ou sem Cliente.
- Verificar que a Inclusão persiste Cliente, tipo de Cliente e Orçamento corretos e retorna o código criado.
- Usar como prior art os testes funcionais do embed de Atendimentos, da integração na Consulta de Contratos e do Cadastro de Orçamentos.
- Acrescentar teste de interação no frontend somente para comportamentos que o seam HTTP não observa: visibilidade da aba, F10, modal único, preservação do estado e refresh isolado após sucesso.
- Manter testes de regressão dos hosts `consulta-contratos`, `ficha-financeira` e `cadastro-cliente`.

## Out of Scope

- Editar ou excluir Atendimentos pela aba.
- Criar Cliente implicitamente.
- Reproduzir a rotação anômala da lista, o refresh permanente ou outras limitações observadas no Delphi.
- Implementar Atendimentos automáticos por cancelamento, conversão em Contrato, e-mail ou agendamento de produto.
- Redesenhar o Cadastro de Atendimentos standalone ou o modal embutido.
- Alterar outras abas do Cadastro de Orçamentos.
- Executar implementação neste workspace de análise.

## Further Notes

- Evidência Delphi: a aba é um RichEdit somente leitura, filtra por `orcamento`, e o botão/F10 abre uma nova Inclusão no contexto `O`.
- Evidência Laravel: o painel de Contratos já consulta e exibe históricos em ordem decrescente; o modal embed, as policies, bootstrap e store já existem.
- Lacuna confirmada: o Cadastro de Orçamentos envia `host='orcamentos'`, porém esse host não consta no registro permitido; por isso o bootstrap atual responde com validação antes de abrir o formulário.
- Lacunas confirmadas: não há aba, consulta por Orçamento nem prop de autorização `viewAny` no Cadastro de Orçamentos; o callback de sucesso atual apenas fecha o modal.
- Possíveis bugs legados excluídos: rotação da primeira linha para o fim e flag de reabertura nunca limpa.
