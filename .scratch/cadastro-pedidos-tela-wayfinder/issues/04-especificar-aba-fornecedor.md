# Especificar a aba "Fornecedor" (dados cadastrais read-only)

Type: grilling
Status: resolved
Blocked by:

## Question

A aba "3-Fornecedor" (`dados_fornecedor.png`) exibe endereço, número, complemento, bairro, CEP, cidade/UF, 2 telefones (DDD+número), CPF/CNPJ, inscrição estadual e contato — aparentemente somente leitura, espelhando o cadastro do fornecedor selecionado no pedido. Localizar em `dmcadastropedidos.pas`/`.dfm` a query/dataset que alimenta esta aba, confirmar se é 100% read-only (sem edição inline do cadastro do fornecedor a partir daqui) e mapear os campos exatos para o cadastro de fornecedores já existente no Laravel (reaproveitar a entidade, não duplicar dados). Documentar como CONFIRMADO/DÚVIDA conforme evidência encontrada.

## Answer

### Confirmado: mesma query já usada pelo lookup de fornecedor no cabeçalho (CONFIRMADO, `fmcadastropedidos.dfm:2717-2900`, `dmcadastropedidos.dfm:950-1113`)

A aba "3-Fornecedor" é alimentada inteiramente por `dtmCadastroPedidos.dsrProcuraFornecedores` — **a mesma datasource já usada** para preencher `dtxNomeFonecedor` no cabeçalho (nome do fornecedor ao lado do lookup F9 de fornecedor). Todos os campos da aba (`dtxContato`, endereço via `fraEndereco1` — rua/número/complemento/bairro/cidade/estado/CEP) têm `ReadOnly = True` explícito. A query (`qryProcuraFornecedores`) seleciona: `codigo, nome, estado, foneddd, fonenumero, faxddd, faxnumero, inscricaoestadual, contato, rua, numero, complemento, nomecidade, nomebairro, pessoanumero (CPF/CNPJ), bairro, cidade, cep, markup, crt` — já é recarregada sempre que o fornecedor do pedido muda (mesmo ponto que atualiza o cabeçalho).

**Não é uma query nova, não é uma tela nova** — é uma segunda exibição, mais completa, dos mesmos dados do fornecedor já carregados para o cabeçalho do pedido.

### Decisão

Nenhuma spec de backend nova é necessária — reaproveitar exatamente os dados do fornecedor já resolvidos ao selecionar o fornecedor do pedido (mesmo endpoint/objeto que já alimenta o cabeçalho). É puramente uma questão de exibição frontend: uma aba adicional mostrando endereço completo, 2 telefones, CNPJ/IE e contato principal, todos somente leitura. Publicado junto no prompt `11-speckit-prompt.md` (abas informativas simples).
