# Incorporar exemplo operacional concreto das novas telas de Confirmação (Interlojas) e Romaneios (Entregas) em vantagens/diferenças vs Delphi

Type: task
Status: resolved
Blocked by: 02, 12

## Question

Com base nas novidades levantadas na ticket "Atualizar inventário de módulos com as novidades desde a última correção (30/07)" (Confirmação por Notas/Romaneios em Interlojas, Cadastro de Romaneios em Entregas), há diferença operacional concreta o suficiente vs o Delphi para virar um exemplo no mesmo padrão da ticket "Levantar vantagens estratégicas e diferenças operacionais concretas vs Delphi" (ex.: "Quitação em lote é tudo ou nada")? Comparar com o comportamento real do Delphi documentado nas pesquisas já publicadas em `modules/interlojas/{confirmacao-por-notas,confirmacao-por-romaneios}/pesquisa-interface-delphi.md` e `modules/entregas/cadastro-romaneios/`, sem inventar comportamento não confirmado.

## Answer

Sim — a pesquisa da interface Delphi já publicada (`pesquisa-interface-delphi.md` de ambos os pacotes) documenta lacunas reais e concretas o suficiente para um exemplo de vantagem, no mesmo tom dos exemplos já usados (Contas a Pagar, grids):

**Interlojas — Confirmação de recebimento entre lojas (por Nota ou por Romaneio)**
- No Delphi, cada nota/romaneio é confirmado individualmente; não existe confirmação em lote com garantia de tudo-ou-nada, e cancelar uma busca em andamento não interrompe de fato a consulta no banco (só ignora a resposta na tela).
- No Laravel, a confirmação é por seleção múltipla: o operador marca várias notas/romaneios de uma vez e a confirmação é atômica — ou confirma tudo, ou nada muda. Cancelar uma busca interrompe de verdade a consulta.
- A chave de NF-e usada para localizar a nota/romaneio agora é validada automaticamente (44 dígitos + dígito verificador) e compartilhada entre as duas telas — no Delphi a validação era apenas "só números", sem checagem de dígito verificador.

**Entregas — Cadastro de Romaneios**
- Consolida em uma única tela o que no Delphi dependia de telas e passos separados: inclusão de múltiplas notas no romaneio, conferência de volumes, assinatura do recebedor e justificativa de entrega — com o lançamento do frete em Contas a Pagar acontecendo automaticamente, sem lançamento manual à parte.

Adendo aplicado na ticket "Levantar vantagens estratégicas e diferenças operacionais concretas vs Delphi" incorporando os dois blocos.

Fontes: `modules/interlojas/confirmacao-por-romaneios/pesquisa-interface-delphi.md`, `modules/interlojas/confirmacao-por-notas/pesquisa-interface-delphi.md`, `modules/entregas/cadastro-romaneios/README.md`.
