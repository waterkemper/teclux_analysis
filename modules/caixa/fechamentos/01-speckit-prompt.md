# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, a Fundação de Caixa — o estado de abertura/fechamento de caixa no Usuário e o domínio/schema do ledger `autenticacoes` — a base sobre a qual o Fechamento de Caixa (spec seguinte, `02-speckit-prompt.md`) e futuras fatias do app Caixa (Frente de Caixa, Controle de Recebimentos, Transferências etc., fora deste pacote) serão implementadas.

Não implemente nesta etapa. O Laravel já possui Cadastro de Usuários maduro e os booleanos de perfil `caixa`/`gerentecaixa`/`administrador`/`suporte`, mas nenhum estado de abertura/fechamento de caixa nem a tabela `autenticacoes`. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Se o pacote fornecido for insuficiente ou ambíguo, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existir:

- os campos de estado de caixa no Usuário (`dataaberturacaixa`, `datafechamentocaixa`) e a derivação de `caixaaberto`;
- um comando de domínio `AbrirCaixa` (unificando Abrir/Reabrir), com a autorização sensível de Gerente de Caixa evidenciada — sem rota/UI própria nesta entrega;
- o domínio/schema do ledger `autenticacoes`, somente leitura, cobrindo os 14 tipos de lançamento evidenciados;
- leitura mínima (sem CRUD) de `cheques` e `recebimentos`, necessária para os tipos `H` e `T`;
- reaproveitamento do Cadastro de Eventos e do Cadastro de Tipos de Recebimento já existentes, sem nenhuma extensão a eles.

Não inclua nesta entrega: nenhuma tela/fluxo de lançamento (Frente de Caixa, Controle de Recebimentos, Estorno, Cheques/Recebimentos, Depósitos, Transferências, Duplicatas, Perdas, Devoluções, Renegociação, Quitação Extra Caixa); a totalização, a aba Eventos, o PDF e a ação Fechar Caixa do Fechamento de Caixa (spec `02-speckit-prompt.md`, que consome esta fundação); qualquer integração ECF/impressora fiscal/TEF.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `apps/caixa/dmfechamentocaixa.pas/.dfm`, `apps/caixa/fmfechamentocaixa.pas/.dfm`, `apps/tecsoft/fmtecsoft.pas` e `biblio/clusuario.pas`/`biblio/clparametrossistema.pas`.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual e localizar os seams existentes reaproveitáveis.
- Se uma decisão depender de informação Delphi ausente, registre a pergunta exata para o workspace de análise.

## Investigação Laravel obrigatória

Analise o estado existente antes de desenhar qualquer schema novo:

- `App\Models\Usuario`, `LegacyUsuarioReadRepository` e a migration `2026_04_02_000001_align_usuarios_perfil_booleans_sqlite.php` (booleanos `caixa`/`gerentecaixa`/`administrador`/`suporte` já existentes);
- `App\Models\EventoCadastro`, `EventosController`, `EventoService`, `LegacyEventosRepository` (Cadastro de Eventos completo, a reaproveitar como lookup);
- `App\Models\TipoRecebimentoVenda` e `LegacyTipoRecebimentoRepository` (Cadastro de Tipos de Recebimento completo sobre `tiposrecebimentos`, mesmo enum `D/C/B/H/T/P` do Delphi);
- `App\Domain\Vendas\Comercial\MoneyDecimal` (convenção de dinheiro decimal, nunca float);
- `App\Services\Authorization\SensitiveOperationAuthService`/`SensitiveOperationProofService` e `ValidateSensitiveOperationProofRequest` (autorização sensível por senha já pronta e reutilizada por outros módulos);
- `specs/054-configuration-center` (Configuration Center — destino dos Parâmetros do Sistema deste domínio);
- os repositórios `Legacy*Repository` já existentes para Contrato/Parcela, Banco, Motivo, DocumentoPag/Duplicata e Fornecedor (padrão de repositório fino sobre tabela legada a seguir para `autenticacoes`/`cheques`/`recebimentos`).

