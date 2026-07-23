# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para **submissão fiscal** do Contrato (`SubmeterDocumentoFiscal`) — Etapa 9 (Esforço fiscal posterior), segundo dos três specs dessa etapa, construído sobre a preparação/seleção fiscal (`19-speckit-prompt.md`), cuja fotografia imutável e alocações reservadas este comando transmite.

Este spec é **puramente de integração e estado durável** — não decide o que vai no documento (isso já foi resolvido na preparação), nem aplica os efeitos de autorização (isso é o spec 21). O trabalho aqui é: pegar uma preparação `preparada`, submetê-la a um emissor externo de forma idempotente, e manter um estado consultável (`submetida`, depois `autorizada`/`rejeitada` conforme o retorno) sem nunca formar uma transação distribuída entre o banco e o emissor.

Não implemente nesta etapa: seleção/planejamento (spec 19, já definido); aplicação de autorização — estoque, vínculos, `P/N`, outbox de efeitos (spec 21); qualquer cálculo tributário ou resolução de Natureza/CFOP (spec 19). Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo — trate-a como contrato de aceitação. Inspecione o checkout Laravel para confirmar a ausência de qualquer integração de emissão fiscal para Contrato; corrija hipóteses contrariadas por evidência concreta e cite arquivo/trecho. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

Inclua:

- o comando `SubmeterDocumentoFiscal`: recebe o identificador de uma preparação em estado `preparada`, valida que não expirou e que as alocações ainda estão reservadas, e transmite ao emissor **fora da transação curta** do banco;
- **estados duráveis mínimos**: `preparada`, `submetida`, `autorizada`, `rejeitada`, `cancelada` — cada transição de estado é persistida com timestamp, correlation id e retomada idempotente; nenhuma etapa herda estado por inferência;
- **chave idempotente** incluindo Contrato, revisão faturada, modalidade e comando — duas submissões com a mesma chave nunca produzem dois documentos nem duas transmissões реais; retry após falha de rede/timeout consulta o estado antes de reenviar;
- expiração de preparação não submetida dentro de um prazo: libera as alocações reservadas sem gerar movimento nem efeito, e explica o motivo ao usuário (não é falha silenciosa);
- separação explícita entre **falha de transmissão** (rede, timeout, indisponibilidade do emissor — retry permitido, preparação permanece válida) e **rejeição pelo emissor** (resposta negativa formal — preparação some do fluxo ativo, usuário decide corrigir e preparar de novo ou abandonar);
- o **contrato de status consultável**: o Cadastro/Consulta pode perguntar "o que aconteceu com esta submissão" a qualquer momento, sem depender de long-polling bloqueante nem de o usuário manter a tela aberta.

Não inclua: qualquer decisão sobre o conteúdo do documento (Natureza/CFOP/rateio — já vem pronto da preparação, spec 19); aplicação de efeitos pós-autorização — consumo de estoque, vínculos, projeção `P/N`, outbox (spec 21); implementação de um emissor/SEFAZ real específico — trate a integração externa como uma porta/interface a ser implementada por infraestrutura própria de cada ambiente, não construa o cliente HTTP/SOAP de um provedor específico nesta especificação.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM ou data modules Delphi.
- As evidências abaixo já foram extraídas no workspace de análise a partir de `dmcadastrocontratos.pas`.
- Use-as como requisitos legados de entrada, preservando classificações, sem exigir reconfirmação no código Delphi.
- Inspecione o checkout Laravel para confirmar a ausência de qualquer integração de emissão fiscal de Contrato e para localizar precedentes de integração externa idempotente já usados em outras fatias.

## Investigação Laravel obrigatória

