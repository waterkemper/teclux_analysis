# Prompt de implementação — Durabilidade, persistência e acesso ao legado

```text
/speckit.implement

Implemente R1 de `laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md`.

Escopo exclusivo:

- substituir `pendingSeals`/`pendingEmissions` por persistência durável da plataforma;
- permitir retry/restart/worker separado entre seal, criação e numeração;
- reutilizar `CloudFiscalEmissaoRepository`, revisões e o serviço comum de alocação;
- remover consultas `DB::table()` de Application, HTTP e listeners, criando/reutilizando repositórios de Infrastructure;
- remover resolução duplicada de série e preservar `FOR UPDATE`/rollback;
- trocar `catch (Throwable) { return [];/null; }` por falha explícita mapeada e pendência acionável;
- corrigir a resolução de `filial_estoque`, sem tratar `pf.requisitada` como autoridade física;
- manter Fake somente em teste/dry-run explícito.

Não criar nem reintroduzir efeitos financeiros de venda/devolução nesta etapa. Não alterar a fotografia completa ou a reconciliação Delphi, exceto contratos necessários para carregar a revisão persistida.

Escreva primeiro testes que falhem para restart entre etapas, retry idempotente, rollback pré-commit, schema/consulta ausente, consulta sem autorização e filial física divergente. Depois implemente e execute os testes disponíveis. Não considere concluído enquanto o token de memória for obrigatório.
```
