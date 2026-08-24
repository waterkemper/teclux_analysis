
SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='clientes'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='clientes') OR lower(nspname || '.' || relname)   = 'clientes') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='clientes') OR lower(nspname || '.' || relname)   = 'clientes')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='clientes') OR lower(nspname || '.' || t2.relname)   = 'clientes')
OK.

Select cl.oid, cl.*,
 (Select cd.nome From cidades cd 
 Where (cd.estado = cl.estado) and (cd.codigo = cl.cidade)) as nomecidadecliente,
 (Select ba.nome From bairros ba
 Where (ba.estado = cl.estado) and (ba.cidade = cl.cidade) and (ba.codigo = cl.bairro)) as nomebairrocliente,
 (Select cd.nome From cidades cd
 Where (cd.estado = cl.empestado) and (cd.codigo = cl.empcidade)) as nomecidadeempresa,
 (Select ba.nome From bairros ba
 Where (ba.estado = cl.empestado) and (ba.cidade = cl.empcidade) and (ba.codigo = cl.empbairro)) as nomebairroempresa,
 (Select cd.nome From cidades cd
 Where (cd.estado = cl.conestado) and (cd.codigo = cl.concidade)) as nomecidadeconjuge,
 (Select ba.nome From bairros ba
 Where (ba.estado = cl.conestado) and (ba.cidade = cl.concidade) and (ba.codigo = cl.conbairro)) as nomebairroconjuge,
 (Select cd.nome From cidades cd
 Where (cd.estado = cl.refestado) and (cd.codigo = cl.refcidade)) as nomecidadereferencia,
 (Select ba.nome From bairros ba
 Where (ba.estado = cl.refestado) and (ba.cidade = cl.refcidade) and (ba.codigo = cl.refbairro)) as nomebairroreferencia,
 (Select cd.nome From cidades cd
 Where (cd.estado = cl.naturalestado) and (cd.codigo = cl.naturalcidade)) as nomecidadenaturalidade,
 cast((cl.filialcadastro||' - '||(Select f.nome From filiais f
 Where (f.codigo = cl.filialcadastro)))as varchar) as nomefilialcadastro,
 (Select cd.nome From cidades cd 
 Where (cd.estado = cl.conestado) and (cd.codigo = cl.concidade)) as concidadenome,
 (Select ba.nome From bairros ba
 Where (ba.estado = cl.conestado) and (ba.cidade = cl.concidade) and (ba.codigo = cl.conbairro)) as conbairronome
From clientes cl
Where cl.codigo ='0'

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='receitaoculos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='receitaoculos') OR lower(nspname || '.' || relname)   = 'receitaoculos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='receitaoculos') OR lower(nspname || '.' || relname)   = 'receitaoculos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='receitaoculos') OR lower(nspname || '.' || t2.relname)   = 'receitaoculos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='contratos') OR lower(nspname || '.' || t2.relname)   = 'contratos')
OK.

select ro.oid, ro.contrato,
 ro.esferico_od,
 ro.cilindro_od,
 ro.eixo_od,
 ro.longe_dnp_od,
 ro.perto_dnp_od,
 ro.esferico_oe,
 ro.cilindro_oe,
 ro.eixo_oe,
 ro.longe_dnp_oe,
 ro.perto_dnp_oe,
 ro.lente,
 ro.cor,
 ro.tipo,
 ro.adicao,
 ro.medida,
 ro.ajuste,
 ro.entrega,
 ro.medico,
 ro.altura,
 cast(case when c.situacao = 'O' then 'O - Orçado'
 when c.situacao = 'R' then 'R - Reservado'
 when c.situacao = 'F' then 'F - Faturado'
 when c.situacao = 'P' then 'P - Nota Parcial'
 when c.situacao = 'N' then 'N - Nota Fiscal'
 when c.situacao = 'C' then 'C - Cancelado'
 end as varchar) as situacao
from receitaoculos ro join contratos c on ro.contrato = c.numero
where c.cliente = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='equipamentos'
OK.

