# Publicar e validar os prompts SpecKit da Transferência de Requisição

Type: task
Status: resolved
Blocked by: 09

## Question

Produzir os prompts autoritativos `/speckit.specify` no diretório `modules/interlojas/transferencia-requisicao-exposicao/`, incluindo README/índice e schema quando definido, e validar rastreabilidade de filtros, SQL, parâmetros, autorizações, operações, atalhos, componentes compartilhados, cancelamento real, regras anti-N+1, joins, testes e limites fora de escopo. Conferir Markdown, referências relativas, duplicação com prompts já existentes e `git diff --check`; não implementar o módulo.

## Answer

Publicados `README.md` e cinco prompts ordenados: fundacao/dominio/seguranca; consulta F6/grid/cancelamento; nucleo transacional/confirmacao; lotes/conferencia; interface/integracao/aceite. Os prompts incorporam as decisões confirmadas pelo usuario, referenciam as pesquisas Delphi/Laravel e o snapshot PostgreSQL com checksum, reutilizam os componentes existentes, proíbem N+1 e introspecao de schema em runtime, exigem joins conforme nulabilidade e cancelamento PostgreSQL real, e repetem as exclusoes de fiscal, venda entre filiais, grades obsoletas, driver e `hashtablefs`/`hastablefs`.

Validacao executada: arquivos obrigatorios presentes, diretorios/prompt existentes consultaveis, referencias ao snapshot acessiveis e `git diff --check` sem erros nos arquivos deste esforco. Nenhum modulo Laravel ou fonte Delphi foi implementado ou alterado.
