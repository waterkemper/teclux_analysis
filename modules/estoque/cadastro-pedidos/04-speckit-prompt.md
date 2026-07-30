# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para construir, no Laravel, as famílias **IPI** e **PIS/COFINS** do Motor de Impostos, construídas sobre o núcleo de orquestração e ICMS já especificados (`modules/estoque/cadastro-pedidos/02-speckit-prompt.md`, `03-speckit-prompt.md`). Esta é a quarta de 8 fatias do Cadastro de Pedidos de Compra.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere as seções `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo. Inspecione somente o checkout Laravel, incluindo o que as specs 02-03 já devem ter entregado. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando existirem:

- **IPI**: base de cálculo, valor, exclusão opcional do frete, permissão de edição condicionada a transferência entre filiais/documento eletrônico vinculado;
- **PIS/COFINS**: base de cálculo compartilhada (soma o IPI, subtrai condicionalmente o ICMS por configuração de filial), valor por CST, gating por importação.

A classificação fiscal efetiva (`crt`, CSOSN/CST `_nf`) já foi especificada na spec 02 — reaproveitar, não reespecificar.

Não inclua nesta entrega: ICMS/ICMS-ST (specs 02-03, consumidos aqui como entrada quando necessário — ex.: PIS/COFINS pode subtrair o valor de ICMS já calculado); rateio de frete/desconto/despesas acessórias e produtos compostos (spec 05); nenhuma tela do Cadastro de Pedidos (specs 06-08); itens de serviço (PIS/COFINS tem uma base separada para serviços no motor compartilhado, não aplicável — Cadastro de Pedidos só lida com produtos).

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir de `repositorio/dmbasico.pas` (`TdtmBasico.CalcularImpostos_`).
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, incluindo o que as specs 02-03 já devem ter entregado.
- Se uma decisão depender de informação Delphi ausente (incluindo a direção exata dos botões "Gerar Total IPI"/"Gerar Total PIS"/"Gerar Total COFINS", não localizada na investigação Delphi), registre a pergunta exata para o workspace de análise — não infira o comportamento da UI Delphi.

## Investigação Laravel obrigatória

- os artefatos entregues pelas specs 02-03: orquestração, classificação fiscal efetiva, cálculo de ICMS (consumido pela base de PIS/COFINS);
- configuração de filial (não `ParSistema`) para a flag `ExcluirICMSdePISeCOFINS` — confirmar como preferências por filial já são modeladas no checkout Laravel (reaproveitar o padrão existente, se houver, em vez de introduzir um novo mecanismo de configuração).

## Evidência Delphi confirmada

### IPI — base e valor (CONFIRMADO, `dmbasico.pas:21385-21464`)

```
IPIBaseCalculo = quantidade × preço unitário − desconto do item − desconto
                + (frete, se não NaoCalcularIPISobreFrete)
                + seguro

ValorIPI = IPIBaseCalculo × aliquotaipi / 100
```

Estrutura quase idêntica à base do ICMS normal, com duas diferenças: o frete só entra se a flag `NaoCalcularIPISobreFrete` estiver desligada; e não tem o termo de "ICMS sobre IPI" (essa incidência é do ICMS sobre o IPI, não o inverso — já coberta na spec 02). Mesmos bypasses de importação/`produtototal` já vistos no ICMS.

### IPI — permissão de edição (CONFIRMADO, `dmbasico.pas:20804-20833`)

Para entrada (sempre o caso de Pedidos): editável **exceto** se a origem for transferência entre filiais, ou se o item já referencia um documento eletrônico vinculado (NF-e/CT-e/NFC-e), ou há condição de cancelamento de dado fiscal referenciado. **Em Cadastro de Pedidos, IPI é editável por padrão** — nenhuma dessas travas se aplica a um pedido novo.

### PIS/COFINS — base de cálculo (CONFIRMADO, `dmbasico.pas:21472-21501`)

```
base = quantidade × preço unitário − valordescontoitem − desconto + acréscimo
     + frete + seguro + valorIPI + despesasacessorias
```

Diferente do ICMS/IPI: **o IPI entra somando na base do PIS/COFINS sempre**, sem bypass condicional. Se a configuração **por filial** `ExcluirICMSdePISeCOFINS` estiver ativa, **subtrai** o valor de ICMS da base (nunca deixa a base negativa — trava em 0). Fundamento legal citado no código-fonte (IN SRF nº 635/2006, art. 23º §4º; Solução de Consulta nº 84/2007): ICMS-ST não compõe a base de crédito de PIS/COFINS.

