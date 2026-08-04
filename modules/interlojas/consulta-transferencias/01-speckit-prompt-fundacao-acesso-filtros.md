# Prompt para /speckit.specify — fundação, acesso e filtros

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a primeira de duas fatias do módulo Laravel **Interlojas → Consulta de Transferências**. Esta fatia entrega fundação, acesso, menu, filial ativa, parâmetros do sistema e contrato canônico dos filtros. O módulo é uma visão somente leitura dos registros de transferência entre Filiais Requisitantes e Filiais Requisitadas.

Não implemente durante `/speckit.specify`. Inspecione o checkout Laravel atual e cite arquivos concretos. Não investigue Delphi: as evidências consolidadas neste prompt e nos arquivos de pesquisa do workspace de análise são o contrato legado autoritativo. Corrija apenas hipóteses sobre o estado atual do Laravel; não reabra decisões funcionais confirmadas.

## Fontes consolidadas no workspace de análise

- `modules/interlojas/consulta-transferencias/pesquisa-interface-delphi.md`;
- `modules/interlojas/consulta-transferencias/pesquisa-sql-delphi.md`;
- `modules/interlojas/consulta-transferencias/pesquisa-parametros-autorizacoes-delphi.md`;
- `modules/interlojas/consulta-transferencias/pesquisa-padroes-laravel.md`.

Se o checkout usado pelo Cursor não contiver esses arquivos, considere as regras abaixo suficientes e autoritativas. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Limite desta fatia

Entregue:

- folha/capability própria e menu **Interlojas → Consulta de Transferências**;
- grupo de rotas protegido, controller e composição inicial da página Inertia;
- resolução e autorização da filial ativa;
- listas autorizadas de Filiais Requisitantes e Filiais Requisitadas;
- manifest server-side dos parâmetros legados;
- Form Request/DTO imutável do contrato semântico dos filtros;
- props Inertia e tipos TypeScript necessários para a segunda fatia;
- estrutura React dos filtros, estados iniciais e atalho Gerar/F6 preparado.

Não entregue ainda o repositório SQL, grid de resultados ou exportação; eles pertencem à spec 02.

## Identidade, menu e capability

- Criar migration/seed idempotente em `acessosmodulos`, como folha Cloud sob `cloud.modulo.interlojas`.
- Nome canônico: **Consulta de Transferências**.
- Rota canônica recomendada: `interlojas.consulta-transferencias.index`; a migration e a rota nomeada devem coincidir.
- Não copiar grants existentes nem conceder acesso automaticamente.
- Usar uma única capability para página, consulta e exportação; não inventar permissões operacionais, pois o módulo é somente leitura.
- Administrador mantém o bypass padrão do projeto.
- Visitante segue o comportamento de autenticação existente; usuário autenticado sem grant recebe 403.
- Ocultar o menu sem acesso, mas tratar o backend como autoridade.
- Seguir os seams concretos da Consulta de Requisições: service de acesso, middleware, alias no bootstrap e middleware envolvendo o grupo inteiro.

## Filial ativa e escopo autorizado

- Resolver a filial ativa exclusivamente pela sessão/`BranchContextService`; nunca aceitar filial ativa ou capability do browser.
- Distinguir filial ausente, inválida, não autorizada e válida, conforme o padrão Laravel existente.
- Usuário comum só pode consultar filiais presentes em `usuariosfiliais`, tanto no papel de Requisitante quanto no de Requisitada.
- Administrador pode consultar todas as filiais válidas.
- Os dois filtros de filial são independentes e aceitam múltiplos códigos.
- Validar no backend cada ID solicitado e impedir ampliação de escopo por adulteração do request; não confiar apenas nas opções enviadas à UI.
- A filial ativa serve para contexto, parâmetros e autorização de entrada, mas não substitui os dois filtros multisseleção.
- Estado inicial: selecionar a filial ativa nos dois filtros quando ela for uma opção autorizada.

## Parâmetros do sistema

Criar manifest próprio e resolver em lote por `ParameterService::getMany(..., $filialAtiva)`, preservando a precedência já encapsulada pelo projeto entre filial específica e valor global. Usar exatamente estas descrições:

1. `USAR GRADES PRODUTOS` — booleano de apresentação das grades;
2. `REQUISICAOSUBTRAIESTOQUE` — booleano de apresentação do estoque da requisitante;
3. `Máscara Quantidade` — máscara/formatação das quantidades;
4. `DATA CONTABIL` — fronteira inferior de data;
5. `DIASNOTARETROATIVA` — limite retroativo complementar;
6. `Relatório Somente Filiais Autorizadas` — evidência de compatibilidade legada, nunca autoridade para enfraquecer o escopo Laravel confirmado.

