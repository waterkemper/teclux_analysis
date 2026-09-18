# Prompt para `/speckit.specify` — Reposição ECC: cálculo, elegibilidade e alocação

```text
/speckit.specify

Crie uma especificação funcional e técnica para o motor de cálculo da **Reposição ECC**, consumindo a fundação/orquestração do prompt `12-speckit-prompt-reposicao-ecc-fundacao-orquestracao.md`. Não implemente código. Inspecione o checkout Laravel, cite arquivos concretos e use `.scratch/consulta-compras-automacao-wayfinder/map.md` como contrato das decisões já fechadas.

## Entrada do cálculo

O motor deve reutilizar a sugestão, filtros, vendas, cobertura, mínimo, máximo, pedidos concorrentes e tabela redutora existentes na Consulta de Compras sempre que os contratos atuais forem compatíveis. A rotina congela os filtros e fatos usados no snapshot. Nenhuma base recebe filtro, filial, Depósito, cobertura, mínimo ou máximo padrão por conveniência.

Os valores `maximo = 0` e `maximo = 9999` significam que a Filial não deve receber nova solicitação automática daquele Produto. Não remover, transferir ou zerar automaticamente o estoque que ela já possui.

## Elegibilidade por prefixo literal

M/D/U/F/O/C são prefixos literais no início da descrição do Produto, por exemplo `(C)CONDICIONADOR ...`; não são códigos de um campo estruturado.

- `(M)` e `(D)`: excluir da solicitação automática;
- `(U)` e `(C)`: manter no Depósito, sem reposição automática das lojas;
- `(F)` e `(O)`: atender usando estoque de lojas, não estoque do Depósito.

Documente normalização, comparação e comportamento quando a descrição não possuir prefixo. Não converter essa regra em classificação inventada.

## Grupos e gerente

O grupo de Produtos terá `somente_gerentes_solicitacao_ecc`. Esse campo define uma exigência de conclusão, não de cálculo ou visibilidade. Produtos restritos continuam aparecendo para qualquer usuário com acesso à Reposição ECC. A autenticação contextual do gerente será especificada no prompt 14; este motor deve apenas marcar o fato de que o item pertence a grupo restrito.

O usuário autorizador será validado por `usuarios.gerentevendas`; a senha nunca deve entrar no snapshot nem em qualquer persistência.

## Concentração por produto e filial

Modele a política na granularidade Produto × Filial, aproveitando a chave existente de `estoques`. A primeira versão deve prever `estoques.concentrado_reposicao_ecc` nullable:

- `true`: a Filial é concentradora e deve manter o Produto;
- `false`: a Filial foi explicitamente marcada como não concentradora;
- `null`: configuração ainda não definida.

Podem existir várias Filiais concentradoras para o mesmo Produto. Alterar a marca não movimenta saldo.

Uma Filial não marcada não deve gerar solicitação automática para receber Produto que possui Filial concentradora configurada. Uma fonte concentradora só pode enviar transferência automática para outra Filial concentradora. Uma fonte não concentradora pode abastecer uma Filial concentradora quando possuir excedente elegível; nunca comprometer a própria necessidade para isso.

## Quantidade e fontes

A quantidade final começa na sugestão da rotina e é distribuída sem ultrapassar o excedente transferível de cada fonte. Para cada fonte, reserve sua própria necessidade calculada com os mesmos filtros da rotina, vendas, cobertura, mínimo/máximo, tabela redutora e pedidos concorrentes. Estoque atual menos mínimo, isoladamente, não é disponibilidade suficiente.

Defina prioridade explícita para Depósito e Filiais não concentradoras elegíveis. Uma fonte concentradora fica por último e somente envia para destino concentrador; se a retirada puder zerar ou comprometer saldo protegido, mínimo ou sugestão da fonte, a linha vira exceção para revisão humana. Quando `estoques.minimo` for zero ou não configurado, uma fonte concentradora não deve terminar com saldo zero automaticamente.

A busca de fontes é dinâmica: não existe lista fixa de filiais fornecedoras. Exclua a Filial Requisitante e registre, por item, todas as fontes consideradas, rejeitadas e escolhidas, com seus fatos e justificativas.

## Urgência e itens adiados

Só preencher urgência automaticamente quando houver evidência determinística. `ZERADO` pode derivar de saldo zero. `CONTRATO`, `ACL` e `CVV` permanecem ajustáveis/manuais quando não houver cadastro ou dado objetivo que prove a classificação. Embalagem fechada e múltiplos de unidade ficam fora desta especificação e devem ser registrados como fora de escopo, sem invenção de arredondamento.

## Aceite mínimo

- [ ] Prefixos M/D/U/F/O/C são aplicados literalmente e testados.
- [ ] Grupos restritos são calculados e visíveis, sem autorização embutida no motor.
- [ ] Máximo 0/9999 impede nova solicitação automática sem remover estoque existente.
- [ ] Concentração é Produto × Filial, admite várias concentradoras e não movimenta saldo ao alterar marca.
- [ ] A fonte reserva sua própria necessidade antes de transferir excedente.
- [ ] A direção das transferências respeita as regras de concentração.
- [ ] Fonte concentradora nunca é zerada automaticamente por uma proposta.
- [ ] Cada quantidade possui fatos, fontes tentadas e justificativa auditável.
- [ ] Embalagem/múltiplos não são implementados por inferência.
```

### Fontes obrigatórias

- `.scratch/consulta-compras-automacao-wayfinder/issues/04-definir-politicas-de-elegibilidade-e-dados.md`;
- `.scratch/consulta-compras-automacao-wayfinder/issues/05-definir-alocacao-quantidade-e-urgencia.md`;
- `.scratch/consulta-compras-wayfinder/docs/procedimentos.pdf`;
- `laravel/backend/app/Services/Estoque/ConsultaComprasSugestaoService.php`;
- `laravel/backend/app/Domain/Estoque/ConsultaCompras/RequisicaoCandidataOrdenacao.php`;
- `laravel/backend/app/Domain/Estoque/ConsultaCompras/RequisicaoAlocacaoFilial.php`;
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Estoque/LegacyConsultaComprasSugestaoRepository.php`;
- `laravel/backend/database/migrations/2026_04_13_000001_estoques_legacy_shape_sqlite.php`.
