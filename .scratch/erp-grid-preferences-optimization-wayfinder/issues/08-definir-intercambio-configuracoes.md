# Definir exportação e importação de configurações do grid

Type: grilling
Status: resolved
Blocked by: 02, 03

## Question

Qual contrato JSON versionado, nome/extensão de arquivo, limites de tamanho, validações e mensagens deve sustentar `Exportar configurações` e `Importar configurações` no menu de contexto, contendo somente visibilidade, ordem, larguras e títulos do grid atual; e como aplicar a importação do mesmo `gridId` como rascunho saneado no picker, com defaults para colunas ausentes, descarte de colunas desconhecidas/não autorizadas, substituição somente após confirmação e nenhuma gravação ao cancelar ou diante de arquivo inválido?

## Answer

### Linguagem e identidade

- **Arquivo de Configuração de Grid** é a fotografia portátil da apresentação de um único grid, sem identidade de Usuário, usada somente para intercâmbio explícito.
- **Preferência de Grid** continua sendo o estado durável pertencente a um Usuário.
- O termo foi registrado no CONTEXT.md.
- Nas variantes, a identidade exportada é o preferencesGridId efetivo. Ela é tratada como gridId do arquivo, impedindo intercâmbio entre variantes diferentes do mesmo grid base.

### Envelope e arquivo

O contrato inicial contém format = teclux.erp-grid-preferences, formatVersion = 1, gridId efetivo, gridSchemaVersion da origem e layout com columnVisibility, columnOrder, columnSizing e columnTitles.

- formatVersion versiona o contrato de intercâmbio; gridSchemaVersion informa a versão do Catálogo de Grid na origem, sem impedir a reconciliação com o catálogo atual.
- Não incluir screen_key, identidade do Usuário, dados do grid, filtros, momento de exportação ou informação sensível.
- Nome: teclux-grid-{gridId-efetivo}.json, substituindo caracteres inadequados por hífen.
- Gerar UTF-8 sem BOM, JSON identado com dois espaços e quebra de linha final.
- Importar UTF-8 com ou sem BOM; rejeitar conteúdo que não possa ser decodificado como UTF-8.
- Limite máximo de 256 KB, verificado antes do parse.

### Fotografia exportada

- columnOrder contém todos os columnId configuráveis e autorizados na ordem efetiva.
- columnVisibility contém booleano para cada uma dessas colunas.
- columnSizing contém a largura efetiva de cada uma, já limitada pelo catálogo.
- columnTitles permanece mapa esparso somente de Títulos Personalizados efetivos.
- Colunas técnicas ou fixas ficam totalmente fora do arquivo.
- A extensão .json orienta o seletor, mas segurança nunca depende de extensão ou MIME.

Exportar configurações usa somente estado persistido. Havendo commit de resize ou outra gravação pendente, deve concluí-la e aguardar sucesso; então o backend gera o arquivo a partir da Preferência de Grid saneada e do catálogo autorizado. Se a gravação falhar, a exportação não entrega silenciosamente uma versão anterior.

### Compatibilidade e validação

- Aceitar somente format = teclux.erp-grid-preferences e formatVersion = 1.
- Recusar integralmente versão futura/desconhecida. Campos extras desconhecidos podem ser ignorados na versão 1.
- Recusar integralmente JSON ilegível, envelope ausente, gridId diferente do efetivo atual ou campos estruturais com tipos incorretos.
- Nunca inferir ou aceitar identidade de coluna a partir do arquivo. Backend resolve o catálogo da tela, grid e variante atuais e aplica a allowlist do Usuário autenticado.
- Colunas desconhecidas, removidas, não autorizadas ou técnicas são descartadas e contabilizadas no aviso.
- Valores de largura e título seguem a mesma normalização e limites da Preferência de Grid; valor irrecuperável é descartado e recebe o default do catálogo.
- Em columnOrder, a primeira ocorrência de um ID duplicado vence; repetições são descartadas e contabilizadas.
- Payloads acima dos limites estruturais já definidos para a Preferência de Grid, inclusive máximo de 80 IDs, são rejeitados ou saneados conforme a natureza estrutural ou por-coluna da falha.

