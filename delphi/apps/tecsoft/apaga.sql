delete from contratosdevolvidos where contrato = '58718';
update produtoscontratos set cancelado=null where contrato = '58718';
update servicoscontratos set cancelado=null where contrato = '58718';
update parcelas set datapagto=null,valorpagto=null,tipopagto=null where contrato = '58718';
update contratos set situacao='N' where numero = '58718';

delete from notaspag where contrato = '58718';