## Evidência Delphi confirmada

### Caixa é o próprio Usuário

- `qryCaixas`/`qryConsultaCaixas` fazem `SELECT ... FROM usuarios WHERE codigo=:codigo` — não existe entidade `caixas` separada (`dmfechamentocaixa.dfm:6-93`).
- Campos: `codigo`, `nome`, `dataaberturacaixa`, `datafechamentocaixa`; `caixaaberto` é sempre derivado, nunca uma coluna física.
- **DIVERGENTE (resolvido)**: duas derivações de `caixaaberto` coexistem no Delphi — a tela de Fechamento exige `dataaberturacaixa > datafechamentocaixa AND dataaberturacaixa = current_date` (`dmfechamentocaixa.dfm:22-23`); o objeto `TtecUsuarios.LerPropriedades` (`biblio/clusuario.pas:632`) só compara `datafechamentocaixa < dataaberturacaixa`, sem exigir hoje. **DECISÃO NOVA**: adotar a regra mais estrita (exige hoje) como única fonte de verdade no Laravel; a outra fica documentada como não replicada.

### Abertura de caixa

- O gatilho real de abertura não é automático nem mora em `apps/caixa` — é `TfrmTecsoft.AbrirCaixa` (`apps/tecsoft/fmtecsoft.pas:545-581`), acionado sob demanda pelos handlers de menu de Frente de Caixa e Autenticações do Caixa (fora de escopo) na primeira vez que o usuário tenta uma ação que depende de caixa aberto no dia.
- Quando o caixa não está aberto, sempre aparece confirmação + autorização de Gerente de Caixa (senha se o usuário logado já é Gerente de Caixa, login completo de outro usuário Gerente de Caixa caso não seja) antes de reabrir.
- **POSSÍVEL BUG LEGADO**: o "caminho silencioso" (`if PermiteAbrirCaixa then AbrirCaixa` sem confirmação) é código morto — `PermiteAbrirCaixa` exige `CaixaAberto=true`, mas só se entra nesse bloco quando `CaixaAberto` já é falso. Não replicar.
- `ReAbrirCaixa` (`clusuario.pas:707`) empurra só `datafechamentocaixa` para ontem, sem tocar `dataaberturacaixa` — mecanismo incompatível com a regra de `caixaaberto` adotada acima. **DECISÃO NOVA**: `AbrirCaixa`/`ReAbrirCaixa` colapsam num único comando de domínio `AbrirCaixa` que sempre seta `dataaberturacaixa := hoje`.
- `FecharCaixa(Value)` só persiste se `Value = FDataAberturaCaixa` — guarda de consistência a preservar (o valor de fechamento deve ser exatamente a data em que o caixa foi aberto).

### Ledger autenticacoes — 14 tipos de lançamento

Evidenciado pela query completa de `qryAutenticacoes` e pela query UNION completa de `qryTotalizacoesCaixa` (`dmfechamentocaixa.dfm:94-1045`):

| tipo | significado |
|---|---|
| P | Prestação (recebimento de parcela) |
| F | Frente de Caixa (recebimento) |
| D | Documento — entrada ou saída (direção derivada por comparação cronológica de `saldo`, sem flag própria) |
| N | Devolução de numerário |
| A | Devolução de saldo de troca |
| B | Depósito bancário |
| C | Cancelamento (autenticação que cancela outra, via campo auto-referente `autenticacao`) |
| H | Cheque — à vista/prazo/não identificado (via join com `cheques`) |
| S | Transferência de saída |
| E | Transferência de entrada |
| J | Perdas |
| R | Resgate de cheque |
| G | Duplicata de fornecedor |
| T | Cartão/PIX/Crédito de Troca (via join com `recebimentos`/`tiposrecebimentos`, não soma `autenticacoes.valor` diretamente) |
| U | Ajuste de saldo de devolução/troca — **POSSÍVEL BUG LEGADO/gap de documentação**: existe e é usado na totalização, mas o comentário-fonte Delphi (`dmfechamentocaixa.pas:228-243`) só lista os outros 13 tipos, omitindo este. |

