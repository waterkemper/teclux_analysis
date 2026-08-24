# Prompt 35 para /speckit.specify — homologação real da NF-e de transferência

## Ponto de partida

O código atual já possui o núcleo do prompt 33: fotografia fiscal, numeração e chave, criação de AUTORIZAR_NFE_55, outbox, despacho do worker, consulta de estado e geração de DANFE. Existem testes com Fake e validação de que o container usa o adapter real por padrão.

Este prompt deve fechar a prova operacional em ambiente de homologação e corrigir somente lacunas encontradas na auditoria. Não reescrever o pipeline existente sem evidência.

## Escopo

- NF-e modelo 55 de transferência entre filiais;
- ICMS/CSOSN, IPI, PIS e COFINS já existentes;
- geração de XML, assinatura, transmissão, retorno SEFAZ, persistência e DANFE;
- roteiro executável de homologação.

Ficam fora: IBS, CBS, NFS-e, venda entre filiais, devolução, etiquetas, impressão automática, cancelamento e inutilização.

O Cursor não tem acesso aos fontes Delphi. Não tentar abrir fontes Delphi; usar apenas os contratos e fatos já transcritos no repositório.

## Auditoria obrigatória antes de alterar

Verificar no código e registrar evidência para:

1. binding do container para `NfePhpFiscalGateway` em execução normal;
2. seleção do certificado A1 da filial emitente;
3. configuração vigente de ambiente, UF, modelo, série, endpoints e XSD;
4. existência da chave calculada antes da transmissão;
5. existência de comando e outbox `AUTORIZAR_NFE_55` após o commit;
6. execução do `FiscalNfeOutboxDispatcher` e `ProcessarAutorizacaoNfeJob`;
7. assinatura, validação XSD e chamada real do gateway;
8. persistência de tentativa, XML enviado, resposta, cStat, motivo, recibo e protocolo;
9. transição para autorizada, rejeitada ou aguardando reconciliação;
10. geração do DANFE a partir do XML autorizado e disponibilidade do PDF.

Se algum item falhar, produzir a correção mínima e idempotente. Não mascarar ausência de transmissão como “aguardando”.

## Impostos e XML

- Confirmar que ICMS/CSOSN, IPI, PIS e COFINS são resolvidos antes da fotografia selada.
- Confirmar que CFOP pode variar por item e que os valores da fotografia, `dadosfiscais`, legado e XML são iguais.
- Confirmar que CSOSN sem ICMS próprio não recebe imposto inventado, sem bloquear PIS/COFINS válidos.
- Confirmar que imposto aplicável sem fonte bloqueia antes da reserva do número.
- Confirmar precedência do GTIN: dado fiscal específico, código válido em `produtoscodigobarras` quando aplicável, cadastro fiscal e `SEM GTIN` somente quando não houver código válido.
- Não incluir IBS/CBS nem aceitar valores enviados pelo navegador como autoridade.

## Transmissão real

Definir uma sequência verificável:

1. pré-condições aprovadas;
2. releitura das linhas e dados fiscais;
3. chave e número persistidos;
4. XML formado, validado e assinado;
5. comando/outbox AUTORIZAR criado;
6. worker executado na fila correta;
7. gateway NFePHP chamado com certificado e endpoint da filial;
8. resposta persistida com correlação;
9. estado fiscal projetado para a tela;
10. DANFE gerado e disponibilizado somente após autorização.

Nenhuma etapa de autorização pode movimentar estoque novamente. Repetição do comando deve reutilizar emissão, chave e comando existentes.

## Roteiro real de homologação

Produzir instruções com comandos e evidências para:

- diagnóstico de PHP, extensões SOAP, bibliotecas NFePHP, Redis, fila e storage;
- configuração publicada para SC/modelo 55/homologação/data vigente;
- certificado A1 válido da filial emitente e sua seleção efetiva;
- execução do worker fiscal;
- emissão de uma transferência de teste;
- consulta das tabelas de emissão, comando, outbox, tentativa e artefatos;
- conferência do XML assinado, chave, cStat, motivo, protocolo e resposta SEFAZ;
- geração e abertura do DANFE PDF;
- comportamento em rejeição, timeout e indisponibilidade de fila.

O roteiro deve indicar claramente quando a nota foi apenas enfileirada, quando foi transmitida, quando foi autorizada e quando está pendente. Não considerar teste Fake como homologação real.

## Testes obrigatórios

- Teste de contrato do outbox AUTORIZAR.
- Teste do worker com gateway Fake para autorização, rejeição e ambiguidade.
- Teste de binding que impeça Fake fora de ambiente de teste.
- Teste de chave imutável e idempotência.
- Teste de equivalência dos impostos entre fotografia, legado e XML.
- Teste de DANFE somente após autorização.
- Teste documentado de homologação real com certificado, chamada SEFAZ e resposta persistida.

## Entrega

Produzir especificação, matriz de pré-condições, correções mínimas eventualmente necessárias, contratos de observabilidade, testes e roteiro de homologação. Não implementar código durante `/speckit.specify`.

