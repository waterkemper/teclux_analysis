# Prompt de implementação — Eventos, projeção, estados e capability

```text
/speckit.implement

Implemente R3 de `laravel/specs/349-trf-fiscal-plataforma-real/correcoes-pos-revisao.md`, depois de R1 e R2.

Corrija a publicação dos eventos para ocorrer somente após a situação fiscal estar persistida e fora da transação que pode sofrer rollback. O listener de AUTORIZADA deve resolver grupo, consultar status real, validar emitente/modelo/chave, carregar a fotografia selada pela plataforma e então aplicar a projeção.

Não passe fotografia vazia, não consulte cadastro atual, não chame Fake/markAuthorized e não altere situação fiscal no handler. Falha no listener deve deixar pendência/retry durável; log isolado não é suficiente.

Mantenha separados confirmação operacional, situação fiscal, processamento, projeção e pendências. Rejeição corrigível, falha operacional e aguardando reconciliação não podem ser todos reduzidos ao mesmo estado preparatório.

Proteja a rota manual com a capability administrativa reforçada existente no projeto, além de verificar AUTORIZADA. Ela deve ser apenas replay idempotente. Teste PENDENTE/rejeitada/falha/ambígua, AUTORIZADA, evento repetido, falha/retry do listener e usuário sem capability.
```
