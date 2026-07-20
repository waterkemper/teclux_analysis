Type: task
Status: resolved
Blocked by: 01, 02

## Answer

### Decisão

Quando o parâmetro **Preços por Cargo** estiver ativo para a Filial selecionada, a aba Preços deve mostrar a grade por Cargo no lugar dos painéis convencionais, como no Delphi. Cada valor é calculado pelo motor legado `estoques_preco(produto, filial, markup)` a partir de `produtoscargos.markup`; não é uma coluna `produtoscargos.preco` nem o preço convencional do Produto.

### Filial e parâmetro

- A identidade do detalhe continua `produto + filial`; a Filial da URL é também a Filial de cálculo e de resolução do parâmetro.
- Não usar silenciosamente `filial_ativa_codigo`/`FilialBase` quando ela divergir da linha selecionada. Essa escolha evita apresentar preço calculado para outra Filial dentro da identidade atual.
- A adaptação deliberadamente traduz `FilialBase` do Delphi para a **Filial selecionada e autorizada** no Laravel. Se a tela futura quiser consultar a Filial base, ela deve selecionar essa Filial explicitamente ou expor um contexto de cálculo visível; nunca fallback oculto.
- Exigir linha `estoques(produto, filial)` porque a função de preço depende desse estoque. Filial não autorizada recebe 403; vínculo inexistente, 404 genérico.
- Resolver `precos_por_cargo` pelo manifesto central de parâmetros com a Filial selecionada. Não reler descrição literal do parâmetro em cada request.

### Modos e precedência visual

1. `precos_por_cargo = true`: modo primário `cargo`; renderizar grade Cargo/Descrição/Valor e não os painéis convencionais.
2. `precos_por_cargo = false`: modo primário `convencional`; renderizar preço normal e promoção/validade já resolvidos pelo motor compartilhado.
3. `preco_por_cliente = true`: é um modo adicional e independente, equivalente à aba separada Delphi; não substitui nem altera o cálculo por Cargo. Seu preenchimento está fora desta correção, salvo impedir que array vazio seja apresentado como implementação concluída.

O payload deve trazer um discriminador `modo: ''cargo'' | ''convencional''`, em vez de obrigar o React a inferir prioridade por dois booleanos. Os flags podem permanecer como metadata.

### Fonte e cálculo por Cargo

- Partir de `produtoscargos pc`, `JOIN cargos c ON c.codigo = pc.cargo` e validar `estoques e` na chave Produto+Filial.
- Filtros: `pc.produto = :produto`, `e.produto = :produto`, `e.filial = :filial`.
- Para cada vínculo, retornar `pc.cargo`, descrição canônica de `cargos`, `pc.markup` e `estoques_preco(:produto, :filial, pc.markup)`.
- Ordenação estável por descrição do Cargo e código, com regra de collation já usada no sistema. Não ordenar pelo valor calculado.
- Não usar subquery correlacionada para reler o mesmo markup já disponível no join.
- Não usar `Schema::hasTable` nem trocar erro estrutural por lista vazia.
- Reutilizar o repositório/cadastro `LegacyProdutosCargosRepository` como fonte semântica da relação, extraindo um reader próprio ou método de consulta; não duplicar regras de escrita.

### Arredondamento e promoção

- A função `estoques_preco` é a autoridade para custo-base, markup e arredondamento. Não reimplementar a fórmula em PHP/TypeScript e não aplicar segundo arredondamento de domínio.
- O JSON retorna `valor` e `markup` como números; a UI formata `valor` em BRL e `markup` em percentual com duas casas apenas se for exibido como informação auxiliar.
- O grid de paridade mostra **Cargo**, **Descrição Cargo**, **Valor**. Markup pode permanecer no payload para diagnóstico tipado, mas não precisa ser coluna visível porque o Delphi não o mostra nessa consulta.
- O modo Cargo não possui linha promocional, validade ou precedência de promoção no dataset Delphi. Não misturar `colunasprecos`/promoção convencional dentro do valor por Cargo. Promoção e validade aparecem somente no modo convencional.
- Valor real zero é `R$ 0,00`; resultado SQL nulo é `null`/`—` e não zero inventado.

### Payload

```text
produto: int
filial: int
modo: ''cargo'' | ''convencional''
precos_por_cargo: boolean
preco_por_cliente: boolean
convencionais: {
  preco_normal: number|null
  preco_promocional: number|null
  promocao_validade: string|null
}|null
cargos: Array<{
  cargo: int
  descricao: string
  markup: number|null
  valor: number|null
}>
```

- Em modo Cargo, `convencionais = null` e `cargos` contém a grade.
- Em modo convencional, `cargos = []` e `convencionais` contém os valores.
- Não executar ambos os cálculos caros para depois ocultar um deles.

### Capability e confidencialidade

- `can_visualizar_precos` deve proteger endpoint, aba e payload no servidor. Sem capability, responder 403 genérico e omitir a aba; não entregar valores para ocultá-los no React.
- A capability vale igualmente para preço convencional, promocional, Cargo e futuro preço por cliente.
- O endpoint permanece somente leitura; não expor ações do cadastro de `produtoscargos` na Consulta de Estoques.

### Layout, vazio e carregamento

- Grade responsiva com colunas Cargo, Descrição Cargo e Valor, chave estável pelo código do Cargo.
- Sem vínculos em `produtoscargos`: `cargos: []` e mensagem “Nenhum preço por cargo configurado para este produto.” Isso é vazio de negócio válido.
- Vínculo existente com valor nulo continua aparecendo com `—`, permitindo distinguir falha/ausência de base de preço de Cargo não configurado.
- Falha da função ou estrutura ausente é erro do detalhe, não estado vazio.
- Manter loading/error/ready, abort controller e descarte por identidade já existentes.

### Testes obrigatórios

1. Parâmetro false produz modo convencional; true produz Cargo e não calcula/renderiza convencional.
2. Parâmetro é resolvido pela Filial selecionada: duas filiais com configurações divergentes não se contaminam, mesmo com outra Filial ativa na sessão.
3. Filial não autorizada e Produto sem estoque são negados sem vazamento.
4. Dois Cargos com markups distintos provam chamada/equivalência de `estoques_preco` e ordenação descrição+código.
5. Garantir que `produtoscargos.preco` não seja fonte e que alteração de `markup` altera o valor calculado.
6. Valor zero versus nulo, markup zero/nulo conforme restrições reais e ausência de vínculos.
7. Capability: endpoint 403, aba omitida e nenhum preço no HTML/props sem permissão.
8. Promoção convencional válida/vencida somente no modo convencional; modo Cargo não herda promoção.
9. DTO e componente: discriminador de modo, colunas, BRL, chave Cargo e mensagens vazias.
10. Erro estrutural/função indisponível não retorna `cargos: []`.

### Classificação dos gaps atuais

- `cargos=[]` fixo e UI ignorando o parâmetro: funcionalidade ausente.
- Endpoint sem `can_visualizar_precos`: defeito de autorização.
- Parâmetro resolvido pela Filial ativa em vez da selecionada: defeito de contexto.
- Leitura de `pc.preco` observada em outra superfície não serve para esta aba; a regra é função+markup.
- Ausência de promoção no modo Cargo: paridade correta, não gap.
- Preço por Cliente vazio: lacuna distinta, não deve bloquear a entrega de Cargo nem ser fingida nesta correção.

## Question

Qual deve ser o contrato corrigido de Preços por Cargo dentro da aba Preços: fonte, colunas, prioridade entre modos convencional/Cargo/Cliente, promoção/validade, Filial, arredondamento, parâmetros, capabilities, layout e testes?
