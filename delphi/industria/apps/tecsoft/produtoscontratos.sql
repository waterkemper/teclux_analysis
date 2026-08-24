
SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtoscontratos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtoscontratos') OR lower(nspname || '.' || relname)   = 'produtoscontratos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtoscontratos') OR lower(nspname || '.' || relname)   = 'produtoscontratos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtoscontratos') OR lower(nspname || '.' || t2.relname)   = 'produtoscontratos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtos') OR lower(nspname || '.' || relname)   = 'produtos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtos') OR lower(nspname || '.' || t2.relname)   = 'produtos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='caracteristicas') OR lower(nspname || '.' || relname)   = 'caracteristicas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='caracteristicas') OR lower(nspname || '.' || t2.relname)   = 'caracteristicas')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='contratos') OR lower(nspname || '.' || t2.relname)   = 'contratos')
OK.

select pc.oid, pc.contrato,
 pc.produto,
 pc.filial,
 pc.numero,
 pc.quantidade,
 pc.cancelado,
 pc.precovenda,
 pc.precotabela,
 pc.descricaoprecovenda,
 pc.montagem,
 pc.entrega,
 pc.produtolista,

 coalesce((select m.emestoque
 from movimentos m
 where m.numero = (select m2.numero
 from movimentos m2,
 (
 (select Max(m1.data) as data
 from movimentos m1
 where (m1.produto = pc.Produto) and
 (m1.filial = pc.Filial))
 ) as m1
 where m2.produto = pc.produto
 and m2.filial = pc.filial
 and m2.data = m1.data
 order by m2.lancto desc limit 1)
 ),0)
 as emestoque,

 coalesce((select m.reservado
 from movimentos m
 where m.numero = (select m2.numero
 from movimentos m2,
 (
 (select Max(m1.data) as data
 from movimentos m1
 where (m1.produto = pc.Produto) and
 (m1.filial = pc.Filial))
 ) as m1
 where m2.produto = pc.produto
 and m2.filial = pc.filial
 and m2.data = m1.data
 order by m2.lancto desc limit 1)
 ),0)
 as reservado,

 coalesce((select m.futuro
 from movimentos m
 where m.numero = (select m2.numero
 from movimentos m2,
 (
 (select Max(m1.data) as data
 from movimentos m1
 where (m1.produto = pc.Produto) and
 (m1.filial = pc.Filial))
 ) as m1
 where m2.produto = pc.produto
 and m2.filial = pc.filial
 and m2.data = m1.data
 order by m2.lancto desc limit 1)
 ),0)
 as futuro,

 p.descricao,
 c.unidade,
 c.vendanegativa as vendasemestoque,
 Selecionar_Aliquotaicms('SC', 'SC', 'F', pc.produto) as aliquotaicms,
 (select valor
 from estadosicms
 where estadosicms.estado = 'SC'
 and estadosicms.icms = c.icms) as AliquotaICMSST,
 c.icms,
 pc.aliquotaipi,
 (select o.valor
 from origemmercadorias o
 where o.codigo = c.origem) as origem,
 (select t.valor
 from tributosicms t
 where t.codigo = c.incidencia) as incidencia,
 (select f.transfautomatica
 from filiais f
 where f.codigo = pc.filial
 ) as transfautomatica,
 c.montagem as montagemoriginal,
 c.percreducaobase,
 pc.reserva,
 pc.brinde,
 pc.vendedor,
 pc.movimento,
 cast(0 as numeric(9,3)) as qtdecopiar,
 (select pr.quantidade
 from produtosreservas pr
 where (pc.produto = pr.produto) and
 (pc.filial = pr.filial) and
 (pc.reserva = pr.reserva)
 ) as qtdereservaprevia,
 false as incluirnanotafiscal,
 false as incluirnalistacasamento,
 false as promocao,
 FALSE as Selecionar,
 (select g.descricao from grades g where g.codigo = c.grade1) as linha,
 (select g.descricao from grades g where g.codigo = c.grade2) as coluna,
 p.valorgrade1,
 p.valorgrade2,
 cast(null as bigint) as codigobarras,
 c.baseicms,
 c.composto,
 c.discriminarcomposto,
 c.discriminarpreco,
 pc.classificacaofiscal,
 pc.ipi,
 pc.fatorsubstituicao,
 pc.precosubsttributaria,
 c.producaopropria,
 pc.acrescimo,
 pc.desconto,
 pc.valordescontoitem,
 pc.frete,
 pc.seguro,
 pc.dias,
 cast(null as numeric(6,2)) as ADevolver,
 cast(COALESCE((select cast(cp.produto_cliente as varchar)
 from clientesprodutos cp
 where cp.cliente = NULL
 and cp.tipocliente = NULL
 and cp.produto = pc.produto)||'-'||cast(pc.produto as varchar),
 cast(pc.produto as varchar)) as varchar) as produtocliente,
 (select ol.descricao from obslegais ol where ol.codigo = c.obslegal) as obslegal,
 c.icmsmodalidade,
 c.icmsmodsubst,
 c.piscst,
 c.cofinscst,
 c.ipicst,
 c.aliquotapis,
 c.aliquotacofins,
 (select ipi.genero from ipi where ipi.codigo = c.ipi) as genero,
 (select ipi.extipi from ipi where ipi.codigo = c.ipi) as extipi,

 case when 'f' then
 produtoscontratos_situacao(pc.contrato, pc.produto, pc.filial, ct.situacao)
 else cast(null as varchar(1)) end as situacao_produto

from produtoscontratos pc, produtos p, caracteristicas c, contratos ct

where (c.codigo = p.caracteristica)
 and (p.codigo = pc.produto)
 and (pc.contrato = ct.numero)
 and (pc.contrato = NULL)
Order By pc.numero

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='contratos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='contratos') OR lower(nspname || '.' || t2.relname)   = 'contratos')
OK.