### Preparação e confirmação da importação

A importação usa um endpoint backend de validar e preparar prévia, sem persistência. Ele recebe o arquivo, resolve Usuário, Catálogo de Grid e variante, devolvendo somente o rascunho autorizado, avisos seguros e a revisão atual da Preferência de Grid.

O rascunho nasce dos defaults do catálogo atual. Visibilidade, largura e título válidos do arquivo são sobrepostos; a ordem importada válida vem primeiro; colunas atuais ausentes são acrescentadas ao final na ordem do catálogo. Por exemplo, ordem importada B, A e catálogo atual A, B, C, D resultam em B, A, C, D.

No picker, visibilidade e títulos são editáveis. Ordem e larguras importadas aparecem na prévia do grid atrás do modal e em resumo, mas não adicionam controles ao picker compacto. Cancelar, backdrop ou Escape restauram a fotografia inteira anterior, inclusive ordem e larguras, sem gravação.

O banner da prévia mostra nome do arquivo, grid identificado, quantidades aplicadas, descartadas e normalizadas, além do aviso de substituição integral da preferência desse grid. Detalhes mostram apenas motivos seguros e columnId, sem reproduzir conteúdo potencialmente malicioso. Se nada válido puder ser aproveitado, Confirmar fica desabilitado.

Somente Confirmar persiste atomicamente a seção completa pelo fluxo normal. O modal fecha após sucesso; em falha permanece aberto com o rascunho. A confirmação usa a revisão devolvida na prévia; se outra sessão alterar a preferência nesse intervalo, não sobrescreve e exige reabrir a importação.

### Mensagens

- Tamanho: O arquivo excede o limite de 256 KB.
- Extensão: Selecione um arquivo JSON de configurações.
- Leitura ou JSON inválido: Não foi possível ler o arquivo de configurações.
- Formato incorreto: O arquivo selecionado não é uma configuração de grid válida.
- Versão: Esta versão do arquivo de configurações não é compatível com o sistema.
- Grid diferente: Esta configuração pertence a outro grid e não pode ser importada aqui.
- Estrutura: O arquivo contém uma estrutura de configurações inválida.
- Prévia saneada: Configuração carregada com ajustes. Revise antes de confirmar.
- Conflito: As configurações deste grid foram alteradas em outra sessão. Reabra a importação para revisar a versão atual.
- Sucesso: Configurações do grid importadas com sucesso.
- Falha de exportação: Não foi possível exportar as configurações deste grid. Tente novamente.
- Falha ao salvar antes de exportar: Não foi possível salvar as alterações antes da exportação. Tente novamente.

Motivos técnicos e identificadores de correlação ficam em log. Em exportação bem-sucedida o download começa diretamente, sem toast. Durante cada operação, as opções correspondentes ficam desabilitadas para impedir duplicidade.

### Testes mínimos derivados

- round trip da fotografia canônica e nome de arquivo saneado;
- variante usa preferencesGridId e recusa outra variante;
- UTF-8 com e sem BOM, encoding inválido e limite de 256 KB;
- formato, versão, gridId, envelope e tipos inválidos;
- campos extras ignorados em versão compatível;
- coluna desconhecida, removida, técnica ou não autorizada descartada;
- título, largura, quantidade de IDs e ordem duplicada saneados;
- colunas ausentes recebem defaults e são anexadas na ordem do catálogo;
- exportação aguarda persistência pendente e aborta se ela falhar;
- prévia não grava; Cancelar restaura tudo; Confirmar substitui somente a seção atual;
- conflito de revisão impede overwrite;
- conteúdo malicioso nunca é ecoado como HTML nem usado para inferir identidade;
- usuário e screen_key nunca aparecem no arquivo.

Não foi criado ADR: o formato é explicitamente versionado e sua evolução é compatível e localizada no módulo compartilhado.