select tablename from pg_tables where tablename='equipamentos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='equipamentos') OR lower(nspname || '.' || relname)   = 'equipamentos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='equipamentos') OR lower(nspname || '.' || relname)   = 'equipamentos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='equipamentos') OR lower(nspname || '.' || relname)   = 'equipamentos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='equipamentos') OR lower(nspname || '.' || relname)   = 'equipamentos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='equipamentos') OR lower(nspname || '.' || t2.relname)   = 'equipamentos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='equipamentos') OR lower(nspname || '.' || t2.relname)   = 'equipamentos')
OK.

select equipamentos.oid, codigo,
 descricao,
 referencia,
 marca,
 modelo,
 opcionais,
 ano
from equipamentos
where codigo = NULL

OK.

select equipamentos.oid, codigo,
 descricao,
 referencia,
 marca,
 modelo,
 opcionais,
 ano
from equipamentos
where codigo = NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='marcas') OR lower(nspname || '.' || relname)   = 'marcas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='marcas') OR lower(nspname || '.' || relname)   = 'marcas')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='marcas') OR lower(nspname || '.' || relname)   = 'marcas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='marcas') OR lower(nspname || '.' || relname)   = 'marcas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='marcas') OR lower(nspname || '.' || t2.relname)   = 'marcas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='marcas') OR lower(nspname || '.' || t2.relname)   = 'marcas')
OK.

SELECT Codigo,
 Descricao

FROM marcas

WHERE Codigo = '0'

OK.

SELECT Codigo,
 Descricao

FROM marcas

WHERE Codigo = '0'

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtos') OR lower(nspname || '.' || t2.relname)   = 'produtos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtos') OR lower(nspname || '.' || t2.relname)   = 'produtos')
OK.

SELECT p.Codigo, p.Descricao, p.ValorGrade1, p.ValorGrade2
FROM produtos p
WHERE p.Codigo = NULL
/* RunTime1*/

OK.

SELECT p.Codigo, p.Descricao, p.ValorGrade1, p.ValorGrade2
FROM produtos p
WHERE p.Codigo = NULL
/* RunTime1*/

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estados') OR lower(nspname || '.' || relname)   = 'estados')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='estados') OR lower(nspname || '.' || t2.relname)   = 'estados')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='estados') OR lower(nspname || '.' || t2.relname)   = 'estados')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='estados') OR lower(nspname || '.' || t2.relname)   = 'estados')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='estados') OR lower(nspname || '.' || t2.relname)   = 'estados')
OK.

select nome, codigo
from estados
where codigo = NULL


OK.

select nome, codigo
from estados
where codigo = NULL


OK.

select nome, codigo
from estados
where codigo = NULL


OK.

select nome, codigo
from estados
where codigo = NULL


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)') OR lower(nspname || '.' || t2.relname)   = '(usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)')
OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

select u.codigo,
 u.nome
from (usuarios u left join gruposusuarios gu on u.grupo=gu.codigo)
where (u.venda or gu.vendedor) and
 u.codigo=NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

select c.codigo,
 c.descricao, c.inativo, c.markuppadrao
from cargos c
where true
 and c.codigo=NULL
 

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

select nome, estado, codigo
from cidades
where estado = 'SC' and
 codigo = NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='modelosdoctosfiscais') OR lower(nspname || '.' || relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='modelosdoctosfiscais') OR lower(nspname || '.' || t2.relname)   = 'modelosdoctosfiscais')
OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

select mdf.*
from modelosdoctosfiscais mdf
where mdf.codigo = NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='osp') OR lower(nspname || '.' || relname)   = 'osp') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='osp') OR lower(nspname || '.' || relname)   = 'osp')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='osp') OR lower(nspname || '.' || t2.relname)   = 'osp')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtos') OR lower(nspname || '.' || t2.relname)   = 'produtos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='caracteristicas') OR lower(nspname || '.' || t2.relname)   = 'caracteristicas')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='clientes') OR lower(nspname || '.' || relname)   = 'clientes') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='clientes') OR lower(nspname || '.' || relname)   = 'clientes')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='clientes') OR lower(nspname || '.' || t2.relname)   = 'clientes')
OK.

