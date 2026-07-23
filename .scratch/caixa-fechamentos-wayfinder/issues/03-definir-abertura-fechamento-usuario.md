# Definir abertura e fechamento de caixa no Usuário

Type: grilling
Status: resolved
Blocked by: 01, 02

## Question

Como representar, no Usuário do Laravel, o estado de abertura/fechamento de caixa (`dataaberturacaixa`, `datafechamentocaixa`, `caixaaberto` derivado, `PermiteAbrirCaixa`) e as regras de quem pode abrir/fechar caixa de quem (usuário só fecha o próprio caixa por padrão; `LimiteDiasFechamentoCaixa` restringe a data mínima para não-Administrador/Suporte), incluindo se `AbrirCaixa`/`ReAbrirCaixa` (hoje implícitos/automáticos no Delphi, sem tela própria) precisam de um comando explícito no Laravel ou continuam implícitos?

## Answer

Investigação revelou que a premissa da pergunta ("implícito/automático") estava parcialmente errada — corrigida com evidência concreta antes de decidir.

### Achados de evidência (CONFIRMADO)

- **Duas derivações conflitantes de "caixa aberto" coexistem no Delphi**: a tela de Fechamento (`qryCaixas`) exige `dataaberturacaixa = hoje`; o objeto `TtecUsuarios.LerPropriedades` (`clusuario.pas:632`) não exige — só compara `datafechamentocaixa < dataaberturacaixa`.
- O gatilho real de abertura não é silencioso nem mora em `apps/caixa`: é `TfrmTecsoft.AbrirCaixa` em `apps/tecsoft/fmtecsoft.pas:545`, acionado sob demanda pelos handlers de menu de Frente de Caixa e Autenticações do Caixa (ambos fora de escopo deste mapa) na primeira vez que o usuário tenta uma ação que depende de caixa aberto no dia.
- O "caminho silencioso" (`if PermiteAbrirCaixa then AbrirCaixa` sem confirmação) é código morto — `PermiteAbrirCaixa` exige `FCaixaAberto=true`, mas só se entra nesse bloco quando `CaixaAberto` já é falso. POSSÍVEL BUG LEGADO, não replicado.
- `ReAbrirCaixa` (`clusuario.pas:707`) empurra só `datafechamentocaixa` para ontem, sem tocar `dataaberturacaixa` — mecanismo incompatível com a regra escolhida abaixo (ver decisão).
- `FecharCaixa(Value)` só persiste se `Value = FDataAberturaCaixa` — a data de fechamento deve ser exatamente a data em que o caixa foi aberto; é uma guarda de consistência, não uma escolha livre de data. Mantida como está (nenhuma ambiguidade a decidir aqui).

### Decisões

1. **Regra canônica de `caixaaberto`** no Laravel: `dataaberturacaixa > datafechamentocaixa AND dataaberturacaixa = hoje` (a regra da tela de Fechamento). A derivação do objeto Usuário Delphi (sem exigir hoje) fica documentada como POSSÍVEL BUG LEGADO, não replicada.
2. **`AbrirCaixa`/`ReAbrirCaixa` colapsam em um único comando de domínio** `AbrirCaixa` (seta `dataaberturacaixa := hoje`, com a mesma autorização sensível de Gerente de Caixa evidenciada em `TfrmTecsoft.AbrirCaixa` — senha se o usuário logado já é Gerente de Caixa, login completo de outro usuário Gerente de Caixa caso não seja). Este comando faz parte da Fundação de Caixa (spec 01), mas **sem rota/UI própria nesta entrega** — fica pronto para ser chamado pelos specs futuros que implementarem Frente de Caixa/Autenticações do Caixa (fora deste mapa).
3. A guarda de consistência de `FecharCaixa` (fechar exatamente a data em que foi aberto) é preservada como está.
4. As regras finas de "quem fecha o caixa de quem" e `LimiteDiasFechamentoCaixa` ficam para o ticket [Definir a ação Fechar Caixa (F8)](08-definir-acao-fechar-caixa.md) — aqui só ficou confirmado que essas regras vivem na ação de Fechamento, não no estado do Usuário em si.
