# Cadastro de Pedidos de Compra — auditoria de continuidade e lacunas restantes

Label: wayfinder:map

## Destination

Comparar a implementação Laravel atual do Cadastro de Pedidos de Compra com os dois mapas concluídos, os 15 prompts publicados e as units Delphi `dmcadastropedidos`/`fmcadastropedidos`, identificar somente lacunas ainda reais e produzir prompts `/speckit.specify` corretivos incrementais a partir do número 16.

## Notes

- Fontes fechadas: `.scratch/cadastro-pedidos-wayfinder/map.md`, `.scratch/cadastro-pedidos-tela-wayfinder/map.md` e `modules/estoque/cadastro-pedidos/01` a `15-speckit-prompt.md`.
- Fontes Delphi atuais: `C:/projetos.vcl/apps/estoque/dmcadastropedidos.pas/.dfm` e `fmcadastropedidos.pas/.dfm`; dependências só quando diretamente alcançáveis e necessárias.
- Implementação atual: `laravel/backend`, incluindo frontend, backend, migrations, autorização, integrações, concorrência e testes.
- Ordem de autoridade: decisões/prompts fechados; Delphi para comportamento não especificado; Laravel como baseline implementado e fonte de seams.
- Não reabrir decisões fechadas nem restaurar bugs/código morto do legado.
- Considerar concluída uma fatia somente quando implementação e prova automatizada correspondentes forem localizadas.
- Paridade visual significa conteúdo, hierarquia, estados e operação; não cópia pixel a pixel.
- Publicar prompts incrementais `16+`, agrupados por dependência coesa, com pré-requisitos, arquivos afetados, testes e regressões.
- Classificar achados como `CONFIRMADO`, `INFERIDO`, `DÚVIDA`, `NÃO LOCALIZADO`, `DIVERGENTE`, `POSSÍVEL BUG`, `SEM PROVA` ou `OPORTUNIDADE`.
- Este workspace audita e especifica; não altera diretamente Laravel ou Delphi.

## Decisions so far

<!-- Uma linha por ticket resolvido: link, título e síntese. -->

- [Construir a matriz de requisitos dos 15 prompts do Cadastro de Pedidos](issues/01-construir-matriz-requisitos-prompts.md) — consolidou requisitos, invariantes, jornadas, superfícies e testes dos prompts 01–15 numa rubrica rastreável, sem reabrir decisões.
- [Auditar a implementação Laravel atual do Cadastro de Pedidos](issues/02-auditar-implementacao-laravel-atual.md) — encontrou ampla implementação, mas revelou riscos críticos no fallback dos motores, reconstrução financeira destrutiva, concorrência/sequence sem prova e lacunas nos prompts 12, 14 e 15.
- [Auditar comportamentos Delphi e paridade ainda não cobertos do Cadastro de Pedidos](issues/03-auditar-delphi-e-paridade-nao-coberta.md) — identificou gaps de cabeçalho/estado/observações, modo inline de custo, correlação SEFAZ, gestos operacionais e ficha compartilhada, excluindo módulos e bugs já decididos.
- [Classificar as lacunas reais e prioridades do Cadastro de Pedidos](issues/04-classificar-lacunas-reais-prioridades.md) — classificou segurança financeira, motores/concorrência/sequence como P0; cabeçalho, SEFAZ, similares e fiscal como P1; modo inline, gestos e exportação como P2, descartando falsos positivos e expansões.
- [Definir as fatias corretivas e os critérios de aceite do Cadastro de Pedidos](issues/05-definir-fatias-corretivas-aceite.md) — definiu dez prompts `16–25`: três P0 sequenciais, quatro P1 paralelizáveis e três P2, com revisão compatível com Delphi, contratos de erro, testes PostgreSQL/React, regressões e gates de rollout.
- [Publicar os prompts Speck/Specify corretivos do Cadastro de Pedidos](issues/06-publicar-prompts-corretivos.md) — publicou os dez prompts autocontidos `16–25`, com dependências, escopo, critérios de aceite, testes e regressões, concluindo a especificação das lacunas confirmadas.

## Not yet specified

- Nenhuma decisão permanece aberta; os dez prompts corretivos `16–25` foram publicados e validados.

## Out of scope

- Reespecificar decisões já fechadas sem nova evidência de incompatibilidade.
- Editar diretamente `laravel/` ou o código Delphi.
- Consulta/Listagem, Cancelamento e Cópia autônoma de Pedidos já excluídos pelos mapas anteriores.
- Emissão de NF-e e outros módulos autônomos além dos seams consumidos pelo Cadastro de Pedidos.
- Paridade visual pixel a pixel.
