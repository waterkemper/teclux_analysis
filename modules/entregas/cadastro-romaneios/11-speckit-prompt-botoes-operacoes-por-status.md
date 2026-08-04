# Prompt para `/speckit.specify` — botões e operações por tipo e Situação do Romaneio

```text
/speckit.specify

Este é um prompt novo e independente para corrigir a matriz de botões, atalhos, capabilities e operações permitidas no Cadastro de Romaneios. Os prompts 04, 09 e 10 já foram executados/publicados e não devem ser reexecutados. Não implemente nesta execução: produza uma especificação pós-implementação para o checkout Laravel atual.

Não consultar, não exigir e não mandar o Cursor procurar código-fonte Delphi. O comportamento legado relevante já foi pesquisado e está consolidado nos documentos de autoridade abaixo. Use esses documentos, o snapshot versionado e o checkout Laravel; qualquer conclusão deve apontar arquivo/linha/componente Laravel e ser classificada como CONFIRMADO, DIVERGENTE, POSSÍVEL BUG ATUAL, DÚVIDA ou DECISÃO NOVA.

## Objetivo

Definir e corrigir, de forma explícita, o estado de cada botão/atalho e a autorização de cada operação para a combinação:

`tipo do Romaneio (N/T) × Situação do Romaneio × Situação de saída do Item × acesso/capability do Usuário`.

A regra deve ser verdadeira nos quatro níveis:

1. botão/atalho e feedback da UI;
2. capability enviada pelo backend;
3. guard e pré-condição do comando;
4. persistência transacional e releitura da Situação canônica.

UI desabilitada não substitui autorização. O backend não pode aceitar uma operação que a matriz proíbe, e a UI não pode anunciar uma operação que o backend sempre recusará.

## Autoridades obrigatórias

- `modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md`, especialmente o inventário de CRUD, ações de item, conferência e estados observáveis;
- `modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md`, especialmente atalhos Laravel, precedência de modais e seção de capabilities/estados;
- `modules/entregas/cadastro-romaneios/modelo-dominio-coexistencia-transacoes.md`;
- `modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md`;
- `modules/entregas/cadastro-romaneios/schema/README.md`, JSON do snapshot e `functions-2026-08-01.sql`;
- `modules/entregas/cadastro-romaneios/10-speckit-prompt-auditoria-fluxo-normal-transferencia-status.md`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/Cadastro.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/RomaneioCommandBar.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/RomaneioItensToolbar.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/components/RomaneioItensGrid.tsx`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/hooks/useCadastroRomaneios.ts`;
- `laravel/backend/resources/js/Pages/Entregas/Romaneios/hooks/useCadastroRomaneiosShortcuts.ts`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosAuthorizationService.php`;
- `laravel/backend/app/Services/Entregas/Romaneios/CadastroRomaneiosEditabilityService.php`;
- `laravel/backend/app/Application/Entregas/Romaneios/CadastroRomaneiosOperacoesGuard.php`;
- `laravel/backend/app/Application/Entregas/Romaneios/Commands/CadastroRomaneiosCommandHandler.php`;
- handlers de Create, Update, DeleteRomaneio, UpsertRomaneioItem, DeleteRomaneioItem, ToggleRomaneioItemCancelado, ConferirRomaneio, ConfirmarRecebimento, LiberarEntrega, ReterEntrega e JustificarEntrega;
- `laravel/docs/architecture/entregas-cadastro-romaneios-operacoes.md` e documentação de usuário do Cadastro de Romaneios.

## Regras de precedência

1. Sem acesso ao módulo, nenhuma operação de negócio é anunciada ou aceita.
2. Modal/superfície ativa captura apenas seus próprios atalhos: F8 grava/confirma a superfície ativa; Esc cancela o modal/edição mais interno; F6 no modal de inclusão múltipla é Gerar/Cancelar e fora dele é Excluir.
3. `busy`, revisão obsoleta, prova sensível pendente, ausência de Filial ou conflito de idempotência bloqueiam a ação e preservam feedback acionável.
4. Situação do Romaneio e Situação de saída do Item são dados canônicos recalculados por PostgreSQL. Não usar somente texto mantido no React, snapshot inicial ou enum PHP para autorizar uma mutação.
5. O backend relê a situação sob lock antes da decisão, executa o comando em uma transação e devolve situação/capabilities pós-commit.

## Matriz mínima de botões do mestre

Especificar a célula de cada combinação N/T e situação, incluindo `visível`, `habilitado`, `motivo de bloqueio`, `atalho`, `guard`, mensagem de erro e teste. A matriz inicial obrigatória é:

