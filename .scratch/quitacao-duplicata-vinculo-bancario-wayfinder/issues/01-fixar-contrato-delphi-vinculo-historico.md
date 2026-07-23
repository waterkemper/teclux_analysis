# Fixar o contrato Delphi de vínculo e histórico bancário

Type: task
Status: resolved
Blocked by:

## Question

Qual é o contrato exato e alcançável do Delphi para gravar `movtosbancos.documento`, `movtosbancos.observacoes`, `movtosbancoseventos.observacoes`, `duplicatas.sequencia` e `duplicatas.sequenciaevento` em pagamento novo, agregado, cancelamento e refazer, incluindo cheque vazio, nota/complemento, lote e retorno?

## Answer

### Fontes e alcance

Contrato rastreado em `dmcontaspagar.pas/.dfm`, seguindo os consumidores alcançáveis em `fmcontaspagar.pas`, `fmcadastroduplicatascontaspagar.pas`, `dmquitacaoduplicatas.pas` e `dmLerRetornoPagFor.pas`. A persistência bancária acontece em `GravarContasPagar(topPAGAMENTO/topCANCELAR)` e é condicionada pelo início da integração bancária. O Delphi usa datasets com cached updates e os inclui na mesma perpetração dos dados de Contas a Pagar.

### Quando existe movimento bancário

- `CONFIRMADO`: pagamento gera `movtosbancos` e `movtosbancoseventos` somente quando `tipopagamento <> 3` (não é Adiantamento), `datapagto >= InicioIntegracaoBancos`, o parâmetro é posterior a `01/01/1980` e o pagamento tem valor diferente de zero ou representa desconto integral (`valorpagto=0` e `valorvencto=valordesconto`).
- `CONFIRMADO`: Adiantamento não gera novo movimento porque seu movimento já foi produzido ao conceder o adiantamento.
- `CONFIRMADO`: integração inativa não aloca `sequencia`/`sequenciaevento` em `QuitarDuplicatas`; as consultas auxiliares são fechadas.
- `POSSÍVEL BUG LEGADO`: desconto integral satisfaz a condição de geração mesmo com valor bancário zero. A futura decisão Laravel deve avaliar a intenção de negócio em vez de copiar automaticamente esse comportamento.

### Identidade e vínculo da Duplicata

- `CONFIRMADO`: `duplicatas.sequencia` é a `movtosbancos.sequencia` do cabeçalho identificado por `(contapagto, datapagto, sequencia)`.
- `CONFIRMADO`: `duplicatas.evento` recebe `documentospag.evento` e, com `duplicatas.sequenciaevento`, identifica exatamente o evento por `(contapagto, datapagto, sequencia, evento, sequenciaevento)`.
- `CONFIRMADO`: para cabeçalho novo, o Delphi calcula `MAX(movtosbancos.sequencia)+1`; para cada evento calcula `MAX(movtosbancoseventos.sequenciaevento)+1` dentro de conta, data, sequência e evento. Os números são gravados primeiro na Duplicata e usados nas inserções.
- `CONFIRMADO`: em pagamento agrupado, `QuitarDuplicatas` pode receber uma `sequencia` já existente e a guarda na Duplicata, mas sempre aloca uma nova `sequenciaevento` para o evento individual. Assim, Duplicatas podem compartilhar o cabeçalho e continuam vinculadas ao próprio evento.
- `POSSÍVEL BUG LEGADO`: a alocação via `MAX+1` não apresenta proteção concorrente explícita e não deve ser reproduzida no Laravel.

### Documento bancário

- `CONFIRMADO`: ao inserir cabeçalho novo, se `duplicatas.chequepagto` não estiver vazio, `movtosbancos.documento` recebe `FormatFloat('000,000', chequepagto)`. Portanto, a origem semântica é o cheque, não `documentopag`; a representação literal legado inclui a máscara numérica, por exemplo um valor de seis algarismos é formatado com separador conforme o ambiente Delphi.
- `CONFIRMADO`: com `chequepagto` vazio, o Delphi não atribui `movtosbancos.documento`; em um registro novo ele permanece vazio/nulo conforme o default do dataset/banco. O retorno PagFor chama `QuitarDuplicatas` com cheque vazio e, portanto, segue essa regra.
- `CONFIRMADO`: ao agregar em cabeçalho existente, o Delphi não altera `documento`; permanece o documento do cabeçalho originalmente criado.
- `DIVERGENTE`: não existe suporte no legado analisado para gravar `documentopag` nesse campo. O `documentopag` pertence à descrição e à chave da Duplicata, não ao documento bancário.

### Histórico canônico individual

