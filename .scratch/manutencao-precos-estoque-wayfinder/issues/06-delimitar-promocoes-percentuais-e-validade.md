Type: task
Status: resolved
Blocked by: 01, 02, 03, 05

## Question

Como a Manutenção de Preços seleciona, cria, altera, limpa e aplica Promoções, percentuais e datas de validade; quais tabelas, colunas, filtros, validações e consumidores são afetados; e qual deve ser a fronteira entre manutenção do preço e cadastro da Promoção no Laravel?

## Answer

### Três conceitos distintos

**CONFIRMADO** — a tela legada aproxima visualmente três operações diferentes, que precisam permanecer separadas no domínio:

1. **Vínculo da Faixa com Promoção**: `precos.promocao` referencia `promocoes.codigo` para a identidade `Característica + Faixa`.
2. **Valor Promocional**: `colunasprecos.valor` na Coluna Promocional resolvida pela Filial, identificado por `Característica + Faixa + Coluna`.
3. **Ajuste percentual/validade**: operação genérica em lote sobre qualquer Coluna de Preço escolhida, não apenas a promocional.

Evidências: projeção `pr.promocao`/`pro.descricao` em `dmmanutencaopreco.pas:949-981`; rastreamento do vínculo em `:1536-1568`; Valores/Validades em `:1395-1444`; controles genéricos em `fmmanutencaopreco.dfm:2301-2459`.

**DECISÃO NOVA** — o Laravel deve nomear e apresentar esses conceitos separadamente. “Promoção” não será usada como sinônimo de preço promocional nem do comando de aplicar percentual.

### Cadastro e vínculo da Promoção

**CONFIRMADO** — a Manutenção de Preços apenas pesquisa e vincula uma Promoção existente. Ela não cria, edita nem exclui registros de `promocoes`. O frame usa operação de atribuição e pesquisa (`fmmanutencaopreco.pas:651-671,1751-1758`).

**CONFIRMADO** — ao selecionar uma Promoção, o Delphi propaga código e descrição para todas as linhas com a mesma `Característica + Faixa`, marca-as como alteradas e registra um único vínculo compartilhado (`dmmanutencaopreco.pas:2665-2699`). No F5, atualiza `precos.promocao` (`:1766-1786`).

**CONFIRMADO** — `promocoes` contém pelo menos `codigo`, `descricao`, `validade`, `observacoesvenda` e `deny_discount`. O Laravel já possui cadastro, policy, controller, service e repositório próprios para essa entidade (`PromocaoProdutoService.php`; `LegacyPromocaoProdutoRepository.php`).

**DECISÃO NOVA** — a fronteira será:

- Manutenção de Preços: lookup, exibição, vínculo e desvínculo da Promoção na Faixa;
- Cadastro de Promoções: criação, descrição, validade cadastral, observações de venda e `deny_discount`;
- Cadastro de Filiais: definição da Coluna Promocional da Filial;
- Manutenção de Preços: alteração do Valor/Validade daquela coluna, sem mudar `filiais.precopromocao`.

**CONFIRMADO** — a consulta visual de Promoções no Delphi lista apenas cadastros sem validade ou com `validade >= current_date` (`frconsulta.dfm:11718-11738`). A busca direta por código não contém a mesma condição (`:11680-11700`).

**POSSÍVEL BUG LEGADO** — digitar diretamente um código pode aceitar uma Promoção vencida que não aparece na lista. Não transformar essa assimetria em requisito.

**DECISÃO NOVA** — o lookup de novo vínculo apresenta somente Promoções vigentes ou sem validade. Um vínculo histórico vencido continua visível e pode ser removido, mas não pode ser novamente selecionado. A validação é repetida na prévia e no F5.

### Desvínculo e limpeza

**CONFIRMADO** — Delete sobre as colunas de Promoção chama `limparPromocoes`, limpando código e descrição no dataset (`fmmanutencaopreco.pas:866-873,1601-1622`; `dmmanutencaopreco.pas:2701-2706`).

**POSSÍVEL BUG LEGADO** — a seleção usa `Atribuirdados` para propagar a toda `Característica + Faixa`, mas a limpeza atua inicialmente apenas na linha corrente. O rastreamento/persistência posterior também depende de localizar a linha pelo novo valor de Promoção, o que é frágil quando ele fica nulo (`dmmanutencaopreco.pas:1536-1568,1766-1789`).

**DECISÃO NOVA** — “Remover vínculo da Promoção” é uma intenção explícita sobre `Característica + Faixa`, propaga a todas as linhas afetadas na prévia e grava `precos.promocao = null`. Não apaga o cadastro de Promoção, o Valor Promocional nem sua Validade.