select osp.numero,
 osp.data,
 osp.entrega,
 osp.semana,
 osp.ano,
 osp.prioridade,
 osp.observacoes,
 osp.produto,
 p.codigovisual,
 p.descricao,
 osp.cliente,
 osp.pedidocliente,
 osp.quantidade,
 osp.preco,
 (select cp.produto_cliente from clientesprodutos cp where cp.cliente = osp.cliente and p.codigo = cp.produto) as produto_cliente,
 (select cp.fci from clientesprodutos cp where cp.cliente = osp.cliente and p.codigo = cp.produto) as fci,
 (select coalesce(sum(pdf.quantidade),0)
 from dadosfiscais df
 join produtosdadosfiscais pdf
 on df.numero = pdf.dadofiscal
 where df.situacao = 'N'
 and pdf.osp = osp.numero
 and pdf.produto = osp.produto) as qtdeentregue,
 c.unidade,
 c.substituicaoIPI,
 (select ti.valor from tributosicms ti where ti.codigo = c.incidencia) as incidencia,
 c.origem,
 (select cp.origem from clientesprodutos cp where cp.cliente = osp.cliente and p.codigo = cp.produto) as origemproduto,
 c.icms,
 c.baseicms,
 selecionar_aliquotaicms(NULL,cl.estado,cl.pessoatipo, p.codigo /*c.icms*/) as aliquotaicms,
 c.ipi,
 (select ipi.classificacaofiscal from ipi where ipi.codigo = c.ipi) as classificacaofiscal,
 (select ipi.genero from ipi where ipi.codigo = c.ipi) as genero,
 (select ipi.extipi from ipi where ipi.codigo = c.ipi) as extipi,
 c.ICMSModalidade,
 c.ICMSModSubst,
 coalesce((select ipi.aliquota from ipi where ipi.codigo = c.ipi),0.00) as aliquotaipi,
 c.aliquotapis, c.aliqnacional, c.aliqimportado,
 c.aliquotacofins,
 (select cp.pn from clientesprodutos cp where cp.cliente = osp.cliente and p.codigo = cp.produto) as pn,
 c.descricaonanf,

 /*
 (select fcip.valorimportacao
 from fciprodutos fcip
 join fci
 on fcip.fci = fci.numero
 where fcip.produto = p.codigo
 and fcip.codigo_fci is not null
 and fci.dt_validacao_arquivo is not null
 order by cast(fci.dt_validacao_arquivo as timestamp) desc limit 1) as valorimportacao,

 (select fcip.codigo_fci
 from fciprodutos fcip
 join fci
 on fcip.fci = fci.numero
 where fcip.produto = p.codigo
 and fcip.codigo_fci is not null
 and fci.dt_validacao_arquivo is not null
 order by cast(fci.dt_validacao_arquivo as timestamp) desc limit 1) as codigo_fci,

 */

 (select ncm.nacionalfederal
 from ncmtabela ncm
 where (ncm.codigotipi, coalesce(ncm.extipi,'')) in
 (select ipi.classificacaofiscal, coalesce(ipi.extipi,'')
 from ipi
 where ipi.codigo = c.ipi)) as nacionalfederal,

 (select ncm.importadosfederal
 from ncmtabela ncm
 where (ncm.codigotipi, coalesce(ncm.extipi,'')) in
 (select ipi.classificacaofiscal, coalesce(ipi.extipi,'')
 from ipi
 where ipi.codigo = c.ipi)) as importadosfederal,
 (select ncm.cargaestadual
 from ncmtabela ncm
 where (ncm.codigotipi, coalesce(ncm.extipi,'')) in
 (select ipi.classificacaofiscal, coalesce(ipi.extipi,'')
 from ipi
 where ipi.codigo = c.ipi)) as cargaestadual

from OSP
 join produtos p
 join caracteristicas c
 on p.caracteristica = c.codigo
 on osp.produto = p.codigo

 join clientes cl
 on osp.cliente = cl.codigo

