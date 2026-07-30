# Comparar o Cadastro com a Requisição da Consulta de Compras

Type: task
Status: resolved
Blocked by: 01, 02

## Question

Comparando o Cadastro Delphi com `dmconsultacompras`/`fmconsultacompras`, com o mapa concluído em `.scratch/consulta-compras-wayfinder/`, com os prompts de `modules/estoque/consulta-compras/` e com o código Laravel atual, quais comportamentos, dados, invariantes e operações são realmente compartilhados, quais apenas se parecem e quais existem em somente um dos fluxos?

## Answer

### Conclusão

Os fluxos compartilham o mesmo agregado legado (`pedidosfiliais`), parâmetros, estados básicos, efeitos de estoque e cancelamento, mas representam intenções diferentes:

- **Consulta de Compras:** comando em lote derivado de sugestão, com candidatas automáticas e distribuição entre filiais.
- **Cadastro:** manutenção unitária/manual, incluindo localizar, incluir, editar, trocar participantes/produto, ajustar quantidade e cancelar.

Não é correto fazer o Cadastro chamar simplesmente `ConsultaComprasRequisicaoService::confirmar()`: ele implementa “adicionar quantidade” e somar duplicata, não “salvar o estado editado”.

### Compartilhado de verdade

| Conceito | Nos dois Delphi | Laravel atual |
|---|---|---|
| Persistência | `pedidosfiliais` | `LegacyPedidosFiliaisRepository` |
| Aberta | `situacao = 'A'` | cria/busca/lista/cancela `'A'` |
| Filiais distintas | não aceita auto-requisição | `confirmar()` rejeita igualdade |
| Compostos | parâmetro controla | exclusion + manifest |
| Duplicidade | mesmo parâmetro | `findAberta`/somar/insert |
| Estoque imediato | `TEP` opcional | repositório de movimentos |
| Atomicidade/lock | transação + `FOR UPDATE` | `DB::transaction` + lock ordenado |
| Cancelamento | `TPE` + eventual `TFR` | já implementado |
| Motivo/observação | diálogo e campos comuns | valida e anexa texto |
| Quantidades | numérico legado | `QuantityDecimal` |
| Auditoria | trigger/log do banco | repositório reconhece trigger |

Essa é a infraestrutura candidata a reúso, embora hoje esteja nomeada sob “ConsultaCompras”.

### Parecidos, mas diferentes

**Origem:** a Consulta parte de sugestões e confirma várias linhas; o Cadastro trabalha uma requisição por vez.

**Requisitante:** na Consulta é obrigatoriamente a filial ativa da sessão e o request proíbe outra. No Cadastro nasce em `FilialBase`, mas pode ser outra filial autorizada. O Laravel não oferece esse contrato.

**Requisitada:** na Consulta várias filiais com estoque são candidatas; no Cadastro escolhe-se uma antes do produto.

**Estoque:** a Consulta usa expressão configurável de `estoque_status` e cobertura; o Cadastro usa `emestoque` da filial física resolvida.

**Duplicidade:** a Consulta soma automaticamente; o Cadastro navega para a existente para edição manual.

**Revalidação:** a Consulta compara snapshot e permite aceite. No Laravel essa comparação ainda ocorre antes da transação e não é refeita após o lock; o Cadastro Delphi tem a mesma classe de lacuna.

**Observação:** o Cadastro edita na inclusão/alteração; `LegacyPedidosFiliaisRepository::insert()` não recebe observação.

**Cancelamento:** o Cadastro localiza abertas da requisitante selecionada. O cancelamento Laravel permite quando a filial ativa é requisitante ou requisitada, porque serve à lista bilateral por produto.

### Exclusivo da Consulta

- origem na sugestão e seleção em lote;
- descoberta/ordenação de candidatas;
- cobertura, vendas, reservas, trânsito, futuro e necessidade;
- alocação entre candidatas;
- snapshot/aceite de diferença;
- soma automática de duplicata;
- grade Preencher/Reiniciar;
- integração com Pedido de Compra.

### Exclusivo do Cadastro

- carregar por `(requisitante, codigo)`;
- escolher requisitante autorizada;
- escolher requisitada antes do produto;
- pesquisar produto visual/barras na requisitada;
- exibir número, origem, situação, recebida e NF;
- editar uma aberta;
- aumentar por `TEP` da diferença;
- reduzir por `TPE` da diferença + eventual `TFR`;
- trocar produto/requisitada, revertendo o antigo e debitando o novo;
- editar observação;
- ciclo unitário de cadastro.

Essas capacidades não existem hoje no Laravel.

### Estado Laravel reaproveitável

- `ConsultaComprasRequisicaoParameterManifest`;
- `LegacyPedidosFiliaisRepository` (`findAberta`, `insert`, soma, listagem, `findByCodigo`, cancelar);
- `LegacyConsultaComprasRequisicaoMovimentoWriteRepository` (locks, TEP, TPE/TFR);
- `ConsultaComprasRequisicaoService::cancelar()`;
- validação de motivos;
- `QuantityDecimal`, encoding, transações e testes existentes.

### Lacunas Laravel

- nenhuma rota, página, policy ou request do Cadastro;
- nenhuma busca por código/requisitante para edição;
- nenhum catálogo de requisitantes autorizadas;
- nenhum lookup equivalente de requisitada/produto;
- nenhum comando de atualização concorrente;
- nenhum movimento de delta/troca;
- `insert()` não aceita observação/origem;
- nenhuma projeção detalhada com recebimento/NF;
- nenhuma marca persistida de que houve débito na criação;
- resolução de `filial_estoque` ausente nos repositórios atuais, que usam diretamente `filial_atendente`.

### Fronteira preparada

O reúso seguro está nas políticas/operações de persistência — parâmetros, identidade, quantidade, lock, insert, cancelamento e movimentos — não na orquestração/UI da Consulta. **“Decidir o limite de reaproveitamento entre os dois fluxos”** decidirá se esses componentes serão aprofundados/renomeados como compartilhados ou encapsulados por novo serviço, sem acoplar o Cadastro ao workflow de sugestão.
