# Prompt para /speckit.specify — espelhamento das emissões Delphi

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para espelhar no Laravel as emissões ainda controladas pelo Delphi, sem dupla posse. Depende de `05-speckit-prompt.md` e `07-speckit-prompt.md`.

Não implemente. Inspecione o schema e os repositórios Laravel, mas não abra fontes Delphi nem faça escrita experimental no banco legado.

## Limite desta entrega

- sincronizador somente leitura na fila `fiscal-espelhamento-delphi`;
- cursor composto por `updated_at` mais `dadosfiscais.numero`, polling de cinco segundos, sobreposição curta e varredura diária;
- carga inicial de pendentes/inconsistentes, autorizadas dentro de janelas de eventos e últimos 30 dias, sem backfill massivo;
- Espelho Fiscal somente leitura para registro sem vínculo;
- derivação por protocolos/evidências, nunca apenas `dadosfiscais.situacao`;
- importação idempotente de chave, protocolo, estado e catálogo de Artefatos acessíveis;
- colisão/chave divergente bloqueada e alertada;
- identificação clara de origem e posse na Central.

Não inclua corrigir registros Delphi, escrever em diretórios compartilhados, transmitir pelo Laravel ou transferir posse.

## Testes obrigatórios

- polling incremental, sobreposição e varredura não duplicam espelhos;
- carga inicial respeita a janela;
- divergência e colisão bloqueiam ações mutáveis;
- atualização Delphi converge o espelho sem reescrever Fotografia histórica;
- Laravel recusa transmissão/evento enquanto a posse for Delphi;
- falha/reinício retoma do cursor durável.

Produza spec, plano, contrato do sincronizador, regras de derivação e testes. Não implemente durante `/speckit.specify`.
```
