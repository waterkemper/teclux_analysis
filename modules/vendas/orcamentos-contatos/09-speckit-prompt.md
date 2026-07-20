# Prompt para `/speckit.specify`

Copie o conteúdo abaixo para o Cursor no checkout Laravel de implementação:

```text
/speckit.specify Migrar a aba Contatos do Cadastro de Orçamentos do ERP tecLUX, reutilizando o Cadastro de Contatos já existente no Laravel.

OBJETIVO

Adicionar ao Cadastro de Orçamentos uma aba Contatos que permita consultar, incluir, alterar e excluir os Contatos globais da Parte Contratante selecionada. A aba deve reutilizar a interface e as regras Laravel já usadas nos Cadastros de Clientes e Fornecedores, mas suas mutações devem ser persistidas imediatamente e de forma independente do botão Salvar Orçamento.

Não implemente uma coleção de Contatos do Orçamento. Cada registro continua pertencendo à Parte Contratante em `contatosvfornecedores` e qualquer mutação deve refletir imediatamente em todos os módulos que consultam essa entidade.

VOCABULÁRIO E DECISÕES DE DOMÍNIO

- Orçamento é uma proposta comercial.
- Parte Contratante é a entidade vinculada ao Orçamento no papel de adquirente. Pode ser Cliente (`C`), Fornecedor (`F`) ou Filial (`L`) conforme o Parâmetro do Sistema e o registro persistido.
- Contato é um registro global da Parte Contratante em `contatosvfornecedores`. Não é Atendimento, histórico de interação nem dado pertencente ao Orçamento.
- A identidade completa do Contato é a chave composta: tipo da Parte Contratante + código da Parte Contratante + código do Contato.
- Inclusão, Alteração e Exclusão feitas nesta aba modificam o Cadastro global da Parte Contratante.
- Nome livre no Orçamento não representa Parte Contratante identificada e não permite consultar ou manter Contatos.

DECISÕES JÁ CONFIRMADAS

1. A migração deve manter CRUD completo, não apenas consulta.
2. Deve abranger `C`, `F` e `L`, usando o `tipocliente` efetivamente vinculado ao Orçamento.
3. Os Contatos permanecem globais; não copiar, duplicar ou criar snapshot no Orçamento.
4. A aba pode operar assim que houver código positivo + tipo válido da Parte Contratante, inclusive antes de salvar um Orçamento novo.
5. Consultar Contatos acompanha o acesso ao Cadastro de Orçamentos.
6. Incluir, alterar e excluir exigem a Permissão de atualização do Cadastro correspondente à Parte Contratante. Permissão para alterar Orçamento não concede mutação global.
7. Cada mutação deve ser persistida imediatamente por operação própria, com validação e controle de concorrência, sem depender do Salvar Orçamento.

ESTADO ATUAL CONFIRMADO NO DELPHI

- A página `&8 - Contatos` é exibida quando o campo de Cliente do Orçamento não está nulo.
- A consulta lê `contatosvfornecedores`, faz left join com `cargos`, filtra por `codigovfornecedores = cliente` e `tipovfornecedores = tipocliente`, e ordena por nome do Contato.
- A grade mostra nome, DDD, telefone, ramal, marketing, NF-e, boleto e e-mail; o painel lateral mostra cargo e observações.
- Inclusão abre o Cadastro de Contatos em modo novo; duplo clique e Ctrl+tecla de edição abrem o registro corrente; Exclusão exige confirmação.
- O Cadastro modal edita nome, telefone/DDD/ramal, e-mail, cargo, observações e os indicadores marketing/NF-e/boleto. Nome é o campo central; e-mail é validado.
- Um registro novo recebe automaticamente código e tipo da Parte Contratante e indicadores booleanos falsos.
- Ao trocar código ou tipo da Parte Contratante, a consulta é refeita para o novo par.
- Apesar de os Contatos serem globais, o Delphi usa cached updates. Alterações e Exclusões só são perpetradas na transação que salva o Orçamento.
- NÃO reproduzir possíveis bugs legados: visibilidade baseada apenas em null, abertura de edição sem guarda explícita para lista vazia, retorno de sucesso do modal mesmo em caminhos ambíguos de campos obrigatórios e acoplamento do commit global ao Salvar Orçamento.

ESTADO ATUAL CONFIRMADO NO LARAVEL

- Existe um painel reutilizável de `contatosvfornecedores`, com contrato genérico para `C/F/L`, mestre/detalhe, inclusão e remoção local, confirmação de remoção, grade e painel de detalhes.
- O painel oferece nome, telefone/DDD/ramal, segundo telefone, e-mail, cargo, observações, data de nascimento, sexo e indicadores de marketing, NF-e e boleto.
- No Cadastro de Clientes, a coleção é carregada por Cliente e gravada em lote junto com a ficha. O sync é incremental e a revisão otimista do Cliente impede mutação quando a ficha está stale.
- No Cadastro de Fornecedores, o mesmo painel é reutilizado para tipo `F`, mas o repositório atual apaga e reinsere a coleção no PostgreSQL e ignora essa persistência no SQLite.
- Não foi localizado consumidor concreto do painel para Filial `L`.
- Não existem endpoints independentes de list/create/update/delete para um único Contato.
- O Cadastro de Orçamentos não possui aba Contatos, props de Contatos, consulta ou mutações. Há apenas um fieldset de contato no cabeçalho com telefone/e-mail da Parte Contratante, que não substitui a coleção desta feature.
- O frontend de Orçamentos reconhece principalmente `C/F`; esta entrega deve tornar a aba genericamente segura para `L` sem ampliar, por conta própria, o fluxo de seleção de Parte Contratante.

CLASSIFICAÇÃO DAS LACUNAS

- CONFIRMADO: falta toda a integração da aba no Cadastro de Orçamentos.
- CONFIRMADO: falta um contrato de persistência pontual independente da ficha mestre.
- CONFIRMADO: Clientes e Fornecedores possuem estratégias batch diferentes; nenhuma delas deve ser chamada para mutar um único Contato a partir do Orçamento.
- NÃO LOCALIZADO: integração concreta de Contatos no Cadastro de Filiais.
- DIVERGENTE: o Laravel consolidou campos adicionais, segundo telefone, nascimento, sexo e observações até 1000 caracteres. A aba deve seguir o painel Laravel, não reduzir ao subconjunto Delphi.
- DIVERGENTE: a nova gravação será imediata; o Delphi aguarda Salvar Orçamento.
- DECISÃO NOVA: usar autorização da Parte Contratante para mutações e acesso do Orçamento para leitura.
- DECISÃO NOVA: usar controle otimista por Contato e mutações pontuais, sem sincronizar a coleção inteira.
- POSSÍVEL BUG LEGADO: condições permissivas de visibilidade e resultado do modal. Não transformar em requisito.

CONTRATO FUNCIONAL DA ABA

1. Incorporar uma aba `Contatos` ao conjunto de abas do Cadastro de Orçamentos.
2. Torná-la visível/operacional somente quando o formulário possuir código positivo e tipo válido `C`, `F` ou `L` da Parte Contratante. Apenas nome livre não habilita a aba.
3. Se a Parte Contratante for removida enquanto Contatos estiver ativa, limpar o contexto e navegar para uma aba válida do Cadastro sem consultar código zero.
4. A Situação do Orçamento e o fato de ele ainda não estar salvo não bloqueiam a aba: Contatos são globais. A única elegibilidade de contexto é Parte Contratante identificada + acesso ao Orçamento.
5. Exibir aviso visível de que os dados são compartilhados com o Cadastro da Parte Contratante e que alterações afetam outros módulos.
6. Carregar a coleção sob demanda na primeira ativação da aba e novamente quando mudar código ou tipo da Parte Contratante.
7. Filtrar sempre no servidor pelo par código+tipo e ordenar alfabeticamente por nome do Contato, com código como desempate estável.
8. Nunca carregar apenas por código, porque códigos de Cliente, Fornecedor e Filial podem coincidir.
9. Reutilizar o painel compartilhado de Contatos. Não copiar seu markup, regras de telefone, catálogos ou validações para um segundo componente.
10. Preservar o modo batch atual dos Cadastros de Clientes e Fornecedores. Introduzir um modo opcional de persistência imediata ou um adapter do painel para o host Orçamentos.
11. No modo Orçamento, mostrar a coleção confirmada e editar um rascunho por vez. Inclusão/Alteração somente persistem após ação explícita Salvar; não fazer autosave a cada tecla.
12. Oferecer Cancelar para descartar somente o rascunho do Contato.
13. Exclusão exige confirmação citando o nome quando disponível e persiste imediatamente.
14. Após sucesso, atualizar somente a coleção/registro afetado e manter todos os dados, aba, posição e dirty state do Orçamento.
15. Exibir estado de carregamento, estado vazio (`Nenhum contato cadastrado para esta parte contratante.`), erro em português e ação de tentar novamente.
16. Durante uma mutação, impedir submit duplicado e desabilitar apenas os controles conflitantes.

CAMPOS E VALIDAÇÕES

Usar o contrato já consolidado pelo painel/Cadastro de Clientes:

- `contato`: obrigatório, string, máximo 40;
- telefone principal: DDD opcional entre 1 e 99 e número positivo quando informado;
- ramal: opcional, máximo 10;
- segundo telefone: DDD/número opcionais com as mesmas regras;
- e-mail: opcional, RFC válido, máximo 128 e normalizado conforme padrão existente;
- cargo: opcional, código existente no catálogo de Cargos;
- observações: opcional, máximo 1000;
- data de nascimento: opcional, data válida;
- sexo: opcional, limitado a `M`, `F` ou `E`;
- `receberemailmarketing`, `enviar_nfe` e `enviar_boleto`: booleanos, false na Inclusão;
- código, tipo e identificação da Parte Contratante são definidos pelo contexto e nunca editáveis no formulário.

Não reintroduzir no Orçamento campos que existam apenas no payload interno, mas não sejam renderizados pelo painel compartilhado atual, salvo necessidade comprovada na especificação.

CONTRATOS DE LEITURA E MUTAÇÃO

Definir contratos HTTP JSON para:

1. listar Contatos de uma Parte Contratante `C/F/L`;
2. incluir um Contato;
3. alterar um Contato identificado pela chave composta;
4. excluir um Contato identificado pela chave composta.

Requisitos desses contratos:

- validar tipo estritamente em `C/F/L` e código mestre positivo;
- confirmar que a Parte Contratante existe na tabela correspondente;
- escopar toda query por `tipovfornecedores`, `codigovfornecedores` e `codigo` do Contato;
- nunca aceitar troca de mestre/tipo/código por campos do body;
- devolver dados normalizados no mesmo shape consumido pelo painel;
- devolver capacidades de mutação ou props equivalentes, derivadas da Policy correta;
- usar 401 para não autenticado, 403 para falta de Permissão, 404 para mestre/Contato inexistente no escopo, 422 para validação e 409 para conflito concorrente;
- usar mensagens em português;
- não executar sync/delete-all da coleção para alterar ou excluir um único registro.

AUTORIZAÇÃO

- Listagem: exige acesso ao Cadastro de Orçamentos, equivalente à Policy que protege essa tela.
- Mutação de `C`: exige `ClienteCadastroPolicy::update` para o Cliente existente.
- Mutação de `F`: exige `FornecedorCadastroPolicy::update` para o Fornecedor existente.
- Mutação de `L`: exige `FilialCadastroPolicy::update` para a Filial existente.
- Permissão de atualizar o Orçamento não substitui nenhuma dessas Policies.
- A UI deve ficar somente leitura quando o Usuário puder acessar Orçamentos, mas não puder atualizar o Cadastro da Parte Contratante.
- O servidor é a autoridade final; esconder/desabilitar controles não substitui autorização dos endpoints.

CONCORRÊNCIA E IDENTIDADE

- A PK legada é composta; tratar `codigo` isolado como insuficiente.
- Cada linha da listagem deve trazer um token opaco de versão.
- Alteração e Exclusão devem exigir a versão esperada. Se a linha mudou ou foi excluída desde a leitura, não persistir e responder 409 com mensagem clara e dados suficientes para recarregar.
- A Inclusão deve alocar o próximo código com segurança transacional dentro do par tipo+mestre, evitando colisões entre Usuários concorrentes.
- Não exigir mudança de schema apenas para o token: escolher no plano técnico uma estratégia opaca compatível com os bancos suportados e com os padrões existentes.
- Mutações devem ocorrer em transação e preservar todos os Contatos não envolvidos.
- As triggers de Auditoria existentes continuam responsáveis pelo Log de Auditoria. Não criar histórico paralelo ligado ao Orçamento.

TROCA DA PARTE CONTRATANTE

- Sem rascunho sujo: trocar código/tipo cancela a leitura anterior, limpa seleção/erros e carrega a nova coleção.
- Com rascunho sujo: pedir confirmação para descartar. Se o Usuário cancelar, preservar a Parte Contratante anterior ou impedir a troca, de forma coerente com o estado do formulário.
- Com mutação em andamento: impedir a troca até conclusão ou garantir cancelamento/isolamento seguro. Uma resposta tardia do contexto antigo nunca pode aparecer na coleção nova.
- Toda mutação captura e envia explicitamente o contexto em que foi iniciada; não usar valores mutáveis do formulário após o início da requisição.

CRITÉRIOS DE ACEITE

1. Dado Orçamento novo com Cliente `C` identificado, quando abrir Contatos antes de salvar, então a coleção desse Cliente é carregada.
2. Dado apenas nome livre, a aba não consulta nem permite CRUD e orienta a identificar a Parte Contratante.
3. Dados códigos iguais para Cliente e Fornecedor, cada contexto mostra somente seus próprios Contatos.
4. Dada Parte Contratante `L` existente, a listagem e a autorização usam Filial e tipo `L` sem cair no fluxo de Cliente.
5. Dado Usuário com acesso a Orçamentos e sem update da entidade, a lista é visível em modo somente leitura e endpoints de mutação retornam 403.
6. Dado Usuário autorizado, Inclusão válida cria apenas um Contato para o par código+tipo correto, com indicadores false por padrão.
7. Inclusão com nome vazio, e-mail inválido, cargo inexistente ou campo acima do limite retorna 422, mantém rascunho e não persiste.
8. Alteração válida modifica somente o Contato da chave composta informada e atualiza a aba sem salvar/recarregar o Orçamento.
9. Tentativa de alterar usando código de Contato pertencente a outro mestre/tipo retorna 404 e não modifica nenhum registro.
10. Exclusão exige confirmação; ao confirmar, remove somente a chave composta correta e atualiza a aba.
11. Cancelar Inclusão/Alteração/Exclusão não persiste e não altera a coleção confirmada.
12. Dois Usuários alterando o mesmo Contato: o segundo com token stale recebe 409 e não sobrescreve o primeiro.
13. Alteração stale após Exclusão por outro Usuário recebe conflito/ausência controlada e não recria o registro.
14. Inclusões concorrentes para a mesma Parte Contratante recebem códigos distintos sem colisão.
15. Trocar de Cliente para Fornecedor com aba aberta descarta a lista anterior e mostra somente o novo contexto.
16. Trocar com rascunho sujo solicita confirmação; cancelar preserva o trabalho/contexto.
17. Resposta tardia da consulta anterior não substitui a lista da Parte Contratante atual.
18. Falha de rede mostra erro e retry sem perder os demais dados do Orçamento.
19. Orçamento cancelado ou convertido continua permitindo consultar Contatos e permite mutação se a Policy da Parte Contratante autorizar, pois a entidade é global.
20. Os Cadastros de Clientes e Fornecedores continuam usando o painel em modo batch sem regressão de payload, validação ou dirty state.
21. Nenhuma mutação de Contato marca o formulário de Orçamento como alterado nem é reenviada no payload do Salvar Orçamento.

DECISÕES DE TESTE

- Seam principal: testes funcionais dos contratos HTTP de list/create/update/delete, observando respostas, autorização, isolamento da chave composta, conflitos e persistência real.
- Usar como prior art os testes de Contatos do Cadastro de Clientes, Cadastro de Fornecedores e Cadastro de Orçamentos.
- Cobrir matriz `C/F/L`, incluindo códigos mestres coincidentes.
- Cobrir separadamente acesso de leitura e update das três Policies.
- Provar que mutação pontual não remove nem sobrescreve outros Contatos.
- Cobrir validações do painel e tentativas de adulterar mestre/tipo/código.
- Cobrir token stale e alocação concorrente.
- Adicionar testes de frontend somente para o que o seam HTTP não observa: integração da aba, modo imediato do painel, Salvar/Cancelar, dirty state, troca de contexto, resposta tardia e preservação do formulário do Orçamento.
- Manter testes de regressão dos consumidores batch de Clientes e Fornecedores.

FORA DE ESCOPO

- Alterar como o Orçamento seleciona ou permite Partes Contratantes `C/F/L`.
- Criar Cliente, Fornecedor ou Filial implicitamente.
- Criar cópia, snapshot ou tabela de Contatos do Orçamento.
- Salvar Contatos junto com o Orçamento.
- Migrar Atendimentos, histórico de ligações, mala direta ou campanhas.
- Redesenhar integralmente os Cadastros mestres.
- Corrigir todas as diferenças internas do batch sync de Fornecedores fora do necessário para não regredir a aba existente.
- Criar migrations ou novas tabelas sem necessidade técnica comprovada.

EVIDÊNCIAS PARA CONSULTA DURANTE A ESPECIFICAÇÃO

- Delphi UI e handlers: `apps/vendas/fmorcamentos.pas/.dfm`, aba `tstContatos`, grade `dbgContatos`, ações `AcionaCadastroContatos` e `ExcluirContatosClientes`.
- Delphi query e transação: `apps/vendas/dmorcamentos.pas/.dfm`, `qryContatosClientes`, seus eventos e a lista perpetrada no Salvar Orçamento.
- Delphi formulário compartilhado: `repositorio/fmcadastrocontatos.pas/.dfm`.
- Laravel painel compartilhado: componente `ErpContatosVfornecedoresPanel`.
- Laravel Cliente: controller/request/action/repositório do Cadastro de Clientes e testes funcionais de Contatos.
- Laravel Fornecedor: aba de Contatos, requests, service/repositório e testes do Cadastro de Fornecedores.
- Laravel autorização: Policies de Cliente, Fornecedor, Filial e Orçamento.
- Laravel alvo: Cadastro de Orçamentos e seus tipos/props atuais.

Produza uma especificação funcional completa, testável e independente de detalhes acidentais do Delphi. Preserve as decisões acima, não converta bugs ou limitações legadas em requisitos e prefira generalizar o painel/contrato existente a duplicar código. Registre questão aberta somente quando não for possível resolvê-la pelas decisões ou pelo código existente.
```
