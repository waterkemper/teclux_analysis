Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Qual é o recorte mínimo e coerente do núcleo do Cadastro de Contratos para abertura, localização, inclusão, edição, cancelamento de edição e gravação, e qual deve ser sua fronteira transacional e de idempotência no Laravel?

Decidir quais dados e invariantes pertencem ao núcleo, quais abas podem carregar sob demanda e quais operações devem permanecer serviços externos.

## Comments

### Decisão confirmada — localização

- O Cadastro de Contratos terá `Localizar (F9)` no mesmo padrão do Cadastro de Orçamentos.
- O F9 abrirá lookup por número do Contrato e nome do Cliente e carregará a seleção no próprio Cadastro.
- Alterações não gravadas exigem confirmação antes do descarte.
- A Consulta de Contratos permanece como superfície de filtros avançados, operações e análise em lote.
- F9 e Consulta devem compartilhar a mesma fonte de consulta para evitar SQL e regras divergentes.
- Classificação: `DECISÃO NOVA`, reaproveitando o seam Laravel comprovado em `Vendas/Orcamentos/Cadastro`.

### Decisão confirmada — unidade de gravação

- `Gravar (F8)` confirma atomicamente o rascunho inteiro do Contrato: cabeçalho e alterações pendentes nas abas carregadas são validados e persistidos juntos.
- Falha em qualquer validação ou escrita impede a confirmação de todo o rascunho.
- Reservar, Faturar, Cancelar, emitir documento fiscal, enviar e-mail e outras operações com ciclo próprio são comandos separados e não efeitos implícitos do F8.
- Após sucesso, o servidor devolve a fotografia autoritativa do Contrato e uma nova revisão.
- Classificação: `DECISÃO NOVA`, preservando a intenção transacional do Delphi sem repetir o data module monolítico.

### Decisão confirmada — concorrência

- O Cadastro usará concorrência otimista por `revision`, seguindo o precedente do Cadastro de Orçamentos.
- F8 e todo comando mutável enviam `expected_revision`; divergência rejeita a operação e exige recarga da fotografia autoritativa.
- Bloqueio de banco existe apenas durante transações curtas; abrir a página não mantém bloqueio persistente do Contrato.
- A tabela/temporizador `bloqueiocontrato` do Delphi não é requisito da interface web.
- Classificação: `DECISÃO NOVA`; o bloqueio pessimista legado permanece apenas como evidência do risco de concorrência.

### Decisão confirmada — alocação do número

- Um novo Contrato não possui número definitivo enquanto existe apenas como rascunho no navegador.
- O número é obtido e persistido dentro da transação do primeiro F8 bem-sucedido.
- Abandonar a inclusão não cria Contrato vazio; falha transacional não deixa Contrato parcial disponível.
- A geração a partir de Orçamento continua alocando o número dentro de sua própria transação idempotente.
- Classificação: `DECISÃO NOVA`.

### Decisão confirmada — carregamento progressivo

- A abertura inicial carrega somente identidade, Situação, revisão, origem, Cliente resumido, Filial, vendedor, datas, indicadores de permissão e totalizadores.
- Produtos, Serviços, pagamentos, entrega, contatos, atendimentos, questionários, fiscal e histórico carregam sob demanda ao abrir a respectiva aba.
- Aba alterada integra o rascunho atômico do próximo F8; aba apenas consultada e inalterada não precisa ser reenviada.
- Comandos de domínio revalidam no servidor todos os dados necessários, independentemente das abas abertas no navegador.
- Classificação: `DECISÃO NOVA`.

### Decisão confirmada — seam de aplicação

- Um único seam de aplicação governa carregar, criar pelo primeiro F8, atualizar por F8 + `revision` e carregar abas sob demanda.
- Controllers, componentes e abas não gravam diretamente nas tabelas legadas.
- Reservar, Faturar, Cancelar, imprimir, enviar e demais operações usam serviços próprios.
- Todo comando mutável bem-sucedido devolve ao shell a nova fotografia autoritativa e revisão do Contrato.
- Classificação: `DECISÃO NOVA`.

### Decisão confirmada — apresentação de validações

- F8 devolve erros estruturados por seção, campo e linha.
- A interface abre a primeira aba inválida, destaca todos os erros e preserva o rascunho inteiro.
- Nenhuma parte é persistida quando existe erro bloqueante.
- Conflito de `revision` é erro global e exige recarga; avisos não bloqueantes são apresentados separadamente.
- Classificação: `DECISÃO NOVA`.

