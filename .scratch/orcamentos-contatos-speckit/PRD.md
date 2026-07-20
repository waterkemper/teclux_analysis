# Migrar a aba Contatos do Cadastro de Orçamentos

Status: ready-for-agent
Label: ready-for-agent

## Problem Statement

O Cadastro de Orçamentos Laravel não oferece a aba Contatos existente no Delphi. O Usuário precisa consultar e manter os Contatos globais da Parte Contratante sem abandonar o Orçamento, mas a implementação atual só oferece essa coleção dentro dos Cadastros completos de Clientes e Fornecedores, onde ela é gravada em lote junto com a ficha. Repetir esse modelo no Orçamento misturaria dados globais com o salvamento da proposta, criaria risco de perda concorrente e deixaria sem contrato claro as Partes Contratantes dos tipos Fornecedor e Filial.

## Solution

Adicionar ao Cadastro de Orçamentos uma aba Contatos que reutilize o painel Laravel de `contatosvfornecedores` e opere a Parte Contratante selecionada pelo par código + tipo (`C`, `F` ou `L`). A consulta acompanha o acesso ao Orçamento; Inclusão, Alteração e Exclusão exigem a Permissão de atualização do Cadastro correspondente. Cada mutação é confirmada e persistida imediatamente por contrato próprio, independentemente do Salvar Orçamento, com validação, chave composta e controle otimista de concorrência. A aba reage com segurança à troca de Parte Contratante e não cria nem copia Contatos para o Orçamento.

## User Stories

1. Como Usuário do Cadastro de Orçamentos, quero consultar os Contatos da Parte Contratante selecionada, para utilizar dados atualizados durante a negociação.
2. Como Usuário, quero que a aba use código e tipo da Parte Contratante, para não misturar Cliente, Fornecedor e Filial com códigos iguais.
3. Como Usuário, quero acessar Contatos de tipos `C`, `F` e `L`, para respeitar as Partes Contratantes permitidas pelo Orçamento.
4. Como Usuário, quero consultar Contatos assim que selecionar uma Parte Contratante existente, mesmo antes de salvar o Orçamento.
5. Como Usuário, quero que nome livre não habilite a manutenção de Contatos, para evitar vínculo com uma entidade inexistente.
6. Como Usuário, quero ver claramente que os Contatos pertencem ao Cadastro global da Parte Contratante, para compreender o alcance das alterações.
7. Como Usuário, quero ver os Contatos em ordem alfabética por nome, para localizá-los com rapidez.
8. Como Usuário, quero visualizar nome, telefone, ramal, e-mail e indicadores operacionais na grade, para comparar os registros.
9. Como Usuário, quero visualizar cargo, observações e demais dados do Contato selecionado no painel de detalhes.
10. Como Usuário, quero um estado vazio explícito, para distinguir ausência de Contatos de erro de carregamento.
11. Como Usuário, quero estados de carregamento, erro e retry, para recuperar a aba sem recarregar o Orçamento.
12. Como Usuário autorizado, quero incluir um Contato e confirmar sua gravação separadamente, para não depender do Salvar Orçamento.
13. Como Usuário autorizado, quero alterar um Contato existente e salvar somente esse registro, para evitar sobrescrever mudanças de terceiros em toda a coleção.
14. Como Usuário autorizado, quero excluir um Contato após confirmação, para evitar remoção acidental.
15. Como Usuário, quero receber mensagens de validação em português, para corrigir o registro sem perder os dados informados.
16. Como Usuário, quero que o nome do Contato seja obrigatório e que e-mail, telefone, cargo e demais campos sigam as regras já usadas no Cadastro de Clientes.
17. Como Usuário, quero que uma mutação bem-sucedida atualize somente a aba, para preservar todos os dados ainda não salvos do Orçamento.
18. Como Usuário, quero que cancelar uma edição descarte apenas o rascunho do Contato, sem alterar Orçamento ou Cadastro global.
19. Como Usuário, quero confirmação ao trocar a Parte Contratante com um rascunho não salvo, para não perder alterações por engano.
20. Como Usuário, quero que a aba passe a mostrar a nova Parte Contratante após a troca, para não editar o cadastro anterior por engano.
21. Como Usuário, quero que operações em andamento mantenham o contexto original e não contaminem a Parte Contratante recém-selecionada.
22. Como Usuário, quero ser avisado quando outro Usuário alterar ou excluir o mesmo Contato antes de mim, para não sobrescrever mudanças silenciosamente.
23. Como Usuário sem Permissão de alterar o Cadastro da Parte Contratante, quero consultar os Contatos em modo somente leitura.
24. Como Usuário com Permissão de alterar Orçamento mas sem Permissão sobre Cliente, Fornecedor ou Filial, quero que o CRUD global permaneça bloqueado.
25. Como Usuário autorizado sobre Cliente, quero manter seus Contatos a partir do Orçamento sem abrir a ficha completa.
26. Como Usuário autorizado sobre Fornecedor, quero manter seus Contatos com as mesmas regras e interface aplicadas ao Cliente.
27. Como Usuário autorizado sobre Filial, quero manter seus Contatos pelo mesmo contrato genérico, sem solução especial incompatível.
28. Como equipe de produto, queremos reutilizar o painel de Contatos existente, para evitar duas experiências e duas regras de validação.
29. Como equipe de manutenção, queremos preservar o modo em lote dos Cadastros existentes, para que a nova integração não cause regressões.
30. Como equipe de manutenção, queremos um serviço de mutação pontual e seguro, para não reutilizar sincronizações destrutivas de coleção em operações individuais.
31. Como equipe de auditoria, queremos que as alterações continuem registradas pelos mecanismos existentes da tabela, sem uma trilha paralela específica do Orçamento.

