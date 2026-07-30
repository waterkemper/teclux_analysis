# Definir numeração e convivência entre Delphi e Laravel

Type: grilling
Status: resolved
Blocked by: 01, 04

## Question

Como bloquear, reservar e avançar `seriesfiliais` na transação que cria `dadosfiscais` e `notas`, garantindo convivência, idempotência, rastreio de lacunas e não reutilização?

## Answer

### Coordenador único e transação curta

Laravel e Delphi usam a mesma linha legada de `seriesfiliais`, identificada pela Filial e Série Fiscal, como coordenador único da numeração. O Laravel não manterá contador paralelo, cache, sequência própria nem reservará blocos.

Antes de numerar, o Laravel valida tudo o que independe do número. Depois, em uma transação curta:

1. verifica a Chave de Idempotência da intenção;
2. bloqueia `seriesfiliais` com `SELECT ... FOR UPDATE` e relê seus valores;
3. valida que o número candidato não está ocupado;
4. grava `dadosfiscais`, `notas`, a Emissão Fiscal Eletrônica e a outbox;
5. avança `seriesfiliais.numeroinicial`;
6. confirma a transação e libera o bloqueio.

Formação e assinatura do XML, comunicação com a SEFAZ, S3 e DANFE ocorrem somente depois do commit. Rollback integral também desfaz o avanço. Uma emissão commitada conserva seu número definitivamente: falha ou abandono vira pendência e, quando cabível, inutilização autorizada; nunca exclusão física, decremento ou reutilização.

### Idempotência, colisão e auditoria

A Chave de Idempotência é persistida e única por `tipo_origem + id_origem + operacao_fiscal`; o contrato sozinho não basta porque pode haver faturamento parcial. A verificação ocorre antes e dentro da transação, e repetições retornam a emissão existente.

A própria Emissão Fiscal registra a Alocação de Número Fiscal; não existe tabela de reserva separada. Ela guarda Filial, ambiente, modelo, Série Fiscal, número, origem, chave de idempotência, usuário/operação, valores anterior e novo de `numeroinicial` e instante da alocação.

Se o candidato já existir em `notas` ou nas emissões, o Laravel não pula o número: aborta, alerta o Usuário e bloqueia novas emissões Laravel naquela série. Um Administrador deve corrigir o cadastro da Filial. A correção comum apenas avança `numeroinicial`, nunca reduz nem aponta para número ocupado, e audita valor anterior, novo, motivo e Administrador. Redução exige procedimento excepcional separado. `numerofinal` será somente limite impeditivo na primeira versão, sem alertas antecipados nem gestão de novas faixas.

### Identidade e espelhamento durante a convivência

`dadosfiscais.chv_nfe`, quando preenchida, é a identidade fiscal principal e não admite duplicidade. Antes dela, e para pendências incompletas, vale a combinação `Filial + ambiente + modelo + Série Fiscal + número`. Chave de acesso divergente para a mesma combinação bloqueia o espelhamento e gera alerta, sem sobrescrita.

Emissões criadas no Delphi são espelhadas no Laravel como `ORIGEM_DELPHI`, sem nova alocação e inicialmente apenas para consulta, armazenamento no S3 e reconciliação. O Laravel não as transmite nem cria eventos automaticamente. Para torná-las acionáveis no Laravel, um Administrador precisa solicitar transferência explícita, precedida por consulta à SEFAZ, importação de XML/protocolos/eventos, confirmação operacional de que não há ação em curso no Delphi e registro de motivo, Usuário, data e situação encontrada.

### Risco residual aceito

Não haverá alteração no Delphi durante a transição. Portanto, ele continuará tecnicamente capaz de transmitir qualquer nota pendente, inclusive uma criada pelo Laravel, e não existe exclusão mútua completa entre os sistemas. `Sistema de Origem` e `Último Executor Fiscal` são informação e auditoria, não trava compartilhada.

Antes de transmitir ou criar evento, o Laravel relê `dadosfiscais` e consulta/reconcilia com a SEFAZ. Se o Delphi já concluiu a operação, o Laravel interrompe sua ação e importa o resultado. Resposta de duplicidade exige consulta pela chave e comparação do XML, nunca retentativa cega. A operação deve evitar ações simultâneas nos dois sistemas, mas o risco de corrida é explicitamente aceito até a retirada definitiva do Delphi.
