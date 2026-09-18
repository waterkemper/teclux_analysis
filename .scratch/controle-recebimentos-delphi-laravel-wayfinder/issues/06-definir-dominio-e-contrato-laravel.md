# Definir domínio e contrato Laravel do Controle de Recebimentos

Type: grilling
Status: resolved
Blocked by: 01, 02, 03, 04, 05

## Answer

A decisão do solicitante fixa o limite: **sim, somente Alteração**, exatamente nos limites observados no Delphi. O contrato foi registrado em [`contrato-dominio-laravel-delphi.md`](../../../modules/caixa/controle-recebimentos/contrato-dominio-laravel-delphi.md).

- O módulo é uma Consulta Operacional de Recebimentos, não um Cadastro; não há Inclusão nem Exclusão. `BeforeInsert` e `BeforeDelete` abortam e o grid não cria/exclui linhas.
- A identidade da linha é `recebimentos.codigo`; `controlerecebimento` é o agrupador usado pela seleção e pela alteração de tipo.
- Os únicos modos são: índice 0, alterar tipo; índice 1, confirmar recebimentos; índice 2, estornar recebimentos.
- A editabilidade é condicional: tipo somente no índice 0 e sem confirmações relacionadas; data/valor de confirmação e deságio somente no índice 1; demais dados permanecem informativos. `valorlancto` fica somente leitura por causa da divergência coluna/field, sem ampliar a permissão.
- Confirmação e estorno mantêm a identidade do recebimento e alteram seus efeitos relacionados; alteração de tipo recalcula o grupo e rateia conforme o tipo. Não foram criadas operações adicionais.
- F5, F6, F9, filtros, Filial, parâmetro bancário, autorização de Analista de Crédito, grid, cancelamento real, relatório, menu, máscara NF-e e regras SQL foram separados entre comportamento confirmado e requisito Laravel não localizado no Delphi.
- O Delphi comprova gravação agrupada por `Perpetrar`, mas não comprova contrato formal de concorrência, idempotência, auditoria imutável ou capability individual por operação. Esses pontos não foram inventados e passam ao ticket específico seguinte; qualquer proteção nova deve impedir ampliação das operações permitidas.

O glossário raiz foi atualizado com `Consulta Operacional de Recebimentos` e `Alteração de Recebimento`.
## Question

Com as evidências reunidas, decidir o domínio e o contrato Laravel: Consulta, Cadastro, Relatório e Operações; identidade e granularidade dos resultados; filtros tipados e escopo de Filial; colunas editáveis e regras de gravação; autorização por capability e senha; parâmetros; concorrência, idempotência, auditoria e transação; F5/F6/F9; cancelamento real; exportação; fotografia/read model; e comportamento quando o legado tiver ambiguidades ou bugs.

Usar uma pergunta por vez para decisões do usuário, sempre propondo uma recomendação e testando cenários-limite. Se houver Cadastro, aplicar o padrão de chave primária e Situação do Cadastro de Requisições e preferir radio buttons a selects. Fixar a terminologia no contexto Laravel sem copiar detalhes de implementação Delphi.
