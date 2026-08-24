/* drop table public.ProcessoJudicialReinf; 
drop table public.SuspensaoExibilidadeTributos; */

drop table public.Envio_ProcessoJudicialReinf cascade;
drop table public.Envio_SuspensaoExibilidadeTributos;

/* drop table public.obras_vfornecedores; 
drop table public.fornecedor_infoProcRetPr; 
drop table public.fornecedor_infoProcRetAd; 
drop table public.Reinf_2010;
drop table public.Reinf_2010_infoTpServ;
drop table public.Reinf_2010_infoProcRetPr;
drop table public.Reinf_2010_infoProcRetAd; 
drop table public.reinf_tabela_06; */

drop table public.Envio_Reinf_2010 cascade;
drop table public.Envio_Reinf_2010_infoTpServ;
drop table public.Envio_Reinf_2010_infoProcRetPr;
drop table public.Envio_Reinf_2010_infoProcRetAd;

/*
drop table public.Reinf_2020;
drop table public.Reinf_2020_infoTpServ;
drop table public.Reinf_2020_infoProcRetPr;
drop table public.Reinf_2020_infoProcRetAd;
*/

drop table public.Envio_Reinf_2020 cascade;
drop table public.Envio_Reinf_2020_infoProcRetPr;
drop table public.Envio_Reinf_2020_infoProcRetAd;
drop table public.Envio_Reinf_2020_infoTpServ;
/*
drop table public.Reinf_2040_recursosRep;
drop table public.Reinf_2040_infoRecurso;
*/
drop table public.Envio_Reinf_2040_recursosRep cascade;
drop table public.Envio_Reinf_2040_infoRecurso;


/*drop table public.Reinf_2040_infoProc; */
drop table public.Envio_Reinf_2040_infoProc


drop table public.Reinf cascade;
/*
drop table public.Envio_Reinf;
*/


create table public.ProcessoJudicialReinf (
  numero integer,
  tpProc smallint,
  nrProc varchar(21),
  iniValid VARCHAR(7),
  fimValid varchar(7),
  indAutoria smallint,  
  observacoes varchar(500),
  DataHoraExclusao TimeStamp,  
  DataHoraAlteracao TimeStamp
  
  constraint ckProcessoJudicialReinf_tpProc check (tpProc in (1,2)),
  constraint ckProcessoJudicialReinf_indAutoria check (indAutoria in (1,2)),
  CONSTRAINT pkProcessoJudicialReinf PRIMARY KEY(numero)
);  



create table public.SuspensaoExibilidadeTributos (
  ProcessoJudicial integer,
  numero integer,  
   codSusp varchar(14),
   indSusp varchar(2),
   dtDecisao date,
   indDeposito char(1),
   ufVara varchar(2),
   codMunic integer,
   idVara varchar(2),  
  DataHoraExclusao TimeStamp,  
  constraint fkProcessoJudicialReinf_ProcessoJudicial foreign key (ProcessoJudicial) references ProcessoJudicialReinf (numero),
  CONSTRAINT pkSuspensaoExibilidadeTributos PRIMARY KEY(numero)
 
);



CREATE UNIQUE INDEX suspensaoexibilidadetributos_idxcodsusp ON public.suspensaoexibilidadetributos
  USING btree (codsusp);  
  
  
create table public.Envio_ProcessoJudicialReinf (
  numero integer,
  numeroreinf integer,  
  Operacao char(1),
  tpProc smallint,
  nrProc varchar(21),
  iniValid VARCHAR(7),
  fimValid varchar(7),
  indAutoria smallint,  
  observacoes varchar(500),
  DataHoraExclusao TimeStamp,  
  DataHoraAlteracao TimeStamp,
  nrRecArqBase varchar(52),
   
  constraint ckEnvio_ProcessoJudicialReinf_tpProc check (tpProc in (1,2)),
  constraint ckEnvio_ProcessoJudicialReinf_indAutoria check (indAutoria in (1,2)),  
  constraint ckEnvio_ProcessoJudicialReinf_Operacao check (Operacao in ('I','A','E')),  
  CONSTRAINT pkEnvio_ProcessoJudicialReinf PRIMARY KEY(numero, numeroreinf),
  constraint fkEnvio_ProcessoJudicialReinf foreign key (numero) REFERENCES ProcessoJudicialReinf (numero)
);  


