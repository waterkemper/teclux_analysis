# Definir o motor de Impostos — PIS/COFINS

Type: grilling
Status: resolved
Blocked by: 05

## Question

Dentro de `TdtmBasico.CalcularImpostos_` (`repositorio/dmbasico.pas:20573-26694`), documentar a lógica de PIS/COFINS: base de cálculo por produto (`PISCOFINSBaseCalculo`, `dmbasico.pas:21472-21504`) e por serviço (`PISCOFINSBaseCalculo_Servicos`, `:21467-21471`), e as flags de digitação manual (`ValorPISDigitado`/`ValorCOFINSDigitado`, `:22348-22362`). Cruzar com `ParSistema.RetirarPISCONFINSCalPreco` (já confirmado no ticket 02 — controla se PIS/COFINS entram na fórmula de preço de venda) e com os botões "Gerar Total PIS"/"Gerar Total COFINS" (`fmcadastroprodutospedidos_.pas:511-524`, ticket 01). Family relativamente menor que ICMS/ICMS-ST — avaliar se cabe resolver junto do ticket 15 (IPI) numa mesma sessão, dado que ambos são famílias mais simples.

## Answer

### Base de cálculo (CONFIRMADO, `PISCOFINSBaseCalculo`, `dmbasico.pas:21472-21501`)

```
base = quantidade × preço unitário − valordescontoitem − desconto + acréscimo + frete + seguro + valorIPI + despesasacessorias
```

Note que, diferente do ICMS/IPI, **o IPI entra somando na base do PIS/COFINS** (não há bypass condicional). Se a flag `ExcluirICMSdePISeCOFINS` estiver ativa, **subtrai** o `icmsvalor` da base (nunca deixa a base ficar negativa — trava em 0). Comentário legal no código (`:21496-21500`) cita `IN SRF nº 635/2006, art. 23º §4º` e `Solução de Consulta nº 84/2007` como fundamento de que **ICMS-ST não compõe a base de crédito de PIS/COFINS** — há inclusive uma tentativa anterior de somar `IcmsValorST` à base, comentada/removida, coerente com essa regra. `ExcluirICMSdePISeCOFINS` é uma **configuração por filial** (`FExcluirICMSdePISeCOFINS`, lida de `qryVerificarFilialBase`, `dmbasico.pas:2490`), não um Parâmetro do Sistema global — distinto do padrão `ParSistema.*` usado em quase tudo mais.

Existe uma base separada para serviços (`PISCOFINSBaseCalculo_Servicos` = `quantidade × valorservico`, `:21467-21470`) — **não aplicável a Cadastro de Pedidos** (sem itens de serviço, confirmado no ticket 07).

### Valor (CONFIRMADO, corpo principal, `dmbasico.pas:25120-25153` para PIS, `:25270-25291` para COFINS — não são helpers nomeados, o cálculo está inline no laço principal)

`pisvalor = pisbasecalculo × pisaliquota / 100` e `cofinsvalor = cofinsbasecalculo × cofinsaliquota / 100` (fórmulas idênticas, campos espelhados), cada uma **só executa se**: (1) `piscst`/`cofinscst` do item estiver num conjunto específico de códigos de situação tributária que exige cálculo normal (confirmados no código: '75', '98', '99', entre outros não totalmente listados aqui — os CST que representam alíquota zero/monofásico/substituição tributária tomam outros ramos não centrais a este ticket); (2) **não** é nota de importação (`HeImportacao` — comentário explícito no código: "não há cálculo para PIS na NF de importação", ou seja, importação usa outro tratamento fiscal, fora desta fórmula); (3) o valor não foi digitado manualmente (`not ValorPISDigitado`/`not ValorCOFINSDigitado`, `:22341-22362` — mesma flag "digitado" de todas as outras famílias).

### Cruzamento com `RetirarPISCONFINSCalPreco` (CONFIRMADO — já documentado nos tickets 02/06)

Esse parâmetro **não afeta o cálculo do imposto em si** (a fórmula acima roda sempre que o CST permitir) — ele controla só se PIS/COFINS entram na **fórmula de formação de preço de venda** (ticket 06/08), um uso downstream do valor já calculado aqui, não uma condição para calculá-lo.

### Botões "Gerar Total PIS"/"Gerar Total COFINS" (mesma DÚVIDA do ticket 15)

Não localizados nos arquivos-núcleo (são handlers de UI em `fmcadastroprodutospedidos_.pas`, fora do escopo lido). Mesma inferência do ticket 15: provavelmente reforçam o cálculo padrão base×alíquota→valor sobre um valor previamente digitado — confirmar na implementação.

### Decisão

Especificar PIS/COFINS como duas fórmulas espelhadas (mesma base, alíquotas e flags "digitado" próprias por imposto), com a base compartilhada somando sempre o IPI, subtraindo condicionalmente o ICMS via configuração **por filial** (não `ParSistema`), e desabilitadas inteiramente para notas de importação. Não calcular para itens de serviço (fora de escopo de Pedidos). Direção do botão "Gerar Total" fica como DÚVIDA, mesma ressalva do ticket 15.
