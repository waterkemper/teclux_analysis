# Prompt para `/speckit.specify` — fundação, acesso e filtros

```text
/speckit.specify

Crie a especificação funcional e técnica da fundação do módulo Laravel somente leitura **Entregas e Montagens → Entregas → Relatório de Entregas**. Este é o primeiro de quatro prompts coordenados. Entregue rota, folha/capability, middleware, Policy, Filial efetiva, breadcrumb, command bar inicial, contrato tipado de filtros e F9. Não especifique ainda a SQL final, o grid de resultados, a Fotografia de Relatório ou o PDF.

Não implemente durante /speckit.specify. Inspecione o checkout Laravel atual e cite arquivos concretos. Não peça para verificar fontes Delphi diretamente: os quatro arquivos de pesquisa deste diretório são a evidência legada consolidada e autoritativa.

Leia antes:
- /mnt/c/teclux_analysis/modules/entregas/relatorio-entregas/pesquisa-interface-delphi.md
- /mnt/c/teclux_analysis/modules/entregas/modules/entregas/relatorio-entregas/pesquisa-sql-delphi.md
- /mnt/c/teclux_analysis/modules/entregas/modules/entregas/relatorio-entregas/pesquisa-parametros-autorizacoes-menu.md
- /mnt/c/teclux_analysis/modules/entregas/modules/entregas/relatorio-entregas/pesquisa-padroes-laravel-schema.md
- CONTEXT.md e CONTEXT-MAP.md

## Acesso e navegação

- Criar/reutilizar uma folha própria sob Entregas e Montagens → Entregas → Relatório de Entregas, sem copiar grants Delphi nem conceder acesso em massa.
- Usar a convenção atual do Laravel para rota, capability, service/middleware e Policy; ausência ou ambiguidade de acesso é fail-closed.
- Administrador segue somente o bypass global existente; usuário comum exige grant explícito.
- Derivar a Filial efetiva da sessão/BranchContextService e revalidar com UserBranchAccessService; nunca aceitar Filial, usuário ou capability como verdade do browser.
- Proteger página, F9, consulta F6, cancelamento, fotografia, exportação, preview e PDF.
- Usar AppLayout e o breadcrumb completo: Entregas e Montagens → Entregas → Relatório de Entregas.
- Usar ErpConsultaOperationBar, ícones, tooltip, aria-label, Gerar/F6, busy e Cancelar. Não inventar atalhos mutáveis de cadastro.

## Contrato de filtros

Defina DTO/Form Request imutável e tipos compartilhados para:
- período de vendas opcional, inclusivo, com ordem e datas válidas;
- período de entrega com default hoje até hoje + sete dias;
- situação em radio buttons: EM ABERTO por padrão ou ENTREGUE;
- clientes envolvidos, fornecedores de transporte e regiões como coleções deduplicadas;
- filtros condicionais de clientes somente por campos e operadores allowlisted, nunca SQL livre.

Preserve a semântica consolidada: contratos F/N/P, itens pc.Entrega = S, EM ABERTO quando quantidade - quantidadeentregue > 0, ENTREGUE quando quantidadeentregue > 0 e região derivada do bairro/cidade conforme o contrato posterior de schema. Não invente agrupamento: os checkboxes Delphi estavam ocultos e não entravam na consulta.

## F9 e parâmetros

- F9 em filtros e lookups deve usar o modal padrão do sistema, endpoint próprio, paginação, ordenação allowlisted, foco e reautorização; não crie um dialog ad hoc.
- Não crie manifest de parâmetros específicos sem evidência. A pesquisa consolidada não confirmou parâmetro próprio da tela. Se o checkout Laravel exigir algum, registrar a chave literal e resolver todos em uma chamada getMany por Filial.

## Saída da spec

Entregue contratos, rotas, capabilities, props Inertia/TypeScript, filtros, lookup/F9, estados da command bar, mensagens de validação e matriz de autorização. Liste explicitamente dependências para a spec 02 e classifique divergências. Não inclua implementação nem reabra o Delphi.
```
