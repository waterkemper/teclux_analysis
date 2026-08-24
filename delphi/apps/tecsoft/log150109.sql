
SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='eventos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='eventos') OR lower(nspname || '.' || relname)   = 'eventos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='eventos') OR lower(nspname || '.' || relname)   = 'eventos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='eventos') OR lower(nspname || '.' || t2.relname)   = 'eventos')
OK.

SELECT e.oid, e.Codigo,
 e.Descricao,
 not e.Saida as Entrada,
 e.Saida,
 e.CentroCusto,
 e.Recibo,
 e.SaldoCliente,
 e.Conta,
 e.Inativo,
 e.classificacao,
 e.tipo,
 e.planilhacustos
FROM eventos e

WHERE e.Codigo is not null

 AND ((0 = 0) AND
 (0 = 0) AND
 (codigo = 0))

/* codigo */
 OR ((0 =1) AND
 /* PRIMEIRO */
 (((0 = 1) AND ((codigo < 0) or (0=0)))
 /* ANTERIOR */
 OR ((0 = 2) AND (codigo =
 (case when 0<>0 then
 (SELECT MAX(codigo)
 FROM Eventos
 WHERE codigo < 0)
 else (select min(codigo)
 from Eventos) end)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE Codigo > 0
 order by codigo limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo > 0))))

/* classificacao */
 OR ((0 = 2) AND
 /* PRIMEIRO */
 (((0 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((classificacao < NULL)
 OR (classificacao = NULL
 and descricao <= NULL
 and codigo<0)
 OR (NULL = ''
 and NULL = ''
 and 0 = 0)
 )
 ORDER by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((0 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao < NULL)
 OR
 (case when classificacao = NULL and
 descricao = NULL
 then classificacao = NULL
 and descricao <= NULL
 and codigo<0
 else classificacao = NULL and
 descricao <= NULL end)
 )
 ORDER by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao > NULL)
 OR
 (case when classificacao = NULL and
 descricao = NULL
 then classificacao = NULL
 and descricao >= NULL
 and codigo>0
 else classificacao = NULL and
 descricao >= NULL end)
 )
 order by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((classificacao > NULL)
 OR (classificacao = NULL
 and descricao >= NULL
 and codigo>0))
 order by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))))

/* descricao */
 OR ((0 = 3) AND
 /* PRIMEIRO */
 (((0 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao < NULL)
 OR (descricao = NULL
 and classificacao <= NULL
 and codigo<0))
 ORDER by Maiusculo(descricao), classificacao, codigo limit 1)))

 /* ANTERIOR */
 OR ((0 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao < NULL)
 OR
 (case when descricao = NULL and
 classificacao = NULL
 then descricao = NULL
 and classificacao <= NULL
 and codigo<0
 else descricao = NULL and
 classificacao <= NULL end)
 )
 ORDER by Maiusculo(descricao) desc, classificacao desc, codigo desc limit 1)))

 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao > NULL)
 OR
 (case when descricao = NULL and
 classificacao = NULL
 then descricao = NULL
 and classificacao >= NULL
 and codigo > 0
 else descricao = NULL and
 classificacao >= NULL end)
 )
 order by UPPER(TO_ASCII(descricao,'LATIN1')), classificacao, codigo limit 1)))

 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao > NULL)
 OR (descricao = NULL
 and classificacao >= NULL
 and codigo > 0))
 order by UPPER(TO_ASCII(descricao,'LATIN1')) desc, classificacao desc, codigo desc limit 1)))))

