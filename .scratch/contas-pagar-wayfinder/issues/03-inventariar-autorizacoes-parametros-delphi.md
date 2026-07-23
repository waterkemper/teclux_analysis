# Inventariar Permissões, Autorizações e Parâmetros Delphi de Contas a Pagar

Type: task
Status: resolved
Blocked by:

## Question

Quais Permissões, Autorizações, perfis, gates visuais e operacionais, escopos de Filial e Parâmetros do Sistema/Filial/ambiente governam Contas a Pagar no Delphi, rastreando para cada parâmetro a constante, o texto canônico em `clparametrossistema`, o default/precedência observado e todos os efeitos e pontos de uso?

## Answer

### Modelo de acesso encontrado

`CONFIRMADO` — O legado combina quatro mecanismos diferentes:

1. **Acesso ao item de menu/módulo** por `ModuloDisponivel('contaspagar')`, Administrador/Suporte ou entrada em `AcessosUsuarios`; o menu “Contas a Pagar → Documentos” é carregado pelo executor genérico (`fmtecsoft.dfm:512-545`; padrão de habilitação em `fmtecsoft.pas:1519-1523`).
2. **Capacidades permanentes do Usuário**: `AlterarDadosContabeis`, `Pagamento`, `Administrador`, `Suporte` e o login especial literal `tecsoft`.
3. **Autorização sensível no momento da ação**: senha do próprio Usuário com capacidade Pagamento ou login de outro Usuário por `ctAUTORIZACAOPAGAMENTO/ctAUTORIZADO`.
4. **Gates contextuais**: data de fechamento, existência de Nota/origem, pagamento, impostos vinculados, previsão, estado do dataset e Filial/conta escolhidas.

`DECISÃO` — O Laravel deve modelar esses níveis separadamente: ability para abrir/consultar; abilities de manter Documento/Duplicata e Contabilidade; capability sensível para autorizar/efetivar/cancelar/imprimir pagamento; e regras contextuais server-side. Props da UI apenas refletem decisões do backend.

### Permissões e capacidades permanentes

| Capacidade Delphi | Efeito confirmado | Evidência |
|---|---|---|
| `AlterarDadosContabeis` | Permite editar Documento depois do fechamento aplicável, incluir/alterar/excluir Duplicatas, operar pagamentos junto com `Pagamento` e editar Contabilidade quando `GerarContabilidade` está ativo | `dmcontaspagar.pas:2825-2898,3507-3522,4218-4230`; `fmcontaspagar.pas:590-603` |
| `Pagamento` | Habilita manutenção de Duplicatas/pagamentos e qualifica o Usuário para autorizar pagamento por senha | `fmcontaspagar.pas:527-539,597-603`; `dmcontaspagar.pas:4635-4661` |
| `Administrador` / `Suporte` | Enxerga e consulta Documentos marcados `administrador`; pode ver/marcar o checkbox Administrador | `fmcontaspagar.pas:439`; `dmcontaspagar.pas:1107-1115,4354-4359` |
| login literal `tecsoft` | Exibe `ckbRefazerPagamento` no modal de Duplicata | `fmcadastroduplicatascontaspagar.pas:174` |

`POSSÍVEL BUG LEGADO` — `GetPermiteAlterarContabilidade` exige `documentopagorigem <> 0` ao editar registro existente, enquanto `GetSomenteLeituraContabilidade` torna Documento de origem somente leitura. As regras aparentam contradizer-se (`dmcontaspagar.pas:3507-3522,4218-4230`). A matriz não deve copiar essa expressão; deve derivar uma policy coerente e cobri-la com casos de Documento próprio versus originado.

`RISCO LEGADO` — O login mágico `tecsoft` não é uma Permissão auditável. “Refazer pagamento” deve ser uma ability administrativa explícita e operação sensível auditada, nunca uma comparação de username.

### Autorizações sensíveis

- `CONFIRMADO` — Pagar uma Duplicata não autorizada chama `ObterAutorizacao`: se o operador possui `Pagamento`, pede senha (`taSENHA`); caso contrário pede login de autorizador (`taLOGIN`, `ctAUTORIZACAOPAGAMENTO`, `ctAUTORIZADO`). Só prossegue se o Usuário retornado possui `Pagamento` (`fmcontaspagar.pas:522-543`).
- `CONFIRMADO` — Imprimir autorização de pagamento repete o mesmo fluxo de autenticação e só imprime se o autorizador possui `Pagamento` (`dmcontaspagar.pas:4625-4677`).
- `CONFIRMADO` — `duplicatas.autorizado` e `dataautorizacaopagto` guardam o fato de autorização. Nova Duplicata pode nascer autorizada automaticamente conforme parâmetro (`dmcontaspagar.pas:2780-2804,3088-3091`).
- `CONFIRMADO` — O Usuário que efetiva pagamento é gravado em `duplicatas.usuario` nos fluxos em lote/retorno (`dmcontaspagar.pas:3747-3773`).

