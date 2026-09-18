# Prompt para /speckit.specify - Gravacao da Classificacao ABC

/speckit.specify

Crie uma especificacao implementavel para adicionar a Gravacao da Classificacao ABC ao resultado corrente da Curva ABC. Gere somente a especificacao; nao implemente codigo nesta etapa.

## Pre-requisitos e leituras

Leia primeiro:

- modules/estoque/relatorio-curva-abc/README.md
- modules/estoque/relatorio-curva-abc/dossie.md
- a especificacao produzida pelo prompt 01-speckit-prompt-geracao-curva-abc.md
- a especificacao e a implementacao do prompt 03-speckit-prompt-hardening-pos-prompt-01.md
- a evidencia de que o gate PostgreSQL Top N/universo, o contrato de Top N, a proveniencia numerica e os cenarios de perda tecnica/UI do prompt 03 foram executados e aprovados
- o checkout Laravel vigente, incluindo Policy, acesso modular, Controller, Request, JobStore/blob, modelos/repositorios legados, migrations PostgreSQL, triggers/auditoria de Produtos e todos os leitores de resultadocurvaabc

Use a pesquisa Delphi consolidada como contrato funcional. Nao peça nova inspeção direta dos fontes Delphi e nao invente formula de abc_prod.

## Missao

Especificar o comando separado Gravar, equivalente ao efeito de AtualizarResultadoCurvaABC, mas com contrato Laravel seguro: autorizado, auditado, atomico, concorrente e sem copiar SQL concatenado ou uma transacao legada nao comprovada.

## Contrato de negocio

1. Gravar so e possivel depois de uma geracao corrente em estado ready.
2. O resultado deve pertencer ao usuario/ambiente autorizado e manter o payload compativel com o resultado exibido.
3. Resultado vazio, cancelado, failed, expired, perdido ou de outro usuario/ambiente deve ser recusado com mensagem para gerar novamente.
4. Somente modos por Produto 0, 1 e 2 podem gravar. Fornecedor, Grupo/Classe/Marca e Marca sao somente consulta/exportacao futura.
5. A operacao substitui globalmente a classificacao persistida: limpar os Produtos atualmente classificados e aplicar A/B/C aos Produtos do resultado, em uma unica transacao PostgreSQL. Nao limitar a limpeza por Filial, periodo ou filtro de consulta sem uma nova decisao explicita.
6. A identidade de escrita e produtos.codigo. Linhas sem codigo de Produto nao podem ser convertidas silenciosamente em classificacao.
7. Preservar o dominio A/B/C e nulo/vazio como nao definido. O contrato de veiodatriggercaracteristicas deve ser confirmado pelo checkout e pelas triggers; o flag de controle nao pode permanecer artificialmente true ao final.
8. F6 nunca grava automaticamente. O comando precisa de capacidade distinta de gerar e autorizacao de escopo global; acesso limitado a uma Filial nao e suficiente para alterar a classificacao global.
9. A operacao deve ser idempotente para a mesma intencao e resultado: repetir apos sucesso nao cria nova mudanca material nem efeitos duplicados. Uma disputa com outra gravacao deve seguir a politica de concorrencia especificada, nunca ultima gravacao silenciosa sem evidencia.
10. Registrar auditoria com operador, ambiente, geracao/payload, modos, contagem de Produtos limpos/aplicados, resultado, falha/rollback e request/trace id, sem senha ou segredo.

## Guardrails tecnicos

- Revalidar o checkout Laravel e o PostgreSQL vigente antes de escolher endpoint, command, service, repository, migration ou policy.
- Reutilizar triggers e autoridade compartilhada existentes; nao criar espelho paralelo de classificacao.
- Usar transacao PostgreSQL explicita, binds/set-based e locks/versionamento conforme schema comprovado.
- Nao copiar a concatenacao SQL do Delphi, nao executar um UPDATE por linha e nao testar somente com SQLite quando o contrato depende de PostgreSQL/triggers.
- Nao criar historico de geracoes, Fotografia persistente, tabela de resultado, PDF, impressao ou Excel.
- Nao permitir que a Gravacao consuma um resultado `ready` que ainda esteja marcado pela especificacao de geracao como suspeito/invalido no caso Top N 4500/100; a gravacao depende do contrato de resultado validado pelos prompts 01 e 03.
- Nao alterar os leitores downstream alem do minimo necessario para preservar o dominio A/B/C/nulo.

## Testes e aceite

Especifique testes PostgreSQL para: resultado pronto e vazio; modos 0/1/2 aceitos; modos agregados recusados; usuario sem capacidade global; Filiais nao autorizadas; payload adulterado; classificacao A/B/C; limpeza global; triggers e estado final do flag; atomicidade com falha no meio; rollback; concorrencia Delphi/Laravel; repeticao idempotente; auditoria; efeitos nos leitores de Consulta de Compras/Transferencias/Requisicoes/Manutencao de Precos; e tentativa de gravar resultado cancelado/expirado.

## Saida esperada do SpecKit

Produza spec.md, plan.md, tasks.md, contratos HTTP/comando e matriz de testes para a Gravacao da Classificacao ABC. A especificacao deve apontar explicitamente qualquer lacuna de schema/trigger que precise ser resolvida no checkout, sem transformar essa lacuna em implementacao presumida.
