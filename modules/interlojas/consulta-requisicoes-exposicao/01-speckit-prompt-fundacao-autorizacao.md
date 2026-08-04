# Prompt para /speckit.specify — fundação e autorização

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a fundação Laravel do módulo **Interlojas → Consulta de Requisições**, primeira de quatro fatias da Consulta de Requisições para Exposição. Esta fatia entrega capability/menu, rotas-base, autorização por filial ativa, contratos de filtros e snapshot de parâmetros para as specs 02–04.

Não implemente nesta etapa. Inspecione o checkout Laravel atual e cite arquivos concretos. Não investigue Delphi: este prompt é o contrato autoritativo. Corrija apenas hipóteses sobre o estado atual do Laravel; não reabra as decisões funcionais.

## Contexto e dependências existentes

Reutilize, sem criar uma segunda autoridade:

- o Cadastro atual em `Interlojas/RequisicaoParaExposicao`, seu controller, services, middleware, testes e tipos;
- `RequisicaoExposicaoAuthorizationService` para autorização de requisitante e validação da requisitada;
- `RequisicaoFiliaisParameterManifest`, `ParameterService` e resolução por filial ativa;
- `UserBranchAccessService`, `acessosmodulos`, `usuariosacessosmodulos`, `usuariosfiliais` e padrões de menu;
- resolução de filial ativa pelo contexto/sessão Laravel;
- o núcleo `RequisicaoFiliais` já entregue. Não alterar seus movimentos, locks ou auditoria nesta fatia.

O Cadastro possui UI React e backend próprios. A nova Consulta não substitui nem herda sua capability.

## Contrato funcional

### Identidade do módulo

- Nome/folha: **Interlojas → Consulta de Requisições**.
- Capability própria, separada de **Requisição para Exposição** e **Consulta de Compras**.
- Concessão de qualquer um desses módulos não concede a Consulta.
- Visitante é redirecionado; usuário sem grant recebe 403; administrador mantém bypass.

### Filiais

- A Filial Base do Delphi corresponde à filial ativa da sessão.
- A página fixa a filial ativa como Requisitante; não existe lookup editável.
- Usuário comum só lê/muta requisições cuja requisitante pertença a `usuariosfiliais`; administrador pode usar qualquer filial ativa válida.
- A requisitada persistida deve existir e diferir da requisitante, mas não precisa estar em `usuariosfiliais`.
- Revalidar capability, filial ativa e escopo de requisitante em página, consulta, detalhe, alteração, cancelamento e relatório.
- Nunca confiar em requisitante enviada pelo cliente para ampliar o escopo.

### Filtros compartilhados

Defina um contrato canônico reutilizado pela grid e pelo relatório:

- `data_inicial` e `data_final`, inclusivas, padrão data do servidor;
- `situacao` obrigatoriamente uma entre `A/F/D/C`;
- rótulos: `A = Aberto`, `F = Fechado`, `D = Confirmado`, `C = Cancelado`;
- data inicial não pode superar a final;
- paginação pertence somente à leitura da grid e não integra a identidade semântica dos filtros.

A página abre com hoje/hoje, Aberto e sem executar a consulta.

### Parâmetros

Resolver por `parametros_valor(descricao, filial ativa)`, usando descrições literais:

1. `USAR GRADES PRODUTOS`;
2. `REQUISICAOSUBTRAIESTOQUE`;
3. `Informar o motivo do cancelamento do pedido`;
4. `Máscara Quantidade`;
5. `Permitir requisições de produtos duplicadas`;
6. `Transferir Produtos Compostos`.

`''`, `NULL`, ausência e booleano inválido equivalem a falso. A UI recebe apenas flags de apresentação; comandos resolvem novamente os valores no servidor. Não inventar novas descrições.

## Entrega esperada

- migration/seed idempotente da folha e integração ao menu Interlojas;
- middleware/policy/service de capability próprios, aprofundando padrões existentes sem duplicar infraestrutura;
- rotas nomeadas e controller/page service base;
- Form Request/DTO imutável dos filtros;
- props Inertia/tipos TypeScript para filial ativa, defaults, situações, parâmetros e URLs;
- códigos/respostas para ausência de filial, 403 e validação 422;
- plano de compatibilidade com grants existentes, sem conceder acesso implicitamente.

## Critérios de aceite

- [ ] Capability e menu são próprios e independentes dos outros dois módulos.
- [ ] Filial ativa é fixa, autorizada no servidor e não controlável pelo payload.
- [ ] Todos os endpoints futuros têm um ponto explícito de aplicação da capability e do escopo.
- [ ] Filtros aceitam somente datas válidas e A/F/D/C, com rótulos canônicos.
- [ ] Parâmetros usam as descrições literais e a matriz de falsos.
- [ ] Snapshot da UI não é autoridade para mutações.
- [ ] Nenhum comportamento do Cadastro ou da Consulta de Compras muda.

## Matriz mínima de testes

- visitante, sem grant, grant próprio, administrador;
- grant do Cadastro e grant da Consulta de Compras não concedem a nova folha;
- menu visível/oculto conforme capability;
- filial ativa autorizada, não autorizada, ausente e inválida;
- tentativa de adulterar requisitante;
- datas válidas/inválidas/invertidas e situações A/F/D/C/valor inválido;
- verdadeiro válido e `''`/`NULL`/ausente/inválido para cada booleano relevante;
- regressão das suítes atuais de acesso/menu do Cadastro.

## Saída esperada do SpecKit

Produza spec e plano executáveis com árvore de arquivos, contratos HTTP/Inertia/TypeScript, migration/menu, fluxo de autorização, códigos de erro, sequência e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- read repository, grid e detalhe Confirmados (spec 02);
- alteração/cancelamento e regras transacionais (spec 03);
- PDF F12 (spec 04);
- criar/somar requisições ou reimplementar o Cadastro;
- separação, transferência, expedição, recebimento e alteração de `qtderecebida`;
- qualquer alteração no Delphi.
```
