# Contrato de interface, operações e componentes — Cadastro de Romaneios

## Decisão executiva

**DECISÃO NOVA, confirmada em 2026-08-01** — o Cadastro de Romaneios usa uma página mestre–detalhe e mantém todas as superfícies auxiliares no padrão de modal Laravel. Botões, ícones, atalhos, grids, feedback, acessibilidade e confirmação seguem as autoridades compartilhadas do projeto; regras e bugs visuais do Delphi não são copiados.

O padrão Laravel prevalece sobre atalhos Delphi conflitantes. Em especial, **Gravar é F8** em todas as superfícies.

## Composição da página principal

Usar `ErpCadastroShell` com barra sticky/trilho responsivo e `ErpCadastroCommandBar`. A página contém:

1. **Identificação** — número, abertura pelo servidor, Tipo Normal/Transferência, transportador/Fornecedor, frete, Situação do Romaneio e Revisão do Romaneio.
2. **Evidências operacionais** — conferente/data, liberador/data de trânsito e observação, sempre distinguindo dado editável de dado calculado.
3. **Itens de Romaneio** — `ErpPreferenceDataGrid` com uma linha por Item, seleção corrente e ações contextuais.
4. **Resumo financeiro** — entregue, a entregar, total a pagar e Duplicatas somente leitura; ausência de financeiro deve ser estado vazio explícito, não erro.

Número e Situação são apresentados como dados canônicos do banco. Tipo fica imutável depois do primeiro Item. Campos bloqueados pela situação exibem o motivo, sem depender apenas de cor ou de estado disabled.

## Superfícies auxiliares em modal

Não criar páginas/workspaces visuais separados. Usar modais responsivos do projeto, com título, contexto do Romaneio/Documento Fiscal, foco inicial, trap de foco, retorno ao elemento invocador e proteção contra fechamento com alterações:

- **Localizar Romaneio** — lookup paginado por número e critérios permitidos.
- **Incluir/Editar Item** — uma superfície única, sem abas visuais, com modo explícito Nota Fiscal/Cupom, lookups e valores do vínculo.
- **Incluir múltiplos** — modal amplo com filtros, operação F6 cancelável, grid de candidatos, seleção e aplicação de valores em lote.
- **Conferir volumes** — modal amplo para leitura/entrada, contadores conferidos/não conferidos, Recomeçar e confirmação F8.
- **Justificar entrega** — Motivo de Entrega, instante da tentativa e observação, além de Atendimento e Reagendamento quando disponíveis.
- **Movimentações** — histórico somente leitura do Documento Fiscal/Item.
- **Assinatura** — visualizador seguro do artefato existente, sem expor Base64 bruto na interface.
- **Imprimir** — escolha entre Notas do Romaneio e Produtos do Romaneio, com opção Incluir cancelados.

Lookups internos usam `ErpCadastroLookupModal`/`ErpTwoColumnCatalogLookupModal`. A pilha de modais deve ter uma única superfície interativa por vez e restaurar foco corretamente; evitar overlays ad hoc.

## Barra de operações

### Página principal

| Operação | Atalho | Comportamento |
|---|---:|---|
| Novo | F3 | inicia rascunho após proteger alterações pendentes |
| Gravar | F8 | executa o Comando de Romaneio atual |
| Excluir | F6 | confirmação destrutiva; somente quando permitido |
| Localizar | F9 | abre modal de localização |
| Imprimir | F7 | abre modal de relatório quando houver Romaneio persistido |
| Incluir Item | — | abre modal unitário |
| Incluir múltiplos | — | abre modal de consulta/seleção |
| Conferir | — | abre modal de conferência quando aplicável |
| Liberar/Reter | F10 | mesmo espaço contextual; nunca mostra as duas intenções simultaneamente |

Usar ícones da biblioteca adotada pelo projeto, texto visível, tooltip e `aria-label`. Ícone sozinho não comunica operação. A ordem permanece estável; operação contextual não desloca ações destrutivas para posição inesperada.

### Ações do Item

Editar, excluir, Justificar, Movimentações e Assinatura pertencem à linha/seleção do Item. Duplo clique ou Enter pode abrir edição quando permitido. `Ctrl+F3` para incluir Item e `Ctrl+F2` para editar podem ser mantidos somente se o resolvedor compartilhado comprovar ausência de conflito e o atalho aparecer na interface. `Ctrl+Espaço` não alterna cancelamento/anulação sem confirmação e capacidade explícita.

