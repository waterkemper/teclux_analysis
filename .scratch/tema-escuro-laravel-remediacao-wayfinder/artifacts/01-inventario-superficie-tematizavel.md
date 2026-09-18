# Inventário da superfície tematizável integral

Data da captura: 2026-09-13  
Branch Laravel: `491-erp-dark-theme`  
Commit auditado: `2e078019f` contra `main` (`561295069`)

## Regra de escopo

Incluído: arquivos `.tsx`, `.ts`, `.jsx`, `.js`, `.css` e `.blade.php` sob `backend/resources`, cobrindo toda superfície interativa Laravel e seus componentes compartilhados.

Excluído por decisão do usuário:

- diretórios `Relatorio`, `Relatorios` e `reports`;
- arquivos cujo nome identifica impressão, PDF ou recibo;
- telas de filtro e visualização próprias dessas famílias;
- CSS e Blade de documentos gerados.

As exclusões são de tema nesta rodada, não autorização para apagar ou modificar os arquivos. Foram encontrados 121 arquivos excluídos e quatro componentes Inertia de relatório: Contas a Pagar `Relatorio/Index` e `Relatorio/View`, Curva ABC e Movimentação Diária.

## Tamanho da superfície

| Métrica | Resultado |
|---|---:|
| Arquivos-fonte em `backend/resources` | 2.169 |
| Arquivos excluídos como relatório/print/PDF | 121 |
| Arquivos incluídos | 2.048 |
| Arquivos JS/TS incluídos | 2.010 |
| Arquivos sob `Pages` | 1.328 |
| Arquivos sob `Components` | 391 |
| Arquivos sob `Layouts` | 4 |
| Componentes Inertia únicos localizados em controllers | 163 |
| Componentes Inertia incluídos | 159 |
| Componentes Inertia excluídos como relatório | 4 |
| Componentes Inertia sem arquivo correspondente | 0 |

Os 159 componentes Inertia incluídos distribuem-se assim: Cadastros 90; Admin 17; Marketplaces 11; Vendas 8; Interlojas 6; Financeiro 6; Fiscal 4; Configurações 3; Entregas 3; SystemParameters 2; Caixa 2; Estoque 2; e uma superfície em Cloud, ERP, Sessão, Auth e Administração.

## Candidatos de cor adaptável

A busca considera utilitários físicos de fundo, texto, borda, ring, outline, divide, placeholder, gradiente, fill e stroke; aliases fixos `teclux-primary|secondary|tertiary|neutral`; e literais hex/rgb/hsl.

| Métrica | Resultado |
|---|---:|
| Arquivos com pelo menos um candidato | 758 |
| Utilitários físicos | 9.074 |
| Utilitários `teclux-*` físicos | 3.316 |
| Literais hex/rgb/hsl | 604 |
| Total de candidatos | 12.994 |

Nem todo candidato é defeito: cores de dados, logos, fotos, paletas configuráveis e paridade Delphi exigem classificação. Papel, texto, borda e foco de chrome são adaptáveis e devem migrar.

### Padrões mais frequentes

| Padrão | Ocorrências |
|---|---:|
| `text-teclux-secondary` | 1.069 |
| `bg-white` | 805 |
| `text-teclux-neutral` | 704 |
| `border-stone-200` | 689 |
| `text-teclux-primary` | 648 |
| `border-slate-200` | 398 |
| `border-slate-300` | 376 |
| `text-slate-500` | 304 |
| `text-slate-600` | 251 |
| `border-stone-300` | 238 |
| `bg-stone-50` | 223 |
| `text-red-700` | 220 |
| `bg-slate-50` | 209 |
| `text-red-600` | 203 |
| `bg-stone-100` | 196 |
| `bg-red-50` | 179 |
| `text-gray-600` | 158 |
| `text-gray-500` | 156 |
| `border-red-200` | 156 |
| `text-white` | 154 |

`text-teclux-secondary` e `text-teclux-neutral` são especialmente críticos: continuam ligados a `#4a4a4a` e `#333333`. Sobre o painel escuro padrão `#182329`, medem aproximadamente 1,81:1 e 1,27:1, abaixo de WCAG AA para texto normal.

## Concentração por área

