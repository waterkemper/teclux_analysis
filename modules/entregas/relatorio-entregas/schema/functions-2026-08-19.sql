-- Funcoes coletadas somente leitura via pg_get_functiondef em 2026-08-19.

CREATE OR REPLACE FUNCTION public.diadasemana(date)
 RETURNS character varying
 LANGUAGE plpgsql
AS $function$
DECLARE                       
 vData  ALIAS FOR $1;     
 vDia integer ;
 vNomeDiaSemana varchar;

BEGIN
   vdia := (SELECT EXTRACT(DOW FROM vData));
    
   if vdia = 0 then    vNomeDiaSemana := 'DOM';    
   elsif vdia = 1 then vNomeDiaSemana := 'SEG';
   elsif vdia = 2 then vNomeDiaSemana := 'TER';            
   elsif vdia = 3 then vNomeDiaSemana := 'QUA';    
   elsif vdia = 4 then vNomeDiaSemana := 'QUI';            
   elsif vdia = 5 then vNomeDiaSemana := 'SEX';    
   elsif vdia = 6 then vNomeDiaSemana := 'SÃB'; 
   end if;
   

   RETURN vNomeDiaSemana;
END;
$function$