### Precedência

O modal ativo suspende os atalhos da página. O resolvedor considera superfície, foco, modificadores, `event.repeat`, evento já prevenido e estado busy:

- F8 grava/confirma a superfície ativa;
- Esc cancela primeiro edição/modal mais interno, pedindo confirmação se houver dirty state;
- no modal de inclusão múltipla, F6 significa Gerar e, durante a geração, Cancelar;
- fora desse modal, F6 mantém Excluir no Cadastro;
- Enter no campo de chave NF-e localiza; em controles multilinha ou botões mantém a semântica nativa;
- não registrar dois listeners ativos para a mesma tecla.

Atalhos Delphi conflitantes, como F5 para Gravar, não são aliases no Laravel.

## Capacidades e estados da interface

O backend devolve capacidades derivadas da Situação do Romaneio, Situação do Item, Filiais, Permissão e eventual necessidade de Autorização. O frontend usa essas capacidades para apresentação, mas cada comando revalida tudo.

- Ação impossível pelo estado atual fica visível e desabilitada com explicação curta quando sua presença ajuda o usuário a entender o fluxo.
- Ação que o Usuário não pode conhecer/executar segue o padrão de segurança Laravel, sem vazar capacidade sensível.
- Operações busy desabilitam comandos concorrentes e apresentam progresso textual.
- `ABERTA` permite manutenção estrutural; `FECHADA` é somente leitura.
- **DECISÃO NOVA, confirmada na validação funcional** — `tipo = 'T'` (Transferência) em `EM TRÂNSITO` mantém todos os botões da superfície ao lado do grid desabilitados: incluir, editar, excluir, cancelar/reativar, conferir, entrega, assinatura e movimentações quando estiverem nessa barra. Não usar a regra genérica “não FECHADA = editável”; consulta somente leitura deve ser superfície separada.
- Liberar aparece apenas para Romaneio Normal confirmado; Reter apenas para Normal em trânsito.
- Recebimento, justificativa, reagendamento, conferência, assinatura e exclusão de Item seguem os guards comprovados e a resposta canônica do backend.

Erros engolidos pelo Delphi não são reproduzidos. Toda falha recebe feedback acionável e mantém o rascunho quando seguro.

## Grid de Itens

Usar `ErpPreferenceDataGrid` com catálogo estável próprio. Incluir as colunas Delphi comprovadas, agrupadas e rotuladas para leitura: identidade NF/Cupom, Filial, emissão, Cliente, volumes, situação fiscal e de saída, cancelamento, entrega/recebimento/reagendamento, frete/valores, motivo e endereço.

- Texto e ícone acompanham cores de situação; fornecer legenda acessível.
- Preferências cobrem visibilidade, ordem, largura e ordenação, sem autorizar campos SQL.
- Exportação, cópia e paginação seguem os componentes compartilhados.
- Persistência não ocorre inline. O grid abre o modal do Item; mutações passam por comandos transacionais.
- Resultado atualizado pelo backend substitui a linha inteira e a Revisão do Romaneio após o commit.

Cada outro grid — candidatos, Duplicatas, conferência e movimentações — possui catálogo/screen key próprio. Preferências não são compartilhadas entre grades semanticamente diferentes.

## Inclusão e edição de Item

O modal unitário preserva os dois modos fiscais na mesma superfície, sem abas visuais:

- Nota Fiscal: Filial, série, número, “somente NF com itens para entrega” e chave NF-e;
- Cupom Fiscal: Filial, ECF/máquina, intervenção e número;
- comuns: Auto Incluir, cancelado quando permitido, emissão, tipo/tabela/valor de frete, entrega e observação.

Auto Incluir inicia marcado. Depois de uma confirmação bem-sucedida, o modal permanece aberto, conserva o modo e devolve o foco à Chave NF-e (Nota) ou à Filial/primeiro identificador (Cupom), permitindo bipagem contínua. Valor de Tabela é a projeção somente leitura de 	abeladefretes.valorfornecedor; Valor do Frete é omaneiosnotas.valor e é a grandeza usada pelo total financeiro no servidor.

Usar `NfeAccessKeyInput` para digitação/máscara/cursor/colar e `NfeAccessKey` + `NfeAccessKeyValid` no backend. Não criar regex, máscara ou cálculo de DV do módulo. Enter em chave válida localiza e preenche, respeitando elegibilidade e Filiais; chave inválida recebe erro junto ao campo.

