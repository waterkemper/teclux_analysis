# Prompt Speckit — fechamento da reconciliação de certificados e seleção NF-e

Use este texto como entrada do `speckit.specify`.

## Contexto

As specs 20 a 25 foram implementadas no Laravel. A spec 25 corrigiu a maior parte da reconciliação de certificados por raiz de CNPJ, os diagnósticos de sincronização, a paginação/filtros do catálogo e a validação da tríade de identidade para NF-e/NFC-e.

Faça uma revisão de fechamento sobre o estado atual do código antes de propor alterações. Não reimplemente o que já estiver correto e preserve IDs, estados, auditoria e compatibilidade com os dados existentes.

## Escopo obrigatório

Corrigir somente lacunas residuais relacionadas a:

1. concorrência e atomicidade da criação/reutilização do contribuinte canônico;
2. reconciliação manual e sincronização automática de filiais;
3. guarda de dependências e preservação de vínculos compartilhados;
4. seleção de certificado para NF-e/NFC-e;
5. testes de regressão, tipagem e higiene dos artefatos alterados.

## Fora de escopo

- Não bloquear, mascarar ou restringir CNPJ completo na tela administrativa de certificados.
- Não implementar NFS-e, API Nacional, emissor municipal, política de certificado individual ou modelo 98. A seleção e as regras atuais de NFS-e permanecem congeladas.
- Não implementar venda entre filiais, transferência comercial ou devolução de transferência.
- Não alterar gateway SEFAZ, schemas, leiautes fiscais ou fluxo de homologação, salvo se um teste NF-e/NFC-e existente exigir correção diretamente causada por esta revisão.

## Requisitos funcionais

### RF-01 — Resolver canônico seguro em concorrência

Revise `FiscalContribuinteCanonicoResolver` e seus repositórios para garantir que duas sincronizações/reconciliações simultâneas para a mesma raiz:

- nunca criem dois contribuintes canônicos;
- preservem o contribuinte existente e seus IDs;
- funcionem em PostgreSQL e SQLite, sem depender de `FOR UPDATE` em uma chave inexistente;
- tratem colisão de índice único sem continuar consultando a mesma transação PostgreSQL abortada;
- possam reconsultar/reutilizar o registro vencedor usando retry da transação, savepoint ou estratégia equivalente segura;
- não removam registro para resolver colisão.

Se a criação for reutilizada após uma corrida, o relatório deve contar `criados_contribuintes` somente quando aquele comando realmente inseriu um registro. Não declarar criação apenas porque a consulta inicial encontrou zero linhas.

### RF-02 — Atomicidade da reconciliação manual

Revise `ReconciliarEstabelecimentoFiscalService` para que a leitura da situação, decisão de `noop`, alterações e auditoria sejam coerentes sob concorrência:

- cada comando autenticado continua gerando exatamente uma auditoria `sync_reconciliar`, inclusive no `noop`;
- um `noop` não altera estabelecimento, versão, vínculo, datas de negócio ou contribuinte;
- o `noop` não pode ser decidido com base em estado que mudou entre a pré-leitura e a gravação;
- a operação deve bloquear/reconsultar o estado necessário dentro da mesma unidade transacional, ou usar mecanismo equivalente que impeça auditoria `noop` obsoleta;
- falha na reconciliação deve reverter criação do canônico, atualizações, inativações e auditoria;
- a segunda execução sobre o estado persistido deve ser idempotente, exceto pela auditoria própria daquele comando.

Não criar uma segunda auditoria para o mesmo comando nem duplicar mutações de domínio.

### RF-03 — Semântica única de dependências

Garanta que sincronização, reconciliação manual, guard de divergência e ativação/seleção de certificado usem a mesma regra já definida:

- conta como dependência qualquer versão não removida, material não purgado, vínculo em qualquer estabelecimento ou vínculo da origem;
- qualquer vínculo `RASCUNHO` ou `ATIVO` da versão, inclusive de outro contribuinte, impede rehost automático quando a versão é compartilhada;
- a existência do próprio estabelecimento isoladamente não impede rebase;
- estabelecimento sem vínculos elegíveis não deve ser tratado como dependência relevante;
- quando bloqueado, o `contribuinte_id` da origem não é alterado, embora CNPJ cadastral, UF e IE possam ser atualizados;
- enquanto houver divergência bloqueada, criação/ativação de novo vínculo e seleção NF-e/NFC-e devem continuar recusadas;
- o diagnóstico deve informar motivo, IDs envolvidos e quantidades reais de versões, vínculos, estabelecimentos e materiais.