## Answer

### Limite do núcleo

**DECISÃO NOVA** — O núcleo do Cadastro de Contratos será um coordenador de rascunho e identidade, responsável por:

- abrir inclusão ou Contrato existente;
- localizar Contrato por F9;
- expor identidade, Situação documental, `revision`, origem e indicadores de mutabilidade;
- carregar o resumo necessário ao shell;
- carregar seções sob demanda;
- criar no primeiro F8;
- atualizar por F8 com concorrência otimista;
- validar e confirmar atomicamente o rascunho;
- devolver a fotografia autoritativa após gravação ou comando mutável.

**DECISÃO NOVA** — O núcleo não implementa internamente as regras completas de Cliente, Produtos, Serviços, pagamentos, estoque, entrega, fiscal, atendimento, questionários, impressão ou e-mail. Ele coordena contratos de seção definidos nas respectivas fatias.

**DIVERGENTE** — O Delphi concentra essas responsabilidades em `TfrmCadastroContratos` e `TdtmCadastroContratos`; o Laravel deve preservar comportamento e atomicidade, não a concentração estrutural.

### Abertura e inclusão

**DECISÃO NOVA** — A inclusão manual abre um rascunho local sem número definitivo. O Contrato nasce em `O — Orçado` somente no primeiro F8 bem-sucedido.

**DECISÃO NOVA** — O número é obtido e persistido dentro da mesma transação da criação. Abandonar a inclusão não cria registro vazio; falha não publica Contrato parcial.

**CONFIRMADO** — No Delphi, `InternoIncluir` chama `IncluirContrato`, coloca `qryContratos` em insert e abre imediatamente Parcelas, Produtos, Serviços, Plano e anexos dependentes. Evidências: `TfrmCadastroContratos.InternoIncluir` e `TdtmCadastroContratos.IncluirContrato`.

**DIVERGENTE** — O novo Cadastro não abrirá todos os datasets na inclusão nem consumirá identidade antes da primeira gravação.

**CONFIRMADO** — Contrato originado de Orçamento já possui fluxo Laravel próprio e número alocado em transação. Ele deverá passar a produzir uma fotografia compatível com este mesmo núcleo, sem criar um segundo Cadastro.

### Localização F9

**DECISÃO NOVA** — O Cadastro terá `Localizar (F9)` no mesmo padrão implementado no Cadastro de Orçamentos:

- lookup inicial por número do Contrato e nome do Cliente;
- seleção carrega o Contrato no próprio Cadastro;
- rascunho sujo exige confirmação antes do descarte;
- mudança de registro reinicializa baseline e `revision`;
- rota direta por número continua suportada.

**DECISÃO NOVA** — A Consulta de Contratos permanece para filtros avançados, análise e operações em lote. F9 e Consulta compartilham a mesma fonte de consulta, evitando SQL divergente.

**CONFIRMADO** — O precedente Laravel de Orçamentos já trata F9, confirmação de descarte, troca de baseline e navegação por código em `Vendas/Orcamentos/Cadastro`.

### Carregamento progressivo

**DECISÃO NOVA** — O payload inicial contém somente:

- número, quando persistido;
- Situação documental e rótulo;
- `revision`;
- origem e vínculos resumidos;
- Cliente resumido;
- Filial e vendedor;
- datas principais;
- indicadores de permissão/mutabilidade;
- totalizadores necessários ao shell;
- URLs/capacidades das seções e comandos disponíveis.

**DECISÃO NOVA** — Produtos, Serviços, pagamentos, entrega, contatos, atendimentos, questionários, fiscal e histórico carregam ao abrir a aba.

**DECISÃO NOVA** — Aba apenas consultada não é reenviada. Aba alterada integra o rascunho do próximo F8. Comandos de domínio nunca confiam em ausência de aba no browser: revalidam no servidor os dados persistidos necessários.

### Gravação F8

**DECISÃO NOVA** — F8 é uma única unidade atômica de confirmação do rascunho:

1. recebe cabeçalho, seções alteradas e `expected_revision`;
2. carrega/valida a Situação e revisão autoritativas;
3. delega validação para as seções participantes;
4. acumula erros sem persistir parcialmente;
5. persiste todas as mudanças válidas em uma transação curta;
6. incrementa `revision`;
7. devolve fotografia autoritativa e novo baseline.

