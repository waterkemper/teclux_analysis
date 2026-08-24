# Confirmar romaneio e etiquetas de volumes no encerramento da Transferência

Label: wayfinder:issue
Type: research
Status: resolved

## Question

No encerramento da Transferência no Delphi, o operador é perguntado se deseja incluir a NF em romaneio? Em seguida, o sistema imprime etiquetas de volumes automaticamente, abre uma tela de seleção, ou apenas encaminha os `dadosfiscais` para uma tela posterior?

## Evidence to inspect

- `delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas`: bloco final de `ConfirmaRequisicao`, `vListaDadosFiscaisGravados` e chamada de `TfrmEmissaoEtiquetas`.
- `delphi/apps/interlojas/dmconfirmarnotastransferencia.pas` e `dmconfirmarromaneiostransferencia.pas`: vínculo NF–romaneio, volumes e estados do romaneio.
- Formulários/classes do Delphi para `TfrmEmissaoEtiquetas`, `Imprimir Volumes NF Saída`, inclusão em romaneio e impressão de volume; identificar chamadas reais, não apenas nomes de campos ou configurações genéricas de impressora.
- Laravel: emissão fiscal da Transferência, módulos `ConfirmacaoPorNotas` e `ConfirmacaoPorRomaneios`, tabelas/repositorios de `volumesdadosfiscais`, `romaneios` e `romaneiosnotas`.

## Required output

Confirmar, com caminhos e linhas:

1. se existe pergunta explícita de incluir em romaneio;
2. quem cria o romaneio e quem apenas vincula a nota;
3. se a NF é vinculada antes ou depois da impressão;
4. origem e cardinalidade dos volumes (`dadosfiscais`, `volumesdadosfiscais` e demais tabelas);
5. se a etiqueta é de volume, produto ou ambos;
6. se existe parâmetro para imprimir, qual o renderer/relatório e qual o fallback quando não há impressora;
7. qual parte deve ser PDF no Laravel agora e qual parte deve permanecer como etapa posterior de impressão automática.

Do not infer a new printer integration from `ParSistema.NomeImpressoraNotaMercadorias`. Do not implement code.

## Answer

### Decisão

O comportamento lembrado existe, mas em duas etapas distintas:

1. a pergunta de romaneio é disparada pela rotina genérica Perpetrar, e não diretamente pelo loop de ConfirmaRequisicao;
2. depois do encerramento de todas as NF-e, a Transferência abre TfrmEmissaoEtiquetas já com a operação de impressão de volumes.

### Evidências e respostas

1. **Pergunta explícita de romaneio — CONFIRMADO, condicional.** delphi/repositorio/dmbasico.pas:1738-1785 só pergunta quando o parâmetro ParSistema.Incluir_nota_entre_filiais_automaticamente_nos_romaneios está ativo, modoinclusaoromaneio ainda é nulo, a NF-e atende aos critérios fiscais e está na situação N. A mensagem oferece “Não Incluir”, “Existente” e “Novo”. O modo 2 representa romaneio existente e o modo 1 representa novo romaneio; cancelar não grava modo.

2. **Criação e vínculo — CONFIRMADO no limite do código disponível.** A rotina genérica altera modoinclusaoromaneio; o trigger PostgreSQL dadosfiscais_incluirromaneio (modules/entregas/relatorio-entregas/schema/postgresql-authoritative-2026-08-19.json:11062-11068) chama incluir_romaneio(...). Portanto a função de banco é quem cria ou localiza o romaneio e materializa o vínculo da NF. O corpo dessa função não está nos fontes pesquisados; não há base para reproduzir sua lógica no domínio Laravel.

3. **Ordem — CONFIRMADO.** qryDadosFiscais é persistido no Perpetrar (delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1917); a seleção do modo de romaneio ocorre nessa rotina de persistência. Somente depois, no finally de ConfirmaRequisicao (delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:978-985), é aberta a tela de etiquetas. A consulta da etiqueta lê o romaneio mais recente de romaneiosnotas, portanto o vínculo deve existir antes da impressão.

4. **Volumes — CONFIRMADO.** A Transferência grava uma linha de volumesdadosfiscais por dadofiscal, com codigo = 1, contendo quantidade, pesos, numeração, marca e espécie (delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:872-892). O relatório expande a quantidade com generate_series; nulo/zero resulta em uma etiqueta (delphi/apps/estoque/dmemissaoetiquetas.dfm:2678-2800).

5. **Tipo de etiqueta — CONFIRMADO.** A operação chamada pela Transferência é Imprimir Volumes NF Saída (delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:983). O dataset e o FastReport exibem volume, total de volumes, chave da NF-e, filial, destinatário, marca, espécie e romaneio. Não há chamada de etiqueta de produto nesse caminho.

6. **Impressão — CONFIRMADO.** TfrmEmissaoEtiquetas.OperacaoPadrao (delphi/apps/estoque/fmemissaoetiquetas.pas:2189-2205) filtra os documentos, gera a consulta e executa a impressão. O relatório de volume é frxEtiquetasNfSaidaVolumes; ImprimirEtiquetasNfSaidaVolumes carrega o FastReport e chama ShowReport(true) (delphi/apps/estoque/dmemissaoetiquetas.pas:7589-7600). O Delphi possui ramificações de impressora por ParSistema.TipoImpressoraEtiqueta; não foi localizado um fallback PDF equivalente.

7. **Laravel — decisão para a próxima spec.** O Laravel já projeta a linha fiscal de volume em TransporteOperacionalTransferenciaMapper, LegacyDadosFiscaisNotasWriteRepository e TransferenciaFiscalProjetarDocumentoLegadoService, mas não foi localizado no fluxo de emissão o preenchimento de modoinclusaoromaneio, a pergunta, a criação/vínculo de romaneio ou um artefato PDF de etiqueta. Nesta etapa, a especificação deve manter PDF como saída, sem envio automático a impressora; deve tratar o romaneio por contrato do trigger existente, sem reimplementar incluir_romaneio; e deve limitar as etiquetas a volumes.

Pesquisa detalhada: .scratch/transferencia-requisicao-emissao-fiscal-wayfinder/research/26-romaneio-etiquetas-volumes.md.

Nenhum código de aplicação foi implementado.
