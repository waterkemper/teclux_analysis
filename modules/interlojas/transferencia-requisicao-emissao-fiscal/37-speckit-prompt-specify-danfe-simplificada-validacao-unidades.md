# Prompt 37 para `/speckit.specify` — DANFE simplificada e validação de unidades

## Objetivo

Preparar a emissão da DANFE simplificada para as NF-e de transferência e reforçar a validação das unidades comerciais e tributáveis antes da geração do XML.

Este prompt parte do estado atual do Laravel, no qual:

- a NF-e modelo 55 é autorizada e transmitida;
- o XML autorizado é persistido em `dadosfiscais.xmlnfe` e na custódia fiscal;
- a DANFE padrão já é gerada corretamente em PDF;
- o PDF padrão pode ser reimpresso e aberto pela tela de transferência;
- o renderer atual usa `nfephp-org/sped-da`;
- a emissão de transferência não deve enviar automaticamente para impressoras.

Não reimplementar transmissão, autorização, numeração, chave NF-e, estoque, transporte, DANFE padrão ou abertura automática já existente, salvo ajustes diretamente necessários para o novo perfil de impressão.

Não incluir neste escopo:

- teste ou correção de equivalência da fotografia fiscal com XML legado;
- IBS ou CBS;
- NFS-e;
- NFC-e modelo 65;
- etiquetas de produtos ou volumes;
- impressão automática;
- cancelamento ou inutilização;
- venda entre filiais ou devolução.

O Cursor deve trabalhar somente com o código Laravel atual e com a documentação/pacotes disponíveis no próprio projeto. Não procurar fontes Delphi.

## Requisitos

### 1. Perfil explícito de impressão

Criar um conceito explícito de perfil de impressão, no mínimo:

- `padrao`: DANFE padrão já existente;
- `simplificada`: DANFE simplificada para NF-e modelo 55.

O perfil padrão atual não pode mudar de comportamento.

O perfil deve ser validado no backend. Não aceitar nomes arbitrários vindos do navegador e não permitir que o perfil altere o XML fiscal, os dados da NF-e, a transmissão ou a autorização.

O perfil deve ser aplicado somente após a NF-e estar autorizada e possuir `nfeProc` íntegro. Uma NF-e rejeitada, pendente ou sem XML autorizado não pode gerar nenhum PDF.

### 2. Renderer da DANFE simplificada

Implementar a DANFE simplificada usando a capacidade efetivamente disponível na versão instalada de `nfephp-org/sped-da` ou, se o pacote não fornecer esse layout diretamente, criar um renderer isolado e compatível com a arquitetura atual.

Antes de escolher a implementação, verificar no container PHP:

- classes e métodos disponíveis no pacote instalado;
- forma correta de configurar o papel, orientação, margens e dimensões;
- limitações do renderer para NF-e modelo 55;
- dados obrigatórios que devem permanecer visíveis no documento.

A DANFE simplificada deve, no mínimo, permitir a identificação inequívoca do documento e da operação, contendo de forma legível:

- chave de acesso;
- número e série;
- data de emissão;
- emitente;
- destinatário/filial;
- itens ou resumo dos itens conforme o layout escolhido;
- quantidades e valores necessários para conferência;
- valor total da NF-e;
- protocolo ou indicação de autorização, quando disponível;
- código de barras da chave, quando suportado pelo renderer escolhido.

Não inventar dados ausentes e não consultar o cadastro atual para alterar o conteúdo de uma NF-e autorizada. O documento deve ser derivado do `nfeProc` arquivado, como ocorre na DANFE padrão.

Se a biblioteca instalada não suportar o layout simplificado de maneira segura, registrar uma pendência técnica explícita e não substituir silenciosamente a DANFE padrão.

### 3. Artefatos e reimpressão

Estender a identidade do artefato para distinguir, no mínimo:

- emissão;
- tipo `danfe_pdf`;
- perfil `padrao` ou `simplificada`;
- hash do XML de origem;
- versão do renderer.

Um PDF padrão nunca pode ser reutilizado como PDF simplificado, e vice-versa.

Manter a idempotência e a custódia atuais:

- gerar no máximo um artefato disponível por combinação de emissão, XML, perfil e versão do renderer;
- reutilizar o artefato correto em reimpressões;
- manter hash, MIME `application/pdf`, storage e URL assinada;
- registrar falha de renderização ou custódia sem retransmitir a NF-e;
- conservar o XML autorizado mesmo quando a geração do PDF falhar.

O endpoint atual de DANFE deve receber um perfil explícito, por exemplo por query string ou rota equivalente, sem quebrar chamadas existentes que solicitam a DANFE padrão. O backend deve retornar o perfil efetivamente usado e o identificador do artefato.