### PIS/COFINS — valor e condições (CONFIRMADO)

```
pisvalor = pisbasecalculo × pisaliquota / 100
cofinsvalor = cofinsbasecalculo × cofinsaliquota / 100
```

Cada um só executa se: (1) o CST do item estiver num conjunto que exige cálculo normal (códigos de alíquota zero/monofásico/substituição tomam outros ramos, não centrais a este cálculo); (2) **não** é nota de importação (PIS/COFINS não é calculado por esta fórmula em notas de importação); (3) o valor não foi digitado manualmente (flag "digitado", mesma mecânica de ICMS/ICMS-ST/IPI).

### Cruzamento com `ParSistema.RetirarPISCONFINSCalPreco` (CONFIRMADO — já especificado na spec 01, Motor de Custo)

Este parâmetro **não afeta o cálculo do PIS/COFINS em si** — a fórmula acima roda sempre que o CST permitir. Ele controla só se PIS/COFINS entram na fórmula de formação de **preço de venda** (spec 01), um uso downstream do valor já calculado aqui.

### Achados a não replicar / dúvidas a confirmar

- Direção exata dos botões "Gerar Total IPI"/"Gerar Total PIS"/"Gerar Total COFINS" — handlers de UI Delphi não localizados na investigação; a inferência mais provável (não confirmada) é reforçar o cálculo padrão base×alíquota→valor sobre um valor previamente digitado. **DÚVIDA a confirmar na implementação** — não afirmar categoricamente.

## Decisões obrigatórias

1. Base de IPI exclui o frete apenas se a flag correspondente estiver ativa; mesmos bypasses de importação do ICMS.
2. IPI editável por padrão em Cadastro de Pedidos (nenhuma trava de transferência/documento eletrônico se aplica a pedido novo).
3. Base de PIS/COFINS sempre soma o IPI; subtrai o ICMS só se a configuração **por filial** (não `ParSistema`) permitir.
4. PIS/COFINS nunca calculado em notas de importação, nem para itens de serviço.
5. Direção dos botões "Gerar Total X" registrada como dúvida a confirmar durante a implementação, não afirmada.

## Critérios de aceite

- [ ] Base de IPI bate com a fórmula, incluindo a exclusão opcional do frete.
- [ ] IPI é editável por padrão em Cadastro de Pedidos.
- [ ] Base de PIS/COFINS soma sempre o IPI e subtrai o ICMS só quando a configuração por filial permitir.
- [ ] PIS/COFINS não é calculado em notas de importação nem para itens de serviço.
- [ ] Campos com flag "digitado" (IPI, PIS, COFINS) suprimem o recálculo automático sobre valores editados manualmente.

## Matriz mínima de testes

- **IPI — com e sem exclusão de frete**: mesmo item, com `NaoCalcularIPISobreFrete` ligado e desligado → base difere exatamente pelo valor do frete.
- **PIS/COFINS — com e sem exclusão de ICMS por filial**: mesma filial com a configuração ligada e desligada → base difere exatamente pelo valor do ICMS (nunca fica negativa).
- **PIS/COFINS — nota de importação**: item em nota de importação → PIS/COFINS não calculado por esta fórmula.
- **Edição manual com flag "digitado"**: usuário edita manualmente o valor de IPI de um item → recálculo subsequente (troca de quantidade) preserva o valor digitado.

## Saída esperada do SpecKit

Produza uma especificação executável e um plano que:

- listem os requisitos funcionais das famílias IPI e PIS/COFINS;
- identifiquem os repositórios/serviços Laravel atuais a estender, após inspecioná-los (incluindo o que as specs 02-03 entregaram);
- detalhem as fórmulas de base/valor e as condições de gating acima;
- incluam os critérios de aceite e a matriz de testes acima;
- registrem a direção dos botões "Gerar Total X" como pergunta explícita a confirmar durante a implementação;
- não mandem investigar Delphi, nem inventem lógica de rateio/produtos compostos ou de telas do Cadastro de Pedidos.

## Fora de escopo

- implementar durante `/speckit.specify`;
- ICMS/ICMS-ST (specs 02-03);
- rateio de frete/desconto/despesas acessórias e produtos compostos (spec 05);
- itens de serviço (base de PIS/COFINS para serviços, não aplicável a Pedidos);
- qualquer tela do Cadastro de Pedidos de Compra (specs 06-08);
- alterar o schema Delphi ou desativar qualquer tela Delphi.
```
