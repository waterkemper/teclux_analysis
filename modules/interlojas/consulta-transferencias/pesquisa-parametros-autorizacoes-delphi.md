# Pesquisa: parâmetros, autorizações e acesso da Consulta de Transferências

## Escopo e conclusão

Foram inspecionadas as unidades primárias `fmconsultatransferencias.pas/.dfm` e `dmconsultatransferencias.pas/.dfm`, `clparametrossistema.pas` e somente os suportes necessários: `dmbasico.pas`, `frlistafiliais.pas`, `clusuario.pas` e `rginterlojas.pas`.

Não existe chamada a `parametros_valor(descricao, filial)` nas quatro unidades específicas da consulta nem em `clparametrossistema.pas`. A tela usa propriedades tipadas de `ParSistema`, indexadas internamente por descrições literais. Os literais abaixo devem ser traduzidos para o padrão Laravel; não se deve inventar uma chamada literal inexistente.

## Parâmetros efetivamente usados

| Literal | Semântica | Evidência |
|---|---|---|
| `USAR GRADES PRODUTOS` | Booleano; mostra/oculta `valorgrade1` e `valorgrade2`. | `C:\projetos.vcl\biblio\clparametrossistema.pas:2075,7487-7489`; `C:\projetos.vcl\apps\interlojas\fmconsultatransferencias.pas:100-101`. |
| `REQUISICAOSUBTRAIESTOQUE` | Booleano; controla a visibilidade da coluna de estoque da filial requisitante. | `clparametrossistema.pas:2004,4233-4235`; `fmconsultatransferencias.pas:103`. |
| `Máscara Quantidade` | String; origina o formato das quantidades e a largura mínima das colunas. `TamanhoMascaraQuantidade` é `length(MascaraQuantidade) * 7`. | `clparametrossistema.pas:2132,7848-7865,7869-7872`; `dmconsultatransferencias.pas:108-112`; `fmconsultatransferencias.pas:107-120`. |
| `DATA CONTABIL` | Data/string; fronteira contábil usada nas mensagens/validação das datas. | `clparametrossistema.pas:1969,2606-2609,4957-4960`; `fmconsultatransferencias.pas:133-146`. |
| `DIASNOTARETROATIVA` | Inteiro; afeta indiretamente `NDiasLimiteEmissao`, que usa o menor valor entre dias retroativos e o limite derivado da data contábil. | `clparametrossistema.pas:2128,7790-7792`; `C:\projetos.vcl\repositorio\dmbasico.pas:3522-3527,3583-3588`; `fmconsultatransferencias.pas:94-97`. |
| `Relatório Somente Filiais Autorizadas` | Booleano, exceto para administrador/suporte; usado indiretamente pelo frame de filiais. Sem seleção, devolve a lista liberada. | `clparametrossistema.pas:2155,7944-7947`; `C:\projetos.vcl\repositorio\frlistafiliais.pas:100-115`. |

### Semântica por filial

`TtecParametrosSistema.setFilial` propaga a filial ativa à lista (`clparametrossistema.pas:3622-3625`). O item é configurado com essa filial (`:7314-7317`). A leitura tenta primeiro o valor específico e, quando `ValorGlobal` permite, recorre à filial global `-1` (`:7143-7152`). O Laravel deve preservar a precedência **filial específica → global**.

## Filiais e autorização de dados

A tela usa dois `TfraListaFiliais`, para requisitantes e requisitadas (`fmconsultatransferencias.pas:38-39`), e envia as listas separadamente (`:184-185`). A consulta cria filtros independentes em `pf.requisitante` e `pf.requisitada` (`dmconsultatransferencias.pas:123-131`).

O frame carrega `ListaFiliais` e marca inicialmente a filial base para usuário não administrador (`frlistafiliais.pas:50-63`). A restrição autorizada aparece como fallback quando nada é selecionado e o parâmetro está ativo (`:100-115`). No Laravel, a autorização deve ser imposta no servidor para ambos os papéis.

Não foi localizada regra adicional específica do módulo que limite filial. Isso é ausência verificada no módulo e frame diretamente chamado, não prova de inexistência em camadas que inicializam `ListaFiliaisLiberada`.

## Acesso ao menu e usuário

A form é registrada como `TfrmConsultaTransferencias` em `C:\projetos.vcl\apps\interlojas\rginterlojas.pas:17-23`. O acesso geral carrega `acessosmodulos.nomemenu`, unindo concessões diretas de `usuariosacessosmodulos` e de grupo em `gruposusuariosacessosmodulos` (`C:\projetos.vcl\biblio\clusuario.pas:332-344`), e materializa os nomes numa lista (`:612-623`).

Não foi localizado seed/registro que associe literalmente “Consulta Transferências” ou a classe a um código de `acessosmodulos`. Há evidência do mecanismo e registro da classe, mas não do código específico. O Laravel deve criar explicitamente o acesso **Interlojas → Consulta de Transferências**, com concessão por usuário/grupo, sem presumir código.

A form não consulta `UsuarioLogin` nem exige autorização operacional adicional. Além do menu e escopo de filiais, nenhuma permissão de ação específica foi localizada.

## Regras para a especificação Laravel

1. Resolver os parâmetros pelos literais acima, com filial corrente e fallback global.
2. Aplicar autorização do menu no backend e ocultar o item sem acesso.
3. Intersectar no backend as filiais pedidas com as autorizadas, separadamente para requisitante e requisitada.
4. Preservar a exceção comprovada de administrador/suporte apenas onde aplicável.
5. Tratar qualquer parâmetro ou permissão adicional como decisão nova, não como regra legada.