select c.oid, c.numero,
 c.data,
 c.faturamento,
 c.avalista,
 c.cliente,
 c.tipocliente, c.dependente,
 c.vendedor,
 c.filialvenda,
 c.valorvista,
 c.valorprazo,
 cast(0 as numeric(11,2)) as SubTotalProdutos,
 cast(0 as numeric(11,2)) as TotalProdutos,
 cast(0 as numeric(11,2)) as TotalIPI,
 cast(0 as numeric(11,2)) as TotalServicos,
 cast(0 as numeric(11,2)) as ImpostoRetido, 
 c.desconto,
 c.frete,
 c.seguro,
 c.agente,
 c.analista,
 (select u.nome
 from usuarios u
 where u.codigo = c.analista) as NomeAnalista,
 c.origem,
 c.tiporenegociacao,
 c.taxajuros,
 c.plano,
 c.consideracoes,
 c.entrua,
 c.entnumero,
 c.entcomplemento,
 c.entestado,
 c.entcidade,
 c.entbairro,
 c.entcep,
 c.entfoneddd,
 c.entfonenumero,
 c.entfoneramal,
 c.montagemobs,
 c.montagemfilial,
 c.situacao,
 c.emitirnotadepoisde,
 cast (case when c.situacao = 'O' then 'ORÇADO'
 when c.situacao = 'R' then 'RESERVADO'
 when c.situacao = 'F' then 'FATURADO'
 when c.situacao = 'P' then 'NOTA PARCIAL'
 when c.situacao = 'N' then 'NOTA FISCAL'
 when c.situacao = 'C' then 'CANCELADO'
 end as varchar) as NomeSituacao,
 c.motivo,

 (select m.descricao
 from motivos m
 where m.codigo = c.motivo
 ) as descricaomotivo,

 (select d.nome
 from cidades d
 where (d.estado = c.entestado) and
 (d.codigo = c.entcidade)
 ) as nomecidadeentrega,

 (select b.nome
 from bairros b
 where (b.estado = c.entestado) and
 (b.cidade = c.entcidade) and
 (b.codigo = c.entbairro)
 ) as nomebairroentrega,

 (select d1.nome
 from cidades d1
 where (d1.estado = c.naturalestado) and
 (d1.codigo = c.naturalcidade)
 ) as nomecidadenaturalidade,

 (select d2.nome
 from cidades d2
 where (d2.estado = c.estado) and
 (d2.codigo = c.cidade)
 ) as nomecidade,

 (select b1.nome
 from bairros b1
 where (b1.estado = c.estado) and
 (b1.cidade = c.cidade) and
 (b1.codigo = c.bairro)
 ) as nomebairro,

 (select d3.nome
 from cidades d3
 where (d3.estado = c.empestado) and
 (d3.codigo = c.empcidade)
 ) as nomecidadeempresa,

 (select b2.nome
 from bairros b2
 where (b2.estado = c.empestado) and
 (b2.cidade = c.empcidade) and
 (b2.codigo = c.empbairro)
 ) as nomebairroempresa,

 (select d4.nome
 from cidades d4
 where (d4.estado = c.conestado) and
 (d4.codigo = c.concidade)
 ) as nomecidadeconjuge,

 (select b3.nome
 from bairros b3
 where (b3.estado = c.conestado) and
 (b3.cidade = c.concidade) and
 (b3.codigo = c.conbairro)
 ) as nomebairroconjuge,

 (select d5.nome
 from cidades d5
 where (d5.estado = c.refestado) and
 (d5.codigo = c.refcidade)
 ) as nomecidadereferencia,

 (select b4.nome
 from bairros b4
 where (b4.estado = c.refestado) and
 (b4.cidade = c.refcidade) and
 (b4.codigo = c.refbairro)
 ) as nomebairroreferencia,

 c.nome,
 c.nascto,
 c.apelido,
 c.sexo,
 c.civil,
 c.civildata,
 c.iddocumento,
 c.idorgao,
 c.iddata,
 c.idestado,
 c.pessoatipo,
 c.pessoanumero,
 c.mae,
 c.pai,
 c.conceito,
 c.naturalcidade,
 c.naturalestado,
 c.rua,
 c.endnumero,
 c.endcomplemento,
 c.estado,
 c.cidade,
 c.bairro,
 c.cep,
 c.fonetipo,
 c.foneddd,
 c.fonenumero,
 c.foneramal,
 c.fone2ddd,

 c.fone2numero,
 c.fone2ramal,
 c.restipo,
 c.resonus,
 c.restempo,
 c.empresa,
 c.empadmissao,
 c.empcep,
 c.empcomprovado,
 c.empfoneddd,
 c.empfonenumero,
 c.empfoneramal,
 c.empoutrasdescricao,
 c.empoutrasfaixa,
 c.empoutrasvalor,
 c.emprendafaixa,
 c.emprendavalor,
 c.emprua,
 c.empnumero,
 c.empcomplemento,
 c.empestado,
 c.empcidade,
 c.empbairro,
 c.empcargo,
 c.conjuge,
 c.connome,
 c.conadmissao,
 c.concep,
 c.conempresa,
 c.confoneddd,
 c.confonenumero,
 c.confoneramal,
 c.connascto,
 c.conrendafaixa,
 c.conrendavalor,
 c.conrua,
 c.connumero,
 c.concomplemento,
 c.conestado,
 c.concidade,
 c.conbairro,
 c.concargo,
 c.referencia,
 c.reftipo,
 c.refrua,
 c.refnumero,
 c.refcomplemento,
 c.refestado,
 c.refcidade,
 c.refbairro,
 c.refcep,
 c.reffoneddd,
 c.reffonenumero,
 c.reffoneramal,
 c.reffone2ddd,
 c.reffone2numero,
 c.reffone2ramal,
 c.observacoes,
 c.email,
 c.listacasamento,
 c.automovel,
 c.cartaocredito,
 c.cartaoloja,
 c.cheque,
 c.chequeespecial,
 c.dependentes,
 c.onus,
 c.primogenito,
 c.pedidocliente,
 (select c2.numero
 from contratos c2
 where (c2.origem = c.numero)) as renegociado, c.creditotroca, cast(0 as numeric(9,3)) as totalqtdeprodutos,
 cast(0 as numeric(11,2))as descontoTotal,
 cast(0 as numeric(11,2))as descontototaldoContrato,
 c.cfps,
 (select cfs.descricao from codigosfiscaisservicos cfs where cfs.codigo = c.cfps) as descricaocfps,
 c.clientebonus,
 c.can_data,
 c.can_usuariologado,
 c.can_usuarioautorizacao,
 c.datareservado,
 c.baseicmsproprio,
 c.valoricmsproprio,
 c.baseicmssubstituicao,
 c.valoricmssubstituicao,
 c.aliquotaicmsproprio,
 c.nrpontos,
 c.limitecredito,
 c.limitedisponivel,
 c.limiteparcela,
 c.aberto30dias,
 c.contribicms,
 c.vendaconsumidorfinal,
 c.operacao
from contratos c
where c.numero =NULL and (os is NULL OR os='false')
/* NAO ALTERAR A ORDEM DOS CAMPOS */

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='contratos') OR lower(nspname || '.' || relname)   = 'contratos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='contratos') OR lower(nspname || '.' || t2.relname)   = 'contratos')
OK.

select user_write_unlock_oid(oid) as lock
from contratos 
where numero = ''

OK.

SELECT 'C'::bpchar
OK.

SELECT 'O'::bpchar
OK.

SELECT 'F'::bpchar
OK.

SELECT 'P'::bpchar
OK.

SELECT 'A'::bpchar
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

select nome,
 estado,
 codigo
from cidades
where estado = '' and
 codigo = NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtostrocados'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtostrocados') OR lower(nspname || '.' || relname)   = 'produtostrocados') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtostrocados') OR lower(nspname || '.' || relname)   = 'produtostrocados')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtostrocados') OR lower(nspname || '.' || t2.relname)   = 'produtostrocados')
OK.

select pt.oid,
 pt.tipo,
 pt.data,
 coalesce(pt.referencia,
 (case when pt.tipo = 'E' then
 (case when pt.produto is not null then (select p.descricao from produtos p where p.codigo = pt.produto) else
 (case when pt.contrato is not null then
 cast('ENTRADA CANCELAMENTO CONTRATO '||pt.contrato as varchar) end) end)
 else 
 (case when pt.produto is not null then (select p.descricao from produtos p where p.codigo = pt.produto) else
 (case when pt.contrato is not null then
 cast('SAIDA NO CONTRATO '||coalesce(pt.contrato,'') as varchar) end) end)
 end)) as descricao,
 pt.valor,
 pt.saldo
