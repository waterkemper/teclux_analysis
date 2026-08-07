# Matriz rastreável de requisitos dos prompts do Cadastro de Pedidos

## Finalidade e método

Esta matriz é a linha de base para classificar uma implementação existente sem reabrir decisões. Ela consolida somente:

- o mapa de núcleo, itens, grade e motores, concluído em `.scratch/cadastro-pedidos-wayfinder/map.md`;
- o mapa de fechamento da tela, concluído em `.scratch/cadastro-pedidos-tela-wayfinder/map.md`;
- os prompts `modules/estoque/cadastro-pedidos/01-speckit-prompt.md` a `15-speckit-prompt.md`.

Não houve leitura ou auditoria do checkout Laravel. “Arquivos esperados” significa a superfície que cada prompt manda o SpecKit identificar, criar ou estender; não afirma que esses arquivos já existam nem que estejam corretos.

## Regras transversais fechadas

| Regra | Aplicação | Fonte |
|---|---|---|
| Motores de custo e impostos são serviços reaproveitáveis, separados da UI e parametrizados pela origem documental. | Prompts 01–05; consumidos por 06–08 e 15. | mapa núcleo, Destination/Notes e decisões “Definir o motor de Custo/Impostos”; prompts 01:10-20, 02:12-20 |
| Cadastro de Pedidos é fluxo de entrada: DIFAL é inalcançável; fases de saída, quadro `Calculos` e Serviços/ISS não pertencem à entrega. | Prompts 02–05. | mapa núcleo, decisões 07 e 18; prompt 02:81-91,100-101,122-130 |
| Não reproduzir bugs/código morto Delphi: Concluído não pode reutilizar Aberto; IPI da grade multiplica quantidade; fórmulas mortas e cópia autônoma ficam fora. | Prompts 01–08. | mapa núcleo, decisões 03, 06, 08–10 e 20; prompts 06:46-54, 08:51-66 |
| O contrato “Gerar Pedido de Compra” vindo da Consulta de Compras é fechado e não deve ser redesenhado. | Prompt 06. | mapa núcleo, Notes/Out of scope; prompt 06:65-69,123-130 |
| Specs 09–15 completam acesso e paridade da tela sem alterar regras de negócio de 01–08. | Prompts 09–15. | mapa tela, Destination/Out of scope; prompt 09:53-68,79-88 |
| Delphi é fonte histórica, não alvo: nenhum prompt altera schema ou desativa tela Delphi. | Todos. | seção “Fora de escopo” de cada prompt |

## Matriz por prompt/fatia

### 01 — Motor de custo e formação de preço

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Calcular custo/custo para venda; ratear frete/despesas no custo; calcular preço sugerido; propagar preço entre linhas relacionadas; cadastrar preço quando o produto ainda não possui coluna de preço (`01-speckit-prompt.md:10-20,40-75`). |
| Invariantes | Markup obedece produto → grupo → fornecedor → zero; calculado propaga pelo “maior vence”, edição manual é incondicional; `NaoAtualizarPrecoMenorQueAtual` não permite redução; `GerarPrecoAutomatico` governa criação; `SugestaoPeloPrecoVenda` inverte a direção (`:96-111`). |
| Jornadas | Recalcular item; editar preço manual; gravar produto novo; propagar entre linhas; consumir impostos já calculados, sem calculá-los nesta fatia. |
| Arquivos esperados | Serviço de domínio reaproveitável do motor; DTO/contrato de origem documental; repositórios de preço/custo e parâmetros; integração nos serviços de pedido; testes unitários e de integração. Os nomes exatos devem ser descobertos pelo SpecKit (`:121-130`). |
| Testes/gates | Rateio com 3 pesos e resto no último; produto novo; maior vence; manual incondicional; proteção contra preço menor (`:113-119`). |

### 02 — Orquestração fiscal, ICMS normal, regime e CSOSN/CST

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Orquestrar fases do motor; resolver classificação efetiva e regime; calcular ICMS normal, reduções oficial/custo, crédito e três variantes de FCP; avisar divergência de alíquota sem bloquear (`02-speckit-prompt.md:37-79`). |
| Invariantes | Ordem de fases preservada; alíquota vem da tabela UF/origem/destino/contribuinte/consumidor; oficial e custo nunca se sobrescrevem; CSOSN/CST exibido pelo regime do fornecedor; DIFAL sempre zero; não replicar `IcmsValorCalculadoSimples` (`:87-101`). |
| Jornadas | Item é classificado, tem alíquota resolvida, recebe aviso se cadastro divergir e continua o cálculo; consumidores seguintes recebem os pares oficial/custo. |
| Arquivos esperados | Orquestrador fiscal, resolvedores de regime/classificação/alíquota, calculador ICMS/FCP, contratos e repositórios tributários, testes; nomes exatos após inspeção (`:111-120`). |
| Testes/gates | Alíquota igual/divergente; fornecedor Simples/Normal; reduções paralelas; ausência de DIFAL; FCP normal/ST/ST-retido (`:103-109`). |

