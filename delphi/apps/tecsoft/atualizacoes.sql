ALTER TABLE public.pedidosfiliais
  ADD COLUMN datahoraalteracaousuario TIMESTAMP WITHOUT TIME ZONE;
    
  ALTER TABLE public.pedidosfiliais
  DISABLE TRIGGER pedidosfiliais_log;
  
  ALTER TABLE public.pedidosfiliais
  DISABLE TRIGGER pedidosfiliais_antesinseriratualizar;
  
  ALTER TABLE public.pedidosfiliais
  DISABLE TRIGGER pedidosfiliais_antesatualizar;
  
  update pedidosfiliais set datahoraalteracaousuario = data where datahoraalteracaousuario is null;
  
  ALTER TABLE public.pedidosfiliais
  ENABLE TRIGGER pedidosfiliais_log;
  
  ALTER TABLE public.pedidosfiliais
  ENABLE TRIGGER pedidosfiliais_antesinseriratualizar;
  
  ALTER TABLE public.pedidosfiliais
  ENABLE TRIGGER pedidosfiliais_antesatualizar;  
  
  
  ALTER TABLE public.pedidosfiliais_log
  ADD COLUMN datahoraalteracaousuario TIMESTAMP WITHOUT TIME ZONE;  
  
  ALTER TABLE public.pedidosfiliais_log
  ADD COLUMN motivo INTEGER;
  
  ALTER TABLE public.pedidosfiliais_log
  ADD COLUMN codigoorigem INTEGER;
  
  update pedidosfiliais_log set datahoraalteracaousuario = data where datahoraalteracaousuario is null;  
  
  
  
codigo INTEGER NOT NULL,
  produto BIGINT,
  data TIMESTAMP WITHOUT TIME ZONE,
  hora TIME WITHOUT TIME ZONE,
  requisitante INTEGER,
  requisitada INTEGER,
  qtdepedida NUMERIC(11,3),
  qtderecebida NUMERIC(11,3),
  situacao CHAR(1) NOT NULL,
  dadofiscal INTEGER,
  observacao VARCHAR(150),
  lotetransferencia INTEGER,
  motivo INTEGER,
  codigoorigem INTEGER,
  datahoraalteracaousuario TIMESTAM  
 
  
CREATE OR REPLACE FUNCTION public.pedidosfiliais_log (
)
RETURNS trigger AS
$body$
DECLARE
BEGIN

   IF (TG_OP IN ('UPDATE','DELETE'))
   THEN 
		INSERT INTO pedidosfiliais_log ( codigo,
		                                  produto,
										  data,
										  hora,
										  requisitante,
										  requisitada,
										  qtdepedida,
										  qtderecebida,
										  situacao,
										  dadofiscal,
										  observacao,
										  lotetransferencia,
										  motivo,
										  codigoorigem,
										  datahoraalteracaousuario,
										 Trigger_Mode, Trigger_Tuple, Trigger_Changed, Trigger_User)
                    
        VALUES ( OLD.codigo,OLD.produto,OLD.data,OLD.hora,OLD.requisitante,OLD.requisitada,OLD.qtdepedida,OLD.qtderecebida,OLD.situacao,OLD.dadofiscal,OLD.observacao,OLD.lotetransferencia, 
		         old.motivo, old.codigoorigem, OLD.datahoraalteracaousuario,
				 TG_OP, 'OLD', NOW(), CURRENT_USER);
				 
		IF (TG_OP='DELETE') 
		THEN 
			RETURN OLD;
		END IF;
						  
	END IF;

	IF (TG_OP IN ('INSERT','UPDATE')) 
	THEN
		INSERT INTO pedidosfiliais_log ( codigo,
		                                 produto,data,hora,requisitante,requisitada,
										 qtdepedida,qtderecebida,situacao,dadofiscal,observacao,lotetransferencia,
										 motivo, codigoorigem,
										 datahoraalteracaousuario,
										 Trigger_Mode, Trigger_Tuple, Trigger_Changed, Trigger_User)
                    
        VALUES ( NEW.codigo,NEW.produto,NEW.data,NEW.hora,NEW.requisitante,NEW.requisitada,NEW.qtdepedida,NEW.qtderecebida,NEW.situacao,NEW.dadofiscal,NEW.observacao,NEW.lotetransferencia,
		new.motivo, new.codigoorigem,
		NEW.datahoraalteracaousuario,
				 TG_OP, 'NEW', NOW(), CURRENT_USER);
        RETURN NEW;		
    END IF;  
END;
$body$
LANGUAGE 'plpgsql';

ALTER FUNCTION public.pedidosfiliais_log ()
  OWNER TO tecsoft;  
  
  
ALTER TABLE public.pedidosfiliais
  ALTER COLUMN datahoraalteracaousuario SET DEFAULT timeofday()::TIMESTAMP; 
  
  
CREATE OR REPLACE FUNCTION public.pedidosfiliais_antesinseriratualizar (
)
RETURNS trigger AS
$body$
BEGIN
   IF NEW.codigo IS NULL  THEN 
	NEW.Codigo:= PedidosFiliais_ProximoCodigo();
   END IF;
   
   if new.datahoraalteracaousuario is null then
     new.datahoraalteracaousuario := (select (timeofday())::timestamp without time zone);
   end if;	 
   
   if new.data is null then
     new.data := (select (timeofday())::timestamp without time zone);
   end if ;
   
   if new.hora is null then
     new.hora := (select current_time);
   end if;
 
   IF date_part('hour',NEW.data)=0 and date_part('minute',NEW.data)=0 THEN 
      NEW.DATA=cast(cast(cast(NEW.data as date) as varchar)||' '||cast(NEW.hora as varchar) as timestamp);
   END IF;
   
   /*NÃO PERMITIR CANCELAR PEDIDO FILIAL QUE JÁ TENHA UMA NOTA FISCAL EMITIDA - TEM QUE CANCELAR A NOTA FISCAL ANTES*/
   IF TG_OP = 'UPDATE' THEN
		IF (NEW.situacao='C' and OLD.situacao<>'C' AND  new.dadofiscal is not null) THEN
			IF (SELECT situacao FROM dadosfiscais where numero=NEW.dadofiscal)='N' THEN
				RAISE EXCEPTION 'O pedido de transferência está vinculado a uma nota fiscal que não está cancelada!';
			END IF;
		END IF;
   END IF;
   
   

   RETURN NEW;
end;
$body$
LANGUAGE 'plpgsql';

ALTER FUNCTION public.pedidosfiliais_antesinseriratualizar ()
  OWNER TO tecsoft;