from produtostrocados pt
where pt.cliente = NULL and pt.tipocliente=NULL

order by pt.numero,pt.data,pt.tipo

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtostrocados'
OK.

select pt.oid,
 pt.tipo,
 pt.data,
 coalesce(pt.referencia,
 (case when pt.tipo = 'E' then
 (case when pt.produto is not null then (select p.descricao from produtos p where p.codigo = pt.produto) else
 (case when pt.contrato is not null then
 cast('ENTRADA CANCELAMENTO CONTRATO '||pt.contrato as varchar) end) end)
 else 
 (case when pt.produto is not null then (select p.descricao from produtos p where p.codigo = pt.produto) else
 (case when pt.contrato is not null then
 cast('SAIDA NO CONTRATO '||coalesce(pt.contrato,'') as varchar) end) end)
 end)) as descricao,
 pt.valor,
 pt.saldo
from produtostrocados pt
where pt.cliente = 0 and pt.tipocliente='C'

order by pt.numero,pt.data,pt.tipo

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

Select 0.00 as valor

OK.

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

Select c.oid, c.codigo,
 c.nome,
 c.nascto,
 c.civil,
 c.civildata,
 c.sexo,
 c.conjuge,
 c.rua,
 c.numero,
 c.complemento,
 c.estado,
 c.cidade,
 c.bairro,
 c.cep,
 c.emprua,
 c.empnumero,
 c.empcomplemento,
 c.empestado,
 c.empcidade,
 (select nome
 from cidades d
 where (d.estado = c.empestado) and
 (d.codigo = c.empcidade)
 ) as nomecidadeempresa,
 c.empbairro,
 (select nome
 from bairros b
 where (b.estado = c.empestado) and
 (b.cidade = c.empcidade) and
 (b.codigo = c.empbairro)
 ) as nomebairroempresa,
 c.empcep,
 c.empfoneddd,
 c.empfonenumero,
 c.empfoneramal,
 c.empresa,
 c.empadmissao,
 c.emprendafaixa,
 c.emprendavalor,
 c.empcargo,
 c.filialcadastro
from clientes c
where c.codigo = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='filiais') OR lower(nspname || '.' || relname)   = 'filiais') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='filiais') OR lower(nspname || '.' || relname)   = 'filiais')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='filiais') OR lower(nspname || '.' || t2.relname)   = 'filiais')
OK.

select f.nome,
 f.mnemonico,
 f.codigo,
 f.estado,
 f.cidade,
 (select c.nome
 from cidades c
 where c.estado = f.estado and c.codigo = f.cidade) as nomecidade
from filiais f
where codigo = 1
order by UPPER(TO_ASCII(nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

(Select pc.produto,
 pc.filial,
 cast(sum(pc.quantidade-coalesce(pc.cancelado,0))-sum(coalesce(pd.quantidade,0)) as numeric(9,3)) as qtdade
from produtoscontratos pc left join
 (select d.contrato,
 pd1.produto,
 pd1.filial,
 sum(pd1.quantidade) as quantidade
 from dadosfiscais d, produtosdadosfiscais pd1
 where (d.contrato ='') and (d.numero = pd1.dadofiscal) and (d.situacao='N')
 group by d.contrato,pd1.produto,pd1.filial) pd
 using (contrato,produto,filial)
where (pc.contrato = '')
group by pc.produto, pc.filial
having sum(pc.quantidade-coalesce(pc.cancelado,0)) > sum(coalesce(pd.quantidade,0)))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='parcelas'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='parcelas') OR lower(nspname || '.' || relname)   = 'parcelas') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='parcelas') OR lower(nspname || '.' || relname)   = 'parcelas')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='parcelas') OR lower(nspname || '.' || t2.relname)   = 'parcelas')
OK.

select p.oid, p.contrato,
 p.numero,
 p.parcelaorigem,
 p.datavencto,
 p.valorvencto,
 p.formapagamento,
 p.tipopagto,
 cast(case when p.tipopagto = 'E' then 'Estornado'
 when tipopagto = 'J' then 'Perdas judiciais'
 when tipopagto = 'D' then 'a Devolver'
 when tipopagto = 'C' then 'Devolvido'
 when tipopagto = 'P' then 'Pagto estornado'
 when tipopagto = 'X' then 'Estorno devolvido'
 else case when p.datapagto is not null then 'Quitada' else '' end
 end as varchar) as Nometipopagto,
 p.datapagto,
 p.valorpagto,
 p.filialpagto,
 p.tiporecebimento,
 cast(False as Boolean) as Selecionado,
 cast(False as Boolean) as substituicao
from parcelas p
where (p.contrato = '')
order by p.contrato, datavencto


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtoscontratos'
OK.

