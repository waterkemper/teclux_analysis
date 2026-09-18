# Validar elegibilidade de planos por grupos de produtos

Label: wayfinder:map

## Destination

Definir, com evidência Delphi e Laravel, a regra de elegibilidade de planos de pagamento vinculados a `planosgrupos`, preparar o ajuste do Cadastro de Orçamentos no Delphi e produzir um recorte Laravel pronto para `/speckit.specify`, sem implementar a correção nesta atividade.

## Notes

- Regra de negócio adotada: um plano vinculado a grupos só pode ser utilizado quando todos os grupos distintos dos produtos do documento estiverem contemplados pelo plano. Portanto, um produto de grupo elegível mais outro produto de grupo não vinculado torna o plano inelegível.
- Plano sem registros em `planosgrupos` e `planosclasses` é tratado pelo legado como plano sem restrição; confirmar se essa exceção deve permanecer no novo Laravel.
- Produto sem grupo/classe não pode ser confundido com ausência de produtos: a decisão de negócio deve ser explícita, pois o Delphi atual libera o filtro quando as duas listas chegam vazias.
- Delphi analisado em `delphi/apps/vendas/dmorcamentos.pas/.dfm`, `fmorcamentos.pas/.dfm`, `fmcadastrocontratos.pas/.pas` e `dmcadastrocontratos.pas/.dfm`, além do motor compartilhado `delphi/repositorio/dmcalculofinanciamento.pas/.dfm`.
- Laravel analisado em `PlanosFinanciamentoFilter`, `SimulacaoFinanciamentoService`, `OrcamentoFinanciamentoEmbutidoService`, `FinanciamentoEmbutidoPanel`, `ContratoPropostaFinanceiraService` e `LegacyPlanosSimulacaoRepository`.
- Nenhuma implementação, migration, build ou alteração funcional deve ser feita durante este mapa.

## Decisions so far

- [Confirmar comportamento atual do Cadastro de Contratos Delphi](issues/01-confirmar-comportamento-contratos-delphi.md) — resolvido: o filtro compartilhado exige todos os grupos quando recebe a lista, mas o Cadastro depende de arrays mantidos no formulário e libera tudo quando as listas chegam vazias; não é possível certificar o comportamento como correto para o caso relatado.
- [Verificar paridade Laravel e cobertura do cenário](issues/03-verificar-paridade-laravel-e-cobertura.md) — resolvido: Laravel usa qualquer interseção, o Orçamento não deriva/envia grupos e o fluxo Laravel de Contratos não filtra o plano explícito; não existe teste do cenário e a execução foi bloqueada pela versão do PHP.

## Not yet specified

- Definir a fonte canônica dos grupos/classes no Delphi e no Laravel: linhas em memória, banco persistido ou ambos.
- Definir se documento com produto sem grupo/classe deve excluir planos restritos, ignorar esse item ou gerar validação explícita.
- Definir a semântica de planos com vínculos somente em `planosgrupos`, somente em `planosclasses` ou em ambos.
- Definir a validação obrigatória no servidor para confirmação/gravação, além da filtragem visual da lista.
- Definir o contrato HTTP Laravel para transportar ou derivar os grupos/classes sem aceitar dados manipulados pelo cliente.
- Definir os fixtures e testes de regressão para: grupo compatível, grupo incompatível, mistura compatível/incompatível, produto sem grupo e plano sem vínculos.

## Out of scope

- Corrigir Delphi ou Laravel nesta atividade.
- Alterar a semântica de juros, descontos, parcelas ou limites monetários.
- Produzir um spec Laravel que inclua mudanças no Delphi.

