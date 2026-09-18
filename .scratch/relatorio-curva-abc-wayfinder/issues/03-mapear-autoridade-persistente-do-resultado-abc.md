# Mapear a autoridade persistente do Resultado da Curva ABC

Type: research
Status: resolved

## Comments

- Pesquisa concluida em `.scratch/relatorio-curva-abc-wayfinder/research/03-autoridade-persistente-resultado-abc.md`. O artefato registra as fontes primarias e as classificacoes CONFIRMADO, INFERENCIA/RISCO e LACUNA; o ticket permanece `Status: claimed` e nao foi fechado.

## Question

Qual é o contrato atual de `produtos.resultadocurvaabc`, `veiodatriggercaracteristicas`, triggers, funções PostgreSQL, migrations, usos no Laravel/Delphi e concorrência entre sistemas? Determinar se existe uma autoridade compartilhada para ler, limpar, gravar e auditar a classificação persistente, quais efeitos derivados são esperados e quais invariantes precisam ser protegidos para que a gravação Laravel seja atômica, autorizada, idempotente e compatível com o Delphi.
## Answer

Pesquisa consolidada em [03-autoridade-persistente-resultado-abc.md](../research/03-autoridade-persistente-resultado-abc.md). public.produtos.resultadocurvaabc e a autoridade persistente compartilhada e e lida por Consulta de Compras, Consulta de Transferencias, Consulta de Requisicoes e Manutencao de Precos. O Delphi e o unico escritor explicito encontrado; o Laravel atualmente so guarda resultados operacionais do job.

O campo e character(1) e os leitores esperam A, B, C ou nulo/vazio. Triggers legadas e novas auditorias observam a alteracao; veiodatriggercaracteristicas e sinal de controle da trigger e nao deve permanecer artificialmente true. Nao foi encontrado mecanismo de coordenacao Delphi/Laravel, lock, versionamento ou contrato de atomicidade. A futura gravacao precisa separar autorizacao de gerar, definir escopo global/escopado, proteger concorrencia e tratar modos agregados que podem nao retornar codigos de Produto.