- Confirme a ausência: busque por qualquer classe de submissão/emissão fiscal (`SubmeterDocumentoFiscal`, integração SEFAZ/NFe) para Contrato no checkout atual antes de prosseguir.
- `App\Application\Vendas\FreightQuote\FreightQuoteEngine`/`FreightQuoteApiClient` (spec 7) — precedente de integração HTTP externa com timeout/erro tratado e fotografia persistida antes/depois da chamada; reaproveite o mesmo padrão de isolamento de falha externa, não construa um cliente HTTP cru sem esse precedente.
- `MarketplaceOutboxService` (já citado na Fundação, spec 1) — precedente de outbox genérico (chave, merge, retry, lock) para efeitos duráveis fora da transação curta; a submissão fiscal deve seguir o mesmo padrão de desacoplamento entre commit local e efeito externo.
- `App\Application\Vendas\Contratos\Cadastro\Ports\ContratoFaturamentoFiscalGuardPort`/`DenyByDefaultContratoFaturamentoFiscalGuard` (spec 11) — mesmo padrão de porta/adapter para dependências externas ainda não implementadas; a integração real de submissão fiscal deve seguir a mesma disciplina de porta explícita, nunca uma chamada direta embutida no domínio.
- Envelope de auditoria/correlação da Fundação — reaproveite `correlation_id`/`causation_id` já definidos; a submissão apenas os propaga, não redefine o envelope.

## Evidência Delphi confirmada

### Estados duráveis, falhas e compensações

- `DECISÃO NOVA` — dividir o futuro fluxo em `PrepararSolicitacaoFiscal` (spec 19), `SubmeterDocumentoFiscal` (este spec) e `ConfirmarResultadoFiscal` (spec 21).
- `DECISÃO NOVA` — estados mínimos: `preparada`, `submetida`, `autorizada`, `rejeitada`, `cancelada`. Preparação expirada/rejeitada libera alocações sem movimento; autorização aplica efeitos uma vez; cancelamento cria compensações e recalcula cobertura (spec 21).
- `DECISÃO NOVA` — chave idempotente inclui Contrato, revisão faturada, modalidade e comando; locks incidem sobre restante, reserva, lote e série (herdados da preparação, spec 19). Duas preparações/submissões concorrentes não podem alocar/transmitir a mesma unidade.
- `CONFIRMADO` — o Laravel atual apenas projeta `F/P/N` e consulta documentos; não foi localizado planejador, transmissão ou confirmação fiscal de Contrato (`ContratoSituacaoDocumentalMapper.php` reconhece os estados; Consulta/Ficha leem `dadosfiscais`).
- `POSSÍVEL BUG LEGADO` — o fluxo Delphi mistura gravação, ECF, impressão, contabilidade e emissão numa rotina extensa, com variáveis defensivamente inicializadas (`dmcadastrocontratos.pas:2641-2656,7781-7851`); esses acoplamentos não são requisitos — a separação em três comandos deste mapa é deliberadamente o oposto dessa mistura.

### Atomicidade e integração externa

- `DECISÃO NOVA` — banco e SEFAZ não formam uma transação distribuída; a operação fiscal tem estados duráveis e retomada idempotente.
- `DECISÃO NOVA` — preparação persiste fotografia imutável, seleção/alocações, natureza/CFOP resolvidos e chave idempotente (spec 19); transmissão ocorre fora da transação curta; confirmação autorizada aplica situação, estoque e vínculos por comando idempotente/outbox (spec 21).
- `DECISÃO NOVA` — falhas de impressão, PDF ou comunicação posterior não desfazem documento autorizado; impressão é apresentação documental, não critério de sucesso fiscal.

## Estado Laravel confirmado

- Nenhuma integração de submissão/emissão fiscal existe para Contrato.
- Precedentes reais de integração externa idempotente com fotografia persistida e isolamento de falha já existem (frete, spec 7) e devem ser seguidos como padrão estrutural, não reinventados.
- O padrão de porta explícita para dependência externa ainda não implementada já existe (`ContratoFaturamentoFiscalGuardPort`) e deve ser replicado para a submissão fiscal.

## Decisões obrigatórias