**DECISÃO NOVA** — Reservar, Faturar, Cancelar, emitir documento fiscal, imprimir e enviar e-mail não são efeitos do F8. São comandos explícitos com serviços e transações próprios.

**CONFIRMADO** — O Delphi procura gravar conjuntos coordenados por `tstContrato`, executa validações de Contrato, Cliente, Produtos, lotes, parcelas, descontos e totais, e faz commit/rollback. Evidência: `TdtmCadastroContratos.GravarContrato` e chamadas `Perpetrar`.

**POSSÍVEL BUG LEGADO** — O método Delphi mistura persistência, emissão fiscal, impressão, agendamento, atendimento e atualização de outras telas dentro do mesmo fluxo. Essa amplitude não é requisito para o F8 inicial.

### Concorrência

**DECISÃO NOVA** — O Cadastro usa concorrência otimista por `revision`, conforme o precedente do Cadastro de Orçamentos.

- toda mutação envia `expected_revision`;
- revisão divergente rejeita sem sobrescrever dados;
- a interface orienta recarga por F9/Localizar;
- a transação usa bloqueio de banco apenas durante leitura para atualização e escrita;
- abrir ou manter a página não bloqueia o Contrato para outros usuários.

**CONFIRMADO** — O Delphi reconhece o risco de edição concorrente usando `bloqueiocontrato`, usuário, login, PID, horários e timer. Evidências: `BloquearContrato`, `VerificarContratoBloqueado`, `TimerVerificarBloqueioContrato` e `qryBloquearContrato`.

**DIVERGENTE** — A tabela/temporizador de bloqueio pessimista não será reproduzida como experiência web; sua finalidade será atendida pela revisão otimista.

### Seam de aplicação

**DECISÃO NOVA** — Existirá um único seam de aplicação do Cadastro para:

- carregar inclusão/Contrato;
- localizar pelo lookup compartilhado;
- criar;
- atualizar;
- carregar seção.

Controllers, páginas e componentes não escrevem diretamente nas tabelas legadas. Repositórios encapsulam SQL; validadores de seção encapsulam regras; o coordenador controla revisão e transação.

**DECISÃO NOVA** — Serviços próprios de Reserva, Faturamento, Cancelamento e demais operações retornam a mesma forma de fotografia/revisão, permitindo ao shell realinhar o estado sem recarregamentos inconsistentes.

**CONFIRMADO** — O Laravel já oferece prior art: `ConsultaContratosGravarAlteracaoService` usa request, change set, autorização, `DB::transaction`, repositório com carregamento para atualização e resposta de detalhe; o Cadastro de Orçamentos usa `expected_revision` e baseline autoritativo.

**DIVERGENTE** — A escrita limitada da Consulta de Contratos não deve se tornar um segundo fluxo concorrente. Ao surgir o Cadastro, suas operações compatíveis devem compartilhar serviços/repositórios do núcleo ou ser explicitamente mantidas como comandos especializados.

### Validações e erros

**DECISÃO NOVA** — Erros são estruturados por seção/campo/linha. A interface abre a primeira aba inválida, destaca todos os problemas e preserva o rascunho.

**DECISÃO NOVA** — Conflito de revisão é erro global. Aviso não bloqueante é categoria distinta e não deve ser devolvido como falha de validação.

**DECISÃO NOVA** — Validações transversais pertencem ao coordenador; regras internas pertencem ao contrato de cada seção. Isso permite adicionar fatias sem aumentar indefinidamente um único serviço.

### Fora deste ticket

- campos completos e propagação da fotografia do Cliente;
- regras de Produtos, Serviços e cálculo comercial;
- Planos, Parcelas e Ficha Financeira;
- efeitos de estoque/reserva;
- Faturamento e fiscal;
- matriz de permissões e parâmetros;
- desenho visual final do shell;
- detalhes das operações transversais.

### Aptidão para `$to-spec`

**CONFIRMADO** — Este ticket não deve receber `$to-spec` isoladamente. Núcleo e ciclo de vida já estão claros, mas o primeiro spec implementável ainda depende de “Definir vínculo e fotografia do Cliente”, “Mapear autorizações, permissões e parâmetros” e “Reconciliar Contrato originado de Orçamento”.
