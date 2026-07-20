Type: task
Status: resolved
Blocked by: 03, 04, 05, 06, 07

## Answer

### Decisão arquitetural

Preservar a infraestrutura atual como um módulo profundo: uma rota lazy por `produto + filial + detalhe`, um serviço de dispatch, repositories legados especializados, manifesto central de parâmetros/capabilities, um hook de carregamento e componentes de apresentação. As correções entram nesses seams; não criar cinco módulos, rotas redundantes, formatadores ou motores de cálculo paralelos.

### Rota lazy e dispatch

- Manter `GET /produtos/{produto}/filiais/{filial}/detalhes/{detalhe}` e a lista fechada de detalhes suportados.
- Fluxo obrigatório: validar detalhe → autenticar módulo → validar Filial autorizada → validar linha Produto+Filial → autorizar capability específica → consultar repository → mapear DTO.
- A autorização específica ocorre antes de qualquer query sensível. Não carregar Financeiro/Preço e decidir depois se remove do JSON.
- O dispatcher conhece políticas e composição; SQL não fica no controller. Repositories conhecem persistência; não recebem usuário/capabilities.
- Evitar `Schema::hasTable/hasColumn` em request. Schema incompatível é falha de implantação observável e registrada.
- Consultas permanecem sob demanda; trocar aba dispara somente o detalhe ativo. Não pré-carregar todas as abas nem retornar um payload monolítico.

### Identidade e consistência

- Identidade base imutável: `produto:filial`. Toda resposta repete `produto` e `filial`.
- O detalhe Pedidos pode retornar linhas de várias Filiais autorizadas, mas a identidade da seleção continua Produto+Filial e o payload declara `escopo: filiais_autorizadas`.
- Parâmetros e cálculos usam a Filial selecionada, salvo regra explicitamente consolidada. Filial ativa da sessão nunca é fallback oculto.
- O hook forma chave `produto:filial:detalhe`, aborta a requisição anterior e mantém token de geração. Só publica resposta se chave/token e identidade do DTO coincidirem com o estado atual.
- Ao limpar seleção, mudar página/filtro ou perder uma linha selecionada, abortar request e voltar ao estado `empty` sem conservar dados anteriores.
- Não manter cache indefinido de detalhes mutáveis. Se houver cache curto por aba, mutações e regeneração da consulta invalidam todos os detalhes afetados da identidade; Pedidos/Acumuladores devem revalidar ao reabrir.

### Mapa de autorização

| Superfície | Capability server-side | Comportamento React |
|---|---|---|
| Estoques/quantidades | acesso ao módulo | aba visível |
| Preços dentro de Estoques | `can_visualizar_precos` | omitir painel sem permissão |
| Financeiro | `viewGerencial` | omitir aba |
| Acumuladores | `viewGerencial` | omitir aba |
| Preços convencional/Cargo | `can_visualizar_precos` | omitir aba |
| Pedidos/NFe pendentes | acesso ao módulo + Filiais autorizadas | aba visível |
| Alterar localização/limites | `can_alterar_minmax_localizacao` | omitir controles |
| Alterar última compra | `viewGerencial` + `can_alterar_ultima_compra` | omitir formulário |

- O servidor é a autoridade; ocultação React é apenas UX.
- DTO não autorizado não deve existir parcialmente em props/HTML. Retornar 403 genérico para chamada direta.
- Se a aba ativa se tornar indisponível por capabilities carregadas/recarregadas, selecionar Estoques antes de fazer fetch; não deixar ID proibido ativo.
- Capabilities vêm de um snapshot central tipado. Não inferir autorização pela presença de URL ou de um campo.

### Parâmetros

- Centralizar no manifesto existente: máscara de quantidade, Preços por Cargo, Preço por Cliente, Filiais Independentes e demais flags já usadas pela Consulta.
- Carregar parâmetros no contexto da Filial selecionada e retornar decisões semânticas (`modo_preco`, `pedidos_modo`), não valores crus S/N para o componente interpretar.
- Parâmetro influencia visibilidade/modo, não concede autorização. `precos_por_cargo=true` sem capability continua sem dados.
- Consolidado de Pedidos considera somente Filiais autorizadas e declara as Filiais usadas.
- Horário do servidor usado para validade de promoção deve ser uma única referência por resposta/request; não comparar datas no relógio do navegador.

### Contratos tipados

- Criar um mapa TypeScript/PHPDoc por detalhe: `estoques`, `financeiro`, `acumuladores`, `precos`, `pedidos`. Eliminar `unknown`/`Record<string, unknown>` na fronteira dos painéis.
- Cada DTO contém `produto`, `filial` e seus campos próprios. Modos variantes usam união discriminada, especialmente Preços convencional/Cargo.
- Números permanecem números, booleanos booleanos e datas strings ISO anuláveis. Formatação é exclusivamente visual.
- `null` significa ausência; zero e false são valores reais. Arrays vazios significam vazio legítimo, nunca indisponibilidade estrutural.
- Adotar `schema_version` comum somente se houver consumidor externo/versionamento real; não criar envelope cerimonial. Durante a alteração, backend e React devem ser entregues atomicamente no mesmo deploy.
- Mappers concentram encoding legado e nulabilidade; componentes não corrigem mojibake nem convertem strings numéricas ad hoc.

