Type: task
Status: resolved
Blocked by:

## Question

Qual é a superfície funcional e técnica real do Cadastro de Contratos no Delphi — form principal e ancestral, DFM, data modules, units auxiliares, datasets, actions, eventos, SQL, parâmetros, permissões, relatórios e integrações — e quais equivalentes ou componentes reutilizáveis já existem no Laravel, especialmente na Consulta de Contratos e na geração por Orçamento?

O resultado deve ser um inventário evidenciado, sem decidir requisitos, que delimite o agregado, as operações externas e os pontos ainda não localizados.

## Answer

### Síntese

**CONFIRMADO** — O Cadastro de Contratos Delphi é um monólito funcional e técnico, não apenas um CRUD. A superfície principal soma aproximadamente 48 mil linhas entre form, DFM, data module principal e dois data modules auxiliares. O form possui cerca de 170 handlers próprios e o data module principal cerca de 506 métodos. Evidências: `fmcadastrocontratos.pas/.dfm`, `dmcadastrocontratos.pas/.dfm`, `dmcadastrocontratosauxiliar.pas/.dfm` e `dmcadastrocontratosmanutencao.pas/.dfm`.

**CONFIRMADO** — O Laravel ainda não possui um Cadastro de Contratos equivalente, mas já implementa partes importantes como módulos separados: Consulta de Contratos, detalhe do Contrato, gravação limitada de filial/vendedor/entrega, Ficha Financeira, impressão/PDF, log de parcelas, atendimento incorporado e geração de Contrato a partir de Orçamento. Evidências: rotas em `backend/routes/web.php` e classes sob `backend/app/{Http,Services,Infrastructure,Support}` e `backend/resources/js/Components/erp/vendas`.

**DECISÃO NOVA** — Para fins do mapa, o legado será tratado como fonte de comportamentos e evidências, não como proposta de arquitetura. Cada responsabilidade encontrada precisa ser classificada posteriormente como núcleo do Cadastro, componente reutilizável ou operação externa.

### 1. Estrutura principal Delphi

**CONFIRMADO** — O form `TfrmCadastroContratos` herda `TfrmCadastroPadrao`, portanto abertura, navegação, inclusão, alteração, exclusão, salvar e cancelar não podem ser analisados apenas no form concreto. Evidências: declaração da classe em `fmcadastrocontratos.pas:39`; ancestral em `repositorio/fmcadastropadrao.pas:18`; DFM do contrato usa herança.

**CONFIRMADO** — PAS e DFM formam uma unidade inseparável: o DFM declara a composição visual e associa eventos; o PAS implementa handlers e orquestra o data module. Exemplos evidenciados: `sbnAlterarSituacao`/`sbnAlterarSituacaoClick`, `sbnImprimirContrato`/`sbnImprimirContratoClick`, `sbnCopiarContrato`/`sbnCopiarContratoClick`, grids de Produtos/Serviços e `pgcContratosChange`.

**CONFIRMADO** — O data module `TdtmCadastroContratos` herda `TdtmBasico`, possui transação explícita `tstContrato` e reúne datasets de leitura e escrita para vários domínios. Evidências: declaração em `dmcadastrocontratos.pas`; `tstContrato` em `dmcadastrocontratos.dfm:12226`; `qryContratos` em `dmcadastrocontratos.dfm:10354`.

**CONFIRMADO** — Existem dois auxiliares relevantes: `dmcadastrocontratosauxiliar`, voltado a consultas/operações complementares, e `dmcadastrocontratosmanutencao`, ligado à variante de manutenção. Eles devem ser rastreados sob demanda nas próximas fatias; não são detalhes descartáveis.

### 2. Superfície funcional visível

**CONFIRMADO** — A barra de operações expõe Atendimento, Vendas, Consulta de Contratos, Histórico, Enquete, Troca para Devolução, Venda Perdida, Ficha Financeira, Impressão, Cópia, alteração de situação e envio. Evidência: componentes e `OnClick` no início de `fmcadastrocontratos.dfm`.

**CONFIRMADO** — O cabeçalho reúne abertura, faturamento, contrato original/anterior/renegociação/reservado, Qualidade de Venda, conferência, Cliente, consumidor final/NFC-e, bônus, dependente, vendedor, licitação, situação e histórico/vínculo com Orçamento. Evidência: bloco inicial do DFM até `pgcContratos`.

**CONFIRMADO** — As áreas principais do page control incluem:

- Dados do Cliente: geral, residência, comercial, cônjuge, referências, outros, equipamentos, contatos e login do site;
- Produtos: inclusão, exclusão, cópia, brinde, ordenação, devolução, conferência, troca de estoque, foto, cotação de frete, retenções, séries/lotes e situação de atendimento;
- Serviços: inclusão/exclusão, CFPS, equipamento e retenções;
- Geral/comercial: agente, plano, parcelas, formas de pagamento, filial de venda/montagem, analista/avalista, frete, seguro, descontos, cashback, cupom, impostos e totais.

