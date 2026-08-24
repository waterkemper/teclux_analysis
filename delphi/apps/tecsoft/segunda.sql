select count(*),
      nc.chv_nfe
      
from notaspagchv nc,notaspag np
where np.codigo=nc.codigonota
and np.situacao='N'
group by 2
having count(*)>1;


select 

(xpath('//ret:tpEvento/text()', cast(nsus.xmleveciencia as xml), ARRAY[ARRAY['ret','http://www.portalfiscal.inf.br/nfe']])) as ver,
(xpath('//ret:nProt', cast(nsus.xmleveciencia as xml), ARRAY[ARRAY['ret','http://www.portalfiscal.inf.br/nfe']])) as ver2,

(xpath('//procEventoNFe/retEvento/infEvento/tpEvento', cast(nsus.xmleveciencia as xml)),ARRAY[ARRAY['tpEvento','http://www.portalfiscal.inf.br/nfe']] ) as ver3,


* 
from nsus
where chnfe = '42190517324469000189550070000557041517900459'
and xmleveciencia is not null
and CAST(cast(((xpath('//retEvento:tpEvento/text()', cast(nsus.xmleveciencia as xml), ARRAY[ARRAY['retEvento','http://www.portalfiscal.inf.br/nfe']]))[2]) as text) AS INTEGER) = 210210
