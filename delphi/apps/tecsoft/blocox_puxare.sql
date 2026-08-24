/*

select rz.*, rzd.*
from reducoesz  rz
     natural join reducoeszdetalhes rzd

where rz.situacaoprocessamentocodigo<>1
order by rz.datamovimento desc limit 30



*/

  select dic.filial,
                 dic.num_usu,
                 dic.cro,
                 dic.crz,
                 dic.num_fab,
--                 dic.cod_item,
--                 dic.classificacaofiscal,
--                 cast(max(dic.desc_item) as varchar(100)) as desc_item,
--                 sum(dic.qtde_item) as qtde_item,
--                 dic.un_med,
--                 sum(dic.vl_unit) as vl_unit,

                 sum(dic.descto_item) as descto_item,
                 sum(dic.acres_item) as acres_item,
                 sum(vl_canc) as vl_canc,

                 dic.cod_tot_parc,
                 dic.aliquota,
                 sum(dic.vl_tot_item) as vl_tot_item,
                 dic.datamovimento

  from
  (

         select dic.filial,
                 dic.num_usu,
                 dic.cro,
                 dc.crz,
                 dic.num_fab,
                 dic.cod_item,
                 dic.classificacaofiscal,
                 cast(btrim(dic.desc_item) as varchar(100)) as desc_item,
                 dic.qtde_item,
                 dic.un_med,
                 dic.vl_unit,

                 /*
                 abs(coalesce(case when ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item) <
                   dic.vl_tot_item and dc.canc='N' then

                    ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item) -
                    dic.vl_tot_item
                 else
                   0.00
                 end, 0) + coalesce(dic.descto_item,0)) as descto_item,
                 */

                 abs(coalesce(case when ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item, false) <
                   dic.vl_tot_item and dc.canc='N'

                   and dic.ind_canc='N' /*alterado para atender num_fab='BE111910101110043064' and coo = 17366  da Andra item cancelado não deve entrar como desconto*/ 

                   then

                   dic.vl_tot_item -
                    ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item, false)

                 else
                   0.00
                 end, 0) + case when dc.canc='S' and dic.ind_canc='N' then 0.00 else coalesce(dic.descto_item,0) end) as descto_item,



                   /*
                 abs(coalesce(case when ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item) >
                   dic.vl_tot_item then
                    ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item) -
                    dic.vl_tot_item
                 else
                   0.00
                 end, 0) + coalesce(dic.acres_item,0)) as acres_item,

                 */

                 dic.acres_item,


/*                 case when dc.canc = 'S' or dic.ind_canc='S' then dic.vl_tot_item else 0.00 end as vl_canc,*/
                /* 0.00 as vl_canc,*/

                /*
                 case when dc.canc = 'S' then  dic.vl_tot_item

                      when dic.ind_canc='S' then

                      coalesce(nullif(dic.vl_canc,0), dic.vl_tot_item)

                 else 0.00 end as vl_canc,

                 */

                 case when dc.canc = 'S' then  /*ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item)*/

                      coalesce(nullif(ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item, true),0), dic.vl_tot_item)

                 
                      when dic.ind_canc='S' then 
                      
                      coalesce(nullif(dic.vl_canc,0), dic.vl_tot_item)
                      
                 else 0.00 end as vl_canc,


                 dic.cod_tot_parc,
                 coalesce(dic.aliq_icms,0) as aliquota,

                 /*ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item) as vl_tot_item ,*/


                 case when dc.canc = 'S'  or dic.ind_canc='S' Then 0.00
                 else

                 ValorDescontoAcrescCupomRateado(dic.filial, dic.num_usu, dic.cro, dic.coo, dic.num_item, false)
                 end  as vl_tot_item ,
                 

                 rz.datamovimento

          from reducoesz rz
               join dadositemcupom dic
                    join detalhecupom dc
                    on dic.filial = dc.filial
                    and dic.num_usu = dc.num_usu
                    and dic.cro = dc.cro
                    and dic.num_fab = dc.num_fab
                    and dic.coo = dc.coo
                   /* and dc.canc='N'
                    and dic.ind_canc='N'*/

               on dic.filial = rz.filial
            and dic.num_usu = rz.numerousuario
            and dic.cro = rz.cro
            and dic.num_fab = rz.numerofabricacao
            and dic.coo between rz.coo_inicial and rz.coo_final

           where rz.crz = 2287


) as dic

  group by dic.filial,
                 dic.num_usu,
                 dic.cro,
                 dic.crz,
                 dic.num_fab,
--                 dic.cod_item,
--                 dic.classificacaofiscal,
/*                 dic.desc_item, */
--                 dic.un_med,
                 dic.cod_tot_parc,
                 dic.aliquota,
                 dic.datamovimento


/*

:DataInicial

*/


select dc.coo
from detalhecupom dc
where coo BETWEEN 161430 and 161517

union all

select ddd.coo
from detalhedemaisdoctos ddd
where ddd.coo BETWEEN 161430 and 161517

161433, 161477



select coos.coo
from
(
select generate_series(161433, 161477) as coo
) as coos
where coos.coo not in 

(
select dc.coo
from detalhecupom dc
where coo BETWEEN 161430 and 161517

union all

select ddd.coo
from detalhedemaisdoctos ddd
where ddd.coo BETWEEN 161430 and 161517

)