### Valor e Validade da Coluna

**CONFIRMADO** — cada Coluna projetada possui o trio Valor, Margem derivada e Validade. Somente Valor e Validade são editáveis/persistidos em `colunasprecos`; Margem é calculada (`dmmanutencaopreco.pas:1067-1088,2223-2267,2786-2801`).

**CONFIRMADO** — a Coluna Promocional padrão vem de `filiais.precopromocao`. Quando `PRECOS POR CARGO` está ativo, o legado permite escolher temporariamente outra coluna no combo “Coluna de Promoção” para recalcular preços de Cargo; isso altera `PPromocao` em memória, não o cadastro da Filial (`fmmanutencaopreco.pas:627`; `dmmanutencaopreco.pas:2158-2201`).

**DECISÃO NOVA** — no módulo interno, “Coluna Promocional da Filial” é exibida como contexto read-only. Uma coluna alternativa para simulação de Cargo, se mantida, deve ser chamada explicitamente de “Coluna promocional para prévia” e nunca persistir o mapeamento da Filial.

**CONFIRMADO** — gravar Valor zero remove fisicamente a linha existente de `colunasprecos`; Valor não zero insere ou atualiza Valor/Validade (`dmmanutencaopreco.pas:1623-1634,1681-1698`). A operação “Excluir coluna” prepara Valor zero, limpa Validade e Margem nas linhas marcadas (`:834-866`).

**DECISÃO NOVA** — a prévia deve distinguir `atualizar`, `criar` e `remover` Valor de Preço. Remover o Valor Promocional não remove `precos.promocao`; se isso deixar um vínculo sem preço efetivo, a interface apresenta alerta, não corrige silenciosamente.

### Duas validades e promoção efetiva

**CONFIRMADO** — existem duas datas independentes:

- `promocoes.validade`: validade do cadastro/vínculo promocional;
- `colunasprecos.validade`: validade do Valor naquela Coluna, inclusive a promocional.

O Delphi não copia automaticamente uma para a outra ao vincular Promoção (`dmmanutencaopreco.pas:2665-2699`).

**CONFIRMADO** — o ERP usa transversalmente `estoques_produtoempromocao(produto, filial)` para decidir se o Produto está em promoção: Manutenção de Preços (`dmmanutencaopreco.pas:1186-1189`), Estoque, Orçamentos, Contratos, Frente de Caixa e etiquetas possuem chamadas comprovadas. `promocoes.deny_discount` também é consumido por Orçamentos/Contratos para restringir descontos.

**DECISÃO NOVA** — o estado **Promoção efetiva na Filial** será resolvido pela função oficial `estoques_produtoempromocao`, não por uma regra PHP deduzida. O grid mostra separadamente vínculo, validade do cadastro, Valor/Validade da Coluna Promocional e resultado efetivo para a Filial/data de referência.

**DIVERGENTE** — `LegacyProductPriceEngineRepository` hoje escolhe a coluna promocional apenas pela existência do valor e por `colunasprecos.validade`; ele não evidencia no mesmo cálculo o vínculo `precos.promocao` nem `promocoes.validade`. Para a Manutenção interna, seu resultado deve ser conciliado com `estoques_produtoempromocao` antes de ser considerado preço efetivo oficial.

### Aplicar percentual e validade

**CONFIRMADO** — “Aplicar” atua somente nas linhas marcadas (`alterar = true`) e sobre a Coluna Origem selecionada. Pelo menos percentual ou validade deve estar preenchido; a data passa pela validação do componente antes da confirmação (`fmmanutencaopreco.pas:366-369,1326-1338`; `dmmanutencaopreco.pas:601-652`).

**CONFIRMADO** — percentual é variação sobre o valor atual:

`novo = arredondar_por_multiplo(valor_atual + RoundTo(valor_atual × percentual / 100, 2))`

Percentual positivo aumenta; negativo reduz; zero ou vazio preserva o Valor. O campo Delphi aceita negativo e duas casas (`fmmanutencaopreco.dfm:2396-2410`).

**CONFIRMADO** — Validade preenchida substitui a data; vazia preserva a existente. Portanto, o comando Aplicar não oferece uma intenção inequívoca de limpar somente a Validade (`dmmanutencaopreco.pas:633-635`). A limpeza é possível por edição direta ou exclusão do Valor.

**DECISÃO NOVA** — a ação em lote terá intenções explícitas:

- ajuste percentual opcional;
- Validade: `manter`, `definir(data)` ou `limpar`;
- escopo: linhas marcadas, com contagem de linhas visuais e de identidades únicas `Característica + Faixa + Coluna`;
- prévia do antes/depois e dos arredondamentos antes do F5.

**DECISÃO NOVA** — validar percentual decimal finito e impedir resultado negativo. Resultado zero significa intenção de remover o Valor e deve aparecer como tal na prévia; não será transformado silenciosamente em preço zero persistido.

### Copiar coluna com percentual/validade

**CONFIRMADO** — Copiar usa Coluna Origem e Destino, somente linhas marcadas e somente quando o Valor Origem é maior que zero. Percentual vazio/zero copia o Valor; percentual não zero aplica a mesma fórmula e múltiplo. Validade informada sobrescreve; vazia copia a Validade da origem (`dmmanutencaopreco.pas:654-705`).

**CONFIRMADO** — origem ou destino podem ser a Coluna Promocional; a tela apenas usa cores/estado para identificá-la (`fmmanutencaopreco.pas:404-575`). A cópia não cria nem altera um cadastro de Promoção.

**DECISÃO NOVA** — copiar para a mesma coluna é inválido. Valor Origem nulo/zero gera item “ignorado” na prévia, não erro global. Destino existente é substituído apenas após confirmação do lote.

### Casos de aceitação

| Caso | Resultado esperado |
|---|---|
| Vincular Promoção `7` em uma linha da Característica `10`, Faixa `2` | Todas as linhas `10 + 2` mostram vínculo `7`; F5 atualiza uma identidade `precos(10,2)`. |
| Remover vínculo | `precos.promocao` fica nulo; cadastro `promocoes(7)` e `colunasprecos` permanecem. |
| Cadastro Promoção vencido | Vínculo histórico aparece, mas Promoção não aparece como nova opção nem é considerada efetiva pela função oficial. |
| Aplicar `-10%` a `100,00`, sem múltiplo | `90,00`; Validade permanece. |
| Aplicar apenas Validade `2026-12-31` | Valor permanece; Validade passa a `2026-12-31`. |
| Aplicar intenção `limpar validade` | Valor permanece; Validade fica nula. |
| Aplicar `-100%` | Prévia classifica remoção do Valor; F5 remove a identidade de `colunasprecos`. |
| Copiar origem `100,00`, validade `2026-08-31`, destino vazio, sem override | Destino `100,00` e validade `2026-08-31`. |
| Copiar mesma origem com override `2026-12-31` | Destino `100,00` e validade `2026-12-31`. |
| Duas linhas visuais da mesma Característica/Faixa | Prévia mostra duas linhas afetadas, mas uma única mutação compartilhada por Coluna. |

### Comparação e reutilização Laravel

**CONFIRMADO** — reutilizar o cadastro e lookup de Promoções, `LegacyPromocaoProdutoRepository`, policy existente, resolução de colunas da Filial, `ProdutoPrecosWriteService` e conciliação de `colunasprecos`.

**CONFIRMADO** — `ProdutoPrecosWriteService::encerrarPromocaoModoSimples` já limpa Valor e Validade da Coluna Promocional com controle de concorrência, mas atua numa única Característica/Faixa. O novo lote deve reutilizar a semântica/repositório dentro de uma transação agregada, não chamar endpoints unitários em laço.

**DIVERGENTE** — o cadastro Laravel de Promoções aceita `validade` como string de até dez caracteres. Para vínculo e efetividade, o novo fluxo exige data normalizada e validação real; essa melhoria deve ser aplicada na fronteira do módulo sem reformular silenciosamente todo o cadastro já migrado.

**CONFIRMADO** — percentuais de desconto, devolução e ICMS encontrados na aba Marketplace são exclusivos daquele contexto e ficam fora desta decisão.

### Lacunas encaminhadas

- **DÚVIDA** — corpo de `estoques_produtoempromocao` não está versionado; criar casos dourados no PostgreSQL com combinações das duas validades, vínculo nulo, Valor zero e Filial sem Coluna Promocional.
- **DÚVIDA** — tratamento de Promoção vinculada cujo cadastro foi excluído; a prévia deve ao menos identificar referência órfã antes do commit.
- **DÚVIDA** — conflitos e deduplicação quando operações manuais, Aplicar, Copiar e Excluir atingem a mesma identidade serão resolvidos em **Definir operações em lote e semântica de colunas**.

Esta fatia está pronta para compor um `$to-spec` de **Promoções e operações de Valor/Validade**, junto de **Definir operações em lote e semântica de colunas**. Não recomenda um spec separado para o cadastro de Promoções, pois ele já está implementado no Laravel.
