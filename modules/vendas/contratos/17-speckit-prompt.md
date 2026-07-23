# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **Importar produtos de outro Contrato** — Etapa 8 (Conveniências), primeiro dos dois specs dessa etapa, construído sobre a Fundação (`01-speckit-prompt.md`) e o motor/editor comercial (`03-speckit-prompt.md`), cujo command de inclusão de produto este comando reaproveita.

**Importar não é desmembrar.** São duas operações Delphi diferentes com nomes Laravel diferentes: Desmembrar Contrato (`12-speckit-prompt.md`, já escrito) transfere quantidades e reduz a origem; Importar produtos de outro Contrato **nunca altera a origem** — a origem é somente leitura, o destino é quem recebe linhas novas ou consolidadas. Não misture os dois comandos, endpoints ou capabilities.

Não implemente nesta etapa além do previsto. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar o estado real do motor comercial/editor de produtos (spec 3) e a ausência de qualquer implementação de importação; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- o comando `ImportarProdutosDeContrato`: origem somente leitura (consultável pela mesma experiência F9/Consulta já existente), destino em estado comercialmente mutável (`O/R`) com capability `contracts.products.import`;
- modal de seleção mostrando origem, itens, quantidade a importar, preço histórico, preço atual calculado para o destino, preço escolhido e o resultado de consolidação/nova linha antes de confirmar;
- política de preço: padrão **Preço atual**, calculado para Cliente, cargo, markup, Filial e parâmetros do **destino** — nunca herdado cegamente da origem; capability específica permite escolher o preço histórico da origem ou editar o preço sugerido;
- a importação passa pelo **mesmo command/motor de inclusão de produto** já definido no spec 3 (reidrata catálogo, fiscalidade comercial, disponibilidade, conferência e defaults atuais do destino) — nunca um segundo caminho de inclusão de linha;
- regra de consolidação: soma à linha existente somente quando produto/variação, Filial, preço unitário, desconto/acréscimo e demais atributos da identidade comercial forem **compatíveis**; caso contrário cria nova linha. A prévia informa explicitamente "somará à linha X" ou "criará nova linha" e os novos totais antes da confirmação;
- transação única com `destinationRevision`: confirmação executa tudo atomicamente; falha em qualquer item não deixa importação parcial;
- pós-inclusão: recálculo de totais/proposta financeira do destino e marcação de conferência/logística dependentes como pendentes, conforme seus próprios engines (specs 6/7/8) — a origem permanece inteiramente inalterada.

Não inclua: Desmembrar Contrato (spec 12, já definido — operação distinta); qualquer cópia de reserva, lote/série, movimento, classificação fiscal histórica, desconto geral, parcelas ou logística executada da origem — nunca importados; reconstrução do motor de inclusão de produto do spec 3 — apenas reutilizado; qualquer alteração na origem.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `fmcopiarprodutoscontratos.pas/.dfm` e `dmcadastrocontratos.pas`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual do motor comercial e a ausência de qualquer implementação de importação, construindo a matriz de lacunas.

## Investigação Laravel obrigatória

- Confirme a ausência: busque por qualquer serviço de importação/cópia de produtos entre Contratos (`ImportarProdutos`, `contracts.products.import`, `CopiarProdutosContrato`) no checkout atual antes de prosseguir.
- O **command/motor de inclusão de produto** definido pelo spec 3 (generalização de `OrcamentoProdutoInclusaoService` e correlatos) — reaproveite integralmente para materializar as linhas no destino; não construa um segundo caminho de inclusão.
- F9/Consulta de Contratos (Fundação, spec 1) — já reutilizável em modo de seleção; a consulta da origem desta fatia usa a mesma experiência, não um segundo buscador.
- Motor de conferência (spec 6) e promessa logística (spec 7) — a marcação de "pendente" pós-importação reaproveita os mesmos engines já definidos ali; não crie um terceiro estado de pendência.
- `ContratoPropostaFinanceiraService` (spec 4) — reaproveite para o recálculo de totais/proposta financeira do destino após a importação, na mesma disciplina já usada pelos specs 9/12.

