# Prompt para `/speckit.specify` — Reposição ECC: fundação e orquestração

```text
/speckit.specify

Crie uma especificação funcional e técnica para a fundação e a orquestração da **Reposição ECC** (Estoque → Compras → Reposição ECC), uma automação operacional sobre a Consulta de Compras existente. Não implemente código nesta etapa. Inspecione o checkout Laravel e cite arquivos concretos. Use como fonte de decisões o mapa scratch/consulta-compras-automacao-wayfinder/map.md` 
e os tickets resolvidos desse diretório.

## Fronteira

Defina o domínio, configuração, ciclo de vida e agendamento das três Rotinas de Reposição ECC:

1. **Geralzão**: a cada 15 dias corridos, contando a partir da ativação;
2. **Vendido do dia anterior**: diariamente, usando o dia anterior como janela de vendas;
3. **Produtos novos recebidos**: diariamente, usando o dia anterior para entrada de NF e um Depósito explicitamente configurado.

A configuração é por Filial Requisitante e por tipo de Rotina. Cada rotina deve possuir seus próprios filtros e parâmetros, pode ser clonada como configuração inicial e depois evolui independentemente. Não criar valores padrão globais ou específicos de uma base; não pré-configurar o Depósito 07 nem qualquer filial, horário, filtro ou meta.

Inclua ativação somente quando a configuração obrigatória estiver preenchida e válida, recuperação controlada de ocorrências perdidas e a fotografia dos parâmetros efetivamente utilizados em cada execução.

## Modelo operacional

Especifique, sem inventar nomes definitivos antes de inspecionar o checkout:

- rotina configurada;
- ocorrência/agendamento;
- execução;
- snapshot imutável de configuração e fatos;
- lote de propostas pendente;
- item de proposta por produto, Filial Requisitante, fonte e quantidade;
- ligação futura com exceções, confirmação, auditoria e `pedidosfiliais`.

Deve existir no máximo um lote pendente para a mesma Rotina, Filial Requisitante e cenário. Nova execução nessa condição não duplica propostas: registra bloqueio/alerta e aponta para o lote existente. Retry de cálculo e publicação deve ser idempotente enquanto o lote não foi confirmado.

## Orquestração Laravel

Inspecione e reutilize:

- `ConsultaComprasSugestaoService` e `ConsultaComprasRequisicaoService`;
- `GerarConsultaComprasSugestaoJob`, tratando-o como motor pesado/interativo existente, não como orquestração recorrente completa;
- `OperationalTaskRegistry`, `OperationalSchedulerTickCommand`, `scheduled_occurrences` e `operational_executions`;
- `RequisicaoFiliaisCommandService` e a documentação de `laravel/docs/architecture/requisicao-filiais-nucleo.md`.

Defina o contrato do novo task/job ECC, a chave de idempotência, a unidade de execução, o tratamento de falha, retry, observabilidade e o limite entre cálculo/publicação da proposta e confirmação humana. O job pode calcular e persistir propostas, mas não pode gravar diretamente efeitos de estoque ou confirmar `pedidosfiliais`.

## Interface e escopo

A operação automatizada terá uma tela própria, em área de Reposição ECC sob Estoques → Compras, reunindo rotinas, lotes, revisão, exceções, indicadores e histórico. A tela manual Estoques → Compras → Consultas permanece preservada; no máximo recebe um atalho para a nova operação. Não misture a fila automatizada ao fluxo manual.

## Evidência e classificação

Classifique cada descoberta como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA, sempre citando arquivo/trecho. Quando uma decisão deste prompt divergir da implementação existente, preserve a decisão do mapa e descreva o seam de evolução.

## Aceite mínimo

- [ ] As três rotinas e suas janelas estão modeladas sem defaults ocultos.
- [ ] Configuração é independente por Filial Requisitante e rotina.
- [ ] Cada execução congela configuração e fatos usados.
- [ ] Não existe lote pendente duplicado para o mesmo cenário.
- [ ] Retry não duplica execução nem proposta.
- [ ] O agendamento usa a infraestrutura operacional existente.
- [ ] Nenhum job confirma `pedidosfiliais` ou movimenta estoque diretamente.
- [ ] A tela automatizada é separada da Consulta manual.
```

### Fontes obrigatórias

- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/map.md`;
- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/01-diagnosticar-cobertura-manual-laravel.md`;
- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/03-definir-perfis-e-agendamento-operacional.md`;
- `/mnt/c/teclux_analysis/.scratch/consulta-compras-automacao-wayfinder/issues/06-definir-execucao-segura-e-auditoria.md`;
- `/mnt/c/teclux_analysis/.scratch/consulta-compras-wayfinder/docs/procedimentos.pdf`;
- `/mnt/c/teclux_analysis/laravel/docs/architecture/consulta-compras-motor-sugestao.md`;
- `/mnt/c/teclux_analysis/laravel/docs/architecture/requisicao-filiais-nucleo.md`;
- `/mnt/c/teclux_analysis/laravel/backend/app/Services/Estoque/ConsultaComprasSugestaoService.php`;
- `/mnt/c/teclux_analysis/laravel/backend/app/Jobs/Estoque/GerarConsultaComprasSugestaoJob.php`, se o caminho confirmado for diferente, localizá-lo por classe;
- `/mnt/c/teclux_analysis/laravel/backend/app/Application/Operations/OperationalTaskRegistry.php`.
