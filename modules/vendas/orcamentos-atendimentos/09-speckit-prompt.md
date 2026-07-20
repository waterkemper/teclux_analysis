# Prompt para `/speckit.specify`

Copie e execute o conteúdo abaixo no checkout Laravel usado para implementação:

```text
/speckit.specify Finalizar a aba Atendimentos e a ação Atendimento/F10 no Cadastro de Orçamentos do ERP tecLUX.

OBJETIVO

Completar exclusivamente a integração entre o Cadastro de Orçamentos e o módulo de Atendimentos já existente. A entrega deve:

1. adicionar uma aba Atendimentos que apresente, em modo somente leitura, apenas o histórico vinculado ao Orçamento corrente;
2. tornar funcional a ação Atendimento/F10 já presente, reutilizando o Cadastro de Atendimentos embutido usado pela Consulta de Contratos;
3. após uma Inclusão bem-sucedida, fechar o modal, preservar integralmente o estado do Cadastro de Orçamentos e atualizar somente o histórico da aba.

VOCABULÁRIO

- Orçamento é uma proposta comercial e não constitui por si só compromisso do Cliente.
- Cliente é a entidade identificada pelo código e tipo de Cliente persistidos no Orçamento; nome livre não equivale a Cliente identificado.
- Usuário é a identidade que acessa o ERP. Permissão é capacidade previamente concedida; não confundir com Autorização contextual.
- Situação deve ser qualificada pela entidade. Para este fluxo, `A` significa Situação ativa do Orçamento.
- Inclusão é a criação de um novo Atendimento; a aba não é o Cadastro de Atendimentos.

ESTADO ATUAL CONFIRMADO NO LARAVEL

- O Cadastro de Orçamentos já renderiza a ação Atendimento, reconhece F10, recebe `canCreateAtendimento` e instancia o modal embutido.
- A ação atual exige edição de um Orçamento, Situação ativa, Cliente identificado e Permissão de criação.
- O Cadastro de Orçamentos monta contexto com host `orcamentos`, Cliente, tipo de Cliente, nome e número do Orçamento.
- O registro de hosts do embed aceita `consulta-contratos`, `ficha-financeira` e `cadastro-cliente`, mas não aceita `orcamentos`. Portanto, o bootstrap atual rejeita a integração parcial com erro 422.
- O modal compartilhado já possui carregamento, erro, bloqueio de abertura duplicada, confirmação para descartar alterações, submit JSON e fechamento por callback de sucesso.
- O serviço de Atendimentos já entende `orcamento` no contexto e possui proteção genérica para um campo `orcamento` bloqueado, mas o host ainda não o declara.
- `AtendimentoPolicy` já expõe `viewAny` e `create`.
- A Consulta de Contratos já possui um painel somente leitura de Atendimentos, consulta no servidor, ordenação por `datainclusao desc, codigo desc`, estado vazio e apresentação de Situação, código, Usuário, Filial, data/hora e informes.
- O Cadastro de Orçamentos ainda não possui aba Atendimentos, contrato de leitura por Orçamento, autorização `viewAny`, estados de carregamento/vazio/erro ou refresh após Inclusão. O callback atual apenas fecha o modal.

EVIDÊNCIA DELPHI E COMO INTERPRETÁ-LA

- CONFIRMADO: a aba Delphi é somente leitura e filtra `atendimentos.orcamento` pelo Orçamento corrente.
- CONFIRMADO: Atendimento/F10 só atua sobre Orçamento salvo e ativo; a Inclusão recebe Cliente, tipo de Cliente, contexto `O`, número do Orçamento, descrição da Situação e validade.
- CONFIRMADO: o novo Atendimento nasce aberto e vinculado ao Orçamento. O legado pode herdar raiz de follow-up e lembrete do Atendimento anterior.
- DIVERGENTE: o Delphi cria Cliente implicitamente quando existe apenas nome livre. Nesta entrega isso é proibido.
- POSSÍVEL BUG LEGADO: o renderizador Delphi rotaciona a primeira linha para o fim e pode usar outra linha no cabeçalho. Não reproduzir.
- POSSÍVEL BUG LEGADO: a flag que força refresh após retorno parece nunca ser limpa. Não reproduzir.
- DECISÃO NOVA: a ordem será globalmente do mais recente para o mais antigo, sem agrupamento visual especial de follow-ups.
- DECISÃO NOVA: Atendimentos automáticos gerados por cancelamento, conversão em Contrato, e-mail e agendamento ficam fora desta entrega.

REQUISITOS DA ABA ATENDIMENTOS

1. Exibir a aba apenas a Usuários autorizados por `AtendimentoPolicy::viewAny`. Permissão sobre Orçamento não substitui essa policy.
2. A aba é somente leitura. Não oferecer abrir, editar, excluir, selecionar para follow-up ou executar qualquer mutação a partir da lista.
3. A aba deve estar disponível para todo Orçamento persistido, independentemente de sua Situação atual.
4. Para um Cadastro ainda não persistido, não consultar o servidor. Se a aba for mantida visível, informar que é necessário salvar o Orçamento para consultar Atendimentos.
5. Consultar no servidor exclusivamente registros cujo vínculo `orcamento` corresponda ao código do Orçamento corrente. Nunca filtrar apenas no cliente.
6. Autorizar também o endpoint/contrato de leitura com `viewAny`; acesso direto sem Permissão deve retornar 403 e não expor dados.
7. Ordenar por data/hora de inclusão descendente e, como desempate estável, código descendente. Não agrupar famílias de follow-up.
8. Reutilizar ou generalizar o padrão visual do histórico na Consulta de Contratos, evitando uma segunda implementação divergente.
9. Adaptar o cabeçalho para `ORÇAMENTO Nº <código>`.
10. Mostrar a Situação do Atendimento mais recente: `A` como ABERTO e os demais valores como FECHADO, seguindo o padrão já existente.
11. Para cada item, mostrar pelo menos: código, Usuário responsável (código/nome quando disponíveis), Filial quando disponível, data/hora de inclusão e informes. Usar assunto como fallback quando informes estiver vazio.
12. Exibir mensagem clara `Nenhum atendimento para este orçamento.` quando a consulta retornar vazia.
13. Exibir estado de carregamento na primeira ativação e estado de erro em português com ação de tentar novamente.
14. Fazer carregamento lazy ao ativar a aba pela primeira vez. Invalidar e consultar novamente quando mudar o Orçamento, no retry e após Inclusão bem-sucedida.
15. Não recarregar toda a página nem substituir os dados editáveis do Cadastro ao atualizar a aba.

REQUISITOS DA AÇÃO ATENDIMENTO/F10

1. Usar separadamente `AtendimentoPolicy::create`. Permissão de visualizar ou alterar Orçamento não concede Permissão de criar Atendimento.
2. A ação fica habilitada somente quando todas as condições forem verdadeiras: Usuário pode criar Atendimento; Orçamento está persistido; Situação do Orçamento é `A`; há Cliente identificado por código e tipo; não existe submit em andamento; não existe outro modal de Atendimento aberto.
3. F10 deve obedecer exatamente às mesmas condições do botão e não atuar dentro de campos/overlays que já consumam a tecla.
4. Quando houver apenas nome livre, não criar Cliente automaticamente. Manter a ação indisponível e apresentar motivo/ orientação para selecionar um Cliente existente ou usar Cadastro Expresso e salvar o Orçamento.
5. Registrar `orcamentos` como host oficial do embed.
6. Para esse host, bloquear `cliente`, `tipocliente` e `orcamento` no formulário e validar os mesmos vínculos no servidor.
7. O bootstrap não deve confiar apenas nos valores enviados pelo browser. A partir do código do Orçamento, carregar o registro persistido e derivar ou confrontar Cliente, tipo de Cliente, nome e Situação.
8. Rejeitar com 422, sem abrir formulário utilizável, Orçamento inexistente, inativo, sem Cliente ou contexto divergente. Usar mensagens em português.
9. Revalidar na gravação a existência, Situação ativa e vínculos do Orçamento, protegendo contra alteração concorrente entre bootstrap e store.
10. O rascunho deve ser uma nova Inclusão no contexto funcional de Orçamento (`O`), usando os tipos de Atendimento compatíveis com esse contexto e mantendo as regras do Cadastro central.
11. Exibir no banner do modal a origem `Orçamentos`, o número do Orçamento e a identificação resumida do Cliente.
12. Preservar no embed as validações, parâmetros, autenticação contextual e regras de persistência já implementados no Cadastro central de Atendimentos.
13. Múltiplos cliques ou repetições rápidas de F10 devem produzir no máximo um modal ativo e uma solicitação de bootstrap em curso.
14. Erros de bootstrap devem permanecer no shell do modal com possibilidade segura de fechar/tentar novamente. Erros 422 do store devem manter o formulário aberto e preservar os dados digitados.
15. Fechar sem alterações deve apenas retornar ao Cadastro. Fechar com alterações deve pedir confirmação antes de descartar.
16. Em sucesso, retornar o código do Atendimento, mostrar feedback breve em português, fechar automaticamente o modal e preservar Orçamento corrente, aba ativa, rolagem e dados locais.
17. Após sucesso, atualizar somente a fonte de dados da aba Atendimentos. Se o Usuário não possuir `viewAny`, apenas fechar e informar sucesso.
18. Cancelar ou falhar não deve atualizar o histórico nem alterar o Orçamento.

INTEGRIDADE E AUTORIZAÇÃO

- O endpoint de histórico deve ser protegido por `viewAny`.
- Bootstrap e store do embed devem ser protegidos por `create` e pelas regras do módulo de Atendimentos.
- O servidor deve impedir troca de Cliente, tipo de Cliente ou Orçamento mesmo que o payload seja adulterado.
- A leitura e a gravação devem usar o Orçamento persistido como fonte de verdade.
- Não criar migration nem nova tabela: usar o vínculo legado existente em `atendimentos.orcamento`.
- Não ampliar permissões por o Usuário estar no módulo Vendas.

CRITÉRIOS DE ACEITE

1. Dado um Usuário com `viewAny` e um Orçamento salvo com três Atendimentos, quando abrir a aba, então verá somente os três registros desse Orçamento em ordem decrescente de inclusão/código.
2. Dado outro Orçamento do mesmo Cliente, seus Atendimentos nunca aparecem na aba do Orçamento corrente.
3. Dado um Orçamento sem Atendimentos, a aba mostra o estado vazio explícito.
4. Dada falha na consulta, a aba mostra erro e retry sem perder o Cadastro; ao tentar novamente com sucesso, mostra os dados.
5. Dado Usuário sem `viewAny`, a aba não é oferecida e acesso direto ao histórico retorna 403.
6. Dado Usuário com `viewAny` e sem `create`, o histórico é visível e Atendimento/F10 permanece indisponível.
7. Dado Usuário com `create` e sem `viewAny`, a Inclusão continua respeitando `create`, mas nenhum histórico é exposto.
8. Dado Orçamento novo, inativo ou sem Cliente identificado, botão e F10 não abrem o modal.
9. Dado somente nome livre, o sistema orienta seleção/Cadastro Expresso e não cria Cliente implicitamente.
10. Dado Orçamento ativo, salvo, com Cliente e Usuário autorizado, botão ou F10 abre um único modal com host, Orçamento e Cliente corretos.
11. Dado o modal aberto, Cliente, tipo de Cliente e Orçamento não podem ser alterados no frontend nem por payload adulterado.
12. Dado contexto forjado, Orçamento inexistente, inativo ou cujo Cliente mudou, bootstrap/store rejeita e não persiste Atendimento.
13. Dada Inclusão válida, o Atendimento é persistido com `orcamento`, Cliente e tipo corretos, o modal fecha, o código é informado e o novo item aparece na aba sem reload da página inteira.
14. Dado erro de validação, o modal permanece aberto com os valores digitados e mensagens em português.
15. Dado cancelamento do modal, o estado do Cadastro e o histórico permanecem inalterados.
16. Dada alteração não salva no modal, fechar/Escape/backdrop solicita confirmação.
17. Os hosts já existentes do embed e a Consulta de Contratos continuam funcionando sem regressão.

DECISÕES DE TESTE

- Preferir o seam mais alto: testes funcionais do Cadastro de Orçamentos e dos contratos HTTP de histórico, bootstrap e store, verificando comportamento externo, autorização e persistência.
- Usar como prior art os testes de embed de Atendimentos, integração da Consulta de Contratos e Cadastro de Orçamentos existentes.
- Cobrir em testes funcionais: policies separadas, filtro exclusivo, ordenação, vazio, contexto válido, campos bloqueados, payload adulterado, mudança concorrente do Orçamento e persistência correta.
- Adicionar teste de frontend apenas para comportamentos não observáveis no seam HTTP: aba e estados visuais, F10, modal único, preservação de estado e refresh isolado após `onSaved`.
- Manter regressão dos hosts `consulta-contratos`, `ficha-financeira` e `cadastro-cliente`.

FORA DE ESCOPO

- Editar ou excluir Atendimento pela aba.
- Criar Cliente implicitamente.
- Reproduzir ordenação/rotação anômala ou refresh repetitivo do Delphi.
- Implementar os Atendimentos automáticos de cancelamento, conversão em Contrato, envio de e-mail ou agendamento de produtos.
- Redesenhar o Cadastro de Atendimentos standalone ou criar outro formulário/modal.
- Alterar outras abas ou fluxos do Cadastro de Orçamentos.
- Introduzir migrations, tabelas novas ou mudanças não necessárias ao contrato descrito.

Produza uma especificação funcional completa e testável a partir destas decisões. Não transforme limitações ou possíveis bugs do Delphi em requisitos. Preserve a arquitetura e os padrões já existentes no Laravel, e registre como questão aberta somente algo que não possa ser determinado pelo código ou pelas decisões acima.
```
