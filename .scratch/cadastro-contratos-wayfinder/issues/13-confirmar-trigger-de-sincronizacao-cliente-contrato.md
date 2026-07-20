Type: task
Status: resolved
Blocked by: 04
Unblocks: 05

## Question

Qual é a definição real, no schema PostgreSQL, da trigger/função que sincroniza alterações cadastrais de Cliente para Contratos, incluindo tabelas de origem, situações elegíveis, colunas copiadas, efeitos sobre dados fiscais, auditoria e `revision`?

Registrar evidência DDL concreta e comparar com a regra decidida: cadastro mestre autoritativo em `O/R/F` e fotografia congelada em `P/N/C`. Se a implementação divergir, classificar a divergência e propor o ajuste necessário no Laravel sem alterar o schema neste workspace.

## Resolution

### Método e cadeia física

- `CONFIRMADO` — a definição foi lida no PostgreSQL efetivamente usado pelo container Laravel, em transação `READ ONLY`, por `information_schema.triggers` e `pg_get_functiondef`. Script reproduzível: `../schema-cliente-contrato-readonly.php`.
- `CONFIRMADO` — em `clientes`, a trigger `clientes_depoisatualizar`, `AFTER UPDATE`, executa `clientes_depoisatualizar()`; é ela que sincroniza dados cadastrais para `contratos`.
- `CONFIRMADO` — `clientes_atualizavfornecedores`, `fornecedores_atualizavfornecedores` e `filiais_atualizavfornecedores` executam `atualizavfornecedores()` em `INSERT/UPDATE/DELETE`, mantendo a tabela unificada `vfornecedores` para tipos `C/F/L`.
- `CONFIRMADO` — `fornecedores_depoisatualizar`, `AFTER UPDATE`, trata apenas mudança de código em vínculos; não copia a fotografia do Fornecedor para o Contrato.
- `NÃO LOCALIZADO` — não há `filiais_depoisatualizar` nem outra trigger de Filial que atualize diretamente `contratos`; Filial apenas atualiza sua representação `L` em `vfornecedores`.

### Matriz real por origem cadastral

| `tipocliente` | Mestre | Atualização ampla da fotografia | Mudança de código | Situações |
|---|---|---|---|---|
| `C` | `clientes` | sim, quando `UPPER(parametros_valor('AtualizarDadosClientesContratos'))='TRUE'` | sim | fotografia ampla somente `O/R/F`; código em todas |
| `F` | `fornecedores` | não localizada | sim | mudança de código em todas |
| `L` | `filiais` | não localizada | não localizada para Contrato | nenhuma sincronização direta confirmada |

- `CONFIRMADO` — a sincronização ampla `C` filtra `WHERE cliente=NEW.codigo AND tipocliente='C' AND situacao IN ('O','R','F')`.
- `DIVERGENTE` — a decisão de cadastro mestre autoritativo em `O/R/F` para qualquer origem `C/F/L` não é cumprida pelo schema atual: está implementada amplamente somente para `C`.
- `DECISÃO NOVA` — o Laravel deve aplicar a mesma política funcional para `C/F/L` por um resolver de origem cadastral, sem depender exclusivamente da assimetria das triggers. Em `O/R/F`, após salvar o mestre, recarrega e sincroniza a fotografia autorizada; em `P/N/C`, não reescreve a fotografia.
- `DECISÃO NOVA` — enquanto a compatibilidade com o Delphi exigir as triggers existentes, o serviço deve considerar que uma gravação de `C` já pode ter atualizado o Contrato e sempre recarregar estado/revision antes de tentar qualquer complemento.

### Campos copiados para Contratos `C` em `O/R/F`

`CONFIRMADO` — a função atualiza diretamente as seguintes famílias:

- identidade e nome: `nome`, `nascto`, `apelido`, `sexo`, `civil`, `civildata`, `iddocumento`, `idorgao`, `iddata`, `idestado`, `pessoatipo`, `pessoanumero`;
- família e avaliação: `mae`, `pai`, `conceito`, `naturalcidade`, `naturalestado`, `conjuge` e extensa fotografia do cônjuge;
- endereço e contato: `rua`, `estado`, `cidade`, `bairro`, `cep`, `endnumero`, `endcomplemento`, telefones principal/alternativo e `email`;
- residência, trabalho e renda: campos `res*`, `empresa`, `emp*`, `emprenda*` e `empcargo`;
- referências: `referencia`, `reftipo`, endereço, CEP e telefones `ref*`;
- avaliação cadastral: `observacoes`, `automovel`, cartões, cheque, cheque especial, dependentes e ônus;
- fiscal: `contribicms`.

- `CONFIRMADO` — a lista é extensa e explícita no `UPDATE contratos` da função `clientes_depoisatualizar()`; não é um `SELECT *` nem cópia dinâmica.
- `DIVERGENTE` — alguns campos decididos como específicos da negociação aparecem na cópia legada, especialmente `observacoes`, indicadores de cartão/cheque, dependentes e ônus. A lista da trigger não redefine automaticamente a fronteira do novo domínio.
- `DECISÃO NOVA` — o spec do núcleo deve manter uma whitelist versionada de campos mestre → fotografia, separada de campos próprios da Venda. Mudanças na whitelist exigem decisão explícita e testes; não copiar cegamente a função inteira.

### Exceções que ultrapassam `O/R/F`

