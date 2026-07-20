# Definir a estratégia de extração da restrição de preço da consulta

Type: grilling
Status: resolved
Blocked by: 01

## Question

Como extrair operador+valor de frases como "abaixo de 50,00", "até 50", "acima de 30", "entre 20 e 50", "no máximo 50" da consulta em linguagem natural — parsing determinístico (regex/vocabulário fixo de frases) ou assistido por IA (LLM/modelo de embeddings existente)? Que vocabulário de frases é suportado nesta entrega? O que acontece quando a frase é ambígua ou não reconhecida (abstém-se de extrair e trata a consulta inteira como texto de busca, ou tenta algo mais arriscado)? O trecho de preço deve ser removido do texto enviado à recuperação lexical/semântica, e a restrição detectada deve ser comunicada de volta ao vendedor na UI?

## Answer

- **Determinístico, sem IA.** Parser regex/vocabulário fixo — mais rápido, sem custo, testável exaustivamente, consistente com o princípio já estabelecido no projeto de minimizar chamadas de IA fora do necessário.
- **Vocabulário suportado**: "abaixo de X"/"menor que X"/"menor de X" → `lt`; "até X"/"no máximo X" → `lte`; "acima de X"/"maior que X"/"maior de X" → `gt`; "a partir de X"/"no mínimo X" → `gte`; "entre X e Y" → intervalo (`gte X` e `lte Y`). Número em dígitos, com ou sem "R$"/"reais", formato brasileiro (50 ou 50,00). Números por extenso ficam fora de escopo.
- **Ambiguidade/não reconhecido**: conservador — só extrai quando a frase bate exatamente com o vocabulário fixo e há um número válido junto; sem correspondência clara, a consulta inteira segue como texto de busca normal, sem restrição aplicada e sem erro. Nenhuma tentativa especulativa de interpretar frases parecidas.
- **Remoção do trecho**: o trecho reconhecido é removido do texto enviado à recuperação lexical/semântica — só o restante da consulta é buscado/embedado; `{operador, valor}` viaja separado no pipeline.
- **Comunicação na UI**: chip perto dos resultados (ex. "Preço até R$ 50,00 detectado"), com × para remover; ao remover, a busca roda de novo com o texto original completo, sem tratamento especial de preço. Mesma linguagem de chip já usada na faixa de seleção.
