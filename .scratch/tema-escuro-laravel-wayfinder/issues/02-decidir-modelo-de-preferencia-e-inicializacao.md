# Decidir modelo de preferência e inicialização do tema

Type: grilling
Status: resolved
Blocked by: 01

## Question

O tema deve oferecer `Claro/Escuro` ou `Sistema/Claro/Escuro`, onde o controle aparecerá, e onde a preferência será persistida?

Definir fallback na primeira visita, comportamento quando o sistema operacional muda, sincronização entre abas, logout/troca de usuário, modo anônimo, falha de storage, SSR/Inertia e prevenção de flash claro→escuro. Recomendação inicial: `Sistema`, `Claro` e `Escuro`, preferência local no navegador com chave versionada, atributo `data-theme` no `<html>` inicializado antes do React e sem persistência no backend na primeira entrega; confirmar contra a política do produto.

## Answer

Adotar três modos de preferência: `Sistema`, `Claro` e `Escuro`. O modo `Sistema` resolve a preferência por `window.matchMedia('(prefers-color-scheme: dark)')`; os modos explícitos ignoram mudanças posteriores do sistema operacional. A ausência de preferência ou um valor inválido deve cair em `Claro`, que é o padrão do produto. `Sistema` continua disponível somente quando escolhido explicitamente pelo usuário.

A preferência será persistida somente no navegador, em `localStorage`, usando uma chave versionada como `teclux-erp-theme-preference-v1` e os valores `system`, `light` e `dark`. A primeira entrega não deve criar coluna, rota, prop Inertia ou dependência de backend para isso: trata-se de uma preferência visual do dispositivo/browser, e o repositório já possui precedente de preferências persistidas localmente no `AppLayout`. A preferência deve sobreviver a logout, troca de usuário e navegação Inertia. A possibilidade de preferências por usuário em estações compartilhadas fica para uma decisão posterior.

O estado aplicado ao documento terá como contrato `document.documentElement.dataset.theme`, com valor efetivo `light` ou `dark`. Um bootstrap JavaScript pequeno e tolerante a falhas deve ser executado em `app.blade.php` antes do CSS/React: ler a chave, validar o valor, resolver o modo `system` e definir `data-theme`. Assim, o carregamento direto de uma rota não exibe a interface clara antes de mudar para escura. Se `localStorage` ou `matchMedia` não estiverem disponíveis, o bootstrap deve falhar de forma segura e usar o fallback claro do CSS.

Depois da inicialização, um controlador/provider global próximo da entrada Inertia deve reconciliar o estado e expor um hook para o controle no shell global. Ao alterar a preferência na aba atual, o documento deve ser atualizado imediatamente e o valor gravado com tratamento de exceções de quota/modo privado. O controlador também deve ouvir o evento `storage` para sincronizar outras abas e o evento de mudança do `MediaQueryList` enquanto o modo for `system`; em modos explícitos, mudanças do sistema não alteram a tela.

O controle deve ficar no shell global (header/menu de usuário ou menu de configurações), não repetido nas páginas. Deve apresentar claramente o estado atual, oferecer operação por teclado e usar semântica de escolha exclusiva (`radiogroup`/`radio` ou equivalente), sem depender apenas de ícone. A preferência não deve ser removida no logout. A ativação para usuários finais deve ser liberada somente quando o rollout da migração de tokens estiver pronto; até lá, o produto pode manter a funcionalidade atrás de configuração de rollout, embora o contrato de preferência já tenha `Sistema` como fallback.

Esta decisão não define ainda o contrato de tokens, a paleta escura, a migração de utilitários existentes ou o tratamento de impressão/documentos; esses pontos permanecem no ticket de arquitetura de tokens.
