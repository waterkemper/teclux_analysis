# Inventariar módulos e menus já liberados no Laravel, agrupados por domínio

Type: task
Status: resolved
Blocked by:

## Question

Quais módulos, telas e funções já estão efetivamente liberados no Laravel hoje — inspecionando rotas, menus, páginas React e autorização — agrupados nos grandes domínios de negócio (Cadastros, Financeiro, Estoque, Vendas, Marketplaces, Interlojas, Contas a Pagar, Orçamentos, etc.)? Produzir um inventário completo, em linguagem de negócio (nome da função, o que ela faz, em que domínio vive), mais um panorama técnico leve (React + Laravel + PostgreSQL compartilhado com o Delphi) para citar de passagem na apresentação.

## Answer

> **Correção de estado (2026-07-30, refinamento pós-publicação):** o inventário abaixo era curado por espaço (exemplos por domínio); o cliente apontou omissões reais (ex.: Bancos em Cadastros). Substituído por um levantamento exaustivo via `MenuService`/`*ModuleAccessService.php` (44 gates de acesso confirmados) e `resources/js/Pages/`, sem cortar itens.

**Cadastros** — Usuários, Grupos de Usuários, Clientes (+ Unificação de Clientes), Fornecedores, **Bancos**, Filiais, Grupos de Filiais, Atividades Econômicas, Equipamentos, Serviços, Serviços LCP116, Listas Padrão, Endereços (Estados, Cidades, Bairros, Regiões, Ruas), Conferências, Dime/Sped → Signatários.

**Estoque** — Produtos (Ficha completa), Consulta de Estoques, Consulta de Compras, Pedidos de Compra, Manutenção de Preços, Lançamentos Avulsos, Análise de Estoques, relatórios de Curva ABC e Movimentação Diária. Tabelas auxiliares: Grupos, Classes, Marcas, Modelos, Grades, Atributos de Produto, Unidades, Colunas de Preço, Promoções, Cashback, ICMS, IPI, Códigos Fiscais, Códigos Fiscais de Serviços, Grupos de Fornecedores, Observações Legais (Notas e Livros), Tipos de Movimentos, Vigilância Sanitária, Tabela de Fretes, Tabela de Montagens.

**Contas a Pagar** — Documentos a Pagar, Autorização de Pagamentos, Quitação em Lote, Estorno de Pagamento em Lote, Tipos de Pagamento, Relatório.

**Cobrança e SAC** — Atendimentos, Ligar para Clientes, Mala Direta de Clientes, Manutenção de Agendamentos, Manutenção de Observações de Venda, Tipos de Atendimento.

**Vendas** — Orçamentos, Consulta de Orçamentos, Contratos, Consulta de Contratos, Cancelamento de Contratos, Ficha Financeira, Simulação de Financiamento, Vendas Perdidas. Tabelas auxiliares: Agentes, Cargos, Conceitos, Eventos, Históricos, Motivos, Naturezas, Planos de Pagamento, Qualidade de Venda, Questionários, Redes Adquirentes, Setores de Venda, Tipos de Planos, Tipos de Recebimento.

**Interlojas** — Consulta de Requisições, Requisição para Exposição.

**Financeiro** — Bancos (Balancete Financeiro, Extrato de Conta, Movimentação Bancária — distinto do cadastro de Bancos em Cadastros), DRE Demonstrativo, DRE Gerencial.

**Marketplaces** — Dashboard, Classificações, Ocorrências (Issues), Links, Mercado Livre (Conexões, Rascunhos, Auditoria, Links), Pedidos, Manutenção de Preços, Produtos, Sincronização.

**Administração** — Parâmetros do Sistema (+ Logotipo de Relatórios), Impostos Retidos, Naturezas Padrão, Vencimentos de Impostos Retidos em Entradas, Device Gateway (Pareamento, Rotas, Estações — agente local de periféricos, já em produção), console de Operações, painel admin de Busca Assistida, visão admin de Marketplaces.

Placeholders confirmados (item no menu, tela ainda não real): fallbacks genéricos `EmBreve`/`ModuloEmBreve` usados por alguns controllers — não módulos individualmente nomeados.

**Panorama técnico leve (para citar de passagem):** o ERP roda como aplicação web — frontend em React (via Inertia.js) servido pelo backend em Laravel/PHP, com todos os dados no mesmo banco PostgreSQL que o sistema Delphi já usa hoje. Não é uma migração de dados: os dois sistemas operam sobre a mesma base, o que permite transição módulo a módulo sem perder histórico.

Fora do inventário: `Prototype/EmissaoFiscalOperacao.tsx` é um protótipo visual, não a funcionalidade real — emissão fiscal ainda não implementada (ver ticket 06).