### 03 — ICMS-ST

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Calcular base, redução, valor e FCP-ST no ramo de entrada exercitado por Pedidos (`03-speckit-prompt.md:29-56`). |
| Invariantes | `BaseDupla=false`; base ST = `(baseICMS + IPI) × MVA ajustado × equalização`; fator vem do item; correção histórica de equalização é preservada; pares oficial/custo independentes; não acionar valores retidos de devolução (`:64-79`). |
| Jornadas | Motor 02 entrega base/contexto; ST resolve MVA/equalização/alíquota e devolve oficial+custo ao item. |
| Arquivos esperados | Extensão do motor fiscal 02: calculador ICMS-ST/FCP-ST, resolvedores/repositórios tributários e testes (`:89-98`). |
| Testes/gates | Caso-ouro ST; Simples com redução de MVA; mesmo estado versus interestadual; pares oficial/custo; prova de ausência de `BaseDupla` (`:81-87`). |

### 04 — IPI, PIS/COFINS e edição manual

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | IPI com exclusão opcional de frete e edição condicionada; PIS/COFINS por CST, somando IPI e retirando ICMS conforme configuração da filial; gating de importação/serviço (`04-speckit-prompt.md:34-72`). |
| Invariantes | IPI editável por padrão; base PIS/COFINS nunca negativa; importação e serviço não usam esta fórmula; flags “digitado” impedem sobrescrita automática (`:78-92`). |
| Jornadas | Cálculo automático, edição manual persistente e recálculo posterior sem apagar valores digitados. |
| Arquivos esperados | Extensões do motor 02–03 para IPI/PIS/COFINS, acesso à configuração por filial, flags manuais e testes (`:101-110`). |
| Testes/gates | IPI com/sem frete; PIS/COFINS com/sem ICMS; importação; preservação de edição manual (`:94-99`). |

### 05 — Rateio e produtos compostos

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Um algoritmo para desconto, frete e despesas; excluir valores manuais do pool; distribuir proporcionalmente; tratar kits por componentes; permitir “voltar ao automático” (`05-speckit-prompt.md:29-55`). |
| Invariantes | Último item absorve arredondamento; pai composto nunca recebe rateio; componentes recebem pela participação do preço no kit; liberar flag manual reinclui o item (`:59-73`). |
| Jornadas | Ratear documento, editar item manualmente, recalcular remanescente, soltar valor e sincronizar bases fiscais. |
| Arquivos esperados | Serviço único de rateio reutilizado nos 3 campos, adaptador de composição, integração com motores 01–04 e testes (`:82-91`). |
| Testes/gates | Caso proporcional; mistura manual/automático; kit com dois componentes; soltar campo (`:75-80`). |

### 06 — Cabeçalho, situação, exclusão e previsões

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Incluir/gravar pedido; quatro validações ordenadas; máquina Aberto/Parcial/Cancelado/Liquidado/Concluído e estados de item; regras de excluir/cancelar; contrato singleton “Gerar Pedido”; previsões por dias/percentual/valor (`06-speckit-prompt.md:34-83`). |
| Invariantes | Concluído tem código próprio; edição/exclusão bloqueada após entrega conforme situação; previsão individual pode ficar abaixo de 100%, pedido gravado exige exatamente 100%; exceder 100% bloqueia; primeira parcela absorve resto (`:85-103`). |
| Jornadas | Criar → validar/gravar; receber parcialmente/concluir; excluir/cancelar por situação; gerar de Consulta; montar previsões e fechar 100%. |
| Arquivos esperados | Entidade/agregado Pedido e Previsão, máquina de estado/policies, serviços/repositórios/controllers/requests, UI cabeçalho+previsões e testes; integração com Consulta e motores 01–05 (`:112-121`). |
| Testes/gates | Cascata das 4 validações; ciclo de situação; 3×33,33% com resto na primeira; singleton (`:105-110`). |

