# Prompt para `/speckit.specify` — recuperação de Documento a Pagar ausente

````text
/speckit.specify

Este é um prompt novo e corretivo, posterior à implementação do Cadastro de Romaneios. Os prompts 01–12 já foram publicados; não os reexecute. Não implemente nesta execução: produza uma especificação executável contra o checkout Laravel atual para impedir novos Romaneios financeiramente incompletos e permitir a recuperação manual segura de um Romaneio persistido sem Documento a Pagar.

Não consultar nem exigir código-fonte Delphi. Use as evidências consolidadas neste módulo e o checkout Laravel. Classifique cada constatação como CONFIRMADO, DIVERGENTE, POSSÍVEL BUG ATUAL, DÚVIDA ou DECISÃO NOVA, apontando arquivo, linha, classe, método ou componente Laravel.

## Problema confirmado no checkout atual

- O fluxo normal chama `DocumentoPagFinancialDraftByOriginPort` dentro da mesma `DB::transaction` de `CadastroRomaneiosCommandHandler`; testes de seam e injeção de falha cobrem criação, manutenção e rollback conjunto.
- Pode existir Romaneio persistido com `romaneios.documentopag` nulo por dado legado, parâmetro anteriormente desligado, carga externa, correção manual, versão anterior ou falha histórica. Operações que apenas sincronizam `previsao` não criam o financeiro ausente.
- `RomaneioResumoFinanceiro.tsx` apenas informa “Sem documento a pagar vinculado”; não há capability, rota ou comando explícito de recuperação.
- O núcleo atual cria novo Documento quando `documentopagExistente` é nulo, sem demonstrar identidade de origem consultável que impeça duplicação diante de Documento órfão ou duas requisições concorrentes. Idempotência isolada por request não resolve chaves diferentes.
- Ausência não é sempre erro: com parâmetro financeiro desligado ou total canônico zero, pode ser o estado esperado.

## Objetivo e invariante

Definir uma única política server-side:

1. com `Incluir documento a pagar no romaneio` ativo, evento válido, Romaneio persistido, Transportador válido e total canônico positivo, todo comando estrutural aplicável bem-sucedido termina com um Documento a Pagar ligado e exatamente uma Duplicata aberta, salvo proteção financeira existente;
2. falha antes ou depois da criação desfaz Romaneio, Itens, vínculo, financeiro, situação, revisão, auditoria transacional e idempotência na mesma transação;
3. Romaneios históricos que violem o invariante recebem a ação `Criar documento a pagar`, que reconcilia antes de criar e nunca duplica Documento ou Duplicata;
4. a recuperação não altera Itens, conferência, entrega ou Situação canônica e não substitui a manutenção automática.

## Autoridades obrigatórias

- prompts 03, 10, 11 e 12 deste diretório;
- `modelo-dominio-coexistencia-transacoes.md`, `seguranca-menu-parametros.md`, `aceite-testes-observabilidade.md`, `pesquisa-sql-dominio-efeitos-delphi.md` e `schema/README.md`;
- `CadastroRomaneiosCommandHandler.php`, `CadastroRomaneiosLockOrdering.php` e handlers envolvidos;
- `RomaneioFinancialOriginAdapter.php`, `MaintainDocumentoPagDraftByOriginCommand.php` e `DocumentoPagFinancialDraftByOriginPort.php`;
- `CadastroRomaneiosParameterManifest.php`, `CadastroRomaneiosParameterResolver.php`, `RomaneioCapabilitiesProjectionService.php`, `CadastroRomaneiosAuthorizationService.php`, `CadastroRomaneiosPageService.php` e `LegacyRomaneioAggregateReadRepository.php`;
- `Cadastro.tsx`, `RomaneioResumoFinanceiro.tsx`, `resources/js/types/cadastroRomaneios.ts`, rotas e controllers de `/entregas/romaneios`;
- testes `CadastroRomaneiosFinancialSeamPostgresTest`, `CadastroRomaneiosFinancialDivergencePostgresTest`, `CadastroRomaneiosFinancialProtectionPostgresTest` e `CadastroRomaneiosFailureInjectionPostgresTest`.

## Elegibilidade e capability financeira

Criar capability versionada e independente do grid, por exemplo:

