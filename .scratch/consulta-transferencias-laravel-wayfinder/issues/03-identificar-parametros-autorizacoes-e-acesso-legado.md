# Identificar parâmetros, autorizações e acesso do módulo legado

Type: research
Status: resolved
Blocked by:

## Question

Quais parâmetros de sistema, autorizações de usuário e restrições por filial afetam direta ou indiretamente a Consulta de Transferências, quais descrições literais e semânticas resultam de `parametros_valor(descricao, filial)`/`clparametrossistema.pas`, e o que é ausência real de regra no legado em vez de evidência não localizada?

## Comments

## Answer

Pesquisa concluída em `modules/interlojas/consulta-transferencias/pesquisa-parametros-autorizacoes-delphi.md`.

A consulta usa propriedades tipadas de `ParSistema`, sem chamada literal a `parametros_valor(...)` nas unidades do módulo. Os literais efetivos, a semântica por filial, a restrição indireta do frame e o mecanismo de `acessosmodulos.nomemenu` foram documentados com arquivo:linha. Não foi localizado seed/código específico do item; o Laravel deve criar explicitamente o acesso “Interlojas → Consulta de Transferências”. Não foi localizada permissão operacional adicional. As ausências foram qualificadas pelo escopo, sem extrapolação global.
