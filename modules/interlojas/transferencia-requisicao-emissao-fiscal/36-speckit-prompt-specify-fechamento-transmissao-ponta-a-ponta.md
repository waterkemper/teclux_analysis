# Prompt 36 para `/speckit.specify` — correção do F8, transporte e sincronização da grade

## Objetivo

Revisar a implementação atual da tela **Transferência de Requisição para Exposição**, corrigindo a coreografia operacional do F8, a coleta dos dados de transporte e o comportamento da grade após a confirmação e a emissão fiscal.

Este prompt parte do código Laravel atual. Não reimplementar numeração, chave NF-e, impostos, transmissão SEFAZ, certificado, autorização, polling ou DANFE, salvo ajustes diretamente necessários para integrar o fluxo descrito abaixo.

Não incluir IBS, CBS, NFS-e, venda entre filiais, devolução, etiquetas, impressão automática, cancelamento ou inutilização.

O Cursor não deve procurar fontes Delphi. Os fatos Delphi necessários estão transcritos neste prompt.

## Divergências observadas no Laravel atual

1. O F8 inicia imediatamente a sessão fiscal e envia a confirmação, sem uma confirmação operacional explícita.
2. Não existe formulário de dados da transportadora na tela.
3. A fotografia usa `mod_frete = 9` como fallback quando não há transporte informado.
4. A projeção legada força `viatransporte = R` e `frete = 1`, sem refletir dados operacionais escolhidos pelo usuário.
5. Após o F8, o frontend consulta forçadamente `situacao = F`, alterando o filtro original do usuário.
6. A recarga da consulta limpa a linha selecionada e o estado local da grade.
7. A ação “Emitir NF-e da Transferência” aparece para qualquer linha `F`, inclusive após o próprio F8 já ter alocado o documento.

Referências do estado atual:

- `resources/js/Pages/Interlojas/TransferenciaRequisicaoExposicao/Index.tsx`, fluxo `handleConfirmar`, `consultarPedidosAposF8` e `podeEmitirNfe`;
- `hooks/useTransferenciaRequisicaoConsulta.ts`, limpeza da seleção após consulta;
- `TransferenciaFiscalPrepararFotografiaService.php`, fallback de transporte;
- `TransferenciaFiscalProjetarDocumentoLegadoService.php`, valores fixos de transporte.

## Comportamento Delphi de referência

No Delphi, o F8 chama `ConfirmaRequisicao` e executa esta sequência:

1. valida inconsistências e linhas elegíveis;
2. exibe confirmação operacional antes de persistir;
3. na primeira nota, abre o formulário `TfrmDadosTransportador`;
4. grava os dados da transportadora e dos volumes;
5. reutiliza esses dados nos demais grupos da mesma confirmação;
6. gera a NF-e, calcula impostos, movimenta estoque e vincula `dadofiscal` aos pedidos;
7. fecha os pedidos processados;
8. atualiza a consulta da tela;
9. executa o fluxo de transmissão e DANFE;
10. ao final, abre a tela de volumes/etiquetas do Delphi.

O formulário Delphi contém transportadora, pagamento do frete, via de transporte, placa, UF da placa, observação, volumes, peso bruto, peso líquido, numeração, marca e espécie. O formulário impede peso líquido maior que peso bruto quando ambos são informados.

## Requisitos

### 1. Confirmação operacional antes do F8

Antes de enviar a confirmação ao backend, abrir um modal no padrão visual do projeto contendo:

- filial requisitada;
- quantidade de linhas selecionadas;
- quantidade total a confirmar;
- quantidade de grupos/filiais requisitantes;
- aviso de que a confirmação movimentará estoque e fechará os pedidos;
- aviso de que a transmissão da NF-e ocorrerá pelo fluxo fiscal após o commit.

O modal deve possuir “Cancelar” e “Confirmar”.

Cancelar não pode abrir o modal fiscal, chamar a rota de confirmação, reservar número, criar `dadofiscal`, movimentar estoque ou alterar `pedidosfiliais`.

Não usar `window.confirm`; usar componente modal acessível e compatível com o layout existente.

### 2. Formulário de transporte

Após a confirmação operacional e antes do POST efetivo do F8, abrir um formulário/modal de transporte com:

- transportadora/fornecedor de transporte, usando lookup do cadastro existente;
- modalidade/pagamento do frete;
- via de transporte;
- placa;
- UF da placa;
- observação;
- quantidade de volumes;
- peso bruto;
- peso líquido;
- numeração;
- marca;
- espécie dos volumes.

Validar peso líquido maior que peso bruto quando os dois valores forem positivos.

O formulário deve ser aberto uma única vez por operação F8. Os dados devem ser reutilizados por todos os grupos fiscais gerados naquela confirmação, como ocorre no Delphi.

O operador deve poder escolher explicitamente “sem transportador”. Essa escolha deve gerar a modalidade fiscal correspondente na fotografia. Não usar `mod_frete = 9`, `frete = 1` ou `viatransporte = R` como defaults silenciosos para esconder ausência de dados.

