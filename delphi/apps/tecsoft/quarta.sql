select nsus.*, 
       
       nsus_prod.cprod,       
       nsus_prod.sequencial,
       nsus_prod.cean,       
       nsus_prod.xprod,
       nsus_prod.ncm,
       nsus_prod.extipi,
       nsus_prod.cfop,
       nsus_prod.ucom,
       nsus_prod.qcom,
       nsus_prod.vuncom,
       nsus_prod.vprod,
       nsus_prod.ceantrib,
       nsus_prod.utrib,
       nsus_prod.qtrib,
       nsus_prod.vuntrib,
       nsus_prod.vfrete,
       nsus_prod.vseg,
       nsus_prod.vdesc,
       nsus_prod.voutro,
       nsus_prod.indtot,
       nsus_prod.infadprod,
       
       pp.quantidade as pp_quantidade,
       pp.preco as pp_preco_pedido,
       pp.desconto as pp_desconto_pedido,
       pp.valoripi as pp_valoriipi,
       pp.valoricms as pp_valoricms,
       pp.frete as pp_frete,
       
       p.numero as p_numero,
       p.emissao as p_emissao,
       p.fornecedor as p_fornecedor,
       f.razao as nomefornecedor,
       p.emissao as p_emissao,
      
       p.filialfatura,
       p.filialentrega,
       p.filialcobranca

from produtospedidos pp

     join pedidos pe
          join fornecedores f
               join nsus
                    join nsus_prod
                         join produtosfornecedores pf
                              join produtos p 
                              on pf.produto = p.codigo                          
                              
                          on nsus_prod.cprod = pf.produtonofornecedor /*or
                                  nsus_prod.xprod = pf.descricaonofornecedor or
                                  nsus_prod.infadprod = pf.infadprod*/
/*                                and pf.fornecedor = f.codigo
                               and pf.tipofornecedor = 'F' */
                               
                               /*left join produtoscodigobarras pcb
                               on nsus_prod.cean = pcb.codigobarras
                               and pcb.produto = 995400)*/
                               
                               
                    
                    on nsus.cnpj = nsus_prod.cnpj
                       and nsus.nsu = nsus_prod.nsu 
                       and nsus.tipo = nsus_prod.tipo                                 
               on f.pessoanumero = nsus.cnpjemitente
          on pe.fornecedor = f.codigo
     on pp.pedido = pe.numero
     
where p.codigo = 995400
  and pp.produto = 995400  
  and pe.situacao = 'A'
  and pf.fornecedor = f.codigo
  and pf.tipofornecedor = 'F'
  and cast(nsus.dhemi as date) >= pe.database
