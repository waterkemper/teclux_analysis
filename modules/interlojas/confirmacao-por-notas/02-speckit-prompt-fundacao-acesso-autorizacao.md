# Prompt para /speckit.specify — fundação, acesso e autorização

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a fundação Laravel de **Interlojas → Confirmação por Notas**, segunda de quatro fatias. Entregue menu/capability, filial ativa, parâmetros, contratos de filtros e o fluxo seguro que distingue **Solicitante da Confirmação** de **Autorizador da Confirmação**.

Não implemente durante `/speckit.specify`. Inspecione o Laravel atual e cite arquivos concretos. Não investigue Delphi: use como pacote autoritativo:

- `modules/interlojas/confirmacao-por-notas/pesquisa-interface-delphi.md`;
- `pesquisa-parametros-autorizacoes-delphi.md`;
- `pesquisa-padroes-laravel-chave-nfe.md`;
- decisões registradas no Wayfinder.

Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE.

## Identidade, menu e capability

- Nome/folha: **Interlojas → Confirmação por Notas**.
- Criar migration idempotente em `acessosmodulos`, folha Cloud sob `cloud.modulo.interlojas`, rota canônica idêntica à rota nomeada.
- Não reutilizar código numérico legado não localizado, não copiar grants e não conceder acesso automaticamente.
- Reutilizar o padrão atual de service de acesso, middleware, alias no bootstrap e grupo de rotas.
- Visitante segue autenticação; autenticado sem grant recebe 403; administrador mantém bypass padrão.
- Capability de acesso à folha é distinta da autorização operacional de F5.
- Proteger página, consulta, detalhes, exportação, Conferir e confirmação no backend.

## Filial e domínio

- A Filial Requisitante é a filial ativa/destino fixa da sessão.
- As notas candidatas são Notas de Saída emitidas por Filiais Requisitadas e destinadas à filial ativa, representada no legado por `dadosfiscais.cliente = filial ativa` e `tipocliente = ''L''`.
- Nunca aceitar filial efetiva, administrador, capability ou escopo do browser.
- Resolver filial via `BranchContextService`, validar existência e `usuariosfiliais`; distinguir ausente, inválida, não autorizada e válida.
- Administrador usa o comportamento padrão do projeto.

## Parâmetros do sistema

Criar manifest próprio e carregar em uma única chamada `ParameterService::getMany(..., $filialAtiva)`, preservando filial específica → global. Descrições literais:

1. `USAR GRADES PRODUTOS` — booleano, colunas de grade;
2. `Máscara Quantidade` — string, formato de quantidade;
3. `DATA CONTABIL` — data mínima;
4. `DIASNOTARETROATIVA` — limite retroativo complementar;
5. `Evento Pagto Duplicata Transferência entre empresa` — código obrigatório quando a nota gerar financeiro.

Normalizar tipos/defaults no backend. Parâmetro fiscal/financeiro ausente ou inválido deve bloquear a confirmação que dele dependa com erro de configuração; não usar zero/vazio silenciosamente. Props de UI não são autoridade para comandos.

## Filtros e estado inicial

- `data_inicial` e `data_final`, obrigatórias, `Y-m-d`, inclusivas;
- defaults hoje/hoje pela data do servidor;
- página abre sem executar consulta;
- data inicial não pode superar a final;
- bloquear datas inválidas ou fora de `DATA CONTABIL`/`DIASNOTARETROATIVA` com 422;
- Gerar/F6 e Enter na data final iniciam a consulta da spec 03;
- filial requisitante aparece somente leitura.

## Solicitante e Autorizador

- Solicitante é o usuário da sessão que inicia a operação.
- Usuário com autoridade **Confirmar Transferência por Nota** pode ser o próprio Autorizador após reautenticar sua senha.
- Solicitante sem essa autoridade precisa de outro usuário autorizado, reautenticado por login e senha.
- Credenciais devem ser verificadas server-side por fluxo de uso único vinculado ao Solicitante, filial ativa, ação, conjunto/hash das notas e prazo curto.
- Nunca aceitar `authorized_by_user_id`, flag de autorização ou administrador como verdade do browser.
- Nunca persistir, ecoar ou registrar senhas.
- Persistir/auditar IDs distintos de Solicitante e Autorizador, horário, filial, ação, alvo e resultado.
- Expiração, reutilização, troca de payload ou tentativa por usuário não autorizado falham.
- UI oferece modal de reautenticação e confirmação clara; disabled/hidden é somente UX.

## Contratos esperados

Especifique migration, rotas, middleware, page service/controller, manifest, Form Requests/DTOs, props Inertia/TypeScript, capability snapshot e desafio/autorização de uso único. As specs 03–04 consomem esses contratos sem duplicá-los.

## Critérios de aceite

- [ ] Folha/menu próprios, migration idempotente e nenhum grant implícito.
- [ ] Filial ativa vem apenas da sessão e é revalidada em todo endpoint.
- [ ] Cinco parâmetros são lidos juntos por descrição literal.
- [ ] Filtros e limites de data retornam 422 consistente.
- [ ] Capability da folha e autoridade de confirmação são separadas.
- [ ] Solicitante e Autorizador são auditados separadamente.
- [ ] Credenciais não persistem e autorização não é indicada pelo cliente.
- [ ] Desafio é de uso único, vinculado ao conteúdo e expira.

## Matriz mínima de testes

- visitante, sem grant, com grant e administrador;
- filial ausente, inválida, não autorizada e válida;
- parâmetro específico/global/ausente/inválido;
- datas válidas, invertidas, malformadas e fora dos limites;
- usuário autorizado reautenticando a própria senha;
- usuário sem autoridade com outro autorizador válido;
- senha/login inválidos, autorizador sem capability, expirado, reutilizado e payload alterado;
- adulteração de filial, solicitante, autorizador, admin e parâmetros no request;
- menu/rotas e auditoria de tentativas bem-sucedidas/falhas.

## Saída esperada

Produza spec e plano executáveis com árvore de arquivos, migration, rotas, contratos HTTP/Inertia/TypeScript, fluxo de reautenticação, códigos de erro e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- componente NF-e, entregue pela spec 01;
- SQL/grids/Conferir, spec 03;
- gravações de confirmação, spec 04;
- implementar durante esta especificação.
```
