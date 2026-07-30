# Cadastro de Requisições entre Filiais

## Destination

Produzir comandos `/speckit.specify`, publicados em `modules/`, para implementar no Laravel somente o Cadastro de Requisições entre Filiais existente em `dmrequisicaoexposicao` e `fmrequisicaoexposicao` (`.pas` e `.dfm`), definindo explicitamente o que será reaproveitado da Requisição entre Filiais da Consulta de Compras.

## Notes

- Contextos: legado Delphi em `delphi/apps/interlojas/`, implementação Laravel e especificações existentes em `modules/estoque/consulta-compras/` e `.scratch/consulta-compras-wayfinder/`.
- Usar `/domain-modeling` quando a investigação revelar termos ou limites de domínio ainda não registrados; usar `/grilling` para decisões de produto e arquitetura que não possam ser extraídas do código.
- Tratar `dmrequisicaoexposicao.pas/.dfm` e `fmrequisicaoexposicao.pas/.dfm` como a superfície Delphi primária; dependências externas devem ser abertas somente quando necessárias para explicar um contrato.
- Preservar diferenças entre fatos do legado, comportamento já implementado no Laravel, decisão de reaproveitamento e melhoria deliberada.
- Regra permanente de parâmetros: usar como autoridade as chaves/descrições literais definidas em `delphi/biblio/clparametrossistema.pas` e, para mensagens/constantes relacionadas, `delphi/biblio/ctconstantes.pas`; no Laravel, resolver o valor efetivo por `parametros_valor(descricao, filial)`, nunca pelo nome da propriedade Delphi nem por valor enviado pelo frontend. Tratar `''`, `NULL`, ausência e valor booleano inválido como `false`, cobrindo essas variações em testes.
- Exceção ao padrão “plan, don't do”: este mapa inclui a execução final de publicar os comandos `/speckit.specify` em `modules/`, conforme solicitado.

## Decisions so far

<!-- As decisões resolvidas serão indexadas aqui, sem duplicar o conteúdo dos tickets. -->

- [Inventariar a superfície do Cadastro de Requisições no Delphi](issues/01-inventariar-superficie-do-cadastro-delphi.md) — Cadastro padrão com inclusão F3, gravação F5, cancelamento lógico F6 e pesquisa F9; requisitante selecionável entre filiais autorizadas, requisição editável apenas enquanto aberta e recebimento/NF somente informativos.
- [Mapear persistência, validações e efeitos de estoque](issues/02-mapear-persistencia-validacoes-e-estoque.md) — `pedidosfiliais` e movimentos são transacionais; TEP debita, TPE devolve e TFR recompõe reserva, mas o legado tem revalidação concorrente incompleta, troca sem validar o novo saldo e não persiste se a requisição debitou estoque.
- [Comparar o Cadastro com a Requisição da Consulta de Compras](issues/03-comparar-com-requisicao-da-consulta-de-compras.md) — compartilham agregado, parâmetros, transação, movimentos e cancelamento; a Consulta é criação em lote derivada da sugestão, enquanto o Cadastro exige manutenção unitária, edição por delta e requisitante selecionável, ainda ausentes no Laravel.

- [Decidir o limite de reaproveitamento entre os dois fluxos](issues/04-decidir-limite-de-reaproveitamento.md) — um núcleo neutro concentra parâmetros, persistência, comandos transacionais, locks e movimentos; Consulta e Cadastro mantêm orquestrações, projeções e autorizações de entrada próprias.

- [Definir o comportamento funcional do Cadastro no Laravel](issues/05-definir-comportamento-funcional-do-cadastro.md) — preserva Interlojas → Requisição para Exposição como cadastro unitário, reutiliza shell/lookups Laravel com endpoints próprios e replica campos, estados e pesquisas Delphi, corrigindo quantidade zero e as chaves de parâmetros.

- [Decidir a semântica de estoque, concorrência e cancelamento](issues/06-decidir-semantica-de-estoque-e-cancelamento.md) — parâmetro atual governa TEP/TPE/TFR; operações revalidam após locks, preservam venda futura, limitam liberações à reserva prévia disponível com alerta e usam concorrência compatível com Delphi.

- [Decidir autorização, auditoria e convivência Delphi–Laravel](issues/07-decidir-autorizacao-auditoria-e-convivencia.md) — acesso combina módulo e filiais autorizadas sem senha adicional; `pedidosfiliais_log_new` identifica o ator e fornece revisão comum aos dois escritores, mantendo a auditoria legada intacta.

- [Classificar lacunas e consolidar o plano de reúso](issues/08-classificar-lacunas-e-plano-de-reuso.md) — infraestrutura genérica pode ser usada diretamente, serviços da Consulta precisam virar núcleo neutro e três comandos separarão núcleo compartilhado, backend e interface do Cadastro sob `modules/interlojas/requisicao-para-exposicao/`.

- [Definir critérios de aceite e testes](issues/09-definir-criterios-de-aceite-e-testes.md) — aceite combina testes unitários, features SQLite, integração PostgreSQL obrigatória, componentes/smoke e regressão integral da Consulta, cobrindo parâmetros, estoque, rollback, concorrência por log, autorização e jornada.

- [Publicar os comandos SpecKit do Cadastro de Requisições](issues/10-publicar-comandos-speckit-specify.md) — três comandos autocontidos foram publicados em `modules/interlojas/requisicao-para-exposicao/` para núcleo compartilhado, backend e interface/integração.

## Not yet specified

- Nenhuma área permanece vaga; todos os tickets foram resolvidos e os comandos que constituem o destino estão publicados.

## Out of scope

- Consulta geral de requisições entre filiais.
- Separação, transferência, expedição e recebimento de mercadorias.
- Outros formulários do fluxo de Requisição de Exposição, exceto contratos estritamente necessários ao Cadastro de Requisições.
- Alterações de implementação no Delphi ou no Laravel; esta jornada termina nos comandos `/speckit.specify`.
