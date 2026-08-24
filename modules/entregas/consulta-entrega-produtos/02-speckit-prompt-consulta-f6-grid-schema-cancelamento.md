# Prompt 02 — Consulta F6, grid, schema e cancelamento

Execute /speckit.specify para especificar o read model, o grid e o protocolo F6 cancelável da Consulta de Entrega de Produtos.

## Pré-condições

Use como contrato estrutural schema/postgresql-authoritative-2026-08-23.json, schema/consulta-entrega-produtos-schema-manifest.json e schema/README.md. Se a implementação precisar de tabela, coluna, função, nulabilidade ou cardinalidade ausente, bloquear a especificação afetada e pedir nova captura datada; não sondar o banco em runtime.

## SQL e read model

Especificar uma leitura set-based equivalente às duas branches UNION ALL:

- branch fiscal com dadosfiscais, produtosdadosfiscais, produtos, notas, periodosentrega, devoluções e vínculos de romaneio;
- branch contrato com produtoscontratos, contratos, produtos, periodosentrega, devoluções e quantidades fiscais abertas;
- projeção comum com source_kind fiscal/contrato e a chave real da linha confirmada no schema;
- saldos, entregas, endereço, cidade, bairro, região, fornecedor, romaneio e limite sem consulta por linha;
- preservação de filtros inclusivos, situação, contratos_atual, entregas habilitadas, devoluções N/F e not exists de recebimento;
- ordenação inicial determinística por data, período, região, CEP, bairro, hora e desempate por identidade.

Todos os valores devem ser binds. Filiais, fornecedores e outros conjuntos devem usar IN/whereIn ou ANY(array). Períodos devem ser parâmetros estruturados com predicados fixos. Não aceitar expressão SQL, operador, coluna ou tabela do browser.

Pré-agregar devoluções e quantidades fiscais; usar EXISTS quando só houver teste de presença; confirmar cardinalidade antes de qualquer join. INNER JOIN é obrigatório em vínculos NOT NULL/FK necessários. LEFT JOIN só é permitido quando ausência tiver significado funcional comprovado. Não usar contratonota, posição do grid ou produtovisual como chave de escrita.

## Grid

Especificar catálogo PHP/TypeScript próprio com gridId, screenKey, schemaVersion, campos, rótulos, formatos, visibilidade, exportabilidade, ordenação allowlistada e desempate estável. Usar ErpPreferenceDataGrid, preferências por usuário, resize/reorder e exportação server-side. Campos derivados e fiscais ficam read-only nesta fatia; data, hora e período são tratados pelo prompt 03.

O grid deve manter o mesmo conjunto, identidade, filtros, agrupamento e layout lógico usados pelo relatório. A exportação não pode refazer uma consulta divergente nem aceitar linhas fornecidas pelo cliente.

## F6 e Cancelar

F6 e Gerar chamam o mesmo handler. Antes do primeiro await, criar trace, marcar busy e renderizar Cancelar. No servidor, envolver montagem, SQL, pré-agregação e enriquecimento no PgsqlGerarQueryRunner; registrar PID e cancelar com pg_cancel_backend. O cliente envia cancelar primeiro ao servidor e só depois aborta a espera local. Cancelamento preserva o último resultado completo, e respostas tardias são ignoradas por sequência/trace.

Se a execução exceder um limite operacional medido, especificar protocolo heavy com generationId, polling e cancel_url sem alterar o resultado canônico. Não chamar AbortController de cancelamento do banco.

## Aceite

Cobrir schema gate por checksum, ausência de N+1, cardinalidade das duas branches, parâmetros, ordenação, paginação, vazio, exportação, busy/cancel, PID PostgreSQL e resposta tardia. Não usar teste de driver, hasTable, Schema::has*, information_schema ou pg_catalog no caminho de negócio.
