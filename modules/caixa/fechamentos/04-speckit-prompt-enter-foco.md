# Prompt para /speckit.specify

```text
/speckit.specify

Revise e corrija o comportamento de teclado e foco da tela Laravel do Fechamento de Caixa em `laravel/backend/resources/js/Pages/Caixa/Fechamento/Index.tsx`, usando como comportamento legado autoritativo os arquivos Delphi autorizados (`delphi/apps/caixa/fmfechamentocaixa.pas/.dfm`, `delphi/repositorio/fmnavcontroles.pas`). Nao reescreva o componente global sem necessidade; crie uma solucao local/reutilizavel que respeite os contratos existentes de `CatalogCodeLookup` e `BrIsoDateTextInput`.

## Comportamento Delphi a preservar

- O `TfrmNavControles.KeyDown` trata Enter simples como `SelectNext(ActiveControl, True, True)`: Enter confirma o campo e move o foco para o proximo controle, acionando o `OnExit` do campo anterior. Shift+Enter volta; Ctrl+Enter tem navegacao propria de grid.
- No Fechamento de Caixa, sair da data valida caixa/filial/data e chama `ConsultarTotaisDeFechamento`; portanto Enter na data nao e um submit generico, e uma confirmacao de campo seguida de consulta.
- Sair do codigo do caixa so recalcula quando o codigo mudou; a selecao de filial tambem pode disparar a consulta depois da troca.
- No grid Eventos, Enter simples no campo `evento` confirma o lookup/codigo e grava a alteracao na linha existente quando aplicavel. O grid nunca cria uma linha nova. Ctrl+F9 abre a lookup.
- F8 fecha o caixa e F5 salva Eventos no Delphi; mantenha os atalhos Laravel ja existentes sem fazer Enter disparar F8/F5.

## Problemas confirmados no Laravel

- `CatalogCodeLookup` intercepta Enter, executa `preventDefault()`/`stopPropagation()` e so avanca se o chamador fornecer `onEnterAccepted`.
- A tela nao fornece `onEnterAccepted` para Filial, Caixa nem Evento. Assim, Enter pode resolver o codigo, mas nao move o foco.
- `BrIsoDateTextInput` apenas repassa `onKeyDown`; a tela nao fornece handler e nao existe formulario com `onSubmit`. Enter na data nao consulta nem reproduz o fluxo Delphi.
- O callback de Enter pode fazer uma busca exata via HTTP. Essa busca e aceitavel para confirmar um codigo digitado, mas a consulta pesada de totalizacao deve ocorrer no maximo uma vez por transicao aceita, nunca uma vez por tecla ou em duplicidade por Enter + blur.
- `SECAO_CHECKS` usa a chave `cheques` duas vezes para “Cheques a prazo” e “Cheques a vista”, fazendo os dois checkboxes compartilharem estado. Corrija a identificacao/contrato das secoes para preservar a selecao individual do Delphi.

## Requisitos funcionais

- Defina e teste uma ordem de foco deterministica para os campos da cabecalho e para o grid Eventos. Enter em um campo de codigo deve: confirmar valor exato, atualizar descricao/estado, mover foco ao proximo campo e nao submeter a pagina.
- Enter na data deve normalizar/validar a data, mover o foco e disparar uma unica consulta de totalizacao com o estado confirmado. Se o campo for invalido, manter foco nele e nao consultar.
- Enter em Filial/Caixa deve aguardar a resolucao exata antes de mover o foco. Se houver mudanca que invalide a totalizacao exibida, limpar os totais obsoletos e consultar uma vez conforme o fluxo Delphi; nao enviar payload com o valor anterior por causa de corrida de `setState`.
- Enter no codigo `evento` deve confirmar a classificacao da linha e mover para `parametros`; Enter em `parametros` deve seguir para a proxima linha/campo conforme a ordem definida, sem inserir registro. Alteracoes continuam pendentes ate Salvar/F8.
- Enter vazio deve ter comportamento explicito por campo. Nao invente selecao de codigo zero para campos obrigatorios; no evento opcional, manter a linha intacta e apenas avancar se isso for compatível com o fluxo aprovado.
- Blur causado pelo movimento de Enter nao pode repetir a mesma busca ou a mesma consulta. Use um mecanismo de deduplicacao/estado de confirmacao com teste.
- Preservar F5/F8/F9, navegacao de abas, dialogo de autorizacao e a regra de que a consulta inicial nao e automatica ao abrir, salvo se a especificacao aprovar explicitamente a consulta causada pela confirmacao da data.
- Todos os checkboxes de impressao devem ter chaves unicas e payload compativel com o backend; “Cheques a prazo” e “Cheques a vista” nao podem ligar/desligar um ao outro.

## Testes obrigatorios

- React Testing Library + `userEvent`: Enter na data, Filial e Caixa confirma e avanca foco; conferir chamadas HTTP e payloads.
- Campo com codigo invalido: nao avanca e nao totaliza.
- Codigo valido digitado: uma busca exata; Enter seguido de blur: nenhuma segunda busca/totalizacao indevida.
- Enter no evento atualiza a linha existente, foca parametros e nao cria linha.
- Enter vazio no evento segue o contrato definido sem enviar codigo zero indevido.
- F9 continua disparando apenas a consulta de totalizacao; F8 continua no fechamento e Enter nunca o aciona.
- Marcar/desmarcar Cheques a prazo nao altera Cheques a vista, e vice-versa; o JSON enviado ao PDF identifica as duas secoes separadamente.
- Executar build TypeScript e os testes frontend/backend relevantes.

## Saida

Produza a especificacao executavel, o plano e a matriz de aceite. Nao implemente nesta etapa. Cite os arquivos e linhas que fundamentam cada requisito e registre qualquer ambiguidade residual como DUVIDA objetiva.
```