Com Auto Incluir, após F8 bem-sucedido o modal limpa somente os campos do novo Item e devolve foco à chave (Nota) ou Filial (Cupom), mantendo contexto seguro. Não piscar texto nem depender de animação; anunciar o modo e o sucesso por região `aria-live`.

## Inclusão múltipla

Aplicar integralmente [consulta-f6-sql-performance-cancelamento.md](consulta-f6-sql-performance-cancelamento.md). O modal tem duas regiões dentro da mesma superfície: filtros e resultados. Gerar não troca de página; resultado vazio permanece no modal com orientação.

- Cancelar aparece imediatamente durante F6.
- Seleção usa IDs canônicos, seleção total claramente delimitada à página ou ao conjunto conforme o componente indicar.
- Valores em lote — frete, entrega, valor e observação — são rascunho aplicado às selecionadas; F8 confirma uma única intenção em lote.
- Alterar filtros invalida seleção e defaults já aplicados após confirmação do usuário.
- Falha de um ID na revalidação impede commit parcial e identifica os documentos que precisam ser revistos.

## Conferência, justificativa e histórico

- Conferência apresenta Documento Fiscal, chave, unidades de volume, modo N/T e contadores separados de unidades/documentos; leitura por Enter usa feedback visual e textual. N lê chave NF-e e consome a próxima unidade pendente; T exige chave + volume na composição consolidada. Recomeçar exige confirmação se descartar leituras. F8 grava parcial ou totalmente, de forma atômica.
- Justificativa diferencia limpar os campos de registrar nova tentativa. Quando não for limpeza, Motivo, data/hora e observação são obrigatórios.
- Movimentações são somente leitura, com tipo, Usuário, Filial, instante, volumes e resultado, vinculadas ao Item selecionado.
- Atendimento e Reagendamento chamam integrações contextuais existentes apenas se disponíveis no Laravel; ausência comprovada deve virar lacuna explícita no prompt, não link inerte.

## Relatórios

O modal de impressão oferece:

1. **Notas do Romaneio**;
2. **Produtos do Romaneio**;
3. opção **Incluir cancelados**.

Reusar layout institucional, Filial/logo, sanitização e auditoria de impressão. Datasets são relidos no servidor pelos IDs vinculados, set-based e sem lista SQL textual. Visualização, download e impressão exigem as mesmas Filiais/Permissões do Romaneio.

## Feedback, concorrência e perda de dados

- Sucesso informa operação e identidade do Romaneio; falha preserva dados editáveis.
- Validação associa mensagem ao campo e move foco ao primeiro erro.
- Conflito de Revisão do Romaneio oferece Recarregar e explica que outra aplicação alterou o registro; não faz merge automático.
- Ao trocar, localizar, fechar modal, navegar ou iniciar Novo com dirty state, pedir confirmação antes de descartar.
- Cancelamento de consulta é neutro e mantém o último resultado completo.
- Confirmações destrutivas nomeiam Romaneio/Item e consequência; digitação de texto não é exigida sem padrão compartilhado.

## Acessibilidade e responsividade

- Operável por teclado, com ordem de foco coerente, foco visível e sem keyboard trap.
- Modais amplos ocupam área responsiva prevista pelo componente, sem criar nova página; em telas pequenas, conteúdo rola dentro da estrutura correta e ações permanecem alcançáveis.
- Situação, cancelamento, erro e seleção nunca dependem apenas de cor.
- Estados busy e resultados são anunciados; tabelas/grids têm nomes e contagens compreensíveis.
- Touch targets, contraste, mensagens e redução de movimento seguem o design system.

## Critérios para os prompts

- Reusar componentes citados; criar apenas composição fina específica do Romaneio.
- Testar atalhos por superfície, modal sobre lookup, foco de retorno, dirty state, busy, resposta tardia e ausência de listeners duplicados.
- Testar todas as capacidades por Situação e Item, incluindo tentativa direta no backend.
- Testar paridade da chave NF-e entre frontend/backend e fluxo de scanner/Auto Incluir.
- Testar catálogos, preferências, exportação e ocultação de colunas não autorizadas.
- Não implementar nesta jornada, copiar DFM ou criar componentes compartilhados sem necessidade transversal comprovada.