`DECISÃO` — No Laravel, autorização de pagamento deve produzir evidência durável contendo Duplicata, autorizador, operador, instante do servidor, método/contexto e resultado. A autorização deve ser revalidada server-side no comando de pagamento; esconder botão ou confiar em `autorizado` vindo do cliente é insuficiente.

`DÚVIDA PARA A MATRIZ` — O legado não demonstra expiração, revogação nem invalidação da autorização quando valor, vencimento, fornecedor ou Filial mudam. Recomenda-se vincular a autorização a uma assinatura/revisão dos dados financeiros relevantes.

### Gates contextuais server-side

- **Editar Documento**: lançamento posterior à Data Contábil, sem quitação, capacidade contábil ou de pagamento e sem Documento de origem (`dmcontaspagar.pas:2825-2835`).
- **Gerar Duplicatas**: inclusão ou, em registro existente, lançamento aberto, sem quitação, capacidade apropriada e sem origem (`dmcontaspagar.pas:2837-2852`).
- **Pagar/cancelar**: Documento já persistido, não previsão, Duplicata existente, data compatível com fechamento, capacidade apropriada e ausência de quitação de imposto vinculada (`dmcontaspagar.pas:2854-2873,4767-4783`).
- **Alterar/excluir Duplicata**: não paga, capacidade apropriada e sem imposto vinculado (`dmcontaspagar.pas:2875-2898`).
- **Excluir Documento**: além da capacidade visual, bloqueia pagamento, imposto pago, origem e data fechada (`dmcontaspagar.pas:1400-1462`).
- **Contabilidade**: requer capacidade `AlterarDadosContabeis`, parâmetro ativo, período permitido, Documento não originado e ano/exercício permitido; a contradição citada precisa ser resolvida (`dmcontaspagar.pas:3507-3522,4218-4230`).
- **Administrador**: Documento marcado administrador é filtrado no SQL para qualquer Usuário que não seja Administrador/Suporte, tanto na pesquisa quanto na abertura do dataset (`dmcontaspagar.pas:1107-1115,4354-4359`).

### Filiais e escopo

- `CONFIRMADO` — Novo Documento usa `FilialBase`; nova quitação interativa também usa `FilialBase` como Filial de Pagamento. Ambas podem depois ser pesquisadas/alteradas quando o estado permite (`dmcontaspagar.pas:2811-2815,2909-2919,2969-3003`).
- `CONFIRMADO` — A Filial de Emissão determina calendário/primeiro dia útil, impostos disponíveis e uma possível Filial Contábil alternativa cadastrada na própria Filial. A Filial de Pagamento governa os lançamentos do pagamento (`dmcontaspagar.pas:1292-1294,3093-3137,3409-3447,3625-3632,4149-4152`).
- `CONFIRMADO` — Consultas de Filial abrem `qryConsultaFiliais` sem condição visível por Usuário; os fluxos em lote aceitam `FilialPagto` como argumento (`dmcontaspagar.pas:1117-1119,3747-3773`).

`DIVERGENTE/SEGURANÇA` — Não foi localizado gate de Filiais autorizadas do Usuário no núcleo Delphi. O Laravel deve sempre intersectar Filial de Emissão, Filial Contábil e Filial de Pagamento com o escopo autorizado no backend. Filial Base é default, não autorização. Lookups e comandos devem usar a mesma regra.

### Parâmetros ativos e textos canônicos

Os getters leem `FList[constante]` tipado; não há default de negócio explícito nos getters. Portanto `default legado` abaixo significa apenas o comportamento observado quando o valor tipado é falso/zero/vazio. O prompt Laravel deverá usar exatamente `parametros_valor('<texto>')` e definir fallback seguro explícito.