- `CONFIRMADO`: `getdescricaohistoricopagamento` começa com `NF` quando existe linha em `notaspag` para o Documento; caso contrário começa com `DOC`.
- `CONFIRMADO`: se `documentospag.complemento` não estiver vazio, acrescenta espaço e o complemento normalizado, removendo espaços antes de `/`.
- `CONFIRMADO`: completa com ` DUP {duplicatas.documentopag}/{duplicatas.numero} - {nome do fornecedor sem espaços externos}`.
- Formato resultante: `[NF|DOC][ complemento] DUP {documentopag}/{numero} - {fornecedor}`. Exemplo sem nota e complemento: `DOC DUP 209120/1 - ANDRA UNIFORMES`.
- `CONFIRMADO`: em cabeçalho novo, a mesma descrição individual é gravada em `movtosbancos.observacoes` e `movtosbancoseventos.observacoes`.
- `CONFIRMADO`: cada novo evento de um cabeçalho agregado mantém sua própria descrição individual canônica.
- `CONFIRMADO`: os campos Delphi de observação dos dois datasets têm tamanho 512. O campo auxiliar usado para restaurar cabeçalho no cancelamento foi declarado com tamanho 50, criando risco de truncamento nesse caminho legado.

### Agregação

- `CONFIRMADO`: a associação a outros pagamentos considera mesmo lote contábil, mesma `(conta, data, sequencia)` ou mesmo `(conta, chequepagto)`, sempre excluindo a Duplicata corrente.
- `CONFIRMADO`: ao agregar, o valor absoluto do novo pagamento é somado ao débito do cabeçalho. Se o Delphi reconhece pagamento múltiplo, o cabeçalho passa a `PAGTO DIVERSAS DUPLICATAS` e seu `evento` é limpo; os eventos continuam com evento, sequência de evento, valor e observação individuais.
- `CONFIRMADO`: se o cabeçalho já existe mas não é reconhecido como múltiplo, sua observação permanece/volta para a descrição individual da Duplicata corrente.

### Cancelamento parcial e total

- `CONFIRMADO`: o cancelamento localiza o cabeçalho pela chave guardada na Duplicata e o evento pela chave completa, incluindo `sequenciaevento`. Isso confirma que esse campo não é apenas informativo: ele é necessário para desfazer o evento certo.
- `CONFIRMADO`: no cancelamento individual de um agregado, subtrai o valor da Duplicata do cabeçalho e elimina o evento exato. Se restar uma única Duplicata vinculada, tenta restaurar no cabeçalho a observação de um evento remanescente e o evento do Documento.
- `CONFIRMADO`: quando o valor zera, quando não há pagamento múltiplo equivalente ou quando o usuário escolhe cancelar todos, o cabeçalho é eliminado; os eventos alcançados são eliminados e as Duplicatas envolvidas têm `evento`, `sequencia` e `sequenciaevento` limpos.
- `POSSÍVEL BUG LEGADO`: a observação usada para restaurar o cabeçalho vem de `limit 1` em `movtosbancoseventos` sem filtro por `evento/sequenciaevento` e sem ordenação. Além de poder truncar em 50 caracteres, não há garantia formal de que seja o evento correto. O Laravel deve recompor deterministicamente a partir do único evento/Duplicata remanescente.
- `CONFIRMADO`: cancelar via Adiantamento não toca em movimentos bancários. Se a integração não satisfaz a condição, o ramo que limpa as chaves bancárias não é executado, outro comportamento que deve ser reavaliado na especificação segura.

### Refazer pagamento

- `CONFIRMADO`: Refazer não possui um writer alternativo. Ele guarda data, valor, filial, tipo, conta e cheque; executa `CancelarQuitacao`; restaura os campos; e chama novamente o fluxo normal `topPAGAMENTO`.
- `CONFIRMADO`: por isso, o movimento/evento anterior é removido ou reduzido, as chaves antigas são limpas e o novo pagamento recebe as chaves realmente alocadas pelo fluxo normal. Documento e observações seguem as mesmas regras: cheque formatado e descrição canônica individual/agregada.

### Lote e retorno

- `CONFIRMADO`: `dmquitacaoduplicatas` chama o mesmo `QuitarDuplicatas`. Quando há cheque, pode agrupar pagamentos e reutilizar a `sequencia` encontrada por conta/cheque; cada Duplicata recebe nova `sequenciaevento`. Logo o lote não é um contrato bancário separado.
- `CONFIRMADO`: `dmLerRetornoPagFor` também chama o mesmo `QuitarDuplicatas`, mas passa cheque vazio, `AgruparPagamentosnoLote=false` e sequências vazias. Em conciliação, se já havia pagamento, primeiro chama `DesQuitarDuplicatas` e depois quita novamente. Assim, retorno também converge no mesmo motor, com documento bancário vazio e histórico canônico baseado no Documento/Duplicata/fornecedor.

### Contrato legado a levar para a próxima decisão

O contrato funcional comprovado é: o cabeçalho representa um débito bancário possivelmente agregado; cada Duplicata guarda a chave do cabeçalho e a chave do seu evento individual; `documento` representa o cheque quando houver, nunca o Documento a Pagar; o evento sempre carrega o histórico individual canônico; e o cabeçalho usa esse histórico quando individual ou `PAGTO DIVERSAS DUPLICATAS` quando agregado. Cancelar e refazer dependem das chaves persistidas na Duplicata. Máscara regional do cheque, `MAX+1`, restauração não determinística, truncamento auxiliar e movimento de valor zero são detalhes frágeis do legado, não requisitos a copiar sem decisão explícita.