- `CONFIRMADO` — se `clientes.codigo` muda, a função atualiza `contatosvfornecedores`, `contratos`, `dadosfiscais`, `documentospag` e `notaspag` sem filtro de situação.
- `CONFIRMADO` — se `conceito` muda, atualiza `contratos` e `dadosfiscais` tipo `C` sem filtro de situação.
- `DIVERGENTE` — portanto, a implementação física não congela integralmente `P/N/C`: código e conceito continuam sendo propagados.
- `DECISÃO NOVA` — mudança de chave é manutenção de integridade referencial, não atualização da fotografia, e pode atravessar estados. No Laravel, preferir identidade estável e tratar renumeração como operação administrativa auditada.
- `DECISÃO NOVA` — `conceito` em `P/N/C` não deve reescrever a fotografia histórica. Se consultas precisam do conceito atual, devem lê-lo como projeção vinculada ao mestre, separado do snapshot do Contrato.

### Efeitos fiscais reais

- `CONFIRMADO` — `clientes_antesatualizar`, `BEFORE UPDATE`, ao mudar `pessoatipo`, `pessoanumero` ou `iddocumento`, atualiza `dadosfiscais` tipo `C` compatíveis com a identidade anterior e `notaspag` cujo fornecedor é tipo `C`; não filtra situação do Contrato/documento.
- `CONFIRMADO` — mudança de `conceito` atualiza `dadosfiscais` tipo `C` sem filtro de situação.
- `CONFIRMADO` — mudança de complemento atualiza `dadosfiscais` em situação `N` somente para NFS-e modelo `99` sem `numprotocolonfse` ou NF-e modelo `55` sem `numprotocolonfe`; ou seja, documentos ainda não transmitidos/autorizados.
- `DIVERGENTE` — identidade fiscal já emitida não pode ser tratada como simples extensão da sincronização cadastral no Laravel. Documento autorizado mantém sua fotografia; correção/cancelamento fiscal segue comando próprio.
- `DECISÃO NOVA` — o novo sincronizador nunca atualiza documento fiscal autorizado. Para documentos ainda preparatórios, delega ao domínio fiscal e registra evento vinculado, em vez de executar update amplo a partir da tela do Contrato.

### Fluxo inverso existente no Delphi

- `CONFIRMADO` — em gravação de Contrato `O/R`, o Delphi chama `AtribuirContratoNoCliente` antes do commit: `delphi/apps/vendas/dmcadastrocontratos.pas:7909-7935`.
- `CONFIRMADO` — para `C`, `AtribuirQuery` copia diferenças da fotografia do Contrato de volta para `clientes`; para `F`, `AtribuirContratonoFornecedor` copia nome, endereço, telefones, observações, e-mail, documento, estrangeiro, inscrição municipal e Simples para `fornecedores`: `dmcadastrocontratos.pas:2868-2967`, `:3063-3084`.
- `NÃO LOCALIZADO` — não há fluxo inverso equivalente para `L` nessa rotina.
- `DIVERGENTE` — o legado permite que a tela do Contrato edite o cadastro mestre indiretamente. Isso contradiz a decisão nova de usar o cadastro mestre como único editor.
- `DECISÃO NOVA` — o Laravel não reproduz esse fluxo inverso. “Editar Cliente” abre o cadastro `C/F/L`; ao salvar, o Contrato apenas recarrega a fotografia conforme estado e política.

### Auditoria e revision

- `CONFIRMADO` — qualquer `UPDATE contratos` disparado pela sincronização passa por `trg_contratos_audit_log_new`, produzindo `contratos_log_new` com diff, ator/origem/request id quando o contexto Laravel estiver presente. Os logs legados também continuam ativos.
- `CONFIRMADO` — `trg_contratos_set_created_updated_at` compara o registro excluindo `created_at`, `updated_at` e `cloud_row_version`; havendo mudança real, renova `updated_at`.
- `CONFIRMADO` — no PostgreSQL, qualquer update também muda o `xmin`, padrão já usado no Laravel para tokens de concorrência do Orçamento: `LegacyOrcamentoRepository.php:74-84`.
- `NÃO LOCALIZADO` — `replicacao_set_timestamps_fn()` não incrementa `cloud_row_version`; ele é ignorado na comparação. O futuro repositório de Contrato não deve supor que essa coluna muda no PostgreSQL.
- `DECISÃO NOVA` — o token autoritativo do Contrato no PostgreSQL deve detectar updates feitos por triggers/Delphi, preferencialmente `xmin` ou envelope equivalente. Após editar o mestre, o shell recarrega fotografia, capabilities e revision antes de permitir nova gravação.
- `DECISÃO NOVA` — sincronização causada pelo cadastro mestre aparece na timeline como evento “Dados cadastrais sincronizados”, correlacionado à gravação do mestre quando houver `request_id`; mudanças Delphi aparecem como origem externa, sem inventar autoria.

### Ajuste Laravel consolidado

1. Resolver o mestre por `tipocliente`: Cliente, Fornecedor ou Filial.
2. Manter edição apenas no cadastro mestre correspondente.
3. Em `O/R/F`, sincronizar por whitelist comum e recarregar revision; em `P/N/C`, manter snapshot.
4. Separar identidade referencial, conceito atual e fotografia histórica.
5. Não atualizar fiscal autorizado; encaminhar ao domínio fiscal.
6. Recalcular efeitos comerciais apenas quando campos relevantes mudarem, usando preparação/confirmacão já definida para troca de Cliente.
7. Auditar origem, campos, Contratos afetados e eventual autorizador, sem copiar dados secretos.

## Spec boundary

Este inventário **não recebe `$to-spec` isolado**. Ele desbloqueia “Reconciliar Contrato originado de Orçamento” e integra o primeiro spec do núcleo/Cliente, que deve explicitar whitelist, estados `O/R/F`, congelamento `P/N/C`, assimetria legada `C/F/L`, fiscal e revision.