create table public.Envio_SuspensaoExibilidadeTributos (
  ProcessoJudicial integer,
  numeroreinf integer,  
  numero integer,  
  codSusp varchar(14),
  indSusp varchar(2),
  dtDecisao date,
  indDeposito char(1),
  ufVara varchar(2),
  codMunic integer,
  idVara varchar(2),  
  DataHoraExclusao TimeStamp,  
  constraint fkEnvio_SuspensaoProcessoJudicialReinf_ProcessoJudicial foreign key (ProcessoJudicial) references ProcessoJudicialReinf (numero),
  CONSTRAINT pkEnvio_SuspensaoExibilidadeTributos PRIMARY KEY(numero, numeroreinf),
  constraint fkEnvio_SuspensaoExibilidadeTributos foreign key (ProcessoJudicial, numeroreinf) 
               REFERENCES Envio_ProcessoJudicialReinf (numero, numeroreinf)
);  


CREATE SEQUENCE public.ProcessoJudicialReinf_proximonumero
  INCREMENT 1 MINVALUE 1
  MAXVALUE 9223372036854775807 START 1
  CACHE 1;
  
  
CREATE OR REPLACE FUNCTION public.ProcessoJudicialReinf_proximonumero ()
RETURNS integer AS
$body$
SELECT NEXTVAL('ProcessoJudicialReinf_proximonumero')::INTEGER;
$body$
LANGUAGE 'sql';  

CREATE SEQUENCE public.SuspensaoExibilidadeTributos_proximonumero
  INCREMENT 1 MINVALUE 1
  MAXVALUE 9223372036854775807 START 1
  CACHE 1;
  
  
CREATE OR REPLACE FUNCTION public.SuspensaoExibilidadeTributos_proximonumero ()
RETURNS integer AS
$body$
SELECT NEXTVAL('SuspensaoExibilidadeTributos_proximonumero')::INTEGER;
$body$
LANGUAGE 'sql';  


alter table filiais add column FinalValidadeReinf date;
alter table filiais add column indEscrituracao smallint;
alter table filiais add column DataHoraAlteracaoDadosReinf TimeStamp;


create table public.obras_vfornecedores (
  cliente integer,
  tipocliente char(1),
  cno varchar(14),
  tpInscEstabindobra integer default 1,      
  descricao varchar(100),
    
  constraint pkobras_vfornecedores primary key (cliente, tipocliente, cno, tpInscEstabindobra)
);  
COMMENT ON COLUMN public.obras_vfornecedores.tpInscEstabindobra
IS 'campo para garantir a integridade referencial para a tabela Reinf_2010, Reinf_2020 na qual este campo podera ser null ou valor 1,2 
   1 - Cliente/Fornecedor  |  2 - Filial ';

   
create table public.fornecedor_infoProcRetPr (
  fornecedor integer,
  tipofornecedor char(1),
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,
  
  constraint pkfornecedor_infoProcRetPr primary key (fornecedor, tipofornecedor, ProcessoJudicial),
  /*constraint fkfornecedor_infoProcRetPr_fornecedor foreign key (fornecedor) references fornecedores (codigo),*/
  constraint fkfornecedor_infoProcRetPr_ProcessoJudicial foreign key (ProcessoJudicial) references ProcessoJudicialReinf (numero),
  constraint fkfornecedor_infoProcRetPr_NumeroSuspensaoExibilidadeTributos foreign key (NumeroSuspensaoExibilidadeTributos) references SuspensaoExibilidadeTributos (numero)
  
  );
  
create table public.fornecedor_infoProcRetAd (
  fornecedor integer,
  tipofornecedor char(1),
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,
  
  constraint pkfornecedor_infoProcRetAd primary key (fornecedor, tipofornecedor, ProcessoJudicial),
  /*constraint fkfornecedor_infoProcRetAd_fornecedor foreign key (fornecedor) references fornecedores (codigo),*/
  constraint fkfornecedor_infoProcRetAd_ProcessoJudicial foreign key (ProcessoJudicial) references ProcessoJudicialReinf (numero),
  constraint fkfornecedor_infoProcRetAd_NumeroSuspensaoExibilidadeTributos foreign key (NumeroSuspensaoExibilidadeTributos) references SuspensaoExibilidadeTributos (numero)
  
  );  
  
