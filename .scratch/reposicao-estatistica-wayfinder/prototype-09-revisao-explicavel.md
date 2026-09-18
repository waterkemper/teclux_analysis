# Protótipo descartável — revisão explicável da reposição estatística

> Artefato de validação de interface do ticket 09. Não é especificação final nem implementação de produção.

## Contexto comum

Execução: **01/09/2026 06:30** · Rotina: **Lojas — Curva A/B** · Snapshot: **#20260901-0630-0042** · Estado: **pronto para revisão**.

Filtros fotografados: 12 filiais requisitantes · produtos ativos · 30 dias de vendas · curva A/B · estoque disponível configurado pelo cliente · sem embalagens/múltiplos.

Indicadores:

| Candidatos | Recomendados | Alertas | Bloqueados |
|---:|---:|---:|---:|
| 184 | 96 | 21 | 7 |

Produto de exemplo:

**3260200 — (C)CONDICIONADOR CHEIRINHO PROLONGADO 200ML JOHNSON**

Filial requisitante: **12 — Campinas** · disponível 3 · projetado no horizonte 5 · mínimo 8 · máximo 30 · sugestão estatística 24.

Fontes para transferência: filial 04 (18) + filial 07 (6). A quantidade final deverá passar pela revalidação ECC antes de gerar pedidosfiliais.

Explicação: demanda prevista 26,4 unidades no horizonte; estoque de segurança 4,2; cobertura atual 3,4 dias; lead time configurado 2 dias; modelo ETS sazonal; confiança 92%; ECC sugere 18.

Alertas: **divergência estatística × ECC** e **fonte 04 próxima do mínimo**.

## Variante A — Bancada de decisão

Objetivo: permitir que o operador percorra a lista e veja o detalhe sem perder o contexto da execução.

~~~text
┌ Reposição inteligente ─ Lojas — Curva A/B ───────────────────────────────┐
│ Execução #0042  Pronta para revisão   Snapshot 01/09 06:30   [Revalidar] │
│ 184 candidatos     96 recomendados     21 alertas       7 bloqueados      │
├ Filtros fotografados: 12 filiais · 30 dias · A/B · produtos ativos       │
├──────────────────────────────────────┬───────────────────────────────────┤
│ Produto / destino      Sug.  ECC  Risco│ Evidência do item                 │
│ ● 3260200 / Filial 12   24    18   alto │ previsão        26,4             │
│   (C)CONDICIONADOR...                   │ estoque atual    3               │
│ ○ Mesa ...                5     5 médio │ estoque projet.  5               │
│ ○ Kit ...                 0     0 baixo │ mínimo / máximo  8 / 30          │
│                                      │ cobertura         3,4 dias        │
│                                      │ fontes            04:18 + 07:6     │
│                                      │ modelo/confiança ETS / 92%         │
│                                      │ [Ver histórico] [Ver cálculo]       │
├──────────────────────────────────────┴───────────────────────────────────┤
│ 96 itens selecionados   [Excluir selecionados] [Aprovar revisão]         │
└───────────────────────────────────────────────────────────────────────────┘
~~~

Interação principal: selecionar uma linha abre sua evidência; excluir exige motivo. “Aprovar revisão” abre confirmação com resumo, exige justificativa quando houver alerta e informa que a revalidação ECC ocorrerá antes da geração.

## Variante B — Fila de risco

Objetivo: priorizar exceções que exigem julgamento humano antes dos itens rotineiros.