select pc.oid, pc.contrato,
 pc.produto,
 pc.filial,
 pc.numero,
 pc.quantidade,
 pc.cancelado,
 pc.precovenda,
 pc.precotabela,
 pc.descricaoprecovenda,
 pc.montagem,
 pc.entrega,
 pc.produtolista,

 coalesce((select m.emestoque
 from movimentos m
 where m.numero = (select m2.numero
 from movimentos m2,
 (
 (select Max(m1.data) as data
 from movimentos m1
 where (m1.produto = pc.Produto) and
 (m1.filial = pc.Filial))
 ) as m1
 where m2.produto = pc.produto
 and m2.filial = pc.filial
 and m2.data = m1.data
 order by m2.lancto desc limit 1)
 ),0)
 as emestoque,

 coalesce((select m.reservado
 from movimentos m
 where m.numero = (select m2.numero
 from movimentos m2,
 (
 (select Max(m1.data) as data
 from movimentos m1
 where (m1.produto = pc.Produto) and
 (m1.filial = pc.Filial))
 ) as m1
 where m2.produto = pc.produto
 and m2.filial = pc.filial
 and m2.data = m1.data
 order by m2.lancto desc limit 1)
 ),0)
 as reservado,

 coalesce((select m.futuro
 from movimentos m
 where m.numero = (select m2.numero
 from movimentos m2,
 (
 (select Max(m1.data) as data
 from movimentos m1
 where (m1.produto = pc.Produto) and
 (m1.filial = pc.Filial))
 ) as m1
 where m2.produto = pc.produto
 and m2.filial = pc.filial
 and m2.data = m1.data
 order by m2.lancto desc limit 1)
 ),0)
 as futuro,

 p.descricao,
 c.unidade,
 c.vendanegativa as vendasemestoque,
 Selecionar_Aliquotaicms('SC', '', 'F', pc.produto) as aliquotaicms,
 (select valor
 from estadosicms
 where estadosicms.estado = 'SC'
 and estadosicms.icms = c.icms) as AliquotaICMSST,
 c.icms,
 pc.aliquotaipi,
 (select o.valor
 from origemmercadorias o
 where o.codigo = c.origem) as origem,
 (select t.valor
 from tributosicms t
 where t.codigo = c.incidencia) as incidencia,
 (select f.transfautomatica
 from filiais f
 where f.codigo = pc.filial
 ) as transfautomatica,
 c.montagem as montagemoriginal,
 c.percreducaobase,
 pc.reserva,
 pc.brinde,
 pc.vendedor,
 pc.movimento,
 cast(0 as numeric(9,3)) as qtdecopiar,
 (select pr.quantidade
 from produtosreservas pr
 where (pc.produto = pr.produto) and
 (pc.filial = pr.filial) and
 (pc.reserva = pr.reserva)
 ) as qtdereservaprevia,
 false as incluirnanotafiscal,
 false as incluirnalistacasamento,
 false as promocao,
 FALSE as Selecionar,
 (select g.descricao from grades g where g.codigo = c.grade1) as linha,
 (select g.descricao from grades g where g.codigo = c.grade2) as coluna,
 p.valorgrade1,
 p.valorgrade2,
 cast(null as bigint) as codigobarras,
 c.baseicms,
 c.composto,
 c.discriminarcomposto,
 c.discriminarpreco,
 pc.classificacaofiscal,
 pc.ipi,
 pc.fatorsubstituicao,
 pc.precosubsttributaria,
 c.producaopropria,
 pc.acrescimo,
 pc.desconto,
 pc.valordescontoitem,
 pc.frete,
 pc.seguro,
 pc.dias,
 cast(null as numeric(6,2)) as ADevolver,
 cast(COALESCE((select cast(cp.produto_cliente as varchar)
 from clientesprodutos cp
 where cp.cliente = NULL
 and cp.tipocliente = NULL
 and cp.produto = pc.produto)||'-'||cast(pc.produto as varchar),
 cast(pc.produto as varchar)) as varchar) as produtocliente,
 (select ol.descricao from obslegais ol where ol.codigo = c.obslegal) as obslegal,
 c.icmsmodalidade,
 c.icmsmodsubst,
 c.piscst,
 c.cofinscst,
 c.ipicst,
 c.aliquotapis,
 c.aliquotacofins,
 (select ipi.genero from ipi where ipi.codigo = c.ipi) as genero,
 (select ipi.extipi from ipi where ipi.codigo = c.ipi) as extipi,

 case when 'f' then
 produtoscontratos_situacao(pc.contrato, pc.produto, pc.filial, ct.situacao)
 else cast(null as varchar(1)) end as situacao_produto

from produtoscontratos pc, produtos p, caracteristicas c, contratos ct

where (c.codigo = p.caracteristica)
 and (p.codigo = pc.produto)
 and (pc.contrato = ct.numero)
 and (pc.contrato = '')
Order By pc.numero

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='servicoscontratos'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='servicoscontratos') OR lower(nspname || '.' || relname)   = 'servicoscontratos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='servicoscontratos') OR lower(nspname || '.' || relname)   = 'servicoscontratos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='servicoscontratos') OR lower(nspname || '.' || t2.relname)   = 'servicoscontratos')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(equipamentos e left join marcas m on (e.marca = m.codigo))') OR lower(nspname || '.' || relname)   = '(equipamentos e left join marcas m on (e.marca = m.codigo))') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='(equipamentos e left join marcas m on (e.marca = m.codigo))') OR lower(nspname || '.' || relname)   = '(equipamentos e left join marcas m on (e.marca = m.codigo))')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='(equipamentos e left join marcas m on (e.marca = m.codigo))') OR lower(nspname || '.' || t2.relname)   = '(equipamentos e left join marcas m on (e.marca = m.codigo))')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='servicos') OR lower(nspname || '.' || relname)   = 'servicos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='servicos') OR lower(nspname || '.' || relname)   = 'servicos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='servicos') OR lower(nspname || '.' || t2.relname)   = 'servicos')
OK.

Select sc.oid, sc.contrato,
 sc.servico,
 s.descricao as descricaoservico,
 sc.quantidade,
 sc.aliquotaissqn,
 sc.valorservico,
 sc.complementoservico,
 sc.equipamento,
 e.descricao as descricaoequipamento,
 e.referencia,
 e.marca,
 e.modelo,
 e.opcionais,
 e.ano,
 m.descricao as descricaomarca,
 sc.estado,
 sc.cidade,
 (select c.nome
 from cidades c
 where c.estado = sc.estado
 and c.codigo = sc.cidade) as nomecidade,
 sc.reterissqn,
 sc.valorissqn,
 True as ValorISSQNDigitado

From servicoscontratos sc 
 left join (equipamentos e left join marcas m on (e.marca = m.codigo))
 on (sc.equipamento = e.codigo), servicos s
Where (sc.servico = s.codigo) and
 (sc.contrato ='')

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='planos') OR lower(nspname || '.' || relname)   = 'planos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='planos') OR lower(nspname || '.' || relname)   = 'planos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='planos') OR lower(nspname || '.' || t2.relname)   = 'planos')
OK.

select descricao,
 agente,
 enderecocompleto,
 intervaloparcelas,
 quantidadeparcelas,
 mestrintadias,
 taxamensaljuros,
 ((power((taxamensaljuros/100)+1,12))-1)*100 as taxaanualjuros
from planos
where codigo = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='usuarios') OR lower(nspname || '.' || relname)   = 'usuarios') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='usuarios') OR lower(nspname || '.' || relname)   = 'usuarios')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='usuarios') OR lower(nspname || '.' || t2.relname)   = 'usuarios')
OK.

select u.nome,
 u.codigo
from usuarios u
where (u.venda or
 (select gu.vendedor
 from gruposusuarios gu
 where gu.codigo = u.grupo)) and
 u.inativo is null
order by UPPER(TO_ASCII(u.nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='usuarios') OR lower(nspname || '.' || relname)   = 'usuarios') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='usuarios') OR lower(nspname || '.' || relname)   = 'usuarios')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='usuarios') OR lower(nspname || '.' || t2.relname)   = 'usuarios')
OK.

select u.codigo,
 u.nome
from usuarios u
where (u.codigo = 131) and
 (u.inativo is null) and
 ((u.venda) or
 (0 < (select Count(*)
 from gruposusuarios gu
 where (gu.codigo = u.grupo) and
 gu.vendedor)))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

Select v.nome,
 formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,
 v.estado,
 c.nome as nomecidade,
 v.codigo,
 v.civil,
 v.tipo as tipoorig,
 cast(case when v.tipo = 'F' then 'Fornecedor'
 when v.tipo = 'C' then 'Cliente'
 end as varchar) as tipo
