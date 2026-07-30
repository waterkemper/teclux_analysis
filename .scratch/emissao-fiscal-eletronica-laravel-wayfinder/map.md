# Levar a emissão fiscal eletrônica para o Laravel

## Destination

Chegar a uma especificação arquitetural e operacional pronta para virar tickets de implementação da emissão completa de NF-e e NFC-e pelo Laravel, sem UniNFe/UniDANFE, cobrindo certificados A1, SEFAZ, contingência, DANFE, S3 e convivência segura com o Delphi.

## Notes

- Este mapa decide e especifica; não implementa o emissor fiscal.
- Usar /domain-modeling e o vocabulário fiscal de `CONTEXT.md`.
- Escopo: NF-e e NFC-e de saída, ciclo fiscal completo, contingências aplicáveis, DANFE/DANFE NFC-e e Gerenciamento de Certificado A1.
- Laravel forma, assina, transmite, consulta e processa retornos e eventos diretamente.
- XML autorizado no S3 é canônico; `dadosfiscais.xmlnfe` mantém cópia temporária. `notaspag.xmlnfe` fica fora.
- Laravel e Delphi operam em paralelo e compartilham `seriesfiliais` com bloqueio pessimista, mas nenhuma alteração no Delphi fornecerá exclusão mútua para as operações posteriores à numeração; esse risco residual será tratado por reconciliação.
- Número alocado não é reutilizado. Falhas geram Emissão Fiscal Pendente; inutilização é explícita, autorizada e precedida por reconciliação.
- NF-e usa processamento assíncrono durável; NFC-e exige resposta curta e contingência offline quando aplicável.
- Certificado A1 é gerenciado por Filial com histórico, validação, ativação, alertas, criptografia e Auditoria.

## Decisions so far

- [Levantar os requisitos oficiais vigentes de NF-e e NFC-e](issues/02-pesquisar-requisitos-oficiais-nfe-nfce.md) — adota baseline MOC 7.0/leiaute 4.00 mais NTs cumulativas, configuração versionada por UF/modelo/ambiente, contingências distintas, A1 auditado e S3 canônico com reconciliação.
- [Avaliar a stack PHP para comunicação fiscal direta](issues/03-avaliar-stack-php-emissao-fiscal.md) — recomenda `sped-nfe` + `sped-common` + `sped-da` atrás de adapter próprio, condicionado à matriz oficial, homologação por UF e extensões PHP ainda ausentes no container.
- [Inventariar o fluxo fiscal de saída no Delphi e no Laravel](issues/01-inventariar-fluxo-fiscal-legado.md) — múltiplas origens commitam Nota Fiscal de Saída e avanço da Série antes da SEFAZ; UniNFe é transporte por diretórios, estado fica achatado em `dadosfiscais`, e Laravel hoje só consome partes do legado.
- [Definir o modelo da Emissão Fiscal Eletrônica e seus estados](issues/04-definir-modelo-emissao-estados.md) — separa resultado fiscal e processamento, mantém uma emissão com revisões/tentativas/eventos, reconcilia ambiguidades, modela contingência e só projeta `C` no legado após protocolo confirmado.
- [Definir numeração e convivência entre Delphi e Laravel](issues/05-definir-numeracao-convivencia.md) — usa a mesma linha de `seriesfiliais` em transação curta, torna a Emissão o registro idempotente da alocação sem reutilização, espelha a origem Delphi de forma assimétrica e aceita o risco residual sem trava compartilhada, convergindo por reconciliação.
- [Definir a custódia e a operação dos Certificados A1](issues/06-definir-seguranca-certificados-a1.md) — adota versões por Filial com PFX/senha cifrados no PostgreSQL, chaveiro externo e rotacionável, validação/ativação administrativa, uso efêmero pelos workers, alertas, recuperação testada e expurgo do material privado.
- [Definir artefatos fiscais, S3 e compatibilidade legada](issues/07-definir-artefatos-fiscais-s3.md) — torna S3 privado/versionado a custódia imutável, usa staging/outbox no PostgreSQL e upload assíncrono fora do caixa, preserva projeções no banco sem escrever nos diretórios Delphi e audita integridade, retenção e acesso.
- [Definir a fotografia imutável do payload fiscal](issues/12-definir-fotografia-payload-fiscal.md) — sela valores resolvidos e cálculos antes do XML em JSON versionado/hashado, cria revisões imutáveis para correção/contingência e mantém geração e DANFE determinísticos sem consultar cadastros posteriores.
- [Definir o espelhamento e a transferência de emissões do Delphi](issues/14-definir-espelhamento-transferencia-delphi.md) — sincroniza por `inserted_at/updated_at` sem alterar o legado, cria espelhos somente leitura e artefatos com proveniência, e exige reconciliação e aceite administrativo para controle ativo no Laravel.
- [Definir a orquestração idempotente e a reconciliação com a SEFAZ](issues/08-definir-orquestracao-idempotente.md) — persiste comandos/outbox no PostgreSQL, prioriza NFC-e em Redis, coordena por locks/leases e checkpoints, proíbe retentativa cega e resolve ambiguidades consultando e comparando evidências antes de prosseguir.
- [Definir a operação de NF-e, NFC-e e contingência](issues/09-definir-operacao-nfe-nfce.md) — adota uma Central de Emissões orientada a exceções, distingue papéis e estados, mantém NF-e assíncrona e NFC-e prioritária/offline, e condiciona ações sensíveis a elegibilidade, auditoria e reconciliação.
- [Definir observabilidade, aceite e rollout paralelo](issues/10-definir-observabilidade-aceite-rollout.md) — ativa por Filial/modelo/Série sob aprovação manual, usa suspensão segura sem failover automático, preserva a abertura proativa da Central, e define alertas, métricas, testes, runbooks e Auditoria.
- [Definir a distribuição do Documento Fiscal ao destinatário](issues/13-definir-distribuicao-destinatario.md) — preserva inicialmente SMTP Filial com fallback integral ao Usuário e destinatários do Delphi, separa distribuição do resultado fiscal, envia artefatos canônicos de modo idempotente e auditado, e limita os canais iniciais a e-mail, impressão e download autenticado.
- [Consolidar a especificação da plataforma fiscal no Laravel](issues/11-consolidar-especificacao-fiscal.md) — reúne as decisões em uma especificação rastreável com 85 requisitos verificáveis, matriz de aceite, runbooks e sequência pronta para decomposição em tickets de implementação.

## Not yet specified

## Out of scope

- Nota Fiscal de Entrada e `notaspag.xmlnfe`.
- Manifestação do destinatário e distribuição DF-e recebida.
- Certificados A3 e agentes locais para assinatura.
- Implementar o emissor durante este mapa.
- Migração histórica em massa, replicação regional do bucket e retirada das Projeções Legadas na primeira implantação.
