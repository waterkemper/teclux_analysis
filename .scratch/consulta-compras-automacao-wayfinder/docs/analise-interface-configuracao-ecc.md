# Análise — interface e configurabilidade das Rotinas ECC

## Conclusão

O código está no modelo A descrito no material: três tipos canônicos, agenda e overlay temporal fixos, com `parametros_json` e `motor_json` preparados para receber a configuração da Consulta de Compras.

A lacuna principal é de interface, não de motor. O backend já possui persistência, `show`, `update` e validação de ativação, mas a tela:

- envia `parametros_json: {}` e `motor_json: {}` ao criar (`ReposicaoEcc/Index.tsx:221-243`);
- não renderiza o painel de filtros da Consulta de Compras;
- não edita uma rotina existente;
- não expõe timezone;
- não oferece os catálogos/lookups necessários para produto, fornecedor, grupo fornecedor e conceito;
- não mostra ao operador quais regras são fixas do tipo e quais foram configuradas.

## Decisões preservadas

1. `tipo` continua sendo um código interno fixo: `geralzao`, `vendido_dia_anterior` e `produtos_novos_recebidos`.
2. A cadência deve ser separada do tipo e configurável por rotina. O tipo continua fixando o comportamento e o overlay temporal; `intervalo_dias` define a distância entre execuções. Não criar novos tipos nem perfis ilimitados nesta etapa.
3. O período operacional da rotina é configurado por `numero_dias`; `data_inicial` e `data_final` do snapshot são calculadas pelo dispatcher no dia civil da execução.
4. Os overlays de `ultima_venda` e `entrada_nf` devem aparecer na UI como regras automáticas do tipo. O snapshot continua sendo a fonte da verdade efetiva.
5. Não criar defaults de cliente: nenhuma filial, grupo, depósito, marca, curva, filtro ou horário deve ser inventado pelo produto.
6. A criação continua podendo gerar uma rotina inativa incompleta; ativar só é permitido após a validação existente do backend.
7. É aceitável acrescentar `nome_exibicao` opcional como alias visual, sem substituir nem tornar configurável o `tipo` canônico.

## Direção de interface

Usar um único editor de configuração para criação e edição. O editor deve reutilizar os módulos da Consulta de Compras — seleção de filiais, `ProductFilterPanel`, `SupplierFilterPanel`, período, status, flags, compostos, conceitos e `MotorOpcoesPanel` — por meio de uma interface de estado/hidratação comum, sem duplicar as regras de payload.

A tela deve separar visualmente:

- **Identidade e agenda:** filial requisitante, tipo, alias opcional, horário e timezone.
- **Filtros da Consulta:** parâmetros persistidos na rotina.
- **Motor de sugestão:** `motor_json` persistido na rotina.
- **Regras automáticas do tipo:** agenda e filtros de data impostos no snapshot, somente leitura.
- **Estado de ativação:** resumo de configuração faltante e ação para salvar/ativar.

## Roteiro de prompts

| Prompt | Resultado |
|---|---|
| 23 | Contrato backend editável, alias opcional, intervalo de execução, descriptors do tipo, lookups ECC e estado de configuração |
| 24 | Editor compartilhado dos parâmetros/motor da Consulta de Compras, com hidratação e round-trip |
| 25 | Tela de criação/edição, resumo de configuração, cadência, regras automáticas e ciclo salvar/ativar |
| 26 | Testes de integração, cadência, overlays no snapshot, OCC, ausência de defaults e matriz de aceite |

## Fora desta evolução

- N perfis por filial ou criação de novos tipos.
- Alteração do cálculo, alocação, concentração, prefixos, gerente de vendas ou confirmação.
- Alteração do contrato de `pedidosfiliais`.