/* data inativo */
 OR ((0 = 4) AND
 /* PRIMEIRO */
 (((0 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when NULL <> '01/01/1900' then
 ((inativo < NULL)
 OR (inativo = NULL
 and classificacao <= NULL
 and descricao <= NULL
 and codigo<0))
 else true end)
 and inativo is not null
 ORDER by inativo,classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((0 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when NULL <> '01/01/1900' then
 ( (inativo < NULL)
 OR
 (case when inativo = NULL and
 classificacao <= NULL and
 descricao <= NULL
 then inativo = NULL and
 classificacao <= NULL
 and descricao <= NULL
 and codigo<0
 else inativo = NULL and
 classificacao <= NULL and
 descricao <= NULL end)
 )
 else true end)
 and inativo is not null
 ORDER by inativo desc, classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when NULL <> '01/01/1900' then
 ( (inativo > NULL)
 OR
 (case when inativo = NULL and
 classificacao >= NULL and
 descricao >= NULL
 then inativo = NULL and
 classificacao >= NULL
 and descricao >= NULL
 and codigo>0
 else inativo = NULL and
 classificacao >= NULL and
 descricao >= NULL end)
 )
 else true end)
 and inativo is not null
 order by inativo, classificacao, UPPER(TO_ASCII(descricao,'LATIN1')) , codigo limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((inativo > NULL)
 OR (inativo = NULL and
 classificacao = NULL
 and descricao >= NULL
 and codigo>0))
 order by inativo desc, classificacao desc, Maiusculo(descricao) desc, codigo desc limit 1)))))




OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='historicos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='historicos') OR lower(nspname || '.' || relname)   = 'historicos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='historicos') OR lower(nspname || '.' || relname)   = 'historicos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='historicos') OR lower(nspname || '.' || t2.relname)   = 'historicos')
OK.

Select h.oid, h.Codigo,
 h.Descricao
From historicos h
Where (h.Codigo = NULL)
--Preenchido em runtime. Não Apague!

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='planocontas') OR lower(nspname || '.' || relname)   = 'planocontas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='planocontas') OR lower(nspname || '.' || relname)   = 'planocontas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='planocontas') OR lower(nspname || '.' || t2.relname)   = 'planocontas')
OK.

SELECT Codigo,
 CAST(BTRIM(Classificacao, '. ') AS VARCHAR) as Classificacao,
 Descricao, tipo

FROM planocontas

WHERE Codigo = NULL
 AND Codigo <> '0'
 and tipo = 'A'
 
 


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='eventos'
OK.

SELECT e.oid, e.Codigo,
 e.Descricao,
 not e.Saida as Entrada,
 e.Saida,
 e.CentroCusto,
 e.Recibo,
 e.SaldoCliente,
 e.Conta,
 e.Inativo,
 e.classificacao,
 e.tipo,
 e.planilhacustos
FROM eventos e

WHERE e.Codigo is not null

 AND ((0 = 0) AND
 (0 = 0) AND
 (codigo = 80))

/* codigo */
 OR ((0 =1) AND
 /* PRIMEIRO */
 (((0 = 1) AND ((codigo < 80) or (80=0)))
 /* ANTERIOR */
 OR ((0 = 2) AND (codigo =
 (case when 80<>0 then
 (SELECT MAX(codigo)
 FROM Eventos
 WHERE codigo < 80)
 else (select min(codigo)
 from Eventos) end)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE Codigo > 80
 order by codigo limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo > 80))))

/* classificacao */
 OR ((0 = 2) AND
 /* PRIMEIRO */
 (((0 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((classificacao < NULL)
 OR (classificacao = NULL
 and descricao <= NULL
 and codigo<80)
 OR (NULL = ''
 and NULL = ''
 and 80 = 0)
 )
 ORDER by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((0 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao < NULL)
 OR
 (case when classificacao = NULL and
 descricao = NULL
 then classificacao = NULL
 and descricao <= NULL
 and codigo<80
 else classificacao = NULL and
 descricao <= NULL end)
 )
 ORDER by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao > NULL)
 OR
 (case when classificacao = NULL and
 descricao = NULL
 then classificacao = NULL
 and descricao >= NULL
 and codigo>80
 else classificacao = NULL and
 descricao >= NULL end)
 )
 order by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((classificacao > NULL)
 OR (classificacao = NULL
 and descricao >= NULL
 and codigo>80))
 order by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))))