```text
capabilities_v2.financeiro.criar_documento_pagar = {
  visible: boolean,
  allowed: boolean,
  reason_code?: string,
  reason?: string
}
```

Não reutilizar `mestre.gravar`, `item.incluir`, `grid_actions` ou flag ambígua. Backend, botão e endpoint consomem a mesma decisão. Habilitar somente quando:

- o Usuário acessa o módulo e todas as Filiais alcançadas;
- o Romaneio existe e `romaneios.documentopag` está realmente nulo;
- parâmetro financeiro ativo e evento inteiro positivo;
- Transportador/Fornecedor válido;
- ao menos um Item ativo e total canônico não cancelado maior que zero;
- sem comando em andamento, revisão obsoleta ou conflito de idempotência.

Com vínculo ausente, manter a área financeira visível. Preferir botão visível desabilitado com motivo para configuração inválida, falta de Transportador, ausência de Item ativo, total zero ou falta de acesso; ocultar quando já há vínculo válido ou o registro ainda não foi persistido. Testar a decisão.

Definir `reason_code` estável para `documento_ja_vinculado`, `parametro_financeiro_desativado`, `evento_financeiro_invalido`, `fornecedor_ausente`, `sem_item_ativo`, `total_financeiro_zerado`, `acesso_filial_negado`, `revisao_obsoleta`, `integridade_financeira_divergente` e `operacao_em_andamento`.

## Regra especial para Transferência

O prompt 12 continua autoridade para os botões do grid: `T + EM TRÂNSITO` mantém inclusão, edição, exclusão, cancelamento, conferência, recebimento e demais mutações do grid desabilitadas.

`Criar documento a pagar` é recuperação financeira separada, exibida no Resumo financeiro, e deve poder ficar habilitada para `T + EM TRÂNSITO` quando todos os requisitos financeiros forem satisfeitos. Não colocar a ação na toolbar do grid, não reabilitar atalhos ou comandos operacionais e não herdar regras de entrega de Romaneio Normal. Especificar células próprias para T em `ABERTA`, `CONFIRMADA PARCIAL`, `CONFIRMADA`, `PASSAGEM`, `EM TRÂNSITO`, `ENTREGUE PARCIAL`, `ENTREGUE` e `FECHADA`; em estado inconsistente ou fechado, a decisão deve ser explícita, não derivada apenas de “editável”.

## Comando HTTP e transação

Especificar endpoint dedicado, por exemplo `POST /entregas/romaneios/{numero}/documento-pagar`. O payload aceita somente metadados técnicos necessários, como `expected_revision` e `idempotency_key`; total, evento, fornecedor, Filial, vencimento, previsão e identificador financeiro nunca vêm como autoridade do browser.

O comando deve:

1. validar acesso ao módulo e Filiais;
2. abrir a transação pelo pipeline compartilhado;
3. bloquear e reler Romaneio e Itens em ordem determinística;
4. reler parâmetros, Situação, revisão, vínculo e totais canônicos dentro da transação;
5. reavaliar capability e pré-condições no servidor;
6. procurar e classificar eventual financeiro já existente para a origem antes de alocar número;
7. reutilizar `DocumentoPagFinancialDraftByOriginPort` e o núcleo de Contas a Pagar, sem HTTP interno, segundo grant, repository duplicado ou commit interno;
8. criar/reconciliar Documento e exatamente uma Duplicata, ligar `romaneios.documentopag`, atualizar revisão/auditoria e devolver agregado, resumo e capabilities pós-commit.

Não usar `MAX()+1`; preservar `documentospag_proximonumero()`. Se o schema não possuir chave de origem suficiente para localizar Documento órfão com segurança, declarar bloqueio de integridade e propor a menor solução compatível com PostgreSQL legado e coexistência Delphi, com migração/backfill somente se a evidência justificar. Não adivinhar pelo texto de `complemento` nem vincular registro ambíguo.

Definir semântica determinística:

- mesma chave e payload retorna resultado confirmado; mesma chave divergente retorna conflito;
- duas chaves diferentes ou duplo clique concorrente resultam em um único Documento, uma Duplicata e um vínculo;
- se a segunda execução reler vínculo válido criado pela primeira, retorna sucesso idempotente/reconciliado ou conflito benigno documentado, nunca cria outro registro;
- `documentopag` apontando para registro inexistente, Documento órfão ambíguo ou vínculo incompatível gera erro explícito e zero escrita, sem correção silenciosa.

