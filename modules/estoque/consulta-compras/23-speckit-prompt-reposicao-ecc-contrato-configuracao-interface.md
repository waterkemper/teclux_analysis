# Prompt 23 — Contrato backend para configuração editável das Rotinas ECC

## Contexto

> SUPERSEDED: a decisao de produto mudou. Este prompt assumia tres tipos fixos; executar os prompts 27 a 31 para o modelo de Rotina ECC nomeada e configuravel.

O backend já persiste `parametros_json` e `motor_json`, mas a tela cria rotinas sempre com objetos vazios e não permite editar uma rotina existente. Prepare o contrato necessário para um editor de configuração sem alterar o modelo A da fundação ECC.

## Escopo

### 1. Identidade e contrato da rotina

- Manter `tipo` canônico e imutável após a criação: `geralzao`, `vendido_dia_anterior`, `produtos_novos_recebidos`.
- Acrescentar `nome_exibicao` opcional, com migration Cloud aditiva, limite de tamanho e sanitização. Quando vazio, a UI usa o rótulo fixo do tipo.
- Acrescentar `intervalo_dias` configurável por rotina, inteiro positivo, separado do tipo. `1` significa executar diariamente; `20` significa tentar uma execução a cada 20 dias.
- Não transformar `nome_exibicao` em novo tipo, não remover a unicidade `filial_requisitante + tipo` e não criar perfis ilimitados nesta fatia.
- Para rotinas existentes sem o novo campo, preservar retrocompatibilidade: `geralzao` usa 15 e os tipos diários usam 1 até a configuração ser explicitamente salva. Para rotina nova, não inventar um valor na UI; ela permanece incompleta/inativa até o operador informar a cadência.
- Incluir no contrato de leitura: `nome_exibicao`, timezone, depósito, payloads completos, revisão e estado de configuração.

### 2. Descritor fixo dos tipos

Criar um descritor backend versionado para a UI, sem permitir que o cliente altere as regras. Para cada tipo, expor:

- rótulo padrão;
- descrição da agenda configurável e valor vigente de `intervalo_dias`;
- semântica legada da agenda (`quinzenal_d15` ou `diaria`) apenas como fallback/documentação;
- se exige depósito;
- filtro automático de snapshot (`nenhum`, `ultima_venda_d1`, `entrada_nf_d1_deposito`);
- texto de ajuda operacional.

O cálculo efetivo continua no dispatcher/snapshot já existente. O descritor serve apenas para explicar e orientar a tela.

### 3. Persistência e validação

- `store` e `update` devem aceitar `nome_exibicao`, `timezone`, `deposito_filial`, `parametros_json` e `motor_json`.
- `store` e `update` devem aceitar `intervalo_dias` e validá-lo como inteiro positivo dentro do limite definido pelo contrato.
- Preservar o comportamento de criação inativa sem defaults de cliente.
- Quando payloads forem fornecidos, normalizá-los pelo mesmo contrato da Consulta de Compras, sem inventar seleções.
- Manter a validação de ativação: horário, timezone, depósito para Produtos novos, versão dos parâmetros, período e campos obrigatórios do motor.
- Não sobrescrever configuração existente quando um update parcial omitir um campo.
- Atualizar o retorno de `rotinaListItem()` com alias, depósito, timezone, revisão e um resumo seguro: período configurado, contagem de regras, motor configurado e pendências de ativação.

### 4. Lookups sob autorização ECC

Adicionar às props da página e às URLs do módulo os catálogos/lookups necessários para o editor:

- filiais e grupos de filiais;
- abas de produto compatíveis com `ProductFilterPanel`;
- lookup de entidade de produto e batch de labels;
- fornecedor e grupo de fornecedor;
- conceitos.

Se as rotas da Consulta de Compras exigirem grant diferente, criar endpoints ECC finos que deleguem aos mesmos adapters/repositórios e validem o grant do módulo ECC. Não copiar SQL nem abrir acesso sem autorização.

### 5. URLs da tela

Expor no `ReposicaoEccPageService` as URLs para:

- `rotinas.show`;
- `rotinas.update`;
- `rotinas.ativar` e `rotinas.desativar`;
- lookups do editor;
- configuração completa do descritor de tipos.

## Testes obrigatórios

- migration e serialização do `nome_exibicao` sem quebrar rotinas antigas;
- store/update/reload preservando payloads e revisão OCC;
- update parcial não apaga filtros ou motor;
- rotina nova continua inativa e sem defaults de filial, grupo, depósito ou filtros;
- tipo continua imutável e unicidade filial+tipo preservada;
- intervalo configurável é persistido, lido e usado pelo dispatcher;
- rotina legada sem intervalo mantém 15/1 sem gravar default de cliente;
- página expõe descritores e URLs somente com grant ECC;
- activation continua rejeitando payload incompleto.

## Não fazer

- Não criar cadência livre, cron por rotina ou quarto tipo.
- Não aplicar defaults de uma base específica.
- Não alterar cálculo, snapshot efetivo, alocação, concentração ou confirmação.
