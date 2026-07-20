# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional completa e implementável para o **Resolvedor de Preço Corrente** — o motor oficial e a matriz de casos dourados de cálculo da futura **Manutenção de Preços interna** (Estoque), no ERP tecLUX Laravel. Este é o primeiro de quatro specs incrementais; ele bloqueia os três seguintes (consulta F6/grids, operações locais/F8, commit atômico) e não constrói tela nenhuma.

## Regra fundamental sobre as fontes

Você não possui acesso ao código Delphi nem ao PostgreSQL legado investigados e **não deve procurar, solicitar, citar ou depender deles**. Não inclua tarefas de "analisar o legado", "validar no Delphi" ou "comparar com o Delphi/PostgreSQL". O levantamento já foi concluído e o contrato abaixo é a fonte autoritativa e autocontida.

Investigue somente o Laravel atual para localizar nomes e contratos concretos de repositories, serviços, adapters e testes que serão aprofundados/reutilizados — em especial o motor de preço já existente para Consulta de Estoques e a resolução de preço já usada em Orçamentos. Essa inspeção serve para integração, não para redescobrir requisitos. Se o Laravel divergir do contrato abaixo, registre a divergência e proponha a adaptação; não busque confirmação em outro repositório.

Não faça nova entrevista. Não implemente a tela de manutenção, operações em lote ou persistência de alterações. Gere requisitos numerados, cenários, contratos e critérios mensuráveis.

## Objetivo e natureza

O Laravel precisa calcular exatamente o mesmo preço comercial válido que o PostgreSQL/Delphi produzem hoje, para toda a precedência entre Produto, Característica de Produto, Faixa de Preço, Coluna de Preço, Filial, data, Cliente e Cargo. Uma divergência de R$ 0,01 pode alterar totais, descontos, autorizações e decisões comerciais — não existe tolerância percentual.

Construa um único módulo profundo, o **Resolvedor de Preço Corrente**, com uma interface principal em lote: recebe uma lista de contextos comerciais normalizados (Produto, Filial, data de referência e, quando aplicável, Cliente, Cargo ou percentual comercial explícito, como campos distintos, nunca sobrepostos) e devolve, por contexto, o Preço Efetivo na Filial antes/depois do ajuste comercial, valores normal e promocional configurados, validade e situação da Promoção, origem do resultado, percentual aplicado, informação de múltiplo/arredondamento e explicação suficiente para diagnóstico funcional.

## Autoridade de cálculo

PostgreSQL continua autoridade de produção. As funções `estoques_preco`, `estoques_produtoempromocao` e, quando necessário, `formacaoprecovenda` são oráculos: preserve suas fórmulas, precedências, múltiplos e arredondamentos comprovados. Aprofunde a implementação existente de resolução de preços atrás da nova interface — não crie um módulo pass-through por cima dela.

## Precedência e regras de domínio

- Produto escolhe uma Faixa de Preço dentro de sua Característica de Produto; o Valor de Preço monetário é compartilhado por Característica + Faixa + Coluna.
- Filial configura os papéis normal/promocional de Colunas de Preço já existentes; não possui Valores próprios.
- Resolva um Valor promocional elegível antes do normal. Promoção vencida não apaga nem oculta o Valor promocional armazenado; só impede seu uso como preço efetivo. Preserve a regra comprovada para Valor promocional sem validade — não invente uma regra de promoção perpétua se o oráculo não a aplica.
- Ausência de Valor elegível retorna **preço não configurado** explicitamente. Nunca converta ausência, falha de consulta ou contexto inválido em zero monetário.
- Resolva Cliente e Desconto por Cargo pela precedência comprovada (Cliente → Cargo → normal/promocional); o percentual persistido de Produto + Cargo é insumo de cálculo, não um preço armazenado independente. Cargo padrão só se aplica via Parâmetro do Sistema quando não há Cliente.
- Data de referência do servidor é autoritativa para validade. Preserve ordenação, precisão numérica, múltiplos e arredondamento oficiais; a saída monetária deve bater com o oráculo no centavo, com precisão intermediária suficiente para não haver arredondamento antecipado.

## Contrato de erros e resultados

Distinga explicitamente: falha de validação (contexto inválido) é erro de validação; ausência de configuração é um resultado de sucesso "não configurado"; falha de banco/oráculo é erro operacional. Nenhuma dessas três deve ser disfarçada de outra.

