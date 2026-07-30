# Inventariar o fluxo fiscal de saída no Delphi e no Laravel

Type: task
Status: resolved
Blocked by:

## Question

Quais pontos criam `dadosfiscais` e `notas`, avançam `seriesfiliais`, formam XMLs, acionam UniNFe/UniDANFE, reconciliam retornos, imprimem DANFE e controlam pendências e eventos; e quais tabelas, transações, diretórios e integrações o Laravel precisa preservar ou substituir?

## Answer

### Limites e origens

Não existe um único fluxo fiscal de saída no Delphi. Contratos, frente de caixa/NFC-e, notas avulsas, devoluções, transferências e notas complementares preparam registros próprios e convergem parcialmente em `TdtmControleNotasFiscaisEletronicas` e `TTecNotaFiscalEletronica`. O controlador central também suporta entrada e NFS-e; portanto ele não pode ser portado como uma unidade sem carregar responsabilidades fora do destino.

### Persistência e numeração antes da SEFAZ

- NF-e de saída é representada conjuntamente por `dadosfiscais` e `notas`; produtos, vencimentos, volumes, lacres, serviços, movimentos, impostos e referências vivem em tabelas auxiliares.
- Os fluxos selecionam `seriesfiliais` por Filial e Série com `FOR UPDATE`.
- A criação atribui `notas.numero := seriesfiliais.numeroinicial`, vincula `notas.dadofiscal`, incrementa `numeroinicial` e inclui tudo no mesmo `Perpetrar(...)`/commit. Isso aparece, por exemplo, em `dmcadastrocontratos.pas:12133-12142` e `dmemissaonotassaidaavulsas.pas:4558-4568`.
- Contratos confirmam em um commit conjunto `dadosfiscais`, `notas`, produtos, movimentos, vencimentos e as séries (`dmcadastrocontratos.pas:8252-8297`). Frente de caixa e nota avulsa repetem a mesma ideia.
- Logo, a transmissão não participa da transação que consome o número. Falha posterior preserva a nota e a lacuna; não existe devolução segura do número.

### Formação, assinatura e transporte

- `TTecNotaFiscalEletronica.GerarNFe` monta o XML diretamente a partir dos datasets fiscais. O mesmo código contém identificação, emitente, destinatário, itens, tributos, totais, transporte, cobrança, responsáveis técnicos e regras especiais.
- A geração ocorre primeiro em modo de validação e depois em modo efetivo (`dmcontrolenotasfiscaiseletronicas.pas:1601-1672`).
- O ERP grava arquivos em diretórios configurados de envio. UniNFe observa esses diretórios, assina/comunica com a SEFAZ e produz arquivos de lote, erro, protocolo e XML processado em diretórios de retorno, autorizados, erros e `EmProcessamento`.
- `EnviarNFe` e `EnviarNFCe` não chamam um web service: aguardam por arquivos como `<chave>-num-lot.xml`, `<lote>-pro-rec.xml` e `*.err`, com polling, timeout e opções operacionais de aguardar/reiniciar UniNFe/entrar em contingência.

### Reconciliação e estado legado

- A chave é derivada de UF, AAMM, CNPJ emitente, modelo 55/65, série, número, forma de emissão, código aleatório e dígito.
- `ConsultarSituacaoNFe` é usado para recuperar autorização/cancelamento quando a resposta se perde. Ao encontrar protocolo, atualiza `numprotocolonfe`, `statusnfe`, `situacao`, chave, forma de emissão e data de processamento.
- O estado fiscal está achatado em `dadosfiscais`: `chv_nfe`, `ambiente`, `formaemissao`, `codaleatorio`, `numlotenfe`, `numprotocolonfe`, `statusnfe`, `dhprocnfe`, `numcancelamentonfe`, `numinutilizacaonfe` e XMLs principais/de eventos. Não há uma trilha de tentativas durável equivalente.
- O Controle de Notas Fiscais Eletrônicas seleciona pendências e permite gerar, enviar/retransmitir, consultar, cancelar, inutilizar, compartilhar, imprimir e enviar e-mail. A Nota Fiscal Avulsa é outra porta operacional para registros sem autorização.
- NFC-e tem fluxo síncrono e contingência offline (`formaemissao = 9`), com lógica específica para trocar/reconciliar chaves e impedir regeneração depois de resposta ambígua.

### Artefatos, DANFE e distribuição

- O XML autorizado `*-procNFe.xml` é copiado para compartilhamento organizado por ano/mês/dia e renomeado com Filial, Série e número. Cancelamento, inutilização e CC-e produzem artefatos separados.
- Quando o arquivo compartilhado falta, impressão e e-mail podem reconstruí-lo a partir de `dadosfiscais.xmlnfe` ou do XML de evento. Isso confirma que banco e diretório funcionam hoje como fallbacks concorrentes.
- DANFE é gerado/imprimido por ACBr/UniDANFE a partir do XML; NFC-e tem tratamento próprio. O fluxo envia XML/DANFE ao cliente usando credenciais SMTP do Usuário.

### Estado do Laravel

- O Laravel já lê `dadosfiscais`, `notas`, `notaspag` e `seriesfiliais` e mantém telas/configuração de Filial e Série, mas não possui um emissor geral NF-e/NFC-e.
- A integração Marketplace/Magalu apenas consome NF-e já autorizada em `dadosfiscais.xmlnfe`; não forma, assina nem transmite o documento.
- Há stubs SQLite de `seriesfiliais`, `dadosfiscais` e `notas`, mas eles não provam paridade transacional com PostgreSQL nem constituem máquina de estados fiscal.

### Consequência

O Laravel precisa preservar a transação legada que cria a Nota Fiscal de Saída e consome a Série Fiscal, mas introduzir depois dela uma Emissão Fiscal Eletrônica durável. Formação do payload, comunicação SEFAZ, persistência de artefatos, eventos, DANFE e distribuição devem ser portas separadas. Compatibilidade escreve os campos legados; a nova trilha de emissão/tentativas passa a explicar o estado, e o S3 substitui o diretório compartilhado como fonte canônica.
