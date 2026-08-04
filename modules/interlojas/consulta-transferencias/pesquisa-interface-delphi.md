# Pesquisa da interface Delphi — Consulta de Transferências

## Escopo e fontes

Inventário obtido exclusivamente das fontes primárias `fmconsultatransferencias.pas` (206 linhas) e `fmconsultatransferencias.dfm` (843 linhas), ambas em `C:\projetos.vcl\apps\interlojas`. Comportamentos internos dos componentes herdados e do frame `TfraListaFiliais` não são inferidos.

## Estrutura e estado inicial

- Formulário MDI filho, título **Consulta Transferências**, visível e com foco inicial em `edtDataInicial` (`fmconsultatransferencias.dfm:1-15`).
- Há duas páginas: **Parâmetros**, inicialmente ativa, e **Registros Selecionados**; as letras `P` e `e` são mnemônicos declarados nas captions (`fmconsultatransferencias.dfm:93-104`, `fmconsultatransferencias.dfm:354-356`).
- Ao criar a tela, o data module é instanciado. A data inicial recebe `DataServidor - edtNumerodedias` quando o valor do controle já for diferente de zero; caso contrário recebe `DataServidor - 180`. A final recebe `DataServidor` (`fmconsultatransferencias.pas:80-92`). O DFM não declara valor inicial para número de dias; limita-o a inteiro não negativo de três algarismos (`fmconsultatransferencias.dfm:226-247`).

## Filtros e seleção

- **Período**: data inicial, data final e número de dias (`fmconsultatransferencias.dfm:159-248`). Somente as duas datas participam diretamente da geração; número de dias só influencia a inicialização no construtor (`fmconsultatransferencias.pas:85-92`, `fmconsultatransferencias.pas:171-172`).
- **Situação**: Aberta, Fechada, Confirmada e Cancelada; nenhuma aparece marcada no DFM, logo o estado local declarado é desmarcado (`fmconsultatransferencias.dfm:112-158`). No envio, o mapeamento é Aberta→`Situacao_A`, Confirmada→`Situacao_D`, Cancelada→`Situacao_C`, Fechada→`Situacao_F` (`fmconsultatransferencias.pas:171-176`).
- **Curva ABC**: A, B, C e Não Definido começam marcadas (`fmconsultatransferencias.dfm:249-330`) e são copiadas individualmente para o data module (`fmconsultatransferencias.pas:179-182`).
- Dois frames distintos selecionam **Filiais Requisitadas** e **Filiais Requisitantes** (`fmconsultatransferencias.dfm:332-350`). A consulta recebe primeiro a lista de requisitantes e depois a de requisitadas (`fmconsultatransferencias.pas:184-185`). Cardinalidade, valor inicial e regra de “todas” pertencem ao frame e não são comprováveis por estas duas fontes.

## Validação e geração

- `ValidarInformacao` chama `ecvValida.Verify` sobre o grupo de período, e o validador registra data final e inicial (`fmconsultatransferencias.pas:200-203`, `fmconsultatransferencias.dfm:832-839`). Regras adicionais internas de `TtecEditionControlValidation` não estão nestas fontes.
- O limite mínimo de ambas as datas é substituído em runtime por `NDiasLimiteEmissao`; cada campo recebe callback de mensagem próprio (`fmconsultatransferencias.pas:94-98`).
- A mensagem da data inicial trata data menor ou igual à contábil e data anterior a `DataLocal - Minimo`; a da final trata data menor ou igual à contábil e data final anterior à inicial (`fmconsultatransferencias.pas:131-152`). As callbacks exibem avisos; a forma como o componente impede ou aceita continuidade não é demonstrada aqui.
- O botão **Gerar F6**, com ícone embutido e hint “Gerar Informações => F6”, executa `sbnGerarClick` (`fmconsultatransferencias.dfm:44-90`). F6 sem Ctrl aciona o botão apenas quando habilitado (`fmconsultatransferencias.pas:154-162`).
- Após validação, filtros e listas são enviados a `GerarConsultaRequisicao`. Retorno falso mostra aviso de nenhum registro e devolve foco à data inicial; retorno verdadeiro abre **Registros Selecionados** e foca a grade (`fmconsultatransferencias.pas:164-198`).
- Não há, nestas fontes, botões locais de inclusão, edição, exclusão, confirmação/cancelamento de transferência ou exportação. O botão procurar herdado é ocultado (`fmconsultatransferencias.dfm:30-43`).

