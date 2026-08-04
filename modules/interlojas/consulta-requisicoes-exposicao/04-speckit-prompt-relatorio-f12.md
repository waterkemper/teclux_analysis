# Prompt para /speckit.specify — relatório F12

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para o relatório F12 da **Consulta de Requisições para Exposição**, quarta e última fatia. Consuma capability/filial/filtros da spec 01 e a mesma semântica de leitura/ordenação da spec 02. Entregue PDF Laravel próprio sem copiar FastReport nem aceitar dados do navegador como autoridade.

Não implemente nesta etapa. Inspecione o checkout atual e cite `ErpReportLayoutService`, `FilialInstitutionalReportService`, CSS/templates ERP, `BrowsershotPdfGenerator`, relatórios de Estoque e seus testes. Não abra Delphi: o contrato visual abaixo, confirmado também por `relatorio.png`, é autoritativo.

## Geração e segurança

- F12 só habilita quando a grid possui resultado.
- Abrir o PDF em nova aba com `Content-Type: application/pdf` e `Content-Disposition: inline`.
- Endpoint recebe somente os filtros canônicos; revalida autenticação, capability, filial ativa autorizada e datas/situação.
- O servidor executa novamente a leitura completa, sem paginação e sem aceitar `linhas` do cliente.
- Grid e relatório compartilham filial, período, situação e ordem `requisitada, produto, codigo`.
- Não usar fila pesada salvo evidência de volume/padrão atual que a justifique; registrar a decisão com base no checkout.

## Formato

- PDF em orientação paisagem;
- shell institucional ERP com logo/dados da filial ativa, emissão e paginação;
- cabeçalho explicita Filial Requisitante, período e situação;
- título compatível com **REQUISIÇÕES DE MERCADORIAS**;
- agrupamento por Filial Requisitada, nome em negrito na primeira linha do grupo;
- linhas zebradas, descrição flexível e colunas quantitativas compactas;
- sem subtotais por filial e sem total geral.

## Colunas exatas

1. **Filial Requisitada**;
2. **Código**;
3. **Descrição**;
4. **Referência**;
5. **ABC**;
6. **Nº Lote**;
7. **Solicitado**;
8. **Confirmado**;
9. **OK**.

Mapeamentos:

- Código: código visual do produto, preservando identidade interna somente no backend;
- Descrição: descrição com grades incorporadas quando aplicável;
- Referência: produto;
- ABC: `resultadocurvaabc`;
- Nº Lote: `lotetransferencia`, vazio quando zero/ausente;
- Solicitado: `qtdepedida`;
- Confirmado: `qtderecebida`;
- OK: caixa vazia por item para marcação manual, sem persistência.

O relatório usa apenas Pedidos. Não inclui a aba Confirmados, estoques, Reserva Prévia, situação, observação ou data por linha.

## Arquitetura esperada

- Form Request dos filtros ou reutilização segura do contrato canônico;
- controller/rota específicos;
- service de relatório que usa leitura completa autorizada;
- view model/agrupador determinístico;
- Blade e CSS modular sobre `ErpReportLayoutService`;
- Browsershot em paisagem e resposta inline;
- nome de arquivo estável e seguro;
- tratamento de renderizador indisponível com 503 e demais falhas sem detalhes internos.

Não envie HTML/linhas fornecidos pelo frontend para o gerador.

## Critérios de aceite

- [ ] PDF contém todas as linhas dos filtros, inclusive além da página atual, e nenhuma linha fora deles.
- [ ] Endpoint ignora/rejeita linhas do cliente e aplica autorização completa.
- [ ] Identidades e ordem coincidem com a leitura não paginada da spec 02.
- [ ] Paisagem, cabeçalho institucional/filtros, agrupamento e nove colunas estão presentes.
- [ ] OK é visual e não persistido; lote ausente fica vazio; grades integram descrição.
- [ ] Não há Confirmados, colunas extras, subtotais ou total geral.
- [ ] Resposta é inline; indisponibilidade conhecida retorna 503.

## Matriz mínima de testes

- Feature de visitante, sem capability, filial não autorizada e autorizado;
- validação de datas/situação e tentativa de enviar `linhas`;
- duas páginas de grid comparadas ao conjunto integral do relatório;
- dois grupos de filial com ordem estável, lote zero/ausente, grades e ABC;
- Unit/Service/Blade para título, filtros, colunas, checkbox OK, zebramento e ausências deliberadas;
- teste do gerador na borda verificando paisagem, shell, headers e 503;
- smoke com Chromium validando assinatura `%PDF` e ao menos uma página, sem snapshot binário frágil;
- regressão dos relatórios ERP existentes e da leitura da spec 02.

## Saída esperada do SpecKit

Produza spec e plano executáveis com arquitetura, contratos, consulta completa, view model, Blade/CSS, tratamento de falhas, sequência e testes. Não implemente durante `/speckit.specify`.

## Fora de escopo

- persistir a coluna OK;
- exportação Excel/CSV ou envio por e-mail;
- imprimir detalhe Confirmados;
- subtotais/totais ou novas colunas;
- mutações das specs anteriores;
- separação, transferência, expedição, recebimento e `qtderecebida` editável;
- copiar FastReport ou alterar Delphi.
```