Revisar também o fluxo automático. Nenhuma resposta de sucesso de Create, Update, Upsert/Delete/Toggle Item ou inclusão múltipla aplicável pode deixar o invariante quebrado. Operações de recebimento que apenas atualizam `previsao` não devem criar Documento silenciosamente; ao detectar ausência, devem conservar a operação autorizada e devolver a capability de recuperação, salvo regra canônica contrária explicitamente decidida e testada.

## Experiência da tela

Adicionar o botão em `RomaneioResumoFinanceiro`, junto do estado vazio, com rótulo `Criar documento a pagar`. Não colocá-lo na barra de Itens.

Antes do envio, confirmar número do Romaneio, Transportador e total canônico, sem campos financeiros editáveis. Durante a chamada, impedir duplo clique e anunciar progresso. No sucesso, substituir resumo e capabilities pela resposta, exibir o número e a Duplicata e retirar a ação sem recarga completa. Em 409/422, preservar o Romaneio aberto, recarregar quando necessário e mostrar mensagem acionável. Cobrir teclado, foco, leitor de tela, `disabled`/`aria-disabled` e região de status.

O botão cria obrigação financeira e exige confirmação, mas não deve inventar prova sensível ou permissão administrativa sem autoridade existente. A autorização permanece server-side e limitada às Filiais.

## Critérios de aceite obrigatórios

- [ ] Romaneio Normal elegível sem vínculo cria um Documento a Pagar, exatamente uma Duplicata e grava o vínculo.
- [ ] Transferência `T + EM TRÂNSITO` elegível executa a recuperação enquanto todos os botões do grid continuam bloqueados conforme o prompt 12.
- [ ] Parâmetro desligado, evento inválido, Transportador ausente, nenhum Item ativo, total zero e acesso negado impedem criação com capability/motivo coerente e zero escrita.
- [ ] Valores financeiros adulterados no request são ignorados/rejeitados; o servidor deriva os canônicos.
- [ ] Vínculo já existente torna o botão indisponível; chamada direta concorrente não duplica registros.
- [ ] Duplo clique, replay e duas requisições com chaves diferentes produzem um único efeito em PostgreSQL real.
- [ ] Concorrência Laravel–Laravel e Delphi-equivalente–Laravel respeita locks, sem deadlock, vínculo perdido ou órfão.
- [ ] Falha injetada após Documento, Duplicata, vínculo, revisão e auditoria desfaz tudo e permite retry limpo.
- [ ] Vínculo pendurado, Documento órfão único/ambíguo, Duplicata ausente e múltiplas Duplicatas são classificados sem correção silenciosa perigosa.
- [ ] A recuperação não altera Itens, conferência, recebimento, entrega ou Situação canônica; somente financeiro e revisão correspondente mudam.
- [ ] Regressão impede sucesso do fluxo automático com parâmetro ativo, total positivo e vínculo ausente.
- [ ] UI cobre oculto, desabilitado, confirmação, busy, sucesso, 409, 422, falha, foco e anúncio acessível.
- [ ] Logs registram operação, Romaneio, Filial, ator, resultado `created/reused/rejected/failed`, revisão e rollback sem dados sensíveis.

## Entregáveis da especificação

- jornada funcional;
- tabela por tipo, Situação, parâmetro, integridade, total e acesso;
- contrato de capability, rota, request e response;
- comando, transação e ordem de locks;
- estratégia de identidade/reconciliação e decisão para órfãos;
- matriz de erros e mensagens;
- plano de testes unitários, feature, PostgreSQL, concorrência, falhas e acessibilidade;
- arquivos Laravel previstos para alteração, sem implementar.

## Fora de escopo

- implementar durante `/speckit.specify` ou reexecutar prompts 01–12;
- consultar/alterar Delphi;
- pagar, autorizar, estornar ou excluir Documento/Duplicata;
- reabrir Romaneio, alterar Situação ou liberar ações do grid de Transferência;
- duplicar regras do Contas a Pagar;
- saneamento massivo/backfill sem especificação e operação separadas.
````
