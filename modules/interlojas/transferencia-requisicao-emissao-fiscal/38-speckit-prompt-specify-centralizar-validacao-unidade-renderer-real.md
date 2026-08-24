# Prompt 38 para `/speckit.specify` — centralizar validação de unidade e fechar renderer real

## Contexto

O prompt 37 foi implementado e os testes direcionados passaram:

- `NFePHP\\DA\\NFe\\DanfeSimples` gera PDF para `nfeProc` autorizado;
- o perfil `simplificada` gera artefato distinto do perfil `padrao`;
- a falha da simplificada não altera a autorização nem retransmite a NF-e;
- unidades vazias ou maiores que seis caracteres bloqueiam a preparação principal;
- unidades válidas são projetadas para os campos fiscais legados.

Não refazer a implementação da DANFE simplificada nem da DANFE padrão. O objetivo deste prompt é fechar uma lacuna de consistência encontrada após a revisão.

Não incluir equivalência da fotografia com XML legado, IBS, CBS, NFS-e, NFC-e, etiquetas, impressão automática, cancelamento ou inutilização.

O Cursor deve trabalhar somente com o código Laravel atual e não procurar fontes Delphi.

## Lacuna encontrada

`UnidadeFiscalNfe::normalizar()` já é usada por `TransferenciaFiscalPrepararFotografiaService`, mas existem caminhos auxiliares que ainda fazem apenas `trim()` ou verificam somente se a unidade não está vazia:

- `TransferenciaFiscalPlatformAdapter::normalizeCandidata()`;
- `NfePhpFotografiaSerializer::tagItem()`.

Assim, uma chamada direta a esses componentes pode aceitar `uCom` ou `uTrib` com mais de seis caracteres, contrariando o contrato do prompt 37 e podendo produzir XML inválido.

## Requisitos

### 1. Uma única regra fiscal

Usar `UnidadeFiscalNfe` como regra única para `uCom` e `uTrib` em todos os caminhos que possam chegar à selagem ou ao XML.

A regra deve:

- aparar espaços nas extremidades;
- rejeitar vazio;
- rejeitar mais de seis caracteres;
- não truncar;
- não converter silenciosamente a unidade;
- retornar a representação validada para ser reutilizada nos campos seguintes.

Não duplicar regras divergentes com `strlen`, `substr`, `mb_substr` ou validações locais equivalentes.

### 2. Adapter de transferência

Em `TransferenciaFiscalPlatformAdapter::normalizeCandidata()`:

- validar `u_com` usando `UnidadeFiscalNfe`;
- validar `u_trib` usando a mesma regra;
- quando `u_trib` estiver ausente, usar a unidade comercial já validada;
- preservar unidades tributáveis diferentes da comercial quando ambas forem válidas;
- propagar erro com contexto suficiente para identificar item, produto e campo;
- impedir criação/selagem de documento quando a unidade for inválida.

Não alterar quantidades, preços, CFOP, impostos ou agrupamento fiscal.

### 3. Serializer NFePHP

Em `NfePhpFotografiaSerializer::tagItem()`:

- validar efetivamente `uCom` antes de atribuí-lo ao objeto NFePHP;
- validar efetivamente `uTrib` antes de atribuí-lo ao objeto NFePHP;
- preservar os fallbacks de origem já existentes somente depois da validação;
- converter a exceção para o erro fiscal/pêndencia já adotado pelo serializer, sem expor stack trace;
- garantir que nenhum XML seja montado com unidade vazia ou maior que seis caracteres.

O serializer não deve corrigir automaticamente o cadastro nem truncar valores.

### 4. Renderer simplificado real

Adicionar um teste de integração/unitário do gateway real `NfePhpFiscalGateway::renderDanfeSimplificadaFromXml()`, usando fixture `nfeProc` autorizada, que comprove:

- suporte somente ao modelo 55;
- uso efetivo de `NFePHP\\DA\\NFe\\DanfeSimples`;
- PDF não vazio iniciado por `%PDF`;
- `rendererId` e `rendererVersion` próprios da simplificada;
- erro claro para modelo diferente de 55;
- nenhum efeito fiscal ou retransmissão em caso de falha.

Manter o teste de contrato direto do NFePHP e os testes de artefato já existentes.

## Testes obrigatórios

Criar ou ajustar testes para provar:

- adapter rejeita `u_com` vazio;
- adapter rejeita `u_com` acima de seis caracteres;
- adapter rejeita `u_trib` acima de seis caracteres;
- adapter preserva `u_com` e `u_trib` diferentes quando válidos;
- serializer rejeita unidade vazia e unidade acima de seis caracteres quando chamado diretamente;
- nenhum caminho direto contorna `UnidadeFiscalNfe`;
- preparação principal continua gerando a pendência `UNIDADE_FISCAL_INVALIDA` antes de reservar número;
- gateway real gera a DANFE simplificada por NFePHP para modelo 55;
- modelo 65 não é tratado como DANFE simplificada modelo 55;
- DANFE padrão, transmissão, XML autorizado e IBS/CBS permanecem fora das alterações deste prompt.

Executar os testes no container PHP com memória suficiente para o renderer. Não chamar a SEFAZ real.

## Critérios de aceite

1. Todo caminho de transferência que alcance XML usa a mesma validação de unidade.
2. Nenhuma unidade inválida chega ao NFePHP.
3. Não há truncamento silencioso.
4. `uCom` e `uTrib` válidos permanecem consistentes com a fotografia e a projeção legada.
5. O gateway real da DANFE simplificada está coberto por teste.
6. A DANFE simplificada existente continua usando `nfephp-org/sped-da`.
7. Não há alteração em transmissão, autorização, estoque, equivalência XML, IBS ou CBS.

## Entrega

Produzir a especificação de implementação, indicando arquivos, contratos de exceção, testes e critérios de aceite.

Não implementar código durante `/speckit.specify`.
