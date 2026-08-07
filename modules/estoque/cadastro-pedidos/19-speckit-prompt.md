# Prompt para /speckit.specify — Cabeçalho, estados e observações

```text
/speckit.specify

Crie uma especificação corretiva P1 para completar o cabeçalho e a matriz de edição do Cadastro de Pedidos. Pressuponha as specs 16–18 implementadas e verdes. Gere a spec; não implemente.

FONTES OBRIGATÓRIAS

- prompts 06, 07, 16, 17 e 18 desta pasta;
- as três auditorias `auditoria-*.md`;
- `C:/projetos.vcl/apps/estoque/dmcadastropedidos.pas/.dfm` e `fmcadastropedidos.pas/.dfm` somente para confirmar os comportamentos já citados;
- página, services, DTOs, repositories e testes atuais do Pedido no checkout Laravel.

Revalide nomes/campos e reaproveite lookups/componentes existentes.

ESCOPO DO CABEÇALHO

Especifique conteúdo, defaults, validação e editabilidade para:
- Filial de Fatura, Entrega e Cobrança;
- Parte Fornecedora, UF/regime derivados e transportadora;
- data-base/lançamento, Data de Entrega, referência e contato;
- frete CTR/NF, desconto geral, acréscimo, seguro e despesas acessórias;
- indicador Recebido;
- Observações da Compra e Observações do Estoque;
- quadro reativo de totais: descontos, acréscimo, produtos, ICMS-ST, frete, seguro, despesas, IPI e total final.

DEFAULTS E REAÇÕES

- selecionar Filial principal preenche Entrega/Cobrança quando ainda vazias;
- mudar Filial de Entrega altera o contexto da busca de Produtos;
- mudar Filial de Fatura atualiza regime/classificação e executa motores da spec 17 e Previsões/financeiro elegíveis da spec 18;
- mudar Parte Fornecedora atualiza UF/CRT/contexto fiscal; só é permitido em Pedido Aberto sem quantidade recebida e mantém confirmação de wipe de itens;
- mudar data-base recalcula Previsões;
- fretes/desconto/acréscimo/seguro/despesas executam rateio, motores, totais e Previsões conforme contratos existentes;
- nenhum recálculo ocorre fora da transação/revisão da spec 16.

MATRIZ DE SITUAÇÃO

Defina explicitamente Aberto, Parcial, Concluído, Cancelado e Liquidado.
- Fornecedor: somente Aberto e sem recebimento.
- Parcial: entrega e observações editáveis; Filiais Entrega/Cobrança somente se não invalidarem recebimentos; Filial Fatura somente se motores/financeiro recalcularem sem atingir Duplicatas protegidas.
- Alterar Data de Entrega com Recebido=true exige confirmação e desmarca Recebido atomicamente.
- Qualquer incompatibilidade financeira/fiscal/recebimento bloqueia com mensagem, sem write parcial.

OBSERVAÇÕES

São campos diferentes:
- Observações da Compra: externa, incluída no relatório e e-mail ao fornecedor;
- Observações do Estoque: interna, visível no Cadastro e relatório interno, nunca enviada ao fornecedor.

Defina limites, sanitização, persistência, edição por situação e testes que provem ausência de vazamento da observação interna.

UX/ERROS

Preserve hierarquia visual das imagens sem cópia pixel a pixel. Mostre dependências e totais de forma acessível. Reutilize códigos das specs 16–18 e acrescente códigos específicos apenas quando necessário, todos com mensagem/correlation_id.

TESTES

- React: defaults, lookups, matriz enabled/disabled, confirmações, totais, duas observações e foco/erros;
- PostgreSQL: recálculos e rollback, alteração Parcial, Recebido, wipe de fornecedor, locks/revisão e fatos financeiros protegidos;
- e-mail/relatório: Compra presente, Estoque ausente no conteúdo externo;
- regressão de Pedido, motores e Contas a Pagar;
- sem skip/incomplete em regras da fatia.

SAÍDA

Spec autocontida com matriz campo×situação, eventos/recalculos, contratos, mensagens, testes, rollout e arquivos mínimos revalidados.

FORA DE ESCOPO

Abrir automaticamente ficha do fornecedor; novas fórmulas; mudar estados fechados; bypass financeiro; abilities novas; alterar Delphi; implementar agora.
```
