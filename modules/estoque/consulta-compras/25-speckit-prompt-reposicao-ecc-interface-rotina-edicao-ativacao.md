# Prompt 25 — Interface de criação, edição e ativação das Rotinas ECC

## Objetivo

Substituir o formulário mínimo atual por uma experiência única de criar e editar rotinas, usando o editor do prompt 24 e os contratos do prompt 23.

## Fluxo da tela

> SUPERSEDED: a decisao de produto mudou. Este prompt assumia tres tipos fixos; usar o prompt 30 para a interface de Rotina ECC nomeada, com quantidade e regras livres por filial.

### Criar

1. Operador informa filial requisitante e escolhe um dos três tipos.
2. A tela apresenta o descritor do tipo, intervalo de execução, horário, timezone e depósito quando aplicável.
3. O operador configura filtros e motor.
4. Salvar envia os payloads completos e cria a rotina inativa.
5. A tela mostra resumo da configuração e pendências para ativação.

### Editar

- Cada linha da tabela deve ter ação **Configurar**/ **Editar**.
- Abrir a rotina pelo endpoint `show`, hidratar `parametros_json` e `motor_json` e manter a revisão recebida.
- Salvar usa `PUT update` com OCC; em conflito, recarregar a rotina e informar que outra pessoa alterou a configuração.
- Permitir desativar, editar e reativar sem perder histórico de snapshots e execuções.
- Não permitir alterar filial ou tipo depois de criada; para outra filial, usar clone e manter o clone inativo.
- Permitir alterar `intervalo_dias` sem alterar o tipo nem snapshots já criados; a nova cadência vale somente para futuras janelas.

### Ativar

- Mostrar botão **Ativar** somente quando o backend autorizar, mas a tela deve antecipar pendências conhecidas: horário, timezone, depósito, período, versão, motor e campos obrigatórios.
- A ativação continua sendo decisão operacional explícita; salvar configuração não ativa a rotina.
- Nunca preencher horário, timezone, depósito, filiais ou filtros automaticamente.

## Apresentação

Separar o editor em blocos ou abas:

1. Identidade e agenda: intervalo de dias, horário e timezone.
2. Filtros da Consulta de Compras.
3. Motor de sugestão.
4. Regras automáticas do tipo.
5. Resumo e ativação.

Exibir na tabela de rotinas:

- alias, quando existir, e tipo canônico;
- filial;
- intervalo configurado e descrição do overlay do tipo;
- horário e timezone;
- depósito;
- resumo de filtros/motor;
- ativa/inativa e revisão;
- ações permitidas.

Para o operador, usar textos claros: a rotina calcula propostas; a confirmação continua ocorrendo na revisão de lotes e gera `pedidosfiliais` somente no fluxo já existente.

## Regras de UX

- Não fechar o editor silenciosamente após erro.
- Preservar alterações locais ao receber erro de validação.
- Exibir diferenças entre configuração salva e alterações ainda não salvas.
- Desabilitar edição enquanto salva e impedir duplo envio.
- Mostrar que filtros de data diária são automáticos e não editáveis no tipo correspondente.
- Se um tipo diário tiver `intervalo_dias > 1`, avisar que a regra continua sendo D-1 em cada execução e que os dias intermediários não serão processados por esse tipo.
- Garantir responsividade sem esconder o resumo de configuração.

## Testes obrigatórios

- renderização inicial sem payloads não cria defaults de cliente;
- criação salva o estado escolhido;
- edição hidrata e salva o mesmo payload sem perda;
- configuração de cada tipo exibe o overlay correto;
- tipo/filial ficam imutáveis na edição;
- intervalo pode ser alterado e passa a valer somente nas próximas execuções;
- OCC e erro de ativação são exibidos corretamente;
- ativar/desativar atualiza a tabela;
- teste Vitest da tela e dos componentes compartilhados.