Evidência: captions, grids, botões e associações de eventos em `fmcadastrocontratos.dfm`.

### 3. Dados e dependências persistentes

**CONFIRMADO** — A query principal de Contratos contém, além da identidade e situação, uma fotografia extensa do Cliente, dados comerciais, entrega/montagem, vendedor/agente/analista, plano, descontos, frete, seguro, origem e vínculos. Evidência: campos persistentes declarados a partir de `qryContratos` em `dmcadastrocontratos.pas` e SQL do componente no DFM.

**CONFIRMADO** — O data module acessa diretamente um conjunto amplo de tabelas, incluindo `contratos`, `clientes`, `produtoscontratos`, `servicoscontratos`, `parcelas`, `recebimentos`, `movimentos`, `estoques`, `estoqueslotes`, `reservas`, `produtosreservas`, `produtoscontratosseries`, `produtoscontratoslotes`, `dadosfiscais`, `produtosdadosfiscais`, `notas`, `cupons`, `tef`, `transferenciasfiliais`, `impostosretidos*`, `qualidade_vendas`, `contatos`, `equipamentosclientes`, `receitaoculos` e `orcamentos`. Evidência: SQL embutido em `dmcadastrocontratos.dfm`.

**CONFIRMADO** — Há efeitos coordenados por uma transação do legado, porém a mera presença de `tstContrato` não prova que todas as rotinas compartilham a mesma atomicidade. A fronteira transacional precisa ser decidida no ticket do núcleo e validada em cada operação.

**DÚVIDA** — O inventário não estabelece ainda quais campos do Cliente são fotografia imutável do momento da venda, quais permanecem vinculados ao Cadastro de Clientes e quais atualizações propagam entre ambos. Essa decisão pertence a “Definir vínculo e fotografia do Cliente”.

### 4. Estados e operações

**CONFIRMADO** — O form habilita/desabilita operações a partir de `SituacaoContrato`, incluindo edição, exclusão, cópia, impressão, Produtos, Serviços e alteração de situação. Evidências: `AlterarEstadoBotoes` em `fmcadastrocontratos.pas:908` e lógica equivalente após cancelamento de edição.

**CONFIRMADO** — Há rotinas explícitas para reservar, faturar, faturar Contrato orçado, emitir nota parcial/total, cancelar/excluir, copiar, devolver produtos e transformar troca em devolução. Evidências: métodos e units `dmcancelamentocontratos*`, `dmexclusaocontratosorcados`, `dmoperacoescontratos`, `fmdadosfiscaiscontratos` e handlers do form.

**DÚVIDA** — Este ticket não fixa a máquina de estados. Ordem numérica das constantes e comparações como `< scFATURADO` são evidência de implementação, mas não bastam para definir transições válidas. Isso será resolvido por “Definir ciclo de vida e matriz de transições”.

### 5. Parâmetros, permissões e autorizações

**CONFIRMADO** — O comportamento varia intensamente por `ParSistema` e `UsuarioLogin`. Foram localizados parâmetros para serviços no Contrato, filiais independentes, preço da filial base, preços por cargo/Cliente, máscara e estoque, produto composto, venda futura, Nota Fiscal vinculada, CFPS, cônjuge obrigatório, gravação automática de Produto, anexar receita de óculos, descontos, cashback, lista de casamento, impressão e outros.

**CONFIRMADO** — Operações sensíveis solicitam autorização por login ou senha e papéis distintos: Analista de Crédito, Gerente de Venda/Estoque, desconto extra, liberação de crédito, devolução de numerário e entrega em loja. Evidências: chamadas `ObterAutorizacao` e verificações de `UsuarioLogin` em `dmcadastrocontratos.pas`, incluindo regiões próximas a 5272, 16777, 18036, 18356, 18434, 19849 e 20724.

**DÚVIDA** — A lista é apenas inventário inicial; a matriz completa e a precedência entre parâmetro, permissão e autorização serão resolvidas em “Mapear autorizações, permissões e parâmetros”.

### 6. Relatórios, documentos e integrações Delphi

**CONFIRMADO** — O data module depende diretamente de impressão de Contrato, impressão matricial, carnê, boleto, saldo do Cliente, geração de Nota Fiscal/NFS-e, contabilidade e e-mail. Evidência: `uses` de `dmcadastrocontratos.pas` e units `dmimprimecontratos`, `dmimprimecontratomatricial`, `dmgerarnotafiscal`, `dmlancamentocontabilidade` e `fmEnviarEmail`.

