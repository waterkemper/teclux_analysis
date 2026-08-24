
SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtos') OR lower(nspname || '.' || t2.relname)   = 'produtos')
OK.

select produtos.oid, codigo, cast(descricao||' '||coalesce(valorgrade1,'')||' '||coalesce(valorgrade2,'') as varchar) as descricao
from produtos
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='caracteristicas'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='caracteristicas') OR lower(nspname || '.' || t2.relname)   = 'caracteristicas')
OK.

select caracteristicas.oid, codigo, 
 descricao
from caracteristicas
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='grupos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='grupos') OR lower(nspname || '.' || relname)   = 'grupos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='grupos') OR lower(nspname || '.' || relname)   = 'grupos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='grupos') OR lower(nspname || '.' || t2.relname)   = 'grupos')
OK.

select grupos.oid, codigo, 
 descricao
from grupos
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='classes'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='classes') OR lower(nspname || '.' || relname)   = 'classes') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='classes') OR lower(nspname || '.' || relname)   = 'classes')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='classes') OR lower(nspname || '.' || t2.relname)   = 'classes')
OK.

select classes.oid, codigo, 
 descricao
from classes
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='fornecedores') OR lower(nspname || '.' || relname)   = 'fornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='fornecedores') OR lower(nspname || '.' || relname)   = 'fornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='fornecedores') OR lower(nspname || '.' || t2.relname)   = 'fornecedores')
OK.

select codigo, razao
from fornecedores
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select codigo, razao
from fornecedores
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtos'
OK.

select produtos.oid, codigo, cast(descricao||' '||coalesce(valorgrade1,'')||' '||coalesce(valorgrade2,'') as varchar) as descricao
from produtos
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='caracteristicas'
OK.

select caracteristicas.oid, codigo, 
 descricao
from caracteristicas
where codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='grupos'
OK.

select grupos.oid, codigo, 
 descricao
from grupos
where codigo=''

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='classes'
OK.

select classes.oid, codigo, 
 descricao
from classes
where codigo=''

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

;
 select situacao,
 contrato,
 faturamento,
 cliente,
 nomecliente,
 filialvenda,
 nomefilialvenda,
 produto,
 filial,
 descricao,
 referencia,
 situacaoprodutocontrato,
 pendente,
 true as diferenciar,
 case when (coalesce(desconto,0)<>0) then
 (pendente*precovenda)-
 round( ((pendente*precovenda)/(valorvista+coalesce(desconto,0)))*coalesce(desconto,0), 2)
 else pendente*precovenda end as valorvista,
 case when (valorprazo-valorvista)<>0 then
 round( ((pendente*precovenda)/(valorvista+coalesce(desconto,0)))*(valorprazo - valorvista), 2)
 else cast(0 as numeric) end as acrescimo,
 devolucao
 from