## Implementation Decisions

- Contato é entidade global da Parte Contratante em `contatosvfornecedores`; o Orçamento não recebe cópia, snapshot ou vínculo próprio de Contato.
- A identidade completa de um Contato é composta por tipo da Parte Contratante, código da Parte Contratante e código do Contato. Toda leitura e mutação deve usar os três valores.
- A aba aparece ou se torna operacional somente com código positivo e tipo válido `C/F/L`. Nome livre não é suficiente.
- A consulta exige acesso ao Cadastro de Orçamentos. Mutação exige adicionalmente a capacidade `update` da entidade correspondente: Cliente para `C`, Fornecedor para `F` e Filial para `L`.
- O servidor valida a existência da Parte Contratante na tabela correspondente e nunca confia apenas nos rótulos enviados pelo browser.
- A UI reutiliza o painel compartilhado já empregado nos Cadastros de Clientes e Fornecedores. A extensão para modo persistência imediata deve ser opcional, preservando o comportamento batch atual dos consumidores existentes.
- No modo Orçamento, Inclusão e Alteração usam rascunho local com ação explícita Salvar/Cancelar; não fazer autosave a cada tecla. Exclusão é imediata após confirmação.
- A lista é carregada sob demanda e ordenada alfabeticamente por nome do Contato, com código como desempate estável.
- O contrato preserva o conjunto de campos suportado pelo painel Laravel: nome, telefone/DDD/ramal, segundo telefone, e-mail, cargo, observações, data de nascimento, sexo e indicadores de marketing, NF-e e boleto. Campos não renderizados pelo painel não precisam ser introduzidos nesta entrega.
- As validações seguem o contrato consolidado do Cadastro de Clientes: nome obrigatório até 40 caracteres; DDD e telefone válidos quando informados; ramal até 10; e-mail RFC até 128; observações até 1000; cargo existente; data válida; sexo restrito ao catálogo; indicadores booleanos.
- Cada resposta de leitura devolve um token opaco de versão por registro. Alteração e Exclusão exigem esse token e recusam conflito sem mutar dados, retornando o estado atual para recuperação.
- Inclusão aloca código com segurança dentro da chave tipo+Parte Contratante, em transação, evitando colisão concorrente. Não presumir que código isolado seja globalmente único.
- Não reutilizar operações de sincronização da coleção completa para mutação pontual; isso poderia excluir ou sobrescrever registros concorrentes.
- Ao trocar a Parte Contratante, rascunho sujo exige confirmação. Durante save/delete, bloquear nova troca ou ignorar respostas fora do contexto; concluída a troca, limpar seleção/erros e carregar a nova coleção.
- Sucesso atualiza somente a coleção de Contatos. Falha ou cancelamento não altera o Orçamento nem a coleção confirmada.
- Não há mudança de schema prevista. O controle de versão pode usar mecanismo opaco compatível com os bancos suportados, sem expor detalhes internos ao cliente.
- As triggers de Auditoria existentes continuam como fonte da trilha de alterações; não criar Auditoria duplicada vinculada ao Orçamento.