## Desempenho e lote

A interface em lote deve evitar uma consulta por Produto. Preserve correlação determinística de resultado por contexto solicitado, inclusive quando o mesmo Produto aparece com Filiais, datas, Clientes ou Cargos diferentes no mesmo lote — não funda contextos distintos.

## Adapters e testes dourados

Forneça um adapter PostgreSQL de produção e um adapter local para testes estruturais; o adapter local nunca é evidência de paridade. Construa uma matriz de casos dourados versionada, com dados controlados e resultados capturados dos oráculos, exigindo igualdade no centavo, mesma escolha normal/promocional, mesma validade, mesmo resultado por Cliente/Cargo e mesmo arredondamento — path e valor, não só o valor.

## Reuso obrigatório no Laravel

Investigue e aprofunde o motor de preço de produto já existente (usado hoje por Consulta de Estoques) como adapter principal deste módulo. Não duplique a resolução de preço por Cargo já usada em Orçamentos; ambas devem convergir para este único Resolvedor. Não importe nada do contexto Marketplace (margem, frete, comissão, arredondamento ou publicação são regras exclusivas de Marketplace e não entram aqui).

## Consumidores futuros

O Resolvedor deve ser consumível por Orçamentos, futuro Contrato e futura frente de caixa sem que esses consumidores conheçam `colunasprecos`, `precos`, `produtoscargos` ou a precedência interna. Nenhum item de Orçamento ou Contrato já gravado é reprecificado por este módulo — ele só resolve o preço corrente do catálogo, sob demanda.

## Fora do escopo

Construir os filtros F6, a consulta integral, os três grids sincronizados, fotos ou exportação. Construir seleção local, edição, cópia, ajuste percentual, limpeza, recálculo, histórico/desfazer ou o modal F8 de revisão. Persistir Valores de Preço, vínculos de Promoção ou Desconto por Cargo. Implementar o commit atômico F8, autorização sensível, concorrência otimista, idempotência ou cabeçalho de auditoria. Repreçar Orçamentos, Contratos, Vendas ou parcelas já existentes. Reproduzir cálculo, arredondamento ou publicação de Marketplace. Tratar a aproximação do adapter local/SQLite como regra de produção. Alterar Delphi ou executar migrations/builds/testes fora do necessário para este spec.

## Testes e aceite mínimo

Cubra Unit e integração PostgreSQL pela interface pública em lote do Resolvedor, não por métodos privados de repository:

1. preço normal válido, promoção vigente, promoção vencida, promoção sem validade, coluna promocional sem valor, coluna inexistente, valor zero, Faixa alternativa, mapeamentos de coluna por Filial diferentes, Produto sem preço calculável;
2. markup específico do Cliente, Desconto por Cargo, Cliente com Cargo mas Produto sem registro em produtoscargos, Cargo padrão sem Cliente, precedência Cliente → Cargo → normal/promocional;
3. múltiplo exato, arredondamento para cima/baixo e bordas monetárias, inclusive próximas de meio centavo;
4. combinações entre promoção, Cliente/Cargo e arredondamento — não bastam casos isolados;
5. mesmo Produto em Filiais, datas, Clientes e Cargos diferentes no mesmo lote, com correlação determinística;
6. contextos duplicados e inválidos tratados distintamente de ausência de configuração e de falha de banco;
7. contagem de consultas comprovando ausência de N+1 em lote;
8. testes de integração dourados contra PostgreSQL real com as funções oficiais; testes locais/SQLite verificam só forma de interface e normalização pura, nunca rotulados como paridade;
9. contratos de consumo para Orçamentos (busca/inclusão/validação usando o resolvedor sem alterar linhas já persistidas) e fixtures reservadas para Contrato/frente de caixa futuros;
10. nenhuma escrita, job ou chamada a Marketplace ao resolver preço corrente.

## Saída esperada

Gere uma spec completa, verificável e pronta para planejamento/implementação. Numere requisitos funcionais e não funcionais, contratos de entrada/saída, entidades, casos dourados e critérios de aceite mensuráveis. Identifique o adapter Laravel existente a aprofundar após inspecioná-lo. Não crie pendências de investigação no Delphi ou PostgreSQL: tudo que precisa ser preservado está neste briefing. Aprove este spec antes de qualquer spec de tela, persistência ou commit começar.
```
