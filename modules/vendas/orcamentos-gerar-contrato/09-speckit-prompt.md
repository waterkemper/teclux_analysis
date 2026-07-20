# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para revisar e completar no Laravel a geração de Contrato a partir do Cadastro de Orçamentos.

Não implemente nesta etapa. O Laravel já possui uma implementação parcial; não crie um segundo fluxo. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o checkout Laravel. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo código acessível e cite evidência concreta do checkout. Não altere, complete ou descarte regras Delphi por inferência. Se o pacote fornecido for insuficiente ou ambíguo, registre uma DÚVIDA/BLOQUEIO objetiva para investigação no workspace de análise. Classifique descobertas Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE; preserve as classificações POSSÍVEL BUG LEGADO e DECISÃO NOVA já fornecidas.

## Limite desta entrega

A entrega termina quando:

- o Contrato foi gerado e persistido corretamente;
- o Orçamento foi vinculado e atualizado;
- integrações essenciais foram concluídas ou agendadas de forma durável;
- o número do Contrato aparece persistentemente na própria tela do Orçamento;
- o botão de geração fica indisponível.

Não existe Cadastro de Contratos Laravel disponível para esta entrega. Não redirecionar para Cadastro ou Consulta de Contratos. Não faturar, reservar, imprimir nem editar o Contrato.

## Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries, forms, FastReport ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir do botão Contrato/F7, `TdtmOrcamentos.GerarContrato`, ancestrais, datasets, numeração, Cliente, Qualidade da Venda, estoque, Planos, entrega, Atendimento, vínculo Cliente–Contrato, Questionário, Parâmetros do Sistema, Permissões, Autorizações, triggers e Auditoria.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações e sem exigir que o Cursor as reconfirme no código Delphi.
- Inspecione o checkout Laravel para confirmar o estado atual, localizar os seams existentes e construir a matriz de lacunas frente ao pacote fornecido.
- Imagens ou comportamento visual não substituem evidência funcional.
- Quando uma decisão depender de informação Delphi ausente, não invente nem deduza: registre exatamente a pergunta que deve retornar ao workspace de análise.

## Investigação Laravel obrigatória

Analise o fluxo existente:

- botão e habilitação no Cadastro de Orçamentos;
- request, controller e policy;
- `GerarContratoOrcamentoService`;
- repository legado de geração;
- sequence/função do número;
- repositories de Orçamento, Cliente, Produtos, séries, Serviços, Planos e Parcelas;
- manifest/resolução de Parâmetros do Orçamento;
- autenticação sensível e Qualidade da Venda;
- Atendimento e aplicação de Questionário já implementados/especificados;
- flash/Inertia e exibição do número;
- testes Feature existentes.

## Evidência Delphi confirmada

### Entrada e pré-condições

- O botão fica habilitado quando o Orçamento está gravado e em Situação `A`.
- Se há entrega e o endereço está incompleto, a geração é bloqueada e o Usuário é direcionado aos dados de endereço.
- O Delphi pede confirmação para gerar o Contrato.
- Quando `Produtos no orçamento com estoque` está ativo, qualquer Produto `N — Não atendido` ou `P — Parcialmente atendido` bloqueia a geração.
- A geração chama autorização de Qualidade da Venda/Analista de Crédito.
- É necessário um Plano: se há exatamente um, ele é usado; se há vários, usa o marcado; sem Plano válido, bloqueia.
- Os vencimentos das Parcelas do Plano são validados.
- Quando o Orçamento não possui Cliente, o Delphi cria um Cliente e o atribui antes de continuar.
- Antes de criar o Contrato, registra/vincula Atendimento com contexto `OrcamentoParaContrato`.

### Contrato

- O número vem da função/sequence legada de próximo Contrato.
- O Contrato nasce em `O — Orçado`.
- A Filial de venda, Cliente/tipo, nome, vendedor, agente, Plano e data são preenchidos.
- São copiados frete, seguro, crédito de troca, valor à vista/prazo, desconto financeiro, desconto geral/percentual, cashback e cupom.
- São copiadas observações, montagem, emprego/cargo e demais dados comerciais.
- São copiados endereço, documento, contatos, atributos cadastrais/fiscais e dados do Cliente/Orçamento.
- São copiados dados de entrega, destinatário, transportadora/serviço, prazo e Filial de retirada.