where osp.numero = NULL


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') OR lower(nspname || '.' || relname)   = '(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') OR lower(nspname || '.' || relname)   = '(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') OR lower(nspname || '.' || t2.relname)   = '(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)')
OK.


select p.codigo as produto,
 p.codigovisual as produtovisual,
 p.codigo,
 p.codigovisual,
 p.descricao,
 p.valorgrade1,
 p.valorgrade2,
 (select gr.descricao
 from grades gr
 where gr.codigo = c.grade1) as linha,

 (select gr.descricao
 from grades gr
 where gr.codigo = c.grade2) as coluna,

 c.unidade,

 (select cp.pn
 from clientesprodutos cp
 where cp.produto = p.codigo and
 cp.cliente=0 and
 cp.tipocliente = '') as pn,

 (select cp.produto_cliente
 from clientesprodutos cp
 where cp.produto = p.codigo and
 cp.cliente = 0 and
 cp.tipocliente = '') as produto_cliente,
 p.caracteristica,
 c.codigovisual as caracteristicavisual,
 c.setorproducao

from (produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)
where ( upper(to_ascii(p.codigovisual,'latin1')) = upper(to_ascii(NULL,'latin1')) or

 p.codigo in (select pcb.produto
 from produtoscodigobarras pcb
 where pcb.codigobarras = NULL)

 )
 
and ((c.producaopropria and (p.inativo is null or p.inativo > current_date)) or p.codigo = 0)














OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='caracteristicas') OR lower(nspname || '.' || t2.relname)   = 'caracteristicas')
OK.

select c.codigo,
 c.codigovisual,

 c.codigo as caracteristica,
 c.codigovisual as caracteristicavisual,

 c.descricao,
 c.unidade,
 c.setorproducao

from caracteristicas c
where upper(to_ascii(c.codigovisual,'latin1')) = upper(to_ascii(NULL,'latin1'))

and ((c.producaopropria and (c.inativo is null or c.inativo > current_date)) or c.codigo = 0)

/*
 MENSAGEM SUBLIMINAR
 --------------------
 CLIENTE 0
 TIPOCLIENTE ''
*/


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo,

 vf.contribicms

