Type: task
Status: resolved
Blocked by: 01, 02

## Answer

### Decisão

A aba mantém a rota lazy e identidade `produto + filial`. Preserva a divisão Delphi: **Preços** e **Quantidades** na aba; Localização, Sublocalização, Mínimo e Máximo permanecem no grid mestre/edição contextual. Financeiro e Custo médio pertencem à aba Financeiro e não devem vazar pelo endpoint não gerencial.

### Escopo

- Leitura e mutação: `estoques.produto = produto AND estoques.filial = filial`.
- Filial da URL autorizada e linha Produto+Filial obrigatória; 403 sem revelar existência e 404 genérico quando a relação não existe.
- Não substituir a Filial selecionada pela ativa da sessão para saldos, preço, localização ou limites.
- Resposta repete `produto` e `filial` para validação da identidade ativa.

### Quantidades e fórmulas

Nulos quantitativos viram `0.0`.

| Campo | Origem/fórmula |
|---|---|
| `em_estoque` | `emestoque` |
| `reservado` | `reservado` |
| `reserva_previa` | `reservaprevia` |
| `demonstracao` | `demonstracao` |
| `conserto` | `conserto` |
| `em_transito` | `transito` |
| `danificada` | `danificada` |
| `futuro` | `futuro`; fora dos totais |
| `estoque_fisico` | `estoquefisico`; persistido, não recalculado |
| `estoque_venda` | `emestoque + reservado + reservaprevia` |
| `estoque_total` | `estoque_venda + transito + demonstracao + conserto + danificada` |
| `pedidos` | pendente do Produto na Filial selecionada |

As fórmulas atuais de estoque venda/total já coincidem com o SQL Delphi. `custo_medio = financeiro / estoque_total`; denominador zero produz `0.0`. O backend calcula; o frontend somente formata.

### Resumo Pedidos

- Deve ser **pendente da Filial selecionada**, equivalente a `quantidadefilial`, não soma global por Produto nem quantidade bruta.
- Reutiliza a futura regra canônica da aba Pedidos. Consolidação `totalfiliais` permanece dependente da decisão de Pedidos; o padrão seguro é filial e nunca consolidar silenciosamente.
- Se suportado depois, informar modo `filial`/`consolidado` e consolidar somente filiais autorizadas.

### Preços

- Normal/promocional vêm do motor compartilhado usando Produto, Característica, código da tabela, Filial selecionada e colunas normal/promocional da Filial. `produtos.preco` é código, não valor.
- Promoção inexistente/vencida: valor promocional `null`. Acrescentar `preco_normal_alteracao`, `preco_descricao` e `promocao_validade`, visíveis no Delphi.
- Painel e dados reais exigem `can_visualizar_precos` no servidor e React. Preferir omitir o bloco sem permissão; não apenas ocultar UI.
- Ausência legítima é `null`/`—`; valor real zero é `R$ 0,00`.

### Localização e limites

- Localizações vazias viram `null`; mínimo/máximo são anuláveis e `null` difere de zero.
- Manter edição atômica dos quatro campos, auditada e restrita a Produto+Filial, com reload após sucesso.
- Mutação exige `can_alterar_minmax_localizacao`; sem ela os dados operacionais continuam visíveis, controles não aparecem e chamada direta é negada.
- Validar tamanho, números finitos e `minimo <= maximo` quando ambos existirem; update não converte ausente em zero.

### Segurança, formato e vazio

- Remover Financeiro/Custo do DTO público Estoques; seu único dono é a aba Financeiro protegida por `viewGerencial`.
- Quantidades, pedidos e limites usam máscara configurada; preços usam BRL; números permanecem numéricos no JSON.
- Linha existente com zeros é conteúdo válido. Linha ausente gera 404. Falta de preço não invalida a aba; erro estrutural não vira vazio silencioso.
- Manter DTO TypeScript nominal, `Panel`, `Field`, formatadores, motor de preços, formulário auditado e hook lazy existentes.

### Testes obrigatórios

1. Calculador: cada parcela, reserva prévia, exclusão de futuro/físico e denominador zero.
2. Feature Produto+Filial com saldos/fórmulas/tipos e duas filiais distintas.
3. Pedidos: saldo pendente e filtro Filial, não bruto/global.
4. Preços: colunas por Filial, válida/vencida, descrição, alteração, validade e ausência.
5. Capabilities: preço não sai sem permissão; financeiro/custo não vazam sem gerencial.
6. Localização/limites: nulo versus zero, validação, autorização, chave Produto+Filial e auditoria.
7. Componente: rótulos, máscara, `—`, zero, ocultação de preços e ausência de financeiros.
8. Preservar teste de resposta atrasada entre identidades.

### Classificação dos gaps

- Fórmulas atuais: corretas.
- Pedidos global/bruto: defeito de regra/escopo.
- Descrição/alteração/validade de preços: paridade ausente.
- Preço sem capability: defeito de autorização.
- Financeiro/Custo no payload público: risco de exposição.
- Localização/limites fora do painel: não é gap; o grid mestre é o dono visual.

## Question

Confrontando os dois inventários, qual deve ser o contrato corrigido da aba Estoques no Laravel, campo a campo, incluindo fórmulas de saldos e custo, preços, localização, mínimo/máximo, Filial, alterações permitidas, formatação, vazio, capabilities e testes de regressão?
