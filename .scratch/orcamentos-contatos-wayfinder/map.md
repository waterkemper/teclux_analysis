# Migrar a aba Contatos do Cadastro de Orçamentos

Label: wayfinder:map

## Destination

Produzir um contrato funcional baseado em evidências e uma análise completa das lacunas Delphi–Laravel para a aba Contatos do Cadastro de Orçamentos, deixando o esforço pronto para ser convertido por `$to-spec` em um prompt detalhado para `/speckit.specify`, sem implementar alterações neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling` durante decisões; fatos comprováveis devem ser obtidos no código e escolhas de negócio devem ser feitas com uma pergunta por vez.
- Tratar `delphi/` e `laravel/` como fontes somente de leitura. Analisar PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, units compartilhadas, queries, eventos, actions, Permissões e Parâmetros do Sistema.
- Classificar toda descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- “Contato” nesta funcionalidade é um registro global da Parte Contratante em `contatosvfornecedores`; não é Atendimento e não pertence ao Orçamento.
- A migração deve manter consulta, Inclusão, Alteração e Exclusão de Contatos.
- A aba opera a Parte Contratante efetivamente vinculada ao Orçamento, abrangendo tipos `C`, `F` e `L` conforme `tipocliente`.
- Alterações feitas na aba têm efeito global e imediato nos demais módulos; não copiar ou versionar Contatos dentro do Orçamento.
- A aba pode operar assim que houver código e tipo válidos da Parte Contratante, mesmo antes de o Orçamento ser salvo. Nome livre não é identificação suficiente.
- Consultar Contatos acompanha o acesso ao Orçamento. Incluir, alterar e excluir exigem a Permissão correspondente ao Cadastro da Parte Contratante; Permissão de alterar Orçamento não concede mutação global.
- Cada mutação de Contato deve ser persistida independentemente do botão Salvar do Orçamento, com validação e controle de concorrência.
- Investigar e reutilizar prioritariamente o painel, regras, persistência e testes de Contatos já existentes nos Cadastros de Clientes e Fornecedores do Laravel.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Mapeamento exato das Policies/Permissões para mutações de Contatos dos tipos `C`, `F` e `L`, a graduar após o inventário Laravel.
- Contrato técnico mínimo para persistência independente e concorrência sem duplicar o fluxo de gravação completa do Cadastro de Clientes/Fornecedores.
- Comportamento preciso quando a Parte Contratante muda enquanto a aba está aberta ou uma operação está em andamento.
- Estados de carregamento, vazio, erro, retry e atualização após cada mutação, a graduar após comparar os padrões Delphi e Laravel.
- Cobertura mínima de testes e critérios mensuráveis de aceite.
- Forma final do prompt `/speckit.specify` e nível de prescrição técnica adequado ao checkout de implementação.

## Out of scope

- Implementar, testar, formatar, gerar arquivos ou executar comandos dentro de `delphi/` ou `laravel/`.
- Alterar outras abas ou fluxos do Cadastro de Orçamentos.
- Copiar Contatos para uma estrutura própria do Orçamento ou criar snapshots por proposta.
- Redesenhar integralmente os Cadastros de Clientes, Fornecedores ou Filiais.
- Tratar Atendimentos, histórico de interações ou campanhas de contato como parte desta aba.
- Criar ou alterar uma Parte Contratante implicitamente a partir de nome livre.
