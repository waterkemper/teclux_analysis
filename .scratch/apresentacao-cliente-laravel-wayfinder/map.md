# Apresentação Prévia do Projeto Laravel para Cliente Final

Label: wayfinder:map

## Destination

Produzir um artefato HTML tipo slide-deck (via Artifact), em pt-BR, pronto para apresentação **ao vivo** a donos/gestores do cliente final (foco operacional, sem jargão técnico pesado), calibrado para uma reunião de ~30-45min. O deck cobre:

1. Mapa de módulos/menus já liberados no Laravel, agrupado por domínio (Cadastros, Financeiro, Estoque, Vendas, Marketplaces, Interlojas...), com um panorama técnico leve por cima (React + Laravel + PostgreSQL compartilhado com Delphi).
2. Vantagens estratégicas (nuvem, sem instalação, multi-dispositivo, atualizações contínuas) + exemplos operacionais concretos por módulo já migrado, vs Delphi.
3. Documentação já existente para usuário final e suporte — o que já cobre, o que falta.
4. Fluxo Help → ticket (spec 161, já implementado) em linguagem de negócio.
5. "Como vai funcionar" Caixa e NFe/NFC-e — levantamentos já concluídos (especificação fechada, não implementada) traduzidos para comportamento operacional, sem jargão técnico nem prazos.
6. Uso mobile — acesso via navegador responsivo (a confirmar no código).
7. Uso de IA — como diferencial de processo (agentes de IA acelerando implementação/correções) *e* eventuais recursos de IA já disponíveis dentro do próprio ERP para o usuário.
8. Resolução ágil e automatizada de tickets/demandas — conecta o fluxo Help (item 4) com o processo de IA (item 7).

## Notes

- Público: donos/gestores do negócio, foco operacional. Apresentação ao vivo, não leitura autônoma — texto pode ser mais enxuto, apoiado em fala.
- Idioma: pt-BR em todo o conteúdo e no artefato final.
- Inventário de módulos/vantagens deve ser **completo**, agrupado por domínio, não curado a um subconjunto.
- Caixa e NFe/NFC-e: mostrar apenas comportamento esperado ("como vai funcionar"), sem termos internos (autenticacoes, ledger, outbox, MOC, etc.) e sem prazo/cronograma — ver [[caixa-fechamentos-wayfinder]] e [[emissao-fiscal-eletronica-laravel-wayfinder]] como fonte.
- Fontes primárias a inspecionar (estado real, não presumido):
  - `laravel/docs/usuario/` e `laravel/docs/suporte/` — documentação de usuário/suporte já existente.
  - `laravel/specs/161-erp-help-zendesk/` — spec já implementada do formulário Help; ver também `.scratch/formulario-help-bugs-wayfinder/map.md`.
  - `.scratch/caixa-fechamentos-wayfinder/map.md` — especificação completa e fechada de Caixa/Fechamento (prompts publicados em `modules/caixa/fechamentos/`, ainda não implementados).
  - `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/map.md` — especificação completa e fechada de NF-e/NFC-e (consolidada em `.scratch/emissao-fiscal-eletronica-laravel-wayfinder/issues/11-consolidar-especificacao-fiscal.md`, ainda não implementada).
  - `laravel/backend/resources/js/Pages/`, rotas e menus para o inventário de módulos liberados.
  - `delphi/` para os pontos de comparação operacional concretos.
- Não fazer overclaim: só entra como "já disponível" o que for confirmado no código; recursos de IA ou mobile não encontrados entram como diferencial de processo/roadmap, nunca apresentados como recurso pronto sem confirmação.
- Usar `/grilling` e `/domain-modeling` nas tickets de decisão (framing de IA, roteiro final); usar `/prototype` se for útil rascunhar a estrutura visual do deck antes de fechar o roteiro.
- Ao montar o artefato final (ticket de publicação), consultar as skills `artifact-design` e `dataviz` (o deck deve funcionar em light/dark, ser responsivo, evitar overflow horizontal).
- Exceção ao padrão "plan, don't do": o ticket final deste mapa produz e publica o artefato HTML de fato, não apenas uma decisão de conteúdo.

## Decisions so far

