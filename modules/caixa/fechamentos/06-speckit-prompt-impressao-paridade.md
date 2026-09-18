# Prompt para `/speckit.specify` — Fechamento de Caixa: impressão e alterações de evento

## Objetivo

Revise e especifique a impressão do Fechamento de Caixa no Laravel para que ela tenha um contrato explícito de paridade com o Delphi, especialmente quando há alteração de `autenticacoes.evento` pendente ou já persistida.

Use como evidência:

- `delphi/apps/caixa/dmfechamentocaixa.pas`, `dmfechamentocaixa.dfm` e `fmfechamentocaixa.pas`;
- `laravel/backend/app/Application/Caixa/Fechamento/FechamentoCaixaPdfService.php`;
- `laravel/backend/resources/views/reports/caixa/fechamento.blade.php`;
- `laravel/backend/app/Application/Caixa/Fechamento/TotalizarFechamentoCaixaService.php`;
- `laravel/specs/456-caixa-fechamento` e `laravel/specs/457-fix-caixa-fechamento-parity`;
- o prompt complementar de integração bancária `modules/caixa/fechamentos/05-speckit-prompt-evento-integracao-bancaria.md`.

## Constatações que precisam ser tratadas

1. O Delphi `ImprimirFechamento` consulta novamente os dados persistidos e imprime, além do resumo, cancelamentos, cheques a prazo/à vista, depósitos, devoluções, documentos de entrada/saída, duplicatas, perdas, recebimentos, resgate de cheque, resumo de vendas/renegociados e transferências/pendências. `ImprimirDetalhes` força todos esses grupos.
2. A consulta Delphi de autenticações carrega `a.evento`, `e.descricao as descricaoevento` e `a.parametros`; as linhas de documentos e cancelamentos podem mostrar o código/descrição do evento. O catálogo mestre não é alterado pela impressão.
3. No fluxo Delphi F8, a ordem é: imprimir, persistir fechamento do usuário e somente depois chamar `SalvarEventos` para as alterações pendentes. Portanto, o relatório do F8 pode refletir o evento persistido antes da edição da tela. Isso deve ser preservado ou alterado apenas por decisão explícita, com impacto documentado.
4. O Laravel `FechamentoCaixaPdfService` totaliza novamente e passa `eventos` à view, mas `resources/views/reports/caixa/fechamento.blade.php` não renderiza a coleção `eventos` nem implementa os demais onze grupos detalhados; atualmente só há o resumo de vendas condicionado por seção. `imprimir_detalhes` não pode ser considerado implementado apenas porque altera `secoesEfetivas`.

## Decisões obrigatórias

Resolva na especificação, com aceite do produto quando necessário:

- **Snapshot da impressão**: imprimir somente o estado persistido (paridade Delphi) ou salvar as alterações de Eventos antes de imprimir. Se preservar Delphi, a UI deve deixar claro que o PDF não contém alterações pendentes; se mudar, definir autorização, transação, rollback e efeito na integração bancária.
- **Fonte dos dados**: o PDF deve usar uma única totalização coerente com tela/F9/F8 e leituras detalhadas do mesmo `caixa`, `filial` e `data`. A geração do PDF não pode alterar `autenticacoes`, `movtosbancos` ou `movtosbancoseventos`.
- **Evento exibido**: após uma alteração persistida, qualquer seção que o Delphi imprime deve refletir o novo código, descrição e parâmetros; evento inválido ou fora do filtro `E/S` deve produzir erro/recarregamento controlado, nunca um PDF silenciosamente incompleto.
- **Seções**: materializar as 12 seções condicionais definidas na spec 456, com `ImprimirDetalhes` forçando todas, omitindo linhas monetárias zeradas conforme o contrato e exibindo totais/separadores na mesma semântica do Delphi.
- **Cartão/Pix e saldo**: manter a fórmula da spec 456/457; não transformar a impressão numa segunda regra de saldo nem duplicar Cartão/Pix nas entradas.
- **Parâmetros**: chaves de “Cheques a prazo” e “Cheques à vista” devem ser distintas, com fallback legado somente quando explicitamente definido. O payload e o Blade devem usar as mesmas chaves.

## Requisitos técnicos

- Criar um read model/DTO de impressão que diferencie resumo, detalhamento e metadados do evento, sem passar um envelope indefinido diretamente para Blade.
- Implementar as seções detalhadas que existem no Delphi ou registrar formalmente cada exceção de escopo; não declarar a tarefa concluída com um Blade que ignora os flags recebidos.
- Garantir que geração avulsa e geração dentro do F8 tenham o mesmo snapshot e o mesmo contrato de totalização.
- Manter valores como decimal/string via `MoneyDecimal`; a apresentação pode formatar moeda, mas não recalcular valores.
- Definir orçamento de consultas: consultas podem ser separadas por seção por responsabilidade, mas não podem crescer por linha, evento ou renegociação. Registrar e testar o conjunto fixo de SQL.
- Escapar descrições, parâmetros, nomes e observações no HTML; manter o sanitizador de encoding legado na borda.
- Registrar no PDF data/hora de geração, status, filial, caixa, data do movimento e assinaturas, sem incluir senha/prova/autorização.

## Testes obrigatórios

1. PDF avulso com todas as seções desligadas: somente as seções obrigatórias aparecem.
2. `ImprimirDetalhes = true`: as 12 seções aparecem, inclusive quando os flags individuais estão falsos.
3. Cada flag individual controla somente sua própria seção; cheques a prazo e à vista não compartilham estado.
4. Documento/cancelamento com evento antigo e novo: confirmar o snapshot definido, código, descrição, parâmetros e totais exibidos.
5. Alteração de evento pendente na tela seguida de impressão e F8: confirmar explicitamente se o PDF usa o estado antigo (paridade Delphi) ou o novo (decisão Cloud), sem atualizar banco durante a impressão.
6. Depois de salvar evento tipo `D` em filial integrada, verificar em teste PostgreSQL que o PDF não duplica nem corrige manualmente a movimentação bancária; a atualização bancária pertence ao contrato do trigger do prompt 05.
7. Falha do renderer: nenhum fechamento, evento ou lançamento bancário é alterado.
8. Linhas zeradas, descrição SQL_ASCII, duplicata/romaneio, transferência pendente, cartão/Pix e resumo de renegociados.
9. Teste HTML/renderer fake deve comprovar a presença/ausência de cada seção e o conjunto de queries deve permanecer dentro do orçamento.

## Entregáveis

Atualize `specs/456-caixa-fechamento` ou crie uma especificação de correção claramente relacionada. Entregue matriz de seções, contrato do snapshot, DTO/read model, critérios de aceite e plano de implementação/testes. Não implemente antes de resolver a decisão sobre alterações de Eventos pendentes no PDF do F8.
