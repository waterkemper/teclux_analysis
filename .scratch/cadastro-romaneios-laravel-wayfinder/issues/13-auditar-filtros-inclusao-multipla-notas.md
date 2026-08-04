# Auditar filtros da inclusão múltipla de Notas de Romaneio

Type: task
Status: resolved

## Answer

Auditoria concluida. O Laravel ja possui os filtros principais, defaults de emissao, intervalo opcional de entrega, Filiais e a opcao Somente NF. As divergencias relevantes sao: Clientes em texto livre com descarte silencioso de tokens invalidos, semantica nao explicita entre null e lista vazia de Filiais, e chave NF-e em estado local separado do objeto de filtros. O Delphi usa lista de Clientes com pesquisa/remocao, datas obrigatorias e chave na aba Dados.

O prompt separado foi publicado em modules/entregas/cadastro-romaneios/08-speckit-prompt-correcao-filtros-inclusao-multipla.md. Ele define filtros, defaults, validacao, autorizacao, localizacao por chave, estados, cancelamento real e testes, sem alterar a inclusao unitaria.
Blocked by: 02, 07, 12

## Question

Quais diferenças ainda existem entre os filtros da tela Laravel de inclusão múltipla de Notas e o fluxo Delphi, e qual especificação/prompt separado deve orientar a correção sem alterar a inclusão unitária nem a arquitetura da F6?
