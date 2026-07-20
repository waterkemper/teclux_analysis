Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Como o Contrato deve tratar o Cliente — vínculo, fotografia cadastral, tipos de cliente permitidos por parâmetro, troca de cliente, inclusão durante o fluxo, dados editáveis, reflexo ou não no Cadastro de Clientes, dependentes, cônjuge, avalista, agentes e ficha financeira — inclusive quando originado de Orçamento?

Comparar com as decisões já tomadas no Cadastro de Orçamentos e separar claramente dados vinculados de dados congelados no Contrato.

## Comments

### Decisão confirmada — autoridade cadastral e sincronização

- Em `O`, `R` ou `F`, o cadastro mestre da parte que exerce o papel de Cliente é autoritativo para os dados pessoais/fiscais sincronizados com o Contrato.
- O Cadastro de Contratos oferece atalho para abrir o cadastro mestre já posicionado.
- Após gravar o cadastro mestre, o Contrato recarrega fotografia, campos fiscais e `revision` autoritativos.
- Em `P`, `N` ou `C`, a fotografia do Contrato fica congelada.
- A existência, condição exata e lista de campos da trigger de `clientes` para `contratos` não foram localizadas nos fontes versionados e devem ser confirmadas no schema PostgreSQL.
- Classificação: `DECISÃO NOVA` para o comportamento desejado; `DÚVIDA` para implementação e campos exatos da trigger.

### Decisão confirmada — papel Cliente e tipos cadastrais

- No contexto do Contrato, a parte é sempre chamada de Cliente.
- `tipocliente` identifica a origem cadastral: `C` Cliente, `F` Fornecedor ou `L` Filial.
- `SelecionarSomenteClientesnasVendas` ativo restringe a `C`; desativado permite `C/F/L`.
- O atalho abre o cadastro correspondente ao tipo selecionado.
- Classificação: `CONFIRMADO`, coerente com o vocabulário já decidido e com consultas Delphi por `cliente + tipocliente`.

### Decisão confirmada — troca de Cliente

- A troca é permitida somente em `O` ou `R`.
- O Contrato reutiliza o padrão preparar/confirmar da transição de Cliente já implementado para Orçamentos.
- A preparação calcula fotografia, preços, descontos, benefícios, Plano, Parcelas, alertas e Ficha Financeira; a interface apresenta os efeitos antes da confirmação.
- Cancelar preserva integralmente o Cliente anterior; confirmar altera o rascunho; F8 persiste tudo atomicamente com `revision`.
- Em `F/P/N/C`, não é permitido trocar Cliente.
- Classificação: `DECISÃO NOVA`, com prior art Laravel comprovado em `OrcamentoClienteTransitionService`.

### Decisão confirmada — edição do cadastro mestre

- O Contrato não reproduz as abas editáveis completas do Cadastro de Clientes/Fornecedores/Filiais.
- Exibe a fotografia necessária em modo de consulta e oferece `Editar Cliente` para abrir o cadastro mestre correspondente.
- Após salvar o mestre, o Contrato recarrega dados sincronizados e `revision`.
- O Contrato edita diretamente somente informações específicas da negociação.
- Classificação: `DECISÃO NOVA`.

### Decisão confirmada — fronteira dos dados

- Cadastro mestre: nome/razão social, documentos, inscrições, endereços cadastrais, telefones, e-mail, estado civil, renda, profissão, referências, cônjuge e demais dados gerais.
- Contrato: Cliente selecionado, dependente/beneficiário, avalista, consumidor final, emissão de NFC-e, endereço de entrega específico, contatos vinculados ao Contrato e escolhas comerciais/fiscais da Venda.
- Dados específicos do Contrato não são propagados automaticamente ao cadastro mestre.
- A lista exata de colunas sincronizadas pela trigger ainda depende da inspeção do schema.
- Classificação: `DECISÃO NOVA` para a fronteira; `DÚVIDA` para o conjunto físico exato da trigger.

### Decisão confirmada — Cadastro Expresso

