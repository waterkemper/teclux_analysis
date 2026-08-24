# Definir DANFE padrão, DANFE simplificada e etiquetas da Transferência

Type: research
Status: resolved

## Answer

Relatório de pesquisa: [20-danfe-simplificada-e-etiquetas.md](../research/20-danfe-simplificada-e-etiquetas.md).

### Decisão baseada nas evidências

- **CONFIRMADO:** a Transferência no Delphi gera o DANFE padrão após a emissão/transmissão, usando NFe.ImprimirDanfe e ParSistema.NomeImpressoraNotaMercadorias.
- **CONFIRMADO:** os volumes fiscais fazem parte da fotografia/NF-e: quantidade, numeração, marca, espécie, peso bruto e peso líquido são carregados, persistidos e enviados ao gerador.
- **CONFIRMADO na arquitetura Laravel:** a DANFE padrão deve ser derivada do nfeProc autorizado pelo pipeline fiscal comum e reimpressa a partir do artefato arquivado, com versão/hash conforme o contrato da plataforma.
- **NÃO LOCALIZADO:** não há evidência de renderer, flag, artefato, endpoint ou reimpressão específica de DANFE simplificada para esta Transferência.
- **NÃO LOCALIZADO:** não há chamada de emiteetiqueta, rotina de etiqueta de mercadoria/volume ou regra que derive etiquetas automaticamente nesta jornada. A existência de NomeImpressoraEtiqueta e TipoImpressoraEtiqueta em configuração geral não prova uso pela Transferência.
- **DIVERGENTE/NÃO COMPROVADO:** formatodanfe = 1 significa orientação retrato no legado; não deve ser reinterpretado como tpImp = 1 nem como DANFE simplificada.

Consequentemente, a especificação complementar deve fechar primeiro as decisões HITL de DANFE simplificada e etiquetas. Até que essas decisões existam, o escopo comprovado é apenas DANFE padrão derivado do nfeProc autorizado, com volumes na fotografia/XML e impressão/reimpressão por artefato fiscal. Nenhum renderer ou fluxo de etiqueta paralelo deve ser presumido.
Blocked by: 18

## Question

Comparando o Delphi e a plataforma fiscal Laravel, quais documentos auxiliares devem existir após a NF-e autorizada: DANFE padrão, DANFE simplificada e etiquetas de mercadoria/volume? Determinar conteúdo, formato, origem dos dados, momento de geração, artefato/versionamento, reimpressão, distribuição e dispositivo/impressora.

O ticket deve localizar evidência concreta do Delphi para `ImprimirDanfe`, `NomeImpressoraNotaMercadorias`, volumes e qualquer regra de `emiteetiqueta`, distinguindo impressão da NF-e de etiqueta logística. Deve esclarecer se a DANFE simplificada é um novo renderer/layout ou apenas uma configuração de impressão, sem confundi-la com `tpImp=1` nem criar um renderer paralelo fora do pipeline fiscal.
