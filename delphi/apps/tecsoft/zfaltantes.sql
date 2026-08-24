rollback;

begin;

insert into reducoesz (numerofabricacao, filial, mfadicional, modelodoecf,
                     numerousuario, crz, coo, cro, datamovimento, dataemissao,
                     horaemissao, vendabrutadiaria, parametroincidenciaissqn,
                     coo_inicial, coo_final, codigo_ecf, totalizadorgeral)
(

select reducoes.*,
       coalesce((select rz.totalizadorgeral
        from reducoesz rz
        where reducoes.filial = rz.filial
          and reducoes.numerousuario = rz.numerousuario
          and reducoes.numerofabricacao = rz.numerofabricacao
          and reducoes.crz > rz.crz
        order by rz.crz desc limit 1),0) + coalesce(reducoes.vendabrutadiaria) as totalizadorgeral

from
(
select dc.num_fab as numerofabricacao,
       dc.filial,
       (select ecfs.mfadicional
        from ecfs
        where ecfs.serie = dc.num_fab
        order by ecfs.codigo desc limit 1) as mfadicional,

       (select ecfs.modelodescricao
        from ecfs
        where ecfs.serie = dc.num_fab
        order by ecfs.codigo desc limit 1) as modeloecf,

        dc.num_usu as numerousuario,
        dc.crz,

        (select dc1.coo
         from detalhecupom dc1
         where dc1.filial = dc.filial
           and dc1.num_usu = dc.num_usu
           and dc1.cro = dc.cro
           and dc1.num_fab = dc.num_fab
           and dc1.crz = dc.crz
           order by dc1.coo desc limit 1)+1 as coo,

        dc.cro,
        cast(dc.dt_ini as date)  as datamovimento,
        cast(dc.dt_ini as date) as dataemissao,
        cast(dc.dt_ini as date) horaemissao,
        sum(dc.sub_docto+dc.sub_acres) as vendabrutadiaria,
        cast('N' as char(1)) as parametroincidenciaissqn,

        (select dc1.coo
         from detalhecupom dc1
         where dc1.filial = dc.filial
           and dc1.num_usu = dc.num_usu
           and dc1.cro = dc.cro
           and dc1.num_fab = dc.num_fab
           and dc1.crz = dc.crz
           order by dc1.coo asc limit 1) as coo_inicial,

        (select dc1.coo
         from detalhecupom dc1
         where dc1.filial = dc.filial
           and dc1.num_usu = dc.num_usu
           and dc1.cro = dc.cro
           and dc1.num_fab = dc.num_fab
           and dc1.crz = dc.crz
           order by dc1.coo desc limit 1) as coo_final,

       (select ecfs.codigo
        from ecfs
        where ecfs.serie = dc.num_fab
        order by ecfs.codigo desc limit 1) as codigo_ecf

from detalhecupom dc
     left join reducoesz rz
     on dc.filial = rz.filial
     and dc.num_usu = rz.numerousuario
     and dc.num_fab = rz.numerofabricacao
     and dc.crz = rz.crz
where rz.crz is null
  and dc.crz <> 0
  and coalesce(trim(dc.num_fab),'')<>''
group by dc.num_fab, dc.filial, dc.num_usu, dc.crz, dc.cro, cast(dc.dt_ini as date)

order by cast(dc.dt_ini as date), dc.crz
) as reducoes
);


