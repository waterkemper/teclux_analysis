Type: grilling
Status: resolved
Blocked by: 02

## Question

Qual contrato comum de leitura deve aplicar Produto Ativo antes do ranking/corte, separar saldo emestoque por Filial, resolver Atributos Comerciais Evidenciados e delegar Preco ao adapter correto de Consulta de Estoques ou Orcamentos, sem omitir Produto sem linha de estoque nem agregar Filiais silenciosamente?

## Answer

O contrato comum de leitura deve aplicar Produto Ativo antes da formacao de candidatos, do ranking e do corte de resultados. Nenhum Produto inativo pode aparecer, mesmo com identificador exato, texto semelhante ou estoque. A regra tambem deve ser repetida no detalhe e em qualquer tool de resultado.

Quando a consulta nao pedir estoque, um Produto Ativo sem linha de estoque continua elegivel e deve ser tratado como emestoque zero ou indisponibilidade conhecida. Quando houver filtro com estoque ou quantidade minima, a ausencia da linha equivale a zero e o produto fica fora.

No contexto de Orcamentos, a busca exibe somente o total consolidado de estoque de todas as Filiais, sem composicao por Filial. O Preco exibido e sempre o da Filial Base, e a inclusao do produto usa sempre a Filial Base. O total de estoque e informativo e nao altera a Filial do Orcamento.

Atributos Comerciais so podem filtrar quando houver valor estruturado ou evidencia textual clara no cadastro. Sem evidencia, o sistema nao inventa equivalencia nem exclui silenciosamente; pode sinalizar incerteza ou pedir esclarecimento.

Preco deve ser resolvido pelo adapter do contexto: Consulta de Estoques usa o preco efetivo autorizado; Orcamentos usam o preco da Filial Base e as regras de cliente, cargo e markup. Autorizacao, limites e validacao permanecem no servidor. Cada valor dinamico deve carregar origem e instante da consulta para permitir explicacao e auditoria.
