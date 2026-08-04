# Definir critérios de aceite e testes

Type: task
Status: resolved
Blocked by: 09

## Question

Quais critérios de aceite e testes funcionais, SQL, autorização, filtros, concorrência, cancelamento, impressão, interface e regressão do Cadastro/núcleo comprovam a migração segura da Consulta?

## Answer

### Estratégia de comprovação

Cada um dos quatro cortes da futura especificação deve entregar critérios observáveis e testes no nível mais baixo que ainda prova o contrato:

- **Feature Laravel** para rotas, autorização, validação, paginação, adapters e respostas;
- **integração PostgreSQL** para SQL legado, filial física, locks, revisão, movimentos, rollback e trigger de auditoria;
- **Unit/Service Laravel** para normalização de filtros, parâmetros, view models e HTML do relatório;
- **Vitest + Testing Library** para estados da página, grid, abas, atalhos, diálogos e alertas;
- **suítes existentes** do Cadastro e de `RequisicaoFiliais` como barreira obrigatória de regressão.

Mocks não substituem os testes PostgreSQL quando o comportamento depende de `FOR UPDATE`, casts de data, advisory locks, triggers ou funções legadas.

### Fundação, autorização e parâmetros

#### Critérios de aceite

1. A folha **Interlojas → Consulta de Requisições** possui capability própria; acesso ao Cadastro ou à Consulta de Compras não a concede.
2. Visitante é redirecionado para autenticação; usuário sem grant recebe `403`; usuário autorizado entra; administrador mantém bypass.
3. A filial ativa é a única requisitante da página e não é editável. Sua ausência/invalidez impede consultar, alterar, cancelar e imprimir com resposta explícita.
4. Toda leitura e mutação valida `usuariosfiliais`; código de requisitante adulterado no payload não amplia o escopo.
5. A requisitada persistida deve existir e ser diferente da requisitante, mas não precisa pertencer às filiais autorizadas do usuário.
6. Os parâmetros usam as descrições literais decididas e são resolvidos pela filial ativa. `''`, `NULL`, ausência e booleano inválido equivalem a falso.
7. O snapshot de parâmetros da UI não é autoridade: adapters de comando resolvem novamente os parâmetros no servidor.

#### Testes mínimos

- Feature de acesso: visitante, sem grant, grant próprio, administrador e independência dos outros dois módulos.
- Feature de menu: folha visível apenas para quem possui a capability correspondente.
- Feature de filial: ativa autorizada, ativa não autorizada, ativa ausente, payload adulterado e administrador.
- Teste parametrizado do manifesto cobrindo verdadeiro válido e todas as formas de falso.
- Teste de Request garantindo apenas `A/F/D/C`, datas válidas e intervalo inicial ≤ final.

### Leitura, SQL e grid

#### Critérios de aceite

1. A página abre com datas do servidor, situação Aberto e nenhum resultado; somente Gerar/Enter na Data Final executa a consulta.
2. O período é inclusivo nas duas pontas, usa parâmetros bindados e combina exatamente uma situação entre `A/F/D/C`.
3. A leitura limita `pf.requisitante` à filial ativa autorizada e ordena deterministicamente por `requisitada, produto, codigo`, inclusive entre páginas.
4. A paginação não duplica nem omite linhas ao avançar/voltar com dados estáveis; página/tamanho inválidos são normalizados ou rejeitados pelo contrato.
5. A projeção traz identidade, revisão e todos os campos visuais/auxiliares definidos, sem N+1 para filial, produto, nota e estoques.
6. Estoques usam a filial física correta para filiais comuns e do tipo `V`; Reserva Prévia só é exposta/visível quando `REQUISICAOSUBTRAIESTOQUE` for verdadeiro.
7. Os rótulos são `Aberto/Fechado/Confirmado/Cancelado`; cores e mutabilidade seguem esses estados.
8. Linha e Coluna obedecem `USAR GRADES PRODUTOS`; `qtderecebida` e os demais campos são somente leitura; apenas `qtdepedida` de uma linha aberta pode entrar em edição.
9. A página apresenta e preserva corretamente os estados Inicial, Carregando, Vazio, Resultado e Erro recuperável.
10. A aba Confirmados só aparece para a linha Fechada, consulta pelo `dadofiscal`, possui ordem determinística e não elimina produto sem característica.
11. Trocar a seleção cancela/ignora resposta atrasada do detalhe anterior, evitando mostrar Confirmados da linha errada.

#### Testes mínimos

- Integração do repositório com registros antes, nas duas bordas e depois do período para cada situação.
- Integração de ordenação/paginação com códigos repetidos de produto em filiais distintas.
- Integração de isolamento por requisitante e tentativa de injeção/entrada malformada nos filtros.
- Integração de filial virtual para estoques da requisitante/requisitada e Reserva Prévia.
- Integração do detalhe com e sem característica, com `dadofiscal` ausente e com múltiplos itens.
- Feature do endpoint verificando envelope, revisão por linha, parâmetros, autorização e validação.
- Vitest da página/grid para defaults, Gerar/Enter, estados, seleção, cores, colunas parametrizadas, edição somente de Pedida e aba Confirmados.
- Vitest dos atalhos F7/F5/F6/F12, garantindo que não disparam durante modal, foco incompatível, carregamento ou ação desabilitada.

### Alteração de quantidade, cancelamento e concorrência

#### Critérios de aceite