From vfornecedores v, cidades c
where (v.tipo <> 'L') and (v.estado = c.estado) and (v.cidade = c.codigo)
and false
Order By UPPER(TO_ASCII(v.nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

Select v.nome,
 formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,
 v.estado,
 c.nome as nomecidade,
 v.codigo,
 v.civil,
 v.tipo as tipoorig,
 cast(case when v.tipo = 'F' then 'Fornecedor'
 when v.tipo = 'C' then 'Cliente'
 end as varchar) as tipo
From vfornecedores v, cidades c
where (v.tipo <> 'L') and (v.estado = c.estado) and (v.cidade = c.codigo)
and false
Order By UPPER(TO_ASCII(v.nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

Select v.nome,
 formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,
 v.estado,
 c.nome as nomecidade,
 v.codigo,
 v.civil,
 v.tipo as tipoorig,
 cast(case when v.tipo = 'F' then 'Fornecedor'
 when v.tipo = 'C' then 'Cliente'
 end as varchar) as tipo
From vfornecedores v, cidades c
where (v.tipo <> 'L') and (v.estado = c.estado) and (v.cidade = c.codigo)
and (upper(to_ascii(v.nome,'LATIN1')) ilike upper(to_ascii('USIM%','LATIN1')))
Order By UPPER(TO_ASCII(v.nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cidades') OR lower(nspname || '.' || relname)   = 'cidades')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cidades') OR lower(nspname || '.' || t2.relname)   = 'cidades')
OK.

Select v.nome,
 formatar_cpf_cnpj(v.pessoanumero) as pessoanumero,
 v.estado,
 c.nome as nomecidade,
 v.codigo,
 v.civil,
 v.tipo as tipoorig,
 cast(case when v.tipo = 'F' then 'Fornecedor'
 when v.tipo = 'C' then 'Cliente'
 end as varchar) as tipo
From vfornecedores v, cidades c
where (v.tipo <> 'L') and (v.estado = c.estado) and (v.cidade = c.codigo)
and (upper(to_ascii(v.nome,'LATIN1')) ilike upper(to_ascii('USIM%','LATIN1')))
Order By UPPER(TO_ASCII(v.nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='vfornecedores') OR lower(nspname || '.' || relname)   = 'vfornecedores')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='vfornecedores') OR lower(nspname || '.' || t2.relname)   = 'vfornecedores')
OK.

Select nome,
 codigo,
 tipo,
 case when tipo = 'C' then (select c.naoexibirfichafinanceira from clientes c where c.codigo = 4752)
 else false
 end as naoexibirfichafinanceira,
 case when conceito is not null then (select c.restricoes
 from conceitos c
 where c.codigo = vfornecedores.conceito)
 else true
 end as restricoesconceito,
 debito,
 credito,
 (select c.empcargo from clientes c where c.codigo = 4752) as cargocliente, 
 markup,
 (select b.nome
 from bairros b
 where b.estado = vfornecedores.estado
 and b.cidade = vfornecedores.cidade
 and b.codigo = vfornecedores.bairro) as NomeBairro,
 (select c.nome
 from cidades c
 where c.estado = vfornecedores.estado
 and c.codigo = vfornecedores.cidade) as NomeCidade,
 (select c.CodigoIBGE
 from cidades c
 where c.estado = vfornecedores.estado
 and c.codigo = vfornecedores.cidade) as CidadeIBGE
From vfornecedores
Where (codigo = 4752) and
 (tipo = 'C') and
 (tipo <> 'L')
Order By UPPER(TO_ASCII(nome,'LATIN1'))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtoscargos') OR lower(nspname || '.' || relname)   = 'produtoscargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='produtoscargos') OR lower(nspname || '.' || relname)   = 'produtoscargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='produtoscargos') OR lower(nspname || '.' || t2.relname)   = 'produtoscargos')
OK.

select pc.produto,
 (select p.descricao from produtos p
 where p.codigo = pc.produto) as descricao,
pc.markup,
pc.cargo
from produtoscargos pc
where pc.cargo =221


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select pc.produto,
 (select p.descricao from produtos p
 where p.codigo = pc.produto) as descricao,
pc.markup,
pc.cargo
from produtoscargos pc
where pc.cargo =221


OK.

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

Select c.oid, c.codigo,
 (select nome
 from cidades d
 where (d.estado = c.naturalestado) and
 (d.codigo = c.naturalcidade)
 ) as nomecidadenaturalidade,
 (select nome
 from cidades d
 where (d.estado = c.estado) and
 (d.codigo = c.cidade)
 ) as nomecidade,
 (select nome
 from bairros b
 where (b.estado = c.estado) and
 (b.cidade = c.cidade) and
 (b.codigo = c.bairro)
 ) as nomebairro,
 (select nome
 from cidades d
 where (d.estado = c.empestado) and
 (d.codigo = c.empcidade)
 ) as nomecidadeempresa,
 (select nome
 from bairros b
 where (b.estado = c.empestado) and
 (b.cidade = c.empcidade) and
 (b.codigo = c.empbairro)
 ) as nomebairroempresa,
 (select nome
 from cidades d
 where (d.estado = c.conestado) and
 (d.codigo = c.concidade)
 ) as nomecidadeconjuge,
 (select nome
 from bairros b
 where (b.estado = c.conestado) and
 (b.cidade = c.concidade) and
 (b.codigo = c.conbairro)
 ) as nomebairroconjuge,
 (select nome
 from cidades d
 where (d.estado = c.refestado) and
 (d.codigo = c.refcidade)
 ) as nomecidadereferencia,
 (select nome
 from bairros b
 where (b.estado = c.refestado) and
 (b.cidade = c.refcidade) and
 (b.codigo = c.refbairro)
 ) as nomebairroreferencia,
 c.nome,
 c.nascto,
 c.apelido,
 c.sexo,
 c.civil,
 c.civildata,
 c.iddocumento,
 c.idorgao,
 c.iddata,
 c.idestado,
 c.pessoatipo,
 c.pessoanumero,
 c.mae,
 c.pai,
 c.conceito,
 c.naturalcidade,
 c.naturalestado,
 c.rua,
 c.numero,
 c.complemento,
 c.estado,
 c.cidade,
 c.bairro,
 c.cep,
 c.fonetipo,
 c.foneddd,
 c.fonenumero,
 c.foneramal,
 c.fone2ddd,
 c.fone2numero,
 c.fone2ramal,
 c.restipo,
 c.resonus,
 c.restempo,
 c.empresa,
 c.empadmissao,
 c.empcep,
 c.empcomprovado,
 c.empfoneddd,
 c.empfonenumero,
 c.empfoneramal,
 c.empoutrasdescricao,
 c.empoutrasfaixa,
 c.empoutrasvalor,
 c.emprendafaixa,
 c.emprendavalor,
 c.emprua,
 c.empnumero,
 c.empcomplemento,
 c.empestado,
 c.empcidade,
 c.empbairro,
 c.empcargo,
 c.conjuge,
 c.connome,
 c.conadmissao,
 c.concep,
 c.conempresa,
 c.confoneddd,
 c.confonenumero,
 c.confoneramal,
 c.connascto,
 c.conrendafaixa,
 c.conrendavalor,
 c.conrua,
 c.connumero,
 c.concomplemento,
 c.conestado,
 c.concidade,
 c.conbairro,
 c.concargo,
 c.referencia,
 c.reftipo,
 c.refrua,
 c.refnumero,
 c.refcomplemento,
 c.refestado,
 c.refcidade,
 c.refbairro,
 c.refcep,
 c.reffoneddd,
 c.reffonenumero,
 c.reffoneramal,
 c.reffone2ddd,
 c.reffone2numero,
 c.reffone2ramal,
 c.observacoes,
 c.email,
 c.automovel,
 c.cartaocredito,
 c.cartaoloja,
 c.cheque,
 c.chequeespecial,
 c.dependentes,
 c.onus,
 c.enderecoalterado,
 c.filialcadastro,
 c.ultimaalteracao,
 c.planopadrao,
 c.contribicms,
 (select nome
 from cidades d
 where (d.estado = c.pracapagtoestado) and
 (d.codigo = c.pracapagtocidade)
 ) as pracapagtocidade,
 c.pracapagtoestado
from clientes c
where c.codigo = 4752
/* NAO ALTERAR A ORDEM DOS CAMPOS */

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='conceitos') OR lower(nspname || '.' || relname)   = 'conceitos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='conceitos') OR lower(nspname || '.' || relname)   = 'conceitos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='conceitos') OR lower(nspname || '.' || t2.relname)   = 'conceitos')
OK.