(
(
 Select cast('Pendentes' as varchar) as situacao,
 ct.numero as contrato,
 ct.faturamento,
 ct.cliente,
 ct.nome as nomecliente,
 ct.filialvenda,
 pc.produto,
 pc.filial,
 cast(p.descricao||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'') as varchar) as descricao,
 p.referencia,
 pc.precovenda,
 ct.valorvista,
 ct.valorprazo,
 ct.desconto,

 case when (pc.quantidade - coalesce(pc.cancelado,0)) = 0 then
 cast('C' as varchar) else cast(null as varchar) end as situacaoprodutocontrato,

 case when (ct.situacao in ('F','N','P')) then
 ((pc.quantidade - coalesce((select sum(cd.quantidade)
 from contratosdevolvidos cd
 where cd.contrato = ct.numero
 and cd.produto = pc.produto
 and cd.devolucao<='29/05/2009'
 and cd.tipo = 'D'
 ),0)) -
 (Select coalesce(sum(pdf1.quantidade),0)
 From produtosdadosfiscais pdf1, dadosfiscais df1
 Where (pdf1.produto = pc.produto) and
 (pdf1.dadofiscal = df1.numero) and
 (df1.contrato = ct.numero) and (pdf1.filial=pc.filial) and
 (df1.data <='29/05/2009' )))
 when (ct.situacao = 'C') then
 ((pc.quantidade - coalesce((select sum(cd.quantidade)
 from contratosdevolvidos cd
 where cd.contrato = ct.numero
 and cd.produto = pc.produto
 and cd.devolucao<='29/05/2009'
 and cd.tipo = 'D'),0)) -
 (Select coalesce(sum(cd2.quantidade),0)
 From contratosdevolvidos cd2
 Where cd2.produto = pc.produto and
 cd2.contrato = ct.numero and
 cd2.situacao in ('F','P') and
 cd2.devolucao <='29/05/2009' and
 cd2.tipo='D'))
 end as pendente,

 f.nome as nomefilialvenda,
 cast(null as date) as devolucao

From contratos ct, produtoscontratos pc, produtos p, filiais f
where (pc.contrato = ct.numero)
 and (p.codigo = pc.produto)
 and (ct.filialvenda = f.codigo)
 and (ct.faturamento between '29/05/2009' and '29/05/2009' )

 and ( ct.filialvenda in ('2')) 

 

 and ((ct.situacao in ('F','P')) or
 (ct.situacao = 'N' and (((Select count(*)
 From dadosfiscais df
 Where df.data > '29/05/2009'
 and df.contrato = ct.numero) +
 (select count(*)
 from contratosdevolvidos cd
 where cd.contrato = ct.numero
 and cd.devolucao > '29/05/2009'
 and cd.situacao = 'F' and cd.produto=pc.produto
 and cd.tipo='D')) > 0)) or
 (ct.situacao = 'C' and ((((Select count(*)
 From contratosdevolvidos cd
 Where cd.devolucao > '29/05/2009' 
 and cd.contrato = ct.numero
 /*and cd.situacao ='F'*/ 
 and cd.produto = pc.produto
 and cd.tipo = 'D') > 0) 
 and (select count(*)
 From produtosdadosfiscais pdf
 where pdf.dadofiscal = (select df.numero
 from DadosFiscais df
 where df.contrato=ct.numero
 and df.data > '29/05/2009')
 and pdf.produto = pc.produto) < pc.quantidade) or
 ((select sum(coalesce(pc2.cancelado,0))
 from produtoscontratos pc2
 where pc2.contrato = ct.numero
 and pc2.produto = pc.produto
 and not exists (select p2.numero
 from parcelas p2
 where p2.contrato = ct.numero
 and p2.tipopagto<>'E')
 and exists (select max(p2.datapagto)
 from parcelas p2
 where p2.contrato = ct.numero
 and p2.datapagto > '29/05/2009')
 and not exists (select cd.contrato
 from contratosdevolvidos cd
 where cd.contrato = ct.numero
 and cd.tipo='D'
 and cd.devolucao <= '29/05/2009')
 and not exists (select df.contrato
 from dadosfiscais df, produtosdadosfiscais pdf
 Where pdf.produto = pc.produto and
 pdf.dadofiscal = df.numero and
 df.contrato = ct.numero and
 df.data <='29/05/2009')
 )<>0))
 ))

 
 
 
 
 

 and ( ((ct.situacao in ('N','P')) and ((pc.quantidade - ((Select coalesce(sum(pdf.quantidade),0)
 From produtosdadosfiscais pdf, dadosfiscais df
 Where pdf.dadofiscal = df.numero
 and df.data <= '29/05/2009'
 and df.contrato = ct.numero
 and pdf.produto = pc.produto and pdf.filial=pc.filial) +
 (select coalesce(sum(cd.quantidade),0)
 from contratosdevolvidos cd
 where cd.contrato = ct.numero
 and cd.devolucao <= '29/05/2009'
 and cd.produto = pc.produto
 and cd.situacao='F'
 and cd.tipo='D'))) > 0)) or
 ((ct.situacao in ('F','C')) and ((pc.quantidade - (Select coalesce(sum(cd.quantidade),0)
 From contratosdevolvidos cd
 Where cd.contrato = ct.numero
 and cd.devolucao <= '29/05/2009'
 and cd.produto = pc.produto
 and cd.situacao = 'F'
 and cd.tipo='D')) > 0)))
)
 union all (
 Select cast('Pendentes Cancelados' as varchar) as situacao,
 ct.numero as contrato,
 ct.faturamento,
 ct.cliente,
 ct.nome as nomecliente,
 ct.filialvenda,
 pc.produto,
 pc.filial,
 cast(p.descricao||' '||coalesce(p.valorgrade1,'')||' '||coalesce(p.valorgrade2,'') as varchar) as descricao,
 p.referencia,
 pc.precovenda,
 ct.valorvista,
 ct.valorprazo,
 ct.desconto,

 case when (pc.quantidade - coalesce(pc.cancelado,0)) = 0 then
 cast('C' as varchar) else cast(null as varchar) end as situacaoprodutocontrato,

 case When devolvidos.Origem = 'CancelamentoTotal' then
 pc.quantidade
 else
 (Select coalesce(sum(cd2.quantidade),0)
 From contratosdevolvidos cd2
 Where cd2.produto = pc.produto and
 cd2.contrato = ct.numero and
 cd2.devolucao <='29/05/2009' and
 cd2.tipo='D')
 end as pendente,
 f.nome as nomefilialvenda,
 devolvidos.devolucao
From

(
(
select devolvidos.contrato,
 devolvidos.produto,
 coalesce(devolvidos.filial, ct2.filialvenda) as filial,
 cast('ContratosDevolvidos' as varchar) as origem,
 devolucao
from
(
select distinct contrato,
 produto,
 filial,
 devolucao
from contratosdevolvidos
where devolucao between '29/05/2009'
 and '29/05/2009'
) as devolvidos join contratos ct2 on devolvidos.contrato = ct2.numero
Where not exists (select pdf.dadofiscal
 from produtosdadosfiscais pdf, dadosfiscais df
 where df.numero = pdf.dadofiscal
 and df.contrato = devolvidos.contrato
 and df.situacao = 'N'
 and pdf.produto = devolvidos.produto)
)
union all
(
select pc2.contrato,
 pc2.produto,
 pc2.filial,
 cast('CancelamentoTotal' as varchar) as origem,
 devolvidos.datapagto as devolucao
from produtoscontratos pc2,
(
select distinct ct3.numero, p1.datapagto
from contratos ct3 join parcelas p1 on ct3.numero = p1.contrato
where ct3.situacao = 'C'
 and p1.datapagto between '29/05/2009' and '29/05/2009'
 and not exists (select p2.numero
 from parcelas p2
 where p2.contrato = ct3.numero
 and (p2.tipopagto<>'E' or p2.tipopagto is null))
 and not exists (select cd.contrato
 from contratosdevolvidos cd
 where cd.contrato = ct3.numero
 and cd.tipo='D')
) as devolvidos
where pc2.contrato = devolvidos.numero
)
) as devolvidos, contratos ct, produtoscontratos pc, produtos p, filiais f
where pc.contrato = devolvidos.contrato
 and pc.produto = devolvidos.produto
 and pc.filial = devolvidos.filial
 and pc.contrato = ct.numero
 and p.codigo = pc.produto
 and ct.filialvenda = f.codigo

 and ( ct.filialvenda in ('2')) 

 
 
 
 
 
 
)
) as selecionados
Order by filialvenda, situacao, Maiusculo(nomecliente), cliente, to_number(contrato,'99999999999999999999'), produto

OK.

END
OK.

DISCONNECT tecsoft
OK.