create table public.Reinf_2010 (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1),
  filial integer,
  tipofilial char(1),
  tpInscEstabindobra_1 integer,
  tpInscEstabindobra_2 integer,
  
  tpInscEstab smallint,
  nrInscEstab varchar(14),
  indObra smallint,
  
  cnpjPrestador varchar(14),
  indCPRB smallint,
  DataHoraAlteracaoDadosReinf TimeStamp,
  DataHoraExclusaoDadosReinf TimeStamp, 
  
  constraint pkReinf_2010 primary key (documentopag),  
  constraint fkReinf_2010_documentopag foreign key (documentopag) references documentospag (numero),
  /*constraint fkReinf_2010_fornecedor foreign key (vfornecedores) references vfornecedores (codigo),  */
  constraint fkReinf_2010_filial foreign key (filial) references filiais (codigo),    
  constraint fkReinf_2010_obras_fornecedor foreign key (fornecedor, tipofornecedor, nrInscEstab, tpInscEstabindobra_1) references obras_vfornecedores (cliente, tipocliente, cno, tpInscEstabindobra) on update CASCADE,
  constraint fkReinf_2010_obras_filiais foreign key (filial, tipofilial, nrInscEstab, tpInscEstabindobra_2) references obras_vfornecedores (cliente, tipocliente, cno, tpInscEstabindobra) on update CASCADE
  
);  



create table public.reinf_tabela_06 (
codigovisual integer,
codigo integer,
descricao varchar(100),
constraint pkreinf_tabela_06 primary key(codigovisual)
);

insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (01, 100000001, 'Limpeza, conservação ou zeladoria');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (02, 100000002, 'Vigilância ou segurança');                                            
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (03, 100000003, 'Construção civil');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (04, 100000004, 'Serviços de natureza rural');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (05, 100000005, 'Digitação');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (06, 100000006, 'Preparação de dados para processamento');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (07, 100000007, 'Acabamento');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (08, 100000008, 'Embalagem');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (09, 100000009, 'Acondicionamento');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (10, 100000010, 'Cobrança');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (11, 100000011, 'Coleta ou reciclagem de lixo ou de resíduos');                     
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (12, 100000012, 'Copa                                                               ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (13, 100000013, 'Hotelaria                                                          ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (14, 100000014, 'Corte ou ligação de serviços públicos                              ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (15, 100000015, 'Distribuição                                                       ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (16, 100000016, 'Treinamento e ensino                                               ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (17, 100000017, 'Entrega de contas e de documentos                                  ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (18, 100000018, 'Ligação de medidores                                               ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (19, 100000019, 'Leitura de medidores                                               ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (20, 100000020, 'Manutenção de instalações, de máquinas ou de equipamentos          ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (21, 100000021, 'Montagem                                                           ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (22, 100000022, 'Operação de máquinas, de equipamentos e de veículos                ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (23, 100000023, 'Operação de pedágio ou de terminal de transporte                   ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (24, 100000024, 'Operação de transporte de passageiros                              ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (25, 100000025, 'Portaria, recepção ou ascensorista                                 ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (26, 100000026, 'Recepção, triagem ou movimentação de materiais                     ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (27, 100000027, 'Promoção de vendas ou de eventos                                   ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (28, 100000028, 'Secretaria e expediente                                            ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (29, 100000029, 'Saúde                                                              ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (30, 100000030, 'Telefonia ou telemarketing                                         ');
insert into reinf_tabela_06 (codigovisual, codigo, descricao) values (31, 100000031, 'Trabalho temporário na forma da Lei nº 6.019, de janeiro de 1974   ');

update reinf_tabela_06 set descricao = btrim(descricao);

create table public.Reinf_2010_infoTpServ (
  documentopag integer, 
  numero serial,
  tpServico integer,
  vlrBaseRet numeric(14,2),
  vlrRetencao numeric(14,2),
  vlrRetSub numeric(14,2),
  vlrNRetPrinc numeric(14,2),
  vlrServicos15 numeric(14,2),
  vlrServicos20 numeric(14,2),
  vlrServicos25 numeric(14,2),
  vlrAdicional numeric(14,2),
  vlrNRetAdic numeric(14,2),
  constraint pkReinf_2010_infoTpServ primary key (documentopag, numero),
  constraint fkReinf_2010_infoTpServ_documentopag foreign key (documentopag) references documentospag (numero),
  constraint fkReinf_2010_tpServico foreign key (tpServico) references reinf_tabela_06(codigovisual)
);  


create table public.Reinf_2010_infoProcRetPr (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1), 
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorPrinc numeric(14,2),
  
  constraint pkReinf_2010_infoProcRetPr primary key (documentopag, fornecedor, tipofornecedor, ProcessoJudicial),  
  constraint fkReinf_2010_infoProcRetPr_documentopag foreign key (documentopag) references documentospag (numero)
  
);  

create table public.Reinf_2010_infoProcRetAd (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1), 
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorAdic numeric(14,2),
  
  constraint pkReinf_2010_infoProcRetAd primary key (documentopag, fornecedor, tipofornecedor, ProcessoJudicial),  
  constraint fkReinf_2010_infoProcRetAd_documentopag foreign key (documentopag) references documentospag (numero)
  
);  




alter table fornecedores add column indCPRB smallint;

create table public.Envio_Reinf_2010 (
  documentopag integer, 
  numeroreinf integer,  
  Operacao char(1),
  
  fornecedor integer,
  tipofornecedor char(1),
  filial integer,
  tipofilial char(1),
  
  tpInscEstab smallint,
  nrInscEstab varchar(14),
  indObra smallint,
  
  cnpjPrestador varchar(14),
  indCPRB smallint,
  DataHoraAlteracaoDadosReinf TimeStamp,
  DataHoraExclusaoDadosReinf TimeStamp,
  nrRecArqBase varchar(52),
  
  constraint pkEnvio_Reinf_2010 primary key (documentopag, numeroreinf),
  
  constraint fkEnvio_Reinf_2010_documentopag foreign key (documentopag) references documentospag (numero),
  constraint fkEnvio_Reinf_2010_filial foreign key (filial) references filiais (codigo)
  
);  

create table public.Envio_Reinf_2010_infoTpServ (
  documentopag integer, 
  numeroreinf integer,
  numero integer,
  tpServico integer,
  vlrBaseRet numeric(14,2),
  vlrRetencao numeric(14,2),
  vlrRetSub numeric(14,2),
  vlrNRetPrinc numeric(14,2),
  vlrServicos15 numeric(14,2),
  vlrServicos20 numeric(14,2),
  vlrServicos25 numeric(14,2),
  vlrAdicional numeric(14,2),
  vlrNRetAdic numeric(14,2),
  constraint pkEnvio_Reinf_2010_infoTpServ primary key (documentopag, numero, numeroreinf),
  constraint fkEnvio_Reinf_2010_infoTpServ_documentopag foreign key (documentopag) references documentospag (numero),
  constraint fkEnvio_Reinf_2010_infoTpServ_Reinf_2010 foreign key (documentopag, numeroreinf) references Envio_Reinf_2010 (documentopag, numeroreinf),
  constraint fkEnvio_Reinf_2010_tpServico foreign key (tpServico) references reinf_tabela_06(codigovisual)
);  



create table public.Envio_Reinf_2010_infoProcRetPr (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1), 
  ProcessoJudicial integer,
  numeroreinf integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorPrinc numeric(14,2),
  
  constraint pkEnvio_Reinf_2010_infoProcRetPr primary key (documentopag, fornecedor, tipofornecedor, ProcessoJudicial, numeroreinf ),  
  constraint fkEnvio_Reinf_2010_infoProcRetPr_documentopag foreign key (documentopag) references documentospag (numero)
  
);  

create table public.Envio_Reinf_2010_infoProcRetAd (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1), 
  ProcessoJudicial integer,
  numeroreinf integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorAdic numeric(14,2),
  
  constraint pkEnvio_Reinf_2010_infoProcRetAd primary key (documentopag, fornecedor, tipofornecedor, ProcessoJudicial, numeroreinf),  
  constraint fkEnvio_Reinf_2010_infoProcRetAd_documentopag foreign key (documentopag) references documentospag (numero)
  
);  


create table public.Reinf_2020 (
  dadofiscal integer,  
  cliente integer,
  tipocliente char(1),
  
  filial integer,
  tipofilial char(1),
  
  tpInscTomadorindobra_1 integer,
  tpInscTomadorindobra_2 integer,
  
  tpInscTomador smallint,
  nrInscTomador varchar(14),
  indObra smallint,
  
  tpInscEstabPrest smallint,
  nrInscEstabPrest varchar(14),
  
  DataHoraAlteracaoDadosReinf TimeStamp,
  DataHoraExclusaoDadosReinf TimeStamp, 
    
  constraint pkReinf_2020 primary key (dadofiscal),  
  constraint fkReinf_2020_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero),
  /*constraint fkReinf_2020_cliente foreign key (cliente) references clientes (codigo),  */
  constraint fkReinf_2020_filial foreign key (filial) references filiais (codigo),    
  constraint fkReinf_2020_obras_cliente foreign key (cliente, tipocliente, nrInscTomador, tpInscTomadorindobra_1) references obras_vfornecedores (cliente, tipocliente, cno, tpinscestabindobra) on update CASCADE,
  constraint fkReinf_2020_obras_filiais foreign key (filial, tipofilial, nrInscTomador, tpInscTomadorindobra_2) references obras_vfornecedores (cliente, tipocliente, cno, tpinscestabindobra) on update CASCADE
  
);  


create table public.Reinf_2020_infoTpServ (
  dadofiscal integer, 
  numero serial,
  tpServico integer,
  vlrBaseRet numeric(14,2),
  vlrRetencao numeric(14,2),
  vlrRetSub numeric(14,2),
  vlrNRetPrinc numeric(14,2),
  vlrServicos15 numeric(14,2),
  vlrServicos20 numeric(14,2),
  vlrServicos25 numeric(14,2),
  vlrAdicional numeric(14,2),
  vlrNRetAdic numeric(14,2),
  constraint pkReinf_2020_infoTpServ primary key (dadofiscal, numero),
  constraint fkReinf_2020_infoTpServ_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero),
  constraint fkReinf_2020_tpServico foreign key (tpServico) references reinf_tabela_06(codigovisual)
);  

create table public.Reinf_2020_infoProcRetPr (
  dadofiscal integer,  
  cliente integer,
  tipocliente char(1), 
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorPrinc numeric(14,2),
  
  constraint pkReinf_2020_infoProcRetPr primary key (dadofiscal, cliente, tipocliente, ProcessoJudicial),  
  constraint fkReinf_2020_infoProcRetPr_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero)  
);  

create table public.Reinf_2020_infoProcRetAd (
  dadofiscal integer,  
  cliente integer,
  tipocliente char(1), 
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorAdic numeric(14,2),
  
  constraint pkReinf_2020_infoProcRetAd primary key (dadofiscal, cliente, tipocliente, ProcessoJudicial),  
  constraint fkReinf_2020_infoProcRetAd_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero)
  
);  




Alter table clientes add column maodeobra boolean default false;

create table public.Envio_Reinf_2020 (
  dadofiscal integer,  
  numeroreinf integer,
  Operacao char(1),
  
  cliente integer,
  tipocliente char(1),
  
  filial integer,
  tipofilial char(1),
   
  tpInscTomador smallint,
  nrInscTomador varchar(14),
  indObra smallint,
  
  tpInscEstabPrest smallint,
  nrInscEstabPrest varchar(14),
  
  DataHoraAlteracaoDadosReinf TimeStamp,
  DataHoraExclusaoDadosReinf TimeStamp, 
  nrRecArqBase varchar(52),
  
  
  constraint pkEnvio_Reinf_2020 primary key (dadofiscal, numeroreinf),  
  constraint fkEnvio_Reinf_2020_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero),
  /*constraint fkReinf_2020_cliente foreign key (cliente) references clientes (codigo),  */
  constraint fkEnvio_Reinf_2020_filial foreign key (filial) references filiais (codigo)
  
);  