Select Descricao, 
 Codigo
From Conceitos
Where Codigo =3

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='cargos') OR lower(nspname || '.' || relname)   = 'cargos')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='cargos') OR lower(nspname || '.' || t2.relname)   = 'cargos')
OK.

select descricao,
 codigo, markuppadrao
from cargos
where codigo = 221

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select nome,
 estado,
 codigo
from cidades
where estado = '' and
 codigo = NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='produtostrocados'
OK.

select pt.oid,
 pt.tipo,
 pt.data,
 coalesce(pt.referencia,
 (case when pt.tipo = 'E' then
 (case when pt.produto is not null then (select p.descricao from produtos p where p.codigo = pt.produto) else
 (case when pt.contrato is not null then
 cast('ENTRADA CANCELAMENTO CONTRATO '||pt.contrato as varchar) end) end)
 else 
 (case when pt.produto is not null then (select p.descricao from produtos p where p.codigo = pt.produto) else
 (case when pt.contrato is not null then
 cast('SAIDA NO CONTRATO '||coalesce(pt.contrato,'') as varchar) end) end)
 end)) as descricao,
 pt.valor,
 pt.saldo
from produtostrocados pt
where pt.cliente = 4752 and pt.tipocliente='C'

order by pt.numero,pt.data,pt.tipo

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

Select 0.00 as valor

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='clientes'
OK.

Select c.oid, c.codigo,
 (select nome
 from cidades d
 where (d.estado = c.naturalestado) and
 (d.codigo = c.naturalcidade)
 ) as nomecidadenaturalidade,
 (select nome
 from cidades d
 where (d.estado = c.estado) and
 (d.codigo = c.cidade)
 ) as nomecidade,
 (select nome
 from bairros b
 where (b.estado = c.estado) and
 (b.cidade = c.cidade) and
 (b.codigo = c.bairro)
 ) as nomebairro,
 (select nome
 from cidades d
 where (d.estado = c.empestado) and
 (d.codigo = c.empcidade)
 ) as nomecidadeempresa,
 (select nome
 from bairros b
 where (b.estado = c.empestado) and
 (b.cidade = c.empcidade) and
 (b.codigo = c.empbairro)
 ) as nomebairroempresa,
 (select nome
 from cidades d
 where (d.estado = c.conestado) and
 (d.codigo = c.concidade)
 ) as nomecidadeconjuge,
 (select nome
 from bairros b
 where (b.estado = c.conestado) and
 (b.cidade = c.concidade) and
 (b.codigo = c.conbairro)
 ) as nomebairroconjuge,
 (select nome
 from cidades d
 where (d.estado = c.refestado) and
 (d.codigo = c.refcidade)
 ) as nomecidadereferencia,
 (select nome
 from bairros b
 where (b.estado = c.refestado) and
 (b.cidade = c.refcidade) and
 (b.codigo = c.refbairro)
 ) as nomebairroreferencia,
 c.nome,
 c.nascto,
 c.apelido,
 c.sexo,
 c.civil,
 c.civildata,
 c.iddocumento,
 c.idorgao,
 c.iddata,
 c.idestado,
 c.pessoatipo,
 c.pessoanumero,
 c.mae,
 c.pai,
 c.conceito,
 c.naturalcidade,
 c.naturalestado,
 c.rua,
 c.numero,
 c.complemento,
 c.estado,
 c.cidade,
 c.bairro,
 c.cep,
 c.fonetipo,
 c.foneddd,
 c.fonenumero,
 c.foneramal,
 c.fone2ddd,
 c.fone2numero,
 c.fone2ramal,
 c.restipo,
 c.resonus,
 c.restempo,
 c.empresa,
 c.empadmissao,
 c.empcep,
 c.empcomprovado,
 c.empfoneddd,
 c.empfonenumero,
 c.empfoneramal,
 c.empoutrasdescricao,
 c.empoutrasfaixa,
 c.empoutrasvalor,
 c.emprendafaixa,
 c.emprendavalor,
 c.emprua,
 c.empnumero,
 c.empcomplemento,
 c.empestado,
 c.empcidade,
 c.empbairro,
 c.empcargo,
 c.conjuge,
 c.connome,
 c.conadmissao,
 c.concep,
 c.conempresa,
 c.confoneddd,
 c.confonenumero,
 c.confoneramal,
 c.connascto,
 c.conrendafaixa,
 c.conrendavalor,
 c.conrua,
 c.connumero,
 c.concomplemento,
 c.conestado,
 c.concidade,
 c.conbairro,
 c.concargo,
 c.referencia,
 c.reftipo,
 c.refrua,
 c.refnumero,
 c.refcomplemento,
 c.refestado,
 c.refcidade,
 c.refbairro,
 c.refcep,
 c.reffoneddd,
 c.reffonenumero,
 c.reffoneramal,
 c.reffone2ddd,
 c.reffone2numero,
 c.reffone2ramal,
 c.observacoes,
 c.email,
 c.automovel,
 c.cartaocredito,
 c.cartaoloja,
 c.cheque,
 c.chequeespecial,
 c.dependentes,
 c.onus,
 c.enderecoalterado,
 c.filialcadastro,
 c.ultimaalteracao,
 c.planopadrao,
 c.contribicms,
 (select nome
 from cidades d
 where (d.estado = c.pracapagtoestado) and
 (d.codigo = c.pracapagtocidade)
 ) as pracapagtocidade,
 c.pracapagtoestado
from clientes c
where c.codigo = 4752
/* NAO ALTERAR A ORDEM DOS CAMPOS */

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='clientes'
OK.

Select c.oid, c.codigo,
 c.nome,
 c.nascto,
 c.civil,
 c.civildata,
 c.sexo,
 c.conjuge,
 c.rua,
 c.numero,
 c.complemento,
 c.estado,
 c.cidade,
 c.bairro,
 c.cep,
 c.emprua,
 c.empnumero,
 c.empcomplemento,
 c.empestado,
 c.empcidade,
 (select nome
 from cidades d
 where (d.estado = c.empestado) and
 (d.codigo = c.empcidade)
 ) as nomecidadeempresa,
 c.empbairro,
 (select nome
 from bairros b
 where (b.estado = c.empestado) and
 (b.cidade = c.empcidade) and
 (b.codigo = c.empbairro)
 ) as nomebairroempresa,
 c.empcep,
 c.empfoneddd,
 c.empfonenumero,
 c.empfoneramal,
 c.empresa,
 c.empadmissao,
 c.emprendafaixa,
 c.emprendavalor,
 c.empcargo,
 c.filialcadastro
