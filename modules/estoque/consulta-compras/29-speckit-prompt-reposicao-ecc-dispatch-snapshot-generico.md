# Prompt 29 - Dispatcher, regras temporais e snapshot genericos

## Objetivo

Fazer o job executar a configuracao da Rotina ECC, e nao um comportamento codificado por `tipo`.

## Dispatcher e janelas

- Reescrever `DueWindowCalculator` para ler `agenda_json` validado.
- Calcular a proxima janela por intervalo, primeira execucao, horario e timezone da rotina.
- Permitir intervalo 20 ou qualquer outro valor dentro do limite definido pelo contrato sem branch por nome/codigo.
- Trocar chaves e buscas de unicidade de `(filial, tipo, janela, ciclo)` para `rotina_id` e janela/ciclo.
- Manter idempotencia entre varias instancias do dispatcher.
- Alteracao de agenda vale para janelas futuras; nao reabre nem altera janela vencida, snapshot ou lote existente.

## Materializacao do snapshot

Na criacao do snapshot, resolver e gravar:

- nome e identidade da rotina;
- filial, agenda e janela;
- periodo deslizante de velocidade (`data_inicial = D - numero_dias`, `data_final = D`);
- regras temporais efetivas resolvidas para datas civis concretas;
- `parametros_json`, `motor_json` e `politicas_ecc_json` efetivos;
- versao da configuracao e hash canonico do payload completo.

Uma regra `ultima_venda` ou `entrada_nf` somente entra no snapshot se estiver cadastrada em `regras_temporais_json`. Nao inferir regra pelo nome da rotina nem pelo codigo legado.

## Calculo e alocacao

O calculo, prefixos, maximo, concentracao, alocacao multi-fonte, gerente e demais politicas devem receber a configuracao do snapshot por uma interface explicita. Nao ler a rotina viva durante o processamento de um snapshot.

Preservar as invariantes ja acordadas: concentradora recebe requisicao de transferencia apenas de filial concentradora, regras M/D/U/F/O/C sao aplicadas conforme politica, e solicitacao de grupo restrito exige credencial de gerente de vendas na conclusao.

## Compatibilidade

Os tres registros migrados devem produzir o mesmo resultado funcional anterior. A compatibilidade deve ser implementada como configuracao backfillada ou adapter de leitura, nao como novos `if ($tipo === ...)` no motor.

## Testes obrigatorios

- rotina com intervalo 20 gera D+20 e nao D+15;
- duas rotinas da mesma filial geram janelas e lotes independentes;
- regra temporal configurada gera o recorte correto;
- ausencia de regra temporal nao injeta D-1;
- alterar a rotina depois do snapshot nao muda o processamento;
- retry e replicas nao duplicam janela, snapshot ou lote;
- cenarios legados continuam equivalentes.