/* descricao */
 OR ((0 = 3) AND
 /* PRIMEIRO */
 (((0 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao < NULL)
 OR (descricao = NULL
 and classificacao <= NULL
 and codigo<80))
 ORDER by Maiusculo(descricao), classificacao, codigo limit 1)))

 /* ANTERIOR */
 OR ((0 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao < NULL)
 OR
 (case when descricao = NULL and
 classificacao = NULL
 then descricao = NULL
 and classificacao <= NULL
 and codigo<80
 else descricao = NULL and
 classificacao <= NULL end)
 )
 ORDER by Maiusculo(descricao) desc, classificacao desc, codigo desc limit 1)))

 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao > NULL)
 OR
 (case when descricao = NULL and
 classificacao = NULL
 then descricao = NULL
 and classificacao >= NULL
 and codigo > 80
 else descricao = NULL and
 classificacao >= NULL end)
 )
 order by UPPER(TO_ASCII(descricao,'LATIN1')), classificacao, codigo limit 1)))

 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao > NULL)
 OR (descricao = NULL
 and classificacao >= NULL
 and codigo > 80))
 order by UPPER(TO_ASCII(descricao,'LATIN1')) desc, classificacao desc, codigo desc limit 1)))))

/* data inativo */
 OR ((0 = 4) AND
 /* PRIMEIRO */
 (((0 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when NULL <> '01/01/1900' then
 ((inativo < NULL)
 OR (inativo = NULL
 and classificacao <= NULL
 and descricao <= NULL
 and codigo<80))
 else true end)
 and inativo is not null
 ORDER by inativo,classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((0 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when NULL <> '01/01/1900' then
 ( (inativo < NULL)
 OR
 (case when inativo = NULL and
 classificacao <= NULL and
 descricao <= NULL
 then inativo = NULL and
 classificacao <= NULL
 and descricao <= NULL
 and codigo<80
 else inativo = NULL and
 classificacao <= NULL and
 descricao <= NULL end)
 )
 else true end)
 and inativo is not null
 ORDER by inativo desc, classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((0 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when NULL <> '01/01/1900' then
 ( (inativo > NULL)
 OR
 (case when inativo = NULL and
 classificacao >= NULL and
 descricao >= NULL
 then inativo = NULL and
 classificacao >= NULL
 and descricao >= NULL
 and codigo>80
 else inativo = NULL and
 classificacao >= NULL and
 descricao >= NULL end)
 )
 else true end)
 and inativo is not null
 order by inativo, classificacao, UPPER(TO_ASCII(descricao,'LATIN1')) , codigo limit 1)))
 /* ÚLTIMO */
 OR ((0 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((inativo > NULL)
 OR (inativo = NULL and
 classificacao = NULL
 and descricao >= NULL
 and codigo>80))
 order by inativo desc, classificacao desc, Maiusculo(descricao) desc, codigo desc limit 1)))))




OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='eventos') OR lower(nspname || '.' || relname)   = 'eventos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='eventos') OR lower(nspname || '.' || relname)   = 'eventos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='eventos') OR lower(nspname || '.' || t2.relname)   = 'eventos')
OK.

SELECT cast(repeat(' ', length(btrim(e.classificacao)))||e.Descricao as varchar) as Descricao,
 e.classificacao,
 e.Codigo,
 e.tipo,
 (select count(*)
 from eventos
 where strpos(classificacao,'2')=1
 and tipo='S'
 and classificacao<>'2'
 and codigo <> 0) as nsinteticasultima,

 (select count(*)
 from planocontas
 where strpos(classificacao,'2')=1
 and tipo='A'
 and codigo <> 0) as nanaliticasultima


FROM eventos e

WHERE e.tipo = 'S' 
 AND e.Inativo IS NULL
and btrim(btrim(e.classificacao,'. ')) in ('2','2.01')

ORDER BY e.classificacao

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='historicoseventos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='historicoseventos') OR lower(nspname || '.' || relname)   = 'historicoseventos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='historicoseventos') OR lower(nspname || '.' || relname)   = 'historicoseventos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='historicoseventos') OR lower(nspname || '.' || t2.relname)   = 'historicoseventos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='historicos') OR lower(nspname || '.' || relname)   = 'historicos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='historicos') OR lower(nspname || '.' || relname)   = 'historicos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='historicos') OR lower(nspname || '.' || t2.relname)   = 'historicos')
OK.

