# Pesquisa — SQL e semântica da Consulta de Transferências Delphi

## Escopo e fontes

Inventário baseado integralmente nos fontes primários `dmconsultatransferencias.pas/.dfm` e `fmconsultatransferencias.pas/.dfm`, em `C:\projetos.vcl\apps\interlojas`.

## Dataset e SQL executado

Há um único dataset, `qryPedidosFiliais`, ligado à conexão/transação centrais e exposto por `dsrPedidosFiliais`; ele não é atualizável ao vivo. [dmconsultatransferencias.dfm:7-16](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L7) [dmconsultatransferencias.dfm:147-149](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L147) [dmconsultatransferencias.dfm:312-316](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L312)

A consulta parte de `pedidosfiliais pf`; faz `INNER JOIN` de `filiais fe` pela requisitante, `filiais fa` pela requisitada, e de `produtos p`/`caracteristicas c` pelo produto e característica. Faz `LEFT JOIN` do grupo `dadosfiscais df JOIN notas n` por `pf.dadofiscal=df.numero`; a transferência sem dado fiscal permanece, mas o join interno com nota restringe o grupo fiscal. Cupons estão comentados e não são ativos. [dmconsultatransferencias.dfm:114-135](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L114)

### Projeção

- `pf.*`. Campos persistentes explicitamente consumidos: `codigo`, `produto`, `data`, `hora`, `requisitante`, `requisitada`, `qtdepedida`, `qtderecebida`, `situacao`, `observacao`, `lotetransferencia` e `dadofiscal`. [dmconsultatransferencias.dfm:44](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L44) [dmconsultatransferencias.pas:11-45](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L11)
- Nomes das filiais; código visual, descrição, Curva ABC e valores de grade do produto. [dmconsultatransferencias.dfm:45-51](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L45)
- Descrições de `grades` para `c.grade1` (linha) e `c.grade2` (coluna) por subconsultas escalares. [dmconsultatransferencias.dfm:53-57](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L53)
- Filial, série e número da nota e data do dado fiscal. [dmconsultatransferencias.dfm:59-67](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L59)
- Situação: `A=ABERTA`, `F=FECHADADA` (grafia literal), `D=ATENDIDA`, `C=CANCELADA`. A tela chama D de “CONFIRMADA”, divergência a decidir. [dmconsultatransferencias.dfm:69-80](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L69) [fmconsultatransferencias.dfm:142-155](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.dfm#L142)
- Estoque da requisitante; estoque e reserva prévia da requisitada. Para requisitada tipo `V`, a filial efetiva é `coalesce(fa.filial_estoque,fa.codigo)`; nos demais tipos, `fa.codigo`. São três subconsultas escalares. [dmconsultatransferencias.dfm:82-103](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L82)
- CST por subconsulta em `tributosicms`, e CSOSN/CST PIS/CST COFINS de `caracteristicas`. [dmconsultatransferencias.dfm:105-110](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L105)

Ordenação: `pf.data ASC, pf.hora ASC`, sem desempate por código. [dmconsultatransferencias.dfm:137-145](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L137)

## Macros, filtros e binds

Há cinco macros textuais — `Periodo`, `FiliaisRequisitantes`, `FiliaisRequisitadas`, `Situacao`, `CurvaABC` — inseridas após `where true`. Não há binds declarados; valores viram fragmentos SQL. [dmconsultatransferencias.dfm:17-42](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L17) [dmconsultatransferencias.dfm:137-145](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.dfm#L137)

- Período: duas datas geram `cast(pf.data as date) between inicial and final`, inclusivo; só uma data gera igualdade à data presente; nenhuma remove o filtro. Datas são concatenadas sem bind. [dmconsultatransferencias.pas:184-199](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L184)
- Filiais: listas não vazias geram `in (...)` para requisitante/requisitada; vazias removem o filtro. O texto é concatenado diretamente. [dmconsultatransferencias.pas:123-131](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L123)
- Situação: OR entre A/F/D/C; nenhuma remove o filtro. Só `SetSituacao_F` reconstrói a macro e a tela atribui F por último; o fluxo depende dessa ordem e não deve ser copiado. [dmconsultatransferencias.pas:217-267](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L217) [fmconsultatransferencias.pas:171-176](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.pas#L171)
- Curva ABC: OR entre A/B/C/“não definido”; o último é `coalesce(p.resultadocurvaabc,'')=''` (NULL ou vazio). Nenhuma remove o filtro. [dmconsultatransferencias.pas:134-165](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L134)

As quatro opções ABC começam marcadas; situações começam desmarcadas. [fmconsultatransferencias.dfm:263-329](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.dfm#L263) [fmconsultatransferencias.dfm:126-157](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.dfm#L126)

## Execução e efeitos da seleção

Ao gerar, a tela transfere filtros e listas ao data module, que fecha o dataset ativo, configura macros e abre-o. [fmconsultatransferencias.pas:164-185](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.pas#L164) [dmconsultatransferencias.pas:115-167](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L115)

`recordcount<>0` define sucesso. Em vazio, o dataset fecha e a tela avisa/foca a data inicial; com linhas, abre “Registros Selecionados” e foca o grid. [dmconsultatransferencias.pas:167-171](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L167) [fmconsultatransferencias.pas:184-194](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.pas#L184)

Grid e memo usam o mesmo datasource; mudar a linha muda a observação. O scroll atualiza títulos das colunas de grade. Os getters parecem invertidos: `GetColunadaGrade` lê `linha` e `GetLinhadaGrade` lê `coluna`; verificar antes de preservar. [fmconsultatransferencias.dfm:357-363](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.dfm#L357) [fmconsultatransferencias.dfm:818-825](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.dfm#L818) [fmconsultatransferencias.pas:73-78](C:/projetos.vcl/apps/interlojas/fmconsultatransferencias.pas#L73) [dmconsultatransferencias.pas:174-182](C:/projetos.vcl/apps/interlojas/dmconsultatransferencias.pas#L174)

## Requisitos seguros para o repositório Laravel

1. Usar filtros tipados: datas ISO, arrays de IDs inteiros, situações `A|F|D|C` e ABC `A|B|C|nao_definido`; rejeitar fora do domínio.
2. Usar Query Builder/Eloquent com binds e `whereIn`; nunca receber CSV, fragmentos SQL, coluna ou direção de ordenação sem whitelist.
3. Preservar período inclusivo. Preferir limites sargáveis (`>= início`, `< dia seguinte ao final`) ao `cast`, após teste de equivalência.
4. Agrupar OR de situação/ABC; vazio significa sem filtro e “não definido” significa NULL ou vazio.
5. Entregar projeção em consulta set-based. Trocar subconsultas por `LEFT JOIN`/CTE apenas após confirmar unicidade, evitando tanto N+1 na aplicação quanto multiplicação de linhas.
6. Não carregar relações por linha após paginação; número de consultas deve ser constante.
7. Listar colunas explicitamente, sem `pf.*`.
8. Paginar no servidor. Padrão: data/hora ASC e código ASC como desempate estável. Mapear ordenação pública por whitelist.
9. Separar código de situação do rótulo e decidir D (“CONFIRMADA”/“ATENDIDA”); corrigir “FECHADADA” na apresentação.
10. Retornar página vazia como resultado válido; a UI decide aviso/navegação.
11. Testar: zero/uma/duas datas; IDs vazios/únicos/múltiplos; situações e combinações; ABC incluindo NULL/vazio; filial V com/sem filial de estoque; sem fiscal; fiscal sem nota; empates data/hora.

## Decisões posteriores

- Rótulo canônico de D e correção de “FECHADADA”.
- Cardinalidade de `grades`, `estoques`, `tributosicms`, `dadosfiscais` e `notas` antes de reescrever joins.
- Se a inversão linha/coluna é defeito ou comportamento esperado.
