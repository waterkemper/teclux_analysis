# Prompt para /speckit.specify — adequar tela de certificados ao ERP e às filiais existentes

```text
/speckit.specify

Corrija a especificação e o desenho da tela de gerenciamento de Certificados A1 para que ela siga o padrão visual/interacional do ERP Laravel e use as Filiais já cadastradas no banco. Não implemente nesta execução. Produza uma especificação funcional/técnica pronta para implementação, com contratos, migração/backfill se necessário, autorização, testes e critérios de aceite.

Este prompt é corretivo e prevalece sobre qualquer trecho anterior que proponha digitar ou cadastrar manualmente razão social, raiz de CNPJ, código de filial ou estabelecimento fiscal.

## Diagnóstico obrigatório do estado atual

Inspecione antes de especificar:

- `backend/resources/js/Pages/Fiscal/Certificados/Index.tsx` e `Show.tsx`;
- `FiscalCertificadoController` e os repositórios `CloudFiscal*`;
- `FilialFiscalContextReader` e o repositório/catálogo canônico de `filiais`;
- tabelas `filiais`, `cloud_fiscal_contribuintes`, `cloud_fiscal_estabelecimentos`, versões, material e vínculos;
- `MenuService`/`acessosmodulos`;
- `laravel/docs/erp-ui/pattern-catalogue.md`, ADR-0002, ADR-333 e ADR-366;
- componentes existentes de cadastro e lista (`ErpCadastroShell`, `ErpCadastroCommandBar`, `ErpCadastroTabBar`, `FormSection`, `Input`, lookups, grids e estados transversais).

Registre na especificação qualquer divergência encontrada entre o modelo atual e os requisitos abaixo. Não remova dados custodiados nem altere a política de criptografia apenas para adaptar a interface.

## Decisões de domínio que a implementação deve respeitar

1. **Filial é dado existente do ERP**: a tela deve consultar as Filiais cadastradas, seus CNPJs, UFs, nomes e situação. O operador não deve redigitar esses dados.
2. **Contribuinte Fiscal é agrupamento/projeção cadastral**: razão social e raiz do CNPJ devem ser derivados da Filial ou da fonte cadastral oficial já existente. Se `cloud_fiscal_contribuintes` permanecer por compatibilidade e como dono das versões custodiadas, ele deve ser sincronizado/upsertado a partir da fonte canônica, não criado por formulário livre.
3. **Estabelecimento Fiscal é cada Filial**: toda Filial elegível deve aparecer automaticamente no grupo correspondente, com identidade própria. Não deve existir o botão/formulário atual `Adicionar estabelecimento` para digitar código de filial.
4. **Raiz de CNPJ serve para agrupar e orientar, não para autorizar seleção**: Filiais com a mesma raiz podem compartilhar uma versão, mas também podem ter certificados diferentes. A igualdade da raiz nunca cria um Vínculo de Certificado Fiscal implícito nem serve como fallback do gateway.
5. **Vínculo é explícito por Filial**: cada utilização deve apontar para o `estabelecimento_id` correspondente à Filial concreta e para a versão, capacidade, UF, ambiente, modelo, vigência e prioridade. Uma versão pode ter vários vínculos explícitos; uma Filial pode ter uma versão própria ou compartilhar outra versão elegível.
6. **A custódia permanece no fluxo existente**: PFX/P12 e senha continuam protegidos pelo vault/ADR-333. A tela trabalha apenas com metadados sanitizados e comandos autorizados.

## Objetivo da nova experiência

Ao abrir `Certificados fiscais`, o administrador deve ver as Filiais reais do ERP e o estado de seus certificados, agrupadas visualmente por Contribuinte Fiscal/raiz quando essa relação puder ser derivada. Deve conseguir:

- localizar uma Filial ou grupo pelo código, nome, CNPJ, UF ou situação;
- abrir o grupo sem informar razão social ou raiz de CNPJ;
- ver todas as Filiais já cadastradas naquele grupo, sem cadastrá-las novamente;
- carregar uma nova versão A1 para o grupo custodiado;
- escolher explicitamente quais Filiais usarão essa versão;
- revisar, ativar, inativar, validar e revogar vínculos/versões conforme autorização;
- identificar imediatamente Filiais sem vínculo, com certificado expirado, prestes a expirar ou com conflito.

## Requisitos de leiaute e interação

### 1. Application Shell e menu

- Usar `AppLayout` e o menu global real do ERP.
- Criar/habilitar uma única folha de menu `fiscal.certificados.index` na árvore de Fiscal/Emissão Fiscal, por migração/configuração de `acessosmodulos`, sem menu paralelo.
- Aplicar a autorização de módulo e de ação já usada pelo ERP; menu visível não concede autorização de mutação.
- Manter destaque ativo em `/fiscal/certificados` e `/fiscal/certificados/contribuintes/*`.
- Não usar um layout isolado com cabeçalho genérico, `max-w-5xl`, cartões improvisados ou botões Tailwind sem os componentes/padrões existentes.

### 2. Índice — lista padrão ERP

- Adotar o padrão Lista/Pesquisa/Filtros do catálogo ERP: título, breadcrumbs se aplicável, toolbar horizontal, pesquisa, filtros, tabela/grid e estados loading/empty/error/permissão.
- Usar paginação de servidor conforme ADR-0002 quando a quantidade de Filiais/grupos exigir.
- Colunas mínimas: grupo/contribuinte derivado, raiz mascarada ou sanitizada conforme política, Filiais, UF, quantidade de versões, certificado selecionado/estado, validade mais próxima e alertas.
- Filtros mínimos: Filial, grupo/raiz, UF, sem vínculo, vínculo ativo, expirado/prestes a expirar, ambiente e modelo quando disponíveis.
- A ação primária da toolbar deve ser coerente com o fluxo real. Não exibir `Novo contribuinte` nem formulário de razão social/raiz.
- Se houver necessidade de corrigir uma Filial sem CNPJ/UF/razão social, encaminhar para o cadastro canônico de Filiais e informar o motivo; não permitir corrigir esses dados na tela fiscal.
- Estado vazio deve diferenciar “não existem Filiais elegíveis” de “filtros não retornaram resultados”.

### 3. Ficha/detalhe — cadastro transacional ERP

- Usar o padrão de ficha/cadastro do ERP: command bar estável, identificação do registro em foco, seções/abas coerentes, `FormSection` e componentes compartilhados.
- O cabeçalho deve apresentar dados somente leitura derivados do banco: razão social/nome cadastral, raiz do CNPJ, quantidade de Filiais e situação do grupo.
- A seção/aba `Filiais` deve listar automaticamente todas as Filiais relacionadas, com código, nome, CNPJ, UF, situação cadastral e estado do Vínculo de Certificado Fiscal.
- Não exibir inputs livres para razão social, raiz de CNPJ, código de Filial ou CNPJ.
- Para selecionar Filiais ao criar vínculo, usar seleção a partir da lista carregada do servidor (checkbox/seleção de linha ou componente equivalente), nunca texto livre.
- Se o padrão exigir lookup, o lookup deve pesquisar `filiais` no servidor e devolver o registro canônico, não aceitar um código que não tenha sido resolvido.
- Mostrar feedback por campo e resumo de erro conforme o catálogo; foco deve ir para o primeiro erro.

### 4. Upload e versões

- Manter o upload A1 existente apenas como operação de nova Versão de Certificado Fiscal.
- O formulário deve mostrar o grupo/Filial em contexto, mas não pedir novamente os dados cadastrais.
- Após upload, mostrar metadados sanitizados: titular, fingerprint conforme política, validade, estado de validação, inclusão, versão e quantidade de Filiais vinculadas.
- Fornecer ações de validar/revogar somente quando autorizadas e com confirmação/reautenticação exigida pelo contrato atual.
- Limpar arquivo e senhas após a operação; nunca renderizar PFX/P12, senha, ciphertext, PEM, chave ou payload sensível.

### 5. Vínculos por Filial

- Criar na ficha uma seção de `Vínculos de Certificado Fiscal` baseada nas Filiais reais já presentes.
- Permitir selecionar uma Versão existente e uma ou mais Filiais exibidas pelo servidor, além de UF, ambiente, modelo, capacidade, vigência e prioridade.
- Para múltiplas Filiais, definir contrato idempotente: reutilizar a rota existente por estabelecimento ou especificar um comando em lote transacionalmente seguro, sem duplicar vínculos.
- Usar as rotas existentes de criação/ativação/inativação quando forem compatíveis; não deixar `vinculo_store` sem uso.
- Exibir estado por Filial: sem vínculo, ativo, inativo, expirado, revogado, conflito ou impedido por incompatibilidade.
- Validar no servidor que o `estabelecimento_id` pertence ao Contribuinte Fiscal da versão; não confiar em IDs enviados pelo browser.
- Manter seleção determinística por Filial + UF + ambiente + modelo + capacidade, conforme ADR-366.
- Ao ativar uma versão compartilhada, mostrar as Filiais impactadas e exigir confirmação adequada; a revogação/inativação deve sinalizar o impacto em todas as Filiais vinculadas.
- Não transformar “mesma raiz” em vínculo automático em runtime. O agrupamento inicial pode facilitar a operação, mas cada vínculo precisa existir e ser auditável.

## Dados, sincronização e compatibilidade

A especificação deve decidir e documentar:

- qual tabela é fonte canônica para Filial, CNPJ, UF, nome e situação;
- como construir/atualizar a projeção `cloud_fiscal_contribuintes` sem cadastro manual;
- como fazer backfill idempotente de `cloud_fiscal_estabelecimentos` para as Filiais existentes;
- como tratar Filial sem CNPJ válido, CNPJ duplicado, alteração cadastral, desativação e mudança de UF;
- como preservar IDs referenciados por versões/vínculos e auditoria;
- como impedir que o mesmo estabelecimento seja associado duas vezes ao mesmo Contribuinte Fiscal;
- como reconciliar registros cloud antigos criados pelo formulário atual antes de removê-lo;
- se o fluxo deve oferecer uma tarefa administrativa explícita de sincronização e quais evidências ela produz.

Não apagar automaticamente versões, material cifrado, vínculos ou auditoria. Não gravar certificados em `filiais`, não reativar `filiais.senhacertificadodigital` e não introduzir fallback por arquivo/env para transmissão real.

## Testes e critérios de aceite

Produza testes automatizados e roteiro manual para comprovar:

- menu, autorização, rota ativa e layout no `AppLayout`;
- ausência dos campos/formulários de razão social, raiz de CNPJ e inclusão manual de estabelecimento;
- índice carregando Filiais existentes sem exigir pré-cadastro em uma segunda tela;
- agrupamento de duas ou mais Filiais pela mesma raiz sem perder a identidade individual;
- Filiais da mesma raiz compartilhando uma versão por vínculos explícitos;
- Filiais da mesma raiz usando versões diferentes;
- Filial com CNPJ/UF ausente ou inválido encaminhada para correção cadastral;
- upload de uma versão e vínculo a Filial selecionada na lista;
- ativação/inativação/revogação, conflito, vigência, ambiente, modelo e capacidade;
- tentativa de vincular estabelecimento de outro contribuinte rejeitada no servidor;
- gateway/diagnóstico encontrando o certificado somente pelo vínculo da Filial concreta;
- nenhum segredo em DOM, props Inertia, respostas, logs, auditoria ou mensagens;
- responsividade, teclado, foco, loading, empty, erro e permissão conforme o catálogo ERP;
- regressão do fluxo de custódia e das tabelas existentes.

Critérios de aceite mínimos:

1. O administrador abre a tela pelo menu padrão do ERP.
2. A tela mostra as Filiais já cadastradas e não pede razão social, raiz de CNPJ ou código de Filial para montar a lista.
3. Cada Filial aparece com vínculo de certificado identificável e auditável.
4. Duas Filiais com a mesma raiz podem compartilhar ou não compartilhar a Versão de Certificado Fiscal, sem seleção implícita.
5. A tela respeita os padrões de layout, command bar, toolbar, tabela/ficha e componentes compartilhados do projeto.
6. O fluxo completo continua compatível com a custódia criptografada e com a seleção determinística do gateway.

## Fora de escopo

- Implementar código durante `/speckit.specify`.
- Alterar a criptografia/vault ou armazenar certificados no S3.
- Reintroduzir venda entre Filiais, devolução entre Filiais ou qualquer regra de transferência.
- Criar um novo cadastro paralelo de empresa/Filial.
- Selecionar certificado por raiz de CNPJ sem Vínculo de Certificado Fiscal explícito.

Entregue a especificação, o contrato de dados derivado das Filiais, o fluxo de telas, a estratégia de backfill/sincronização, a matriz de autorização, os testes e o checklist de aceite. Não implemente.
```
