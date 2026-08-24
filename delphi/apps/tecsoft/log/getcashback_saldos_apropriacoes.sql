CREATE OR REPLACE FUNCTION public.getcashback_saldos_apropriacoes (
  pcliente integer,
  ptipocliente char,
  poperacao varchar,
  pdesconto_cashback numeric
)
RETURNS TABLE (
  agrupamento integer,
  sequencia bigint,
  codigo integer,
  data_hora timestamp,
  cliente integer,
  tipo_cliente char,
  status varchar,
  contrato varchar,
  parcela integer,
  cancelamento integer,
  codigo_apropriacao_devolvida integer,
  codigo_saldo integer,
  codigo_saldo_origem integer,
  cashback integer,
  validade timestamp,
  disponibilidade date,
  produto bigint,
  quantidade numeric,
  valor numeric,
  valor_restante numeric,
  resultado numeric,
  saldo_valor numeric,
  resultado_saldo_valor numeric,
  somavalor numeric
) AS
$body$
          select /*ROW_NUMBER() OVER (ORDER BY sel.codigo) as sequencia, */
                 sel.*, 
                 - ABS(sel.saldo_valor) as resultado_saldo_valor,
                 sum(sel.saldo_valor) OVER (partition by sel.agrupamento) as somavalor 
           from
           (

             select sel.*,
             
                  (case when pOperacao = 'APROPRIAÇÃO' then                   
                           case when resultado > 0 then abs(valor_restante)
                                else abs(valor_restante)-abs(resultado) end                            
                        when pOperacao in ('VÁLIDOS VENCIDOS')  then
                          valor_restante                          
                   end) as saldo_valor
             from
             ( 

               select sel.*,
                      sum(sel.valor_restante) OVER (order BY sel.sequencia) AS resultado                                 
               from
               ( 

                select 1 as agrupamento,
                       0 as sequencia,
                       cast(null as integer) as codigo,
                       cast(null as TIMESTAMP) as data_hora,
                       cast(52851 as integer) as cliente,
                       cast('C' as char(1)) as tipo_cliente,
                       cast('VÁLIDO' as varchar(25)) as status,
                       cast(null as VARCHAR(20)) as contrato,
                       CAST(null as INTEGER) as parcela,
                       cast(0 as integer) as cancelamento,
                       cast(0 as integer) as codigo_apropriacao_devolvida,
                       
                       cast(null as integer) as codigo_saldo,
                       cast(null as integer) as codigo_saldo_origem,                       
                       cast(null as integer) as cashback,
                       cast(null as TIMESTAMP) as validade,
                       cast(null as DATE) as disponibilidade,
                       
                       cast(null as bigint) as produto,
                       cast(null as numeric(11,3)) as quantidade,                                              
                       cast(null as numeric(11,2)) as valor,
                       cast(pdesconto_cashback as numeric(11,2)) as valor_restante

                union all       
                
                ( 
                
                
                  select 1 as agrupamento,
                         ROW_NUMBER() OVER (order by cb_s_p.validade, cb_s_p.codigo_saldo, cb_s.contrato, cb_s.parcela) as sequencia,
                         cb_s.codigo,
                         cb_s.data_hora,
                         cb_s.cliente,
                         cb_s.tipo_cliente,
                         cb_s.status,
                         cb_s.contrato,
                         cb_s.parcela,
                         cb_s.cancelamento,
                         cb_s.codigo_apropriacao_devolvida,
                         
                         cb_s_p.codigo_saldo,
                         cb_s_p.codigo_saldo_origem,
                         cb_s_p.cashback,
                         cb_s_p.validade,
                         cb_s_p.disponibilidade,
                         cb_s_p.produto,
                         cb_s_p.quantidade,
                         cb_s_p.valor,
                         
                          
                      - ( cb_s_p.valor 
                        
                                 /* Apropriação negativa + Apropriação devolvida positiva*/
                               +  coalesce((select sum(cb_s_pa.valor)
                                           from cashback_saldos cb_sa
                                                join cashback_saldos_produtos cb_s_pa
                                                on cb_sa.codigo = cb_s_pa.codigo_saldo                                                                  
                                                
                                            where cb_sa.cliente = cb_s.cliente
                                              and cb_sa.tipo_cliente = cb_s.tipo_cliente
                                              and cb_s_pa.codigo_saldo_origem = cb_s.codigo
                                              and cb_s_pa.produto = cb_s_p.produto
                                              and cb_s_pa.cashback = cb_s_p.cashback
                                              
                                              and ((cb_sa.status = 'APROPRIAÇÃO' and 
											        cb_sa.cancelamento = 0) or
                                                   
                                                   (cb_sa.status in ('VÁLIDOS VENCIDOS',
                                                                     'VÁLIDOS DEVOLVIDOS', 
                                                                     'VÁLIDOS TROCADOS') 
													and cb_sa.cancelamento = cb_sa.codigo) or
                                                                     
                                                   (cb_sa.status in ('APROPRIAÇÃO DEVOLVIDA', 
                                                                     'APROPRIAÇÃO TROCADA') 
													 and cb_sa.cancelamento = cb_sa.codigo
													 and cast(cb_s_pa.validade as date) < current_date
                                                     and cb_sa.codigo_apropriacao_devolvida is not null) )
                                                                     
                                                                     
                                                                     
                                                                     ),0)) as valor_restante
                        
                  from cashback_saldos cb_s
                       join cashback_saldos_produtos cb_s_p
                       on cb_s.codigo = cb_s_p.codigo_saldo
                       
                  where cb_s.cliente = pCliente
                    and cb_s.tipo_cliente = pTipoCliente
                    and cb_s.status IN  ('VÁLIDO', 'ENTRADA MANUAL')
                    and cb_s.cancelamento = 0
                    
                    and 
                        ( (cb_s_p.valor 
                        
                                 /* Apropriação negativa + Apropriação devolvida positiva*/
                               +  coalesce((select sum(cb_s_pa.valor)
                                           from cashback_saldos cb_sa
                                                join cashback_saldos_produtos cb_s_pa
                                                on cb_sa.codigo = cb_s_pa.codigo_saldo                                                                  
                                                
                                            where cb_sa.cliente = cb_s.cliente
                                              and cb_sa.tipo_cliente = cb_s.tipo_cliente
                                              and cb_s_pa.codigo_saldo_origem = cb_s.codigo
                                              and cb_s_pa.produto = cb_s_p.produto
                                              and cb_s_pa.cashback = cb_s_p.cashback
                                              
                                              and ((cb_sa.status = 'APROPRIAÇÃO' and 
											        cb_sa.cancelamento = 0) or
                                                   
                                                   (cb_sa.status in ('VÁLIDOS VENCIDOS',
                                                                     'VÁLIDOS DEVOLVIDOS', 
                                                                     'VÁLIDOS TROCADOS') 
													and cb_sa.cancelamento = cb_sa.codigo) or
                                                                     
                                                   (cb_sa.status in ('APROPRIAÇÃO DEVOLVIDA', 
                                                                     'APROPRIAÇÃO TROCADA') 
													 and cb_sa.cancelamento = cb_sa.codigo 
												     and cast(cb_s_pa.validade as date) < current_date
                                                     and cb_sa.codigo_apropriacao_devolvida is not null))),0))  > 0)
                                       
                    and case when  pOperacao = 'APROPRIAÇÃO'      then true
                             when  pOperacao = 'VÁLIDOS VENCIDOS' then cast(cb_s_p.validade as date) < current_date /* localtimestamp */
                        else false end              
                  order by cb_s_p.validade, cb_s_p.codigo_saldo, cb_s.contrato, cb_s.parcela
                 ) 
                ) as sel 
               ) as sel             
               where sequencia <> 0 
              ) as sel 
              where case when pOperacao = 'APROPRIAÇÃO' then saldo_valor >0
                       when pOperacao = 'VÁLIDOS VENCIDOS' then saldo_valor <> 0 end;
$body$
LANGUAGE 'sql';

ALTER FUNCTION public.getcashback_saldos_apropriacoes (pcliente integer, ptipocliente char, poperacao varchar, pdesconto_cashback numeric)
  OWNER TO tecsoft;