# Definir rollout, testes e prompt SpecKit do tema escuro

Type: task
Status: resolved
Blocked by: 02, 03, 04, 05

## Answer

Foi criado o prompt canônico em modules/shared/tema-escuro-laravel/01-speckit-prompt.md. Ele é autocontido para /speckit.specify e consolida as decisões do mapa: Claro como padrão inicial, modos Sistema/Claro/Escuro, três presets de paleta escura, preferência local versionada, data-theme pré-React, tokens semânticos, migração por seams compartilhados, WCAG 2.2 AA, tratamento de estados e artefatos, testes, critérios de tela migrada, rollout e rollback.

A recomendação é um único prompt de especificação, com a implementação posteriormente dividida em tarefas por seam e família de componentes. Não criar um prompt por tela: a decisão de tema é transversal e a duplicação de prompts repetiria o contrato.

O rollout deve começar em desenvolvimento/homologação, manter Claro como padrão em produção, liberar o controle somente quando shell e primitives tiverem cobertura, e permitir desligar o dark por configuração sem apagar a preferência local. O rollback força o tema efetivo Claro e a reativação reaplica a preferência salva.

O plano de testes cobre bootstrap e persistência, Sistema explícito, sincronização entre abas, provider, componentes, acessibilidade, contraste, visual regression, responsividade, smoke de rotas e busca contra novos hardcodes. O critério de tela migrada exige suporte a Claro e às três paletas Escuras, foco/teclado/leitor de tela, ausência de flash, impressão preservada e exceções documentadas.

Com este ticket, as decisões necessárias antes do /speckit.specify estão fechadas. A execução futura deve partir do prompt e não deste mapa.

## Question

Como dividir a implementação em fatias verificáveis, medir regressões e consolidar o resultado em prompt(s) `/speckit.specify` sob `modules/shared/tema-escuro-laravel/`?

Definir testes de preferência/inicialização, componentes, contraste, responsividade, visual regression e smoke por família de tela; critérios para declarar uma tela migrada; estratégia de rollout/feature flag se necessária; checklist de busca contra novos hardcodes; documentação e fora de escopo. O prompt deve ser autocontido, referenciar os seams reais e ordenar a migração sem pedir uma reescrita de uma só vez.
