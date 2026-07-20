Type: task
Status: resolved
Blocked by: 01

## Question

Quais Permissões, papéis, parâmetros globais/da Filial, visibilidades, bloqueios e solicitações de usuário/senha governam consulta, edição, cálculo, cópia, exclusão de coluna e gravação de preços no Delphi; como devem virar policy, capabilities, manifesto de parâmetros e prova sensível no Laravel?

Separar autorização real de preferência visual e identificar precedência e escopo de Filial com evidência concreta.

## Answer

### Fronteira de segurança confirmada

**CONFIRMADO** — o Delphi permite consultar, selecionar linhas, editar valores no dataset em memória, aplicar percentual/validade, copiar e preparar exclusão de uma coluna sem solicitar credenciais. A autorização real ocorre somente quando o usuário aciona F5 e `AlterarColunasPrecosProdutos` começa a persistir as listas acumuladas (`fmmanutencaopreco.pas:1286-1324`; `dmmanutencaopreco.pas:1616-1674`).

**CONFIRMADO** — toda gravação interna exige um autorizador com perfil `GerenteEstoque`:

- se o usuário da sessão já é Gerente de Estoque, o legado solicita apenas sua senha: `ObterAutorizacao(taSENHA)`;
- caso contrário, solicita login e senha de outro usuário autorizado: `ObterAutorizacao(taLOGIN, ctGERENTEESTOQUE, ctAUTORIZADO)`;
- depois da autenticação, ainda confirma `Usuario.GerenteEstoque`; sem o perfil, mostra usuário sem permissão e não percorre as alterações.

Evidência: `dmmanutencaopreco.pas:1667-1674,1792-1798`.

**CONFIRMADO** — a mesma autorização cobre, em uma submissão, alterações de `colunasprecos`, Característica/markup/grupo/classe/marca, descontos por Cargo, Faixa escolhida pelo Produto e Promoção da Faixa (`dmmanutencaopreco.pas:1677-1790`). Logo, no novo fluxo atômico, copiar coluna, excluir valores, aplicar percentual e editar células são operações de preparação; a prova sensível é exigida uma vez no commit F5 do lote inteiro.

**NÃO LOCALIZADO** — não há, no form ou data module analisados, uma permissão distinta para copiar, excluir coluna, calcular, alterar Promoção ou alterar desconto por Cargo. Os estados `Enabled` derivam de existência de linhas, seleções de combos, aba ativa e presença de edição (`fmmanutencaopreco.pas:344-375`); são regras de estado da interface, não autorizações.

### Capabilities e policy no Laravel

**DECISÃO NOVA** — o módulo interno terá estas capacidades observáveis:

| Capability | Efeito | Prova sensível |
|---|---|---|
| `view` | Abrir módulo, carregar catálogos e parâmetros, executar F6 e consultar o grid. | Não. |
| `prepare` | Marcar linhas e preparar edição, cálculo, aplicação percentual/validade, cópia e exclusão no estado local. | Não; depende de `view` e deve ser exposta como `canPrepare`, sem endpoint de mutação. |
| `commit` | Submeter o lote atômico pelo F5. | Sim, sempre; autorizador `gerenteestoque`. |

**DECISÃO NOVA** — `view` deve ser concedida pelo item/capability próprio de **Estoque → Manutenção de Preços** em `acessosmodulos`/`usuariosacessosmodulos`. `prepare` não será uma permissão legada inventada: por padrão acompanha `view`, servindo para desabilitar a UI quando a página estiver em modo estritamente consultivo. `commit` exige simultaneamente acesso ao módulo e prova sensível válida; possuir perfil `gerenteestoque` não concede sozinho acesso ao módulo.

**DECISÃO NOVA** — todos os endpoints repetem a autorização no servidor:

- página, F6 e catálogos: policy/gate `view`;
- prévia de lote, se calculada no servidor sem persistência: `view`/`prepare`;
- F5: policy/gate `commit` mais consumo da prova sensível;
- nunca confiar apenas em botão oculto, `canCommit` enviado ao cliente ou validação feita no modal.

**INFERIDO** — o registro exato do menu Delphi está fora do form/data module e não foi localizado pelo nome da classe; portanto, o acesso ao módulo não pode ser derivado do perfil `GerenteEstoque`. No Laravel, a infraestrutura de menu por `acessosmodulos` já é o padrão e separa corretamente acesso da autorização elevada.

### Contrato da prova sensível

**DECISÃO NOVA** — cadastrar no catálogo genérico de operações sensíveis uma operação própria, sem reutilizar a identidade Marketplace:

- módulo: `Estoque`;
- ação: `manutencao_preco_salvar`;
- perfil legado exigido: `gerenteestoque`;
- modo: sempre exigido, sem parâmetro habilitador;
- reutilização: não reutilizar entre commits;
- vínculo: usuário da sessão, filial ativa/de referência e identidade do lote/revisão;
- consumo: uso único, imediatamente antes da transação;
- auditoria: ator da sessão e autorizador devem ser registrados separadamente, ainda que sejam a mesma pessoa.

**CONFIRMADO** — o Laravel já possui a infraestrutura adequada: `SensitiveOperationAuthDialog`, `useSensitiveOperationAuth`, endpoints de avaliação/validação, catálogo e prova consumível. A Manutenção Marketplace demonstra o padrão em `MarketplacePriceMaintenanceSensitiveOperationGate.php`, e sua definição exige `gerenteestoque` sempre em `config/sensitive-operation-auth.php:81-91`.

