# Adendo ao prompt 25

Inclua também na especificação corretiva:

- validar todos os vínculos da versão, inclusive quando outro estabelecimento estiver associado a contribuinte diferente; não re-hospedar versão compartilhada deixando relação ativa incompatível;
- corrigir `dependencias_qtd`, que atualmente soma flags e não representa quantidade real ou categorias declaradas;
- garantir que o sync deixe diagnóstico auditável quando detectar duplicata/divergência sem mutação, sem gerar auditorias idênticas infinitamente;
- rejeitar na seleção NF-e a tríade inconsistente entre estabelecimento, vínculo e versão, inclusive legado;
- corrigir `a_vencer` para excluir certificados já expirados, usando janela inferior e superior;
- tipar `Builder` em `indexCatalogQuery` e `applyCloudPredicates`.

O restante do escopo e as exclusões do prompt 25 permanecem inalterados.
