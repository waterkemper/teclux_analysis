# Matriz de estado atual da conversão Delphi → Laravel

Recorte factual consultado em 06/08/2026. Esta matriz é material de trabalho para o Mapa de estado da apresentação; não substitui validação de produção ou aceite operacional.

## Leitura executiva

- 10 domínios operacionais possuem telas React, rotas e gates de acesso confirmados no Laravel.
- Laravel e Delphi operam sobre o mesmo PostgreSQL; a conversão pode avançar por módulo sem migração de dados ou corte único.
- Caixa e NF-e/NFC-e têm especificação fechada de comportamento, mas ainda não são apresentados como implementados.
- Help, Busca Assistida, Device Gateway, Confirmações entre filiais e Romaneios são provas de evolução concreta, cada uma com sua ressalva.

## Legenda

| Estado | Uso na apresentação |
|---|---|
| Disponível no Laravel | Pode ser demonstrado como capacidade existente no código/produto. |
| Em conversão/implantação | Existe parte relevante, mas a ativação ou validação operacional ainda precisa ser explicitada. |
| Especificado para evolução | O comportamento foi levantado e decidido; ainda não é recurso pronto. |
| Fora do recorte atual | Não deve ser prometido nesta apresentação. |

## Matriz por domínio

| Domínio | Estado | O que muda para quem opera | Evidência primária | Ressalva |
|---|---|---|---|---|
| Cadastros | Disponível | Cadastros, usuários, grupos, clientes, fornecedores, bancos, filiais e auxiliares acessíveis como aplicação web, com atualização centralizada. | laravel/backend/resources/js/Pages/Cadastros/; inventário exaustivo do mapa anterior. | Mostrar grupos de capacidade, não listar cada tela. |
| Estoque | Disponível | Consulta, compras, produtos, preços, movimentações e relatórios em uma experiência web; Busca Assistida já ajuda a localizar produtos por linguagem natural/voz. | Pages/Estoque/; .scratch/busca-assistida-produtos-wayfinder/; issue anterior de inventário de IA. | Grids densas continuam melhores em desktop/tablet; não vender como mobile-first. |
| Vendas e Orçamentos | Disponível | Frete pode ser cotado na tela, produtos podem ser conferidos por bipagem e o histórico de atendimento aparece no contexto do orçamento. | Pages/Vendas/; .scratch/orcamentos-cotacao-frete-wayfinder/; .scratch/orcamentos-conferencia-produtos-wayfinder/. | Partes fiscais futuras não devem ser confundidas com a operação comercial já disponível. |
| Contas a Pagar | Disponível | Documentos, autorizações, quitação e estorno em lote; relatórios e situação de fornecedores em telas próprias. Lotes podem operar com prévia e atomicidade. | Pages/Cadastros/ContasPagar/; .scratch/quitacao-em-lote-contas-pagar-wayfinder/; .scratch/estorno-pagamento-em-lote-wayfinder/. | Usar “tudo ou nada” apenas nos fluxos cuja evidência foi confirmada. |
| Cobrança e SAC | Disponível | Atendimentos, ligação para clientes, mala direta, agendamentos, observações de venda e tipos de atendimento em um conjunto web. | Pages/Cadastros/CobrancaSac/. | Não prometer cobertura de processos ainda não presentes no inventário. |
| Interlojas | Disponível | Requisições, transferências e confirmações entre filiais com seleção múltipla, validação de chave NF-e, cancelamento real e atomicidade por unidade. | Pages/Interlojas/; .scratch/cadastro-requisicoes-entre-filiais-wayfinder/; .scratch/transferencia-requisicao-exposicao-wayfinder/. | A convivência com Delphi continua sendo uma fronteira operacional; ambos compartilham o modelo legado. |
| Entregas | Disponível | Romaneios reúnem inclusão múltipla, conferência de volumes, assinatura, justificativa e frete automático em Contas a Pagar. | Pages/Entregas/; .scratch/cadastro-romaneios-laravel-wayfinder/; issue anterior de novidades de agosto. | Tratar como domínio novo confirmado no inventário, sem afirmar adoção além da evidência disponível. |
| Financeiro | Disponível | Bancos, balancete, extrato, movimentação bancária e DRE em telas próprias; o cadastro de Bancos é separado do domínio Financeiro. | Pages/Financeiro/; inventário anterior. | Manter a distinção entre cadastro de Bancos e movimentação financeira. |
| Marketplaces | Disponível | Mercado Livre e Magalu com conexões, produtos, preços, pedidos, links, sincronização, auditoria e painel operacional. | Pages/Admin/Marketplaces/; .scratch/marketplace-sync-review-wayfinder/. | Há problemas de SKU duplicado/truncado em diagnóstico; não dizer que é livre de falhas. |
| Administração | Disponível | Parâmetros, logotipo de relatórios, impostos, Device Gateway, console de Operações e administração de IA/Marketplaces. | Pages/Admin/; Pages/Administracao/; .scratch/thermal-printer-device-gateway-wayfinder/. | O Device Gateway funciona como gestão de dispositivos; a impressão térmica física real ainda tem adapter fora do pronto. |
| Help → suporte | Em conversão/implantação | Botão visível, formulário guiado, captura opcional de tela e referência enviada ao suporte tornam o relato mais simples. | laravel/specs/161-erp-help-zendesk/; .scratch/formulario-help-bugs-wayfinder/. | Código pronto, mas validação ponta a ponta de SMTP, worker e recebimento em produção ainda é pendência. |
| Busca Assistida no ERP | Disponível | Busca de produtos por texto, voz e semântica em Estoque e Orçamentos, com administração própria. | .scratch/busca-assistida-produtos-wayfinder/; Pages/Admin/BuscaAssistida/. | Apresentar como recurso concreto nesses contextos, não como IA em todo o ERP. |
| Uso em mobile | Disponível com ressalva | O sistema abre pelo navegador; cadastros e formulários se adaptam a telas menores. | .scratch/apresentacao-cliente-laravel-wayfinder/issues/07-verificar-suporte-mobile.md; código com breakpoints responsivos. | Grids densas são desktop-first e podem exigir rolagem horizontal. |
| Caixa | Especificado para evolução | Abertura, lançamentos automáticos, reclassificação, fechamento e PDF já têm comportamento definido para a futura experiência. | .scratch/caixa-fechamentos-wayfinder/map.md; modules/caixa/fechamentos/. | Ainda não implementado; não apresentar prazo nem como recurso disponível. |
| NF-e/NFC-e | Especificado para evolução | Emissão direta, contingência automática, certificados centralizados e convivência com Delphi já têm desenho operacional fechado. | .scratch/emissao-fiscal-eletronica-laravel-wayfinder/map.md; laravel/specs/ fiscal. | Ainda não implementado; Nexxera/PayGo permanecem direção futura fora do Laravel atual. |

## Diferenciais que merecem destaque

1. Transição sem corte: mesmo banco PostgreSQL, permitindo evolução por módulo.
2. Acesso e atualização: navegador, sem instalação local e com atualização centralizada.
3. Operação mais segura em lote: confirmações, quitações e estornos com prévia, validação e atomicidade quando confirmada pelo fluxo.
4. Mais contexto para a equipe: histórico de atendimento no orçamento, grids configuráveis e fluxos de Entregas reunidos.
5. Evolução já visível: Busca Assistida, Device Gateway, Help, Confirmação entre filiais e Romaneios.

## Limites de linguagem

- “Disponível” significa capacidade confirmada no código/inventário; não significa que todo usuário já foi treinado ou que cada operação está validada em produção.
- “Especificado” significa comportamento decidido; não significa implementação concluída.
- Não usar cronograma, SLA, “100% sem falhas” ou “substituição imediata do Delphi”.
