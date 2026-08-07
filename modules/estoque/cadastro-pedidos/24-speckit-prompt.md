# Prompt para /speckit.specify — Gestos operacionais e acessibilidade

```text
/speckit.specify

Crie uma especificação corretiva P2 para completar teclado, duplo clique, foco e acessibilidade dos grids de Itens e Previsões do Cadastro de Pedidos. Pressuponha specs 16–23 integradas. Gere a spec; não implemente.

FONTES

- prompts 06, 07, 13, 16, 19 e 23;
- auditorias e imagens desta pasta/mapas;
- infraestrutura compartilhada de atalhos/cadastro, componentes atuais dos grids e testes frontend existentes.

Reutilize registry/hooks/componentes compartilhados; não registre listeners globais ad hoc.

GESTOS

Itens:
- duplo clique em área vazia/inclusão elegível abre novo item;
- duplo clique em item abre edição quando permitido;
- atalhos de incluir/editar equivalentes às ações visíveis;
- Alt+↑/Alt+↓ move item usando o comando/revisão da spec 16;
- após mover/salvar/excluir, foco retorna a linha coerente.

Previsões:
- duplo clique edita linha elegível;
- atalhos de incluir/editar equivalem aos botões;
- estados bloqueados por situação/financeiro são realmente disabled e explicam o motivo.

Defina combinações finais evitando conflitos com atalhos globais do ERP e navegador. Preserve atalhos já estabelecidos quando comprovados; documente mudanças necessárias.

ACESSIBILIDADE

- botões possuem nome, tooltip/hint e estado;
- grids/tabelas têm cabeçalhos e seleção semânticos;
- operação completa por teclado, foco visível e ordem previsível;
- confirmação/erro/conflito anunciados sem roubar foco;
- ícone/cor nunca é único indicador;
- atalhos são descobríveis na UI e documentação;
- loading impede duplo envio.

CONCORRÊNCIA

Todas as mutações usam idempotência/revisão da spec 16. Duplo clique/tecla repetida não cria item/previsão duplicada. Conflito mantém contexto e orienta recarregar.

TESTES REACT OBRIGATÓRIOS

- cada gesto em estados permitido/bloqueado;
- foco após incluir/editar/excluir/mover/conflito;
- duplo disparo e loading;
- atalhos sem conflito;
- nomes/roles/aria-live/disabled;
- mouse e teclado produzem o mesmo comando;
- integração com modo inline do 23.

Backend: apenas regressão dos comandos/revisão existentes; não criar endpoints específicos por gesto.

SAÍDA

Spec com mapa de atalhos, máquina de foco, matriz situação×ação, contratos compartilhados, testes e documentação operacional.

FORA DE ESCOPO

Nova regra de negócio; atalhos de módulos autônomos; listener global paralelo; paridade pixel a pixel; alterar Delphi; implementar agora.
```