1. Salvar quantidade aceita somente identidade, revisão esperada e nova `qtdepedida` inteira positiva. Produto, filiais, observação e `qtderecebida` enviados adicionalmente são rejeitados ou ignorados por lista permitida explícita, nunca aplicados.
2. Somente requisição aberta pode ser alterada/cancelada; demais situações retornam erro de domínio sem escrita parcial.
3. Alteração delega ao núcleo e produz os mesmos deltas TEP/TPE/TFR, locks, validações e alertas já cobertos pelo Cadastro.
4. Cancelamento é lógico, libera a `qtdepedida` integral mesmo com `qtderecebida` parcial, limpa recebida conforme o núcleo e prioriza Venda Futura para Reservado.
5. Motivo é obrigatório somente quando o parâmetro literal estiver ativo; validação ocorre novamente no servidor.
6. Reserva Prévia insuficiente não desfaz cancelamento válido: movimenta o disponível e retorna `reserva_previa_divergente` com esperado, movimentado e diferença.
7. Revisão obsoleta — inclusive alteração simulada pelo Delphi — retorna `409`, não sobrescreve dados e fornece revisão atual para recarga explícita.
8. Falha em qualquer etapa reverte requisição, estoque, movimentos e contexto transacional.
9. Toda escrita configura `DatabaseAuditContext`; somente o trigger grava `pedidosfiliais_log_new`, com usuário, filial, origem e request id esperados.
10. Após sucesso, a API retorna linha e revisão recarregadas; a UI atualiza somente a linha afetada e mantém filtros/página/seleção.

#### Testes mínimos

- Feature dos adapters para happy path, quantidade zero/fracionária, campos proibidos, filial adulterada, situação não aberta e motivo.
- Integração do núcleo para aumento, redução, futuro, reserva divergente, cancelamento com recebida parcial e saldo insuficiente.
- Integração de revisão após update SQL externo simulando Delphi e duas sessões Laravel concorrentes.
- Integração de rollback após falha entre pedido e movimentos.
- Integração do trigger confirmando um único registro/diff de auditoria e ausência de insert manual duplicado.
- Vitest para edição/salvamento, confirmação de cancelamento, motivo, alerta persistente até dismiss, conflito `409` e recarga.

### Relatório F12

#### Critérios de aceite

1. F12 só está habilitado quando há resultado e abre resposta `application/pdf` com `Content-Disposition: inline` em nova aba.
2. O servidor recebe apenas filtros, revalida autorização e executa novamente a leitura completa; não aceita linhas do navegador e não limita o PDF à página atual.
3. Grid e relatório compartilham a mesma semântica de filial, período, situação e ordenação; um fixture conhecido produz o mesmo conjunto de identidades em ambos.
4. O PDF é paisagem e contém cabeçalho institucional da filial ativa, requisitante, período, situação, emissão e paginação.
5. O corpo agrupa por Filial Requisitada e contém exatamente: Filial Requisitada, Código, Descrição, Referência, ABC, Nº Lote, Solicitado, Confirmado e OK.
6. Grades integram a descrição; lote ausente fica vazio; OK é caixa vazia sem persistência; há zebramento.
7. Não há Confirmados, estoques, Reserva Prévia, observação ou data por linha, subtotais nem total geral.
8. Falha conhecida do renderizador retorna resposta controlada (`503` para indisponibilidade); outras falhas são registradas e não expõem detalhes internos.

#### Testes mínimos

- Unit/Service do view model e Blade, verificando título, filtros, agrupamento, ordem, colunas, caixa OK e ausências deliberadas.
- Feature do endpoint para autenticação/capability/filial, validação dos filtros, headers inline e não aceitação de `linhas`.
- Integração comparando todas as identidades do relatório com a leitura não paginada dos mesmos filtros.
- Teste do gerador com Browsershot substituído apenas na borda para verificar orientação/shell; teste separado da resposta `503`.
- Smoke PDF em ambiente com Chromium, validando assinatura `%PDF` e ao menos uma página, sem usar snapshot binário frágil.

### Regressão e critérios de conclusão

1. Permanecem verdes todos os testes atuais de `tests/Feature/Interlojas/RequisicaoExposicao`, `tests/Feature/Estoque/RequisicaoFiliais`, unidades de `RequisicaoFiliais` e testes React de `Interlojas/RequisicaoParaExposicao`.
2. Cadastro continua incluindo, carregando, alterando e cancelando fichas; F9 continua listando somente abertas e não passa a aceitar filtros da Consulta.
3. Consulta de Compras continua usando criar/somar sem receber capability ou comportamentos da nova Consulta.
4. Nenhum teste novo depende da ordem natural do banco, do relógio local do navegador ou de dados externos não controlados.
5. Testes de banco sensíveis rodam no PostgreSQL suportado; Vitest usa timers/rede controlados; datas do servidor são congeladas nos fixtures.
6. O gate de cada corte inclui testes focais, suíte PHP relacionada, Vitest relacionado, `npm run build` e análise estática/lint adotada pelo repositório. Antes do handoff final, executar as suítes completas disponíveis.

Uma especificação só é aceita quando seus critérios têm teste automatizado correspondente ou uma justificativa explícita para verificação manual. A publicação dos comandos SpecKit deve distribuir estes critérios pelos quatro cortes, mantendo regressão do núcleo em todos os cortes que o consumirem.
