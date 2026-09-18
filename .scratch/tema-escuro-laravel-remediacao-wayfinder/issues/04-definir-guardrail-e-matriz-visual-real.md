# Definir guardrail e matriz visual real

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Quais verificações automatizadas e evidências visuais devem substituir o guardrail estreito e o falso smoke atual para impedir novo encerramento prematuro?

Definir scan de papéis, textos, bordas, foco e aliases físicos; allowlist explícita para relatórios e exceções legítimas; renderização real das rotas; matriz Claro + três paletas; viewports e estados; medição WCAG; formato das capturas; falha obrigatória quando houver arquivo não coberto. O teste deve montar ou navegar pelas superfícies, não apenas alternar atributos no `documentElement`.

## Answer

Substituir o guardrail atual por duas camadas obrigatórias e bloqueantes: um scan estático exaustivo e uma matriz executada em navegador real com Puppeteer, já presente no projeto. Uma camada não substitui a outra. O scan detecta dívida no código; o navegador comprova composição, contraste e estados renderizados. O teste atual que apenas alterna atributos no `documentElement` não constitui smoke de superfície.

### Guardrail estático

- Descobrir automaticamente os arquivos tematizáveis em `resources/js/Pages`, `Components`, `Layouts` e nos CSS aplicáveis; não manter uma lista fixa de arquivos.
- Reconciliar descoberta, manifesto de lotes, rotas/superfícies e exclusões.
- Detectar utilitários físicos de fundo, texto, borda, ring, ring-offset, outline, divide, placeholder, gradiente, `fill` e `stroke`; aliases físicos `teclux-*`; variantes `dark:`; e literais hex/rgb/hsl em chrome adaptável.
- Falhar quando houver arquivo sem lote, arquivo incluído não escaneado, rota sem caso visual, exclusão não autorizada, candidato não classificado ou entrada de allowlist obsoleta.

### Allowlist

Substituir o marcador inline genérico por registro estruturado e fechado. Cada exceção informa arquivo e ocorrência/padrão exatos, categoria, justificativa visual ou operacional, aparências verificadas e evidência de contraste quando aplicável.

Relatórios ficam excluídos por regras explícitas de escopo, mas continuam no manifesto como `excluído: relatório`; nenhum arquivo pode ser ignorado silenciosamente. Qualquer candidato sem classificação falha o gate.

### Matriz em navegador real

- Navegar por cada rota/superfície real usando sessão, permissões e dados determinísticos.
- Executar tema claro e as três paletas escuras em viewport desktop operacional e viewport estreito/responsivo.
- Exercitar normal, hover, foco, seleção, erro, loading, readonly, disabled, modal, drawer e toast em casos representativos que cubram todas as variantes.
- Aceitar montagem isolada somente para completar estados de componentes; ela nunca substitui a página real.
- Mascarar somente regiões de dados dinâmicos justificadas; a região permanece presente na captura.
- Manter rota sem credencial, permissão ou fixture como impedimento, sem aprovar o lote.

### Contraste

Medir cores computadas e o fundo efetivamente composto no navegador, incluindo transparências. Falhar abaixo de `4,5:1` para texto normal, `3:1` para texto grande e `3:1` para bordas, controles, foco e gráficos necessários à compreensão. Gradientes, imagens e casos não mensuráveis automaticamente exigem revisão visual registrada.

### Evidências e baselines

Nomear capturas deterministicamente por lote, superfície, aparência, viewport e estado. Acompanhar as imagens por manifesto JSON ou Markdown contendo rota/fixture, commit, tema/paleta, viewport, estado, resultado de contraste, exceções e impedimentos.

Preservar as imagens da auditoria como evidência inicial de defeitos; elas não são baselines aprovadas. Criar novas baselines somente após aceite visual e de contraste. Diferenças posteriores falham até revisão explícita; não atualizar snapshots automaticamente para deixar a suíte verde. Máscaras e tolerâncias exigem justificativa no manifesto.

### Política de execução

- Em toda alteração: scan estático integral, testes unitários e matriz do lote afetado.
- Ao mudar seam compartilhado: matriz de todos os lotes consumidores impactados.
- Antes da conclusão integral: matriz completa de todas as superfícies, quatro aparências e dois viewports, seguida dos testes e build.
- Execução agendada pode repetir a matriz completa, mas não substitui o gate final.
