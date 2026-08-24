# Prompt SpecKit - Hardening pos-implementacao da Busca Assistida

Revise a implementacao existente dos prompts 13 (nucleo Interpreter -> PlanValidator -> Executor) e 03 (adapter de Orcamentos) e produza uma especificacao executavel, com plano de implementacao e testes, somente para fechar as lacunas abaixo. Nao reabra a arquitetura, nao volte a aliases deterministas e nao crie um segundo pipeline de busca.

## Evidencias encontradas na implementacao atual

Inspecione antes de propor mudancas:

- `backend/app/Ai/Tools/BuscaAssistida/BuscarProdutosTool.php` declara `filial`, `paginacao` e `limite`, mas envia os nomes originais em `rawKeys`; o `PlanValidator` conhece a allowlist canonica (`filial_solicitada`) e pode rejeitar esses campos como extras.
- O mesmo `BuscarProdutosTool` chama o validador e depois `runFromPlan`, que valida novamente. Preserve uma unica execucao e evite validacao duplicada ou divergente.
- A tool monta `items` diretamente de `retrieved.candidates`; candidatos do motor nao sao a projecao rica do host HTTP. Isso pode eliminar preco autorizado, fotos, evidencia, disponibilidade, capacidades e campos que o painel ja recebe.
- `InterpretationPlan::fromArray()` aceita plano vazio ou `schema_version` diferente de `2`, e o `PlanValidator` nao fecha explicitamente esses casos. Resposta estruturada vazia/invalida nao pode virar busca irrestrita ou uma abstencao indistinguivel de sucesso.
- `ValidatedSearchPlan` recebe `limite` e `paginacao`, mas o caminho de execucao precisa demonstrar que os aplica; nao basta apenas fazer clamp no validador.
- A revalidacao pos-retrieve deve garantir que mudancas de preco/estoque nao deixem passar candidatos que perderam o filtro durante a requisicao.

Confirme as evidencias no codigo real antes de escrever a especificacao; se alguma ja tiver sido corrigida, transforme-a em criterio de regressao, nao em trabalho duplicado.

## Escopo obrigatorio

### 1. Adapter da tool e DTO canonico

- Mapear o contrato publico da tool para o DTO canonico antes da validacao:
  `texto_busca`, `identificadores`, `preco`, `emestoque`, `filial` -> `filial_solicitada`, `atributos`, `ordenacao`, `paginacao` e `limite`.
- A allowlist deve validar chaves canonicas, sem rejeitar campos publicos validos e sem aceitar extras.
- `filial` nunca amplia autorizacao; uma filial nao autorizada gera a mesma decisao de clarificacao/falha do HTTP.
- O adapter nao deve chamar o legado com apenas a string e nao deve duplicar regra de preco, estoque ou autorizacao.
- Definir uma unica fronteira de validacao e uma unica execucao. O mock deve provar que a tool usa o mesmo `PlanValidator` e `Executor` do HTTP.

### 2. Paridade do envelope e da projecao de itens

O resultado da tool deve manter o contrato de leitura existente, respeitando o host e as permissoes. Nao retornar itens montados apenas com IDs/campos possivelmente ausentes no candidato bruto.

Preservar, quando autorizado e disponivel, os campos ja usados pela busca/tela: codigo do produto, codigo visual, descricao, evidencia, aderencia, `emestoque`, disponibilidade, preco Cargo/Consulta, `thumb_url`, `foto_media_url`, capacidades e `restricao_preco`. Caracteristica HTML deve continuar vindo pelo seam de detalhe/projecao existente, com sanitizacao; nao duplicar o sanitizador.

Consulta e Orcamentos devem continuar com as regras distintas:

- Consulta: preco e filiais conforme contexto autorizado da consulta.
- Orcamentos: preco Cargo-aware na Filial Base; `emestoque` = soma da coluna `emestoque` em todas as filiais; item/inclusao com Filial Base; sem composicao por filial e sem embalagem, reserva, transito ou conversao.

Se a arquitetura exigir um mapper/envelope compartilhado, reutilize o seam real existente. Nao alterar o modal de bipe nem o fluxo `onApply`.

### 3. Plano estruturado fail-closed

- Exigir `schema_version = "2"` e validar campos obrigatorios/tipos antes do Executor.
- Resposta estruturada vazia, JSON invalido, plano sem texto residual e sem identificador, versao incompatível ou nested filter incompleto devem resultar em `pedir_clarificacao` ou fallback tradicional, com lista vazia e sem afirmar filtros aplicados.
- Validar coerencia de `valor_ate` com o operador e intervalo; nao aceitar intervalo invertido ou forma que o Executor nao consiga aplicar deterministicamente.
- Manter allowlist, rejeicao de SQL/credenciais/Cliente/Cargo/permissao e regra de Produto Ativo.
- O cache nao pode armazenar texto bruto, PII, Cliente ou Cargo; plano invalido nao deve ser cacheado como sucesso.

### 4. Limite, paginação e revalidacao

- `limite` deve limitar a resposta depois dos hard filters e antes do envelope, respeitando `candidate_cap`.
- `paginacao` deve ter semantica documentada e ser aplicada de forma deterministica; se o backend atual nao suporta paginação real, a especificacao deve exigir uma decisao explicita (implementar ou rejeitar o campo), nunca ignorar silenciosamente.
- Preco e estoque devem ser revalidados no ponto imediatamente anterior a resposta. Um candidato que deixou de satisfazer `preco` ou `emestoque` deve ser removido; Produto Ativo continua hard filter.
- O filtro de estoque usa somente `emestoque`; no Orcamento soma todas as filiais e na inclusao revalida somente a Base.
- Uma filial textual autorizada em Consulta deve respeitar as filiais efetivas; no Orcamento a apresentacao continua total de todas as filiais, sem permitir que o plano troque a Base.

## Testes obrigatorios

Crie testes que falhem com a implementacao atual e passem com a correcao:

1. Tool com todos os campos do schema, especialmente `filial`, `paginacao` e `limite`, chega ao DTO canonico e ao validador sem falso `tool_extra_fields`.
2. Tool com `preco` + `emestoque` executa uma vez, sem chamar `HostSearch::search()` legado e sem validar duas vezes.
3. Tool e HTTP devolvem a mesma projecao de item/evelope dentro das diferencas de permissao e host; preco, evidencias, fotos e estoque nao desaparecem.
4. Plano vazio, schema version incorreto, filtro incompleto e resposta structured vazia produzem fallback/clarificacao seguro.
5. `limite`/`paginacao` têm comportamento verificável; nenhum campo declarado é ignorado.
6. Alteracao de preco/estoque entre recuperacao e resposta nao permite candidato fora do filtro.
7. Produto inativo nunca aparece, inclusive em identificador, alternativa, tool ou detalhe.
8. Orcamentos preserva preco Cargo na Base, total de `emestoque` de todas as filiais, sem breakdown e sem inclusão automática.
9. Regressao do painel, fotos/detalhe, `currentSelection`, `onApply`, busca tradicional e modal de bipe.

Execute a matriz no container PHP 8.5 definido pelo projeto; nao declarar a suite verde usando a CLI PHP 8.2 incompatível.

## Saida esperada do SpecKit

Produza requisitos funcionais e nao funcionais, contratos de mapeamento tool -> DTO e envelope -> UI, seams reais apos inspecao, fases tracer-bullet, testes de contrato/feature/unit, riscos e plano de rollout. Liste explicitamente quais achados ja estao corrigidos e quais exigem codigo. Nao implementar nesta etapa e nao gerar prompt adicional se estes itens forem suficientes.
