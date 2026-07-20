# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional completa e implementável para o **Commit F8 atômico, concorrência, idempotência e auditoria** da **Manutenção de Preços interna** (Estoque), no ERP tecLUX Laravel. Este é o quarto e último de quatro specs incrementais; depende diretamente do comando canônico produzido pelo terceiro spec (Operações locais, simulação e modal F8) e do motor oficial do primeiro.

## Regra fundamental sobre as fontes

Você não possui acesso ao código Delphi nem ao PostgreSQL legado investigados e **não deve procurar, solicitar, citar ou depender deles**. Não inclua tarefas de "analisar o legado", "validar no Delphi" ou "comparar com o Delphi/PostgreSQL". O levantamento já foi concluído e o contrato abaixo é a fonte autoritativa e autocontida.

Investigue somente o Laravel atual para localizar nomes e contratos concretos a reutilizar — em especial `DatabaseAuditContext`, `SensitiveOperationProofService`/catálogo de operações sensíveis, as triggers append-only já existentes nas cinco tabelas afetadas, os tokens de revisão já existentes em `produtos`/`caracteristicas`, e a lógica proven de `ProdutoPrecosWriteService`/`ProdutoPrecosCargosWriteService`. Essa inspeção serve para integração, não para redescobrir requisitos. Se o Laravel divergir do contrato abaixo, registre a divergência e proponha a adaptação; não busque confirmação em outro repositório.

Não faça nova entrevista. Gere requisitos numerados, cenários, contratos e critérios mensuráveis.

## Objetivo e natureza

A sessão local de propostas (spec anterior) nunca grava nada. Este spec constrói o **Commit Atômico**: dado o comando canônico já definido (identidade do request, assinatura da consulta, operações canônicas ordenadas, revisões de linha esperadas, Filial efetiva), o Operador da sessão e uma prova de autorização sensível, aplique o lote inteiro numa única transação e devolva o resultado. **Tudo ou nada**: antes de qualquer escrita, valide autorização, Filial, forma do payload e invariantes; bloqueie os alvos físicos em ordem determinística; confirme todas as revisões esperadas. Qualquer divergência aborta o lote inteiro, listando todos os conflitos — nada é aplicado parcialmente, nada é sobrescrito silenciosamente.

O Delphi legado não comprova uma transação abrangente única (`Perpetrar` disperso entre grupos e dentro de laços) — uma falha tardia pode deixar grupos anteriores aplicados. **Não reproduza esse comportamento.**

## Coordenador e transação

Um único coordenador e uma única `DB::transaction` para o lote inteiro. **Não encadeie** os métodos públicos dos serviços unitários já existentes (cada um abre sua própria transação) — desça a lógica útil deles para colaboradores/repositories internos que participem desta única transação externa.

Ordem determinística de bloqueio: `caracteristicas`, `precos`, `colunasprecos`, `produtos`, `produtoscargos`.

## Revisão e concorrência

Reutilize os tokens de revisão já existentes em `produtos` e `caracteristicas`. Para `colunasprecos`, `produtoscargos` e `precos` — que não têm coluna de revisão — assine canonicamente chave, existência e campos relevantes, incluindo a **ausência esperada** (para os casos de inserção quando ainda não existe). Confira toda revisão esperada antes de qualquer escrita. Qualquer divergência devolve **HTTP 409** com a lista completa de alvos divergentes (esperado vs. atual); nada é escrito, nada é mesclado ou sobrescrito automaticamente.

## Idempotência

`request_id` (UUID) + hash canônico do payload normalizado. Um controle interno único por essa dupla: mesmo `request_id` e mesmo hash devolve o resultado anterior, sem reexecutar escrita nem gerar novas entradas de auditoria; mesmo `request_id` com hash diferente é rejeitado; requisições concorrentes idênticas convergem para um único resultado.

## Autorização sensível