create table public.Envio_Reinf_2020_infoProcRetPr (
  dadofiscal integer,  
  cliente integer,
  tipocliente char(1), 
  ProcessoJudicial integer,
  numeroreinf integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorPrinc numeric(14,2),
  
  constraint pkEnvio_Reinf_2020_infoProcRetPr primary key (dadofiscal, cliente, tipocliente, ProcessoJudicial, numeroreinf ),  
  constraint fkEnvio_Reinf_2020_infoProcRetPr_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero)
);  

create table public.Envio_Reinf_2020_infoProcRetAd (
  dadofiscal integer,  
  cliente integer,
  tipocliente char(1), 
  ProcessoJudicial integer,
  numeroreinf integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  valorAdic numeric(14,2),
  
  constraint pkEnvio_Reinf_2020_infoProcRetAd primary key (dadofiscal, cliente, tipocliente, ProcessoJudicial, numeroreinf),  
  constraint fkEnvio_Reinf_2020_infoProcRetAd_dadofiscal foreign key (dadofiscal) references dadosfiscais (numero)
  
);  


create table public.Envio_Reinf_2020_infoTpServ (
  dadofiscal integer, 
  numeroreinf integer,
  numero integer,
  tpServico integer,
  vlrBaseRet numeric(14,2),
  vlrRetencao numeric(14,2),
  vlrRetSub numeric(14,2),
  vlrNRetPrinc numeric(14,2),
  vlrServicos15 numeric(14,2),
  vlrServicos20 numeric(14,2),
  vlrServicos25 numeric(14,2),
  vlrAdicional numeric(14,2),
  vlrNRetAdic numeric(14,2),
  constraint pkEnvio_Reinf_2020_infoTpServ primary key (dadofiscal, numero, numeroreinf),
  constraint fkEnvio_Reinf_2020_infoTpServ_documentopag foreign key (dadofiscal) references dadosfiscais (numero),
  constraint fkEnvio_Reinf_2020_infoTpServ_Reinf_2020 foreign key (dadofiscal, numeroreinf) references Envio_Reinf_2020 (dadofiscal, numeroreinf),
  constraint fkEnvio_Reinf_2020_tpServico foreign key (tpServico) references reinf_tabela_06(codigovisual)
);  