Adicionar teste de feature em que a origem possui somente versão ou material dependente, sem vínculo direto, e confirmar que não ocorre rebase automático.

### RF-04 — Preservação de versões compartilhadas

Quando uma versão estiver ligada a outros estabelecimentos por vínculos `RASCUNHO` ou `ATIVO`:

- não mover a versão compartilhada para outro contribuinte;
- preservar os IDs existentes;
- inativar ou bloquear somente o vínculo corrente conforme a regra de reconciliação;
- não deixar estabelecimento, vínculo e versão com a tríade NF-e incoerente;
- registrar auditoria com a decisão e os vínculos que impediram o rehost.

Cobrir cenário com vínculos de outros estabelecimentos e outro `contribuinte_id`, não apenas o cenário do mesmo contribuinte.

### RF-05 — Seleção NF-e/NFC-e deve considerar todos os candidatos

Revise `CloudFiscalCertificadoRepository` e `SelectCertificateService`:

- para NF-e/NFC-e, candidato só é elegível quando `estabelecimento.contributor_id`, `vinculo.contributor_id` e `versao.contributor_id` formam a mesma tríade;
- a validação deve ocorrer no conjunto inteiro de candidatos, preferencialmente no SQL ou iterando candidatos até encontrar o primeiro válido;
- um candidato de maior prioridade com tríade inconsistente não pode impedir a escolha de um candidato posterior válido;
- se nenhum candidato for válido, retornar falha determinística e auditável, sem emitir;
- `selectFromCandidates` e a seleção normal devem ter exatamente a mesma semântica;
- não alterar o caminho NFS-e.

Adicionar teste com candidato inválido de maior prioridade e candidato válido de menor prioridade, além do teste em que todos são inválidos.

### RF-06 — Diagnóstico e auditoria da sincronização

Confirme que:

- primeira ocorrência de bloqueio, divergência ou duplicidade gera auditoria;
- repetição do mesmo diagnóstico persistido não gera auditoria infinita;
- o hash do diagnóstico é determinístico e não depende da ordem incidental de consultas;
- `dependencias_qtd` é a soma real das quantidades reportadas;
- os contadores refletem mutações reais, inclusive quando uma corrida reutiliza um canônico existente;
- a auditoria não contém segredo, material criptográfico ou conteúdo de certificado.

### RF-07 — Filtros e contratos já corrigidos

Revalide, sem regressão:

- `a_vencer` inclui somente `not_after > agora` e dentro de 60 dias;
- `orfao` é exclusivo e rejeita combinações incompatíveis na API, enquanto a UI limpa filtros incompatíveis;
- filtros, contagem, ordenação e paginação são aplicados no SQL antes da hidratação;
- página acima do total retorna a última página válida;
- ordenação SQL e projeção possuem a mesma ordem determinística;
- métodos de query usam tipos explícitos de Query Builder.

Se já estiverem corretos, apenas preserve-os e mantenha testes de regressão.

## Critérios de aceite

1. Não há caminho de concorrência que crie dois canônicos para a mesma raiz.
2. Colisão de índice único não causa erro de transação abortada nem contagem falsa de criação.
3. Reconciliação manual é atomicamente consistente e possui uma auditoria por comando, inclusive `noop`.
4. Nenhuma versão compartilhada é rehosteada; IDs e vínculos são preservados conforme a política.
5. A seleção NF-e/NFC-e ignora candidatos com tríade inconsistente e escolhe o próximo candidato válido.
6. NFS-e, CNPJ administrativo e transferências comerciais continuam fora deste escopo.
7. Testes de unidade e feature cobrem concorrência simulada, rollback, `noop`, dependências indiretas, versão compartilhada, seleção com fallback e nenhum candidato válido.
8. Executar lint/sintaxe PHP e `git diff --check` nos artefatos efetivamente alterados.

## Entrega esperada do Speckit

Produzir uma spec implementável, com arquivos/classes/métodos existentes a revisar, invariantes, migrações somente se indispensáveis, testes obrigatórios e ordem de implementação. Não implementar o código neste prompt.