### Produtos, séries, Serviços e Parcelas

- Todos os Produtos são copiados em ordem.
- O Delphi copia Produto digitado/visual, Filial, sequência, quantidade, preços, descrição de preço, montagem, entrega, datas, previsão, vendedor, descontos, cashback, cupom, IPI e classificação fiscal.
- Quantidade `vendido` do Produto do Orçamento passa a refletir a quantidade convertida.
- Séries selecionadas são copiadas para o Contrato.
- Serviços são copiados com código, quantidade, ISS, valor e complemento.
- Parcelas são copiadas com sequência, vencimento, valor, parcela de origem, forma de pagamento, tipo de recebimento e flags aplicáveis.

### Fechamento

- O Orçamento muda para `T` e recebe o número do Contrato.
- Cliente, Contrato, Produtos, séries, Serviços, Parcelas, Orçamento e datasets relacionados são persistidos como um compromisso coordenado.
- Depois, o Delphi executa o vínculo Cliente–Contrato.
- Após persistência, chama a Enquete/Questionário com Cliente, tipo, Orçamento e Contrato.
- Em sucesso, o Delphi abre o Cadastro de Contratos; esta navegação está fora do escopo Laravel atual.

## Estado Laravel confirmado

- Já existe endpoint de gerar Contrato, policy, service, repository, botão e teste Feature básico.
- A UI já exige Orçamento persistido, aberto, Plano selecionado e validade não vencida para habilitar o botão.
- O service revalida Situação, validade, existência de Produtos e exatamente um Plano selecionado.
- A geração atual ocorre em transação e devolve número por flash.
- DIVERGENTE: cria Contrato em `A`, não `O`.
- DIVERGENTE: o Contrato atual recebe somente número, Orçamento, Situação e poucos campos do Plano.
- DIVERGENTE: Produtos recebem somente Contrato, Produto e Filial.
- DIVERGENTE: Parcelas recebem somente sequência, vencimento e valor.
- NÃO LOCALIZADO no gerador atual: Cliente obrigatório/criação, endereço, dados cadastrais, entrega, frete completo, Qualidade da Venda, estoque parametrizado, séries, Serviços, Atendimento, vínculo Cliente–Contrato, marcação vendida e Questionário.
- O service atual pode preparar redirecionamento para Consulta de Contratos; remover essa intenção desta entrega.

## Decisões obrigatórias

1. Completar o fluxo existente, sem gerador paralelo.
2. Contrato nasce em `O — Orçado`.
3. Orçamento passa a `T` e recebe o número.
4. Geração é idempotente: Orçamento vinculado retorna o mesmo número e nunca gera outro.
5. Botão fica desabilitado quando existe Contrato.
6. Orçamento sem Cliente cria/vincula Cliente se os dados obrigatórios forem suficientes; caso contrário, bloqueia com campos faltantes.
7. Preservar Atendimento e Questionário conforme os specs já elaborados.
8. Não redirecionar. Atualizar a tela, exibir o número e mensagem de sucesso.
9. Efeitos essenciais são atômicos; Questionário pós-commit é durável e retomável, sem desfazer o Contrato.

## Comando autoritativo de geração

Defina um único comando de aplicação que:

1. autorize a operação;
2. bloqueie a linha do Orçamento para atualização;
3. detecte vínculo existente e retorne idempotentemente;
4. recarregue todo estado persistido;
5. valide Situação, validade e revisão;
6. valide endereço de entrega quando aplicável;
7. resolva Parâmetros pela Filial efetiva;
8. valide Produtos/estoque quando parametrizado;
9. valide Plano único selecionado e vencimentos;
10. calcule/autorize Qualidade da Venda;
11. resolva ou crie Cliente;
12. reserve/obtenha número do Contrato com segurança;
13. crie Contrato e agregado completo;
14. integre Atendimento essencial;
15. atualize Orçamento e Produtos;
16. persista/audite uma única vez;
17. faça commit;
18. crie/retome Questionário pós-commit;
19. retorne número e estado atualizado.

Não confie apenas nas condições de habilitação da UI.

## Cliente obrigatório

Contrato só pode existir com Cliente.

Se o Orçamento já possui Cliente/tipo válido, reutilize-o.