### 07 — Itens do pedido

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Incluir/gravar/excluir item; wipe ao trocar fornecedor; confirmar criação de vínculo produto-fornecedor; preencher classificação e disparar motor; recalcular previsões; painel de similares reativo (`07-speckit-prompt.md:31-51`). |
| Invariantes | Quantidade nunca abaixo do já recebido; preparação suprime cálculo sobre registro incompleto; caminho de grade não grava item real nesta fatia (`:33-47,53-69`). |
| Jornadas | Novo/editar item; produto sem vínculo; troca de produto; troca de fornecedor; excluir; reconsultar similares. |
| Arquivos esperados | Serviços/repositórios/controllers/requests e componentes de item, vínculo fornecedor e similares; adaptadores para motores 01–05 e previsões 06; testes (`:79-88`). |
| Testes/gates | Wipe; vínculo automático; quantidade mínima; troca dispara fiscal; exclusão redistribui previsões (`:71-77`). |

### 08 — Grade, preço read-only, Contas a Pagar e acessórios

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Grade dinâmica e staging; quantidade por célula, preço/desconto/ICMS/IPI por linha; orientação reversível; visualizador de formação de preço; Documento a Pagar 1:1 com previsões; e-mail manual; relatório/exportação sem aprofundar layout (`08-speckit-prompt.md:10-18,36-88`). |
| Invariantes | Divergência bloqueia bulk edit de verdade; nada toca itens reais até confirmar grade; zero exclui, novo não-zero inclui; IPI corrigido multiplica quantidade; formação é read-only; exatamente um Documento a Pagar, reconstruído do zero e removido ao cancelar/excluir; e-mail nunca automático; Daico e cópia autônoma fora (`:90-112`). |
| Jornadas | Abrir/editar/confirmar grade; inverter e preservar; inspecionar preço; gravar/regravar/cancelar pedido; enviar e-mail. |
| Arquivos esperados | Repositório de staging e sincronizador, UI matriz, visualizador de preço, integração Contas a Pagar, serviço de e-mail/relatório e testes (`:122-131`). |
| Testes/gates | Divergência; composto com IPI; staging completo; espelho/reconstrução/remoção de parcelas; confirmação de envio (`:114-120`). |

### 09 — Menu e autorização própria

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Menu `Estoques → Compras → Pedidos`; módulo de acesso próprio; remover middleware provisório de Consulta; replicar acesso existente do grupo; fechar referências ao gate G6 (`09-speckit-prompt.md:33-58`). |
| Invariantes | Grupo Compras não duplica; migration idempotente; administrador sempre acessa; sem grant = 403; grant de Consulta sozinho não basta (`:60-68`). |
| Jornadas | Migrar/reexecutar; entrar pelo menu; acessar como admin/com/sem grant. |
| Arquivos esperados | Migration, `EstoquePedidoCompraModuleAccessService`, `EnsureEstoquePedidoCompraModuleAccess`, `bootstrap/app.php`, `routes/web.php` e documentos G6 (`:79-87`). |
| Testes/gates | Idempotência, replicação, admin, 403, grant próprio, separação de grants (`:70-77`). |

### 10 — F9 Localizar Pedido

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | F9/mouse abre lookup; busca por fornecedor paginada; 5 colunas ordenáveis; seleção carrega pedido; sessão de busca persiste; expiração padronizada (`10-speckit-prompt.md:36-64`). |
| Invariantes | Reutiliza `ErpCadastroCommandBar`, atalhos e modal compartilhados; não é Consulta/Listagem de Pedidos (`:66-80`). |
| Jornadas | Abrir, buscar, ordenar/paginar, fechar/reabrir, selecionar, expirar sessão. |
| Arquivos esperados | Rota, endpoint/controller/service de lookup, componente React e wiring em `Cadastro.tsx` (`:91-99`). |
| Testes/gates | F9 em qualquer campo; busca/seleção; ordenação bidirecional; paginação; persistência; expiração (`:82-89`). |

### 11 — Abas Fornecedor, Notas Fiscais e Contatos

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Fornecedor exibe dados já carregados; Notas lista entradas vinculadas e traduz situação; Contatos lista dados e detalhe lateral; três abas read-only e reativas ao fornecedor (`11-speckit-prompt.md:34-69,71-84`). |
| Invariantes | Aba Fornecedor não faz nova chamada; nenhuma edição inline; Notas é diferente de Documento a Pagar. |
| Jornadas | Abrir abas, selecionar contato, trocar fornecedor, pedido sem/com múltiplas notas. |
| Arquivos esperados | Extensões de repositórios/serviços/componentes do Pedido e reaproveitamento do módulo Fornecedores (`:94-102`). |
| Testes/gates | Sem request extra; múltiplas/zero notas; seleção de contato; troca de fornecedor (`:86-92`). |

