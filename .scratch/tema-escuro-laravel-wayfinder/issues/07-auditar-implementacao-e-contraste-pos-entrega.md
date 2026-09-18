# Auditar implementação e contraste pós-entrega

Type: task
Status: resolved
Blocked by: 06

## Question

Em que medida a implementação atual do tema escuro atende ao contrato definido pelo mapa e quais defeitos visuais, contrastes indevidos e componentes não migrados aparecem nas capturas de `images/`?

Comparar a implementação Laravel com `modules/shared/tema-escuro-laravel/01-speckit-prompt.md` e com as decisões anteriores. Inspecionar as três capturas fornecidas, localizar no código as superfícies correspondentes e registrar achados reproduzíveis com classificação (`CONFIRMADO`, `DIVERGENTE`, `POSSÍVEL BUG ATUAL`, `DÚVIDA`), evidência visual e arquivo relacionado. Esta sessão audita e delimita a correção; não altera a implementação.

## Answer

### Veredito

A infraestrutura central do tema foi implementada, mas a migração visual foi encerrada antes de cumprir o critério de tela migrada. As três capturas confirmam regressões distintas: ilhas claras, superfícies físicas translúcidas que viram cinza, texto físico escuro sobre painel escuro e uma família de página praticamente não migrada. O tema escuro ainda não deve ser considerado pronto para rollout amplo.

### O que foi implementado

- `CONFIRMADO` — o commit `2e078019f` adiciona bootstrap pré-React, preferência versionada, provider, controle de aparência, flag de runtime, tokens semânticos, três paletas, documentação e testes unitários/componentes. O diff contra `main` cobre 93 arquivos, com 3.308 inserções e 326 remoções.
- `CONFIRMADO` — `backend/resources/css/app.css` define `--erp-*`, aliases Tailwind semânticos, `data-theme`, `data-palette`, `color-scheme` e reduced motion conforme o ADR 491.
- `CONFIRMADO` — shell principal e primitives selecionados foram migrados, mas o guardrail não cobre todo o shell/cadastro nem todas as páginas consumidoras.

### Evidência visual e de código

#### Cadastro de Produtos

- `DIVERGENTE` — `images/cadastro_de_produtos.png` mistura canvas escuro com fieldsets cinza muito claros, inputs brancos e uma metade inferior quase toda clara. Isso viola o critério de não possuir papel adaptável físico e não é apenas preferência estética.
- `CONFIRMADO` — `backend/resources/js/Pages/Cadastros/Estoque/Produtos/Cadastro.tsx` recebeu somente 12 adições e 12 remoções no commit, mas ainda contém 79 ocorrências relevantes na busca ampliada; entre elas: 11 `bg-stone-*`, 13 `text-stone-*`, 6 `text-slate-*`, 13 `text-teclux-secondary`, 11 `text-teclux-neutral`, 37 `border-stone-*` e 4 `border-slate-*`.
- `POSSÍVEL BUG ATUAL` — `bg-stone-50/30` sobre o painel escuro `#182329` compõe aproximadamente `#5c6467`. Texto `stone-600`, `teclux-secondary` e `teclux-neutral` sobre essa superfície fica aproximadamente em 1,26:1, 1,47:1 e 2,09:1, abaixo de 4,5:1 para texto normal.
- `DIVERGENTE` — a tarefa de validar o cadastro representativo foi marcada como concluída embora os hardcodes e a captura contradigam o critério §9.5 da própria spec.

#### Inventário