insert into reducoeszdetalhes (

  filial,
  numerousuario,
  cro,
  datamovimento,
  tipototalizadorparcial,
  aliquota,
  valoracumulado,
  numerofabricacao)

  (
   select rz.filial, rz.numerousuario, rz.cro, rz.datamovimento, rzdt.tipototalizadorparcial, coalesce(dic.aliquota,0.00),
          coalesce(dic.vl_tot_item,0.00),
          rz.numerofabricacao
   from reducoesz rz

     join

     (
        select distinct rz.filial, rz.numerousuario, rz.cro, rz.numerofabricacao, rz.crz, rzd.tipototalizadorparcial
        from reducoesz rz
             join reducoeszdetalhes rzd
             on rz.filial = rzd.filial
             and rz.numerousuario = rzd.numerousuario
             and rz.cro = rzd.cro
             and rz.numerofabricacao = rzd.numerofabricacao
        where not exists
         (select rzd.filial
          from reducoeszdetalhes rzd
          where rz.filial = rzd.filial
            and rz.numerousuario = rzd.numerousuario
            and rz.cro = rzd.cro
            and rz.numerofabricacao = rzd.numerofabricacao
            and rz.datamovimento = rzd.datamovimento)
        order by rz.filial, rz.numerousuario, rz.cro, rz.numerofabricacao, rz.crz, rzd.tipototalizadorparcial
     ) as rzdt
        on  rzdt.filial = rz.filial
        and rzdt.numerousuario = rz.numerousuario
        and rzdt.cro = rz.cro
        and rzdt.numerofabricacao = rz.numerofabricacao
        and rzdt.crz = rz.crz
		
     left join
	
     (
		 select dic.filial,
				 dic.num_usu,
				 dic.cro,
				 dic.crz,
				 dic.num_fab,
				 dic.cod_tot_parc,
				 dic.aliquota,
				 sum(dic.vl_tot_item) as vl_tot_item
        from
        (		
		 select dic.filial,
				 dic.num_usu,
				 dic.cro,
				 dc.crz,
				 dic.num_fab,
				 dic.cod_tot_parc,
				 coalesce(dic.aliq_icms,0) as aliquota,
				 case when dc.sub_acres<>0 then
				   (dic.vl_tot_item*dc.sub_acres/dc.sub_docto) + dic.vl_tot_item
				 else
				   dic.vl_tot_item
				 end as vl_tot_item
		  from reducoesz rz1
			   join dadositemcupom dic
					join detalhecupom dc
					on dic.filial = dc.filial
					and dic.num_usu = dc.num_usu
					and dic.cro = dc.cro
					and dic.num_fab = dc.num_fab
					and dic.coo = dc.coo
					and dc.canc='N'

			   on dic.filial = rz1.filial
			and dic.num_usu = rz1.numerousuario
			and dic.cro = rz1.cro
			and dic.num_fab = rz1.numerofabricacao
			and dic.coo between rz1.coo_inicial and rz1.coo_final

		  where not exists
		  (select rzd.filial
		   from reducoeszdetalhes rzd
		   where rz1.filial = rzd.filial
			 and rz1.numerousuario = rzd.numerousuario
			 and rz1.cro = rzd.cro
			 and rz1.numerofabricacao = rzd.numerofabricacao
			 and rz1.datamovimento = rzd.datamovimento)
         ) as dic
		  group by dic.filial, dic.num_usu, dic.cro, dic.num_fab, dic.aliquota, dic.cod_tot_parc, dic.crz
	
	
	
	  union all
	
	 select dc.filial,
             dc.num_usu,
             dc.cro,
             dc.crz,
             dc.num_fab,
			 cast('Can-T' as varchar(7)) as cod_tot_parc,
             0.00 as aliquota,
             sum(case when dc.canc='S' then dc.sub_docto else 0.00 end) as vl_tot_item
      from reducoesz rz1
           join detalhecupom dc
           on dc.filial = rz1.filial
        and dc.num_usu = rz1.numerousuario
        and dc.cro = rz1.cro
        and dc.num_fab = rz1.numerofabricacao
        and dc.coo between rz1.coo_inicial and rz1.coo_final

      where /*dc.canc='S'
	  and*/ not exists
      (select rzd.filial
       from reducoeszdetalhes rzd
       where rz1.filial = rzd.filial
         and rz1.numerousuario = rzd.numerousuario
         and rz1.cro = rzd.cro
         and rz1.numerofabricacao = rzd.numerofabricacao
         and rz1.datamovimento = rzd.datamovimento)

      group by dc.filial, dc.num_usu, dc.cro, dc.num_fab, dc.crz
	
	union all
	
	 select dc.filial,
             dc.num_usu,
             dc.cro,
             dc.crz,
             dc.num_fab,
			 cast('DT' as varchar(7)) as cod_tot_parc,
             0.00 as aliquota,
             sum(dc.sub_descto) as vl_tot_item
      from reducoesz rz1
           join detalhecupom dc
           on dc.filial = rz1.filial
        and dc.num_usu = rz1.numerousuario
        and dc.cro = rz1.cro
        and dc.num_fab = rz1.numerofabricacao
        and dc.coo between rz1.coo_inicial and rz1.coo_final

      where /*dc.canc='S'
	  and*/ not exists
      (select rzd.filial
       from reducoeszdetalhes rzd
       where rz1.filial = rzd.filial
         and rz1.numerousuario = rzd.numerousuario
         and rz1.cro = rzd.cro
         and rz1.numerofabricacao = rzd.numerofabricacao
         and rz1.datamovimento = rzd.datamovimento)

      group by dc.filial, dc.num_usu, dc.cro, dc.num_fab, dc.crz
	
	
     ) as dic
        on  dic.filial = rz.filial
        and dic.num_usu = rz.numerousuario
        and dic.cro = rz.cro
        and dic.num_fab = rz.numerofabricacao
        and dic.crz = rz.crz
		and dic.cod_tot_parc = rzdt.tipototalizadorparcial


where not exists
  (select rzd.filial
   from reducoeszdetalhes rzd
    where rz.filial = rzd.filial
     and rz.numerousuario = rzd.numerousuario
     and rz.cro = rzd.cro
     and rz.numerofabricacao = rzd.numerofabricacao
     and rz.datamovimento = rzd.datamovimento)
order by rz.datamovimento desc, rz.crz, rz.coo
)

end;

/*
delete from reducoesz
where not exists
  (select rzd.filial
   from reducoeszdetalhes rzd
    where reducoesz.filial = rzd.filial
     and reducoesz.numerousuario = rzd.numerousuario
     and reducoesz.cro = rzd.cro
     and reducoesz.numerofabricacao = rzd.numerofabricacao
     and reducoesz.datamovimento = rzd.datamovimento);

select * from reducoesz
where not exists
  (select rzd.filial
   from reducoeszdetalhes rzd
    where reducoesz.filial = rzd.filial
     and reducoesz.numerousuario = rzd.numerousuario
     and reducoesz.cro = rzd.cro
     and reducoesz.numerofabricacao = rzd.numerofabricacao
     and reducoesz.datamovimento = rzd.datamovimento);
*/