Se não possui:

- derive candidato dos dados cadastrais do Orçamento;
- valide campos obrigatórios segundo pessoa física/jurídica/estrangeira e regras existentes;
- procure identidade existente por documento/chaves seguras antes de incluir;
- não deduplique somente por nome;
- crie Cliente e vincule o Orçamento dentro do compromisso transacional;
- evite duplicidade em retry e concorrência;
- registre Auditoria.

Respeite a decisão de domínio fornecida de que, no Orçamento, tipos `F` ou `L` também são tratados como Cliente quando permitidos pelo Parâmetro do Sistema. Verifique no Laravel a política já implementada para esses tipos. Se o pacote de evidências e o código Laravel não determinarem com segurança a conversão, registre a política exata como DÚVIDA/BLOQUEIO para o workspace de análise, sem inventar entidade duplicada.

## Qualidade da Venda

Reutilize o serviço de operação sensível. Quando a Qualidade calculada exigir e diferir da persistida:

- solicitar login/senha de Analista de Crédito;
- validar no backend;
- persistir Qualidade e analista autorizador;
- abortar sem efeitos se credencial falhar/cancelar.

Diferencie Usuário logado, Analista autorizador, vendedor e responsável pelo Atendimento.

## Estoque e concorrência

Quando `Produtos no orçamento com estoque` estiver ativo:

- calcule a situação de todos os Produtos conforme a semântica descrita no pacote de evidências Delphi;
- bloqueie se qualquer linha estiver Parcial ou Não atendida;
- faça a validação próxima do commit, considerando concorrência;
- não use apenas situação previamente exibida no frontend;
- retorne Produtos/quantidades impeditivos.

Inspecione no Laravel as reservas e os efeitos existentes de marcar `vendido`, confrontando-os com o pacote de evidências fornecido. Não invente baixa de Estoque. Se o efeito necessário não estiver determinado pelo pacote, registre DÚVIDA/BLOQUEIO para investigação no workspace de análise.

## Plano e Parcelas

- Exigir exatamente um Plano selecionado no estado final.
- A evidência fornecida informa que, quando existe exatamente um Plano, ele é usado; confronte essa regra com a exigência Laravel atual de Plano marcado e explicite a decisão. Se faltar evidência para resolver a divergência, registre DÚVIDA/BLOQUEIO.
- Validar vencimentos com a mesma data de referência e mensagens.
- Copiar valores à vista/prazo, desconto, juros/agente e todas as Parcelas.
- Preservar `parcelaorigem`, forma de pagamento e tipo de recebimento.
- Não recalcular silenciosamente condições depois da confirmação sem informar conflito de revisão.

## Mapeamento integral

Produza tabela de evidência campo a campo para:

- Contrato;
- Produtos do Contrato;
- séries;
- Serviços;
- Parcelas;
- atualizações do Orçamento;
- atualizações dos Produtos do Orçamento;
- Cliente criado/vinculado;
- Atendimento e vínculo Cliente–Contrato.

Para cada campo, indique origem, transformação, default, nulabilidade e evidência. Não limite a implementação às colunas já copiadas pelo Laravel atual.

Considere a evidência fornecida de que o legado usa `FilialBase` para `filialvenda`. Inspecione como o Laravel resolve a Filial efetiva do Orçamento e evite associação incorreta quando ela difere da sessão. Classifique a decisão final; se a intenção funcional não puder ser determinada pelo pacote, devolva a dúvida ao workspace de análise.

## Atendimento e Questionário

### Atendimento

Reutilize a infraestrutura já implementada:

- contexto `OrcamentoParaContrato`;
- Cliente/tipo, Orçamento e número do Contrato;
- histórico/vínculos existentes;
- solicitação de Usuário/senha quando o parâmetro de Atendimento exigir;
- responsável pelo Atendimento distinto do ator da geração;
- idempotência.

Defina se o registro/vínculo essencial usa a mesma transação/conexão. Se não for possível, use padrão durável/compensação sem deixar Contrato sem histórico necessário.

### Questionário

Após commit, reutilize o spec de Aplicação de Questionário:

- reconhecer Orçamento e Contrato derivado como identidade documental equivalente;
- não duplicar aplicação;
- criar ou retomar pendência;
- falha não reverte Contrato já gerado;
- reabrir pendência conforme contrato existente.

