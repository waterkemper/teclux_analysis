# Seleção de Cliente e gravação do Orçamento

Label: wayfinder:map

## Destination

Produzir uma análise de lacunas baseada em evidências e pronta para `$to-spec` sobre a seleção, troca e remoção do Cliente no Cadastro de Orçamentos, seus alertas e recálculos, e toda a validação e preparação dos dados durante a gravação, sem implementar neste workspace.

## Notes

- `delphi/` e `laravel/` são fontes somente de leitura. Nenhuma implementação será realizada neste workspace.
- Analisar PAS e DFM conjuntamente, incluindo ancestrais, data modules, units compartilhadas, queries, eventos, actions, permissões e parâmetros.
- Toda conclusão deve conter evidência concreta e ser classificada pelo vocabulário do `AGENTS.md`.
- No Orçamento, o termo canônico é **Cliente**, inclusive quando `tipocliente` for `F` ou `L`.
- A elegibilidade dos tipos `C`, `F` e `L` respeita `SelecionarSomenteClientesnasVendas`.
- A troca de Cliente que puder afetar preços exige confirmação. Considerar, no mínimo, `Considerar Markup Clientes`, `Preços por Cargo` e `Cargo Tabela Preço Padrão`.
- Cancelamento ou falha de recálculo restaura atomicamente o Cliente anterior e todos os dados dependentes.
- Preservar o comportamento parametrizado da Ficha Financeira, incluindo `MostrarFichaSomenteAtraso`, `PerguntarAntesExibirFicha`, `naoexibirfichafinanceira` e autorização de Analista de Crédito. Débitos e alertas, isoladamente, não bloqueiam.
- Orçamentos em aberto geram alerta informativo com ação de consulta, sem bloquear a seleção.
- Cadastro desatualizado conforme `DiasAvisoAtualizarCliente` é alertado na seleção e impede a gravação enquanto não for conferido ou revisado.
- A seleção copia uma fotografia dos dados atuais do Cliente para o Orçamento.
- **CONFIRMADO:** durante a gravação Delphi, `AtribuirDadosClienteOrcamentonoCliente` propaga alterações do Orçamento para `clientes` quando `tipocliente = C` e para `fornecedores` quando `tipocliente = F`. São abrangidos nome, cargo quando aplicável, tipo/número do documento, indicador de estrangeiro, endereço, telefones e e-mail, além das datas de última alteração e de alteração do endereço.
- **CONFIRMADO:** se o endereço do Orçamento estiver incompleto, o Delphi solicita confirmação e pode gravar o endereço da Filial no cadastro do Cliente/Fornecedor.
- **NÃO LOCALIZADO:** `AtribuirDadosClienteOrcamentonoCliente` não possui tratamento equivalente explícito para `tipocliente = L`.
- A política Laravel para refletir alterações do Orçamento no Cadastro de Clientes deve preservar a paridade Delphi ou registrar uma **DECISÃO NOVA** explícita; não assumir isolamento entre a fotografia do Orçamento e o cadastro mestre.
- Precedência de planos: planos manuais do Orçamento; plano padrão do Cliente quando habilitado; `PlanoOrcamentoPadrao` se ainda não houver plano. Troca de Cliente não sobrescreve plano manual sem confirmação.
- A gravação deve ser transacional para Orçamento, Produtos, Serviços, planos, parcelas, contatos e demais vínculos.
- Remover o Cliente exige confirmação, mantém Produtos e Serviços, limpa dados derivados e reavalia preços, descontos, cashback, crédito de troca e planos. Falhas desfazem integralmente a remoção.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Ordem exata dos eventos Delphi ao selecionar, trocar ou remover o Cliente.
- Matriz completa de alertas, autorizações, parâmetros e efeitos bloqueantes ou informativos.
- Precedência detalhada de preço por Cliente, cargo, tabela, promoção e demais exceções.
- Campos que compõem a fotografia do Cliente no Orçamento e dados derivados que devem ser limpos.
- Regras completas de cashback, crédito de troca, contatos, endereço, impostos e entrega.
- Validações e efeitos colaterais completos da gravação Delphi, diferenciando inclusão e alteração.
- Estado atual e lacunas equivalentes no Laravel.
- Critérios de aceite, concorrência, rollback e testes.

## Out of scope

- Implementar ou testar código funcional.
- Definir antecipadamente que o Cadastro de Clientes não será atualizado pelo Orçamento; essa política depende da análise de paridade e de uma decisão funcional explícita.
- Alterar arquivos em `delphi/` ou `laravel/` ou executar migrations, Composer, npm, builds, formatadores ou geradores nesses diretórios.
- Gerar o prompt de `/speckit.specify` antes de concluir a análise de lacunas.