**DIVERGENTE** — a operação Marketplace usa módulo `Marketplaces`, ação própria, filial resolvida no contexto das contas e mensagem específica. O módulo interno deve compartilhar a infraestrutura, mas não a operação, gate ou escopo Marketplace.

**DECISÃO NOVA** — se o usuário da sessão tem `gerenteestoque`, o diálogo pode iniciar em modo “confirmar senha”; para os demais, solicita login e senha do autorizador. Essa diferença é somente de UX: em ambos os casos o backend autentica e comprova o perfil. Credenciais nunca integram o payload do F5; somente o token opaco da prova.

**DECISÃO NOVA** — cancelar ou falhar a autorização mantém o lote preparado e não persiste nada. Prova expirada, já consumida, ligada a outra filial/revisão ou a operação Marketplace é rejeitada. Mudança do lote depois da emissão da prova invalida sua utilização.

### Parâmetros e escopos

O manifesto interno mínimo comprovado é:

| Chave legada | Tipo/efeito | Escopo e classificação |
|---|---|---|
| `PRECOS POR CARGO` | Booleano; exibe/consulta colunas de Cargo e inclui seus descontos no cálculo/gravação. | **CONFIRMADO** — `fmmanutencaopreco.pas:627` e `dmmanutencaopreco.pas:1200`. Condiciona funcionalidade, não autoriza usuário. |
| `USAR GRADES PRODUTOS` | Booleano; mostra dimensões da grade do Produto. | **CONFIRMADO** — `fmmanutencaopreco.pas:904-915,1053`. Preferência/projeção visual; não bloqueia F6 ou F5. |
| `MULTIPLO DE PRECO` | Decimal; arredonda preço calculado/copiado quando Produto, Grupo e Classe não definem múltiplo mais específico. | **CONFIRMADO** — `dmmanutencaopreco.pas:586-595`. Regra de cálculo, não permissão. A precedência Produto → Grupo → Classe → parâmetro global deverá ser detalhada no motor comercial. |

**CONFIRMADO** — Filial Base, Coluna Normal e Coluna Promocional não são permissões. A Filial Base é o contexto padrão; ao marcar preços diferenciados, a Filial selecionada passa a resolver suas colunas e é obrigatória (`fmmanutencaopreco.pas:1372-1376,1503-1511`; `dmmanutencaopreco.pas:1018-1036`).

**DECISÃO NOVA** — criar `InternalPriceMaintenanceParameterManifest`, separado do manifesto Marketplace, com apenas as três chaves comprovadas acima. Usar `ParameterReadBundle` para leitura única e resolução no contexto da filial efetiva, preservando fallback global já oferecido pela infraestrutura. O payload expõe valores tipados e suas origens (`filial` ou `global`) para diagnóstico, mas não permite que o cliente os sobrescreva.

**DIVERGENTE** — `MarketplacePriceMaintenanceParameterManifest` também carrega `ALIQUOTA SIMPLES NACIONAL`; seu uso localizado pertence aos cálculos Marketplace e não foi comprovado no fluxo interno. Não integrar essa chave ao manifesto interno nesta fatia.

**DECISÃO NOVA** — o backend valida que Filial Base, Filial de preço diferenciada e Filial do filtro de movimentos estejam no conjunto autorizado ao usuário. A autorização elevada de um Gerente de Estoque não amplia o conjunto de filiais do ator; ela autoriza a operação sensível dentro do escopo já permitido.

### Visibilidade versus autorização

- **CONFIRMADO** — `PRECOS POR CARGO` controla a presença da área/colunas de Cargo; não concede capacidade.
- **CONFIRMADO** — `USAR GRADES PRODUTOS` controla colunas visuais; não concede capacidade.
- **CONFIRMADO** — aba Marketplace visível quando existem registros é lógica exclusiva retirada do módulo interno (`fmmanutencaopreco.pas:736-739`).
- **CONFIRMADO** — botões habilitados por linhas, seleção, alterações ou aba ativa representam pré-condições da operação, não segurança (`fmmanutencaopreco.pas:344-386`).
- **DECISÃO NOVA** — a interface deve ocultar/desabilitar ações conforme capability e estado, mas o servidor mantém a decisão autoritativa.

### Lacunas encaminhadas

- **DÚVIDA** — nome/rota e árvore exatos do novo item `acessosmodulos`; serão consolidados em **Comparar Laravel e definir arquitetura reutilizável**.
- **DÚVIDA** — granularidade do vínculo da prova à revisão e hash do lote; pertence a **Definir gravação atômica, concorrência e auditoria**.
- **DÚVIDA** — parâmetros e múltiplos específicos de Produto/Grupo/Classe, bem como seus valores inválidos, pertencem a **Reconstruir motor de cálculo de preços e margens**.
- **NÃO LOCALIZADO** — parâmetro que torne opcional a autorização por Gerente de Estoque. Como o legado a exige incondicionalmente, o novo contrato também a exige sempre.

Esta decisão deve integrar os `$to-spec` de **shell e consulta F6** (capabilities/visibilidades) e de **gravação atômica F5** (prova sensível). Não recomenda um spec isolado apenas de autorização.