| Botão/operação | N/T e Situação mínima | Regra de aceite |
|---|---|---|
| Novo | módulo acessível | F3 inicia rascunho e protege dirty state; não depende do Romaneio aberto |
| Gravar | rascunho com mestre válido e ao menos um item; Romaneio persistido não `FECHADA`/`CANCELADO` | F8; criar/alterar somente se a capability de escrita estrutural for verdadeira |
| Excluir Romaneio | `ABERTA`, N ou T | F6, confirmação destrutiva, sem entrega e sem duplicata paga; não habilitar em `CONFIRMADA PARCIAL`, `CONFIRMADA`, `PASSAGEM`, trânsito, entregue ou `FECHADA` |
| Localizar | módulo acessível | F9 permanece disponível, sem alterar o Romaneio atual até seleção confirmada |
| Imprimir | Romaneio persistido e acessível | F7 pode consultar estados de leitura, inclusive `FECHADA`; permitir Notas/Produtos e Incluir cancelados conforme capability |
| Incluir Item | rascunho ou Romaneio editável conforme situação | não usar capability genérica `create` para Romaneio já persistido; validar tipo, situação, Filial e Documento sob lock |
| Incluir múltiplos | mesma condição de Incluir Item | F6 interno apenas Gerar/Cancelar; F8 grava seleção; `T` exige âncoras de origem/cliente |
| Conferir volumes/notas | somente situação/tipo autorizados e com documento ativo | abrir o bootstrap correto; N usa chave, T usa chave + volume; `RPS` só em `PASSAGEM`, `ROS` nos demais casos previstos |
| Liberar entrega | somente N + `CONFIRMADA` | F10, prova “LIBERAR ENTREGA”, grava usuário/data de trânsito do servidor e recalcula situação |
| Reter entrega | somente N + `EM TRÂNSITO` | F10, prova “RETER ENTREGA”, limpa usuário/data de trânsito e recalcula situação |

Não mostrar simultaneamente Liberar e Reter. Quando uma ação contextual ficar visível desabilitada para explicar o fluxo, mostrar também o motivo textual; não usar apenas `disabled` ou cor.

## Matriz mínima de ações do Item

Separar situação do Romaneio de `situacao_romaneio_saida(numero,dadofiscal)`:

- Editar identidade fiscal (Filial/Série/NF ou Cupom): somente Item em saída `ABERTA`; tipo do Romaneio continua imutável depois do primeiro item.
- Editar campos de entrega, frete, valor, observação e cancelamento: respeitar o contrato de cada campo; em `FECHADA`, tudo que o legado consolidado declara bloqueado permanece somente leitura.
- Excluir Item: somente situação de saída `ABERTA`, confirmação e Romaneio não fechado; não aceitar exclusão de item entregue, em trânsito, justificado ou cancelado fora do fluxo permitido.
- Anular/Reativar Item: somente Romaneio editável, com confirmação e guard explícito; não permitir em `FECHADA`.
- Confirmar recebimento: somente Romaneio Normal e Item sem justificativa, nas situações de saída `EM TRÂNSITO`, `ENTREGUE PARCIAL` ou `ENTREGUE`, respeitando assinatura/prova e horário do servidor.
- Justificar entrega: somente Romaneio Normal e Item nas situações de saída `EM TRÂNSITO`, `ENTREGUE PARCIAL`, `ENTREGUE` ou `ENTREGA NÃO EFETUADA`; motivo, tentativa e observação são obrigatórios salvo limpeza explícita.
- Reagendar/Atendimento: somente quando a integração estiver disponível e o estado do Item permitir; ausência deve ser capability falsa com motivo, nunca botão inerte.
- Assinatura: somente no contexto de recebimento permitido e quando o artefato existir; não expor Base64 bruto.
- Movimentações: leitura do Item permitido quando o Usuário puder ver o Romaneio; nunca muta estado.
- Transferência não recebe as operações de venda de Normal por herança de uma capability global. Para `T`, recebimento, justificativa, assinatura e ações de entrega devem ser explicitamente falsas, salvo regra canônica adicional comprovada e documentada.

## Estados que devem aparecer na especificação

Produzir a matriz completa, sem colapsar estados diferentes:

### `ABERTA`

N e T: manutenção estrutural, inclusão/edição/exclusão conforme Item, conferência de documentos/volumes se houver documento ativo e exclusão do mestre sujeita às regras financeiras/entrega.

### `CONFIRMADA PARCIAL`

N e T: documentos/itens ainda podem ser alterados conforme guards; exclusão do mestre bloqueada; conferência deve refletir unidades pendentes. Não habilitar Liberar.

### `CONFIRMADA`

N: manutenção permitida conforme campo e Liberar habilitado. T: não assumir a mesma semântica de liberação de Normal; conferir a função canônica e deixar o botão de entrega de venda falso.

### `PASSAGEM`

Conferência usa `RPS`. Permitir somente as ações comprovadas para o tipo/rota; não transformar `PASSAGEM` de Transferência em “Normal liberável”.

### `EM TRÂNSITO`

N: Reter no mestre; recebimento/justificativa por Item conforme situação de saída. T: representa rota de transferência quando devolvido pela função canônica; não habilitar recebimento/justificativa de venda.

### `ENTREGUE PARCIAL` e `ENTREGUE`

N: ações por Item devem seguir `situacao_romaneio_saida`, inclusive justificativa e eventual recebimento permitido. T: estados podem refletir ROE/entrada de transferência; não exibir ações de entrega Normal.

### `ENTREGA NÃO EFETUADA`

