# Prompt para /speckit.specify — criação da NF-e avulsa, fotografia e numeração

```text
/speckit.specify

Crie uma especificação funcional e técnica detalhada para o primeiro tracer bullet persistente da plataforma fiscal: preparar uma Nota Fiscal de Saída avulsa, criar a Emissão Fiscal Eletrônica, selar sua Fotografia Fiscal e alocar número compartilhado com o Delphi. Construa sobre `01-speckit-prompt.md`.

Não implemente. Inspecione o checkout Laravel, inclusive tabelas e fluxos legados já usados por Nota Fiscal de Saída. Não consulte fontes Delphi; use o pacote consolidado como autoridade e registre dúvidas objetivas.

## Limite desta entrega

- agregados Emissão, Revisão/Fotografia, Comando, Tentativa, Evento, Contingência, Artefato e Distribuição, implementando aqui somente o necessário para criar e consultar a emissão pendente;
- estados fiscal e de processamento separados;
- Fotografia JSON autocontida, canônica, versionada, SHA-256 e imutável, com valores fiscais já resolvidos e sem senha A1/CSC;
- Chave de Idempotência e no máximo um comando mutável ativo;
- numeração na mesma linha de `seriesfiliais` usada pelo Delphi, sem contador paralelo, cache ou bloco;
- transação curta: validar idempotência, `FOR UPDATE`, reler contador/ocupação, gravar projeções `dadosfiscais`/`notas`, Emissão, revisão selada e outbox, avançar contador e confirmar;
- consulta autenticada da emissão preparada.

Não inclua assinatura, rede SEFAZ, S3, DANFE, correção ou Central completa.

## Decisões obrigatórias

1. Validar tudo que independe do número antes do lock.
2. Rollback desfaz criação e avanço; após commit, número nunca é reutilizado.
3. Registrar contador anterior/novo, usuário, origem e instante.
4. Cálculos e rateios terminam antes da selagem; gateway futuro só serializa e assina.
5. PostgreSQL é a verdade durável; Redis será apenas transporte.

## Testes obrigatórios

- criação avulsa feliz e consulta da pendência;
- repetição da mesma chave retorna a mesma emissão;
- concorrência com Laravel e ocupação simulada pelo legado não duplica número;
- falha em cada ponto transacional não avança contador;
- alteração cadastral posterior não muda a fotografia;
- nenhuma rede, assinatura ou S3 ocorre antes do commit.

Produza spec, plano, modelo de dados, contrato do comando e matriz de testes. Não implemente durante `/speckit.specify`.
```