- [Inventariar módulos e menus já liberados no Laravel, agrupados por domínio](issues/01-inventariar-modulos-menus-liberados.md) — nove domínios com telas React reais (Cadastros, Estoque, Contas a Pagar, Cobrança e SAC, Vendas, Interlojas, Financeiro, Marketplaces, Administração); mesmo banco PostgreSQL do Delphi, sem migração de dados. Corrigido em 2026-07-30 para inventário exaustivo (o cliente apontou omissões, ex. Bancos).
- [Inventariar documentação existente para usuário final e suporte](issues/03-inventariar-documentacao-existente.md) — 85 guias de usuário ativos em 9 domínios (só falta Fiscal) e 45 runbooks de suporte; índices do repo estão desatualizados e subestimam o que existe.
- [Resumir o fluxo Help → ticket em linguagem de negócio](issues/04-resumir-fluxo-help-ticket.md) — botão sempre visível, formulário guiado com print automático opcional, e-mail direto ao suporte com código de referência; validação operacional em produção ainda pendente.
- [Resumir "como vai funcionar" o Caixa](issues/05-resumir-como-vai-funcionar-caixa.md) — abertura por senha do gerente, lançamentos automáticos ao longo do dia, reclassificação em lote pelo gerente, fechamento com totalização automática e PDF substituindo a impressão fiscal antiga.
- [Resumir "como vai funcionar" NFe/NFC-e](issues/06-resumir-como-vai-funcionar-nfe.md) — emissão direta sem programa externo (fim do UniNFe e do UniDANFE), contingência automática no cupom, certificados geridos centralmente, convivência segura com o Delphi. Adendo 2026-07-30: Nexxera/PayGo são a mesma lógica (hoje via arquivo/app local no Delphi) mas ainda fora do Laravel — roadmap, não pronto.
- [Verificar suporte a uso mobile/responsivo no código](issues/07-verificar-suporte-mobile.md) — acesso via navegador de qualquer aparelho, formulários bem responsivos; grids densas ainda são desktop-first (acessíveis por scroll horizontal no celular).
- [Inventariar recursos de IA já existentes dentro do ERP](issues/08-inventariar-recursos-ia-no-erp.md) — Busca Assistida por embeddings/voz já ativa em Estoque e Orçamentos, com evidência extraída do cadastro real; não é overclaim apresentar como recurso pronto.
- [Levantar vantagens estratégicas e diferenças operacionais concretas vs Delphi](issues/02-vantagens-diferencas-operacionais-vs-delphi.md) — acesso sem instalação/atualização automática/mesmo banco do Delphi como vantagens de fundo; exemplos concretos por domínio (frete automático, conferência por bipagem, grids com preferências salvas, lotes tudo-ou-nada, PDF substituindo impressora fiscal, Marketplaces já em produção).
- [Decidir como apresentar o uso de IA e a resolução ágil de tickets/demandas](issues/09-decidir-framing-ia-e-resolucao-agil.md) — IA no processo citada de forma genérica sem nomear ferramenta; resolução de demandas fala do processo sem prometer prazo/SLA; Busca Assistida citada como prova concreta já em uso — os três blocos juntos numa seção coesa de IA.
- [Decidir estrutura e roteiro final do deck](issues/10-decidir-roteiro-final-do-deck.md) — 10 seções: abertura, estrutura/módulos, vantagens/diferenças, mobile, documentação/suporte, Help, IA, roadmap Caixa, roadmap NFe, fechamento; deck genérico sem nome de cliente, abre com o que já existe e fecha olhando para frente.
- [Produzir e publicar o artefato HTML final do deck](issues/11-produzir-publicar-artefato-html.md) — publicado em [tecLUX Cloud — Apresentação Prévia](https://claude.ai/code/artifact/caa66719-83a7-4ca8-92b1-1bb543dac726): 11 seções em scroll-snap navegáveis, tema claro/escuro. Refinado em 2026-07-30 com as cores reais do sistema, estrutura exaustiva, Device Gateway, templates de e-mail e integrações via API (Nexxera/PayGo como direção futura).

## Not yet specified

_(vazio — mapa concluído. As 11 tickets foram resolvidas e o artefato final está publicado.)_

## Out of scope

- Cronograma ou prazos de entrega dos itens ainda não implementados (Caixa, NFe/NFC-e) — o deck mostra apenas comportamento esperado.
- Termos comerciais, precificação e contrato — fora do escopo desta apresentação técnica/operacional.
- Treinamento operacional aprofundado / hands-on — isso é uma apresentação prévia, não um treinamento.
