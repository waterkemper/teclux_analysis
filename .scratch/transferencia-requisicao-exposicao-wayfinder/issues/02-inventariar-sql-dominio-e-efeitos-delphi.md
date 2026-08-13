# Inventariar SQL, domínio e efeitos da Transferência de Requisição para Exposição Delphi

Type: research
Status: resolved
Blocked by:

## Answer

O inventario foi registrado em pesquisa-sql-dominio-efeitos-delphi.md. Ele confirma pedidosfiliais como unidade operacional, as situacoes A/F/D/C, os fluxos de cancelamento/reabertura, lotes, conferencia, confirmacao, estoque/reserva e movimentos TEP/TPE/TFR, alem das consultas auxiliares e objetos que o snapshot precisa confirmar.

O relatorio separa integralmente Emissao Fiscal Eletronica e Venda entre Filiais. Tambem registra os riscos concretos a corrigir no Laravel: macros/texto SQL, consultas por produto/filial em loops, Locate aninhado, logs por linha, locks sem ordem deterministica e revalidacao concorrente insuficiente. A direcao normativa e SQL parametrizado/set-based, locks ordenados e revalidacao sob lock.

## Question

Quais consultas, macros, joins, projeções, filtros em memória, ordenações, tabelas temporárias, sequences, funções, triggers e mutações são alcançados por `dmtransferenciarequisicaoexposicao.pas/.dfm`? Mapear o ciclo de Requisição entre Filiais, lotes de transferência, conferência, confirmação, cancelamento/reabertura, movimentos e reserva/estoque, classificando com precisão tudo que deve ser ignorado por ser emissão fiscal ou “venda entre filiais”. Registrar riscos de N+1, SQL concatenado, joins incorretos e concorrência para decisões posteriores.
