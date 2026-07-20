# Revisar a inclusão e edição de Produtos no Orçamento

Label: wayfinder:map

## Destination

Produzir uma análise completa, baseada em evidências, do fluxo Delphi–Laravel da modal de inclusão e edição de Produtos no Cadastro de Orçamentos, corrigindo conceitualmente a máquina de estados de quantidade e comandos e identificando todas as demais lacunas, pronta para `$to-spec` sem implementar neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling` nas decisões. Obter fatos no código; classificar conclusões como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência.
- Tratar `delphi/` e `laravel/` como somente leitura. Analisar PAS e DFM conjuntamente, incluindo ancestors, data modules, units compartilhadas, queries, eventos, actions, Parâmetros do Sistema e Permissões.
- O destino funcional é o Cadastro de Orçamentos. Como o Laravel reutiliza um modal compartilhado de Produtos de Venda, mapear impactos e regressões nos demais consumidores sem migrar suas regras específicas.
- Edição explícita substitui a quantidade atual; nunca soma.
- Um novo bipe do mesmo Produto e Filial soma `1`, salvo quando uma quantidade foi deliberadamente preparada antes do código.
- Com código vazio, a quantidade preparada antes do bipe é consumida uma única vez. Se o Produto já existe na mesma Filial, essa quantidade é incremento; se é novo, é a quantidade inicial.
- Sem quantidade preparada, bipar outro Produto enquanto um Produto com quantidade `5` está visível inclui o novo com quantidade `1`.
- Durante edição explícita, bipar outro Produto preserva a linha original e inicia nova inclusão com quantidade `1`; alterações não confirmadas da edição não migram para a nova linha.
- Após gravar, manter o Produto salvo visível, focar e selecionar o campo de código. A quantidade mostrada não permanece preparada.
- `F5` deve ignorar repetição automática e não pode confirmar novamente até nova interação funcional do Usuário.
- Operações assíncronas devem impedir confirmação concorrente. Durante consulta/gravação, manter no máximo um próximo bipe em fila; não perder nem duplicar silenciosamente.
- A soma automática identifica a linha por Produto e Filial. O mesmo Produto em Filial diferente é outra linha.
- Ao fechar a modal com mudanças, preservá-las e tentar gravar/recalcular o Orçamento. Sem pré-requisitos, manter mudanças pendentes na tela principal e informar claramente.
- Comparar integralmente Produto, Filial, vendedor, preço, promoção, desconto/autorização, estoque, similares, grades, pedidos, fornecedores, montagem, entrega, observações, fotos, parâmetros, permissões, foco, atalhos, validações, totais e planos.
- Preservar comportamento funcional comprovado, permitindo melhor organização visual no Laravel. Não converter limitações ou possíveis bugs Delphi em requisitos.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Causa completa do bloqueio observado na edição de quantidade, além das transições já suspeitas entre inclusão, edição e refresh assíncrono.
- Matriz precisa dos Parâmetros do Sistema e Permissões que habilitam, ocultam ou alteram campos e ações da modal.
- Paridade das informações e tabs secundárias, inclusive consultas e critérios de visibilidade.
- Semântica exata das validações de preço, desconto, estoque, montagem, entrega e agenda.
- Sequência transacional entre alterações locais, recálculo de totais/planos e gravação do Orçamento.
- Comportamento dos demais consumidores do modal compartilhado que precisa permanecer protegido.
- Forma final dos contratos HTTP, máquina de estados, testes e prompt `/speckit.specify`.

## Out of scope

- Implementar correções ou executar testes, migrations, Composer, npm, builds, formatadores ou geradores em `delphi/` ou `laravel/`.
- Redesenhar todo o Cadastro de Orçamentos fora das interações e consequências da modal de Produtos.
- Migrar regras funcionais específicas de Contratos ou outros documentos; somente proteger o componente compartilhado contra regressões.
- Copiar bugs ou limitações visuais do Delphi.