Select he.oid, he.Historico,
 h.Descricao,
 he.Evento,
 he.Menu
From historicoseventos he, historicos h
Where (he.Evento =80) and
 (he.Historico = h.Codigo)

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='eventos'
OK.

SELECT e.oid, e.Codigo,
 e.Descricao,
 not e.Saida as Entrada,
 e.Saida,
 e.CentroCusto,
 e.Recibo,
 e.SaldoCliente,
 e.Conta,
 e.Inativo,
 e.classificacao,
 e.tipo,
 e.planilhacustos
FROM eventos e

WHERE e.Codigo is not null

 AND ((3 = 0) AND
 (3 = 0) AND
 (codigo = 80))

/* codigo */
 OR ((3 =1) AND
 /* PRIMEIRO */
 (((3 = 1) AND ((codigo < 80) or (80=0)))
 /* ANTERIOR */
 OR ((3 = 2) AND (codigo =
 (case when 80<>0 then
 (SELECT MAX(codigo)
 FROM Eventos
 WHERE codigo < 80)
 else (select min(codigo)
 from Eventos) end)))
 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE Codigo > 80
 order by codigo limit 1)))
 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo > 80))))

/* classificacao */
 OR ((3 = 2) AND
 /* PRIMEIRO */
 (((3 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((classificacao < '2.01')
 OR (classificacao = '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<80)
 OR ('2.01' = ''
 and 'Viagens e Hospedagens' = ''
 and 80 = 0)
 )
 ORDER by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((3 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao < '2.01')
 OR
 (case when classificacao = '2.01' and
 descricao = 'Viagens e Hospedagens'
 then classificacao = '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<80
 else classificacao = '2.01' and
 descricao <= 'Viagens e Hospedagens' end)
 )
 ORDER by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao > '2.01')
 OR
 (case when classificacao = '2.01' and
 descricao = 'Viagens e Hospedagens'
 then classificacao = '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>80
 else classificacao = '2.01' and
 descricao >= 'Viagens e Hospedagens' end)
 )
 order by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))
 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((classificacao > '2.01')
 OR (classificacao = '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>80))
 order by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))))

/* descricao */
 OR ((3 = 3) AND
 /* PRIMEIRO */
 (((3 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao < 'Viagens e Hospedagens')
 OR (descricao = 'Viagens e Hospedagens'
 and classificacao <= '2.01'
 and codigo<80))
 ORDER by Maiusculo(descricao), classificacao, codigo limit 1)))

 /* ANTERIOR */
 OR ((3 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao < 'Viagens e Hospedagens')
 OR
 (case when descricao = 'Viagens e Hospedagens' and
 classificacao = '2.01'
 then descricao = 'Viagens e Hospedagens'
 and classificacao <= '2.01'
 and codigo<80
 else descricao = 'Viagens e Hospedagens' and
 classificacao <= '2.01' end)
 )
 ORDER by Maiusculo(descricao) desc, classificacao desc, codigo desc limit 1)))

 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao > 'Viagens e Hospedagens')
 OR
 (case when descricao = 'Viagens e Hospedagens' and
 classificacao = '2.01'
 then descricao = 'Viagens e Hospedagens'
 and classificacao >= '2.01'
 and codigo > 80
 else descricao = 'Viagens e Hospedagens' and
 classificacao >= '2.01' end)
 )
 order by UPPER(TO_ASCII(descricao,'LATIN1')), classificacao, codigo limit 1)))

 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao > 'Viagens e Hospedagens')
 OR (descricao = 'Viagens e Hospedagens'
 and classificacao >= '2.01'
 and codigo > 80))
 order by UPPER(TO_ASCII(descricao,'LATIN1')) desc, classificacao desc, codigo desc limit 1)))))

