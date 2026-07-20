Type: task
Status: resolved
Blocked by: 01, 02

## Answer

### Decisão

A aba Financeiro permanece lazy, exclusivamente gerencial e vinculada a `produto + filial`. Ela deve reproduzir os blocos úteis do Delphi — Custos, Últimos lançamentos, Dados da última compra e Situação tributária — completando Fornecedor e os quatro códigos fiscais hoje ausentes. O contrato atual de mutação por Produto+Filial é mais seguro que o update legado e deve ser preservado.

### Escopo e confidencialidade

- Exigir `viewGerencial` no servidor antes de consultar qualquer campo; sem capability, 403 genérico e aba omitida no React.
- Exigir Filial autorizada e linha `estoques(produto, filial)` existente. Não substituir pela Filial ativa da sessão.
- Financeiro, custos, preços de compra, margem, fornecedor e tributação de entrada não podem aparecer no payload da aba Estoques ou em props públicas sem `viewGerencial`.
- Resposta repete `produto` e `filial`; o frontend valida a identidade ativa e mantém cancelamento/descarte de respostas obsoletas.

### Contrato do payload

DTO nominal, sem `Record<string, unknown>`:

```text
produto: int
filial: int
custo_medio: number
financeiro: number
aliquota_ipi: number|null
margem_final: number|null
data_ultima_compra: string|null
qtde_ultima_compra: number|null
valor_ultima_compra: number
preco_sem_icms: number|null
preco_com_icms: number|null
ultima_compra_com_icms: number
data_ultima_entrada: string|null
data_ultima_venda: string|null
ultima_nota: {
  codigo: int
  fornecedor_nome: string|null
  fornecedor_no_simples: boolean|null
  cst_empresa: string|null
  csosn_empresa: string|null
  cst_fornecedor: string|null
  csosn_fornecedor: string|null
}|null
situacao_tributaria_produto: {
  cst: string|null
  csosn: string|null
}|null
```

### Custos e fórmulas

- `financeiro`: `estoques.financeiro`, nulo tratado como `0.0`.
- `custo_medio`: `financeiro / (emestoque + reservado + reservaprevia + transito + demonstracao + conserto + danificada)`; denominador zero retorna `0.0`. Reutilizar o calculador canônico.
- `aliquota_ipi`: `estoques.aliquotaipi`; nulo permanece nulo. Apresentar como percentual, não moeda.
- `ultima_compra_com_icms`: se o CSOSN atual da característica do Produto for `101` ou `102`, `valorultimacompra + (precocomicms - precosemicms)`; nos demais casos, `valorultimacompra`. Nulos monetários usados na fórmula seguem a normalização legada para zero, mas os preços individuais continuam anuláveis no payload.
- `margem_final`: manter como extensão Laravel somente se calculada pelo motor de preço canônico: `((preco_efetivo_hoje - custo_medio) / preco_efetivo_hoje) * 100`; preço ausente/zero produz `null`. O Delphi possui o espaço visual, mas não vincula campo persistente; portanto, a margem não deve ser usada como critério de paridade fiscal.
- Arredondar apenas na apresentação. Não encadear cálculos sobre valores formatados.

### Últimos lançamentos e compra

- `data_ultima_compra`, `qtde_ultima_compra`, `data_ultima_entrada`, `data_ultima_venda`, `valor_ultima_compra`, `precosemicms` e `precocomicms` vêm da linha `estoques` da Filial selecionada.
- Datas nulas exibem `—`; quantidade nula é `—`, enquanto zero real usa a máscara de quantidade.
- Valores monetários usam BRL; `aliquota_ipi` e `margem_final` usam percentual.

### Fornecedor, nota e situação fiscal

