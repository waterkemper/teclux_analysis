# Curva ABC - pacote para /speckit.specify

Este pacote transforma o mapa Wayfinder da Curva ABC em cinco entradas sequenciais para o SpecKit. Ele especifica; nao implementa.

## Ordem

1. [01-speckit-prompt-geracao-curva-abc.md](01-speckit-prompt-geracao-curva-abc.md) - ajustar a geracao F6, a grade e o fluxo efemero sobre o pipeline heavy-reports existente.
2. [03-speckit-prompt-hardening-pos-prompt-01.md](03-speckit-prompt-hardening-pos-prompt-01.md) - revisar a implementacao do prompt 01, fechar o contrato Top N e aprovar o gate PostgreSQL/UI.
3. [02-speckit-prompt-gravacao-classificacao-abc.md](02-speckit-prompt-gravacao-classificacao-abc.md) - criar a Gravacao da Classificacao ABC como comando separado, global, autorizado e transacional.
4. [04-speckit-prompt-aceite-pos-prompts-03-02.md](04-speckit-prompt-aceite-pos-prompts-03-02.md) - revisar o hardening e a gravacao implementados, fechar concorrencia/idempotencia e executar o aceite PostgreSQL final.
5. [05-speckit-prompt-correcao-concorrencia-evidencia.md](05-speckit-prompt-correcao-concorrencia-evidencia.md) - corrigir corridas PostgreSQL que abortam transacoes, fechar auditoria pos-commit e produzir evidencia E1 reproducivel.

A saida da primeira especificacao deve ser implementada e revisada pelo prompt 03; depois o prompt 02 implementa a gravacao. O prompt 04 revisa o fechamento e o prompt 05 resolve os bloqueios residuais antes do aceite. Execute cada arquivo como uma entrada independente de /speckit.specify no checkout Laravel alvo.

## Evidencias

- [Dossie](dossie.md)
- [Semantica Delphi](../../../.scratch/relatorio-curva-abc-wayfinder/research/01-semantica-delphi-e-gravacao.md)
- [Heavy-reports Laravel](../../../.scratch/relatorio-curva-abc-wayfinder/research/02-curva-abc-heavy-reports.md)
- [Autoridade persistente](../../../.scratch/relatorio-curva-abc-wayfinder/research/03-autoridade-persistente-resultado-abc.md)
- [Diagnóstico Top N com universo grande](../../../.scratch/relatorio-curva-abc-wayfinder/research/04-diagnostico-top-n-zerado.md)

- [Revisao da implementacao pos-prompt 01](../../../.scratch/relatorio-curva-abc-wayfinder/research/05-revisao-implementacao-pos-prompt-01.md)
- [Revisao das implementacoes dos prompts 03 e 02](../../../.scratch/relatorio-curva-abc-wayfinder/research/06-revisao-implementacoes-prompts-03-02.md)
- [Revisao da implementacao do prompt 04](../../../.scratch/relatorio-curva-abc-wayfinder/research/07-revisao-implementacao-prompt-04.md)

## Decisoes autoritativas

- F6 gera e mostra o resultado corrente; nao grava automaticamente.
- Gravar e comando separado, autorizado e auditado.
- A classificacao persistente global so pode ser gravada nos modos por Produto 0, 1 e 2.
- Fornecedor, Grupo/Classe/Marca e Marca sao somente consulta/exportacao futura; nao gravam Produtos.
- O resultado de geracao e efemero: sem historico de negocio, Fotografia persistente, tabela propria de geracoes, retencao de resultado, PDF, impressao ou Excel nesta frente.
- Reutilizar o pipeline heavy-reports existente; nao criar uma arquitetura paralela.
- Se o resultado corrente nao estiver disponivel, o operador deve gerar novamente.

## Gate novo antes da implementacao

- A geracao so pode ser considerada pronta depois de reproduzir em PostgreSQL o caso de regressao: universo de aproximadamente 4500 produtos, periodo de 1o de marco a 1o de setembro e Top N 100.
- O aceite deve diferenciar universo (`raw_row_count`) de resultado limitado (`row_count`) e provar que as metricas positivas da fixture nao chegam zeradas a tela.
- O teste deve verificar a funcao `teclux_abc_prod` implantada, a migration que a reaplica e o SQL efetivo/argumentos recebidos; mocks isolados nao encerram o diagnostico.

## Regras comuns dos prompts

- Gerar a especificacao, nao implementar durante /speckit.specify.
- Revalidar o checkout Laravel vigente antes de escolher classes, rotas, tabelas ou seams.
- Usar as pesquisas deste pacote como contrato Delphi consolidado; nao pedir nova leitura direta dos fontes Delphi.
- Classificar evidencias como CONFIRMADO, INFERIDO, DUVIDA, NAO LOCALIZADO, DIVERGENTE, POSSIVEL BUG LEGADO ou DECISAO NOVA.
- Nao copiar SQL concatenado, o parentesis excedente do filtro somente Inativo, a opcao Delphi Compras sem implementacao ou efeitos de modos agregados como se fossem classificacoes por Produto.
- Nao criar tabela de historico, Fotografia persistente, PDF, impressao, Excel ou infraestrutura generica fora da Curva ABC.
