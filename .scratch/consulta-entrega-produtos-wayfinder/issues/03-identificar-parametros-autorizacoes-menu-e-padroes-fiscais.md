# Identificar parâmetros, autorizações, menu e padrões fiscais da Consulta de Entrega de Produtos

Type: research
Status: resolved
Blocked by:

## Answer

Pesquisa consolidada em modules/entregas/consulta-entrega-produtos/pesquisa-parametros-autorizacoes-menu-padroes.md.

- Nao foi localizado parametro de sistema especifico, chamada parametros_valor, ParSistema ou manifesto proprio da tela. A aba Parametros e apenas a aba de filtros operacionais; nao criar manifest ate existir evidencia literal.
- O menu Delphi possui folhas irmas Relatorio de Entrega e Consulta de Entrega de Produtos. Isso diverge do caminho pedido; a folha Laravel, seu rotulo e sua rota precisam ser decididos explicitamente, sem inferir que a consulta seja o relatorio.
- O legado confirma grants diretos e por grupo, mas nao localiza grant concreto para esta tela. O Laravel deve usar folha Cloud propria, rota unica, servico de acesso fail-closed e middleware em todos os endpoints, incluindo consulta, F9, exportacao, relatorio, PDF e gravacao.
- A Filial e as autorizações devem vir da sessao e dos servicos server-side; selecoes e grants enviados pelo browser sao apenas intencao. Administrador/bypass deve ser regra explicita, nao copia de Tag=1 ou suporte legado.
- F5/F6/F10 sao confirmados; F9 nao e implementado nesta unidade Delphi. Se F9 for adotado, deve usar CatalogCodeLookup/ErpTwoColumnCatalogLookupModal e endpoint paginado autorizado.
- Nao ha chave NF-e na tela. Se surgir uma referencia futura, reutilizar NfeAccessKeyInput, NfeAccessKey, NfeAccessKeyValid e NfeAccessKeyText, sem mascara ou DV local.

## Question

Pesquisar `clparametrossistema.pas`, usos de `parametros_valor('', '')`, mecanismo de `acessosmodulos`/usuários e o caminho de menu **Entregas e Montagens → Entregas → Relatório de Entregas**, separando evidência localizada de ausência. Mapear também o padrão Laravel para modal F9, filial/autorização, breadcrumb, atalhos, ícones e máscara `NfeAccessKey*`. O resultado deve definir um contrato fail-closed sem copiar grants legados ou aceitar autoridade do browser.
