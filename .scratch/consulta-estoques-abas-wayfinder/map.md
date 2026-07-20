# Paridade das abas da Consulta de Estoques

Label: wayfinder:map

## Destination

Produzir um dossiê de gaps e um prompt SpecKit corretivo, autocontidos e verificáveis, para alinhar as abas **Estoques, Acumuladores, Financeiro, Preços por Cargo e Pedidos** da Consulta de Estoques Laravel às informações e regras efetivamente disponíveis no Delphi, sem regredir permissões, Filiais ou componentes já implementados.

## Notes

- O Laravel atual já implementa Consulta de Estoques e deve ser tratado como estado real de partida; confrontar controller, services, repositories, DTOs/types, React, capabilities, parâmetros e testes, não apenas a especificação anterior.
- O legado principal está em `fmconsultaestoque`/`dmconsultaestoque`; seguir datasets, SQL, fields, eventos e parâmetros auxiliares usados por cada aba.
- Para cada campo, registrar origem SQL/tabela, joins, escopo Produto + Filial, fórmula, formatação, condição de visibilidade, Permissão/capability, Parâmetro e comportamento vazio.
- Distinguir ausência real no Laravel, dado presente mas não exibido, fórmula incorreta, filtro/Filial incorreto e divergência de nomenclatura/layout.
- Reutilizar componentes e contratos Laravel existentes sempre que preservarem a semântica; não propor um segundo módulo ou endpoints duplicados sem necessidade.
- Preservar AuthZ server-side e omissão de dados gerenciais. Ocultar aba/campo no React não é autorização.
- A revisão é somente de levantamento e especificação; não implementar correções durante o Wayfinder.
- O prompt final não deve mandar o SpecKit investigar Delphi. Ele pode inspecionar somente o Laravel atualizado.

## Decisions so far

- [Consolidar dossiê e prompt corretivo](issues/09-consolidar-dossie-e-prompt-corretivo.md) — publicou o [dossiê autocontido](dossie.md) e o [prompt SpecKit corretivo](../../modules/estoque/consulta-estoques/10-speckit-prompt-correcao-abas.md), preservando o prompt original e eliminando qualquer dependência de investigação no Delphi.

- [Definir correções transversais das abas](issues/08-definir-correcoes-transversais-das-abas.md) — preserva a rota/dispatch lazy e aprofunda contratos por Produto+Filial com AuthZ antes da query, DTOs tipados, parâmetros server-side, componentes/formatadores comuns, erros observáveis e matriz de testes contra vazamentos e respostas obsoletas.

- [Decidir a paridade da aba Pedidos](issues/07-decidir-paridade-aba-pedidos.md) — separa pedidos comerciais de NFe SEFAZ não lançadas, calcula saldo pela função legado, limita a visão multi-Filial às autorizadas, corrige identidades/navegação e torna a consolidação do resumo explícita e parametrizada.

- [Decidir a paridade de Preços por Cargo](issues/06-decidir-paridade-precos-por-cargo.md) — substitui o modo convencional quando parametrizado, calcula por `estoques_preco` e markup na Filial selecionada, aplica autorização de preços no servidor e formaliza DTO, vazio e testes sem misturar promoção.

- [Decidir a paridade da aba Financeiro](issues/05-decidir-paridade-aba-financeiro.md) — completa fornecedor, nota e CST/CSOSN por Produto+Filial, preserva custo e mutação segura, formaliza ICMS/IPI/margem, isola todo o payload por acesso gerencial e rejeita vazamentos globais do legado.

- [Decidir a paridade da aba Acumuladores](issues/04-decidir-paridade-aba-acumuladores.md) — mantém tabela mensal combinada, mas agrega no PostgreSQL por Produto+Filial usando o snapshot `movimentos.operacao`, preserva sinais legados, explicita Filial e restringe dados a acesso gerencial.

- [Decidir a paridade da aba Estoques](issues/03-decidir-paridade-aba-estoques.md) — preserva fórmulas atuais, fixa saldos/preços por Produto+Filial, torna Pedidos filial e pendente, protege preços no servidor, mantém localização/limites no grid mestre e separa dados financeiros pelo acesso gerencial.

- [Inventariar as abas no Delphi](issues/02-inventariar-abas-no-delphi.md) — confirmou SQL e escopos: Acumuladores usa o snapshot de `movimentos.operacao` por Produto+Filial; Cargo usa `FilialBase` e `estoques_preco`; Pedidos é global ao Produto, mostra Filial e calcula saldo pendente; Estoques/Financeiro possuem dados ainda omitidos no Laravel.

<!-- Uma linha por ticket resolvido. -->

- [Inventariar as abas no Laravel atual](issues/01-inventariar-abas-no-laravel-atual.md) — confirmou a base lazy/AuthZ reutilizável e expôs gaps atuais: Estoques não renderiza todo o payload, Financeiro fiscal incompleto, Acumuladores simplificados, Cargo vazio e Pedidos sem Filial/saldo pendente.

## Not yet specified


## Out of scope

- Implementar as correções no Laravel durante este mapa.
- Revisar filtros, resultado mestre, lupa enriquecida, Lotes, Similares, Grade, Modelos, Componentes, Atributos, Fornecedores, Licitações ou Fotos, exceto dependência direta das cinco abas.
- Alterar o Delphi ou a base de dados.
- Reprojetar visualmente toda a Consulta de Estoques.
- Afrouxar escopo de Filial, Permissões gerenciais ou Auditoria para copiar ocultação visual do legado.
