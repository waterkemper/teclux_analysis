Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Qual deve ser a experiência final no Laravel para conciliar produtividade e descoberta: quais botões/presets explícitos representam as funções antes acessadas por Alt+F5, Alt+F7 e Alt+F8, como o estado atual é comunicado, como preferências e exportação se comportam e quais operações legadas devem ser removidas ou redesenhadas?

## Comments

- Decisão do usuário: não haverá atalhos de teclado para estas alternâncias; somente botões visíveis com as mesmas funcionalidades aprovadas.
- O antigo Alt+F5 será substituído pelo botão/preset **Visão de custos**, disponível apenas a usuários autorizados, exibindo os dados financeiros aprovados exclusivamente para consulta, sem edição de movimentos ou valores.
- O antigo ciclo Alt+F7 será substituído por três escolhas diretas e visíveis: **Referência**, **Operação** e **Cliente/Fornecedor**. Não haverá alternância cíclica; Operação exibirá as 14 posições EST–TCOM e sua legenda.
- O antigo Alt+F8 será substituído pelo botão **Saldos do movimento**, abrangendo Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Estoque físico e Reserva prévia. Custo médio fica exclusivamente em **Visão de custos**, sujeito à autorização financeira.
- Os botões de visão serão seletores combináveis. O estado ativo fica visualmente destacado; novo clique desativa o grupo; **Restaurar visão padrão** desativa todos os grupos e recupera o padrão. O seletor manual **Campos da Grade** continua disponível.
- A ativação dos botões vale somente para a consulta/sessão atual e funciona como camada temporária sobre as preferências permanentes. Ao reabrir a tela, inicia-se na visão padrão. Ordem visual, largura e seleção manual em **Campos da Grade** permanecem persistentes; restaurar a visão remove apenas a camada temporária.
- **Exportar** gerará no servidor o extrato completo da consulta, nunca apenas a página atual: respeitará filtros, ordem canônica `filial, produto, data, lancto`, colunas visíveis (inclusive grupos temporários), total informado e AuthZ financeira; não permitirá outra ordenação no arquivo.
- **Buscar na grade** pesquisará no servidor sobre o extrato completo, preservando sua ordem canônica. Reduz apenas as linhas exibidas, informa o total encontrado, limita-se a campos textuais/identificadores permitidos e nunca consulta valores financeiros ocultos; limpar a busca retorna ao início do extrato.
- A regra **somente botões** vale para toda a tela: Gerar perde F6; data final perde disparo por Enter; Campos da Grade perde Alt+G; Exportar perde Ctrl+X; Alt+F5/F7/F8 não são recriados. Permanecem apenas Tab/Enter/Espaço nativos para acessibilidade dos controles.

## Answer

A experiência final usará somente botões visíveis e autoexplicativos. Nenhuma ação dependerá de atalho de teclado nem exibirá uma combinação de teclas. Os botões continuam acessíveis pela navegação nativa com Tab e pelo acionamento com Enter/Espaço.

### Botões de visão

- **Referência**: destaca identificação, referência e lote do movimento.
- **Operação**: exibe diretamente as 14 posições EST, RES, TRÂ, DEM, CON, FUT, DAN, FÍS, PRV, U.ENT, U.COMP, FIN, TVEN e TCOM, junto de legenda visível; não reproduz o ciclo incompleto do Delphi.
- **Cliente/Fornecedor**: exibe a contraparte relacionada ao movimento.
- **Saldos do movimento**: exibe Em estoque, Reservado, Trânsito, Demonstração, Conserto, Futuro, Danificada, Estoque físico e Reserva prévia.
- **Visão de custos**: somente para usuário autorizado; exibe os dados financeiros aprovados, como Financeiro, Valor, Custo médio, preços, IPI e moeda, exclusivamente para consulta.
- **Restaurar visão padrão**: desativa todos os grupos temporários sem apagar a personalização permanente.

Os botões são seletores combináveis: podem ficar ativos simultaneamente, o estado ativo recebe destaque visual e novo clique desativa somente aquele grupo. Custo médio nunca integra **Saldos do movimento** e nenhuma visão permite editar movimentos ou valores.

### Estado e preferências

As visões ativas valem somente para a consulta/sessão atual. Ao reabrir a tela, inicia-se na visão padrão. Elas formam uma camada temporária sobre as preferências permanentes do usuário. Ordem visual das colunas, largura e seleção manual em **Campos da Grade** continuam persistentes; restaurar a visão remove apenas a camada temporária.

A ordenação das linhas não é configurável. A Ficha é um extrato do produto na filial e preserva sempre a sequência canônica `filial, produto, data, lancto`, inclusive após busca, paginação e exportação.

### Busca e exportação

**Buscar na grade** consulta no servidor o extrato completo, não somente a página carregada. Ela reduz as linhas sem mudar sua ordem relativa, informa o total encontrado, pesquisa apenas campos textuais e identificadores permitidos e jamais usa dados financeiros ocultos. Ao limpar, retorna ao início do extrato.

**Exportar** também é server-side e abrange o extrato completo. Respeita filtros, ordem canônica e as colunas visíveis, inclusive grupos temporariamente ativos. Informa o total exportado e aplica AuthZ no servidor; campos financeiros não autorizados não entram no catálogo nem no arquivo.

### Operações removidas ou redesenhadas

- Alt+F5 vira **Visão de custos**, sem edição.
- Alt+F7 vira escolha direta entre **Referência**, **Operação** e **Cliente/Fornecedor**, sem ciclo.
- Alt+F8 vira **Saldos do movimento**, sem Custo médio e incluindo Reserva prévia.
- F6 e Enter na data final são removidos como disparadores; **Gerar** funciona pelo botão.
- Alt+G e Ctrl+X são removidos; **Campos da Grade** e **Exportar** funcionam pelos respectivos botões.
- F5/salvar e qualquer mutação permanecem fora da Ficha de Produtos, que é somente consulta.

Esse desenho mantém as capacidades úteis do legado, corrige os vazamentos e inconsistências identificados e torna cada estado descobrível sem exigir memorização de teclas.
