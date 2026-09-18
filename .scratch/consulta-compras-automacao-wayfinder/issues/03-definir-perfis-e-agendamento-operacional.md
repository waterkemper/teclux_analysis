# Definir perfis, janelas e agendamento das rotinas de reposição

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como parametrizar os três perfis do manual — revisão quinzenal do “Geralzão”, vendido do dia anterior e produtos novos recebidos no depósito — por filial requisitante, filiais fornecedoras, depósito, janela de dados, cobertura-alvo, dias mínimo/máximo e calendário/horário de execução?

## Answer

### Decisão

A automação terá três tipos fixos de Rotina de Reposição ECC:

1. Geralzão: execução a cada 15 dias corridos por Filial Requisitante, contando a partir da ativação.
2. Vendido do dia anterior: execução diária, em horário configurável por Filial, usando o dia anterior como janela.
3. Produtos novos recebidos: execução diária, em horário configurável por Filial, usando o dia anterior para entrada de NF e o Depósito explicitamente configurado.

A configuração será persistida por Filial Requisitante e tipo de Rotina. Cada Rotina terá seus próprios filtros e parâmetros, com possibilidade de clonagem, mas sem compartilhar uma configuração viva com outras Rotinas.

Cada Rotina deverá configurar explicitamente:

- ativação;
- horário e periodicidade;
- filtros de Produtos;
- metas de cobertura e dias mínimo/máximo;
- regras e status de estoque;
- tabela redutora e curva ABC, quando aplicáveis;
- Depósito, quando aplicável;
- demais parâmetros do motor.

Não haverá valores padrão globais ou específicos de uma base. O Depósito 07 do manual não será pré-configurado. Uma Rotina só poderá ser ativada quando seus campos obrigatórios estiverem preenchidos e válidos.

As Filiais fornecedoras não serão cadastradas como lista fixa. O job buscará dinamicamente as Filiais elegíveis com estoque disponível, excluindo a Filial Requisitante. A prioridade entre Depósito e outras Filiais será definida pelo ticket de alocação.

Execuções perdidas terão recuperação controlada, sem duplicar lotes. Cada execução guardará uma fotografia dos filtros e parâmetros efetivamente utilizados.

Classificação: DECISÃO NOVA, confirmada pelo cliente durante a sessão.