Normalizar tipos e defaults no backend. A UI recebe somente efeitos de apresentação e limites necessários. Segurança, filtros e exportação resolvem novamente sua autoridade no servidor.

## Contrato canônico dos filtros

- `data_inicial` e `data_final`, formato `Y-m-d`, inclusivas;
- `situacoes`: array allowlisted de `A|F|D|C`;
- rótulos: `A = Aberta`, `F = Fechada`, `D = Confirmada`, `C = Cancelada`;
- `curvas_abc`: array allowlisted de `A|B|C|nao_definido`;
- `filiais_requisitantes`: array de IDs inteiros autorizados;
- `filiais_requisitadas`: array de IDs inteiros autorizados.

Semântica:

- nenhuma situação selecionada significa todas;
- todas as curvas ou nenhuma curva selecionada significam sem restrição;
- `nao_definido` cobre `NULL` e string vazia;
- arrays de filiais vazios significam sem restrição adicional dentro do conjunto autorizado, nunca acesso irrestrito;
- não aceitar CSV, fragmentos SQL, filial ativa, capability ou parâmetros do sistema no payload.

## Período e validação

- A página abre sem executar consulta.
- Padrão: data final = data atual do servidor; período = 180 dias; data inicial = data final menos 180 dias.
- “Número de dias” é auxílio reativo de UI: alterá-lo recalcula a inicial; alterar as datas recalcula o número exibido.
- Somente as duas datas integram o request e a identidade semântica dos filtros.
- Data inicial não pode superar a final.
- Bloquear com 422 datas fora da fronteira permitida por `DATA CONTABIL` e `DIASNOTARETROATIVA`, resolvidos pela filial ativa no servidor.
- Não misturar paginação/ordenação à identidade semântica reutilizada pela exportação.

## Interface inicial

- Usar `AppLayout`, breadcrumbs e componentes do design system atual.
- Exibir filtros de período, situações, Curva ABC e as duas listas multisseleção de filiais.
- Situações iniciam desmarcadas; A/B/C/Não Definido iniciam marcadas.
- Botão primário **Gerar** com ícone no padrão do projeto e atalho F6.
- F6 é complementar ao botão visível, não substitui acessibilidade.
- Bloquear o atalho durante loading, modal ou campo incompatível e evitar colisão com atalhos do grid.
- Preparar estados Inicial, Carregando, Vazio, Resultado e Erro recuperável, preservando filtros.

## Contratos esperados

Especifique rotas, middleware, controller/page service, services de autorização, manifest de parâmetros, Form Request/DTO, props Inertia e tipos TypeScript. A spec 02 consumirá exatamente esse contrato e adicionará `page`, `per_page`, `sort` e `direction` somente ao endpoint de leitura.

## Critérios de aceite

- [ ] Acesso próprio sob Interlojas, migration idempotente e nenhum grant implícito.
- [ ] Uma capability protege todo o grupo de rotas.
- [ ] Filial ativa vem apenas da sessão e é validada no servidor.
- [ ] Ambos os filtros de filial ficam limitados a `usuariosfiliais` para usuário comum.
- [ ] Administrador mantém o comportamento padrão para todas as filiais.
- [ ] Os seis parâmetros usam descrições literais e resolução em lote pela filial ativa.
- [ ] Filtros têm tipos, allowlists, defaults e semântica de vazio explícitos.
- [ ] Período padrão é 180 dias e a página abre sem consultar.
- [ ] Limites de data são revalidados no backend e retornam 422.
- [ ] Gerar/F6 segue o padrão visual e de atalhos do Laravel.

## Matriz mínima de testes

- visitante, usuário sem grant, usuário com grant e administrador;
- menu visível/oculto e todos os endpoints protegidos;
- filial ativa ausente, inválida, não autorizada e válida;
- seleção válida e adulterada nos dois papéis de filial;
- usuário com uma/várias filiais e administrador;
- valor específico/global/ausente/inválido de cada parâmetro;
- datas válidas, invertidas, malformadas e fora de cada limite;
- nenhuma/uma/várias/todas as situações;
- nenhuma/uma/várias/todas as Curvas ABC e Não Definido;
- defaults de 180 dias, recálculo dias→data e datas→dias;
- F6 normal, durante loading e com foco em campo incompatível.

## Saída esperada do SpecKit

Produza spec e plano executáveis com árvore de arquivos, migrations, rotas, contratos PHP/Inertia/TypeScript, fluxo de autorização, validações, códigos de erro, sequência de entrega e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- SQL/projeção e grid de resultados;
- paginação, ordenação e exportação;
- criar, alterar, confirmar, cancelar, transferir, expedir ou receber registros;
- alterar Delphi ou schema legado;
- executar a implementação durante esta especificação.
```