### Componentes compartilhados

- Preservar `Panel`, `Field`, `fmtQty`, moeda/data e o hook lazy.
- Extrair uma tabela leve compartilhada para Acumuladores, Cargo e Pedidos apenas para comportamento comum: cabeçalho acessível, alinhamento numérico, overflow, chave de linha e empty state. Não introduzir o ERP Grid completo para listas pequenas readonly.
- Configuração de colunas fica em cada painel/DTO; a tabela genérica não conhece regras de estoque.
- Estados `idle/empty`, `loading`, `ready`, `error` pertencem ao container. Vazios de negócio dentro de `ready` pertencem a cada dataset — especialmente as duas listas independentes de Pedidos.
- Usar chaves de domínio, nunca índice: período+Filial, Cargo, Pedido+Filial, chave composta NFe.
- Acessibilidade: `role=tablist/tab`, navegação por teclado compatível, `aria-selected`, associação tab/panel, cabeçalhos `th`, mensagens de loading/error em live region sem substituir conteúdo com dados obsoletos.

### Formatação

- Quantidades, mínimo/máximo e saldos: helper único baseado na máscara do parâmetro.
- Valores monetários: helper BRL existente; percentuais (IPI, margem, markup) têm helper percentual, não moeda.
- Datas/data-hora: helpers comuns, strings ISO no contrato e timezone do sistema explicitamente respeitado.
- Códigos, chaves NFe, Série e NSU são texto; não formatar como número nem perder zeros.
- `null` → `—`; zero → formato numérico real; array vazio → mensagem contextual.
- Nenhum cálculo de domínio no React. Arredondamento de exibição não volta ao backend.

### Navegação

- URLs navegáveis são geradas no servidor por rotas nomeadas/templates tipados e entregues como capabilities/links, não montadas por concatenação no componente.
- Pedido usa número interno; nota histórica usa ID interno real; NFe pendente usa chave/identidade SEFAZ e só navega se houver viewer compatível.
- Link depende também da autorização do destino. Sem permissão, mostrar o dado sem ação.
- Não reproduzir handlers acidentalmente cruzados do Delphi (duplo clique em NFe abrindo Pedido).

### Erros e observabilidade

- 403: escopo/capability negado, mensagem genérica sem confirmar Produto/Filial/dado.
- 404: detalhe inválido ou relação Produto+Filial inexistente, também genérica.
- 422: validação de mutação; erros por campo.
- 409: concorrência/idempotência/update sem linha quando aplicável.
- 5xx: função/tabela/schema/SQL indisponível; registrar detalhe técnico e request ID, responder mensagem operacional segura.
- Abort no navegador não é erro visível nem log de falha funcional.
- Não transformar exceção em DTO vazio. Repositories deixam falha estrutural subir até o tratamento central.
- Mutação auditada registra usuário, Produto, Filial, antes/depois e request ID; resposta recarrega somente snapshot autorizado.

### Seams e estratégia de testes

#### Backend

- Unitários puros: calculador de saldos/ICMS, mappers/nulabilidade e resolução semântica de parâmetros.
- Repository/integration PostgreSQL: funções `estoques_preco`, `pedidos_estoquepedido*`, SQL mensal de movimentos e query SEFAZ. Não fingir equivalência dessas funções em SQLite; usar testes condicionados ao banco compatível ou fixtures contratuais explícitas.
- Feature pela rota lazy: matriz de capabilities, Filial, payload/DTO e falhas. Cada aba testa uma segunda Filial para detectar vazamento.
- Mutações: autorização, validação, chave Produto+Filial, auditoria, idempotência e snapshot.

#### Frontend

- Hook: URL/chave, abort, geração, troca rápida de Produto/Filial/aba, limpeza de seleção e códigos 403/404/500.
- Painéis: colunas/rótulos, null versus zero, máscaras, modos, vazios e links/capabilities.
- Container: aba proibida ausente/fallback, estados e nenhuma renderização de payload anterior durante loading.
- Preferir asserts semânticos por texto/role/célula a snapshots extensos e frágeis.

#### Contrato

- Fixtures representativas compartilhadas ou testes de shape asseguram que todo campo retornado é tipado e consumido ou deliberadamente metadata.
- Teste de segurança procura campos sensíveis ausentes, não apenas aba invisível.
- Teste de query/telemetria impede N+1 em Cargo, Pedidos/NFe e garante agregação de Acumuladores no banco.

### Ordem segura de implementação futura

1. Firmar DTOs/mappers e AuthZ comum sem alterar layout.
2. Corrigir repositories/funções por aba com Feature tests.
3. Atualizar painéis tipados e tabela leve compartilhada.
4. Corrigir navegações e mutações.
5. Executar matriz transversal de segurança, Filial, corrida e desempenho.

Essa ordem é orientação para o prompt final, não tickets de implementação deste Wayfinder.

## Question

Quais decisões transversais devem reger as cinco abas — contrato lazy, identidade Produto+Filial, snapshots obsoletos, capabilities/omissão de dados, parâmetros, componentes compartilhados, grid/tabelas, formatação, navegação, erros e seams de teste — sem duplicar infraestrutura?
