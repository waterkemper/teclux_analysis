# Prompt 03 — Edição, agendamento, F5 e conflitos

Execute /speckit.specify para especificar a edição operacional limitada da Consulta e Agendamento de Entregas.

## Autoridade

Use pesquisa-interface-filtros-grid-operacoes.md, pesquisa-sql-projecao-atualizacao.md, pesquisa-padroes-laravel-grid-relatorio-cancelamento-schema.md e o snapshot PostgreSQL deste diretório. Não reabrir fontes Delphi diretamente.

## Campos editáveis

Permitir edição somente de data de entrega, hora de entrega e período de entrega. Todos os demais campos do grid, incluindo saldo, entrega, limite, região, fornecedor, romaneio, contrato, nota, produto e endereço, são derivados ou identificadores e permanecem read-only.

Especificar:

- data mínima igual à data do servidor quando o reagendamento exigir; limite superior de 60 dias quando essa regra do fluxo for mantida;
- data inicial não posterior à data final dos filtros;
- período selecionado deve existir no catálogo de periodosentrega;
- ao trocar período, hora fora do intervalo inclusivo deve assumir a hora padrão;
- ao trocar hora, selecionar o primeiro período cujo intervalo inclusivo contenha a hora;
- hora sem período correspondente deve produzir erro explícito ou estado inválido, nunca persistência silenciosa;
- valores nulos e timezone devem ser normalizados no backend;
- dirty state deve comparar baseline retornado pelo read model com o change set enviado.

## Identidade e propagação

O read model deve fornecer source_kind e a chave real da linha. O comando nunca pode derivar tabela ou chave apenas pela nulabilidade enviada pelo cliente. Se houver propagação para linhas que compartilham contrato/documento fiscal, representar isso como delivery_group_key explícita e autorizada, validar o conjunto no servidor e testar sua cardinalidade.

Não usar contratonota, posição da grade, produtovisual ou índice da página como identidade.

## F5/Gravar

F5 deve enviar um change set tipado com todas as linhas alteradas. O backend deve:

1. autenticar usuário e revalidar capability e Filial;
2. canonicalizar e validar a intenção;
3. reler as linhas e baseline;
4. verificar elegibilidade e bloquear somente os agregados necessários;
5. atualizar branches fiscais e contratuais separadamente, com binds e chave completa;
6. exigir revisão esperada ou valores baseline na cláusula de concorrência;
7. rejeitar conflito quando zero ou mais de uma linha for afetada onde uma era esperada;
8. gravar auditoria e nova revisão;
9. confirmar tudo em uma única transação ou fazer rollback integral.

O comando deve ser idempotente mediante chave de idempotência e hash canônico. Conflito retorna 409 com motivo e estado atual; não usar última gravação vence, não fazer commit parcial e não retornar sucesso antes do commit.

## Aceite

Cobrir alteração de cada campo, sincronização data/hora/período, conjunto vazio, duplicata de linha, concorrência Delphi/Laravel, baseline obsoleto, Filial fora do escopo, rollback, repetição idempotente, tentativa de editar campo derivado e propagação de grupo.

Não usar UPDATE concatenado, query em loop, N+1, preferências do grid como persistência, teste de driver ou hasTable/Schema::has*.