**CONFIRMADO** — Integrações adicionais incluem Atendimento, Questionário/Enquete, arquivos anexados, conferência, frete/transportadoras, lista de casamento, agendamento/entrega, licitações, bônus/cashback, pedido do site, receita de óculos e Qualidade de Venda. Evidências: `uses`, botões do DFM, datasets e units auxiliares.

**INFERIDO** — Impressão, fiscal, contabilidade, e-mail e várias dessas integrações são candidatas fortes a operações externas ao núcleo do Cadastro, pois já aparecem como units/módulos próprios no legado e/ou serviços próprios no Laravel. A decisão arquitetural ainda não foi tomada.

### 7. Capacidades Laravel já existentes

**CONFIRMADO** — Consulta de Contratos já oferece filtros, resultados, detalhe e abas de Produtos, Serviços, comissões, observações, entrega, atendimentos, parcelas, impressão/exportação e gravação limitada. Evidências: `ConsultaContratosController`, `ConsultaContratosDetalheService`, `LegacyConsultaContratosRepository`, componentes `ConsultaContratos*` e testes Feature/Unit correspondentes.

**CONFIRMADO** — Existe escrita limitada e protegida para filial/vendedor e entrega, com request, serviço, gate de operação sensível, repositórios e testes. Evidências: rota `gravar-alteracao`, `ConsultaContratosGravarAlteracaoService`, `LegacyContratoFilialVendedorWriteRepository`, rota `registrar-entrega-loja` e classes correlatas.

**CONFIRMADO** — Ficha Financeira já fornece visão de Cliente e Contrato, parcelas, recebimentos, Produtos, Serviços, notas, cupons, documentos fiscais, entrega, montagem, saldo de crédito, cashback e impressão. Evidências: rotas `vendas.ficha_financeira.*`, `FichaFinanceiraController`, services/repositories, componentes React e testes.

**CONFIRMADO** — Impressão de Contrato em HTML/PDF já existe separadamente, inclusive opções de meia página e fotos. Evidências: `ContratoClienteImpressaoController`, `ContratoImpressaoService`, views `impressoes-contrato` e testes.

**CONFIRMADO** — Geração desde Orçamento já possui request, serviço, repositório e teste Feature, devendo ser reconciliada com o novo núcleo em vez de duplicada. Evidências: rota `vendas.orcamentos.gerar_contrato`, `GerarContratoOrcamentoService`, `LegacyGerarContratoOrcamentoRepository` e `OrcamentoGerarContratoTest`.

**NÃO LOCALIZADO** — Não foi localizado um fluxo Laravel completo de inclusão/abertura/edição/gravação do Cadastro de Contratos nem uma API agregada equivalente ao form Delphi.

### 8. Fronteiras preliminares, sem decisão de desenho

**CONFIRMADO** — Há quatro superfícies já distintas no Laravel que o futuro Cadastro deverá integrar, não reimplementar cegamente: Consulta de Contratos, Ficha Financeira, Impressão e geração por Orçamento.

**INFERIDO** — O núcleo provável envolve identidade, situação, Cliente/fotografia, origem, dados comerciais e coordenação de gravação; Produtos/Serviços, pagamento, estoque, fiscal e saídas documentais têm comportamento suficiente para merecer interfaces próprias. Isso é hipótese para os próximos tickets, não requisito aprovado.

**DIVERGENTE** — O Delphi concentra leitura, interface, regras, SQL, transações e integrações no form/data module; o Laravel atual já separa controller, request, service, authorization gate, repository, support e componentes. A migração deve comparar comportamento, mas não preservar essa concentração estrutural.

### 9. Próxima ordem de investigação

1. “Definir ciclo de vida e matriz de transições” — desbloqueia o significado de mutabilidade e operações.
2. Em seguida, em paralelo lógico: “Delimitar núcleo, abertura, localização e gravação”, “Definir vínculo e fotografia do Cliente” e “Mapear autorizações, permissões e parâmetros”.
3. Reconciliar o Contrato originado de Orçamento somente depois de núcleo e Cliente.
4. Delimitar Produtos/Serviços e pagamentos; depois estoque; somente então faturamento/documentos fiscais.
5. Projetar o shell após núcleo e segurança; fatiar operações transversais após conhecer seus pontos de integração.

### 10. Aptidão para `$to-spec`

**CONFIRMADO** — O inventário isolado não deve receber `$to-spec`: ele é evidência de orientação, não uma fatia implementável.

**DECISÃO NOVA** — A primeira candidata a spec será “núcleo e ciclo de vida”, mas somente após os tickets de estados, núcleo, Cliente, autorizações e origem por Orçamento convergirem. Produtos/Serviços, pagamentos, estoque, fiscal e operações transversais deverão ser avaliados como specs próprios.
