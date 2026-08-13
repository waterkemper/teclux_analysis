# Wayfinder — Transferência de Requisição para Exposição no Laravel

Label: wayfinder:map

## Destination

Produzir em `modules/interlojas/transferencia-requisicao-exposicao/` um conjunto autoritativo, rastreável e ordenado de prompts `/speckit.specify` para orientar a implementação no Laravel de **Interlojas → Transferência de Requisição para Exposição**, a partir dos arquivos Delphi `dmtransferenciarequisicaoexposicao.pas/.dfm` e `fmtransferenciarequisicaoexposicao.pas/.dfm`, reutilizando o que já existe para Requisições, Romaneios, grids e consultas canceláveis.

O mapa termina na publicação e validação dos prompts; não implementa o módulo Laravel nem altera o Delphi.

## Notes

- Contextos obrigatórios: `Plataforma Laravel`, o legado Delphi e o vocabulário transversal em `CONTEXT.md`.
- Fontes primárias corrigidas: `C:\projetos.vcl\apps\interlojas\dmtransferenciarequisicaoexposicao.pas/.dfm` e `fmtransferenciarequisicaoexposicao.pas/.dfm`. O caminho informado como `C:\prjetos.vcl` não existe.
- Fonte de autoridade para parâmetros: `C:\projetos.vcl\biblio\clparametrossistema.pas`, além dos usos concretos alcançados no módulo.
- Consultar primeiro os prompts já gerados em `modules/interlojas/requisicao-para-exposicao/`, `modules/interlojas/consulta-requisicoes-exposicao/`, `modules/entregas/cadastro-romaneios/` e os componentes Laravel atuais.
- Usar `/research` para fatos verificáveis, `/grilling` para decisões de produto/arquitetura e `/domain-modeling` quando um termo ou limite de domínio precisar ser consolidado.
- Separar em cada artefato `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG LEGADO` e `DECISÃO NOVA`, sempre com arquivo/linha ou evidência equivalente.
- Os prompts devem exigir queries parametrizadas e set-based, proibir N+1, preferir `IN`/`= ANY(array)` quando aplicável, escolher `INNER JOIN` quando nulabilidade e contrato tornarem o relacionamento obrigatório e conferir um snapshot autoritativo do schema antes de escrever SQL.
- F6 deve exibir Cancelar desde o início e cancelar a query no PostgreSQL, não apenas abortar a interface. F9 usa o modal de pesquisa padrão; a tela usa Breadcrumb padrão, radio buttons quando adequados, grid ERP com ordenação, exportação e personalização e command bar Laravel com ícones/atalhos.
- O componente de máscara da chave NF-e deve ser tratado como capacidade compartilhada do sistema, reaproveitando ou promovendo a autoridade já existente; não criar uma máscara exclusiva sem necessidade transversal comprovada.
- Não criar requisitos ou testes para driver nem `hastablefs`.
- Exceção deliberada ao “plan, don’t do” do wayfinder: o último ticket publica os prompts SpecKit solicitados pelo usuário.

## Decisions so far

<!-- Uma linha por ticket resolvido; tickets abertos aparecem somente em issues/. -->

- [Inventariar interface, filtros e atalhos da Transferencia de Requisicao para Exposicao Delphi](issues/01-inventariar-interface-filtros-e-atalhos-delphi.md) — filtros, estados, jornadas, grids, atalhos e bugs de wiring foram documentados.
- [Inventariar SQL, dominio e efeitos da Transferencia de Requisicao para Exposicao Delphi](issues/02-inventariar-sql-dominio-e-efeitos-delphi.md) — consultas, situacoes, estoque/reserva, lotes, movimentos, concorrencia e exclusoes fiscais foram delimitados.
- [Inventariar parametros, autorizacoes e acesso do modulo legado](issues/03-inventariar-parametros-autorizacoes-e-menu-legado.md) — literais, precedencia por filial, menu legado e ausencia de grants operacionais foram confirmados.
- [Auditar padroes Laravel e reuso para Transferencia de Requisicao](issues/04-auditar-padroes-laravel-e-reuso.md) — seams existentes de requisicao, consulta, romaneio, grid, F9, chave NF-e e cancelamento real foram mapeados.
- [Definir coleta e armazenamento do snapshot autoritativo do schema](issues/05-definir-snapshot-autoritativo-do-schema.md) — snapshot read-only de 2026-08-06 foi coletado com 12 relacoes, 530 colunas, 121 constraints, 82 indices, 53 triggers, 35 funcoes e duas sequences.
- [Fechar limite de dominio e operacoes da Transferencia de Requisicao](issues/06-fechar-limite-de-dominio-e-operacoes.md) — o usuario confirmou paridade integral com o Delphi para o escopo operacional, inclusive agrupamento/persistencia, lotes, conferencia e reinclusao de saldo; fiscal e venda entre filiais ficam fora.
- [Definir consulta F6, SQL set-based, desempenho e cancelamento real](issues/07-definir-consulta-f6-sql-e-cancelamento.md) — consulta sincrona, cancelamento PostgreSQL real, sem paginacao, ordenacao requisitante/produto, SQL set-based e joins conforme schema foram confirmados.
- [Definir interface, grid, atalhos e componentes compartilhados](issues/08-definir-interface-grid-e-componentes-compartilhados.md) — paridade de filtros/atalhos, grid sem paginacao com preferencias ERP, edicao restrita a requisicoes abertas, lotes selecionaveis, indicadores acessiveis e componente NF-e compartilhado foram confirmados.
- [Decidir fatiamento, rastreabilidade e aceite dos prompts SpecKit](issues/09-decidir-fatiamento-e-contrato-dos-prompts.md) — cinco prompts ordenados, com contrato comum, dependencias, evidencias, schema, aceite e exclusoes obrigatorias foram confirmados.

## Not yet specified

- Nenhum item bloqueante permanece para a publicação dos prompts. Dúvidas de implementação que os próprios prompts marcam como decisão/aceite devem ser resolvidas durante o `/speckit.specify` com as evidências deste diretório, sem reabrir as exclusões já confirmadas.

## Out of scope

- Emissão, transmissão, consulta, impressão ou cancelamento de notas fiscais permanecem fora deste mapa operacional e são tratados no esforço complementar [Emissão Fiscal da Transferência de Requisição entre Filiais](../transferencia-requisicao-emissao-fiscal-wayfinder/map.md).
- Qualquer comportamento ou regra do código legado identificado como “venda entre filiais”.
- Implementação do Laravel, alteração dos fontes Delphi, migrations aplicadas ou mudanças no banco durante este mapa.
- Testes de driver e testes de `hastablefs`.
- Grades/painels Delphi de filtro de compras, grupos e filiais, por nao serem mais utilizados.