- O Cadastro Expresso de Cliente existente no Laravel será reutilizado na inclusão e em `O/R`.
- O fluxo expresso cria somente origem cadastral `C`.
- Após sucesso, o novo Cliente é selecionado e passa pela mesma preparação/confirmacão de transição.
- Criar Cliente é operação própria; selecionar e aplicar efeitos ao Contrato integra o rascunho confirmado por F8.
- `F` e `L` usam os respectivos cadastros completos, sem fluxo expresso no Contrato.
- Classificação: `DECISÃO NOVA`, com componente e ações Laravel já existentes.

### Decisão confirmada — obrigatoriedade do Cliente

- O rascunho novo pode abrir sem Cliente, mas o primeiro F8 exige `tipo + código` válidos.
- Sem Cliente não há alocação de número nem persistência do Contrato.
- Cliente não pode ser removido de Contrato persistido; em `O/R`, somente substituído.
- Reserva e Faturamento revalidam o vínculo autoritativo.
- Classificação: `CONFIRMADO` no domínio e consolidado como regra do novo Cadastro.

### Decisão confirmada — avaliações na seleção

- Seleção/troca reutiliza alertas cadastrais e financeiros, abertura parametrizada da Ficha Financeira, Plano padrão, preço por Cliente/Cargo, markup, benefícios, saldos e bloqueios já tratados no fluxo de Orçamentos.
- A preparação mostra os efeitos; nada é aplicado silenciosamente antes da confirmação.
- Classificação: `DECISÃO NOVA`, com prior art Laravel existente.

## Answer

### Modelo aprovado

**DECISÃO NOVA** — Cliente é o papel comercial no Contrato. Sua identidade é composta por `tipocliente + cliente`, onde a origem cadastral pode ser:

- `C`: Cadastro de Clientes;
- `F`: Cadastro de Fornecedores;
- `L`: Cadastro de Filiais.

**CONFIRMADO** — O Delphi consulta e propaga o par `cliente + tipocliente` por Contrato, Produtos, movimentos, dados fiscais, contatos e integrações. Evidências: `qryContratostipocliente`, `SelecionarCliente`, `AtribuirClienteNoContrato` e queries relacionadas.

**DECISÃO NOVA** — `SelecionarSomenteClientesnasVendas` ativo restringe a seleção a `C`; desativado permite `C/F/L`. Independentemente da origem, a interface chama a parte de Cliente.

### Autoridade cadastral e fotografia

**DECISÃO NOVA** — Em `O`, `R` ou `F`, o cadastro mestre correspondente é autoritativo para os dados pessoais e fiscais sincronizados com o Contrato.

**DECISÃO NOVA** — Em `P`, `N` ou `C`, a fotografia fica congelada. Alterações posteriores no cadastro mestre não devem reescrever esses Contratos.

**CONFIRMADO** — A tabela `contratos` contém extensa fotografia de nome, pessoa/documento, inscrições, endereço, telefones, e-mail, dados pessoais e comerciais. Esses dados são usados pelo fluxo do Contrato e copiados para estruturas fiscais. Evidências: campos de `qryContratos`, `AtribuirClienteNoContrato` e atribuições a `qryDadosFiscais` em `dmcadastrocontratos.pas/.dfm`.

**DÚVIDA** — A trigger informada pelo usuário, que atualiza dados de Contratos até `F` após alteração em `clientes`, não foi localizada nos fontes versionados. Antes do spec é obrigatório consultar o schema PostgreSQL para confirmar:

- nome e definição da trigger/função;
- tabelas de origem cobertas (`clientes`, `fornecedores`, Filiais ou somente Clientes);
- condição exata de Situação;
- colunas copiadas;
- tratamento de `revision`/auditoria;
- interação com dados fiscais já preparados.

### Edição do Cliente

**DECISÃO NOVA** — O Cadastro de Contratos não reproduz as abas completas e editáveis do cadastro mestre. Ele exibe a fotografia necessária e oferece `Editar Cliente`.

- o atalho abre o cadastro correspondente a `C/F/L`, já posicionado;
- ao gravar o cadastro mestre, o Contrato recarrega fotografia, dados fiscais sincronizados e `revision` autoritativos;
- em `O/R/F`, a tela reflete a sincronização permitida;
- em `P/N/C`, apresenta separadamente o cadastro atual sem alterar a fotografia histórica.