### 4. Tela de transferência

Manter a abertura automática já existente para a DANFE padrão após autorização e disponibilidade do PDF.

Adicionar uma ação explícita para “Abrir DANFE simplificada” somente quando:

- a NF-e estiver autorizada;
- o XML autorizado estiver disponível;
- o perfil simplificado estiver habilitado pelo backend;
- não houver pendência fiscal ou de custódia.

A ação deve abrir o PDF em nova aba, seguindo o mesmo tratamento de popup bloqueado, carregamento e reimpressão da DANFE padrão.

Não abrir duas abas automaticamente para os dois perfis. A DANFE simplificada deve ser uma ação manual, salvo decisão já existente no contrato da tela.

Não alterar o modal operacional atual nem as fases “Verificando status”, “Gerando XML”, “Retorno” e “Gerando DANFE”. Quando a simplificada estiver sendo gerada sob demanda, exibir mensagem específica, como “Gerando DANFE simplificada”, sem mascarar erro de autorização.

### 5. Validação de unidades fiscais

Criar uma única regra de normalização/validação para unidade comercial e tributável, aplicada antes de:

- selar a fotografia fiscal;
- projetar `dadosfiscais` e `produtosdadosfiscais`;
- montar o XML;
- transmitir a NF-e.

Para `uCom` e `uTrib`:

- remover espaços nas extremidades;
- rejeitar valor vazio;
- preservar a unidade de negócio sem conversão silenciosa para outra unidade;
- garantir o limite aceito pelo XML da NF-e, de no máximo seis caracteres;
- usar a mesma unidade validada em fotografia, legado e XML quando não houver regra fiscal específica de conversão;
- preencher `unidadenf` e `tribunidade` com a representação compatível com o legado;
- não truncar silenciosamente uma unidade maior que seis caracteres.

Quando a unidade original exceder o limite ou for inválida, interromper a emissão antes da numeração/selagem definitiva do documento e criar pendência acionável informando o produto, o campo e o valor inválido.

Não alterar `qCom`, `qTrib`, `vUnCom` ou `vUnTrib` neste prompt. IBS/CBS também não fazem parte desta validação.

### 6. Compatibilidade com reimpressão no Delphi

Preservar a gravação do XML autorizado no campo `dadosfiscais.xmlnfe` e os campos legados necessários para o Delphi.

O novo perfil Laravel não deve alterar o XML usado pelo Delphi para reimpressão. A DANFE simplificada será um artefato adicional do Laravel; a DANFE padrão e o `xmlnfe` permanecem compatíveis com o fluxo existente.

## Testes obrigatórios

Criar ou ajustar testes para provar:

- perfil padrão continua gerando o PDF já existente;
- perfil simplificado gera PDF válido para uma NF-e modelo 55 autorizada;
- perfil simplificado não usa ou reutiliza artefato padrão;
- reimpressão reutiliza o artefato correto por perfil, XML e renderer;
- NF-e não autorizada não gera nenhum dos dois PDFs;
- falha do renderer não retransmite nem altera autorização;
- endpoint mantém compatibilidade sem perfil explícito, usando `padrao`;
- ação da tela abre a URL assinada do perfil simplificado em nova aba;
- popup bloqueado mantém o botão manual disponível;
- unidade vazia é rejeitada antes da emissão;
- unidade com mais de seis caracteres gera pendência acionável;
- unidade válida aparece de forma consistente em `uCom`, `uTrib`, `unidadenf`, `tribunidade` e XML;
- valores de quantidade e preço não são alterados pela validação de unidade;
- não há qualquer dependência de equivalência foto/XML, IBS ou CBS nos testes deste prompt.

Os testes devem usar fixtures fiscais autorizadas ou XMLs controlados, sem chamar a SEFAZ real.

## Critérios de aceite

1. A DANFE padrão continua igual ao comportamento atual.
2. O operador consegue solicitar a DANFE simplificada de uma NF-e autorizada e receber um PDF distinto e válido.
3. A reimpressão é idempotente e não cria novos documentos fiscais.
4. O XML autorizado e `dadosfiscais.xmlnfe` não são modificados pela escolha do perfil.
5. Nenhuma unidade inválida chega à selagem ou transmissão.
6. Unidades válidas permanecem consistentes entre fotografia, legado e XML.
7. Não há impressão automática nem integração com etiquetas neste escopo.

## Entrega

Produzir a especificação de implementação com:

- contratos de perfil e endpoint;
- decisão técnica sobre o renderer simplificado disponível;
- identidade e ciclo de vida dos artefatos;
- regras de validação de unidades;
- alterações de backend, frontend e testes;
- critérios de aceite e pendências explícitas.

Não implementar código durante `/speckit.specify`.
