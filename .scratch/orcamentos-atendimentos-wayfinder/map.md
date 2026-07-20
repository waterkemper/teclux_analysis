# Finalizar Atendimentos no Cadastro de Orçamentos

Label: wayfinder:map

## Destination

Tornar claro o caminho para um prompt detalhado e baseado em evidências para `/speckit.specify`, destinado a finalizar exclusivamente a aba Atendimentos e a ação Atendimento do Cadastro de Orçamentos no Laravel, comparando Delphi e Laravel existente sem implementar alterações neste workspace.

## Notes

- Consultar `grilling` e `domain-modeling` durante as decisões; fazer uma pergunta por vez quando houver escolha de negócio.
- Tratar `delphi/` e `laravel/` como fontes somente de leitura. Analisar PAS e DFM conjuntamente e confrontar toda conclusão com o Laravel existente.
- Classificar achados como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre com evidência concreta.
- A aba é um histórico somente de leitura dos Atendimentos cujo vínculo `orcamento` corresponde ao Orçamento atual. Não é o Cadastro de Atendimentos.
- A inclusão manual ocorre pelo botão Atendimento/F10 e deve reutilizar o modal já empregado pela Consulta de Contratos.
- Após inclusão bem-sucedida, fechar o modal, preservar o estado do Cadastro de Orçamentos e atualizar somente o histórico da aba.
- Visualização e inclusão respeitam separadamente `AtendimentoPolicy::viewAny` e `AtendimentoPolicy::create`; permissão sobre Orçamento não as substitui.
- O histórico permanece disponível para qualquer Situação de Orçamento salvo. A inclusão exige Orçamento ativo, salvo e com Cliente identificado.
- Não criar Cliente implicitamente. Quando houver apenas nome livre, orientar seleção ou Cadastro Expresso antes do Atendimento.
- Ordenar Atendimentos do mais recente para o mais antigo, seguindo o padrão Laravel da Consulta de Contratos, sem agrupamento especial de follow-ups.
- O prompt final será gravado em `modules/`, `docs/` ou `.scratch/`; nenhuma implementação será feita aqui.

## Decisions so far

<!-- Uma linha por ticket resolvido, com link e síntese. -->

- [Evidência Delphi da aba Atendimentos](issues/01-documentar-evidencia-delphi.md): histórico textual somente leitura filtrado pelo Orçamento atual; Atendimento/F10 cria registro aberto no contexto `'O'`, podendo herdar a família anterior. Criação implícita de Cliente, rotação anômala da lista e possível refresh repetitivo foram isolados como não-requisitos.

## Not yet specified

- Estados de carregamento, vazio, falha e atualização da aba, a graduar após o inventário dos dois sistemas.
- Forma exata do contrato de consulta do histórico e do contexto de host `orcamentos`, a graduar após o levantamento Laravel.
- Cobertura mínima de testes e critérios mensuráveis de aceite, dependentes da análise de lacunas.
- Estrutura final e nível de prescrição do prompt `/speckit.specify`, dependentes das decisões funcionais anteriores.

## Out of scope

- Implementar, testar, formatar, gerar arquivos ou executar comandos dentro de `delphi/` ou `laravel/`.
- Alterar outras abas ou fluxos do Cadastro de Orçamentos.
- Editar ou excluir Atendimento existente pela aba; ela é somente de leitura.
- Criar Cliente implicitamente ao acionar Atendimento.
- Implementar nesta especificação os Atendimentos automáticos do Delphi gerados por cancelamento, conversão em Contrato, agendamento de produtos ou envio de e-mail; serão apenas registrados como lacunas futuras.
