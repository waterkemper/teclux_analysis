# Migrar a Conferência de Produtos do Orçamento

Label: wayfinder:map

## Destination

Produzir um contrato funcional baseado em evidências e uma análise completa das lacunas Delphi–Laravel para a Conferência de Produtos do Cadastro de Orçamentos, incluindo sua relação com os Parâmetros do Sistema e a disponibilidade no Frente de Caixa, deixando o esforço pronto para ser convertido por `$to-spec` em um prompt detalhado para `/speckit.specify`, sem implementar alterações neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling` durante decisões; fatos comprováveis devem ser obtidos no código e escolhas de negócio devem ser feitas com uma pergunta por vez.
- Tratar `delphi/` e `laravel/` como fontes somente de leitura. Analisar PAS e DFM conjuntamente, incluindo forms ancestrais, data modules, units compartilhadas, queries, eventos, actions, Permissões e Parâmetros do Sistema.
- Classificar toda descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- Conferência de Produtos é a verificação quantitativa dos Produtos de um documento, comparando a quantidade esperada com a quantidade lida ou digitada; somente a igualdade completa de todos os Produtos conclui a conferência.
- A tela e o motor de Conferência de Produtos devem ser reutilizáveis por diversos módulos. Cada origem fornece identidade, Produtos esperados, capacidades, Permissões e consequências de negócio próprias.
- No Orçamento, o comando de conferência permanece disponível voluntariamente quando o Orçamento já foi salvo, está na Situação `A` e não possui alterações pendentes, mesmo que os Parâmetros do Sistema estejam desativados.
- A obrigatoriedade e o bloqueio do Frente de Caixa dependem conjuntamente de `CONFERÊNCIA DE PRODUTOS NO ORÇAMENTO` e `Mensagem de produtos não conferidos ao emitir a NF`; essa combinação é comportamento intencional, não bug legado.
- Com os dois parâmetros ativos, Produtos pendentes tornam o Orçamento indisponível para o Frente de Caixa.
- Ao salvar uma conferência completa, a disponibilidade deve ser reativada imediatamente, sem novo salvamento do Orçamento, quando a indisponibilidade tiver sido causada pela própria conferência, o Orçamento estiver na Situação `A` e não houver outras causas de bloqueio.
- Alterações posteriores nos Produtos reconciliam a conferência por Produto: preservam leituras de itens mantidos, iniciam novos itens em zero, retiram itens removidos e recalculam faltas/excessos quando a quantidade esperada muda. Uma nova pendência reaplica o bloqueio quando os dois parâmetros estiverem ativos.
- Consultar a conferência acompanha a Permissão de consulta do Orçamento; bipar, digitar, reiniciar e salvar exigem a Permissão de Alteração do Orçamento. Não exigir acesso ao Cadastro de Listas Padrão.
- O comportamento `ORC` não deve herdar a inclusão de Produtos inesperados permitida para `LPA`; o Delphi restringe essa inclusão a Listas Padrão.
- Nenhuma implementação será feita neste workspace.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

## Not yet specified

- Representação confiável da causa da indisponibilidade para distinguir bloqueio por conferência de escolha manual ou de outras validações.
- Contrato de integração entre o salvamento da conferência, a atualização imediata do Orçamento e a consulta do Frente de Caixa.
- Tratamento exato de Produtos compostos, conjuntos, grades, repetições do mesmo Produto e números de item no adaptador `ORC`.
- Comportamento diante de alterações concorrentes no Orçamento ou na conferência aberta em outra sessão.
- Estados de carregamento, erro, retomada, conferência parcial, faltas, excessos, reinício e impressão na experiência reutilizável.
- Cobertura mínima de testes e critérios mensuráveis de aceite.
- Forma final do prompt `/speckit.specify` e nível de prescrição técnica adequado ao checkout de implementação.

## Out of scope

- Implementar, testar, formatar, gerar arquivos ou executar comandos dentro de `delphi/` ou `laravel/`.
- Implementar qualquer alteração funcional neste workspace.
- Migrar ou redesenhar o Frente de Caixa; somente seu contrato de elegibilidade do Orçamento será analisado.
- Alterar o comportamento funcional de `LPA` ou das demais origens já suportadas, salvo a evolução compatível do componente compartilhado necessária ao adaptador `ORC`.
- Transformar limitações, inconsistências ou possíveis bugs do Delphi em requisitos sem decisão explícita.
- Tratar conferência de Cadastro de Cliente/Fornecedor, inventário ou contagem de Saldo de Estoque como Conferência de Produtos do Orçamento.