- `DIVERGENTE` — `images/inventario.png` mostra o conteúdo majoritariamente escuro, porém a barra de comandos permanece clara e vários rótulos, divisores e controles têm contraste visual insuficiente.
- `CONFIRMADO` — `Inventario/Index.tsx` foi migrado para tokens semânticos no painel principal e não mantém os hardcodes estruturais vistos na captura. Os defeitos vêm sobretudo de dependências compartilhadas não cobertas.
- `POSSÍVEL BUG ATUAL` — `backend/resources/js/Components/erp/cadastro/ErpCadastroShell.tsx:78` força `border-stone-200 bg-white/95` e `bg-white/80`, produzindo a faixa clara em Inventário e Cadastro de Produtos.
- `POSSÍVEL BUG ATUAL` — `backend/resources/js/Pages/Entregas/Romaneios/components/RomaneioNumeroInput.tsx:101` e `:116` usam `text-teclux-neutral`, `border-slate-200` e `bg-white`, explicando o controle claro e texto incompatível no cabeçalho.
- `POSSÍVEL BUG ATUAL` — `backend/resources/js/Components/erp/cadastro/ErpCadastroCommandBar.tsx` ainda usa `bg-gray-200`, `bg-gray-300`, `text-teclux-neutral`, `text-teclux-secondary` e `border-stone-200` no rail.
- `CONFIRMADO` — no painel escuro padrão `#182329`, `teclux-secondary` (`#4a4a4a`) mede cerca de 1,81:1 e `teclux-neutral` (`#333333`) 1,27:1. Os tokens semânticos equivalentes medem 8,43:1 (`content-secondary`) e 5,84:1 (`content-muted`).

#### Ligar para Clientes

- `DIVERGENTE` — `images/ligarparaclientes.png` mantém praticamente todo o conteúdo branco enquanto somente o shell externo está escuro.
- `CONFIRMADO` — nenhum arquivo de `Pages/Cadastros/CobrancaSac/LigarClientes` foi alterado pelo commit de tema. A família ainda tem 67 ocorrências relevantes, incluindo 12 `bg-white`, 7 `bg-slate-*`, 10 `text-slate-*`, 9 `text-teclux-secondary`, 9 `text-teclux-neutral` e 28 `border-slate-*`.
- `POSSÍVEL BUG ATUAL` — `LigarClientes/Index.tsx:206`, `:227`, `:247` e `:276` fixam barra, abas e painel em `white/slate`; `ClientCallTypeSelector.tsx:17` e `ClientCallGrid.tsx:252` repetem o papel branco. A captura corresponde diretamente a esses hardcodes.

### Lacunas do aceite automatizado

- `DIVERGENTE` — `themeColorAllowlist.ts` escaneia somente 14 arquivos e apenas `bg-white`, `dark:`, `ring-offset-white` e `bg-black/40`. Não detecta `bg-stone-*`, `bg-slate-*`, textos físicos, bordas físicas nem `teclux-secondary/neutral`; também não inclui `ErpCadastroShell`, `ErpCadastroCommandBar`, Cadastro de Produtos ou Ligar para Clientes.
- `DIVERGENTE` — `appearanceSmokeMatrix.test.ts` não renderiza login, dashboard, cadastro, consulta ou ficha. Apenas verifica que uma constante tem cinco nomes e alterna atributos no `documentElement`; portanto não é smoke visual nem mede contraste.
- `DIVERGENTE` — `tasks.md` marca a expansão de famílias como concluída, enquanto `inventory-colors.md` registra cerca de 891 `bg-white` e declara várias famílias ainda pendentes. O próprio artefato de inventário contradiz o checkbox de conclusão.
- `DÚVIDA` — testes e build não puderam ser reproduzidos nesta árvore. O Vitest falhou antes de coletar testes ao resolver `setup.ts` pelo caminho canônico da junction `C:\teclux_cloud`; o build falhou porque `zxing_reader.wasm` não existe no `node_modules` atual. Essas falhas são ambientais/de dependência e não foram contadas como regressões do tema.

### Direção para a próxima rodada

1. Corrigir primeiro os seams compartilhados `ErpCadastroShell`, `ErpCadastroCommandBar`, `RomaneioNumeroInput` e os componentes de grid/filtro ainda físicos; isso remove defeitos em várias telas de uma vez.
2. Concluir Cadastro de Produtos como representativo real, substituindo papéis, textos e bordas físicas por tokens semânticos — especialmente variantes com opacidade.
3. Migrar a família Ligar para Clientes como um lote próprio, incluindo abas, filtros, grid, detalhes, modal e fullscreen.
4. Ampliar o guardrail para papéis, texto e borda adaptáveis em todos os arquivos declarados migrados.
5. Substituir o falso smoke por capturas reais em Claro + três paletas, com rotas representativas, estados e medição WCAG; somente então reclassificar telas como migradas e considerar rollout.

As correções de implementação continuam fora do destino original deste mapa. O próximo passo correto é um esforço de remediação separado, usando esta auditoria como entrada, para não reescrever retroativamente o mapa de especificação já concluído.
