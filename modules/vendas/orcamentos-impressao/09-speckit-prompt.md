# Prompt para /speckit.specify

```text
/speckit.specify

Crie uma especificação funcional e técnica para revisar e completar no Laravel a impressão individual e em lote de Orçamentos em PDF.

Não implemente nesta etapa. Você não possui acesso ao código Delphi. Considere a seção `Evidência Delphi confirmada` deste prompt como o pacote funcional legado autoritativo e inspecione somente o Laravel antes de concluir. Corrija hipóteses sobre o estado Laravel quando forem contrariadas pelo checkout, classificando a divergência. Não altere, complete ou descarte uma regra Delphi por inferência: se a evidência fornecida for insuficiente ou ambígua, registre uma DÚVIDA/BLOQUEIO para investigação no workspace de análise. As imagens da impressão Delphi fornecidas no Cursor orientam somente o layout visual e não constituem fonte para regras, cálculos, Parâmetros do Sistema ou Autorizações.

## Objetivo

Entregar uma impressão oficial de Orçamento em PDF que:

- funcione no Cadastro para um Orçamento gravado;
- funcione na Consulta para vários Orçamentos marcados;
- preserve conteúdo, cálculos e Parâmetros do Sistema relevantes;
- aplique a mesma validação de Qualidade da Venda e autorização de Analista de Crédito nos dois caminhos;
- permita incluir ou não a foto principal dos Produtos;
- gere um único PDF para os Orçamentos autorizados no lote;
- apresente resultado individual para cada Orçamento impedido;
- use o stack PDF já existente no Laravel;
- não use FastReport nem arquivo FRF.

## Regras de evidência

### Fronteira de acesso às fontes

- Não tente localizar, abrir ou solicitar arquivos PAS, DFM, data modules, queries, FastReport ou qualquer outra fonte Delphi.
- As evidências Delphi abaixo já foram extraídas no workspace de análise a partir do Cadastro e da Consulta de Orçamentos, `dmimprimeorcamento`, ancestrais, datasets, Qualidade da Venda, Parâmetros do Sistema, fotos, cálculos, permissões e gatilhos de impressão.
- Use essas evidências como requisitos legados de entrada, preservando suas classificações.
- Inspecione o checkout Laravel para confirmar o estado atual, localizar os seams de implementação e identificar lacunas frente ao pacote Delphi fornecido.
- Se uma decisão depender de informação Delphi ausente, não invente nem deduza pela interface ou pelas imagens: registre exatamente a pergunta que deve retornar ao workspace de análise.

No Laravel, analise:

- controller e rota de impressão do Orçamento;
- composer de documentos/e-mail;
- repositories de Orçamento, Produtos, Serviços e Planos;
- template Blade atual;
- Browsershot e infraestrutura de PDF;
- mescla de PDFs existente;
- Cadastro e Consulta de Orçamentos;
- serviço de operações sensíveis/credenciais;
- Cadastro e cálculo de Qualidade da Venda;
- policies, parâmetros, fotos e testes existentes.

Classifique cada descoberta do Laravel como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO ou DIVERGENTE em relação ao pacote fornecido. Preserve as marcações POSSÍVEL BUG LEGADO e DECISÃO NOVA já presentes nas evidências, sem reclassificá-las por suposição. Toda conclusão sobre o Laravel deve citar evidência concreta do checkout. Não transforme limitações do FastReport ou bugs Delphi já documentados em requisitos.

## Evidência Delphi confirmada

### Gatilhos

- O Cadastro aciona a impressão por F11.
- O botão só fica habilitado quando não há gravação pendente; a impressão representa o Orçamento persistido.
- A Consulta permite marcar vários Orçamentos e aciona impressão por F11.
- A Consulta monta a lista de códigos marcados e envia todos ao mesmo data module de impressão.

### Qualidade da Venda

- O Cadastro chama `AutorizacaoAnalistaCredito` antes da impressão.
- A Qualidade calculada possui `solicitar_senha_analista_credito`.
- Quando essa flag está ativa e a Qualidade calculada difere da gravada, o Delphi solicita login/senha com contexto `Qualidade da Venda` e papel `Analista de Crédito`.
- O Usuário autenticado precisa possuir perfil de Analista de Crédito.
- Em caso de sucesso, o Delphi persiste a nova Qualidade e o código do Analista de Crédito no Orçamento antes de imprimir.
- Credencial cancelada, inválida ou sem o papel necessário impede a impressão.
- A Consulta Delphi não chama explicitamente essa validação antes do lote.
- DECISÃO NOVA: corrigir essa divergência no Laravel. Impressão individual e em lote usam a mesma regra de Qualidade e autorização.

### Conteúdo e parâmetros

- `Visualizar Situação Produtos` decide se a situação calculada de cada Produto é disponibilizada ao relatório.
- `Observação Padrão Orçamento`, resolvida pela Filial do Orçamento, é concatenada à observação do documento.
- O cabeçalho usa endereço, telefone e logotipo relacionados à Filial/base; confirme a Filial correta para evitar usar indevidamente a sessão quando o Orçamento pertence a outra Filial.
- O relatório lê Cliente, emissão, validade, telefones, endereço, vendedor, frete, seguro, observações, Contrato relacionado e totais.
- Produtos são ordenados pelo número da linha.
- Cada Produto inclui código visual, quantidade, preço, desconto do item + desconto geral distribuído, total líquido, previsão, descrição, grades, situação opcional, complemento e Anvisa.
- A descrição calculada agrega descrição, valores de grade e registro Anvisa quando existir.
- Serviços e seus complementos são carregados quando existirem.
- Planos, Parcelas, desconto e valor à vista/prazo são carregados.
- A consulta de foto escolhe no máximo a primeira foto ordenada por `fotosprodutos.posicao` e monta sua URL usando `SITE EMPRESA`.

### Modelo legado

- O Delphi pode carregar `frpOrcamento.frf` externo e possui componentes de relatório com/sem fotos.
- DECISÃO NOVA: ignorar integralmente esse mecanismo. Não suportar FRF, FastReport ou templates externos no Laravel.

## Estado Laravel confirmado

- Já existe endpoint individual de `impressao.pdf`.
- O endpoint autoriza consulta, carrega dados autoritativos por um composer compartilhado com e-mail, renderiza Blade e gera PDF com Browsershot.
- O botão atual abre diretamente o PDF em nova aba.
- O Blade atual é simplificado e exibe Cliente, validade, situação, Produtos, Serviços, alguns totais e Plano selecionado.
- DIVERGENTE: o endpoint não executa a validação de Qualidade da Venda/Analista de Crédito.
- NÃO LOCALIZADO: modal de opções de impressão.
- NÃO LOCALIZADO: opção de fotos dos Produtos.
- NÃO LOCALIZADO: impressão em lote de Orçamentos no Laravel.
- NÃO LOCALIZADO: testes dedicados da impressão do Orçamento.
- Já existe infraestrutura de Browsershot, Puppeteer e mescla de PDFs com `pdf-lib`; reutilize-a.
- Já existe validador de credenciais para operações sensíveis e suporte ao papel legado `analistacredito`; verifique a melhor extensão do catálogo.

## Solução obrigatória

### 1. Preparação autoritativa

Crie uma única fronteira de aplicação para preparar uma impressão. Ela deve:

1. receber um ou vários códigos de Orçamento e opções de impressão;
2. carregar cada Orçamento autoritativamente;
3. verificar Permissão de impressão/consulta;
4. rejeitar alterações locais não gravadas no fluxo do Cadastro;
5. calcular a Qualidade da Venda conforme a semântica descrita no pacote de evidências Delphi deste prompt;
6. identificar necessidade de autorização de Analista de Crédito;
7. validar credenciais quando necessárias;
8. persistir Qualidade/analista somente quando a regra exigir e a autorização for válida;
9. produzir um payload de impressão independente do Blade;
10. gerar o PDF ou retornar impedimentos estruturados.

Não coloque cálculo comercial, resolução de parâmetros nem autorização dentro do template visual.

### 2. Modal de impressão

Ao clicar em Imprimir no Cadastro ou na Consulta, abrir modal acessível.

Única opção de conteúdo:

- `Incluir fotos dos Produtos`, checkbox inicialmente desmarcado.

No lote, mostrar também:

- quantidade de Orçamentos selecionados;
- aviso de que será gerado um único PDF para os autorizados;
- estado de validação/geração;
- resultado individual dos impedidos.

Não oferecer opções para desligar Produtos, Serviços, valores, descontos, Planos, Parcelas, observações ou situação configurada. Esses conteúdos seguem dados e Parâmetros do Sistema.

Fechar/cancelar o modal antes da confirmação não gera PDF nem altera o Orçamento. Bloquear duplo clique e submissões concorrentes. Manter seleção e opções após erro recuperável.

### 3. Fotos

Quando a opção estiver desmarcada, não consultar nem baixar fotos desnecessariamente.

Quando marcada:

- selecionar somente a foto principal, primeira por posição;
- usar o mecanismo de fotos já existente no Laravel, confirmando URL/armazenamento atual em vez de copiar cegamente `SITE EMPRESA`;
- impor timeout, tamanho máximo, tipo de conteúdo permitido e dimensões seguras;
- ajustar proporção sem distorcer;
- não bloquear o PDF por foto ausente ou inacessível;
- registrar falha técnica sem expor detalhes internos ao Usuário;
- evitar SSRF e acesso arbitrário a URLs.

### 4. Qualidade da Venda e credenciais

Aplicar a mesma regra no Cadastro e na Consulta.

Para cada Orçamento:

- calcular Qualidade efetiva;
- comparar com a Qualidade persistida;
- se não mudou ou a Qualidade não exige senha, prosseguir sem modal de credenciais;
- se mudou e exige senha, solicitar credencial de Usuário com papel de Analista de Crédito;
- validar no backend;
- persistir Qualidade e `analistacredito` somente após sucesso;
- bloquear aquele Orçamento em caso de cancelamento, credencial inválida ou Usuário sem papel.

Diferencie explicitamente:

- Usuário logado que solicita a impressão;
- Analista de Crédito que autoriza;
- vendedor do Orçamento.

No lote, defina a UX de credenciais com segurança. É aceitável reutilizar uma autorização validada dentro da mesma operação somente se o serviço de operações sensíveis suportar escopo e validade explícitos. Nunca cachear senha nem autorizar futuras impressões implicitamente.

### 5. Impressão em lote

Validar cada Orçamento individualmente e retornar pelo menos:

- autorizado;
- exige autorização;
- credencial recusada/cancelada;
- sem Permissão;
- não localizado;
- estado/revisão incompatível;
- falha de preparação;
- falha de PDF.

Gerar um PDF por Orçamento autorizado e mesclá-los, na ordem da seleção confirmada, em um único PDF. Cada Orçamento começa em nova página/documento lógico. Um impedimento não deve cancelar os demais, mas nenhum registro impedido pode aparecer no arquivo.

Se nenhum Orçamento for autorizado, não gerar PDF vazio. Exibir resumo integral.

Defina limites de lote, timeout e consumo de memória com base na infraestrutura atual. Fotos devem reduzir os limites ou exigir processamento controlado quando necessário. Não executar geração ilimitada em uma request sem avaliar o padrão existente.

### 6. Conteúdo do payload

Confirme e especifique ao menos:

- código, emissão, validade, Situação e vínculo com Contrato;
- Cliente/tipo, nome, documento e contatos;
- endereço completo do Orçamento;
- vendedor;
- Filial efetiva, logotipo, endereço e contatos;
- observação padrão da Filial + observação do Orçamento;
- Produtos em ordem, código visual, descrição, grades, Anvisa, complemento, quantidade, preço, descontos, total, previsão e situação opcional;
- foto principal opcional;
- Serviços, complemento, equipamento, quantidade, valor e total;
- Plano selecionado, valor à vista/prazo, desconto e Parcelas;
- frete, seguro, total de Produtos, total de Serviços, descontos e total final.

Compare cada cálculo com o pacote de evidências Delphi deste prompt e com os services atuais do Orçamento no Laravel. Não confie em valores calculados apenas no frontend. Evite divergência entre a impressão e o estado autoritativo salvo. Se o pacote não definir um cálculo necessário, registre o bloqueio para investigação no workspace de análise.

### 7. Parâmetros

Documente nome, tipo, escopo e precedência de todos os parâmetros relevantes. Já confirmados:

- `Visualizar Situação Produtos`;
- `Observação Padrão Orçamento`;
- `SITE EMPRESA` apenas como evidência do mecanismo legado de fotos.

Não expor os dois primeiros como opções do modal. Resolver conforme a Filial efetiva. Verifique no Laravel se existem outros Parâmetros do Sistema ou campos de Qualidade relacionados à impressão; classifique como NÃO LOCALIZADO quando não houver no checkout. Não suponha novos parâmetros Delphi além dos fornecidos.

### 8. Layout e PDF

Usar HTML/Blade e Browsershot já existentes. As imagens anexadas no Cursor definem hierarquia visual, cabeçalho, tabelas, totais, rodapé, espaçamento e paginação.

Adotar um layout oficial, responsivo ao conteúdo e adequado a A4. Não implementar editor de templates. Separar:

- payload/cálculos;
- componentes visuais reutilizáveis;
- template PDF;
- geração/mescla.

Garantir repetição de cabeçalhos de tabela, quebra de linhas longas, não separação indevida de totais, nova página entre Orçamentos e tratamento previsível de Produtos com foto.

### 9. Relação com envio de e-mail

O Laravel atual reutiliza um composer de documentos. Preserve uma fonte autoritativa comum de dados e cálculos quando isso reduzir divergência, mas não obrigue impressão e e-mail a usar o mesmo layout.

Alterações feitas para a impressão não devem quebrar o fluxo de envio de e-mail já especificado. Crie contratos explícitos ou presenters separados se o composer atual misturar dados e apresentação.

## Testes obrigatórios

Use como seam principal:

`acionar Imprimir no Cadastro/Consulta → confirmar opções → autorizar quando necessário → preparar dados → gerar PDF → observar PDF e resultados por Orçamento`.

Cubra:

1. impressão individual sem exigência de senha;
2. Qualidade inalterada que exige senha, sem nova solicitação conforme regra confirmada;
3. Qualidade alterada que exige Analista de Crédito;
4. credencial válida de Analista;
5. credencial inválida, cancelada e Usuário sem papel;
6. persistência de Qualidade e analista após autorização;
7. nenhuma persistência após falha;
8. impressão em lote com todos autorizados;
9. lote parcialmente autorizado;
10. lote totalmente bloqueado;
11. mesma política no Cadastro e na Consulta;
12. modal abrindo com fotos desmarcadas;
13. impressão sem qualquer acesso a fotos quando desmarcado;
14. foto principal por posição quando marcado;
15. Produto sem foto;
16. foto inválida, timeout, tipo proibido e tamanho excessivo;
17. Parâmetro de situação ligado e desligado;
18. observação padrão por Filial e observação própria;
19. Filial do Orçamento diferente da Filial da sessão;
20. Produtos, Serviços, Planos e Parcelas presentes/ausentes;
21. descontos por item, desconto geral distribuído e totais;
22. grades, complemento, Anvisa e previsão;
23. ordem dos Produtos e dos Orçamentos do lote;
24. nova página por Orçamento;
25. PDF único mesclado;
26. clique repetido e concorrência;
27. Orçamento alterado entre preparação e geração;
28. erro do Browsershot e erro da mescla;
29. cancelamento do modal sem efeitos;
30. compatibilidade do composer/fluxo de e-mail.

Prefira Feature tests nos endpoints e fluxos de aplicação. Valide payload e texto extraído do PDF para conteúdo; use poucos testes visuais direcionados ao contrato das imagens. Não teste métodos privados ou detalhes frágeis do HTML.

## Entregáveis da especificação

Inclua:

- matriz do pacote de evidências Delphi fornecido × comportamento Laravel localizado;
- inventário Laravel e análise de lacunas, com referências concretas do checkout;
- lista explícita de dúvidas/bloqueios que exijam nova investigação Delphi neste workspace de análise;
- contrato de preparação individual/lote;
- regra completa de Qualidade da Venda e autorização;
- modelo do modal e estados;
- payload autoritativo e cálculos;
- tratamento de fotos;
- parâmetros e precedência por Filial;
- arquitetura de geração e mescla de PDF;
- critérios de aceitação;
- plano de testes no seam principal;
- riscos de segurança, memória, timeout e concorrência;
- pontos do layout que dependem das imagens anexadas.

## Fora de escopo

- implementar durante `/speckit.specify`;
- usar FastReport ou `frpOrcamento.frf`;
- permitir templates arbitrários por cliente/Filial;
- criar opções para ocultar seções padrão;
- imprimir mais de uma foto por Produto;
- editar o Orçamento no modal;
- inferir regras funcionais somente das imagens;
- alterar Delphi.
```