- Resolver uma única “última nota de entrada de compra” para Produto **e Filial selecionada**, excluindo fornecedor do tipo `L`, usando os relacionamentos reais `produtosnotaspag -> notaspag -> fornecedores` e o predicado/função canônica que identifica nota fiscal de entrada de compra.
- Ordenar deterministicamente pela mesma identidade de recência do legado (maior código de nota, salvo se o repositório já tiver data+identidade canônica equivalente). Nunca usar `LIMIT 1` sem `ORDER BY`.
- Não copiar o vazamento legado que escolhe `max(notaspag.codigo)` globalmente por Produto sem Filial. Se o schema não permitir atribuir a nota à Filial com segurança, retornar `ultima_nota = null` e tornar a lacuna observável, em vez de buscar outra Filial.
- `fornecedor_nome` e `fornecedor_no_simples` vêm do fornecedor da nota selecionada.
- Para o item `produtosnotaspag` da nota+Produto: incidência/CST da empresa vira `cst_empresa`; `csosn` vira `csosn_empresa`; `cst_nf` vira `cst_fornecedor`; `csosn_nf` vira `csosn_fornecedor`.
- Situação tributária do Produto vem da característica atual: descrição/valor de `tributosicms` ligado à incidência como `cst`, e `caracteristicas.csosn` como `csosn`. Não fixar `simples=false` nem `cst=null`.
- O frontend mostra CST e CSOSN quando presentes, sem inferir o regime de uma Filial pelo simples fato de existir outra filial em determinado CRT. `fornecedor_no_simples` é informação da última nota, não regime da Filial consultada.
- Botão “NF/Detalhes” aparece somente quando `ultima_nota.codigo` existe e usa a rota canônica de histórico fiscal readonly com Nota+Produto; ausência da nota desabilita/omite a ação.

### Edição de última compra

- A capability específica `can_alterar_ultima_compra` é adicional a `viewGerencial`; ambas devem ser verificadas no servidor. Sem ela, dados são readonly e chamada direta recebe 403.
- Atualizar somente `estoques.valorultimacompra` na chave completa Produto+Filial. Jamais reproduzir `WHERE produto = :produto` do legado.
- Valor obrigatório, decimal finito e não negativo, dentro da precisão da coluna. Aceitar vírgula na borda de entrada, persistir número normalizado.
- Executar pelo serviço de mutação existente, com transação, auditoria antes/depois, usuário, Produto, Filial e `X-Request-Id`/idempotência já adotados pelo módulo.
- Após sucesso, devolver/recarregar snapshot Financeiro da mesma identidade. Recalcular `ultima_compra_com_icms` e margem; não alterar `precosemicms`, `precocomicms` ou dados da nota.
- Update afetando zero linhas é conflito/404 observável, não sucesso silencioso.

### Apresentação e vazio

- Blocos: **Custos**, **Dados da última compra**, **Últimos lançamentos**, **Situação tributária/Nota** e formulário de ajuste condicionado.
- `null` é `—`; zero monetário é `R$ 0,00`; false em “Fornecedor no Simples” é “Não”, null é `—`.
- Linha de estoque existente com todos os valores zerados é conteúdo válido. Não há estado vazio separado além de Produto+Filial inexistente (404).
- Falta legítima de nota/fornecedor/fiscal não invalida custos: bloco fiscal mostra `—` e ação de nota não aparece. Erro estrutural de tabela/coluna não deve virar campos vazios silenciosos.

### Testes obrigatórios

1. 403 e omissão da aba sem `viewGerencial`; payload Estoques não vaza campos gerenciais.
2. Produto+Filial com dados distintos em duas filiais, incluindo nota/fornecedor, provando isolamento.
3. Custo médio com todas as parcelas e denominador zero.
4. `ultima_compra_com_icms` para CSOSN 101, 102 e demais; nulos e diferença positiva/negativa.
5. IPI/margem como percentuais; margem nula sem preço/preço zero e promoção válida como preço efetivo.
6. Última nota determinística, exclusão de fornecedor `L`, fornecedor simples true/false e ausência de nota.
7. Mapeamento independente dos quatro códigos fiscais e situação tributária atual do Produto; CST e CSOSN nulos/parciais.
8. Navegação para histórico somente com Nota válida e identidade Nota+Produto correta.
9. Mutação: capability, validação, Produto+Filial, outra Filial intacta, auditoria/idempotência e snapshot recalculado.
10. Teste de componente para blocos/rótulos, `—` versus zero, formato monetário/percentual/data e ocultação do formulário.

### Classificação dos gaps atuais

- `simples=false` e `cst=null`: placeholders/defeitos.
- Fornecedor e quatro códigos da nota ausentes: paridade não implementada.
- Fórmula atual de custo e update por Produto+Filial: corretos, preservar.
- Fórmula atual de última compra com ICMS: parcialmente correta; depende de metadata fiscal completa e nulabilidade coerente.
- Margem final: extensão Laravel válida, não substitui nenhum campo fiscal Delphi.
- SQL legado de última nota global e update apenas por Produto: comportamentos inseguros deliberadamente não copiados.

## Question

Qual deve ser o contrato corrigido da aba Financeiro no Laravel, abrangendo custo médio, Financeiro, última compra/entrada/venda, ICMS/IPI, Fornecedor, CST/CSOSN, Simples, fórmulas, edição de última compra, Filial, confidencialidade gerencial e testes?
