# Prompt para /speckit.specify — Exportação estruturada XLSX

```text
/speckit.specify

Crie uma especificação corretiva P2 para exportar o Cadastro de Pedidos de Compra em `.xlsx`, completando a entrega acessória do prompt 08. Pressuponha specs 16–22 integradas e verdes. Gere a spec; não implemente.

LEITURAS

- prompts 08, 09, 16, 18 e 19;
- auditorias desta pasta;
- serviço/read model/Blade do relatório atual, autorização do módulo, padrão XLSX já usado no projeto e testes.

Revalide a existência de biblioteca/componente compartilhado e reuse-o. Não crie framework genérico de exportação.

FONTE ÚNICA

A exportação usa a mesma projeção autorizada que alimenta o relatório do Pedido, enriquecida apenas com campos estruturados já pertencentes ao contrato. Não faça query paralela que possa divergir em itens, previsões, totais, Parte ou Filiais.

CONTEÚDO

Workbook com estrutura determinística, no mínimo:
- metadados: número/revisão/situação, data/hora da exportação, Usuário e Filial/contexto;
- cabeçalho do Pedido e observações conforme política do prompt 19;
- itens em ordem persistida, quantidades/recebidas, valores e totais autorizados;
- Previsões de Entrega;
- totais do Pedido.

Defina planilhas/colunas/tipos/formatação após inspecionar o padrão vigente. Datas são datas, números permanecem numéricos, moeda tem precisão definida e fórmulas de planilha não são fonte da verdade. Observações internas só aparecem quando o Usuário e a finalidade interna autorizarem; nunca reutilize essa exportação como anexo externo sem política explícita.

SEGURANÇA E CONSISTÊNCIA

- mesma autorização do Cadastro e escopo de Filial;
- Pedido/revisão deve ser lido consistentemente; registre revision/data_as_of no arquivo;
- nome de arquivo sanitizado e content type correto;
- proteção contra formula injection em células textuais;
- streaming/limites para memória, sem arquivo parcial;
- log operacional com Usuário, Pedido, Filial, revisão, resultado e correlation_id, sem guardar conteúdo sensível desnecessário.

UX

Ação “Exportar Excel” com loading, prevenção de duplo envio, erro acionável e download somente após sucesso. Não bloquear edição por longos períodos nem manter locks durante geração.

TESTES

- autorização/Filial/403;
- workbook abre e contém sheets/headers/tipos/valores esperados;
- mesma projeção/totais do relatório;
- ordem de itens e Previsões;
- precisão de moeda/datas;
- formula injection neutralizada;
- observação interna respeita política;
- nome/content type;
- volume/memória/falha sem parcial;
- React: loading, duplo clique, sucesso/erro.

Use PostgreSQL real para leitura legada relevante e testes do gerador sempre executáveis. Não deixe correção de conteúdo dependente de Excel instalado.

SAÍDA

Spec autocontida com contrato do workbook, fonte única, autorização, segurança, limites, UX, testes, operação e arquivos mínimos revalidados.

FORA DE ESCOPO

CSV; exportador genérico; editar/importar workbook; fórmulas financeiras no Excel; envio automático ao fornecedor; alterar Delphi; implementar agora.
```
