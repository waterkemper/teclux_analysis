# Prompt Speckit — validação final PostgreSQL e bordas da seleção NF-e

Use este texto como entrada do `speckit.specify`.

## Contexto

A spec 26 foi implementada no Laravel e corrigiu:

- criação/reutilização do contribuinte canônico com transação aninhada;
- contagem real de `criados_contribuintes`;
- `noop` dentro da transação de reconciliação;
- auditoria dos vínculos que impedem rehost;
- percurso de candidatos NF-e/NFC-e até o primeiro candidato com tríade válida;
- hash determinístico do diagnóstico.

Esta spec é somente uma revisão final de evidências e bordas. Primeiro confronte o código atual, a spec 380 e os contratos antes de propor mudanças.

## Fora de escopo

- Não bloquear nem mascarar CNPJ completo na administração.
- Não implementar ou alterar NFS-e, API Nacional, emissor municipal ou modelo 98.
- Não implementar venda, transferência ou devolução entre filiais.
- Não alterar gateway SEFAZ, schemas, leiautes ou fluxo de homologação.
- Não criar tabelas, índices novos ou alterar o modelo de dados, salvo prova concreta de indispensabilidade.

## Requisitos

### RF-01 — Teste real de concorrência do canônico

Completar a matriz PostgreSQL prevista na spec 380:

- duas conexões PostgreSQL reais devem disputar a mesma raiz inicialmente vazia;
- o resultado deve ter exatamente um contribuinte com `codigo = raiz:{raiz}`;
- a operação vencedora deve retornar `criado=true` e a perdedora `criado=false`;
- a perdedora deve reutilizar o ID vencedor, sem `DELETE`;
- não deve ocorrer consulta em transação PostgreSQL abortada após colisão de unique;
- o teste deve ser marcado com `#[Group('postgres')]` e ser pulado de forma explícita quando o ambiente não for PostgreSQL.

Não transformar o teste em um falso positivo inserindo previamente o vencedor fora da corrida. Se o ambiente de testes não permitir a concorrência real, documentar claramente a limitação e manter o teste de colisão em savepoint separado.

### RF-02 — Teste PostgreSQL do `noop` concorrente

Completar o cenário previsto para a reconciliação:

- uma conexão deve manter o lock do estabelecimento;
- outra tentativa de reconciliação não pode persistir `noop` baseado em leitura velha;
- depois da alteração confirmada, a tentativa deve reconsultar o estado e seguir o ramo mutante ou retornar falha explícita;
- não pode haver auditoria `sync_reconciliar` com `resultado=noop` para estado obsoleto;
- senha inválida, estabelecimento inexistente e Filial inelegível continuam sem auditoria de sucesso.

O teste deve provar comportamento com duas conexões, não apenas alterar dados dentro de um listener da mesma conexão. Respeitar a ordem de locks para não introduzir deadlock.

### RF-03 — Estabelecimento ausente na seleção NF-e

Revisar `SelectCertificateService::selectNfeFromOrderedCandidates`:

- a tríade NF-e só é válida quando existe estabelecimento Cloud correspondente à Filial;
- se o estabelecimento não existir, nenhum candidato deve ser tratado como automaticamente válido por causa de um `null`;
- retornar falha determinística, sem emitir e sem fallback por raiz de CNPJ;
- preservar a falha e os códigos de domínio já existentes quando houver um caminho apropriado;
- não alterar o caminho NFS-e.

Adicionar teste para candidato ativo/preferencial existente sem estabelecimento correspondente. O teste de candidato inconsistente de maior prioridade seguido de candidato válido deve continuar passando, assim como o teste com todos inválidos e o teste de paridade de `selectFromCandidates`.

### RF-04 — Corrida entre rehost e novo vínculo compartilhado

Revisar se o lock atual do estabelecimento é suficiente quando outro processo cria/ativa um vínculo `RASCUNHO` ou `ATIVO` para a mesma versão durante a reconciliação. Caso não seja suficiente:

- reconsultar ou bloquear a versão/vínculos com ordem de lock determinística;
- impedir que uma versão ganhe novo dono enquanto existir vínculo elegível em outro estabelecimento;
- preservar IDs e não usar exclusão para resolver a corrida;
- manter `vinculo_ids_impediram_rehost` completo e ordenado;
- adicionar teste de concorrência ou teste transacional equivalente que prove a invariável.

Não ampliar o lock sem justificar risco de deadlock e impacto no fluxo de criação/ativação de vínculo.

### RF-05 — Higiene dos artefatos da spec 26

Corrigir apenas os artefatos efetivamente alterados pela spec 26:

- `git diff --check` deve passar, removendo whitespace final introduzido nos Markdown;
- o arquivo gerado `.cursor/rules/specify-rules.mdc` não deve conter blocos duplicados da mesma entrada da spec 380; se for gerado automaticamente, corrigir a origem/gerador e regenerar;
- manter PHP estritamente tipado e sem alterar a separação entre aplicação, domínio e persistência;
- não modificar arquivos não relacionados apenas para eliminar sujeira histórica do repositório.

## Critérios de aceite

1. A corrida real PostgreSQL produz um único canônico e contagem verdadeira.
2. O teste PostgreSQL do `noop` prova ausência de auditoria obsoleta.
3. Seleção NF-e sem estabelecimento correspondente não emite e não aceita candidato por ausência de validação.
4. A versão compartilhada não é rehosteada sob corrida com novo vínculo.
5. Os testes de fallback NF-e, todos inválidos, paridade e NFS-e congelada permanecem verdes.
6. `php -l` nos PHP alterados e `git diff --check` passam.
7. CNPJ administrativo, NFS-e e transferências continuam fora do escopo.

## Entrega esperada

Produzir uma spec implementável com os arquivos e testes a revisar, estratégia de concorrência, invariantes e critérios de execução no PostgreSQL. Não implementar código neste prompt.