O transporte confirmado deve ser incorporado ao contexto controlado da operação e relido/validado pelo backend. Não aceitar campos fiscais arbitrários, impostos, totais, natureza ou destinatário vindos do navegador.

Cancelar o formulário de transporte deve abortar a operação antes de qualquer efeito fiscal ou de estoque.

### 3. Consistência fiscal do transporte

Os dados selecionados devem possuir a mesma representação em:

- fotografia fiscal;
- `dadosfiscais`;
- `volumesdadosfiscais`;
- projeção legada;
- XML NF-e;
- DANFE.

A projeção legada não pode continuar forçando valores fixos quando houver dados capturados no formulário.

Ausência, conflito ou valor inválido deve bloquear a selagem com pendência acionável, identificando o campo e o grupo afetado.

### 4. Coreografia transacional do F8

Depois da confirmação e do formulário de transporte:

1. enviar uma única operação idempotente;
2. reler as linhas com `FOR UPDATE`;
3. validar situação, revisão, quantidade e elegibilidade no servidor;
4. agrupar por filial requisitante conforme o fluxo existente;
5. alocar no máximo um documento fiscal por grupo;
6. criar os movimentos uma única vez;
7. vincular `dadofiscal` aos pedidos confirmados;
8. fechar somente as linhas efetivamente processadas;
9. deixar autorização, transmissão e DANFE no pipeline fiscal já existente.

Repetição do clique, retry HTTP ou atualização da página não pode criar novo número, nova chave, novo documento ou movimento duplicado.

### 5. Comportamento dos botões

- F5 continua sendo somente “Gravar” alterações da linha.
- F6 continua cancelando ou reabrindo conforme a situação permitida.
- F7 continua executando a consulta.
- F8 deve executar a confirmação operacional descrita neste prompt.
- F12 continua imprimindo o relatório da requisição, sem iniciar emissão fiscal.
- A sessão fiscal não deve iniciar antes da confirmação do usuário.
- Enquanto os modais ou a operação estiverem ativos, bloquear ações concorrentes e atalhos.

A ação “Emitir NF-e da Transferência” não deve aparecer para toda linha com situação `F`. Ela deve aparecer somente quando o backend informar explicitamente uma ação de recuperação equivalente a `emitir_nfe_recuperacao`, para um grupo sem emissão associada ou com pendência fiscal recuperável.

Documento já alocado, autorizado, rejeitado ou pendente deve ser acompanhado pelo painel fiscal do grupo, sem uma nova emissão genérica.

### 6. Sincronização da grade após o F8

Depois do retorno do F8 e depois de estados fiscais terminais, consultar novamente dados autoritativos usando os mesmos filtros originais da tela.

Não forçar `situacao = F` no frontend.

Preservar, quando possível:

- filtro de situação;
- período;
- filial requisitante;
- lotes;
- curvas ABC;
- ordenação;
- posição/scroll;
- linha selecionada.

Substituir as linhas pelos dados persistidos, incluindo situação, quantidade confirmada, estoque, revisão, lote e resumo fiscal quando aplicável.

Se o filtro original era `A`, as linhas fechadas podem desaparecer naturalmente da grade; porém o filtro não pode ser alterado silenciosamente. Se o filtro era `F`, as linhas fechadas devem continuar visíveis.

As marcações locais de lote devem ser limpas somente para linhas processadas ou quando a nova consulta não puder garantir sua validade. Não deixar marcações apontando para linhas antigas após uma recarga.

### 7. Modal fiscal e DANFE

Preservar o modal fiscal existente com as etapas:

1. “Verificando status”;
2. “Gerando XML”;
3. “Retorno”;
4. “Gerando DANFE”.

Preservar a abertura automática do DANFE somente quando o backend informar autorização e artefato PDF disponível. Não abrir DANFE para NF-e pendente ou rejeitada e não enviar automaticamente para impressora.

Etiquetas e impressão de volumes ficam fora deste prompt.

## Testes obrigatórios

Criar ou ajustar testes frontend, unitários e de integração para provar:

- confirmação cancelada sem POST nem efeito;
- transporte cancelado sem efeito;
- validação de peso líquido maior que peso bruto;
- lookup de transportadora;
- transporte reutilizado em múltiplos grupos;
- transporte idêntico na fotografia, legado e XML;
- ausência de fallback silencioso de transporte;
- F8 idempotente;
- nenhum movimento duplicado;
- nenhum número ou chave duplicada;
- situação e `dadofiscal` atualizados somente nas linhas processadas;
- preservação dos filtros e da seleção após a recarga;
- ação de recuperação exibida somente quando autorizada pelo backend;
- bloqueio de atalhos e duplo clique durante a operação;
- modal fiscal e abertura do DANFE preservados.

## Entrega

Produzir a especificação de implementação, contratos frontend/backend, sequência de estados, modelo do formulário de transporte, testes e critérios de aceite.

Não implementar código durante `/speckit.specify`.

