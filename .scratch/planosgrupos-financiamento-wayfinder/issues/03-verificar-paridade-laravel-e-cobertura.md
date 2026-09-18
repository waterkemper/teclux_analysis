# Verificar paridade Laravel e cobertura do cenário

Type: research
Status: resolved
Blocked by:

## Question

O Laravel deriva os grupos dos produtos, aplica a regra integral em todos os caminhos de seleção/confirmacão e possui testes para o caso informado?

## Evidence

- `laravel/backend/app/Services/Vendas/Financiamento/PlanosFinanciamentoFilter.php:137-151` retorna verdadeiro na primeira interseção entre grupos do documento e grupos do plano; isso diverge da regra integral adotada.
- `laravel/backend/app/Services/Vendas/Financiamento/PlanosFinanciamentoFilter.php:74-78` só aplica o filtro quando arrays são recebidos.
- `laravel/backend/app/Services/Vendas/Orcamentos/OrcamentoFinanciamentoEmbutidoService.php:575-585` apenas repassa `grupos/classes` opcionais; não os deriva das linhas do orçamento.
- `laravel/backend/resources/js/Pages/Vendas/Orcamentos/components/FinanciamentoEmbutidoPanel.tsx:237-250` monta payload apenas com valores monetários e crédito; não envia grupos/classes.
- `laravel/backend/app/Services/Vendas/Contratos/ContratoPropostaFinanceiraService.php:63-80` e `:340-355` resolvem o plano do contrato sem passar grupos/classes ao filtro compartilhado.
- `laravel/backend/app/Infrastructure/Persistence/Legacy/Vendas/LegacyPlanosSimulacaoRepository.php:157-182` lê corretamente `planosgrupos`, portanto a falha é de semântica/propagação, não da ausência da tabela.
- Não foram localizados testes específicos para `planosgrupos` no financiamento. PHPUnit não executou no ambiente atual: instalado exige PHP >= 8.3, disponível PHP 8.2.21.

## Finding

CONFIRMADO: o Laravel também não atende ao cenário como está. No Orçamento, a ausência de grupos no payload deixa a filtragem sem efeito; quando grupos são enviados, qualquer interseção é suficiente. No fluxo Laravel de Contratos, o plano explícito não passa pelo filtro de grupos.

