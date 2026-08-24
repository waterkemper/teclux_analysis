select sp.codigo as setor,
       sp.descricao as descricaosetor,
       
       m.codigo as maquina,
       m.descricao as descricaomaquina,
       
       ooup.usuario,
       u.nome as nomeusuario,

       ooup.codigoparada,
       mp.descricao as descricaoparada,
       
       sum(ooup.tempoparada) as tempoparada,
       
       cp.pn
       
FROM OperacoesOSPUsuario oou
     join OperacoesOSPUsuarioparadas ooup
     on oou.osp = ooup.osp and
        oou.lote = ooup.lote and
        oou.operacao = ooup.operacao and
        oou.usuario = ooup.usuario and
        oou.data = ooup.data and
        oou.inicio = ooup.inicio
        
     join osp on osp.numero = oou.osp
     
     join clientesprodutos cp
        on cp.cliente = osp.cliente and
           cp.tipocliente = osp.tipocliente and
           cp.produto = osp.produto

     JOIN Operacoes o  ON ooup.Operacao = o.Codigo
     JOIN Usuarios u   ON ooup.Usuario  = u.Codigo
     JOIN Maquinas m   ON m.Codigo     = COALESCE(oou.Maquina, (SELECT om.Maquina FROM OperacoesMaquinas om
                                                                WHERE om.Operacao = ooup.Operacao LIMIT 1))
     JOIN SetoresProducao sp ON sp.Codigo = m.SetorProducao
     join motivosparadas mp on ooup.codigoparada = mp.codigo

WHERE oou.data between '2012-09-01' and '2012-09-30'
group by sp.codigo, sp.descricao, m.codigo, m.descricao, ooup.usuario, u.nome, ooup.codigoparada, mp.descricao, cp.pn
order by sp.codigo, sp.descricao, m.codigo, m.descricao, ooup.usuario, u.nome, ooup.codigoparada, mp.descricao, cp.pn