Colunas confirmadas de `autenticacoes`: `numero` (PK), `data`, `hora`, `filial`, `caixa` (FK usuário operador), `autenticacao` (auto-FK de cancelamento), `banco`, `cheque`, `contrato`, `contratoparcela`, `parcela`, `evento`, `historico`, `motivo`, `nota`, `parametros`, `saldo` (saldo acumulado após o lançamento), `situacao`, `tipo`, `transferencia` (FK usuário, caixa de origem/destino), `entradapendente`, `confirmacao`, `valor`, `valorvenctoparcela`, `documentopag`, `numeroduplicata`, `venctoduplicata`, `cliente`/`tipocliente`, `transacao` (correlaciona com `recebimentos.transacao` para tipo `T`), `cancelada`.

Exclusão de cancelados na leitura padrão: `Not Exists (select a1.numero from autenticacoes a1 where a.numero = a1.autenticacao)` — este é o predicado usado pela totalização (spec 02); o boolean `cancelada` é usado só pela aba Eventos. **DÚVIDA**: consistência física entre as duas formas de saber "está cancelado" não é verificável sem acesso ao banco/triggers ao vivo — documentar e não assumir equivalência.

### Entidades relacionadas — o que já existe no Laravel

Contrato/Parcela, Banco, Motivo, DocumentoPag/Duplicata e Fornecedor/vfornecedores já têm repositórios `Legacy*Repository` no checkout (ver Investigação Laravel obrigatória) — reaproveitar, não recriar. `cheques` e `recebimentos` (o ledger de transações, distinto de `tiposrecebimentos`) **não têm nenhum repositório Laravel** — são lacunas reais que esta fundação preenche com leitura mínima.

### Eventos e Tipos de Recebimento já são Cadastros completos

`eventos` não é conceito próprio do Caixa — já é Cadastro completo em Vendas (`EventoCadastro`/`EventosController`/`LegacyEventosRepository`, campo `tipomovimentacao` já reconhecido). `tiposrecebimentos` também já é Cadastro completo (`TipoRecebimentoVenda`, mesmo enum `D/C/B/H/T/P`). Esta fundação só consome os dois como lookup, sem nenhuma extensão.

## Decisões obrigatórias

1. Estado de caixa vive no Usuário (`dataaberturacaixa`, `datafechamentocaixa`), nunca numa entidade `Caixa` separada.
2. `caixaaberto` é sempre derivado: `dataaberturacaixa > datafechamentocaixa AND dataaberturacaixa = hoje`.
3. Um único comando de domínio `AbrirCaixa` seta `dataaberturacaixa := hoje`, gated pela mesma autorização sensível de Gerente de Caixa evidenciada (senha se já é Gerente de Caixa; login completo de outro Gerente de Caixa caso não seja) — sem rota/UI própria nesta entrega.
4. `FecharCaixa` (comando de domínio, consumido pelo spec 02) preserva a guarda de consistência: só persiste quando a data de fechamento é exatamente a data de abertura vigente.
5. Repositório fino `LegacyAutenticacaoRepository` (seguindo o padrão `Legacy*Repository` já dominante no checkout) expõe leitura tipada por finalidade sobre `autenticacoes`; os 14 tipos são um discriminador simples (`tipo`), não uma classe de domínio por tipo.
6. Repositórios de leitura mínima para `cheques` (campos usados: `vencto`, `data`, `cliente`, `tipocliente`) e `recebimentos` (campos usados: `transacao`, `tiporecebimento`, `valorlancto`, `datalancto`, `filial`, `situacao`) — sem CRUD.
7. Nenhuma extensão ao Cadastro de Eventos ou ao Cadastro de Tipos de Recebimento; ambos são consumidos como estão.
8. Toda representação monetária usa `MoneyDecimal`, nunca float/double, mesmo o Delphi usando `TFloatField` na maioria dos campos.
9. Nenhuma migration cria ou altera tabelas fisicamente inexistentes no Postgres compartilhado — `usuarios`, `autenticacoes`, `eventos`, `cheques`, `recebimentos`, `tiposrecebimentos` já existem populadas em produção; o trabalho aqui é de repositório/domínio Laravel sobre elas, seguindo o padrão `Legacy*Repository`, mais os campos de caixa no Usuário que ainda faltam.