/* data inativo */
 OR ((3 = 4) AND
 /* PRIMEIRO */
 (((3 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when '01/01/1900' <> '01/01/1900' then
 ((inativo < '01/01/1900')
 OR (inativo = '01/01/1900'
 and classificacao <= '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<80))
 else true end)
 and inativo is not null
 ORDER by inativo,classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((3 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when '01/01/1900' <> '01/01/1900' then
 ( (inativo < '01/01/1900')
 OR
 (case when inativo = '01/01/1900' and
 classificacao <= '2.01' and
 descricao <= 'Viagens e Hospedagens'
 then inativo = '01/01/1900' and
 classificacao <= '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<80
 else inativo = '01/01/1900' and
 classificacao <= '2.01' and
 descricao <= 'Viagens e Hospedagens' end)
 )
 else true end)
 and inativo is not null
 ORDER by inativo desc, classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when '01/01/1900' <> '01/01/1900' then
 ( (inativo > '01/01/1900')
 OR
 (case when inativo = '01/01/1900' and
 classificacao >= '2.01' and
 descricao >= 'Viagens e Hospedagens'
 then inativo = '01/01/1900' and
 classificacao >= '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>80
 else inativo = '01/01/1900' and
 classificacao >= '2.01' and
 descricao >= 'Viagens e Hospedagens' end)
 )
 else true end)
 and inativo is not null
 order by inativo, classificacao, UPPER(TO_ASCII(descricao,'LATIN1')) , codigo limit 1)))
 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((inativo > '01/01/1900')
 OR (inativo = '01/01/1900' and
 classificacao = '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>80))
 order by inativo desc, classificacao desc, Maiusculo(descricao) desc, codigo desc limit 1)))))


ORDER BY UPPER(TO_ASCII(Descricao,'LATIN1')), classificacao, codigo LIMIT 1

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='eventos') OR lower(nspname || '.' || relname)   = 'eventos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='eventos') OR lower(nspname || '.' || relname)   = 'eventos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='eventos') OR lower(nspname || '.' || t2.relname)   = 'eventos')
OK.

SELECT e.Codigo,
 e.Descricao,
 not e.Saida as Entrada,
 e.Saida,
 e.CentroCusto,
 e.Recibo,
 e.SaldoCliente,
 e.Conta,
 e.Inativo,
 e.classificacao,
 e.tipo,
 e.planilhacustos
FROM eventos e

WHERE e.Codigo is not null

 AND ((3 = 0) AND
 (3 = 0) AND
 (codigo = 61))

/* codigo */
 OR ((3 =1) AND
 /* PRIMEIRO */
 (((3 = 1) AND ((codigo < 61) or (61=0)))
 /* ANTERIOR */
 OR ((3 = 2) AND (codigo =
 (case when 61<>0 then
 (SELECT MAX(codigo)
 FROM Eventos
 WHERE codigo < 61)
 else (select min(codigo)
 from Eventos) end)))
 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE Codigo > 61
 order by codigo limit 1)))
 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo > 61))))

/* classificacao */
 OR ((3 = 2) AND
 /* PRIMEIRO */
 (((3 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((classificacao < '2.01')
 OR (classificacao = '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<61)
 OR ('2.01' = ''
 and 'Viagens e Hospedagens' = ''
 and 61 = 0)
 )
 ORDER by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((3 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao < '2.01')
 OR
 (case when classificacao = '2.01' and
 descricao = 'Viagens e Hospedagens'
 then classificacao = '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<61
 else classificacao = '2.01' and
 descricao <= 'Viagens e Hospedagens' end)
 )
 ORDER by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (classificacao > '2.01')
 OR
 (case when classificacao = '2.01' and
 descricao = 'Viagens e Hospedagens'
 then classificacao = '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>61
 else classificacao = '2.01' and
 descricao >= 'Viagens e Hospedagens' end)
 )
 order by classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))
 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((classificacao > '2.01')
 OR (classificacao = '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>61))
 order by classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))))