## Resultado e grade

- A grade usa `dsrPedidosFiliais`, permite ordenação (`DenySort=False`), mostra número da linha, alterna cor de linhas e proíbe exclusão; não é possível comprovar exportação ou personalização pelo formulário (`fmconsultatransferencias.dfm:357-391`).
- Campos declarados, na ordem: `codigo`, `situacao`, `descricaosituacao`, `data`, `hora`, `produto`, `produtovisual`, `descricaoproduto`, `resultadocurvaabc`, `valorgrade1`, `valorgrade2`, `linha`, `coluna`, `cst_produto`, `csosn_produto`, `piscst_produto`, `cofinscst_produto`, `requisitante`, `nomefilialrequisitante`, `requisitada`, `nomefilialrequisitada`, `estoquerequisitada`, `reservapreviarequisitada`, `qtdepedida`, `qtderecebida`, `estoquerequisitante`, `lotetransferencia`, `datanota`, `filialnota`, `serienota`, `numeronota`, `observacao` (`fmconsultatransferencias.dfm:392-801`).
- `valorgrade1` e `valorgrade2` ficam visíveis somente quando `ParSistema.UsarGradesProdutos`; seus títulos são atualizados pelo evento do data module para `LinhadaGrade` e `ColunadaGrade` (`fmconsultatransferencias.pas:73-78`, `fmconsultatransferencias.pas:100-105`).
- `estoquerequisitante` fica visível somente quando `ParSistema.RequisicaoSubtraiEstoque` (`fmconsultatransferencias.pas:103-104`). Cinco colunas quantitativas têm largura mínima igual a `ParSistema.TamanhoMascaraQuantidade` (`fmconsultatransferencias.pas:107-120`).
- A observação também aparece em memo vinculado ao registro corrente, abaixo da grade (`fmconsultatransferencias.dfm:803-828`). Não há evento de gravação local, portanto deve ser tratada como apresentação até outra fonte provar edição.

## Ambiguidades e possíveis bugs a preservar nos prompts

- **Número de dias não é filtro enviado**: ele só é lido no construtor; não há evento local que recalcule a data inicial após edição (`fmconsultatransferencias.pas:85-92`, `fmconsultatransferencias.pas:164-185`). Classificar como ambiguidade de UX, sem inventar vínculo reativo no Laravel.
- **Códigos de situação não intuitivos**: Confirmada usa `D` e Fechada usa `F`; os prompts devem preservar o mapeamento e pedir confirmação sem “corrigi-lo” (`fmconsultatransferencias.pas:173-176`).
- **Possível despacho herdado duplicado**: `KeyDown` chama `inherited` antes do `case` e novamente no ramo `else`; teclas diferentes de F6 podem chegar duas vezes à classe ancestral (`fmconsultatransferencias.pas:154-161`).
- **Legenda possivelmente incorreta**: o campo `estoquerequisitada` tem caption `EST. REQUISITANTE`, embora exista separadamente `estoquerequisitante` com caption `ESTOQUE REQUISITANTE` (`fmconsultatransferencias.dfm:662-674`, `fmconsultatransferencias.dfm:712-724`). Não normalizar sem decisão funcional.
- **Grade e colunas de grade coexistem**: `valorgrade1/2` têm títulos dinâmicos, enquanto `linha/coluna` permanecem sempre declaradas visíveis (`fmconsultatransferencias.dfm:509-563`, `fmconsultatransferencias.pas:100-105`). A semântica e eventual redundância exigem confirmação do data module/SQL.
- **Ausência de situações selecionadas**: os quatro checkboxes de situação iniciam sem `Checked=True`; o significado de nenhum selecionado depende da consulta do data module (`fmconsultatransferencias.dfm:126-157`, `fmconsultatransferencias.pas:173-176`).
- **Datas usam referências diferentes**: inicialização usa `DataServidor`, mas o limite retroativo da mensagem usa `DataLocal` (`fmconsultatransferencias.pas:85-92`, `fmconsultatransferencias.pas:148-151`). Preservar como possível divergência de relógio/fuso.
- **Exportação/personalização não comprovadas**: o DFM prova ordenação, numeração e aparência, mas não comandos de exportar/personalizar (`fmconsultatransferencias.dfm:357-391`). Esses recursos devem vir do padrão Laravel do projeto, não ser atribuídos ao legado.
