# Prompt `/speckit.specify` — fechar integridade do pacote XSD e estado do dry-run

## Contexto

Após as specs 17–19, `schemaPackageHash` é obrigatório, porém a implementação compara o valor somente com o SHA-256 do XSD raiz. Como o pacote usa imports/includes, uma alteração em um arquivo dependente pode passar despercebida.

Além disso, o dry-run persiste o estado retornado por `ensureGrupoAlvo`, mas monta `estado_preparacao` na resposta usando o agregado em memória. Quando há bloqueios, a resposta pode divergir do estado persistido que o gate consulta.

Não implementar nesta etapa. Gerar somente a especificação `/speckit.specify`, contratos, tarefas e testes. Preservar `Transferencia`, NF-e 55, homologação e a exclusão de venda/devolução.

## Objetivos

1. Fazer `schemaPackageHash` representar uma impressão determinística de todo o pacote XSD efetivamente usado.
2. Fazer o dry-run responder o estado operacional persistido ou uma representação explicitamente equivalente, sem declarar elegibilidade quando existem bloqueios.

## Requisitos do pacote XSD

- Definir a árvore de imports/includes alcançável a partir do XSD raiz, com resolução confinada ao diretório autorizado e rejeição de path traversal.
- Definir serialização determinística: caminhos relativos normalizados, ordenação estável e SHA-256 dos bytes de cada arquivo, ou manifesto equivalente versionado.
- Alteração, inclusão, remoção ou import quebrado em qualquer dependência deve divergir do hash declarado ou produzir erro tipado antes de assinar/transmitir.
- O snapshot, a tabela de configuração e a evidência devem deixar claro se o hash é de arquivo raiz ou de pacote; preferir o contrato de pacote completo sem compatibilidade silenciosa com hash de raiz.
- Testar pacote válido, root divergente, dependência divergente, dependência ausente, import externo proibido e tentativa de escapar do diretório do pacote.

## Requisitos do dry-run

- Quando `persistir_alvo=true`, a resposta deve refletir o estado realmente persistido por `ensureGrupoAlvo`, incluindo `FalhaOperacional` quando houver bloqueios.
- Quando não persistir alvo, a resposta deve distinguir claramente estado calculado de estado persistido e não sugerir que o gate já está pronto.
- `pode_emitir=true` somente com fotografia autoritativa, fontes obrigatórias, snapshot íntegro e bloqueios vazios.
- A resposta deve incluir bloqueios tipados e próximo passo coerente: corrigir fonte/repetir dry-run, nunca transmitir para descobrir o problema.
- O dry-run não pode alocar número, selar fotografia, transmitir, chamar SEFAZ ou avançar série.

## Testes de aceite

- Mutar apenas um XSD importado faz o resolver rejeitar o snapshot com código de hash divergente.
- Remover um import faz o resolver rejeitar o pacote sem fallback por `glob` ou por outro diretório.
- Dry-run com bloqueio e persistência responde o mesmo estado inelegível observado pelo gate.
- Dry-run elegível responde `pode_emitir=true`, bloqueios vazios e estado `Elegivel`, sem efeitos de emissão.
- Teste prova que `persistir_alvo=false` não cria/atualiza alvo persistido.

## Saída esperada

Publicar spec, contrato do manifesto/hash do pacote, contrato de resposta do dry-run, tarefas e atualização do quickstart de homologação. Não alterar código nesta chamada e não declarar prontidão sem suíte verde em PHP 8.5.