/* descricao */
 OR ((3 = 3) AND
 /* PRIMEIRO */
 (((3 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao < 'Viagens e Hospedagens')
 OR (descricao = 'Viagens e Hospedagens'
 and classificacao <= '2.01'
 and codigo<61))
 ORDER by Maiusculo(descricao), classificacao, codigo limit 1)))

 /* ANTERIOR */
 OR ((3 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao < 'Viagens e Hospedagens')
 OR
 (case when descricao = 'Viagens e Hospedagens' and
 classificacao = '2.01'
 then descricao = 'Viagens e Hospedagens'
 and classificacao <= '2.01'
 and codigo<61
 else descricao = 'Viagens e Hospedagens' and
 classificacao <= '2.01' end)
 )
 ORDER by Maiusculo(descricao) desc, classificacao desc, codigo desc limit 1)))

 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ( (descricao > 'Viagens e Hospedagens')
 OR
 (case when descricao = 'Viagens e Hospedagens' and
 classificacao = '2.01'
 then descricao = 'Viagens e Hospedagens'
 and classificacao >= '2.01'
 and codigo > 61
 else descricao = 'Viagens e Hospedagens' and
 classificacao >= '2.01' end)
 )
 order by UPPER(TO_ASCII(descricao,'LATIN1')), classificacao, codigo limit 1)))

 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE ((descricao > 'Viagens e Hospedagens')
 OR (descricao = 'Viagens e Hospedagens'
 and classificacao >= '2.01'
 and codigo > 61))
 order by UPPER(TO_ASCII(descricao,'LATIN1')) desc, classificacao desc, codigo desc limit 1)))))

/* data inativo */
 OR ((3 = 4) AND
 /* PRIMEIRO */
 (((3 = 1) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when '01/01/1900' <> '01/01/1900' then
 ((inativo < '01/01/1900')
 OR (inativo = '01/01/1900'
 and classificacao <= '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<61))
 else true end)
 and inativo is not null
 ORDER by inativo,classificacao, UPPER(TO_ASCII(descricao,'LATIN1')), codigo limit 1)))

 /* ANTERIOR */
 OR ((3 = 2) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when '01/01/1900' <> '01/01/1900' then
 ( (inativo < '01/01/1900')
 OR
 (case when inativo = '01/01/1900' and
 classificacao <= '2.01' and
 descricao <= 'Viagens e Hospedagens'
 then inativo = '01/01/1900' and
 classificacao <= '2.01'
 and descricao <= 'Viagens e Hospedagens'
 and codigo<61
 else inativo = '01/01/1900' and
 classificacao <= '2.01' and
 descricao <= 'Viagens e Hospedagens' end)
 )
 else true end)
 and inativo is not null
 ORDER by inativo desc, classificacao desc, UPPER(TO_ASCII(descricao,'LATIN1')) desc, codigo desc limit 1)))
 /* PRÓXIMO */
 OR ((3 = 3) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE (case when '01/01/1900' <> '01/01/1900' then
 ( (inativo > '01/01/1900')
 OR
 (case when inativo = '01/01/1900' and
 classificacao >= '2.01' and
 descricao >= 'Viagens e Hospedagens'
 then inativo = '01/01/1900' and
 classificacao >= '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>61
 else inativo = '01/01/1900' and
 classificacao >= '2.01' and
 descricao >= 'Viagens e Hospedagens' end)
 )
 else true end)
 and inativo is not null
 order by inativo, classificacao, UPPER(TO_ASCII(descricao,'LATIN1')) , codigo limit 1)))
 /* ÚLTIMO */
 OR ((3 = 4) AND (codigo = (SELECT codigo
 FROM Eventos
 WHERE
 ((inativo > '01/01/1900')
 OR (inativo = '01/01/1900' and
 classificacao = '2.01'
 and descricao >= 'Viagens e Hospedagens'
 and codigo>61))
 order by inativo desc, classificacao desc, Maiusculo(descricao) desc, codigo desc limit 1)))))




OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='historicoseventos'
OK.

Select he.oid, he.Historico,
 h.Descricao,
 he.Evento,
 he.Menu
From historicoseventos he, historicos h
Where (he.Evento =61) and
 (he.Historico = h.Codigo)

OK.

END
OK.

DISCONNECT eletro
OK.
