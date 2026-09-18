# Prompt 06 — Aceite integrado, F6, relatório e paridade

Execute `/speckit.specify` para fechar a especificação de aceite da
implementação existente. Leia os prompts 01–05, a auditoria
`auditoria-implementacao-laravel-vs-delphi.md`, as specs 460–462, o README do
módulo, o snapshot/manifesto de schema e o checkout Laravel atual. Não peça
reabertura dos fontes Delphi e não implemente durante `/speckit.specify`.

## F6 como geração canônica

F6 é a única ação que gera o resultado operacional. Ela deve produzir uma
fotografia completa do conjunto filtrado, com todas as linhas, mesmos títulos,
campos, ordenação lógica, totais e estados do grid. O relatório HTML/PDF,
impressão, paginação e exportação leem essa fotografia; não podem abrir uma
segunda consulta ao ledger.

O requisito “todo relatório tem F6” significa que o relatório fica gerado e
disponível como saída da geração F6. Uma ação F7/Imprimir pode somente abrir a
fotografia já gerada em nova aba; não pode ser o gatilho de um SQL paralelo nem
substituir o estado de geração. Tornar essa distinção visível na command bar e
na documentação.

## Cancelamento

- O botão Cancelar deve aparecer antes do primeiro `await` de F6.
- Consulta e materialização do relatório devem registrar trace/PID e usar o
  cancelamento PostgreSQL real (`pg_cancel_backend`) pelo protocolo existente.
- Cancelar, timeout, erro e resposta tardia não podem publicar fotografia
  parcial nem substituir a última geração completa.
- Repetir F6 enquanto ocupado não dispara uma segunda geração.

## Grid e saída

- O PDF/HTML e a planilha devem usar o catálogo corrigido do Prompt 04,
  inclusive títulos, formatos, ordem e colunas exportáveis.
- A saída deve respeitar o mesmo universo completo, mesmo quando o grid estiver
  paginado. Não exportar chaves técnicas ocultas nem seleção transitória da
  sessão.
- Totais do relatório devem vir do envelope da fotografia; não recalcular por
  linha em Blade nem consultar novamente o legado.
- Breadcrumb deve ser `Caixa / Controle de Recebimentos`; operações continuam
  em radio buttons; F9 continua o modal padrão autorizado.

## Schema e rastreabilidade

Validar o SHA do snapshot em teste/CI, não em request. Cada tabela, coluna,
função, PK/FK, nulabilidade e trigger usada nos efeitos do Prompt 05 deve estar
no manifesto. Se o snapshot não comprovar um alocador bancário ou efeito, o
spec deve registrar bloqueio explícito; não inventar SQL.

## Matriz mínima de aceite

1. F6 nos três modos retorna a fotografia completa e a consulta de página lê
   somente a fotografia.
2. F6/Cancelar preserva a geração anterior e mata a consulta real.
3. Grid, HTML, PDF e XLSX têm os mesmos códigos, títulos, ordem semântica e
   totais.
4. Preferências de grid alteram somente layout.
5. F5 executa cada operação com os efeitos do Prompt 05 e reconsulta por F6
   após sucesso.
6. Falhas em documento, duplicata, evento, fingerprint, autorização ou
   alocação não deixam mutação parcial.
7. Testes de consulta comprovam zero N+1 e nenhum uso de introspecção runtime.