| Área | Arquivos candidatos | Candidatos |
|---|---:|---:|
| `Pages/Cadastros/Estoque` | 153 | 2.808 |
| `Components` fora dos seams abaixo | 136 | 1.934 |
| `Pages/Vendas` | 59 | 842 |
| `Pages/Marketplaces` | 26 | 625 |
| `Pages/Admin` | 20 | 623 |
| `Components/erp/cadastro` | 23 | 587 |
| `Pages/Interlojas` | 67 | 542 |
| `Pages/Cadastros/ContasPagar` | 28 | 494 |
| `Pages/Cadastros/Vendas` | 19 | 422 |
| `Pages/Cadastros/CobrancaSac` | 21 | 397 |
| `Pages/Entregas` | 38 | 313 |
| `Pages/Financeiro` | 21 | 258 |
| `Pages/SystemParameters` | 6 | 237 |
| `Pages/Cadastros/Users` | 12 | 232 |
| `Components/lookup` | 4 | 230 |
| `Components/erp/consulta` | 14 | 218 |
| `Pages/Cadastros/Enderecos` | 7 | 177 |
| `Pages/Estoque` | 19 | 165 |
| `Pages/Cadastros/Filiais` | 10 | 159 |
| `Pages/Cadastros/Clientes` | 2 | 157 |
| `Pages/Caixa` | 7 | 146 |
| `Components/erp/data-grid` | 17 | 130 |
| `Pages/Configuracoes` | 3 | 130 |

As demais famílias de cadastro também possuem candidatos: Bancos 67; Serviços 44; Listas Padrão 36; Conferências 34; Atividades Econômicas 24; Grupos de Filiais 19; Serviços LCP 116 17; Grupos de Usuários 16; Equipamentos 15; Dime/Sped 7.

## Cobertura real do commit do tema

| Métrica | Resultado |
|---|---:|
| Arquivos alterados pelo commit | 93 |
| Arquivos alterados sob `backend/resources` | 67 |
| Arquivos candidatos tocados | 28 de 758 |
| Arquivos candidatos não tocados | 730 de 758 |
| Candidatos em arquivos tocados | 1.078 |
| Candidatos em arquivos não tocados | 11.916 |

Portanto, o commit tocou somente 3,7% dos arquivos candidatos. “Herdar primitives” não demonstra que uma página está migrada quando o chrome local e seus componentes auxiliares continuam físicos.

### Maiores arquivos candidatos não tocados

| Arquivo | Candidatos |
|---|---:|
| `Pages/SystemParameters/Index.tsx` | 137 |
| `Pages/Cadastros/Estoque/ReposicaoEcc/Operacao.tsx` | 123 |
| `Pages/Cadastros/CobrancaSac/Atendimentos/Cadastro.tsx` | 119 |
| `Pages/Cadastros/Estoque/Produtos/ItensTabPanel.tsx` | 117 |
| `Pages/Cadastros/Clientes/Cadastro.tsx` | 114 |
| `Components/erp/marketplace/marketplaceProductSituationFilters.ts` | 96 |
| `Pages/Cadastros/ContasPagar/QuitacaoEmLote/Index.tsx` | 91 |
| `Pages/Admin/Operations/Index.tsx` | 89 |
| `Components/erp/cadastro/ArquivosAnexadosPanel.tsx` | 85 |
| `Pages/Admin/Marketplaces/Accounts/Dashboard.tsx` | 80 |
| `Pages/Cadastros/Estoque/Inventario/Coleta.tsx` | 79 |
| `Pages/Vendas/Orcamentos/components/OrcamentoValoresPanel.tsx` | 78 |
| `Components/erp/busca-assistida/BuscaAssistidaPanel.tsx` | 76 |
| `Components/erp/voice/ErpVoiceChatDrawer.tsx` | 74 |
| `Pages/Admin/Marketplaces/Products/Index.tsx` | 72 |
| `Pages/Cadastros/Estoque/ConsultaCompras/components/RequisicaoEntreFiliaisModal.tsx` | 69 |
| `Pages/Cadastros/CobrancaSac/MalaDiretaClientes/Index.tsx` | 69 |
| `Pages/Cadastros/ContasPagar/AutorizacaoPagamentos/Index.tsx` | 68 |
| `Pages/Cadastros/Estoque/ConsultaEstoques/components/ConsultaEstoquesDetalheTabs.tsx` | 66 |
| `Pages/Cadastros/Estoque/Grupos/Cadastro.tsx` | 64 |

