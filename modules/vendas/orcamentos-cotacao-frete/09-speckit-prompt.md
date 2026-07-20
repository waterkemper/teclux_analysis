# Prompt para /speckit.specify

```text
/speckit.specify

Crie a especificação funcional e técnica para implementar no Laravel a Cotação de Frete do Cadastro de Orçamentos do ERP tecLUX, migrando o comportamento comprovado no Delphi e construindo desde o início uma capacidade reutilizável pelo Cadastro de Contratos em etapa posterior.

## Objetivo

Permitir que o Usuário solicite cotações à API configurada no site de cada cliente, compare opções válidas, compreenda serviços indisponíveis, selecione uma opção vinculada à configuração local e aplique seus dados ao Orçamento com validade, Auditoria e recálculo corretos.

Orçamentos será o primeiro consumidor. Não integrar a tela Laravel de Contratos nesta entrega, mas o serviço, contrato e modal não podem depender diretamente de Orçamentos.

## Vocabulário e contexto externo

Use `Cotação de Frete` para a consulta comparativa de serviços e valores de transporte para um documento de Venda.

Os Parâmetros do Sistema mantêm nomes legados:

- `URL FRENET`: URL da API de Cotação de Frete hospedada no site do cliente;
- `chave frenet`: credencial/token enviado à API.

O nome `URL FRENET` não significa que o Laravel chamará necessariamente a Frenet. A API do cliente pode orquestrar:

- Frenet;
- integrações diretas com transportadoras;
- regras próprias de frete.

Essas estratégias são internas à API. O Laravel envia o contrato de cotação e recebe o mesmo formato Frenet esperado pelo Delphi.

## Evidências Delphi

Analise PAS e DFM conjuntamente antes de finalizar a spec:

- [CONFIRMADO] `delphi/repositorio/fmFreteTransportadoras.pas/.dfm` implementa a tela compartilhada de Cotação de Frete.
- [CONFIRMADO] A função recebe tipo do documento, query do documento e query de Produtos.
- [CONFIRMADO] Orçamentos chama essa tela em `delphi/apps/vendas/fmorcamentos.pas`.
- [CONFIRMADO] Contratos chama a mesma tela em `delphi/apps/vendas/fmcadastrocontratos.pas`.
- [CONFIRMADO] A URL configurada sobrescreve `UrlConsulta` e a chave configura o token.
- [CONFIRMADO] A cotação usa CEP da Filial de origem, `CepCalculoFrete` como destino e `totalprodutos` como valor declarado.
- [CONFIRMADO] Cada item envia quantidade, `peso_entrega`, altura, largura, comprimento, diâmetro, Produto como SKU e categoria vazia.
- [CONFIRMADO] O retorno consumido contém `CodigoTransportador`, `Transportador`, `PrazoEntrega`, `Mensagem`, `CodigoServico`, `DescricaoServico`, `Valor`, `PrazoEntregaOriginal`, `ValorOriginal`, `TempoResposta` e erro.
- [CONFIRMADO] O Delphi adiciona o prazo de expedição da configuração local ao prazo retornado.
- [CONFIRMADO] Uma opção da API precisa resolver `codigo_servico + nome_transportador` em uma única `tabela_frete`.
- [CONFIRMADO] Zero ou múltiplas correspondências impedem a aplicação e geram mensagem específica.
- [CONFIRMADO] A configuração local fornece Fornecedor e código da tabela.
- [CONFIRMADO] A seleção preenche `fornecedorfrete`, `frete`, `frete_servico`, `frete_mensagem`, `frete_prazo_entrega` e códigos locais aplicáveis.
- [CONFIRMADO] Depois, o nome do Fornecedor local é atribuído a `frete_transportadora`.
- [CONFIRMADO] O Delphi calcula assinaturas dos dados de frete do documento e dos Produtos e alerta na gravação quando houve mudança.
- [CONFIRMADO] A advertência oferece Prosseguir, Rever o cálculo ou Cancelar.
- [CONFIRMADO] O Delphi bloqueia aplicação quando o documento está somente leitura.
- [DIVERGENTE] O Delphi também consulta regras locais de frete próprio/isenção e mistura essas opções à lista. No destino Laravel, todas as opções retornam da API; não reproduzir essa consulta/mescla.

Toda conclusão deve usar CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA e apontar evidência concreta.

## Estado atual do Laravel

- [CONFIRMADO] O Cadastro de Orçamentos já carrega e grava `frete`, `fornecedorfrete`, `frete_transportadora`, `frete_servico`, `frete_mensagem` e `frete_prazo_entrega`.
- [CONFIRMADO] O payload de Produtos já contém peso de entrega, altura, largura, comprimento e diâmetro.
- [CONFIRMADO] A aba Entrega permite manter manualmente parte dos dados de frete.
- [CONFIRMADO] Existem testes funcionais para carregar/gravar campos de frete no cabeçalho.
- [NÃO LOCALIZADO] Não foi localizada integração Laravel de Cotação de Frete equivalente ao Delphi.
- [NÃO LOCALIZADO] Não foi localizada fotografia persistida da opção cotada nem assinatura de validade equivalente ao MD5 Delphi.

## Contrato externo

Antes de implementar, documente o contrato wire exato usado pelo Delphi/API do cliente:

1. método e path;
2. header ou campo usado para `chave frenet`;
3. nomes, tipos e unidades do payload;
4. envelope e casing da resposta;
5. representação de erro global e por serviço;
6. regras de decimal, CEP e timeout.

Obtenha esse contrato da implementação da biblioteca Delphi, da API primária ou de fixture real sanitizada. Não invente um JSON “parecido” com Frenet.

No Laravel:

- criar um cliente backend dedicado e testável;
- resolver URL e chave por meio da infraestrutura de Parâmetros do Sistema e da Filial de origem;
- nunca retornar URL, chave ou header de autenticação ao frontend;
- aplicar timeout explícito, limite de resposta, validação estrita de status/content-type/schema;
- não fazer retry automático invisível;
- oferecer retry manual no frontend;
- redigir segredos, headers e dados sensíveis dos logs;
- validar o destino configurável contra a política segura de hosts/URLs do ambiente, sem impedir os sites autorizados dos clientes.

## Elegibilidade e dados autoritativos

A ação de Cotação de Frete deve informar claramente os dados usados.

Bloquear antes da chamada quando faltar:

- `URL FRENET`;
- `chave frenet`;
- CEP da Filial de origem;
- CEP de destino;
- ao menos um Produto.

Não bloquear apenas porque peso ou dimensões estão zerados. Enviar os valores atuais e deixar a API decidir quais serviços são válidos.

O backend deve reconstruir o payload a partir do estado atual/autoritativo do Orçamento ou de um snapshot de rascunho validado. Não confiar em total, CEPs, pesos ou dimensões arbitrários enviados pelo navegador.

### Origem

- usar uma única Filial de origem, seguindo a regra Delphi;
- usar o CEP configurado dessa Filial;
- não dividir automaticamente a cotação por Filial dos itens.

### Destino

- usar primeiro o CEP do endereço de entrega;
- se ausente, usar o CEP principal do documento/Cliente;
- exibir origem e destino efetivamente usados na modal.

### Valor declarado e Produtos

- valor declarado: total atual dos Produtos;
- por item: Produto/SKU, quantidade, peso de entrega, altura, largura, comprimento e diâmetro;
- preservar unidades esperadas pela API;
- normalizar CEP e números deterministicamente;
- não enviar categoria inventada.

## Resposta e modal

Normalizar cada item retornado preservando:

- código e nome da transportadora;
- código e descrição do serviço;
- valor e valor original;
- prazo aplicado e prazo original;
- mensagem;
- tempo de resposta;
- indicador/mensagem de erro;
- posição original da API.

A modal compartilhada deve:

1. mostrar CEP de origem e destino;
2. mostrar carregamento sem duplicar requisição;
3. apresentar opções válidas na ordem original da API;
4. não selecionar automaticamente a mais barata ou rápida;
5. permitir ordenar por valor, prazo, transportadora e serviço;
6. mostrar valor, prazo, transportadora, serviço e mensagem;
7. separar serviços indisponíveis em área recolhida, com motivo;
8. impedir seleção de serviço com erro;
9. manter opções válidas disponíveis mesmo se outras falharem;
10. indicar modo somente leitura e desabilitar aplicação;
11. apresentar timeout/resposta inválida com `Tentar novamente`;
12. preservar a cotação anteriormente aplicada quando uma nova consulta falhar;
13. impedir submissões duplicadas e descartar respostas tardias;
14. informar quando o Orçamento mudou e a resposta não pode mais ser aplicada.

## Vínculo com configuração local

Antes de aplicar uma opção válida:

1. resolver exatamente `CodigoServico + Transportador` contra a configuração local aplicável de `tabela_frete`;
2. exigir exatamente uma correspondência;
3. zero correspondências: bloquear e explicar que serviço/transportadora não está configurado;
4. múltiplas correspondências: bloquear e explicar a ambiguidade;
5. obter código da tabela, Fornecedor e prazo de expedição/configurações necessárias;
6. aplicar prazo final conforme regra Delphi comprovada;
7. usar o nome do Fornecedor local em `frete_transportadora`;
8. manter transportadora/códigos retornados na evidência da cotação;
9. não consultar `fretes_isencao` para criar opções adicionais.

## Aplicação ao Orçamento

Ao selecionar:

- atualizar o rascunho, não persistir isoladamente a modal;
- preencher valor do frete;
- preencher Fornecedor e nome local da transportadora;
- preencher descrição do serviço, mensagem e prazo;
- preencher código de `tabela_frete` e demais códigos ainda aplicáveis;
- substituir integralmente uma opção anterior;
- recalcular total, financiamento e planos afetados uma única vez;
- marcar o Orçamento como alterado;
- retornar à tela com a opção escolhida visível.

A persistência definitiva acontece com a gravação do Orçamento e deve ser atômica com a fotografia da cotação.

## Fotografia e Auditoria da cotação

Persistir uma fotografia mínima contendo:

- versão do contrato/formato;
- assinatura do payload cotado;
- data/hora e Usuário;
- Filial e CEP de origem;
- CEP de destino;
- valor declarado;
- códigos e nomes da transportadora/serviço retornados;
- configuração local, código da tabela e Fornecedor resolvidos;
- valor e prazo originais;
- valor e prazo aplicados;
- mensagem;
- estado de validade: atual, desatualizada ou desatualizada aceita.

Não persistir URL, credencial ou headers secretos. A fotografia complementa, não substitui, a Auditoria já mantida pelos gatilhos do banco.

## Assinatura e invalidação

Defina serialização canônica e hash estável para:

- identidade/CEP da Filial de origem;
- CEP de destino;
- valor declarado;
- cada item ordenado deterministicamente por identidade estável;
- Produto/SKU;
- Filial do item quando fizer parte da identidade;
- quantidade;
- peso;
- altura, largura, comprimento e diâmetro;
- versão do algoritmo/contrato.

Regras:

1. retornar assinatura junto com a resposta da cotação;
2. antes de aplicar, reconstruir assinatura autoritativa e comparar;
3. se mudou durante a requisição/modal, recusar a seleção sem mutação parcial;
4. depois de aplicada, qualquer mudança assinada torna a cotação desatualizada;
5. Refazer cotação usa dados atuais e cria nova assinatura/fotografia;
6. ao gravar desatualizada, oferecer Prosseguir, Refazer cotação ou Cancelar;
7. Prosseguir grava a decisão e mantém o estado `desatualizada aceita`;
8. não falsificar validade recalculando hash sem chamar a API;
9. Cancelar não perde outras alterações do Orçamento;
10. a escolha deve ser protegida contra gravações concorrentes/revisões antigas.

## Permissões

- consultar opções: Permissão de visualização do Orçamento;
- aplicar opção: Permissão de Alteração e Situação editável;
- gravar/aceitar cotação desatualizada: mesmas regras de alteração do Orçamento;
- backend repete todas as verificações;
- modo somente leitura pode comparar, mas não aplicar;
- não exigir Permissão de Contratos ou de outro módulo por causa do componente compartilhado.

## Reutilização futura em Contratos

Defina um contexto/adaptador de documento que forneça:

- tipo e identidade do documento;
- situação e capacidades;
- autorização de consultar/aplicar;
- Filial/CEP de origem;
- CEP de destino;
- valor declarado;
- itens logísticos;
- estado atual e assinatura;
- mapeamento da opção para campos do documento;
- persistência da fotografia;
- efeitos financeiros após aplicação;
- URL de retorno/integração da modal.

O núcleo compartilhado trata cliente HTTP, normalização, opções/erros, vínculo local, modal, assinatura e fotografia. Orçamento trata seus próprios campos, cálculos e gravação. Não espalhar `if tipo == Orçamento/Contrato` pelo núcleo.

Provar extensibilidade com teste de contrato usando um segundo contexto simulado. Não alterar a tela de Contratos nesta entrega.

## Critérios de aceitação

1. A ação usa URL e chave configuradas na Filial de origem sem expô-las ao frontend.
2. Ausência de parâmetro, CEP ou Produtos bloqueia com mensagem específica.
3. O payload externo corresponde ao contrato Frenet real e aos dados atuais do Orçamento.
4. Peso/dimensões zero são enviados e a API decide a disponibilidade.
5. Origem usa a Filial de origem e destino prioriza o endereço de entrega.
6. Opções válidas aparecem na ordem da API, sem seleção automática.
7. O Usuário pode ordenar sem alterar a ordem autoritativa armazenada.
8. Serviços com erro aparecem separadamente e não são selecionáveis.
9. Falha individual não esconde opções válidas.
10. Zero ou múltiplos vínculos locais bloqueiam a aplicação.
11. Um vínculo único aplica Fornecedor, nome local, valor, serviço, mensagem, prazo e códigos.
12. Selecionar outra opção substitui a anterior e recalcula uma única vez.
13. Consulta funciona em modo somente leitura; aplicação não.
14. Falha/retry não apaga nem renova a cotação anterior.
15. Resposta tardia ou baseada em dados antigos não pode ser aplicada.
16. Alterar qualquer campo assinado marca a cotação desatualizada.
17. Refazer cria resposta, assinatura e fotografia novas.
18. Gravar desatualizada oferece as três decisões acordadas.
19. Prosseguir registra `desatualizada aceita` sem falsificar validade.
20. Fotografia é persistida atomicamente e exclui segredos.
21. Reabrir o Orçamento apresenta a cotação e seu estado de validade.
22. Timeout, resposta inválida e autenticação falha possuem mensagens seguras e retry manual.
23. Chamadas duplicadas são bloqueadas e logs não expõem segredo.
24. Um contexto simulado comprova que Contratos poderá reutilizar o núcleo sem duplicação.
25. Nenhuma regra local de `fretes_isencao` é usada para formar a lista.

## Estratégia de testes

Use como seam principal o endpoint interno de Cotação de Frete com HTTP externo fake:

- fixtures Frenet sanitizadas de sucesso, sucesso parcial, erro total e schema inválido;
- asserção do request externo, autenticação, timeout e normalização;
- parâmetros por Filial e ausência de vazamento de segredo;
- payload server-authoritative e tentativa de manipulação do cliente;
- vínculo local zero/um/múltiplos;
- aplicação, recálculo, fotografia e persistência;
- todos os campos que invalidam assinatura;
- resposta stale e conflito concorrente;
- Permissões de consulta/aplicação;
- timeout, retry manual e chamada duplicada;
- contrato do segundo contexto simulado.

No frontend, testar apenas comportamento exclusivo da modal: ordem, sorting, nenhuma seleção automática, válidos/indisponíveis, read-only, escolha, stale, retry e preservação da seleção anterior.

Reutilizar testes funcionais existentes do Cadastro de Orçamentos para campos de frete, gravação e cálculos. Não acessar uma API externa real nos testes.

## Fora de escopo

- Integrar a tela Laravel de Contratos agora.
- Calcular regras de frete dentro do Laravel ou mesclar `fretes_isencao`.
- Alterar a API no site dos clientes.
- Contratação de frete, coleta, etiqueta, rastreamento ou cancelamento.
- Redesenhar toda a aba Entrega.

Antes de decompor tarefas, a spec deve apresentar:

1. contrato wire Frenet confirmado;
2. contrato do contexto/adaptador compartilhado;
3. payload e unidades;
4. resposta normalizada e estados de erro;
5. algoritmo/versionamento da assinatura;
6. modelo persistente da fotografia e estado de validade;
7. fluxo da modal e decisões stale;
8. matriz de Permissões/Situações;
9. efeitos financeiros e transações;
10. plano de testes com fake HTTP no maior seam;
11. dúvidas e divergências restantes classificadas com evidência.
```
