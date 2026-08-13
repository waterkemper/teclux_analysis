# Prompt de implementação — Fotografia autoritativa completa

```text
/speckit.implement

Implemente R2 de `laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md`, depois de R1 concluído.

O request fornece apenas identificador, filtro autorizado e OCC. Carregue no servidor a transferência confirmada, revisão, linhas, lotes, estoque/reserva, FilialBase, FilialRequisitante e filial física.

Complete os loaders e a fotografia com participante, endereço, UF/IBGE, regime, produto, unidade/conversão, NCM/CEST/GTIN, preço, classificação, impostos, totais, transporte e volumes. Ausência ou conflito deve bloquear antes do seal. Contrato, crédito, pagamentos, vencimentos financeiros e referências de devolução estão fora do escopo desta ponte.

Remova defaults como `00000000`, `5152`, `SP`, código fiscal inventado, descrição genérica, unidade fallback e fixture global. `TransferenciaFiscalTestFotografiaFixture` só pode ser chamado por teste ou dry-run explicitamente isolado, nunca pelo fluxo HTTP real ou pela reprojeção.

Adicione testes para preço/tributo/transporte/volume ausente, filial física incorreta, revisão concorrente, cadastro alterado após seal, tentativa de alterar linhas/totais pelo request e rejeição dos tipos históricos fora do escopo. Prove que retry usa a revisão persistida.
```
