Type: task
Status: resolved
Blocked by: 03

## Question

Como consolidar as descobertas e decisões em um adendo autocontido e atualizar a PRD e o prompt SpecKit já publicados da Consulta de Estoques, detalhando integralmente a lupa enriquecida sem exigir acesso ao Delphi e sem ampliar a mudança para outras lupas do sistema?

## Answer

As decisões foram consolidadas em três níveis complementares:

1. [`adendo-lupa-produto.md`](../adendo-lupa-produto.md) é a autoridade funcional e técnica autocontida da lupa: escopo, origem funcional já levantada, seam exclusivo, endpoint, catálogo de colunas, busca, ordenação, Filiais, consolidação, Parâmetros, capacidades, comportamentos proibidos e critérios de aceite.
2. [PRD da Consulta de Estoques](../../consulta-estoques-laravel/PRD.md) foi atualizada com as decisões de produto/arquitetura, capacidades separadas de preços e comissões, retorno Produto-only e testes específicos da lupa.
3. [Prompt SpecKit](../../../modules/estoque/consulta-estoques/09-speckit-prompt.md) foi atualizado com um contrato implementável completo. Ele identifica componentes Laravel existentes, proíbe investigar Delphi, determina wrapper/endpoint locais e detalha integralmente linhas, seleção, colunas, formatos, filtros, paginação, ordenação, Filiais, consolidação, Parâmetros, segurança, reuso e testes.

O escopo permanece restrito à Consulta de Estoques. Não foi implementado código Laravel, não foram alteradas lupas globais e não foram criadas dependências do Delphi para o agente que executar o SpecKit.
