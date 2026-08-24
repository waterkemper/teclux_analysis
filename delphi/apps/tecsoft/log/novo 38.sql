CREATE OR REPLACE FUNCTION public.atualizar_cashback_saldos (
  pcontrato varchar,
  pparcela integer,
  pcliente integer,
  ptipocliente char,
  poperacao varchar,
  pproduto bigint,
  pquantidade numeric
)
RETURNS void AS
$body$
declare
  r_cashback_saldos record;
  r_contratos record; 
  vCodigo integer;
  vCodigoDevolucao integer;
  vdesconto_cashback numeric(11,2);
  vValoraDevolver numeric(11,2);
  j json;
  vOperacao varchar(25);
    
BEGIN
  if pOperacao = 'VÁLIDO' then
         
    if coalesce((select false
                   from cashback_saldos cb_s
                   where (cliente, tipo_cliente, contrato, parcela, status, cancelamento) in
                   (select ct.cliente, ct.tipocliente, ct.numero, pParcela, cast('VÁLIDO' as varchar(25)), CAST(0 as integer)
                    from contratos ct
                    where ct.numero = pContrato)),true) then
    
        select json_agg(row_to_json(r.*)) into j
        from
        ( select * from getcashback_saldos_produtos(pContrato,pParcela) ) as r;
        
        if found then
           
          select nextval('cashback_saldos_proximocodigo') into vCodigo; 

          insert into cashback_saldos (
              codigo,
              data_hora,
              cliente,
              tipo_cliente,
              status,
              contrato,
              parcela,
              cancelamento
            )

            ( 
          
              SELECT distinct vcodigo, localtimestamp, cliente, tipocliente, 'VÁLIDO', contrato, numeroparcela, cast(0 as integer)
              from json_to_recordset(j) as 
              
                (contrato varchar(20),
                 numeroparcela integer,
                 cliente integer,
                 tipocliente char(1),
                 produto bigint,
                 quantidade numeric(11,3),
                 calc_valorcashback numeric(11,2),
                 cashback integer,  
                 validade timestamp)
             
            ) ON CONFLICT (

                  cliente, tipo_cliente, contrato, parcela, status, cancelamento              
                  
                ) DO NOTHING;  
            
            
          insert into cashback_saldos_produtos (
          
              codigo_saldo,
              codigo_saldo_origem,
              cashback,
              validade, 
              disponibilidade,               
              produto,
              quantidade,
              valor
              
            )

            ( 
          
              SELECT distinct vcodigo, vcodigo, cashback, validade, disponibilidade, produto, quantidade, calc_valorcashback
              from json_to_recordset(j) as 
              
                (contrato varchar(20),
                 numeroparcela integer,
                 cliente integer,
                 tipocliente char(1),
                 produto bigint,
                 quantidade numeric(11,3),
                 calc_valorcashback numeric(11,2),
                 cashback integer,  
                 validade timestamp,
                 disponibilidade date)
             
            );

        end if;    
    end if;    
  end if;
    
  if pOperacao = 'VÁLIDO CANCELADO' then
  
    select cb_s_v.* into r_cashback_saldos

        from  parcelas p
              join contratos ct
              on p.contrato = ct.numero
              
              join cashback_saldos cb_s_v                   
              on p.contrato = cb_s_v.contrato
              and p.numero = cb_s_v.parcela             
              
        where p.contrato = pContrato 
          and p.numero = pParcela         
          and cb_s_v.status = 'VÁLIDO'
          and cb_s_v.cancelamento = 0
          and p.datapagto is null;
          
     if found then
     
       select nextval('cashback_saldos_proximocodigo') into vCodigo;
       
       update cashback_saldos set cancelamento = vCodigo
       where cashback_saldos.codigo = r_cashback_saldos.codigo; 
       
             
       insert into cashback_saldos (
          codigo,
          data_hora,
          cliente,
          tipo_cliente,
          status,
          contrato,
          parcela,
          cancelamento
                              
        )  
        
        values 
        (
          vcodigo,
          localtimestamp, 
          r_cashback_saldos.cliente, 
          r_cashback_saldos.tipo_cliente,
          cast('VÁLIDO CANCELADO' as varchar(20)),
          r_cashback_saldos.contrato, 
          r_cashback_saldos.parcela,
          r_cashback_saldos.codigo
        ) ;
        
            
          insert into cashback_saldos_produtos (
              codigo_saldo,
              codigo_saldo_origem,
              cashback,
              validade,  
              disponibilidade,              
              produto,
              quantidade,
              valor
            )

            ( 
          
              SELECT vcodigo, 
                     cb_s_p.codigo_saldo,
                     cb_s_p.cashback,
                     cb_s_p.validade,
                     cb_s_p.disponibilidade,                     
                     cb_s_p.produto,
                     cb_s_p.quantidade,
                     - (cb_s_p.valor)
                     
              from cashback_saldos_produtos cb_s_p
              where cb_s_p.codigo_saldo =  r_cashback_saldos.codigo              
             
            );
            
          /* delete from cashback_saldos where contrato = pContrato and parcela = pParcela and status in ('VÁLIDOS VENCIDOS');*/
        
    end if;
  end if;  
    
  if pOperacao = 'APROPRIAÇÃO' then  
     select ct.cliente, ct.tipocliente, ct.desconto_cashback into r_contratos
     from contratos ct
     where ct.numero = pContrato;
     
     if r_contratos.desconto_cashback <> 0 then
     
        /* não pode existir mais de uma apropriação em um contrato */ 
        if coalesce((select false
                       from cashback_saldos cb_s
                       where (cliente, tipo_cliente, contrato, parcela, status, cancelamento) in
                       (select ct.cliente, ct.tipocliente, ct.numero, cast(0 as integer), pOperacao, CAST(0 as integer)
                        from contratos ct
                        where ct.numero = pContrato)),true) then
     
     
     
          select json_agg(row_to_json(r.*)) into j
          from
          ( select * from getcashback_saldos_apropriacoes(r_contratos.cliente, r_contratos.tipocliente, pOperacao, r_contratos.desconto_cashback) ) as r;
                
            
          if not found then
            raise exception 'Diferença entre os saldos: Valor de CashBack: % Valor encontrado: %', r_contratos.desconto_cashback, 0.00;  
          else
        
            SELECT somavalor into vdesconto_cashback
            from json_to_recordset(j) as (somavalor numeric(11,2)) limit 1;
               
            if  r_contratos.desconto_cashback <> vdesconto_cashback then
              raise exception 'Diferença entre os saldos: Valor de CashBack: % Valor encontrado: %', r_contratos.desconto_cashback, vdesconto_cashback;
            else
          
              select nextval('cashback_saldos_proximocodigo') into vCodigo;
              
                    
              insert into cashback_saldos (
                codigo,
                data_hora,
                cliente,
                tipo_cliente,
                status,
                contrato,
                parcela,
                cancelamento
              ) values

              ( 
          
                vcodigo, localtimestamp, r_contratos.cliente, r_contratos.tipocliente, pOperacao, pcontrato, cast(0 as integer), cast(0 as integer))
                
                ON CONFLICT (

                  cliente, tipo_cliente, contrato, parcela, status, cancelamento              
                  
                ) DO NOTHING;  
            
            
            
             insert into cashback_saldos_produtos (
              codigo_saldo,
              codigo_saldo_origem, 
              cashback,
              validade, 
              disponibilidade,
              produto,
              quantidade,
              valor
              
             )

             ( 
          
              SELECT vcodigo, codigo, cashback, validade, disponibilidade, produto, quantidade, resultado_saldo_valor
              from json_to_recordset(j) as 
              
               (
                  Agrupamento integer,
                  sequencia bigint,
                  codigo integer,
                  data_hora timestamp,
                  cliente integer,
                  tipo_cliente char(1),
                  status varchar(25),
                  contrato varchar(20),
                  parcela integer, 
                  cancelamento integer,
                  codigo_apropriacao_devolvida integer,
                  
                  codigo_saldo integer,
                  codigo_saldo_origem integer,  
                  cashback integer,  
                  validade timestamp,
                  disponibilidade date,
                  produto bigint,  
                  quantidade numeric(11,3),
                  valor numeric(11,2),  
                  valor_restante numeric(11,2),  
                  resultado numeric(11,2),  
                  saldo_valor numeric(11,2),
                  resultado_saldo_valor numeric(11,2),
                  somavalor numeric(11,2)
  
               )
             
             );
          
            end if;        
          end if;         
          
        end if;  
     end if;
  end if;   
    
  if pOperacao = 'APROPRIAÇÃO CANCELADA' then  
    select cb_s_v.* into r_cashback_saldos

        from  contratos ct             
              join cashback_saldos cb_s_v                   
              on ct.numero = cb_s_v.contrato
              
        where ct.numero = pContrato 
          and cb_s_v.parcela = 0
          and cb_s_v.status = 'APROPRIAÇÃO'
          and cb_s_v.cancelamento = 0;
          
    if found then
     
       select nextval('cashback_saldos_proximocodigo') into vCodigo;
       
       update cashback_saldos set cancelamento = vCodigo
       where cashback_saldos.codigo = r_cashback_saldos.codigo; 
       
             
       insert into cashback_saldos (
          codigo,
          data_hora,
          cliente,
          tipo_cliente,
          status,
          contrato,
          parcela,
          cancelamento
                              
        )  
        
        values 
        (
          vcodigo,
          localtimestamp, 
          r_cashback_saldos.cliente, 
          r_cashback_saldos.tipo_cliente,
          pOperacao,
          r_cashback_saldos.contrato, 
          r_cashback_saldos.parcela,
          r_cashback_saldos.codigo
        ) ;
        
                    
          insert into cashback_saldos_produtos (
              codigo_saldo,
              codigo_saldo_origem,              
              cashback,
              produto,
              valor
            )

            ( 
          
              SELECT vcodigo, 
                     cb_s_p.codigo_saldo_origem,
                     cb_s_p.cashback, 
                     cb_s_p.produto,
                     - (cb_s_p.valor)
                     
              from cashback_saldos_produtos cb_s_p
              where cb_s_p.codigo_saldo =  r_cashback_saldos.codigo              
             
            );
            
            
         perform atualizar_cashback_saldos (cast(null as varchar(20)), 
                                            cast(null as integer), 
                                            r_cashback_saldos.cliente, 
                                            r_cashback_saldos.tipo_cliente, 
                                            'VÁLIDOS VENCIDOS', 
                                            cast(null as bigint), 
                                            cast(null as numeric(11,3)) );                 
        
    end if;
  end if;  
  
  if pOperacao = 'VÁLIDOS VENCIDOS' then  

          select json_agg(row_to_json(r.*)) into j
          from
          ( select * from getcashback_saldos_apropriacoes(pcliente, ptipocliente, pOperacao, 0.00) ) as r;
                
          if found then
          
                    
            for r_cashback_saldos IN  SELECT distinct validade, disponibilidade, contrato
                      from json_to_recordset(j) as 
              
                      (                       
                          Agrupamento integer,
                          sequencia bigint,
                          codigo integer,
                          data_hora timestamp,
                          cliente integer,
                          tipo_cliente char(1),
                          status varchar(25),
                          contrato varchar(20),
                          parcela integer, 
                          cancelamento integer,
                          codigo_apropriacao_devolvida integer,
                          
                          codigo_saldo integer,
                          codigo_saldo_origem integer,  
                          cashback integer,  
                          validade timestamp,
                          disponibilidade date,
                          produto bigint,  
                          quantidade numeric(11,3),
                          valor numeric(11,2),  
                          valor_restante numeric(11,2),  
                          resultado numeric(11,2),  
                          saldo_valor numeric(11,2),
                          resultado_saldo_valor numeric(11,2),
                          somavalor numeric(11,2)                      
                      )
            loop
              select nextval('cashback_saldos_proximocodigo') into vCodigo;
          
              insert into cashback_saldos (
                codigo,
                data_hora,
                cliente,
                tipo_cliente,
                status,
                contrato,
                parcela,
                cancelamento
              ) values

              ( 
          
                vcodigo, r_cashback_saldos.validade, pcliente, ptipocliente, pOperacao, r_cashback_saldos.contrato, cast(0 as integer), vcodigo)
                /* o campo cancelamento recebe o próprio valor único pois neste caso pode haver uma duplicação (qdo parcial) */
                
                ON CONFLICT (

                  cliente, tipo_cliente, contrato, parcela, status, cancelamento              
                  
                ) DO NOTHING;  
            
            
            
             insert into cashback_saldos_produtos (
              
              codigo_saldo,
              codigo_saldo_origem,
              cashback,
              validade,
              disponibilidade,
              produto,
              quantidade,
              valor
              
             )

             ( 
          
              SELECT vcodigo, codigo, cashback, validade, disponibilidade, produto, quantidade, resultado_saldo_valor
              from json_to_recordset(j) as 
              
               (
               
                          Agrupamento integer,
                          sequencia bigint,
                          codigo integer,
                          data_hora timestamp,
                          cliente integer,
                          tipo_cliente char(1),
                          status varchar(25),
                          contrato varchar(20),
                          parcela integer, 
                          cancelamento integer,
                          codigo_apropriacao_devolvida integer,
                          
                          codigo_saldo integer,
                          codigo_saldo_origem integer,  
                          cashback integer,  
                          validade timestamp,
                          disponibilidade date,
                          produto bigint,  
                          quantidade numeric(11,3),
                          valor numeric(11,2),  
                          valor_restante numeric(11,2),  
                          resultado numeric(11,2),  
                          saldo_valor numeric(11,2),
                          resultado_saldo_valor numeric(11,2),
                          somavalor numeric(11,2)                      
                  
               )
               where validade = r_cashback_saldos.validade
                 and contrato = r_cashback_saldos.contrato
             
             );


            end loop;            
                    
          
          end if;          
  end if;
  
  if pOperacao IN ('VÁLIDOS DEVOLVIDOS','VÁLIDOS TROCADOS' /*, 'APROPRIAÇÃO DEVOLVIDA', 'APROPRIAÇÃO TROCADA'*/)  then 

    select ct.cliente, ct.tipocliente into r_contratos
    from contratos ct
    where ct.numero = pContrato;
    
    -- Atualizar os vencidos antes de negativar um devolução ou troca, pois não haveria razão de devolver/trocar cashback vencido
    
    perform atualizar_cashback_saldos (cast(null as varchar(20)), 
                                       cast(null as integer), 
                                       r_contratos.cliente, 
                                       r_contratos.tipocliente, 
                                       'VÁLIDOS VENCIDOS', 
                                       cast(null as bigint), 
                                       cast(null as numeric(11,3)) );
    
    -- na devolução ou troca de um produto, todos os créditos válidos e nao vencidos gerados pelo produto devem ser negativados  
    
    -- Situação 1: Negativar créditos gerados que esta sendo devolvido 
    select json_agg(row_to_json(r.*)) into j
    from
    ( 

    
                select cb_s_v.*, 
                       cb_s_p.*,
                                              -- dev.valor_dev é negativo 
                      - case when (cb_s_p.quantidade - coalesce(dev.quantidade_dev,0)) = 0 then 0 else cast(((cb_s_p.valor + coalesce(dev.valor_dev,0)) / (cb_s_p.quantidade - coalesce(dev.quantidade_dev,0)) * pQuantidade ) as numeric(11,2)) end as ValoraDevolver
                        

                from  cashback_saldos cb_s_v                   
                      join cashback_saldos_produtos cb_s_p
                      on cb_s_v.codigo = cb_s_p.codigo_saldo
                          
                left join
                          
                (
                select  cb_s_vd_o.contrato, 
                         cb_s_vd_o.parcela, 
                         cb_s_pd.cashback,
                         cb_s_pd.produto,             
                         sum(cb_s_pd.quantidade) as quantidade_dev,    
                         sum(cb_s_pd.valor) as valor_dev
                        
                        from cashback_saldos_produtos cb_s_pd
                             join cashback_saldos cb_s_vd
                             on cb_s_vd.codigo = cb_s_pd.codigo_saldo
                             
                             join cashback_saldos cb_s_vd_o
                             on cb_s_pd.codigo_saldo_origem = cb_s_vd_o.codigo
                             
                        where cb_s_vd_o.contrato = pContrato
                          and cb_s_pd.produto = pProduto
                          and cb_s_vd.status  in ('VÁLIDOS VENCIDOS','VÁLIDOS DEVOLVIDOS','VÁLIDOS TROCADOS')
                          
                        group by cb_s_vd_o.contrato, cb_s_vd_o.parcela, cb_s_pd.cashback, cb_s_pd.produto  
                      
                ) as dev  
                  on  dev.contrato = cb_s_v.contrato
                  and dev.parcela = cb_s_v.parcela
                  and dev.cashback = cb_s_p.cashback
                  and dev.produto = cb_s_p.produto
                          
                          
                where cb_s_v.contrato = pContrato
                  and cb_s_p.produto = pProduto
                  and cb_s_v.status = 'VÁLIDO'
                  and cb_s_v.cancelamento = 0
                  and cb_s_p.validade > localtimestamp
                  and cb_s_p.quantidade >= (coalesce(dev.quantidade_dev,0) + pQuantidade)
                      
    ) as r;            
          
          
    if found then
     
            for r_cashback_saldos IN  SELECT distinct cliente, tipo_cliente, contrato
                      from json_to_recordset(j) as 
              
                      (
                      
                      codigo INTEGER,
                      data_hora TIMESTAMP,
                      cliente INTEGER,
                      tipo_cliente CHAR(1),
                      status VARCHAR(25),
                      contrato VARCHAR(20),
                      parcela INTEGER,
                      cancelamento INTEGER,
                      codigo_apropriacao_devolvida INTEGER,
                      
                      codigo_saldo INTEGER,
                      codigo_saldo_origem INTEGER,
                      cashback INTEGER,
                      validade TIMESTAMP,
                      disponibilidade date,
                      produto BIGINT,
                      quantidade NUMERIC(11,3),
                      valor NUMERIC(11,2),                      
  
                      
                      ValoraDevolver NUMERIC(11,2)
                      
                      )
            loop
                select nextval('cashback_saldos_proximocodigo') into vCodigo;
          
                insert into cashback_saldos (
                            codigo,
                            data_hora,
                            cliente,
                            tipo_cliente,
                            status,
                            contrato,
                            parcela,
                            cancelamento
                          ) values

                        ( 
                  
                         vcodigo, 
                         localtimestamp, 
                         r_cashback_saldos.cliente, 
                         r_cashback_saldos.tipo_cliente, 
                         pOperacao, 
                         r_cashback_saldos.contrato, 
                         cast(0 as integer), 
                         vcodigo 
                         
                         )
                          
                      -- o campo cancelamento recebe o próprio valor único pois neste caso pode haver uma duplicação (qdo parcial)...devolve um hoje outro depois 
                        
                        ON CONFLICT (

                          cliente, tipo_cliente, contrato, parcela, status, cancelamento              
                          
                        ) DO NOTHING;  
            
            
             insert into cashback_saldos_produtos (
              
              codigo_saldo,
              codigo_saldo_origem,
              cashback,
              validade,
              produto,              
              quantidade,
              valor,
              disponibilidade

              
             )

             ( 
          
              SELECT vcodigo, codigo, cashback, validade, produto, pQuantidade, ValoraDevolver, disponibilidade
              from json_to_recordset(j) as 
              
               (
               
                      codigo INTEGER,
                      data_hora TIMESTAMP,
                      cliente INTEGER,
                      tipo_cliente CHAR(1),
                      status VARCHAR(25),
                      contrato VARCHAR(20),
                      parcela INTEGER,
                      cancelamento INTEGER,
                      codigo_apropriacao_devolvida INTEGER,
                      
                      codigo_saldo INTEGER,
                      codigo_saldo_origem INTEGER,
                      cashback INTEGER,
                      validade TIMESTAMP,
                      disponibilidade date,
                      produto BIGINT,
                      quantidade NUMERIC(11,3),
                      valor NUMERIC(11,2),                      
  
                      
                      ValoraDevolver NUMERIC(11,2)
                  
               )
             
             );

            end loop;            
                              
    end if;   
    
    
    /* Situação 2: Devolver apropriações, Contrato apropriou um cashback e distribuiu entre os produtos, estes, embora entrem como desconto, não deve ser desconsiderado pois 
       trata-se de um cashback que entrou como desconto */
    /*
     1.Informações de entrada: contrato, produto, quantidade
     2.Recuperar quantidade e valor deste produto e contrato que já foram devolvidos
     3.Negar se Saldo já devolvido + aDevolver ultrapassar pc.quantidade, caso contrário ratear ou utilizar o saldo restante se acabar a quantidade a devolver
     4.Incluir registro em cashback_saldos_apropriacoes_devolvidas contendo codigo sequencial, contrato, produto, quantidade e valor
     5.Recuperar consulta contendo a soma do valor devolvido onde a soma do saldo deve cobrir o valor devolvido
     6.Incluir na tabela uma 'APROPRIAÇÃO DEVOLVIDA' ou 'APROPRIAÇÃO TROCADA' conforme pOperacoes em cashback_saldos e informar o codigo_devolução, 
       cashback_saldos_itens, cashback_saldos_produto
     7.Verificar locais onde a 'APROPRIAÇÃO DEVOLVIDA' ou 'APROPRIAÇÃO TROCADA' deve ser considerada paralelamente a 'VÁLIDOS DEVOLVIDOS','VÁLIDOS TROCADOS' para consideração do saldo    
    
    'APROPRIAÇÃO DEVOLVIDA'
    'APROPRIAÇÃO TROCADA'
    
    */
    
    select               
    case when (pc.quantidade - coalesce(dev.quantidade_dev,0)) = 0 then 0 else cast(((pc.desconto_cashback - coalesce(dev.valor_dev,0)) / (pc.quantidade - coalesce(dev.quantidade_dev,0)) * pQuantidade) as numeric(11,2)) end into vValoraDevolver
    
    from produtoscontratos pc
         left join
                 (select  cb_s_a_d.contrato, 
                         cb_s_a_d.produto,             
                         sum(cb_s_a_d.quantidade) as quantidade_dev,    
                         sum(cb_s_a_d.valor) as valor_dev
                        
                        from cashback_saldos_apropriacao_devolvida cb_s_a_d
                             
                        where cb_s_a_d.contrato = pContrato
                          and cb_s_a_d.produto = pProduto
                          
                        group by cb_s_a_d.contrato, cb_s_a_d.produto                        
                 ) as dev  
                   on  dev.contrato = pc.contrato
                   and dev.produto = pc.produto                          
    where pc.contrato = pContrato
      and pc.produto = pProduto
      and pc.quantidade >= (coalesce(dev.quantidade_dev,0) + pQuantidade);
    
    if coalesce(vValoraDevolver,0) <> 0 then
    
    
          select json_agg(row_to_json(r.*)) into j
          from
          ( select * from getcashback_saldos_apropriacao_devolvida(pContrato, vValoraDevolver) ) as r;
                
            
          if not found then
            raise exception 'Diferença entre os saldos: Valor de CashBack a devolver : % Valor encontrado: %', vValoraDevolver, 0.00;  
          else
        
            SELECT somavalor into vdesconto_cashback
            from json_to_recordset(j) as (somavalor numeric(11,2)) limit 1;
               
            if   vValoraDevolver <> vdesconto_cashback then
              raise exception 'Diferença entre os saldos: Valor de CashBacka devolver: % Valor encontrado: %',  vValoraDevolver, vdesconto_cashback;
            else
          
              select nextval('cashback_saldos_apropriacao_devolvida_proximocodigo') into vCodigoDevolucao;   
              
              insert into cashback_saldos_apropriacao_devolvida (codigo, contrato, produto, quantidade, valor)
              values (vCodigoDevolucao, pContrato, pProduto, pQuantidade, vValoraDevolver);
          
              select nextval('cashback_saldos_proximocodigo') into vCodigo;
              
              if pOperacao = 'VÁLIDOS DEVOLVIDOS' then
                vOperacao = 'APROPRIAÇÃO DEVOLVIDA';
              else
                vOperacao = 'APROPRIAÇÃO TROCADA';
              end if;  
                           
                    
              insert into cashback_saldos (
                codigo,
                data_hora,
                cliente,
                tipo_cliente,
                status,
                contrato,
                parcela,
                cancelamento,
                codigo_apropriacao_devolvida
                
                
  
              ) values

              ( 
          
                vcodigo, localtimestamp, r_contratos.cliente, r_contratos.tipocliente, vOperacao, pcontrato, cast(0 as integer), 
                
                vcodigo, 
                
                vCodigoDevolucao)
                
                ON CONFLICT (

                  cliente, tipo_cliente, contrato, parcela, status, cancelamento              
                  
                ) DO NOTHING;  
                
                
           
                        
              insert into cashback_saldos_produtos (
              codigo_saldo,
              codigo_saldo_origem,
              cashback,
              validade,
              disponibilidade,
              produto,
              quantidade,
              valor
                                          
              )

              ( 
          
              SELECT vcodigo, codigo_saldo_origem, cashback, validade, disponibilidade, produto, quantidade, saldo_valor_restante 
              from json_to_recordset(j) as 
              
               (
               
                  Agrupamento integer,
                  sequencia bigint,
                  codigo integer,
                  data_hora timestamp,
                  cliente integer,
                  tipo_cliente char(1),
                  status varchar(25),
                  contrato varchar(20),
                  parcela integer,
                  cancelamento integer,
                  codigo_apropriacao_devolvida INTEGER,
                  
                  codigo_saldo integer,
                  codigo_saldo_origem integer,    
                  cashback integer,  
                  validade timestamp,  
                  disponibilidade date,
                  produto bigint,
                  quantidade numeric(11,3),  
                  valor numeric(11,2),  
                  valor_restante numeric(11,2),
                  soma numeric(11,2),
                  saldo_valor_restante numeric(11,2),
                  somavalor numeric(11,2)
               
               )
             
             );
             
            perform atualizar_cashback_saldos (cast(null as varchar(20)), 
                                               cast(null as integer), 
                                               r_contratos.cliente, 
                                               r_contratos.tipocliente, 
                                               'VÁLIDOS VENCIDOS', 
                                               cast(null as bigint), 
                                               cast(null as numeric(11,3)) );
             
          
            end if;        
          end if;         
    
    
    
    
    

    end if;
    
    
  end if;            
  
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.atualizar_cashback_saldos (pcontrato varchar, pparcela integer, pcliente integer, ptipocliente char, poperacao varchar, pproduto bigint, pquantidade numeric)
  OWNER TO tecsoft;