from clientes c
where c.codigo = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select tablename from pg_tables where tablename='clientes'
OK.

Select c.oid, c.codigo,
 c.nome,
 c.nascto,
 c.civil,
 c.civildata,
 c.sexo,
 c.conjuge,
 c.rua,
 c.numero,
 c.complemento,
 c.estado,
 c.cidade,
 c.bairro,
 c.cep,
 c.emprua,
 c.empnumero,
 c.empcomplemento,
 c.empestado,
 c.empcidade,
 (select nome
 from cidades d
 where (d.estado = c.empestado) and
 (d.codigo = c.empcidade)
 ) as nomecidadeempresa,
 c.empbairro,
 (select nome
 from bairros b
 where (b.estado = c.empestado) and
 (b.cidade = c.empcidade) and
 (b.codigo = c.empbairro)
 ) as nomebairroempresa,
 c.empcep,
 c.empfoneddd,
 c.empfonenumero,
 c.empfoneramal,
 c.empresa,
 c.empadmissao,
 c.emprendafaixa,
 c.emprendavalor,
 c.empcargo,
 c.filialcadastro
from clientes c
where c.codigo = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select nome,
 estado,
 codigo
from cidades
where estado = '' and
 codigo = NULL

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select 4752, 'C', clientes_cartadevolvida(4752, 'C') as devolvida

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select clientes_atrasado(4752,'C') as atrasado

OK.

SELECT 'N'::bpchar
OK.

SELECT false
OK.

SELECT 'N'::bpchar
OK.

SELECT 'X'::bpchar
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SELECT false
OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", adsrc AS def FROM pg_attribute, pg_class, pg_type, pg_attrdef, pg_namespace WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND pg_class.oid=adrelid AND adnum=attnum AND atthasdef='t' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='usuarios') OR lower(nspname || '.' || relname)   = 'usuarios') UNION SELECT pg_attribute.attnum AS index, attname AS field, typname AS type, atttypmod-4 as length, NOT attnotnull AS "null", '' AS def FROM pg_attribute, pg_class, pg_type, pg_namespace  WHERE pg_class.oid=attrelid AND pg_type.oid=atttypid AND attnum>0 AND atthasdef='f' AND pg_namespace.oid=relnamespace  AND ((nspname=current_schema() AND lower(relname)='usuarios') OR lower(nspname || '.' || relname)   = 'usuarios')
OK.

SELECT i.indexrelid AS index, t1.relname AS name, t2.relname AS table, indisunique AS "unique", indkey AS fields FROM pg_index AS i, pg_class AS t1, pg_class AS t2, pg_namespace  WHERE i.indexrelid=t1.oid AND i.indrelid=t2.oid AND pg_namespace.oid=t2.relnamespace  AND ((nspname=current_schema() AND lower(t2.relname)='usuarios') OR lower(nspname || '.' || t2.relname)   = 'usuarios')
OK.

select u.codigo,
 u.nome
from usuarios u
where (u.codigo = 131) and
 (u.inativo is null) and
 ((u.venda) or
 (0 < (select Count(*)
 from gruposusuarios gu
 where (gu.codigo = u.grupo) and
 gu.vendedor)))

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

;select * from
(
 select produto, filial, emestoque, reservado, descricao, valorgrade1, valorgrade2, caracteristica, preco, unidade, brinde, codigoBarras,
 (select count(*) from similares where similares.caracteristica = estoquepreco1.caracteristica) as similares,

 case when ((parametros_valor('Preço para clientes') = 'True') and
 (coalesce((select cp.precocliente
 from clientesprodutos cp
 where cp.cliente = 4752
 and cp.tipocliente = 'C'
 and cp.produto = estoquepreco1.produto),0)<>0)) then

 (select cp.precocliente
 from clientesprodutos cp
 where cp.cliente = 4752
 and cp.tipocliente = 'C'
 and cp.produto = estoquepreco1.produto)

 else
 case when coalesce(estoquepreco1.valorproduto,0)=0 then
 (SELECT valor
 FROM colunasprecos
 WHERE (colunasprecos.caracteristica = estoquepreco1.caracteristica) AND
 (colunasprecos.preco = estoquepreco1.preco) AND
 (colunasprecos.coluna = estoquepreco1.preconormal))
 else coalesce(estoquepreco1.valorproduto,0)
 end
 end as valorproduto
 from
(
 select estoque.*,
 case when 'f' and ((coalesce(NULL,0)) > 0) and (estoque.valorultimacompra > 0) then
 estoques_preco(estoque.produto, 1, NULL)
 when 't' and ((coalesce((Select pc.markup from produtoscargos pc
 where pc.cargo =NULL
 and pc.produto = estoque.produto),0)) > 0) and (estoque.valorultimacompra > 0) then
 estoques_preco(estoque.produto, 1,(Select pc.markup from produtoscargos pc
 where pc.cargo =NULL
 and pc.produto = estoque.produto))
 when estoque.precopromocao is not null then
 (SELECT valor
 FROM colunasprecos
 WHERE (colunasprecos.caracteristica = estoque.caracteristica) AND
 (colunasprecos.preco = estoque.preco) AND
 (colunasprecos.coluna = estoque.precopromocao) AND
 (colunasprecos.validade >= now())
 )
 else estoques_preco(estoque.produto, 1) end as valorproduto
 from
 (
 select e.produto,
 e.filial,
 e.emestoque,
 e.reservado,
 p.descricao,
 p.valorgrade1,
 p.valorgrade2,
 p.caracteristica,
 p.preco,
 (select pcb.codigobarras
 from produtoscodigobarras pcb
 where pcb.produto = p.codigo
 limit 1) as codigobarras,
 c.unidade,
 c.brinde,
 case when 't' then
 (select f.preconormal from filiais f where f.codigo = 1)
 else (select f.preconormal from filiais f where f.codigo = e.filial)
 end as preconormal,
 case when 't' then
 (select f.precopromocao from filiais f where f.codigo = 1)
 else (select f.precopromocao from filiais f where f.codigo = e.filial)
 end as precopromocao,
 e.valorultimacompra
 from (estoques e join (produtos p join caracteristicas c on p.caracteristica = c.codigo)
 on e.produto = p.codigo)
 where e.produto = p.codigo
 and p.caracteristica = c.codigo
 and ((p.inativo is null ) or
 (p.inativo>current_date))
 
 and (e.filial = 1)
 
 
 and false
 ) as estoque
) as estoquepreco1
) as estoquepreco2
where (valorproduto > 0)

order by Maiusculo(descricao), valorgrade1, valorgrade2


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