## Testing Decisions

- O seam principal é o contrato HTTP funcional da coleção e das mutações de Contatos no contexto do Cadastro de Orçamentos, verificando autorização, validação, concorrência e persistência observável.
- Testar a chave composta com códigos iguais em Partes Contratantes ou tipos diferentes, provando isolamento `C/F/L`.
- Testar listagem alfabética, vazio, entidade inexistente e tipos inválidos.
- Testar a matriz de Permissões: acesso ao Orçamento para leitura e Policies de Cliente, Fornecedor e Filial para mutações.
- Testar Inclusão, Alteração e Exclusão pontuais, assegurando que Contatos não envolvidos permaneçam intactos.
- Testar payload adulterado e tentativa de operar Contato pertencente a outra Parte Contratante.
- Testar conflito otimista em Alteração e Exclusão e colisão concorrente na Inclusão.
- Usar como prior art os testes de Contatos do Cadastro de Clientes, os testes do Cadastro de Fornecedores e os testes funcionais do Cadastro de Orçamentos.
- Adicionar testes de frontend apenas para comportamentos não observáveis no seam HTTP: modo imediato do painel, Salvar/Cancelar, troca da Parte Contratante com dirty state, estados carregando/vazio/erro e preservação do formulário do Orçamento.
- Manter regressão explícita dos consumidores batch do painel nos Cadastros de Clientes e Fornecedores.

## Out of Scope

- Alterar o modelo de seleção de Parte Contratante do Orçamento.
- Criar Cliente, Fornecedor ou Filial a partir de nome livre.
- Copiar ou versionar Contatos por Orçamento.
- Salvar Contatos junto com o Orçamento.
- Redesenhar integralmente os Cadastros de Clientes, Fornecedores ou Filiais.
- Migrar Atendimentos, histórico de interações, mala direta ou campanhas.
- Corrigir nesta entrega todas as diferenças internas entre o batch sync de Clientes e Fornecedores.
- Adicionar migration ou tabela nova sem evidência de necessidade técnica inevitável.
- Implementar alterações neste workspace de análise.

## Further Notes

- CONFIRMADO no Delphi: a aba filtra pelo par `codigovfornecedores + tipovfornecedores`, ordena por nome e oferece Inclusão, Alteração e Exclusão por Cadastro modal.
- CONFIRMADO no Delphi: a coleção usa cached updates e só é perpetrada junto com o Salvar Orçamento; persistência imediata é uma DECISÃO NOVA.
- POSSÍVEL BUG LEGADO: a aba pode ficar visível apenas por o campo não ser nulo, e o formulário retorna sucesso mesmo em alguns caminhos onde campos obrigatórios podem falhar. Não reproduzir.
- CONFIRMADO no Laravel: existe painel compartilhado para `C/F/L`, embora consumidores concretos localizados sejam Cliente e Fornecedor.
- CONFIRMADO no Laravel: Clientes faz sync incremental em lote e protege o conjunto pela revisão do Cliente; Fornecedores apaga/reinsere a coleção e ignora a persistência no SQLite.
- NÃO LOCALIZADO no Laravel: consumidor concreto do painel para Filial, endpoints independentes por Contato ou aba Contatos em Orçamentos.
- DIVERGENTE: o painel Laravel possui campos adicionais e observações até 1000 caracteres; a nova aba deve seguir o contrato Laravel consolidado, não reduzir ao subconjunto visual do Delphi.
