# Prompt para /speckit.specify — fundação, domínio e segurança

~~~text
/speckit.specify

Crie a especificação funcional e técnica da fundação Laravel de Interlojas → Confirmação por Romaneios. Esta é a primeira de cinco specs coordenadas. Defina domínio, coexistência Delphi–Laravel, menu, Filial, parâmetros, capabilities, autorização sensível, idempotência, auditoria, revisão, schema gate e contratos de persistência. Não especifique ainda a interface completa, a query F6 detalhada ou a matriz final de testes.

Não implemente durante /speckit.specify. Inspecione o checkout Laravel e cite arquivos concretos. Leia:

- modules/interlojas/confirmacao-por-romaneios/README.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-parametros-autorizacoes-menu.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-padroes-laravel-reutilizaveis.md
- modules/interlojas/confirmacao-por-romaneios/pesquisa-sql-dominio-efeitos-delphi.md
- modules/interlojas/confirmacao-por-romaneios/schema/README.md
- modules/interlojas/confirmacao-por-romaneios/schema/postgresql-authoritative-2026-08-03.json
- CONTEXT.md

## Contrato de domínio

- Confirmação por Romaneios reproduz funcionalmente o Delphi; Cadastro de Romaneios mantém o agregado e Confirmação por Notas permanece fluxo distinto.
- Delphi e Laravel compartilham as mesmas tabelas, funções e situações PostgreSQL. Não criar estado paralelo de confirmação.
- A Filial efetiva vem da sessão e do escopo autorizado; não aceitar Filial, cliente ou IDs de Filial como autoridade do browser.
- Criar folha Cloud própria sob Interlojas, rota/capability próprios e grants explícitos em usuariosacessosmodulos. Não presumir código numérico, não copiar o código de Confirmação por Notas e não conceder acesso em massa.
- Resolver em uma chamada batched de ParameterService::getMany os literais USAR GRADES PRODUTOS, Máscara Quantidade, DATA CONTABIL, DIASNOTARETROATIVA e Evento Pagto Duplicata Transferência entre empresa. Normalizar tipos e rejeitar configuração inválida no backend.
- A autorização sensível separa Operador e Autorizador, pode aceitar a mesma pessoa conforme a regra Delphi, não armazena senha e não transforma acesso ao menu em autorização de comando.
- Cada Romaneio é unidade atômica independente. Locks são determinísticos; revalidar Filial, revisão, situação, elegibilidade, parâmetros e autorização após os locks.
- Retry idêntico devolve a evidência anterior; payload diferente ou situação alterada produz conflito. Falha em qualquer efeito desfaz a unidade inteira.
- Usar funções PostgreSQL legadas confirmadas para numeração, situação e contratos autoritativos. Não usar MAX()+1, sequência paralela ou regra opaca duplicada em PHP.

## Segurança e schema

Especificar middleware em toda a árvore, inclusive F6, cancelar-gerar, exportação, conferência e confirmação. O schema JSON é o contrato estrutural; novas coletas são artefatos datados. Não usar Schema::hasTable, Schema::hasColumn, information_schema ou pg_catalog no caminho de negócio.

Classifique cada afirmação como CONFIRMADO, INFERIDO, DIVERGENTE, LACUNA ou DECISÃO NOVA, citando arquivo e linha. Entregue requisitos, invariantes, entidades/valores, capabilities, contratos de erro, auditoria e dependências para a spec 02.

Fora de escopo: implementação, migrations aplicadas, Cadastro de Romaneios, Confirmação por Notas, testes de driver e hashtablefs.
~~~