Tratar como situação de saída do Item quando aplicável, não como autorização global para editar qualquer Item ou Romaneio.

### `FECHADA`

N e T: somente leitura, histórico/movimentações/relatórios permitidos conforme capability; nenhum Gravar, incluir, editar, excluir, anular/reativar, conferir ou operação de entrega mutável. O bloqueio deve existir na UI e em todos os handlers.

## Divergências obrigatórias a confirmar e corrigir

Classificar e resolver no checkout atual:

1. `Cadastro.tsx:440-442,616` e `RomaneioCommandBar.tsx` usam `capabilities.create` para habilitar Gravar e inclusão de Item, em vez de separar criação de escrita do Romaneio persistido e `update/editável`. Isso pode manter ações habilitadas em `FECHADA`.
2. `Cadastro.tsx:499-505` abre edição por duplo clique com `capabilities.update` sem verificar situação editável; `CadastroRomaneiosAuthorizationService::capabilitySnapshot` declara `update`, `delete_item` e `delete_romaneio` genericamente para qualquer Romaneio existente.
3. `RomaneioItensToolbar.tsx` usa `canIncluir` genérico, e o Cadastro passa `capabilities.create`; incluir Item/múltiplos não está ligado à matriz por Situação.
4. `CadastroRomaneiosEditabilityService` só trata `FECHADA`/`CANCELADO` para o toggle, enquanto Update/Upsert/Delete Item precisam de uma fronteira comum de editabilidade e de regras de campo/Item.
5. `UpdateRomaneioHandler` não demonstra pré-condição uniforme de Romaneio editável antes de atualizar mestre; `UpsertRomaneioItemHandler` e operações relacionadas devem ser auditados pela mesma matriz, sem depender só da UI.
6. `DeleteRomaneioHandler` verifica `ABERTA` somente no handler, mas o botão pode continuar habilitado em outros estados; transformar a divergência em capability honesta e mensagem consistente.
7. `CadastroRomaneiosAuthorizationService:135` informa `confirmar_recebimento = true` para qualquer Romaneio existente, embora o guard restrinja a Normal; a capability global deve ser corrigida ou removida em favor de capabilities por operação/Item.
8. `CadastroRomaneiosOperacoesGuard::SITUACOES_CONFERIR` é uma lista única para N/T e lê situação persistida diretamente; a especificação deve definir a fonte canônica e a tabela tipo × situação, mantendo os contratos de conferência dos prompts 09/10.
9. `RomaneioItensToolbar` esconde ações por alguns flags, mas não fornece motivo de bloqueio nem garante que o estado do botão acompanhe revisão, situação pós-commit e dirty state.
10. O atalho F10 e o botão Liberar/Reter devem ter a mesma decisão, sem permitir que o atalho alcance uma operação que o botão ocultou ou vice-versa.

## Contrato de capability

Especificar uma resposta server-side versionada, por exemplo:

```text
capabilities: {
  mestre: { criar, editar, excluir, gravar, imprimir, localizar },
  item: { incluir, incluir_multiplos, editar_identidade, editar_campos,
          excluir, anular, reativar },
  conferencias: { notas, volumes },
  entrega: { liberar, reter },
  item_entrega: { receber, justificar, reagendar, atendimento, assinatura },
  leitura: { movimentacoes, relatorios },
  motivos: { operacao, estado, campo }
}
```

Os nomes podem seguir o padrão existente, mas não manter flags ambíguas como `create` para criação e edição. Cada capability deve carregar, quando útil, `allowed`, `reason_code` e texto seguro de motivo. A resposta deve ser derivada sob a mesma revisão/situação que a página exibe.

## Aceite obrigatório

- tabela de decisão completa para N/T e todas as situações canônicas;
- testes de renderização para botão visível/desabilitado/oculto e motivo textual;
- testes de atalhos F3/F6/F7/F8/F9/F10 e precedência dos modais;
- teste de cada handler tentando operação proibida, inclusive `FECHADA`, sem mutação;
- teste de `CONFIRMADA` N versus `CONFIRMADA`/estados T sem liberar entrega de venda;
- teste de N em trânsito versus T em trânsito;
- testes por Item para recebimento, justificativa, reagendamento, assinatura, exclusão e cancelamento;
- teste de capability global enganosa de recebimento em T;
- teste de revisão obsoleta, concorrência, idempotência, prova sensível e releitura pós-commit;
- teste de que erro não é engolido e dirty state não é perdido;
- teste PostgreSQL real confirmando `Atualizar_situacao_romaneio` e `situacao_romaneio_saida` como autoridade, sem máquina de estados PHP paralela;
- teste de acessibilidade: foco, `aria-disabled`/`disabled`, nome do botão, motivo e anúncio de mudança de estado.

## Fora de escopo

- reexecutar os prompts 04, 09 ou 10;
- consultar ou alterar código Delphi;
- implementar nesta execução;
- alterar layout compartilhado sem necessidade comprovada;
- criar uma segunda fonte de Situação/capability ou uma máquina de estados paralela em PHP;
- conceder permissões de módulo a usuários.
```