Obtenha a prova de Gerente de Estoque **antes** da transação, vinculada ao lote/`request_id`/Filial efetiva, e consuma-a uma única vez dentro do commit — nunca por linha ou por célula. Se o Operador da sessão já é Gerente de Estoque, o desafio pode iniciar em modo "confirmar a própria senha"; caso contrário, exige login e senha de outro Gerente autorizado — em ambos os casos o servidor autentica e comprova o perfil, nunca confiando num autorizador declarado pelo cliente. Nunca persista senha. O Operador flui pelo contexto de auditoria dos triggers; o Autorizador é registrado separadamente no cabeçalho do lote e no evento de auditoria sensível, mesmo quando forem a mesma pessoa.

## Cabeçalho de auditoria e diffs

Crie um cabeçalho interno próprio, separado da auditoria de Marketplace: `request_id`, hash, Operador, Autorizador, Filial efetiva, filtros normalizados/assinatura da consulta, horário, estado final e contagens por tabela/operação. Os diffs anterior/novo vêm das triggers append-only já existentes nas cinco tabelas — não recompute nem duplique manualmente. Tentativas rejeitadas não produzem diffs; tentativas de autorização (bem-sucedidas ou não) vão para o log sensível já existente; falhas técnicas vão para log estruturado, nunca com credencial ou o valor bruto da prova.

## Semântica de mutação por tipo

- **Coluna de Preço**: Valor `0` remove fisicamente a linha existente de `colunasprecos` para aquela identidade; Valor diferente de zero insere/atualiza Valor e Validade; Margem nunca é persistida, é sempre derivada.
- **Vínculo de Promoção**: vincular/desvincular uma Promoção a `Característica + Faixa` é **uma única mutação** de `precos.promocao` para aquela identidade compartilhada, independentemente de quantas linhas visuais a prévia mostrou como afetadas — nunca uma escrita por linha. Desvincular só anula a referência; nunca toca no cadastro da Promoção nem no Valor/Validade da coluna promocional. Se remover o Valor promocional deixar um `precos.promocao` não nulo sem preço efetivo, sinalize isso explicitamente no resultado — não corrija silenciosamente.
- **Desconto por Cargo**: persiste na identidade `Produto + Cargo`. Vazio normaliza para zero persistido, nunca para exclusão; a exclusão física de um registro `Produto + Cargo` continua sendo uma ação explícita separada, reaproveitando a operação já existente no Cadastro de Produtos — não a reinvente aqui. Rejeite (não ignore silenciosamente) qualquer mutação de Cargo no lote quando Preços por Cargo estiver desligado para a Filial em questão.
- **Produtos / Característica**: alterações de campo (markup, grupo, classe, marca, atribuição de Faixa de Preço) passam pelos repositories já revisionados existentes, com a mesma disciplina de concorrência dos demais alvos do lote.

## Proibições de efeito colateral

Não chame, enfileire ou publique nada em direção a Marketplace, Orçamentos, Contratos, Frente de Caixa ou qualquer outro consumidor de Vendas como efeito deste commit. O único efeito síncrono além das cinco tabelas e do cabeçalho de idempotência/auditoria é devolver o resultado do lote; é a própria tela (não este módulo) que roda F6 de novo depois, preservando os filtros atuais. Uma falha na atualização pós-commit **nunca** invalida um commit já bem-sucedido. Não introduza cache de preço nesta entrega; se um cache vier a existir depois em outro lugar, sua chave deverá incluir Produto, Filial, Faixa/tabela, Cliente/Cargo, Promoção/data e revisão do catálogo — não crie aqui nenhum caminho de leitura que viole essa exigência futura.

## Contrato de entrada

O comando canônico aceito aqui é exatamente o formato já produzido pelo spec anterior (identidade do request, assinatura da consulta, operações canônicas ordenadas, revisões de linha esperadas, Filial efetiva). Este spec só valida e persiste esse comando — não redefine seu formato.

## Testes e aceite mínimo

