# Pesquisa 26 — Romaneio e etiquetas de volumes no encerramento

Data da pesquisa: 2026-08-20

## Resposta executiva

- **CONFIRMADO:** existe pergunta para incluir a NF-e em romaneio, mas ela não está escrita diretamente no método ConfirmaRequisicao. Ela é executada pela rotina genérica Perpetrar, depois da persistência, somente quando o parâmetro ParSistema.Incluir_nota_entre_filiais_automaticamente_nos_romaneios está habilitado e a NF-e atende aos critérios legados.
- **CONFIRMADO:** a pergunta oferece a decisão de não incluir, incluir em romaneio existente ou criar/incluir em novo romaneio. O código grava modoinclusaoromaneio = 2 para a opção de romaneio existente e modoinclusaoromaneio = 1 para a opção de novo romaneio.
- **CONFIRMADO:** o trigger dadosfiscais_incluirromaneio, no PostgreSQL, chama incluir_romaneio(cliente, tipocliente, numero, filialemissao, modoinclusaoromaneio). Assim, a criação do romaneio e o vínculo da NF são responsabilidade da função de banco acionada pelo trigger; o método Delphi não faz um INSERT direto em romaneiosnotas nessa etapa.
- **CONFIRMADO:** após terminar as NF-e do encerramento, ConfirmaRequisicao abre TfrmEmissaoEtiquetas com a operação Imprimir Volumes NF Saída, passando a lista dos dadosfiscais gerados.
- **CONFIRMADO:** a etiqueta desse caminho é de volume, não de produto. A quantidade de linhas impressas é expandida por generate_series(1, volumes), com fallback para uma etiqueta quando volumes é nulo ou zero.
- **NÃO LOCALIZADO:** não há fallback PDF no caminho Delphi de etiquetas. Para o relatório de volumes, FastReport abre a visualização/relatório; para outros tipos de impressora há rotinas de impressão direta ou seleção de impressora. O Laravel deve permanecer em PDF nesta etapa, sem integração automática com impressoras.

## Evidências Delphi

### Pergunta de romaneio

delphi/repositorio/dmbasico.pas:1738-1785 verifica o parâmetro global e, quando qryDadosFiscais contém modoinclusaoromaneio nulo, a NF-e é elegível e a situação é N, chama:

MensagemSimNaoOpcaoCancelar('Incluir esta Nota Fiscal em um romaneio?','Não Incluir',false, 'Existente', 'Novo').

As opções são persistidas como:

- 2: romaneio existente;
- 1: novo romaneio;
- cancelamento: não altera o modo.

O dataset da Transferência contém df.modoinclusaoromaneio em delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.dfm:734, e a emissão inclui qryDadosFiscais no Perpetrar em delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:1917.

No schema autoritativo, modules/entregas/relatorio-entregas/schema/postgresql-authoritative-2026-08-19.json:11062-11068, o trigger é:

AFTER INSERT OR UPDATE ON dadosfiscais ... dadosfiscais_incluirromaneio().

A função do trigger chama incluir_romaneio(...). O corpo de incluir_romaneio não está disponível nos fontes Delphi pesquisados; portanto, não se deve inventar seus detalhes internos além do contrato observado.

### Encaminhamento e impressão dos volumes

Em delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:978-985, no finally de ConfirmaRequisicao, se houver documentos gerados, o Delphi chama:

MostrarFormRegistrado([lista, 'Imprimir Volumes NF Saída'], 'TfrmEmissaoEtiquetas', True).

delphi/apps/estoque/fmemissaoetiquetas.pas:2189-2205 recebe essa operação, marca a opção de imprimir volumes, filtra a lista de dadosfiscais, gera a consulta e executa a impressão sem exigir seleção manual nessa abertura.

### Origem e cardinalidade dos volumes

delphi/apps/interlojas/dmtransferenciarequisicaoexposicao.pas:872-892 grava uma linha em volumesdadosfiscais para o dadofiscal, com codigo = 1, quantidade de volumes, pesos, numeração, marca e espécie de transporte. O dataset faz parte do Perpetrar em :1917.

delphi/apps/estoque/dmemissaoetiquetas.dfm:2678-2800 consulta volumesdadosfiscais, faz generate_series(1, coalesce(nullif(vodf.volumes,0),1)) as nrvolume e busca o romaneio mais recente em romaneiosnotas. Cada registro expandido representa uma etiqueta de volume: nrvolume/volumes, chave da NF-e, filial, destinatário, marca, espécie e romaneio.

O relatório usado é frxEtiquetasNfSaidaVolumes; delphi/apps/estoque/dmemissaoetiquetas.pas:7589-7600 carrega o arquivo FastReport, quando existente, e chama ShowReport(true). Na tela, actImprimirExecute escolhe as rotinas de impressora por ParSistema.TipoImpressoraEtiqueta; se o tipo for Jato e o relatório de volumes for selecionado, chama ImprimirEtiquetasNfSaidaVolumes (delphi/apps/estoque/fmemissaoetiquetas.pas:1065-1080).

Não foi localizada, nesse caminho, chamada para etiqueta de produto. Existem outras abas e rotinas de etiquetas de produto na tela geral, mas não participam da operação Imprimir Volumes NF Saída.

## Comparação com o Laravel atual

O Laravel já possui a projeção fiscal dos volumes:

- laravel/backend/app/Domain/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransporteOperacionalTransferenciaMapper.php:126-145 mapeia uma única linha com codigo = 1;
- laravel/backend/app/Infrastructure/Fiscal/Persistence/LegacyDadosFiscaisNotasWriteRepository.php:287-325 substitui a linha de volumesdadosfiscais;
- laravel/backend/app/Application/Interlojas/TransferenciaRequisicaoEmissaoFiscal/TransferenciaFiscalProjetarDocumentoLegadoService.php:48-56 grava a projeção antes de inserir a NF-e legada.

Não foi localizado no fluxo TransferenciaRequisicaoEmissaoFiscal o preenchimento de modoinclusaoromaneio, a pergunta de inclusão, a criação de romaneio ou a geração de PDF de etiqueta de volume. O Laravel possui módulos posteriores de confirmação por notas/romaneios que leem romaneiosnotas, volumesdadosfiscais e volumesdadosfiscaisconferencia, mas isso não prova que a emissão de Transferência deva criar o romaneio automaticamente sem aplicar a decisão do parâmetro e da pergunta do Delphi.

## Decisão para a próxima especificação

O próximo prompt deve tratar separadamente:

1. compatibilidade do parâmetro e da decisão de inclusão em romaneio, deixando claro que a decisão ocorre depois da persistência fiscal e antes da abertura das etiquetas;
2. criação/vínculo por contrato de banco existente, sem reimplementar a função incluir_romaneio no domínio Laravel;
3. PDF de etiquetas de volumes, expandido pela quantidade declarada, somente como artefato acionado pelo operador;
4. ausência de etiquetas de produto nesse caminho;
5. impressão automática em impressora como etapa posterior.

Nenhum código foi implementado nesta pesquisa.