**DIVERGENTE** — No Delphi, o form do Contrato contém grande parte do editor de Cliente e `GravarContrato` pode perpetrar Cliente e Contrato juntos. No Laravel, o cadastro mestre possui actions, requests, policy, auditoria e interface próprios e deve permanecer o único editor cadastral.

### Dados do mestre versus dados da negociação

**DECISÃO NOVA** — Pertencem ao cadastro mestre: nome/razão social, documentos, inscrições, endereços cadastrais, telefones, e-mail, estado civil, renda, profissão, referências, cônjuge e demais informações gerais.

**DECISÃO NOVA** — Pertencem ao Contrato: Cliente escolhido, dependente/beneficiário, avalista, consumidor final, opção de NFC-e, endereço de entrega específico, contatos vinculados ao Contrato e escolhas comerciais/fiscais desta Venda.

**DECISÃO NOVA** — Informações específicas da negociação não são propagadas automaticamente ao cadastro mestre.

### Seleção e troca

**DECISÃO NOVA** — Selecionar ou trocar Cliente usa o fluxo preparar/confirmar já criado para Orçamentos:

1. carregar identidade e cadastro autoritativos;
2. calcular fotografia e contexto comercial;
3. avaliar alertas cadastrais/financeiros e opção de Ficha Financeira;
4. calcular Plano padrão, preços por Cliente/Cargo, markup, descontos, benefícios, saldos e bloqueios parametrizados;
5. apresentar todos os efeitos ao usuário;
6. somente após confirmação aplicar ao rascunho;
7. persistir no F8 atômico com `expected_revision`.

**DECISÃO NOVA** — Cancelar a confirmação preserva integralmente Cliente, fotografia e dependências anteriores.

**DECISÃO NOVA** — Troca é permitida somente em `O/R`. Em `F/P/N/C`, o Cliente não pode ser substituído, ainda que dados cadastrais sincronizados possam ser atualizados em `F` pela regra do mestre.

### Obrigatoriedade

**CONFIRMADO** — Contrato só existe com Cliente.

- o rascunho novo pode abrir vazio;
- o primeiro F8 exige `tipo + código` válidos;
- sem Cliente não se aloca número nem se cria Contrato;
- Cliente não pode ser removido de Contrato persistido;
- em `O/R`, somente pode ser substituído pelo fluxo preparado;
- Reserva e Faturamento revalidam o vínculo.

### Cadastro Expresso

**DECISÃO NOVA** — O Cadastro Expresso Laravel é reutilizado na inclusão e em `O/R`, somente para origem `C`.

- criar o Cliente é operação própria e usa as validações/permissões do Cadastro de Clientes;
- o novo Cliente é selecionado automaticamente e passa pela preparação de transição;
- os efeitos no Contrato permanecem em rascunho até F8;
- `F/L` usam os respectivos cadastros completos.

### Reuso Laravel obrigatório

**CONFIRMADO** — Já existem Cliente completo, Cadastro Expresso, lookup, auditoria, conferência cadastral, Ficha Financeira e transição de Cliente no Orçamento. Evidências: actions e controllers de `Cadastros/Clientes`, `ClienteFeatureFlagsResolver`, `OrcamentoClienteTransitionService`, DTOs/resolvers e testes Feature de transição.

**DECISÃO NOVA** — O Contrato deve generalizar/reutilizar esses seams; não copiar controllers, SQL ou componentes sob namespace próprio sem necessidade.

### Fora deste ticket

- lista física final de campos sincronizados pela trigger;
- efeitos completos sobre Produtos, preços, Planos e Parcelas, tratados nas respectivas fatias;
- regras de avalista/dependente e Ficha Financeira além do disparo da seleção;
- permissões detalhadas para abrir/editar cada cadastro;
- regras fiscais posteriores a `F`.

### Aptidão para `$to-spec`

**CONFIRMADO** — A fatia de Cliente não deve receber spec isolado neste momento; ela integra o primeiro spec do núcleo. Esse spec permanece bloqueado pela confirmação da trigger, pela matriz de autorizações/parâmetros e pela reconciliação do Contrato originado de Orçamento.