1. Submissão só aceita preparação em estado `preparada`, não expirada, com alocações ainda reservadas; qualquer outro estado rejeita a submissão sem efeito.
2. Estados são sempre `preparada → submetida → (autorizada | rejeitada)`, mais `cancelada` como estado terminal alcançável a partir de `autorizada` (via spec 21); nenhuma transição é pulada ou inferida.
3. Chave idempotente (Contrato + revisão faturada + modalidade + comando) garante que retries não dupliquem transmissão nem produzam dois documentos; o comando sempre consulta o estado atual antes de reenviar.
4. Falha de transmissão (rede/timeout/indisponibilidade) é distinta de rejeição formal do emissor; a primeira permite retry mantendo a preparação válida, a segunda encerra o ciclo daquela preparação.
5. Preparação não submetida dentro do prazo expira automaticamente, libera as alocações sem gerar movimento, e comunica o motivo ao usuário — nunca falha silenciosa nem preparação órfã segurando saldo indefinidamente.
6. A submissão nunca decide conteúdo do documento (isso é herdado imutável da preparação) e nunca aplica efeito de autorização (isso é o spec 21) — sua única responsabilidade é transmitir e manter estado.
7. A integração com o emissor real é sempre através de uma porta/interface explícita, nunca uma chamada HTTP/SOAP embutida diretamente no domínio; implementações concretas por provedor ficam fora desta especificação.
8. Status é sempre consultável sob demanda pelo Contrato/preparação, sem exigir que o usuário mantenha uma conexão longa aberta.
9. Nenhuma chamada externa ocorre dentro de uma transação de banco curta; o commit local do estado `submetida` e a chamada ao emissor são desacoplados pelo mesmo padrão de outbox já usado em outras fatias.

## Contrato do comando `SubmeterDocumentoFiscal`

- Entrada: identificador da preparação (`preparada`), contexto do ator, idempotency key (herdada ou própria da submissão).
- Processo: validar estado `preparada` e não expiração → registrar transição para `submetida` na mesma transação curta do banco → agendar/despachar a transmissão ao emissor via outbox/porta externa, fora da transação → ao receber retorno (síncrono ou assíncrono), registrar `autorizada`/`rejeitada` com o resultado bruto do emissor.
- Saída: estado atual da submissão, identificador consultável, motivo quando rejeitada/falha.
- Falha de transmissão não corrompe o estado local; o comando é sempre retomável a partir do último estado durável persistido.

## Autorizações e parâmetros

- Reaproveite a matriz de autorizações já fixada na Fundação; capability própria (`fiscal.submit`, por exemplo) segue a mesma precedência.
- Nenhum parâmetro novo além dos já usados pela preparação (spec 19) é necessário nesta fatia, salvo configuração de endpoint/credencial do emissor, tratada como infraestrutura, não como parâmetro de domínio.

## Testes obrigatórios

1. Submissão só aceita preparação `preparada` não expirada; qualquer outro estado é rejeitado sem efeito.
2. Idempotência: retry com a mesma chave não duplica transmissão nem produz dois registros de submissão; consulta de estado precede reenvio.
3. Falha de transmissão (simulada) mantém a preparação válida e permite retry; rejeição formal (simulada) encerra o ciclo sem permitir retry silencioso.
4. Expiração: preparação não submetida a tempo libera alocações sem gerar movimento e comunica o motivo.
5. Nenhuma chamada externa ocorre dentro da transação curta de banco — teste de que o commit do estado `submetida` não depende da resposta do emissor.
6. Status é consultável a qualquer momento após a submissão, independentemente de reconexão do cliente.

Prefira Feature tests no comando real com um adapter/emissor fake determinístico para os cenários de falha/rejeição; reutilize o padrão de teste de integração externa já usado no spec de cotação de frete.

## Entregáveis

- Contrato do comando `SubmeterDocumentoFiscal` e da porta de integração com o emissor externo.
- Matriz de evidência Delphi × Laravel, deixando explícito que nenhuma integração de emissão fiscal existe hoje e quais precedentes estruturais (frete, outbox, guard port) são reaproveitados.
- Critérios de aceitação e testes.
- Riscos, dúvidas e bloqueios que exijam nova investigação Delphi ou definição de emissor concreto no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- seleção/planejamento fiscal (spec 19);
- aplicação de efeitos de autorização — estoque, vínculos, `P/N`, outbox de efeitos (spec 21);
- implementação de um cliente concreto de um emissor/SEFAZ específico;
- cálculo tributário ou resolução de Natureza/CFOP;
- alterar o schema Delphi além de migrations aditivas eventualmente exigidas.
```