alter table filiais add column maodeobra boolean default false;


create table public.Reinf_2040_recursosRep (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1),
  filial integer,
  tipofilial char(1),
  
  tpInscEstab smallint,
  nrInscEstab varchar(14),
  
  cnpjAssocDesp varchar(14),
  
  DataHoraAlteracaoDadosReinf TimeStamp,
  DataHoraExclusaoDadosReinf TimeStamp, 
  
  constraint pkReinf_2040_recursosRep primary key (documentopag),  
  constraint fkReinf_2040_recursosRep_documentopag foreign key (documentopag) references documentospag (numero),
  constraint fkReinf_2040_recursosRep_filial foreign key (filial) references filiais (codigo)
  
);  

create table public.Reinf_2040_infoRecurso (
  documentopag integer, 
  numero serial,
  tpRepasse integer,/* Tipo de repasse, conforme tabela abaixo: 1 - Patrocínio; 2 - Licenciamento de marcas e símbolos; 3 - Publicidade; 4 - Propaganda; 5 - Transmissão de espetáculos. */
  descRecurso varchar(20),
  vlrBruto numeric(14,2),
  vlrRetApur numeric(14,2),
  constraint pkReinf_2040_infoRecurso primary key (documentopag, numero),
  constraint fkReinf_2040_infoRecurso_documentopag foreign key (documentopag) references documentospag (numero)
);  


create table public.Envio_Reinf_2040_recursosRep (
  documentopag integer, 
  numeroreinf integer,
  Operacao char(1),
  
  fornecedor integer,
  tipofornecedor char(1),
  filial integer,
  tipofilial char(1),
  
  tpInscEstab smallint,
  nrInscEstab varchar(14),
  
  cnpjAssocDesp varchar(14),
  DataHoraAlteracaoDadosReinf TimeStamp,
  DataHoraExclusaoDadosReinf TimeStamp,
  nrRecArqBase varchar(52),
  
  constraint pkEnvio_Reinf_2040_recursosRep primary key (documentopag, numeroreinf),
  
  constraint fkEnvio_Reinf_2040_recursosRep_documentospag foreign key (documentopag) references documentospag (numero),
  constraint fkEnvio_Reinf_2040_recursosRep foreign key (filial) references filiais (codigo)
  
);  