## Evidência Delphi confirmada

### Evidência e seleção

- `CONFIRMADO` — o modal Delphi pesquisa Contrato, lista produtos, permite selecionar todos/individualmente e confirma com F5. Evidências: `fmcopiarprodutoscontratos.pas:93-147,160-205`; DFM `:195-405`.
- `CONFIRMADO` — ele alterna preço atual e histórico (`fmcopiarprodutoscontratos.pas:150-157`); a carga inicial escolhe preço atual (`dmcadastrocontratos.pas:15900-15909,15938-15956`).
- `DECISÃO NOVA` — manter a operação separada: a origem é somente leitura, consultável pela mesma experiência F9/Consulta; o destino deve estar em estado comercial mutável e possuir capability `contracts.products.import`.
- `DECISÃO NOVA` — modal intuitiva mostra origem, itens, quantidade a importar, preço histórico, preço atual do destino, preço escolhido e resultado de consolidação/nova linha.

### Preço e inclusão

- `CONFIRMADO` — o Delphi reconsulta produto/estoque e atributos vigentes ao incluir. Evidência: `dmcadastrocontratos.pas:15978-16084`.
- `DECISÃO NOVA` — padrão **Preço atual**, calculado para Cliente, cargo, markup, Filial e parâmetros do destino; capability específica permite escolher preço histórico da origem ou editar preço sugerido.
- `DECISÃO NOVA` — a importação preserva apenas identidade/intenção selecionada e passa pelo mesmo command/motor de inclusão de produto do Cadastro: reidrata catálogo, fiscalidade comercial, disponibilidade, conferência e defaults atuais.
- `DECISÃO NOVA` — nunca importar reserva, lote/série, movimento, classificação fiscal histórica, desconto geral, parcelas, logística executada ou qualquer efeito da origem.

### Consolidação de linhas

- `CONFIRMADO` — o Delphi soma quantidade quando encontra o mesmo produto/Filial, sem reconciliar preço. Evidência: `dmcadastrocontratos.pas:15989-15996`.
- `DIVERGENTE` — o Laravel só consolida quando produto/variação, Filial, preço unitário, desconto/acréscimo e demais atributos da identidade comercial forem compatíveis; caso contrário cria nova linha.
- `DECISÃO NOVA` — a prévia informa "somará à linha X" ou "criará nova linha" e os novos totais; confirmação executa tudo atomicamente com `destinationRevision`; falha em qualquer item não deixa importação parcial.
- `DECISÃO NOVA` — depois da inclusão, recalcular totais/proposta financeira e marcar conferência/logística dependentes como pendentes conforme seus engines; o Contrato de origem permanece inalterado.

### Capabilities e guardas

| Operação | Capability principal | Estados | Prova sensível | Concorrência |
|---|---|---|---|---|
| Importar produtos | `contracts.products.import` | destino comercialmente mutável | preço histórico/manual exige capability própria | `destinationRevision` e transação única |

- `DECISÃO NOVA` — capabilities vêm do servidor e são reavaliadas na execução; a visibilidade do botão não autoriza o comando.

## Estado Laravel confirmado

- Nenhum serviço, comando ou capability de importação/cópia de produtos entre Contratos existe no checkout (`NÃO LOCALIZADO`).
- O motor/editor de inclusão de produto (spec 3), a F9/Consulta em modo de seleção (spec 1), o motor de conferência (spec 6) e a proposta financeira (spec 4) já existem ou já foram especificados como primitivas reaproveitáveis.

## Decisões obrigatórias