Use PostgreSQL real como seam principal (triggers/idempotência/concorrência não se provam em SQLite; adapter local é só estrutural, nunca evidência de paridade). Cubra:

1. commit bem-sucedido cobrindo todos os tipos de mutação num único lote;
2. falha induzida no início, meio e fim do processamento, comprovando rollback total das cinco tabelas;
3. dois commits concorrentes com alvos sobrepostos: exatamente um vence, o outro recebe a lista completa de conflitos, nada escrito pelo perdedor;
4. repetir o mesmo `request_id` e hash devolve o mesmo resultado sem novas escritas ou entradas de log; mesmo `request_id` com hash diferente é rejeitado;
5. prova ausente, expirada, já consumida, de Filial/lote errado é rejeitada; fluxo de Gerente confirmando a própria senha e fluxo de delegar a outro Gerente, ambos comprovando o perfil no servidor;
6. vínculo de Promoção persistindo como uma única mutação para `Característica + Faixa` mesmo quando várias linhas visuais são afetadas; desvínculo não tocando `colunasprecos` nem o cadastro; vínculo órfão/inefetivo sinalizado, não corrigido silenciosamente;
7. Valor de Coluna `0` removendo fisicamente a linha; valor diferente de zero fazendo upsert;
8. lote de Cargo rejeitado com o parâmetro desligado; vazio normalizado para zero, nunca excluído;
9. cabeçalho de auditoria + diffs das triggers reconstruindo Operador, Autorizador, Filial, filtros e mudanças de cada tabela;
10. zero chamadas a qualquer serviço, repository ou job de Marketplace;
11. F6 pós-commit preservando filtros; falha simulada nessa atualização não invalidando o commit já bem-sucedido;
12. orçamento de desempenho: pré-validação e gravação em até 15 segundos para o maior lote real, exceto bloqueio concorrente explicitamente informado.

Reutilize os testes já existentes de `ProdutoPrecosWriteService`/`ProdutoPrecosCargosWriteService` como precedente da correção de SQL/regra de negócio subjacente; não reprove essa lógica aqui — afirme só que o coordenador a compõe corretamente dentro das garantias de transação/bloqueio/revisão/idempotência do lote.

## Critérios de conclusão (liberação)

Aplicam-se aqui, na íntegra, os critérios já fixados pelo mapa de wayfinding: 100% da matriz de casos dourados aprovada; nenhuma sobrescrita silenciosa em concorrência; atomicidade e idempotência comprovadas por testes de falha e repetição; auditoria reconstruindo lote, Operador, Autorizador, Filial e todos os diffs; nenhuma chamada a Marketplace; homologação manual de pelo menos um lote real por um Usuário de Estoque antes da liberação; liberação completa de uma vez a todos com acesso ao módulo, sem lista de pilotos nem feature flag.

## Fora do escopo

Redefinir o formato do comando canônico ou a computação de prévia do spec anterior. Construir a Consulta F6, os três grids ou a UI de seleção/edição local. Reprecificar qualquer Orçamento, Contrato, Venda, parcela, reserva, comissão, cashback, frete ou documento fiscal já persistido. Publicar eventos, enfileirar jobs ou chamar qualquer serviço de Marketplace. Construir o Cadastro de Contratos, o futuro Frente de Caixa, ou integrá-los a este módulo. Introduzir cache de preço. Alterar o fluxo de exclusão física de `Produto + Cargo` já existente no Cadastro de Produtos. Corrigir ou alterar o comportamento de commit do Delphi legado.

## Saída esperada

Gere uma spec completa, verificável e pronta para planejamento/implementação. Numere requisitos funcionais e não funcionais, contratos de request/response, entidades, cenários de concorrência/idempotência e critérios de aceite mensuráveis. Identifique os componentes Laravel reutilizáveis existentes (triggers, tokens de revisão, prova sensível, serviços unitários) após inspecioná-los. Não crie pendências de investigação no Delphi ou PostgreSQL: tudo que precisa ser preservado está neste briefing.
```