From vfornecedores vf
Where vf.codigo = NULL
 and (vf.tipo = '' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select osp.numero,
 osp.entrega,
 cast(null as date) as entrega_anterior,
 osp.semana,
 osp.ano,
 osp.prioridade,
 osp.observacoes,
 osp.produto,
 osp.data,
 osp.cliente,
 osp.pedidocliente,
 osp.quantidade,
 cast(null as numeric(9,3)) as quantidade_anterior,
 osp.preco,
 
 p.codigovisual as produtovisual,
 p.caracteristica,
 c.codigovisual as caracteristicavisual,
 (select sum(pdf.quantidade)
 from DadosFiscais df join produtosdadosfiscais pdf on df.numero = pdf.dadofiscal
 where df.situacao='N'
 and pdf.osp = osp.numero) as qtdeentregue,
 cast(null as varchar(30)) as complementoproduto,
 c.unidade,
 cl.apelido,
 (select sum(ospl.quantidade) from osplotes ospl where ospl.osp = osp.numero) as quantidade_lote,
 (select sum(ospl.excedente) from osplotes ospl where ospl.osp = osp.numero) as excedente_lote,


 (select sum((select
 (select sum(oou.quantidade - coalesce(oou.retrabalho,0))
 from operacoesospusuario oou
 where oou.osp = oo.osp
 and oou.lote = oo.lote
 and oou.operacao = oo.operacao ) +

 (case when btrim(oo.tipooperacao) = 'A' then

 (select sum(oou2.quantidade - coalesce(oou2.retrabalho,0))
 from operacoesosp oo2
 join operacoesospusuario oou2
 on oo2.operacao = oou2.operacao
 and oo2.osp = oou2.osp
 and oo2.lote = oou2.lote
 where oo2.osp = oo.osp
 and oo2.lote = oo.lote
 and oou2.operacao <> oo.operacao
 and position(btrim(substring(oo.sequencia,1, position('.' in oo.sequencia))) in
 btrim(case when position('.' in oo2.sequencia)<> 0 then oo2.sequencia else cast(oo2.sequencia||cast('.' as varchar) as varchar) end))<>0

 )
 else 0
 end) as produzida
 from operacoesosp oo
 where oo.osp = ospl.osp
 and oo.lote = ospl.numero
 order by cast(oo.sequencia as numeric) desc limit 1
 )) as produzida
 from osplotes ospl
 where ospl.osp = osp.numero) as produzida_lote,

 ((select count(*) from operacoesosp oosp where oosp.osp = osp.numero limit 1) > 0) as pcpiniciado,
 osp.cancelado,
 osp.semiacabado,
 osp.tipocliente,
 c.setorproducao,
 (select descricao from setoresproducao where codigo = c.setorproducao) as descricaosetorproducao

from osp
 join (produtos p
 join caracteristicas c on p.caracteristica = c.codigo)
 on osp.produto = p.codigo
 join clientes cl
 on osp.cliente = cl.codigo

WHERE osp.numero is not null

 AND ((0 = 0) AND
 (0 = 0) AND
 (osp.numero = 51347))

/* codigo */
 OR ((0 =1) AND
 /* PRIMEIRO */
 (((0 = 1) AND ((osp.numero < 51347) or (51347=0)))
 /* ANTERIOR */
 OR ((0 = 2) AND (osp.numero =
 (case when 51347<>0 then
 (SELECT MAX(osp.numero)
 FROM osp
 WHERE osp.numero < 51347)
 else (select min(osp.numero)
 from osp) end)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (osp.numero = (SELECT osp.numero
 FROM osp
 WHERE osp.numero > 51347
 order by osp.numero limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (osp.numero > 51347))))



OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') OR lower(nspname || '.' || relname)   = '(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') OR lower(nspname || '.' || relname)   = '(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)') OR lower(nspname || '.' || t2.relname)   = '(produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)')
OK.


select p.codigo as produto,
 p.codigovisual as produtovisual,
 p.codigo,
 p.codigovisual,
 p.descricao,
 p.valorgrade1,
 p.valorgrade2,
 (select gr.descricao
 from grades gr
 where gr.codigo = c.grade1) as linha,

 (select gr.descricao
 from grades gr
 where gr.codigo = c.grade2) as coluna,

 c.unidade,

 (select cp.pn
 from clientesprodutos cp
 where cp.produto = p.codigo and
 cp.cliente=70 and
 cp.tipocliente = 'C') as pn,

 (select cp.produto_cliente
 from clientesprodutos cp
 where cp.produto = p.codigo and
 cp.cliente = 70 and
 cp.tipocliente = 'C') as produto_cliente,
 p.caracteristica,
 c.codigovisual as caracteristicavisual,
 c.setorproducao

from (produtos p
 join (((caracteristicas c
 join classes cl
 on c.classe=cl.codigo)
 join grupos g
 on g.codigo=c.grupo)
 join marcas m
 on c.marca = m.codigo)
 on p.caracteristica = c.codigo)
where ( upper(to_ascii(p.codigovisual,'latin1')) = upper(to_ascii('SUPRESSOR SKS 4,05X31,5 1K 20%','latin1')) or

 p.codigo in (select pcb.produto
 from produtoscodigobarras pcb
 where pcb.codigobarras = 'SUPRESSOR SKS 4,05X31,5 1K 20%')

 )
 
and ((c.producaopropria and (p.inativo is null or p.inativo > current_date)) or p.codigo = 1092500)














OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

Select coalesce(vf.razao,vf.nome) as nome,
 vf.codigo,
 vf.tipo,
 (case when vf.tipo='C' then
 (select cl.vendedor
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(0 as integer) end) as vendedor,
 vf.rua,
 vf.numero,
 vf.complemento,
 vf.bairro,

 (select b.nome
 from bairros b
 where b.estado = vf.estado
 and b.cidade = vf.cidade
 and b.codigo = vf.bairro) as NomeBairro,

 vf.cidade,

 (select c.nome
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as NomeCidade,


 (select c.CodigoIBGE
 from cidades c
 where c.estado = vf.estado
 and c.codigo = vf.cidade) as CidadeIBGE,

 vf.estado,
 vf.cep,

 (case when vf.tipo='C' then
 (select cl.refrua
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(100)) end) as refrua,

 (case when vf.tipo='C' then
 (select cl.refNumero
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refNumero,

 (case when vf.tipo='C' then
 (select cl.refComplemento
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(60)) end) as refComplemento,

 (case when vf.tipo='C' then
 (select cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refBairro,

 (case when vf.tipo='C' then
 (select b.nome
 from bairros b
 where (b.estado,b.cidade,b.codigo) in
 (select cl.refestado,
 cl.refcidade,
 cl.refBairro
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeBairro,

 (case when vf.tipo='C' then
 (select cl.refCidade
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCidade,

 (case when vf.tipo='C' then
 (select cl.refCep
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as integer) end) as refCep,

 (case when vf.tipo='C' then
 (select c.nome
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as varchar(60)) end) as refNomeCidade,

 (case when vf.tipo='C' then
 (select c.CodigoIBGE
 from cidades c
 where (c.estado,c.codigo) in
 (select cl.refestado,
 cl.refcidade
 from clientes cl
 where cl.codigo = vf.codigo))
 else
 cast(null as integer) end) as refCidadeIBGE,

 (case when vf.tipo='C' then
 (select cl.refestado
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar(2)) end) as refestado,

 vf.pessoatipo,
 vf.pessoanumero,
 vf.fonenumero,
 vf.foneddd,
 vf.foneramal,
 vf.inscricaoestadual,
 vf.conceito,
 vf.email,

 (case when vf.tipo='C' then
 (select cl.suframa
 from clientes cl
 where cl.codigo = vf.codigo)
 else (case when vf.tipo='F' then
 (select f.suframa
 from fornecedores f
 where f.codigo = vf.codigo)
 end)
 end) as suframa,

 (case when vf.tipo='C' then
 (select cl.obsnotafiscal
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsnotafiscal,

 (case when vf.tipo='C' then
 (select cl.obsipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 cast(null as varchar) end) as obsipisuspenso,

 (case when vf.tipo='C' then
 (select cl.ipisuspenso
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as ipisuspenso,

 (case when vf.tipo='C' then
 (select cl.apelido
 from clientes cl
 where cl.codigo = vf.codigo)
 else vf.nome end) as apelido,

 vf.debito,
 vf.credito,

 (case when vf.tipo='C' then
 (select coalesce(cl.TagAdPedNFE,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as TagAdPedNFE,

 (case when vf.tipo='C' then
 (select coalesce(cl.recolhericmsst,false)
 from clientes cl
 where cl.codigo = vf.codigo)
 else
 false end) as recolhericmsst,

 (case when vf.tipo='C' then
 (select c.descricao from cargos c where c.codigo = (select cl.empcargo from clientes cl where cl.codigo = vf.codigo))
 else
 cast(null as varchar(30))
 end) as descricaocargo,

 vf.contribicms

From vfornecedores vf
Where vf.codigo = 70
 and (vf.tipo = 'C' or NULL)

 /* and (vf.tipo <> 'L') */

 
Order By UPPER(TO_ASCII(coalesce(vf.razao,vf.nome),'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='clientesprodutos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='clientesprodutos') OR lower(nspname || '.' || relname)   = 'clientesprodutos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='clientesprodutos') OR lower(nspname || '.' || relname)   = 'clientesprodutos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='clientesprodutos') OR lower(nspname || '.' || t2.relname)   = 'clientesprodutos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtos') OR lower(nspname || '.' || t2.relname)   = 'produtos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='caracteristicas') OR lower(nspname || '.' || t2.relname)   = 'caracteristicas')
OK.

SELECT cp.oid, cp.Cliente,
 cp.TipoCliente,
 cp.Produto,
 cp.Produto_Cliente,
 cp.Finalidade,
 cp.PN,
 cp.Origem,
 cp.TamLoteProducao,
 cp.ExcedentePermitido,
 CP.tipoexcedente,
 cp.Revisao
 
FROM clientesprodutos cp
 JOIN Produtos p ON p.Codigo = cp.Produto
 JOIN Caracteristicas c ON c.Codigo = p.Caracteristica

WHERE cp.Cliente = 70
 AND cp.TipoCliente = 'C'
 AND cp.Produto = '1092500' 
 AND (c.Inativo IS NULL OR (c.Inativo IS NOT NULL AND c.Inativo >= CURRENT_DATE))
 AND (p.Inativo IS NULL OR (p.Inativo IS NOT NULL AND p.Inativo >= CURRENT_DATE))


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='osplotes'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='osplotes') OR lower(nspname || '.' || relname)   = 'osplotes') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='osplotes') OR lower(nspname || '.' || relname)   = 'osplotes')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='osplotes') OR lower(nspname || '.' || t2.relname)   = 'osplotes')
OK.

select ospl.oid, (select 
 (select sum(oou.quantidade - coalesce(oou.retrabalho,0))
 from operacoesospusuario oou
 where oou.osp = oo.osp
 and oou.lote = oo.lote
 and oou.operacao = oo.operacao ) +

 (case when btrim(oo.tipooperacao) = 'A' then

 (select sum(oou2.quantidade - coalesce(oou2.retrabalho,0))
 from operacoesosp oo2
 join operacoesospusuario oou2
 on oo2.operacao = oou2.operacao
 and oo2.osp = oou2.osp
 and oo2.lote = oou2.lote
 where oo2.osp = oo.osp
 and oo2.lote = oo.lote
 and oou2.operacao <> oo.operacao
 and position(btrim(substring(oo.sequencia,1, position('.' in oo.sequencia))) in
 btrim(case when position('.' in oo2.sequencia)<> 0 then oo2.sequencia else cast(oo2.sequencia||cast('.' as varchar) as varchar) end))<>0

 )
 else 0
 end) as produzida
 from operacoesosp oo
 where oo.osp = ospl.osp
 and oo.lote = ospl.numero
 order by cast(oo.sequencia as numeric) desc limit 1
 ) as produzida,

 ospl.*,

 false as Imprimir
from osplotes ospl
where ospl.osp = 51347
order by ospl.numero

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='precos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='precos') OR lower(nspname || '.' || relname)   = 'precos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='precos') OR lower(nspname || '.' || relname)   = 'precos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='precos') OR lower(nspname || '.' || t2.relname)   = 'precos')
OK.

select precos.oid, precos.codigo,
 precos.caracteristica,
 precos.descricao
from precos
where precos.caracteristica = 0

OK.

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

select produtos.oid,
 codigo,
 descricao,
 caracteristica,
 preco,
 codigovisual
from produtos
where (upper(to_ascii(codigovisual,'latin1')) = upper(to_ascii(0,'latin1')))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='colunasprecos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='colunasprecos') OR lower(nspname || '.' || relname)   = 'colunasprecos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='colunasprecos') OR lower(nspname || '.' || relname)   = 'colunasprecos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='colunasprecos') OR lower(nspname || '.' || t2.relname)   = 'colunasprecos')
OK.

select colunasprecos.oid, caracteristica,
 preco,
 coluna,
 data,
 valor
from colunasprecos
where colunasprecos.caracteristica = 0 and
 colunasprecos.preco = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='estoques'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estoques') OR lower(nspname || '.' || relname)   = 'estoques') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='estoques') OR lower(nspname || '.' || relname)   = 'estoques')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='estoques') OR lower(nspname || '.' || t2.relname)   = 'estoques')
OK.

select e.oid, e.produto,
 e.filial,
 e.localizacao,
 e.minimo,
 e.maximo,
 e.emestoque,
 e.reservado,
 e.transito,
 e.demonstracao,
 e.conserto,
 e.futuro,
 e.danificada,
 e.estoquefisico,
 (select f.nome from filiais f where f.codigo = e.filial) as descricaofilial
from estoques e
where (e.produto =0) 

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

(
select cast('OSP '||osp.numero||' ' as varchar) as origem,
 osp.preco,
 osp.data
from osp
where osp.cliente = 70
 and osp.produto = '1092500'
order by osp.data desc limit 1
)
union all
(
select cast('TABELA ' as varchar) as origem,
 Valor,
 ColunasPrecos.data
FROM Colunasprecos, Produtos
WHERE Produtos.Codigo = '1092500'
 AND Produtos.Caracteristica = ColunasPrecos.Caracteristica
 AND Produtos.Preco = ColunasPrecos.Preco
 AND ColunasPrecos.Coluna = (SELECT PrecoNormal
 FROM Filiais
 WHERE Codigo = 1)
order by ColunasPrecos.data desc limit 1
)


ERROR:  operator is not unique: unknown || integer at character 21
HINT:  Could not choose a best candidate operator. You might need to add explicit type casts.

ROLLBACK
OK.

BEGIN
OK.
SET DateStyle TO 'ISO'
OK.
SET DateStyle TO 'ISO, European'
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)') OR lower(nspname || '.' || relname)   = '(produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)') OR lower(nspname || '.' || relname)   = '(produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)') OR lower(nspname || '.' || t2.relname)   = '(produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)')
OK.
Select p.codigo,  p.codigovisual,   codigobarras(p.codigo) as codigobarras,  cast(p.descricao || coalesce(' '||p.valorgrade1,'') || coalesce(' '||p.valorgrade2,'') || coalesce(' '||p.referencia,'') as varchar(120) ) as descricao,  p.valorgrade1,  p.valorgrade2,   c.bitola,  c.liga,  c.resistividade,  c.tolerancia,   (select cp.pn  from clientesprodutos cp  where cp.produto = p.codigo and  cp.cliente=0 and  cp.tipocliente='C') as pn,   (select cp.produto_cliente  from clientesprodutos cp  where cp.produto = p.codigo and  cp.cliente = 0 and  cp.tipocliente = 'C') as produto_cliente,  c.peso,  p.inativo    from (produtos p  join (((caracteristicas c  join classes cl  on c.classe=cl.codigo)  join grupos g  on g.codigo=c.grupo)  join marcas m  on c.marca = m.codigo)  on p.caracteristica = c.codigo)  where true  and p.codigo in (select cp.produto from clientesprodutos cp where cp.cliente = 0 and cp.tipocliente = 'C') and (to_ascii(p.descricao,'latin1') ilike to_ascii('C%','latin1')) and ((c.producaopropria and (p.inativo is null or p.inativo > current_date)) or p.codigo = 0)                 /*  NULL  */ 
OK.
SET DateStyle TO 'ISO'
OK.
SET DateStyle TO 'ISO, European'
OK.
select pa.* from produtosagendamentos pa where pa.produto = '11435' order by pa.dias 
OK.
SET DateStyle TO 'ISO'
OK.
SET DateStyle TO 'ISO, European'
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') OR lower(nspname || '.' || t2.relname)   = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)')
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') OR lower(nspname || '.' || t2.relname)   = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)')
OK.
select distinct eg1.valor from  (elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo), (elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo) where  g1.codigo = 27  and g2.codigo = 1 and eg1.valor||eg2.valor not in ('AZULG','AZULGG','AZULM','AZULP','AZULXGG')  order by eg1.valor 
OK.
SET DateStyle TO 'ISO'
OK.
SET DateStyle TO 'ISO, European'
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)') OR lower(nspname || '.' || t2.relname)   = '(elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo)')
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') OR lower(nspname || '.' || relname)   = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)') OR lower(nspname || '.' || t2.relname)   = '(elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo)')
OK.
select distinct eg2.valor from  (elementosgrades eg1 join grades g1 on eg1.grade = g1.codigo), (elementosgrades eg2 join grades g2 on eg2.grade = g2.codigo) where  g1.codigo = 27  and g2.codigo = 1 and eg1.valor||eg2.valor not in ('AZULG','AZULGG','AZULM','AZULP','AZULXGG') and eg1.valor = 'AZUL' order by eg2.valor 
OK.
SET DateStyle TO 'ISO'
OK.
SET DateStyle TO 'ISO, European'
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='precos') OR lower(nspname || '.' || relname)   = 'precos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='precos') OR lower(nspname || '.' || relname)   = 'precos')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='precos') OR lower(nspname || '.' || t2.relname)   = 'precos')
OK.
SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='promocoes') OR lower(nspname || '.' || relname)   = 'promocoes') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='promocoes') OR lower(nspname || '.' || relname)   = 'promocoes')
OK.
SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='promocoes') OR lower(nspname || '.' || t2.relname)   = 'promocoes')
OK.
select precos.codigo,  precos.descricao,  precos.promocao,  pro.descricao as descricaopromocao,  pro.validade  from precos left join promocoes pro on precos.promocao = pro.codigo  where precos.caracteristica = '10167' and  precos.codigo = 2  
OK.
