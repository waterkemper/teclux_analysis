# Prompt SpecKit — Emissão Fiscal da Transferência de Requisição

Use este texto como entrada de /speckit.specify.

## Contexto

Leia integralmente:

- /mnt/c/teclux_analysis/modules/interlojas/transferencia-requisicao-emissao-fiscal/especificacao.md
- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/01-fluxo-fiscal-transferencia-delphi.md
- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/04-mapeamento-fotografia-fiscal-transferencia.md
- /mnt/c/teclux_analysis/.scratch/emissao-fiscal-eletronica-laravel-wayfinder/especificacao.md
- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-exposicao-wayfinder/map.md
- /mnt/c/teclux_analysis/modules/interlojas/transferencia-requisicao-exposicao/pesquisa-sql-dominio-efeitos-delphi.md
- /mnt/c/teclux_analysis/modules/interlojas/transferencia-requisicao-exposicao/schema/README.md
- /mnt/c/teclux_analysis/snapshot authoritative do schema indicado por esse README
- /mnt/c/teclux_analysis/.scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/05-auditoria-implementacao-transferencias.md

## Tarefa

Produza a especificação técnica para integrar Transferência de Requisição para Exposição à Plataforma de Emissão Fiscal Eletrônica.

Considere que a feature 332 já entregou um MVP de contrato com Fake. Não declare a integração concluída apenas porque os testes do Fake passam; os requisitos REQ-TRF-FISCAL-025 a 038 e o prompt de complementação são obrigatórios para produção.

Implemente no desenho, sem implementar código:

1. grupo fiscal estável por Transferência, Filial Requisitante, operação e conjunto de linhas;
2. NF-e modelo 55 de saída com FilialBase como emitente e Filial Requisitante como destinatário;
3. nenhum documento fiscal de entrada automático;
4. Fotografia Fiscal completa, selada, hashada e sem consultas posteriores;
5. numeração na mesma série fiscal do Delphi, com idempotência e transação curta;
6. transmissão, reconciliação, Artefatos, DANFE, distribuição e espelhamento via pipeline fiscal comum;
7. projeções de autorização no destino sem duplicidade;
8. convivência determinística com emissão já iniciada no Delphi;
9. preservação de registros históricos sem executar `VendaTransferencia` ou `DevolucaoTransferencia`; o único caminho fiscal ativo é `Transferencia`;
10. pendências operacionais para falhas, divergências, reconciliação e dados ausentes.

## Restrições

- Não criar contador, gateway, certificado, fila, agregado ou pipeline fiscal paralelo.
- Não inferir certificado, Filial, Contribuinte Fiscal ou autorização apenas por raiz de CNPJ.
- Não consultar cadastro atual para completar retry, DANFE, XML ou reconciliação de fotografia selada.
- Não criar NF-e de entrada, notaspag ou duplicata automaticamente.
- Não esconder os commits por grupo e as diferenças entre confirmação operacional e autorização fiscal.
- Não alterar a especificação da plataforma fiscal nem reabrir as decisões operacionais.
- Usar SQL parametrizado/set-based, snapshot de schema e testes sem driver ou hastablefs.

## Entrega esperada

Entregue:

- modelo de domínio e estados;
- contratos de entrada/saída com o módulo operacional, a plataforma fiscal e o Delphi;
- matriz origem -> fotografia -> efeitos;
- estratégia de transação, numeração, idempotência, outbox, retry e reconciliação;
- comandos, filas, autorização, artefatos, DANFE e espelhamento;
- testes de domínio, integração, contrato e aceitação;
- rollout por Filial/ambiente;
- riscos, dúvidas residuais e exclusões;
- rastreabilidade para os arquivos e linhas de evidência.

Se uma fonte for incompleta ou contraditória, classifique como CONFIRMADO, INFERIDO, DÚVIDA, NÃO LOCALIZADO, DIVERGENTE, POSSÍVEL BUG LEGADO ou DECISÃO NOVA. Não preencha lacunas com comportamento inventado.
