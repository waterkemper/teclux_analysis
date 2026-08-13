# Prompt `/speckit.specify` — Gate deve exigir alvo Transferência elegível

## Contexto

As specs 361/362 já exigem que o smoke use diagnóstico e grupo do mesmo alvo. Na implementação atual, o dry-run com `persistir_alvo=true` pode gravar `estado_preparacao=FalhaOperacional` quando faltam fontes fiscais, enquanto o gate valida apenas identidade do grupo e ainda pode liberar `liberado_rb03=true`.

Não implementar nesta etapa. Gerar somente uma spec `/speckit.specify`, preservando o escopo `Transferencia`, NF-e 55, homologação e sem reabrir Venda/Devolução.

## Objetivo

Fazer o gate representar uma decisão real de go/no-go: grupo inexistente, tipo fora de escopo ou grupo persistido como inelegível nunca libera RB-03.

## Requisitos

- O grupo deve existir, ser `Transferencia`, pertencer à filial base/UF/modelo/ambiente/snapshot do diagnóstico e estar em estado de preparação elegível.
- `FalhaOperacional`, bloqueios persistidos ou fotografia/fonte incompleta devem produzir código tipado e `liberado_rb03=false`.
- O próximo passo deve orientar corrigir fontes e repetir o dry-run/ensure; não emitir para “descobrir” a falha.
- O gate continua somente leitura e não pode alocar, selar, transmitir, projetar ou apagar o grupo.
- O dry-run deve continuar podendo persistir apenas identidade, sem série, número, emissão ou fotografia selada.
- Se o schema atual não persistir a lista de bloqueios, usar estado explícito e documentado; não inferir elegibilidade pela simples existência da chave.

## Testes de aceite

- Grupo `Elegivel` + diagnóstico coerente → `liberado_rb03=true`, `rb03_executado=false`, próximo passo `emitir`.
- Grupo `FalhaOperacional` + diagnóstico coerente → bloqueio tipado, próximo passo `repetir_dry_run`/`corrigir_alvo`, zero transmissão.
- Grupo ausente, tipo histórico, filial divergente ou snapshot divergente → bloqueio existente preservado.
- Teste de integração prova que o gate não cria série/número/emissão e não chama gateway SEFAZ.
- Roteiro de homologação deve parar antes do POST quando o gate não estiver liberado.

## Saída esperada

Publicar spec, contrato de códigos/próximo passo, tarefas e atualização do quickstart. Não alterar código nesta chamada e não declarar prontidão sem suíte PHP 8.5 verde.
