# Decidir o limite de reaproveitamento entre os dois fluxos

Type: grilling
Status: resolved
Blocked by: 03

## Question

Qual deve ser o limite arquitetural de reaproveitamento no Laravel entre a geração de Requisições pela Consulta de Compras e o Cadastro manual: quais serviços, políticas, comandos transacionais e projeções devem ser compartilhados, e quais responsabilidades devem permanecer específicas de cada interface?

## Answer

### Decisão

Extrair um núcleo neutro de **Requisição entre Filiais** e fazer tanto a Consulta de Compras quanto o Cadastro manual consumi-lo. A Consulta não será chamada pelo Cadastro: são fluxos de aplicação distintos sobre o mesmo agregado legado.

É permitido renomear e aprofundar componentes hoje prefixados por `ConsultaCompras...`, desde que a refatoração preserve o comportamento já entregue pela Consulta.

### Responsabilidades compartilhadas

- manifesto/resolvedor único dos parâmetros `Transferir_Produtos_Compostos`, `Permitir_Requisicoes_de_Produtos_Duplicadas` e `RequisicaoSubtraiEstoque`;
- identidade da requisição aberta e lock de duplicidade;
- persistência de `pedidosfiliais`;
- representação decimal de quantidades;
- comandos transacionais de criação, alteração e cancelamento;
- locks e movimentos de estoque TEP, TPE e TFR;
- consultas básicas do agregado, como localizar aberta, carregar por código e detectar duplicidade.

Os parâmetros são resolvidos no servidor, no momento da operação, e nunca aceitos como decisão do frontend.

### Responsabilidades específicas

**Consulta de Compras:** geração em lote por sugestões, candidatas, distribuição, snapshots, DTO/projeção próprios e requisitante fixado pela filial ativa da sessão.

**Cadastro manual:** inclusão e manutenção unitárias, requisitante selecionável entre as filiais autorizadas ao usuário, pesquisa e edição, DTO/projeção detalhados e apresentação dos campos legados.

Controllers, requests, policies de entrada e interfaces permanecem próprios de cada fluxo. Não haverá DTO ou consulta de tela universal.

### Duplicidade

- Com duplicatas permitidas, ambos os fluxos podem criar outro registro.
- Sem duplicatas, a Consulta executa **adicionar quantidade à requisição aberta**, criando se necessário.
- Sem duplicatas, o Cadastro executa **criar requisição** e retorna a aberta para edição, sem soma automática.

Os comandos compartilham identificação, parâmetro e lock da duplicidade.

### Autorizações

Policies/gates de entrada são próprios de cada fluxo. Antes da gravação, o servidor revalida que o usuário pode operar a filial requisitante. O núcleo recebe ator e contexto de filial, resolve os parâmetros no servidor e não confia em filial, autorização ou parâmetros enviados pelo frontend.

Os detalhes ficam para **Decidir autorização, auditoria e convivência Delphi–Laravel**.