## Atomicidade e idempotência

Imponha invariantes:

- no máximo um Contrato por Orçamento;
- Orçamento `T` deve referenciar o Contrato correspondente;
- Contrato deve referenciar seu Orçamento;
- itens/Parcelas/Serviços/séries não podem ser parcialmente persistidos;
- retries retornam o mesmo número;
- Atendimento e Questionário não duplicam.

Use lock pessimista ou mecanismo equivalente dentro da transação. A função de próximo número não substitui a proteção do vínculo por Orçamento. Se o banco permitir, proponha constraint única compatível; caso contrário, documente proteção transacional e risco.

Falhas antes do commit devem reverter Cliente novo, Contrato, itens, Atendimento essencial e atualizações. Falha pós-commit deve produzir estado recuperável, nunca segundo Contrato.

## Interface

Antes de gerar:

- botão disponível apenas para Orçamento persistido, aberto, sem Contrato e com Permissão;
- confirmação explícita;
- apresentar validações de forma acionável;
- solicitar credenciais sensíveis quando o backend indicar;
- bloquear clique repetido durante processamento.

Após sucesso ou retry idempotente:

- permanecer no Cadastro de Orçamentos;
- atualizar dados autoritativos;
- mostrar `Contrato nº <numero> gerado com sucesso`;
- exibir número no campo/indicador Contrato já existente;
- mudar Situação exibida para `T`;
- desabilitar Gerar Contrato;
- manter número ao reabrir.

Não usar rota futura de Cadastro/Consulta de Contratos.

## Testes obrigatórios

Use como seam principal:

`acionar Gerar Contrato → confirmar/autorizar → executar comando transacional → observar agregado completo, Orçamento T, integrações e número na mesma tela`.

Cubra:

1. geração feliz com Cliente existente;
2. criação automática de Cliente;
3. dados insuficientes para Cliente;
4. deduplicação de Cliente;
5. tipos C/F/L conforme parâmetro;
6. Orçamento não aberto, vencido ou com Contrato;
7. Produto ausente;
8. estoque parametrizado atendido/parcial/não atendido;
9. corrida de estoque;
10. endereço de entrega incompleto;
11. nenhum, um e múltiplos Planos selecionados;
12. vencimentos inválidos;
13. Qualidade sem senha e com senha;
14. Analista válido, inválido, cancelado e sem papel;
15. mapeamento completo do cabeçalho;
16. descontos, cashback, cupom, crédito e frete;
17. Produtos e ordem;
18. séries;
19. Serviços;
20. Parcelas completas;
21. atualizações `vendido` e Orçamento `T`;
22. Atendimento exatamente uma vez;
23. vínculo Cliente–Contrato;
24. Questionário criado/retomado sem duplicidade;
25. falha do Questionário após commit;
26. rollback em falha de cada etapa essencial;
27. duas requisições concorrentes;
28. retry após timeout/resposta perdida;
29. Permissão negada;
30. UI sem redirecionamento, número persistente e botão desabilitado;
31. Auditoria das tabelas alteradas.

Prefira Feature tests no endpoint/comando real e asserts do agregado persistido. Reutilize o teste Feature atual, infraestrutura de operação sensível, testes de Atendimento e Questionário. Não teste métodos privados.

## Entregáveis

Inclua:

- pacote de evidências Delphi fornecido organizado por etapa, sem nova inspeção do legado;
- matriz pacote Delphi fornecido × comportamento Laravel localizado, com referências concretas do checkout;
- pré-condições e Parâmetros;
- tabela campo a campo;
- contrato transacional/idempotente;
- criação automática de Cliente;
- Qualidade/Autorizações;
- estoque e concorrência;
- Atendimento e Questionário;
- contrato de UI/retorno;
- critérios de aceitação e testes;
- riscos e dúvidas não solucionáveis pelo código Laravel;
- lista explícita de bloqueios que exijam nova investigação Delphi no workspace de análise.

## Fora de escopo

- implementar durante `/speckit.specify`;
- Cadastro ou Consulta de Contratos;
- redirecionar para Contratos;
- editar, faturar, reservar, imprimir ou cancelar o Contrato;
- alterar Delphi;
- manter a cópia mínima e incompleta do repository atual como comportamento final.
```
