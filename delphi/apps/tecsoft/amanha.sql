select codigo,origem,assunto,informes,status,orcamento,contrato,
       (select string_agg(cast(ap.produto as varchar),',') from atendimentosprodutos ap where ap.atendimento = atendimentos.codigo) as listaprodutos   

from atendimentos 

where codigo in (768935,768928,768925,768922,768927) or 
      origem in (768935,768928,768925,768922,768927) 
      
order by codigo;


select * from atendimentosprodutos where atendimento in (768935,768928,768925,768922,768927)



select * 
from atendimentos_log 
where codigo in (768935,768928,768925,768922,768927)



select * from romaneiosnotas where romaneio = 60078
select * from romaneios where numero = 60078


60078



SELECT situacao, * FROM contratos_log where numero = '3000427' order by trigger_id



select at.codigo, at.origem, atp.produto,

       (select min(atp_.atendimento)
        from atendimentosprodutos atp_
             join atendimentos a_
             on atp_.atendimento = a_.codigo
             
        where atp_.produto = atp.produto
         and a_.contrato = at.contrato) as origem_correta
       
from atendimentos at
     join atendimentosprodutos atp
     on at.codigo = atp.atendimento    
     
     join atendimentos ato
     on at.origem = ato.codigo
     
where at.origem is not null
  and ato.origem is not null