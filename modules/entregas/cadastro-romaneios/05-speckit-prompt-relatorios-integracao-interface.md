# Prompt para /speckit.specify — relatórios e integração da interface

```text
/speckit.specify

Crie a especificação funcional e técnica dos relatórios e da integração final da interface do Cadastro de Romaneios, quinta de seis specs. Integre as specs 01–04 em uma jornada mestre–detalhe consistente, sem reespecificar comandos. Entregue relatórios Notas/Produtos, grids, atalhos, modais, feedback, responsividade e acessibilidade.

Não implemente. Inspecione componentes compartilhados e cite arquivos. Autoridades em modules/entregas/cadastro-romaneios/: interface-operacoes-componentes.md, pesquisa-interface-delphi.md, pesquisa-padroes-laravel-reutilizaveis.md, pesquisa-sql-dominio-efeitos-delphi.md e schema/README.md.

## Jornada integrada

Página única ErpCadastroShell, barra sticky/responsiva e modais para Localizar, Item, Incluir múltiplos, Conferir, Justificar, Movimentações, Assinatura e Imprimir. Não criar páginas auxiliares. Pilha com uma superfície interativa, foco inicial/retorno, dirty state e rolagem correta.

Barra estável: Novo F3; Gravar F8; Excluir F6; Localizar F9; Imprimir F7; Incluir Item; Incluir múltiplos; Conferir; Liberar/Reter F10 contextual.

F5 não grava. Modal suspende atalhos da página. No modal múltiplo F6 alterna Gerar/Cancelar; fora dele F6 é Excluir. Enter na chave NF-e localiza apenas no campo. Resolva repeat/defaultPrevented/foco e impeça listeners duplicados.

Botões Laravel usam texto, ícone da biblioteca, tooltip e aria-label. Ação impossível pelo estado pode aparecer desabilitada com explicação; capability sensível não vaza.

## Grids

Use ErpPreferenceDataGrid e screen key/catálogo próprios para Itens, candidatos, Duplicatas, conferência e movimentações. Preserve ordenação, largura, visibilidade, exportação/cópia, paginação/virtualização e allow-lists.

O grid de Itens cobre identidade NF/Cupom, Filial, emissão, Cliente, volumes, situação fiscal/saída, cancelamento, entrega/recebimento/reagendamento, frete/valores, motivo e endereço. Texto/ícone/legenda acompanham cores. Sem persistência inline.

## Relatórios

Modal Imprimir oferece:

1. Notas do Romaneio;
2. Produtos do Romaneio;
3. Incluir cancelados.

Reusar infraestrutura institucional de PDF, Filial/logo, sanitização e auditoria. Relê Romaneio/Itens autorizados no servidor e gera datasets set-based. Produtos usa produtosdadosfiscais/produtos/caracteristicas/marcas conforme schema e regra de entrega. Use IDs vinculados e binds IN/= ANY(array), com vazio explícito; nunca lista textual.

Visualização, download e impressão revalidam módulo, Filiais e Romaneio. Artefato assíncrono é preso ao Usuário/contexto, expira e é reautorizado. Cobrir conjunto vazio e cancelados sem repetir o bug de flag Delphi.

## Estados e acessibilidade

- Estados Inicial/Carregando/Vazio/Resultado/Erro recuperável.
- Conflito de revisão oferece Recarregar, sem merge.
- Cancelamento F6 é neutro e preserva último resultado.
- Validação associa erro ao campo/foco; falha preserva rascunho quando seguro.
- Situação, seleção, erro e cancelamento não dependem só de cor.
- Teclado completo, foco visível, aria-live, grids nomeados e contagens compreensíveis.
- Modais responsivos mantêm ações alcançáveis sem keyboard trap; design system governa contraste, touch e reduced motion.

## Critérios de aceite

- [ ] Superfícies auxiliares são modais coordenados na página mestre–detalhe.
- [ ] F8 grava; F6/F10 obedecem ao contexto sem colisão.
- [ ] Não há listener duplicado; foco/dirty funcionam em modal sobre lookup.
- [ ] Cada grid mantém catálogo, preferências e autorização próprios.
- [ ] Relatórios são set-based, autorizados e não usam listas inseguras.
- [ ] Cancelados e conjunto vazio estão cobertos.
- [ ] Download/visualização reautorizam e não vazam artefato.
- [ ] Teclado, scanner NF-e, Auto Incluir, cores e responsividade têm testes E2E.

## Fora de escopo

- mudar regras transacionais;
- criar design system, grid, NF-e ou PDF paralelos;
- reproduzir DFM;
- rollout/feature flag.
```