### 12 — Notas Pendentes de Entrada

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Reusar `nsus`/`nsus_prod`; filtrar por fornecedor+produtos do pedido; mostrar 9 campos; excluir NF-e já vinculada e não autorizada; read-only (`12-speckit-prompt.md:29-79,85-98`). |
| Invariantes | Nenhuma nova integração SEFAZ; só `cSitNFe='1'`; chave em `notaspag.chv_nfe` exclui; não inventar ação de vínculo. |
| Jornadas | Pedido aberto consulta pendências, casa por `produtonofornecedor`, lista ou vazio. |
| Arquivos esperados | Extensão do repositório de integração existente, endpoint e componente da aba (`:108-116`). |
| Testes/gates | Match; vinculada/cancelada ausentes; vazio; derivação série/número da chave (`:100-106`). |

### 13 — Paridade da grade Produtos

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Colorir por situação, destacar preço manual, mover item cima/baixo e persistir ordem, marcar/desmarcar atualização de preço em lote (`13-speckit-prompt.md:34-63`). |
| Invariantes | Cores reativas; Concluído excedido = verde com texto vermelho; toggle em lote equivale à flag individual. |
| Jornadas | Alterar situação/preço, reordenar e recarregar, alternar todos. |
| Arquivos esperados | `PedidoCompraItensPanel.tsx` e backend correspondente (`:86-93`). |
| Testes/gates | A/P/L/Q/C; excedido; preço vermelho; ordem persistente; toggle (`:78-84`). |

### 14 — Produtos Similares completos

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Expandir painel read-only para Código, Descrição, Linha, Coluna, Filial, Estoque, Reserva, Pedida, Valor e Produto/Similar (`14-speckit-prompt.md:29-47`). |
| Invariantes | Linha/Coluna são descrições de variante, não códigos/conceitos novos; trocar produto reconsulta; nenhuma escrita (`:47-58`). |
| Jornadas | Produto com grade/similares; sem similares; troca do produto ativo. |
| Arquivos esperados | Repositório, serviço e componente atuais de similares, potencialmente reaproveitando Consulta de Compras (`:66-73`). |
| Testes/gates | Dez colunas/rótulos, vazio sem erro, recarga (`:60-64`). |

### 15 — Modal completo do item

| Dimensão | Contrato fechado |
|---|---|
| Requisitos | Cobrir cerca de 40 campos em duas abas e painel de 9 totais; Natureza é lookup único que resolve CFOP; mostrar NCM/CFOP/CST reais; expor fiscal calculado e flags manuais; sincronizar atualização de preço (`15-speckit-prompt.md:10-23,39-82`). |
| Invariantes | Nenhuma fórmula nova: specs 01–05 são fonte; locks/edição seguem motores; uma Natureza/CFOP, não dois CFOPs; ação individual igual ao lote da spec 13 (`:84-99`). |
| Jornadas | Editar item/contexto; procurar Natureza; visualizar/editar imposto com flag; recalcular totais; marcar atualização de preço. |
| Arquivos esperados | `PedidoCompraItemForm.tsx`, `PedidoCompraItemProdutoResolveService.php` e dependências necessárias para lookup/fiscal/totais (`:109-118`). |
| Testes/gates | Fiscal reflete motor; manual marca flag e persiste; Natureza resolve CFOP; toggle consistente; 9 totais reativos (`:101-107`). |

## Dependências e ordem de classificação

```text
01 Motor de custo ─┐
02 ICMS ───────────┼─> 03 ST ─> 04 IPI/PIS/COFINS ─> 05 Rateio
                   └──────────────────────────────────────┐
06 Cabeçalho/Previsões ─> 07 Itens ─> 08 Grade/Acessórios │
                                                        └─> 15 Modal fiscal
09 Acesso ─> 10 F9
11 Abas simples ─┐
12 NF-e pendente ├─ fechamento informativo da tela
13 Grade visual ─┤
14 Similares ────┘
```

Para evitar falso positivo, classifique primeiro os contratos de motor (01–05), depois os consumidores de negócio (06–08), e por fim o fechamento da tela (09–15). Uma UI presente não comprova o motor; um endpoint existente não comprova os invariantes transacionais ou numéricos.

## Rubrica de classificação futura

Para cada linha da matriz, usar apenas:

- **atendido** — implementação e teste demonstram integralmente o contrato;
- **parcial** — parte comprovada, com lacuna identificável;
- **ausente** — superfície esperada não localizada;
- **divergente** — implementação contradiz decisão fechada;
- **não verificável** — evidência disponível insuficiente.

Toda classificação futura deve citar arquivo/linha e teste executável. Dúvidas já preservadas nos prompts — direção dos botões “Gerar Total X”, Daico e fontes não localizadas — continuam dúvidas; esta matriz não as resolve.