create table public.Envio_Reinf_2040_infoRecurso (
  documentopag integer, 
  numeroreinf integer,
  numero integer,
  
  tpRepasse integer,/* Tipo de repasse, conforme tabela abaixo: 1 - Patrocínio; 2 - Licenciamento de marcas e símbolos; 3 - Publicidade; 4 - Propaganda; 5 - Transmissão de espetáculos. */
  descRecurso varchar(20),
  vlrBruto numeric(14,2),
  vlrRetApur numeric(14,2),
  
  constraint pkEnvio_Reinf_2040_infoRecurso primary key (documentopag, numero, numeroreinf),
  constraint fkEnvio_Reinf_2040_infoRecurso_documentopag foreign key (documentopag) references documentospag (numero),
  constraint fkEnvio_Reinf_2040_infoRecurso_Reinf_2010 foreign key (documentopag, numeroreinf) references Envio_Reinf_2040_recursosRep (documentopag, numeroreinf)
);  




create table public.Reinf_2040_infoProc (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1), 
  ProcessoJudicial integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  vlrNRet numeric(14,2),
  
  constraint pkReinf_2040_infoProc primary key (documentopag, fornecedor, tipofornecedor, ProcessoJudicial),  
  constraint fkReinf_2040_infoProc_documentopag foreign key (documentopag) references documentospag (numero)
  
);  

create table public.Envio_Reinf_2040_infoProc (
  documentopag integer,  
  fornecedor integer,
  tipofornecedor char(1), 
  ProcessoJudicial integer,
  numeroreinf integer,
  NumeroSuspensaoExibilidadeTributos integer,  
  vlrNRet numeric(14,2),
  
  constraint pkEnvio_Reinf_2040_infoProc primary key (documentopag, fornecedor, tipofornecedor, ProcessoJudicial, numeroreinf ),  
  constraint fkEnvio_Reinf_2040_infoProc_documentopag foreign key (documentopag) references documentospag (numero)
  
);  

create table public.Reinf (
  filial integer,     
  perApur varchar(7),
  tpAmb integer,   /* 1 - Produção 2 - Produção restrita */
  procEmi integer, /* 1 - Aplicativo do contribuinte; 2 - Aplicativo governamental */
  verProc varchar(20), /* Versão do processo de emissão do evento. Informar a versão do aplicativo emissor do evento. */
  DataHoraExclusao TimeStamp,  
  DataHoraAlteracao TimeStamp,
  constraint pkReinf primary key (filial, perApur),
  constraint fkReinf_filial foreign key (filial) references filiais (codigo)
);

create table public.Envio_Reinf (
  numero integer, 
  filial integer,     
  perApur varchar(7),
  tpAmb integer,    /* 1 - Produção 2 - Produção restrita */
  procEmi integer, /* 1 - Aplicativo do contribuinte; 2 - Aplicativo governamental */
  verProc varchar(20), /* Versão do processo de emissão do evento. Informar a versão do aplicativo emissor do evento. */
  DataHoraExclusao TimeStamp,  
  DataHoraAlteracao TimeStamp,
  DataHoraProcessamento timeStamp,
  
  constraint pkEnvio_Reinf primary key (numero),
  /*constraint pkEnvio_Reinf primary key (filial, perApur, DataHoraProcessamento),*/
  constraint fkEnvio_Reinf_filial foreign key (filial) references filiais (codigo)
);


create table public.Envio_Reinf_1000 (

  numeroreinf integer,
  Operacao char(1),
  
  tpInsc integer,
  nrInsc varchar(14),
  iniValid varchar(7),
  fimValid varchar(7),
  classTrib varchar(2),
  indEscrituracao integer,
  indDesoneracao integer,
  indAcordoIsenMulta integer,
  indSitPJ integer,

  nmCtt varchar(70),
  cpfCtt varchar(11),
  foneFixo varchar(13),
  foneCel varchar(13),
  email varchar(6),
  
  DataHoraExclusaoReinf timestamp,
  DataHoraAlteracaoReinf TimeStamp,
  
  
  constraint pkEnvio_Reinf_1000 primary key (numeroreinf,operacao),  
  constraint fkEnvio_Reinf_1000_numeroreinf foreign key (numeroreinf) references Envio_Reinf (numero)

);

alter table filiais add column DataHoraExclusaoReinf TimeStamp;
alter table filiais add column DataHoraAlteracaoReinf TimeStamp;