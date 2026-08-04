# Prompt para `/speckit.specify` — correção da conferência por chave e chave + volume

```text
/speckit.specify

Este é um prompt novo, autocontido e pós-implementação para corrigir a tela Laravel de Conferência de Volumes do Cadastro de Romaneios. O prompt 04 já foi executado e não deve ser reexecutado nem tratado como solução desta correção. Analise o checkout Laravel atual e especifique somente o ajuste necessário sobre a implementação existente. Não implemente nesta execução: use as evidências consolidadas abaixo, confira somente o checkout Laravel e o snapshot versionado, e produza a especificação funcional/técnica com arquivos e linhas do Laravel.

Objetivo: corrigir a implementação Laravel atual para obter paridade operacional comprovada com o comportamento legado já registrado nas evidências do módulo para leitura, recomeço, gravação parcial/completa, situação e histórico. Não consultar nem exigir acesso ao fonte Delphi. A unidade persistida da conferência é o volume esperado, não somente o Documento Fiscal. Não copiar o bug de localizar por posição nem a limitação de marcar todos os volumes ao ler uma única chave.

Autoridades obrigatórias:
- modules/entregas/cadastro-romaneios/pesquisa-interface-delphi.md;
- modules/entregas/cadastro-romaneios/pesquisa-sql-dominio-efeitos-delphi.md;
- modules/entregas/cadastro-romaneios/interface-operacoes-componentes.md;
- modules/entregas/cadastro-romaneios/modelo-dominio-coexistencia-transacoes.md;
- modules/entregas/cadastro-romaneios/schema/README.md, o JSON do snapshot e functions-2026-08-01.sql;
- laravel/backend/resources/js/Pages/Entregas/Romaneios/components/ConferirVolumesModal.tsx;
- laravel/backend/resources/js/Pages/Entregas/Romaneios/hooks/useCadastroRomaneiosOperacoes.ts;
- laravel/backend/app/Http/Requests/Entregas/Romaneios/ConferirRomaneioRequest.php;
- laravel/backend/app/Application/Entregas/Romaneios/Commands/Handlers/ConferirRomaneioHandler.php;
- laravel/backend/app/Infrastructure/Persistence/Legacy/Entregas/LegacyRomaneioConferenciaBootstrapReadRepository.php;
- laravel/backend/app/Infrastructure/Persistence/Legacy/Entregas/LegacyRomaneioConferenciaRepository.php;
- laravel/docs/architecture/entregas-cadastro-romaneios-operacoes.md.

As conclusões do legado já foram pesquisadas e estão incorporadas em pesquisa-interface-delphi.md:43-46, pesquisa-sql-dominio-efeitos-delphi.md:42,65 e no snapshot/schema. Não mande o Cursor procurar ou validar arquivos Delphi: trate esses documentos como a autoridade de evidência disponível nesta execução.

## Semântica comprovada

1. A evidência consolidada do módulo define romaneios.tipo = 'N' como Romaneio Normal, com leitura pela chave NF-e em chv_nfe.
2. A evidência consolidada do módulo define romaneios.tipo = 'T' como Romaneio de Transferência, com leitura por chv_nfevolumes, calculada como:
   df.chv_nfe || lpad(nrvolume, 3, '0') || lpad(volume, 3, '0').
   O primeiro sufixo é o número sequencial (`nrvolume`); o segundo é a quantidade declarada (`volume`). Não invente separadores, máscara ou outra ordem.
3. `ptipo` da persistência da conferência continua sendo `RPS` quando a situação do Romaneio é `PASSAGEM` e `ROS` nos demais casos permitidos. `ptipo` e modo de leitura (`N`/`T`) são conceitos diferentes e devem aparecer separados no contrato.
4. A identidade persistida da unidade é `(tipo, codigo, dadofiscal, numerovolume, nrvolume)`, conforme a chave de `volumesdadosfiscaisconferencia`. O `dadofiscal` sozinho identifica o Documento Fiscal, não uma unidade de volume.
5. A conferência pode ser salva parcialmente. A situação é recalculada pela autoridade PostgreSQL após a gravação; não exigir que todos os Documentos Fiscais estejam completos antes de permitir F8.

## Erros que a correção deve eliminar

Classifique cada achado no texto como `CONFIRMADO`, `POSSÍVEL BUG ATUAL`, `DIVERGENTE` ou `DECISÃO NOVA`, sempre com arquivo/linha e evidência:

- `ConferirVolumesModal.tsx:80-85` descarta o conteúdo de `leitura`; Enter não interpreta chave nem volume.
- `useCadastroRomaneiosOperacoes.ts:172-190` incrementa o primeiro Documento Fiscal pendente, independentemente do texto lido, do Romaneio, da chave, do volume ou de duplicidade.
- `useCadastroRomaneiosOperacoes.ts:214-230` envia somente `dadofiscais`; não envia as unidades `(numerovolume,nrvolume)` alteradas.
- `ConferirRomaneioHandler.php:64-76` compara o conjunto enviado com todos os Documentos Fiscais elegíveis e rejeita conferência parcial.
- `LegacyRomaneioConferenciaRepository.php:21-25` chama `incluirconferenciadocumentos` por Documento Fiscal; a função legada gera/marca todos os volumes do Documento, não a unidade efetivamente lida. A especificação corretiva deve substituir essa utilização para a gravação interativa, sem reimplementar funções/triggers em PHP e sem criar fonte paralela.
- `LegacyRomaneioConferenciaBootstrapReadRepository.php:62-65` executa contagem por Documento Fiscal e conta linhas de `volumesdadosfiscais`, embora `volumes` represente a quantidade e a identidade final seja expandida por `generate_series`; isso subconta volumes quando uma linha declara quantidade maior que um e cria risco de N+1.
- O bootstrap não entrega modo `N`/`T` nem a lista/identidade das unidades esperadas; `chave_nfe_redigida` é apenas apresentação e não pode servir como chave de matching.
- resetConferirLocal restaura o snapshot inicial; ele não reproduz o comportamento legado consolidado, que limpa as marcações da sessão em edição. Defina claramente a diferença entre recomeçar, cancelar e gravar.
- A especificação anterior que manda usar `incluirconferenciadocumentos` para a conferência interativa deve ser corrigida: confirme sua finalidade e preserve-a somente nos fluxos para os quais a assinatura e os efeitos da função forem comprovados.

## Contrato de bootstrap e leitura

Especifique um bootstrap server-side/set-based que retorne:

- Romaneio, revisão, situação, tipo `N`/`T` e `ptipo` `ROS`/`RPS`;
- Documentos ativos elegíveis, identidade `dadofiscal`, Filial, série/número e apresentação segura da chave;
- Uma linha por unidade de volume esperada, com `dadofiscal`, `numerovolume`, `nrvolume`, `volume`, token de exibição/matching conforme a decisão de segurança, `conferido` persistido e estado local;
- contadores de unidades conferidas/não conferidas e contadores de Documentos completos/parciais, sem confundir os dois níveis.

Use agregação/CTE/set-based query com estratégia explícita para arrays vazios. Não execute consulta por Documento Fiscal ou por volume. O total deve respeitar `coalesce(nullif(volumes, 0), 1)` e a expansão comprovada por `generate_series`; confirme a nulabilidade e os índices no snapshot antes de escolher joins.

## Regras de matching

- Normalize somente o que a autoridade de chave NF-e permite: remover formatação visual aceita, validar a chave completa e nunca aceitar entrada vazia, parcial ou arbitrária.
- Em modo `N`, uma leitura da chave NF-e localiza deterministicamente a próxima unidade não conferida daquele Documento, em ordem `nrvolume`; se houver mais de uma unidade, cada leitura deve consumir uma unidade, sem marcar todas automaticamente. Se o domínio comprovar outra regra para Normal, registre-a como decisão explícita e teste-a.
- Em modo `T`, a leitura deve corresponder exatamente à chave composta `chv_nfe + nrvolume(3) + volume(3)`; chave sem sufixo, sufixo inválido, número inexistente ou quantidade divergente são rejeitados.
- Uma leitura desconhecida, de Documento cancelado/inelegível ou já conferida gera feedback textual e acessível, não muta estado e não altera contadores.
- A UI pode mostrar chave redigida, mas o matching deve usar autoridade segura e inequívoca; não compare contra texto redigido. Reutilize `NfeAccessKey`/`NfeAccessKeyInput` para a parte NF-e e crie extensão somente se a necessidade composta estiver comprovada.
- Enter registra uma intenção local de uma unidade, limpa o campo, mantém foco no scanner e informa Documento, volume, modo e resultado. Não transforme Enter vazio em incremento implícito.

## Recomeçar, cancelar e F8

- Ao abrir, carregue o estado persistido e preserve a revisão.
- Recomeçar exige confirmação quando houver alterações locais e limpa as marcações da sessão em edição para todas as unidades elegíveis, conforme a evidência consolidada; não deve apagar banco imediatamente.
- Cancelar/Esc abandona alterações locais sem gravar e fecha o modal; o dirty state deve refletir leituras e recomeço.
- F8 grava estado parcial ou completo uma única vez, com feedback busy/erro/sucesso, e fecha somente após commit confirmado. O atalho Laravel é F8.

## Gravação e efeitos legados

Defina um payload versionado por unidades estáveis, por exemplo `leituras[]` com `dadofiscal`, `numerovolume`, `nrvolume` e estado pretendido, além de `expected_revision` e idempotência. O backend deve:

- reabrir a transação, obter locks determinísticos do Romaneio e das unidades, revalidar Filial, capacidade, tipo, situação, documento não cancelado e revisão;
- rejeitar IDs de unidade adulterados, duplicados, fora do Romaneio ou incompatíveis com o snapshot atual;
- persistir as linhas de `volumesdadosfiscaisconferencia` em operação set-based e trigger-aware, mantendo chave, timestamps, usuário, Filial e auditoria legados; não iterar N vezes em PHP;
- criar/atualizar `conferencia` e chamar o contrato autoritativo de atualização da situação no ponto comprovado, sem duplicar seus efeitos em PHP;
- não chamar `incluirconferenciadocumentos` para marcar todos os volumes quando a intenção é uma leitura individual; se a implementação descobrir que a função precisa de um papel de inicialização, separar esse papel do comando de gravação e prová-lo em PostgreSQL;
- confirmar ou reverter atomicamente conferência, situação, auditoria e idempotência; reler o agregado e a revisão após o commit.

Não usar `Schema::has*`, `information_schema`, introspecção em runtime, SQL interpolado, N+1, `MAX()+1` ou segunda tabela Cloud para o estado de conferência.

## Matriz mínima de aceite

Inclua testes de frontend, request/handler e PostgreSQL real para:

- Normal com uma unidade: chave válida confere exatamente uma unidade.
- Normal com várias unidades: leituras repetidas da mesma chave consomem `nrvolume` pendente em ordem e nunca marcam todas de uma vez.
- Transferência: somente chave + volume exata confere a unidade correta; chave isolada e sufixos inválidos falham.
- chave desconhecida, vazia, incompleta, documento cancelado, documento fora do Romaneio, unidade inexistente e unidade já conferida.
- mistura de documentos, conferência parcial, conferência completa e Romaneio `PASSAGEM` (`RPS`) versus demais (`ROS`).
- Recomeçar seguido de F8, Recomeçar seguido de Esc, Esc sem alterações e dirty state.
- revisão obsoleta por escrita legada/Laravel, payload adulterado, repetição idempotente e duas gravações concorrentes.
- rollback injetado após conferência, atualização de situação, trigger/auditoria e idempotência; nenhum estado parcial.
- query budget e `EXPLAIN (ANALYZE, BUFFERS)` do bootstrap e da gravação, demonstrando ausência de N+1 e cardinalidade correta.
- capability, acesso ao módulo e escopo de Filial no bootstrap, matching e gravação.

## Fora de escopo

- alterar código legado, banco legado, funções/triggers ou migrations aplicadas;
- implementar esta correção nesta execução;
- mudar o significado de `RPS`/`ROS`, `Atualizar_situacao_romaneio` ou o agregado canônico;
- criar uma conferência de produtos ou um motor genérico que substitua a Conferência de Volumes do Romaneio.
```
