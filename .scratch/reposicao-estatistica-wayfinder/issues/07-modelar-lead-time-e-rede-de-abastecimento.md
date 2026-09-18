# Modelar lead time e rede de abastecimento

Type: task
Status: resolved
Blocked by: 01

## Question

Como medir lead time e sua variabilidade a partir de transferências entre filiais, pedidos, separação, expedição, romaneio, recebimento e entradas/NF, distinguindo calendário, atrasos e fontes não confiáveis?

## Answer

Pesquisa registrada em [lead time e rede de abastecimento](../research/lead-time-e-rede.md).

O primeiro cálculo usará os marcos que existem: criação da requisição, saída para trânsito e recebimento. Serão separados lead time total, tempo em trânsito, espera pré-trânsito e atraso. Durações usarão instantes e timezone da filial; agregações usarão a data local. O resultado exibirá mediana, P80/P95, amostra, marcos ausentes e censura.

O legado não tem timestamps universais e confiáveis para aprovação, separação e expedição; `datahoraalteracaousuario` não será usado como se identificasse uma etapa. Sem histórico confiável de fornecedor ou fonte, o sistema usará configuração/fallback conservador com baixa confiança.

Transferências e compras terão lead times e métricas separados. A transferência só usará saldo disponível após reservas e compromissos, sem contar `transito` como saldo imediato. Múltiplas fontes serão parcelas independentes e passarão por revalidação; transferência atende primeiro e compras cobrem o residual. Nenhuma regra de concentradora, autorização ou `pedidosfiliais` será bypassada.

Definir como a recomendação escolhe fonte, combina múltiplas fontes e respeita concentradoras, filial requisitante, estoque disponível, trânsito, reservas, capacidade e as regras atuais de requisição entre filiais.