~~~text
┌ Revisão por risco ───────────────────────────────────────────────────────┐
│ [Todos 96] [Alto 21] [Médio 34] [Baixo 41]     [Filtrar destino ▾]       │
├ ALTO ─────────────────────────────────────────────── 21 itens ────────────┤
│ 3260200  Filial 12  24 un  Estatística 24 × ECC 18  Fonte sob mínimo     │
│ 4491001  Filial 03   8 un  Confiança 61%            Histórico irregular    │
├ MÉDIO ────────────────────────────────────────────── 34 itens ────────────┤
│ 2203010  Filial 07   5 un  Cobertura 4,1 dias       [Abrir evidência]     │
├ BAIXO ────────────────────────────────────────────── 41 itens ────────────┤
│ 1130002  Filial 02   3 un  Dentro da política      [Selecionar todos]    │
├───────────────────────────────────────────────────────────────────────────┤
│ Selecionados: 0                         [Revalidar] [Aprovar selecionados] │
└───────────────────────────────────────────────────────────────────────────┘
                 ┌ Evidência do item ─────────────────────┐
                 │ motivo do risco                         │
                 │ série de vendas [mini gráfico]          │
                 │ previsão / intervalo / estoque          │
                 │ fontes e impacto no mínimo              │
                 │ [Manter] [Excluir] [Editar quantidade]  │
                 └────────────────────────────────────────┘
~~~

Interação principal: a fila começa nos riscos altos; o operador pode manter, excluir ou editar a quantidade. Qualquer edição registra valor original, valor informado e justificativa.

## Variante C — Conferência por produto

Objetivo: dar máxima transparência ao cálculo, para um operador que precisa auditar a recomendação item a item.

~~~text
┌ Conferência do produto ──────────────────────────────────────────────────┐
│ 3260200  (C)CONDICIONADOR...                 [Anterior] [Próximo]        │
│ Destino: Filial 12 — Campinas                Estado: requer atenção      │
├ DEMANDA ────────────────┬ ESTOQUE ───────────────┬ DECISÃO ──────────────┤
│ vendas 30d       31     │ disponível       3     │ estatística       24  │
│ previsão horizonte 26,4│ projetado         5     │ ECC               18  │
│ intervalo 90%   18–36  │ mínimo / máximo 8 / 30 │ quantidade editada 24 │
│ modelo ETS 92%          │ cobertura       3,4 d   │ fontes       04 + 07  │
├ SÉRIE E PREVISÃO ─────────────────────────────────────────────────────────┤
│ vendas: ▁▂▁▃▂▅▃▆▅▇▆▅▇    previsão: ┄┄┄┄┄┄┄┄┄┄┄┄                  │
├ REGRAS APLICADAS ─────────────────────────────────────────────────────────┤
│ ✓ produto ativo   ✓ curva A/B   ✓ estoque configurado   ! fonte próxima  │
│ Snapshot #0042 · filtros e parâmetros somente leitura                    │
├───────────────────────────────────────────────────────────────────────────┤
│ [Excluir item] [Editar quantidade] [Voltar à lista] [Aprovar item]       │
└───────────────────────────────────────────────────────────────────────────┘
~~~

Interação principal: “Aprovar item” aprova apenas a decisão corrente. O operador consegue abrir o histórico e o cálculo, mas não altera o snapshot nem os filtros daquela execução.

## Estados obrigatórios comuns

1. **Snapshot obsoleto:** mostrar “os dados mudaram desde esta execução”; impedir aprovação direta e oferecer revalidação/novo snapshot.
2. **Falha de qualidade ou infraestrutura:** bloquear recomendação estatística, explicar a causa e oferecer fallback para ECC/revisão manual.
3. **Conflito estatística × ECC:** não esconder nenhuma sugestão; mostrar as duas, a regra que prevaleceu após revalidação e exigir justificativa se houver edição.
4. **Fonte insuficiente:** mostrar quais filiais foram consideradas, o impacto de retirar cada quantidade e o saldo residual após a transferência.
5. **Aprovação concluída:** exibir que a revalidação ECC foi executada e informar quantas requisições pedidosfiliais foram geradas, sem prometer geração quando a revalidação reduzir a zero.

## Decisão solicitada ao operador

Escolher a estrutura que melhor representa a rotina diária:

- **A:** melhor equilíbrio entre lista e detalhe.
- **B:** melhor para trabalhar exceções e alto risco.
- **C:** melhor para auditoria e confiança no cálculo.

Após a escolha, a estrutura será convertida em requisitos de tela no próximo prompt speckit.specify; este artefato continuará descartável.
