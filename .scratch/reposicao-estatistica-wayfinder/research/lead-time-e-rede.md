# Pesquisa: lead time e rede de abastecimento

Data da pesquisa: 2026-08-31

## Evidencia confirmada no sistema

- `pedidosfiliais` possui `data`, `hora`, `requisitante`, `requisitada`, `qtdepedida`, `qtderecebida`, `situacao`, `dadofiscal` e `lotetransferencia`. A data/hora representa a criacao da requisicao; `datahoraalteracaousuario` e generico e nao deve ser tratado automaticamente como aprovacao, separacao ou expedicao.
- `romaneios` possui o marco operacional `datahoratransito` e `usuariotransito`. O comando de liberacao grava esse instante; a retencao pode limpa-lo.
- O recebimento de uma nota de transferencia e registrado por `data_hora_recebimento` em `dadosfiscais`/`romaneiosnotas`, com assinatura e usuario quando aplicavel.
- O estoque por produto/filial ja expoe `emestoque`, `reservado`, `reservaprevia` e `transito`. O ECC tambem calcula capacidade comprometida de outras parcelas antes de realocar uma fonte.
- O fluxo atual usa `ReposicaoEccFonteContextoService` no calculo e na revalidacao; a confirmacao rele o saldo vivo e chama `somarWithinTransaction`. O fluxo de `pedidosfiliais` permanece a efetivacao.

## Lacunas confirmadas

- Nao foi localizado um timestamp historico universal e confiavel para aprovacao, separacao e expedicao da requisicao. `datahoraalteracaousuario` nao identifica a etapa.
- Nao foi localizado neste inventario um historico consolidado de lead time de fornecedor por produto/filial.
- Capacidade de envio nao aparece como capacidade estatica independente; a capacidade operacional observavel deve ser derivada de saldo disponivel menos reservas e compromissos vigentes.
- Distribuicoes reais, cobertura temporal e qualidade dos marcos ainda precisam ser medidas em uma base representativa antes de calibrar modelos.

## Modelo recomendado

Usar eventos canonicos quando existirem: `requisicao_criada` (`pedidosfiliais.data+hora`), `em_transito` (`romaneios.datahoratransito`), `recebido` (`data_hora_recebimento`) e, quando houver evidencia, `disponivel_no_estoque` pelo movimento/estoque da filial destino. Calcular separadamente:

- lead time total: criacao ate recebimento/disponibilidade;
- tempo em transito: `datahoratransito` ate recebimento;
- espera pre-transito: criacao ate saida;
- atraso: diferenca para o prazo/calendario configurado.

Usar instantes para duracao, com timezone da filial e conversao consistente; usar data local apenas para agregacao diaria. Reportar mediana, P80 e P95, quantidade de observacoes, taxa de marcos ausentes e casos censurados. Nao imputar silenciosamente eventos faltantes.

Excluir ou separar requisicoes canceladas, justificadas, reabertas ou com sequencia temporal invalida. Atrasos reais devem permanecer na distribuicao; falhas de dado devem ser classificadas separadamente.

## Politica de fontes

- Transferencia: fonte elegivel somente com estoque disponivel apos `reservado`, `reservaprevia` e compromissos de outras parcelas, respeitando concentradora, filial requisitante e as regras vigentes do ECC.
- `transito` e suprimento esperado, nao saldo imediatamente disponivel para nova alocacao; so pode reduzir a necessidade se a politica declarar o evento e seu prazo.
- Multiplas fontes devem ser parcelas independentes, ordenadas por elegibilidade, disponibilidade, prazo/confiabilidade e custo operacional quando esse dado existir. A revalidacao deve recalcular tudo e pode redistribuir o residual.
- Compra de fornecedor e transferencia sao canais distintos. O nucleo de demanda e compartilhado, mas lead time, fontes, restricoes e metricas sao separados. Compra cobre apenas o residual depois da transferencia.
- Sem historico confiavel de uma fonte, usar prazo configurado/manual ou fallback conservador e marcar baixa confianca; nao usar a media de outra fonte sem declarar a analogia.

## Decisao de implementacao futura

Primeira entrega: ler os marcos existentes e produzir lead times observados, qualidade e confianca, sem alterar o legado nem exigir timestamps retroativos. Uma evolucao posterior pode instrumentar eventos de aprovacao/separacao/expedicao para melhorar a distribuicao. O lead time alimenta a politica de estoque e a simulacao; nao escolhe sozinho a fonte nem bypassa revalidacao, concentracao, autorizacao ou `pedidosfiliais`.
