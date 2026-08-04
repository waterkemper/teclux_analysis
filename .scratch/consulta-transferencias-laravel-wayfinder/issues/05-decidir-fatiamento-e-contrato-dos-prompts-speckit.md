# Decidir o fatiamento e o contrato dos prompts SpecKit

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04

## Question

À luz dos inventários Delphi e dos padrões Laravel, qual é o menor conjunto de prompts `/speckit.specify` com fronteiras coesas, dependências explícitas, critérios de aceite e matrizes de testes que cubra integralmente a Consulta de Transferências sem duplicar infraestrutura nem misturar especificação com implementação?

## Comments

## Answer

O conjunto será composto por dois prompts `/speckit.specify`, nesta ordem:

1. **Fundação, acesso e filtros**: migration idempotente de `acessosmodulos` sob Interlojas, rota canônica, menu, service/middleware de uma única capability, filial ativa e escopo de `usuariosfiliais`, manifest de parâmetros, contratos de filtros, defaults, validações e props Inertia/TypeScript.
2. **Consulta, grid e operações de leitura**: repositório SQL parametrizado e set-based, projeção, paginação/ordenação server-side, exportação integral autorizada, `ErpPreferenceDataGrid`, catálogo de colunas, observação, estados de tela, `ErpConsultaOperationBar`, botão Gerar e F6.

Decisões confirmadas:

- o módulo é somente leitura; não serão inventadas operações transacionais ou permissões por operação;
- haverá uma única capability, aplicada à página, consulta e exportação;
- a página abre sem consultar, com período de 180 dias até a data do servidor; o número de dias é auxílio reativo e somente as datas seguem ao backend;
- datas invertidas ou fora da fronteira de `DATA CONTABIL`/`DIASNOTARETROATIVA` são bloqueadas no backend com 422;
- situações são multisseleção; nenhuma selecionada significa todas;
- Curva ABC inicia com A/B/C/Não Definido; todas ou nenhuma selecionada significam sem restrição, e Não Definido abrange `NULL` e vazio;
- `D` usa o rótulo canônico **Confirmada** e `F`, **Fechada**;
- filtros de Filial Requisitante e Filial Requisitada são independentes, mas ambos ficam limitados a `usuariosfiliais` para usuário comum; administrador abrange todas;
- parâmetros usam descrições literais e `ParameterService::getMany` pela filial ativa, sem receber autoridade do browser;
- SQL usa binds/`whereIn`, allowlists e projeção set-based sem `pf.*`, macros textuais, injeção ou N+1;
- ordenação inicial é `data ASC, hora ASC, codigo ASC`; ordenações públicas usam allowlist e desempate estável;
- paginação é server-side com 200 registros por página como padrão;
- exportação Excel cobre todo o resultado filtrado e autorizado, via contexto/token server-side, não apenas a página atual;
- o grid usa o padrão Laravel de exportação, ordenação, preferências, personalização, acessibilidade e estados;
- os rótulos **Estoque Requisitada**/**Estoque Requisitante**, **Linha**/**Coluna** e **Fechada** corrigem defeitos de apresentação legados sem alterar os dados;
- Gerar e F6 são a única operação/tecla específica comprovada; atalhos próprios do grid permanecem disponíveis sem colisão;
- resultado vazio é estado normal e preserva filtros; a linha selecionada controla Observações somente leitura.

Cada prompt deve tratar as pesquisas em `modules/interlojas/consulta-transferencias/` como pacote Delphi autoritativo, mandar inspecionar o checkout Laravel atual, classificar divergências concretas e não implementar durante `/speckit.specify`.
