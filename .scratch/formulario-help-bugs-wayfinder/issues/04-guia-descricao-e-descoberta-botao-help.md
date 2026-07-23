Type: prototype
Status: resolved

## Question

Dois achados práticos de UX no mesmo formulário, ambos precisam de um rascunho concreto para reagir antes de fechar:

**1. Guia de preenchimento da descrição.** A spec original (161-erp-help-zendesk, passo 4 do fluxo) previa "texto de ajuda sobre o que incluir" no campo de descrição, mas a implementação atual (`laravel/backend/resources/js/Components/erp/help/HelpForm.tsx`) tem um textarea vazio, sem placeholder nem texto de apoio. Decisão já tomada: adicionar um guia de preenchimento (ex.: estrutura mínima "passos para reproduzir / esperado / ocorrido"). Falta desenhar: texto exato do placeholder ou do texto de apoio, e se ele varia por `tipo` selecionado (bug vs. melhoria vs. dúvida) ou é genérico.

**2. Descoberta do botão Help.** Hoje é só um ícone de interrogação pequeno na barra superior (`laravel/backend/resources/js/Components/erp/help/HelpShellTrigger.tsx`), sem rótulo de texto visível — só tooltip ao passar o mouse. Decisão já tomada: precisa ficar mais visível para o lançamento, já que usuários novos vão encontrar bugs reais e precisam saber que o canal existe. Falta desenhar o tratamento concreto: rótulo de texto ao lado do ícone? destaque visual temporário (badge/pulso) nos primeiros acessos após o lançamento? outro mecanismo de anúncio?

**Use o /prototype** para produzir um rascunho visual/copy de ambos os pontos e trazer para reação antes de fechar o desenho.

## Answer

Protótipo com 3 variações de cada ponto, publicado como Artifact e capturado em [`prototype-guia-descricao-botao-help/index.html`](prototype-guia-descricao-botao-help/index.html). Escolhas:

**1. Guia da descrição → Variante A (placeholder).**
O texto de apoio vai **dentro do placeholder** do textarea, com a estrutura:
```
O que você estava fazendo: ...
O que esperava que acontecesse: ...
O que aconteceu: ...
```
Some ao digitar (comportamento padrão de placeholder) — sem campo novo, sem mudança de contrato com o backend (continua sendo uma única `descricao` de texto livre). Implementação: adicionar o atributo `placeholder` ao `<textarea>` de descrição em `laravel/backend/resources/js/Components/erp/help/HelpForm.tsx`.

**2. Descoberta do botão Help → Variante C (pílula de estreia).**
No primeiro(s) acesso(s) após o lançamento, o botão se expande automaticamente numa pílula com o texto "Precisa de ajuda?" por alguns segundos, depois recolhe para o ícone compacto de sempre. Chama atenção no momento em que ninguém ainda sabe que o canal existe, sem virar poluição visual permanente depois. Implementação em `laravel/backend/resources/js/Components/erp/help/HelpShellTrigger.tsx`: precisa de (a) um critério de "primeiro(s) acesso(s)" — ex. flag em `localStorage` por usuário, expirando após N dias ou N sessões desde o lançamento; (b) respeitar `prefers-reduced-motion` (expansão sem animação ou já exibida estática); (c) o texto "Precisa de ajuda?" deve continuar acessível via `aria-label`/tooltip mesmo depois de recolhido.