;select * from
(
 select produto, filial, emestoque, reservado, descricao, valorgrade1, valorgrade2, caracteristica, preco, unidade, brinde, codigoBarras,
 (select count(*) from similares where similares.caracteristica = estoquepreco1.caracteristica) as similares,

 case when ((parametros_valor('Preço para clientes') = 'True') and
 (coalesce((select cp.precocliente
 from clientesprodutos cp
 where cp.cliente = 4752
 and cp.tipocliente = 'C'
 and cp.produto = estoquepreco1.produto),0)<>0)) then

 (select cp.precocliente
 from clientesprodutos cp
 where cp.cliente = 4752
 and cp.tipocliente = 'C'
 and cp.produto = estoquepreco1.produto)

 else
 case when coalesce(estoquepreco1.valorproduto,0)=0 then
 (SELECT valor
 FROM colunasprecos
 WHERE (colunasprecos.caracteristica = estoquepreco1.caracteristica) AND
 (colunasprecos.preco = estoquepreco1.preco) AND
 (colunasprecos.coluna = estoquepreco1.preconormal))
 else coalesce(estoquepreco1.valorproduto,0)
 end
 end as valorproduto
 from
(
 select estoque.*,
 case when 'f' and ((coalesce(NULL,0)) > 0) and (estoque.valorultimacompra > 0) then
 estoques_preco(estoque.produto, 1, NULL)
 when 't' and ((coalesce((Select pc.markup from produtoscargos pc
 where pc.cargo =NULL
 and pc.produto = estoque.produto),0)) > 0) and (estoque.valorultimacompra > 0) then
 estoques_preco(estoque.produto, 1,(Select pc.markup from produtoscargos pc
 where pc.cargo =NULL
 and pc.produto = estoque.produto))
 when estoque.precopromocao is not null then
 (SELECT valor
 FROM colunasprecos
 WHERE (colunasprecos.caracteristica = estoque.caracteristica) AND
 (colunasprecos.preco = estoque.preco) AND
 (colunasprecos.coluna = estoque.precopromocao) AND
 (colunasprecos.validade >= now())
 )
 else estoques_preco(estoque.produto, 1) end as valorproduto
 from
 (
 select e.produto,
 e.filial,
 e.emestoque,
 e.reservado,
 p.descricao,
 p.valorgrade1,
 p.valorgrade2,
 p.caracteristica,
 p.preco,
 (select pcb.codigobarras
 from produtoscodigobarras pcb
 where pcb.produto = p.codigo
 limit 1) as codigobarras,
 c.unidade,
 c.brinde,
 case when 't' then
 (select f.preconormal from filiais f where f.codigo = 1)
 else (select f.preconormal from filiais f where f.codigo = e.filial)
 end as preconormal,
 case when 't' then
 (select f.precopromocao from filiais f where f.codigo = 1)
 else (select f.precopromocao from filiais f where f.codigo = e.filial)
 end as precopromocao,
 e.valorultimacompra
 from (estoques e join (produtos p join caracteristicas c on p.caracteristica = c.codigo)
 on e.produto = p.codigo)
 where e.produto = p.codigo
 and p.caracteristica = c.codigo
 and ((p.inativo is null ) or
 (p.inativo>current_date))
 
 and (e.filial = 1)
 
 
 and false
 ) as estoque
) as estoquepreco1
) as estoquepreco2
where (valorproduto > 0)

order by Maiusculo(descricao), valorgrade1, valorgrade2


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

;select * from
(
 select produto, filial, emestoque, reservado, descricao, valorgrade1, valorgrade2, caracteristica, preco, unidade, brinde, codigoBarras,
 (select count(*) from similares where similares.caracteristica = estoquepreco1.caracteristica) as similares,

 case when ((parametros_valor('Preço para clientes') = 'True') and
 (coalesce((select cp.precocliente
 from clientesprodutos cp
 where cp.cliente = 4752
 and cp.tipocliente = 'C'
 and cp.produto = estoquepreco1.produto),0)<>0)) then

 (select cp.precocliente
 from clientesprodutos cp
 where cp.cliente = 4752
 and cp.tipocliente = 'C'
 and cp.produto = estoquepreco1.produto)

 else
 case when coalesce(estoquepreco1.valorproduto,0)=0 then
 (SELECT valor
 FROM colunasprecos
 WHERE (colunasprecos.caracteristica = estoquepreco1.caracteristica) AND
 (colunasprecos.preco = estoquepreco1.preco) AND
 (colunasprecos.coluna = estoquepreco1.preconormal))
 else coalesce(estoquepreco1.valorproduto,0)
 end
 end as valorproduto
 from
(
 select estoque.*,
 case when 'f' and ((coalesce(NULL,0)) > 0) and (estoque.valorultimacompra > 0) then
 estoques_preco(estoque.produto, 1, NULL)
 when 't' and ((coalesce((Select pc.markup from produtoscargos pc
 where pc.cargo =NULL
 and pc.produto = estoque.produto),0)) > 0) and (estoque.valorultimacompra > 0) then
 estoques_preco(estoque.produto, 1,(Select pc.markup from produtoscargos pc
 where pc.cargo =NULL
 and pc.produto = estoque.produto))
 when estoque.precopromocao is not null then
 (SELECT valor
 FROM colunasprecos
 WHERE (colunasprecos.caracteristica = estoque.caracteristica) AND
 (colunasprecos.preco = estoque.preco) AND
 (colunasprecos.coluna = estoque.precopromocao) AND
 (colunasprecos.validade >= now())
 )
 else estoques_preco(estoque.produto, 1) end as valorproduto
 from
 (
 select e.produto,
 e.filial,
 e.emestoque,
 e.reservado,
 p.descricao,
 p.valorgrade1,
 p.valorgrade2,
 p.caracteristica,
 p.preco,
 (select pcb.codigobarras
 from produtoscodigobarras pcb
 where pcb.produto = p.codigo
 limit 1) as codigobarras,
 c.unidade,
 c.brinde,
 case when 't' then
 (select f.preconormal from filiais f where f.codigo = 1)
 else (select f.preconormal from filiais f where f.codigo = e.filial)
 end as preconormal,
 case when 't' then
 (select f.precopromocao from filiais f where f.codigo = 1)
 else (select f.precopromocao from filiais f where f.codigo = e.filial)
 end as precopromocao,
 e.valorultimacompra
 from (estoques e join (produtos p join caracteristicas c on p.caracteristica = c.codigo)
 on e.produto = p.codigo)
 where e.produto = p.codigo
 and p.caracteristica = c.codigo
 and ((p.inativo is null ) or
 (p.inativo>current_date))
 
 and (e.filial = 1)
 
 
 and upper(to_ascii(p.descricao,'LATIN1')) ilike upper(to_ascii('FRAL%','LATIN1'))
 ) as estoque
) as estoquepreco1
) as estoquepreco2
where (valorproduto > 0)

order by Maiusculo(descricao), valorgrade1, valorgrade2


OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select nome,
 estado,
 codigo
from cidades
where estado = '' and
 codigo = 0

OK.

SET DateStyle TO 'ISO'
OK.

SET DateStyle TO 'ISO, European'
OK.

select user_write_unlock_oid(oid) as lock
from contratos 
where numero = ''

OK.

END
OK.

DISCONNECT apolonia
OK.