## Critérios de aceite

- [ ] `caixaaberto` só é verdadeiro quando `dataaberturacaixa > datafechamentocaixa` e `dataaberturacaixa` é hoje; um caixa aberto em dia anterior e nunca fechado aparece como fechado.
- [ ] `AbrirCaixa` seta `dataaberturacaixa := hoje` e exige a autorização sensível de Gerente de Caixa evidenciada.
- [ ] O repositório de leitura de `autenticacoes` expõe os 14 tipos com o predicado padrão de não-cancelado.
- [ ] Leitura mínima de `cheques` e `recebimentos` funciona (sem CRUD), suficiente para os tipos `H` e `T`.
- [ ] Nenhuma rota de escrita é criada para os ~13 tipos de lançamento fora de escopo, nem para Eventos/Tipos de Recebimento.
- [ ] Nenhum valor monetário usa float/double em contrato público.

## Matriz mínima de testes

- `AbrirCaixa` num Usuário sem caixa aberto seta `dataaberturacaixa` para hoje e exige senha de Gerente de Caixa.
- `caixaaberto` retorna falso para um Usuário cuja `dataaberturacaixa` é de dias atrás e `datafechamentocaixa` é anterior a ela (caso que a regra do objeto Usuário Delphi trataria como aberto, mas a regra adotada trata como fechado).
- Leitura de `autenticacoes` por caixa/data/filial retorna os 14 tipos corretamente discriminados, excluindo lançamentos cancelados via o predicado auto-join.
- Leitura de `cheques` classifica corretamente à vista (`data >= vencto`) vs. a prazo (`data < vencto`) vs. sem cheque vinculado.
- Leitura de `recebimentos`/`tiposrecebimentos` classifica corretamente Cartão (`tiporecebimento in ('C','B')`) vs. Pix (`= 'P'`).
- Lookup de Eventos filtra corretamente por `tipomovimentacao`.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais desta fundação (núcleo de Caixa + ledger autenticacoes), não do Fechamento de Caixa (spec 02, que consome esta fundação);
- identifiquem os arquivos/repositórios Laravel atuais a estender, após inspecioná-los;
- detalhem o schema Laravel (migrations/models/repositórios) para os campos de caixa no Usuário e para a leitura de `autenticacoes`/`cheques`/`recebimentos`;
- incluam os critérios de aceite e a matriz de testes acima;
- declarem explicitamente que nenhuma tela de lançamento, nem o Fechamento de Caixa em si, nem ECF/impressora fiscal/TEF fazem parte desta entrega;
- não mandem investigar Delphi.

## Fora de escopo

- implementar durante `/speckit.specify`;
- qualquer tela/fluxo de lançamento que escreva `autenticacoes` (Frente de Caixa, Controle de Recebimentos, Estorno, Cheques/Recebimentos, Depósitos, Transferências, Duplicatas, Perdas, Devoluções, Renegociação de Carnês, Quitação Extra Caixa);
- a totalização, a aba Eventos, o PDF e a ação Fechar Caixa do Fechamento de Caixa — ver spec `02-speckit-prompt.md`;
- qualquer extensão ao Cadastro de Eventos ou ao Cadastro de Tipos de Recebimento;
- integração com impressora fiscal ECF, impressora matricial ou TEF;
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
