# Definir a UX, a segurança e os testes do Relatório de Situação dos Fornecedores

Type: grilling
Status: resolved
Blocked by: 04

## Question

Como filtros, histórico, visualização, layout Documento/vencimentos, PDF, impressão, acessibilidade, autorização por Filial, retenção, desempenho, falhas e testes devem expor e provar o contrato reutilizando o Relatório de Contas a Pagar?

## Answer

### Página e filtros

- Criar uma página própria **Situação dos Fornecedores** no hub de Contas a Pagar. Não adicionar `SUPPLIER_SITUATION` como modalidade da página Relatório de Contas a Pagar.
- Reutilizar componentes, lookups, polling, estados, histórico e visualização existentes, extraindo/parametrizando somente seams necessários; não copiar páginas ou infraestrutura.
- Filtros principais: período, Parte Fornecedora e Filiais/Grupos. Filtros avançados: Naturezas, previsão, existência de vencimentos, tipos de fornecimento, somente abertos, somente Documentos com nota e tipos da parte. Agrupamento, ordenação, modo de saída e quebra de página ficam em seção própria.
- Toda seleção de Parte Fornecedora usa a identidade composta `vfornecedores.codigo + vfornecedores.tipo`. Código isolado é inválido para filtro, fotografia, agrupamento, lookup ou rota. O tipo `C`, `F` ou `L` é exibido para desambiguar homônimos.
- A página acompanha a geração e mostra apenas histórico com `report_type = SUPPLIER_SITUATION`, sem misturá-lo às modalidades do outro relatório.

### Layout e documento

- Saídas com detalhe usam paisagem; `SUMMARY_ONLY` usa retrato. Orientação e versão de template integram a fotografia.
- Hierarquia visual e semântica: Grupo de Filiais opcional → Filial opcional → Parte Fornecedora → Documento → vencimentos.
- Cabeçalho do Documento: Parte Fornecedora/tipo, Filial, nota/número, entrada/lançamento, emissão quando existir, valor total cadastrado, impostos retidos, soma nominal dos vencimentos e saldo no corte.
- Vencimentos: número da parcela, vencimento, valor nominal, data e valor efetivamente pagos até o corte, valor nominal quitado, juros/descontos e dias de antecipação/atraso.
- Rodapés exibem subtotais por Parte Fornecedora e, quando selecionados, por Filial e Grupo de Filiais, preservando todas as medidas distintas do contrato.
- O cabeçalho do Documento deve permanecer com pelo menos seu primeiro vencimento. Em continuação de página, repetir identificação compacta do Documento e marcar “continuação”. Repetir cabeçalhos de colunas.
- Documento sem vencimentos exibe texto e ícone “Saldo não apurável”, sem depender somente de cor. Resumo separa quantidade e valor desses Documentos do saldo apurável.
- Divergência entre valor cadastrado do Documento e soma dos vencimentos é fotografada e sinalizada para conferência; não bloqueia por si só, salvo quando uma inconsistência impedir a integridade estrutural/cálculo do relatório.

### Geração, PDF, impressão e falhas

- Reutilizar sem alterações os estados `QUEUED`, `RUNNING`, `COMPLETED`, `FAILED`, `CANCELLED`, `EXPIRED`, a retenção de 7 dias, cancelamento cooperativo e retry com novo identificador/vínculo anterior.
- PDF é derivado sob demanda da fotografia e impressão usa o navegador sobre a mesma visualização. Falha do PDF não invalida a fotografia; nenhuma saída reconsulta fatos financeiros.
- Estados e erros reutilizam o envelope atual e acrescentam mensagens acionáveis para período inválido, filtros sem correspondência, saldo não apurável, limite excedido e inconsistências Documento/vencimentos, sem expor SQL ou dados fora do escopo.
- Alterações após `COMPLETED` não mudam HTML, PDF ou impressão. Nova geração/retry pode refletir novos fatos, sempre com outro ID e `data_as_of`.

### Segurança, histórico e Auditoria

- Criar abilities técnicas próprias de visualizar e gerar Situação dos Fornecedores, derivadas da mesma Permissão funcional de consulta de Contas a Pagar.
- Request, status, histórico, cancelamento, retry, view, PDF e impressão revalidam ability e acesso atual a todas as Filiais fotografadas; UUID não concede acesso.
- Reutilizar a Auditoria de Relatório, registrando `report_type`, `situation_date`, Usuário, geração, instante e Filiais em criação, visualização, PDF, impressão, cancelamento e retry.
- Backend de gerações permanece compartilhado, mas histórico, URLs, rótulos, templates e ações são discriminados por tipo de relatório.

### Acessibilidade

- Filtros, acompanhamento, histórico e ações operam por teclado, com foco visível, nomes acessíveis e anúncios de mudanças assíncronas sem roubar foco.
- Situações, divergências e saldo não apurável não dependem somente de cor.
- A hierarquia Parte Fornecedora → Documento → vencimentos usa títulos/tabelas semanticamente compreensíveis por leitores de tela e mantém leitura em ampliação.

### Estratégia de testes

- PostgreSQL real é gate obrigatório para o read model histórico; SQLite/mocks não são prova suficiente das regras financeiras.
- Matriz histórica: Documento aberto no corte, pago até o corte, pago depois, totalmente quitado, sem vencimentos, múltiplos vencimentos, limites inclusivos, fora do intervalo, valor do Documento diferente da soma dos vencimentos e saldos/totais por Parte/Filial/Grupo.
- Provar a identidade composta `vfornecedores.codigo + tipo`, incluindo códigos iguais com tipos diferentes, filtros, grupos e fotografia.
- Testes compartilhados parametrizados por `report_type` cobrem estados, storage, hash, retenção, cancel/retry, autorização em todas as ações, histórico sem mistura, Auditoria, PDF e impressão.
- Testes de contrato provam que fotografia, HTML, PDF e impressão usam o mesmo ID/hierarquia/medidas/totais e permanecem imutáveis após alteração financeira posterior.
- Testes Blade/view model sempre executáveis cobrem estrutura, orientação, cabeçalhos, continuidade, saldos não apuráveis e divergências. Regras críticas não dependem de smoke Browsershot passível de skip.
- Cenário próximo de 100.000 Documentos+vencimentos mede duração/memória, prova carga em lote sem N+1 e falha sem parcial acima do teto.
- Testes frontend cobrem filtros, polling, histórico, cancel/retry, teclado, foco, anúncios, contraste e todos os estados/falhas.

### Fases e gates

1. Introduzir `report_type` e estratégia no pipeline compartilhado, com regressão do Relatório de Contas a Pagar.
2. Implementar read model histórico e prová-lo em PostgreSQL.
3. Materializar fotografia hierárquica, medidas, reconciliação e filtros.
4. Criar página e templates específicos reutilizando os componentes/shell existentes.
5. Fechar autorização, Auditoria, acessibilidade, desempenho, observabilidade e regressão.

Rota e menu ficam protegidos por feature flag até PostgreSQL, imutabilidade, integridade, autorização por Filial e regressão do relatório existente estarem verdes. Não há fallback para consulta síncrona ou pipeline duplicado.
