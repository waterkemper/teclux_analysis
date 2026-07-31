# Prompt para /speckit.specify — Central de Emissões NF-e

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para a Central de Emissões NF-e, construída sobre `05-speckit-prompt.md`, `06-speckit-prompt.md` e `07-speckit-prompt.md`. Ela será a superfície principal de operação fiscal no Laravel.

Não implemente. Inspecione layouts, autorização, navegação e padrões de grids existentes. A UX definitiva será avaliada posteriormente pelo usuário; especifique comportamento e estados sem cristalizar detalhes visuais desnecessários.

## Limite desta entrega

- filas e Pendências Fiscais Acionáveis por Filial, origem, período, modelo, série e situação;
- detalhe com situação fiscal separada do processamento, idade, Tentativas, erros acionáveis, reconciliação e Artefatos;
- capabilities server-side para acompanhar, corrigir, reconciliar/retransmitir quando liberado, imprimir e baixar;
- papéis: Operador acompanha/corrige/imprime/baixa/distribui; Autorizador acumula ações sensíveis;
- aviso no login para usuário com permissão quando existir pendência, mantendo o comportamento inicial do Delphi;
- pendências não expiram por idade e a interface acompanha o mesmo comando assíncrono sem exigir página aberta;
- paginação, filtros, acessibilidade, estados vazios e falhas parciais.

Não inclua cancelamento, CC-e, inutilização, contingência ou distribuição; apenas deixe os pontos de extensão/capabilities preparados.

## Testes obrigatórios

- listagem/filtragem e isolamento por autorização/Filial;
- ação incompatível ou payload manipulado é recusado no servidor;
- usuário emissor com pendência recebe aviso; sem pendência ou permissão não recebe;
- pendência antiga continua visível;
- atualização/reabertura acompanha o mesmo comando sem retransmitir;
- falha em um painel não apaga os demais dados operacionais.

Produza spec, plano, contrato da consulta, matriz estado × capability × papel e testes. Não implemente durante `/speckit.specify`.
```