| Propriedade Delphi | Texto canônico persistido | Tipo / fallback observado | Efeito em Contas a Pagar |
|---|---|---|---|
| `GerarContabilidade` | `GERARCONTABILIDADE` | Boolean; falso oculta/desativa | Exibe aba, torna contas/eventos obrigatórios, gera/valida lançamentos, condiciona pagamento e Adiantamento (`clparametrossistema.pas:2127,7779-7788`; `fmcontaspagar.pas:414-416,1000-1002`; `dmcontaspagar.pas:1313-1315,1765-1985`) |
| `DataContabil` | `DATA CONTABIL` | Date; ausência válida não definida | Fecha edição/exclusão/pagamento e limita datas. `DataContabilString` é representação derivada, não outra chave (`clparametrossistema.pas:1969,2606-2609`; `dmcontaspagar.pas:1306,1327-1398,2825-2898`) |
| `EXERCICIOCONTABILIDADE` | `EXERCICIOCONTABILIDADE` | Integer | Limita edição contábil a exercício/anos aceitos (`clparametrossistema.pas:2126,4383-4391`; `dmcontaspagar.pas:4218-4230`) |
| `DiasNotaRetroativa` | `DIASNOTARETROATIVA` | Integer; zero impede retroação adicional | Define data mínima de Emissão e mensagens (`clparametrossistema.pas:2128,7790-7798`; `fmcontaspagar.pas:980-994,1236-1252`) |
| `AutorizacaoPagtoAutomatica` | `AUTORIZACAO PAGTO AUTOMATICA` | Boolean; falso cria não autorizada | Define `autorizado` e data em novas/parcelas residuais (`clparametrossistema.pas:1992,2782-2785`; `dmcontaspagar.pas:2780-2804,2696-2705`) |
| `InicioIntegracaoBancos` | `Início Integração Bancos` | Date; `<= 01/01/1980` desliga | A partir da data torna Evento obrigatório e grava sequências/movimentos bancários (`clparametrossistema.pas:2009,4307-4315`; `dmcontaspagar.pas:1310-1311,2315-2480,3782-3803`) |
| `GeracaoAutomaticadoImpostoRetido` | `Geração automática do imposto retido` | Boolean; falso não habilita geração automática | Bloqueia inicialmente valores, carrega configuração da Filial, controla campos mutuamente exclusivos e gera/verifica documentos tributários (`clparametrossistema.pas:2156,7967-7975`; `fmcontaspagar.pas:432,1094-1190,1348-1374`; `dmcontaspagar.pas:3625-3627`) |
| `historicopadraopagtoduplicata` | `Histórico padrão pagto duplicata` | String/código; vazio cai para Fornecedor e depois zero | Segunda precedência do histórico do pagamento: Fornecedor específico → parâmetro → histórico geral do Fornecedor → zero (`clparametrossistema.pas:2269,5726-5734`; `dmcontaspagar.pas:4860-4872`) |
| `SelecionarSomenteFornecedoresnasContasaPagar` | `Selecionar somente fornecedores nas contas a pagar` | Boolean; falso permite todos os tipos de `vfornecedores` | Quando verdadeiro restringe pesquisa a tipos `F` e `L` (`clparametrossistema.pas:2326,6467-6475`; `dmcontaspagar.pas:1506-1522,2946-2967`) |
| `Evento_para_pagamento_de_romaneio` | `Evento para pagamento de romaneio` | String/código; vazio deixa Evento ausente e poderá falhar conforme integração | Preenche Evento na criação/atualização de Documento originado por Romaneio (`clparametrossistema.pas:2306,6248-6256`; `dmcontaspagar.pas:5461-5556`) |

### Configurações secundárias ou inativas

- `Contabilizacaoporregimedecaixa` → `Contabilização por regime de caixa`: todas as referências funcionais encontradas no núcleo estão comentadas; não é parâmetro ativo comprovado desta tela. O campo persistido `regimedecaixa` e seu comportamento continuam ativos e são distintos (`clparametrossistema.pas:2167,8044-8052`; `dmcontaspagar.pas:1404-1406,2827-2834`).
- `CorZebradoRelatorio` → `COR ZEBRADA DO RELATORIO`: só aparece na configuração Reinf desativada; fora da paridade obrigatória (`clparametrossistema.pas:2088,7608-7616`; `fmcontaspagar.pas:1667-1747`).
- `DataServidor`/`DataHoraServidor`, `FilialBase` e dados de Usuário são contexto de sessão/banco, não Parâmetros do Sistema. Devem vir de serviços confiáveis server-side.
- Configurações de impostos (`venctosimpostosretidosentradas`, `contasentradasfiliais`) e conta/Filial contábil são dados relacionais por Filial/Fornecedor, não chaves de `parametros_valor`; não devem ser achatadas em parâmetros textuais.

### Riscos e requisitos para a matriz Laravel

1. Nunca confiar em gates de `Enabled/Visible/ReadOnly`; toda consulta e mutação deve aplicar Policy/ability e regra contextual.
2. Separar `view`, `maintain_document`, `maintain_installment`, `authorize_payment`, `execute_payment`, `cancel_payment`, `print_payment_authorization`, `view_admin_document`, `maintain_accounting` e `force_rebuild_payment` — nomes finais seguem o padrão Laravel existente.
3. Registrar operador e autorizador separadamente; exigir autenticação recente/step-up nas operações sensíveis conforme o padrão existente.
4. Invalidar ou revisar autorização quando a assinatura financeira da Duplicata mudar.
5. Aplicar Filiais autorizadas em lookup, leitura, criação, pagamento, Contabilidade, impostos, lote e retorno.
6. Resolver parâmetros uma vez no backend com tipo/fallback explícitos; frontend recebe capacidades/configuração derivadas, nunca decide pela string bruta.
7. Testar ausência, vazio, zero, valor inválido e datas-limite para todas as chaves canônicas.