`welcome.blade.php` (260 candidatos) e `Pages/Prototype` exigem decisão separada: a documentação anterior os trata como exceções, mas ambos têm rotas. Não foram classificados silenciosamente como produção nem removidos do inventário.

## Multiplicadores compartilhados

Contagem de arquivos consumidores/referenciadores no escopo:

| Seam | Consumidores/referências |
|---|---:|
| `Button` | 186 |
| `Input` | 169 |
| `AppLayout` | 164 |
| `CatalogCodeLookup` | 145 |
| `ErpCadastroShell` | 110 |
| `ErpCadastroCommandBar` | 79 |
| `ErpConsultaOperationBar` | 46 |
| `CatalogStringCodeLookup` | 44 |
| `ConsultaFilterSection` | 40 |
| `FormSection` | 25 |
| `DataGrid` | 15 |
| `SelectField` | 10 |
| `ErpDraggableDialog` | 10 |
| `ErpGridShell` | 8 |

Prioridade técnica derivada: corrigir os seams antes de páginas. A auditoria visual já confirmou `ErpCadastroShell`, `ErpCadastroCommandBar` e `RomaneioNumeroInput` como fontes de faixas/controles claros em várias telas.

## Guardrail e smoke atuais

- `themeColorAllowlist.ts` escaneia apenas 14 arquivos.
- Detecta somente `bg-white`, `dark:`, `ring-offset-white` e `bg-black/40`.
- Não detecta `stone/slate/gray`, textos, bordas, gradientes, aliases `teclux-secondary/neutral` ou literais de chrome.
- Não exige que toda tela declarada migrada entre no scan.
- `appearanceSmokeMatrix.test.ts` não renderiza nem navega pelas cinco superfícies listadas; apenas alterna atributos do `documentElement`.

Esses checks podem ficar verdes com milhares de candidatos e ilhas claras remanescentes.

## Evidência visual já confirmada

- Cadastro de Produtos: fieldsets físicos translúcidos viram cinza claro; metade inferior e controles permanecem claros; textos físicos falham contraste.
- Inventário: o painel principal usa tokens, mas barra de comando, entrada de número e seams compartilhados permanecem físicos.
- Ligar para Clientes: família não tocada pelo commit, com conteúdo branco dentro do shell escuro.

As demais superfícies estão `NÃO VERIFICADAS VISUALMENTE`; presença de candidatos define prioridade de inspeção, não prova isolada de defeito.

## Exceções que exigem decisão explícita

- `welcome.blade.php` e a rota Inertia `Welcome`;
- rotas em `Pages/Prototype`;
- foto e overlay de marca do login;
- fotos de produto, logos e swatches configuráveis;
- cores de situação/paridade Delphi em Inventário, Pedidos de Compra, Consulta de Compras, contratos e Ficha;
- SVGs de marca/IA e cores de dados/gráficos.

Toda exceção deve ter caminho, padrão, motivo, fallback textual quando transmitir estado e comentário/allowlist verificável. Nenhuma exceção de dado autoriza papel físico no chrome ao redor.

## Reprodução

Na raiz `laravel`, usar PowerShell para enumerar extensões de `backend/resources`, excluir os padrões de relatório acima e contar os matches destas expressões:

```text
\b(bg|text|border|ring|ring-offset|outline|divide|placeholder|from|via|to|fill|stroke)-(white|black|slate|gray|stone|zinc|neutral|red|orange|amber|yellow|lime|green|emerald|teal|cyan|sky|blue|indigo|violet|purple|fuchsia|pink|rose)(-[0-9]{2,3})?(/[0-9]{1,3})?\b
\b(bg|text|border|ring|outline|fill|stroke)-teclux-(primary|secondary|tertiary|neutral)(/[0-9]{1,3})?\b
(?<![A-Za-z0-9_])#[0-9A-Fa-f]{3,8}\b|\b(rgb|rgba|hsl|hsla)\s*\(
```

Cobertura do commit:

```powershell
git diff --name-only main...HEAD
```

Superfícies Inertia: extrair os valores literais de `Inertia::render(...)` em `backend/app`, deduplicar e conferir os arquivos sob `backend/resources/js/Pages`.

## Consequência para os próximos tickets

O prompt final precisa ser estruturado por seams e famílias, não por um lote único nem por uma lista manual de telas. Deve exigir inventário atualizado após cada lote, cobertura progressiva até zero candidato não classificado, allowlist fechada e evidência visual real antes de declarar conclusão.