1. Importar produtos e Desmembrar Contrato são comandos, endpoints e capabilities distintos; a origem de uma importação nunca é alterada.
2. Origem é sempre somente leitura, consultada pela mesma experiência F9/Consulta; destino exige estado comercialmente mutável e `contracts.products.import`.
3. Preço padrão é sempre recalculado para o destino (Cliente/cargo/markup/Filial/parâmetros); herdar cegamente o preço da origem nunca é o comportamento padrão.
4. A importação usa o mesmo command/motor de inclusão de produto do spec 3; nenhuma lógica de inclusão paralela é criada.
5. Consolidação só ocorre quando toda a identidade comercial da linha (produto/variação, Filial, preço, desconto/acréscimo, demais atributos) for compatível; caso contrário, nova linha — nunca soma cega por produto/Filial como no Delphi.
6. A prévia sempre declara "somará à linha X" ou "criará nova linha" e os novos totais antes da confirmação.
7. A operação é uma única transação atômica protegida por `destinationRevision`; falha em qualquer item não deixa importação parcial.
8. Nunca são importados reserva, lote/série, movimento, classificação fiscal histórica, desconto geral, parcelas ou logística executada da origem.
9. Pós-importação, totais/proposta financeira do destino são recalculados e conferência/logística dependentes marcadas como pendentes pelos próprios engines — nunca por um mecanismo de pendência paralelo.
10. Capabilities e prova sensível vêm sempre do servidor e são reavaliadas na execução.

## Contrato do comando `ImportarProdutosDeContrato`

- Entrada: identidade da origem (somente leitura), identidade/`destinationRevision` do destino, seleção explícita de linhas com quantidade, escolha de preço (atual/histórico/manual, conforme capability), contexto do ator, idempotency key.
- Processo: validar origem existente e destino elegível (`contracts.products.import`, estado mutável, `destinationRevision`) → resolver preço conforme política → para cada linha, decidir consolidação ou nova linha via compatibilidade de identidade comercial → aplicar via o command de inclusão de produto do spec 3 → recalcular totais/proposta financeira do destino → marcar conferência/logística dependentes como pendentes.
- Saída: fotografia autoritativa do destino, nova `revision`, resumo por linha (consolidada/nova) e totais recalculados.
- Falha em qualquer linha não deixa o destino parcialmente importado; a transação inteira reverte. A origem nunca é escrita.

## Autorizações e parâmetros

- Reaproveite integralmente a matriz de autorizações já fixada na Fundação; `contracts.products.import` e a capability de preço histórico/manual seguem a mesma precedência (regra de estado → Permissão → Parâmetro → prova sensível).

## Testes obrigatórios

1. Consolidação: linha compatível soma corretamente; qualquer atributo divergente (preço, desconto, variação) cria nova linha em vez de somar.
2. Preço: padrão é sempre recalculado para o destino; capability específica permite histórico/manual; sem a capability, edição de preço é rejeitada.
3. Atomicidade: falha em qualquer linha selecionada não deixa nenhuma linha importada; `destinationRevision` obsoleta rejeita o comando inteiro.
4. Nunca importa reserva/lote/série/movimento/classificação fiscal histórica/desconto geral/parcelas/logística executada — teste explícito de ausência para cada um.
5. Origem nunca é escrita por este comando, em nenhum cenário, inclusive falha parcial.
6. Pós-importação: totais/proposta financeira recalculados corretamente; conferência/logística dependentes marcadas pendentes pelos engines dos specs 6/7/8.
7. Autorização server-side: payload manipulado no frontend não concede importação nem escolha de preço histórico/manual sem as capabilities corretas.

Prefira Feature tests no comando real; reutilize os testes existentes do motor de inclusão de produto (spec 3) e da F9/Consulta em modo de seleção como base de regressão.

## Entregáveis

- Contrato do comando `ImportarProdutosDeContrato` (entrada/processo/saída).
- Matriz de evidência Delphi × Laravel, deixando explícito o que é reaproveitado (F9, motor de inclusão, conferência, proposta financeira) e o que é novo nesta fatia (política de preço, consolidação, transação).
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- Desmembrar Contrato (spec 12, já definido);
- qualquer alteração na origem;
- reconstruir o motor de inclusão de produto, a F9/Consulta, a conferência ou a proposta financeira — apenas reutilizá-los;
- alterar o schema Delphi.
```
