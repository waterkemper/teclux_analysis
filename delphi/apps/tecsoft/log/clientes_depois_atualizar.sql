CREATE OR REPLACE FUNCTION public.clientes_depoisatualizar (
)
RETURNS trigger AS
$body$
BEGIN 

                                                  -- 15/JUN/2016 - LW
   ------------------------------------------------------- Como as tabelas  abaixo não possuem chave


   IF NEW.Codigo <> OLD.Codigo                          -- para cliente/fornecedor, elas precisa ser


   THEN UPDATE ContatosVFornecedores                    -- atualizadas na alteração do código


           SET CodigoVFornecedores = NEW.Codigo


           WHERE CodigoVFornecedores = OLD.Codigo AND


                 TipoVFornecedores   = 'C';








        UPDATE Contratos


           SET Cliente = NEW.Codigo


           WHERE Cliente = OLD.Codigo AND TipoCliente = 'C';











        UPDATE DadosFiscais


           SET Cliente = NEW.Codigo


           WHERE Cliente = OLD.Codigo AND TipoCliente = 'C';








        UPDATE DocumentosPag


           SET Fornecedor = NEW.Codigo


           WHERE Fornecedor = OLD.Codigo AND TipoFornecedor = 'C';


               





        UPDATE NotasPAG


           SET Fornecedor = NEW.Codigo


           WHERE Fornecedor = OLD.Codigo AND TipoFornecedor = 'C';


   END IF;


 





   IF (TG_OP = 'UPDATE') AND


     (UPPER(Parametros_Valor('AtualizarDadosClientesContratos')))= 'TRUE'     


   THEN 


   


    UPDATE Contratos


           SET Nome               = NEW.Nome,


               Nascto             = NEW.Nascto,


               ApelIdo            = NEW.ApelIdo,


               Sexo               = NEW.Sexo,


               Civil              = NEW.Civil,


               CivilData          = NEW.CivilData,


               IdDocumento        = NEW.IdDocumento,


               IdOrgao            = NEW.IdOrgao,


               IdData             = NEW.IdData,


               IdEstado           = NEW.IdEstado,


               PessoaTipo         = NEW.PessoaTipo,


               PessoaNumero       = NEW.PessoaNumero,


               Mae                = NEW.Mae,


               Pai                = NEW.Pai,


               Conceito           = NEW.Conceito,


               NaturalCidade      = NEW.NaturalCidade,


               NaturalEstado      = NEW.NaturalEstado,


               Rua                = NEW.Rua,


               Estado             = NEW.Estado,


               Cidade             = NEW.Cidade,


               Bairro             = NEW.Bairro,


               CEP                = NEW.CEP,


               EndNumero          = NEW.Numero,


               endcomplemento     = new.complemento,


               FoneTipo           = NEW.FoneTipo,


               FoneDDD            = NEW.FoneDDD,


               FoneNumero         = NEW.FoneNumero,


               FoneRamal          = NEW.FoneRamal,


               Fone2DDD           = NEW.Fone2DDD,


               Fone2Numero        = NEW.Fone2Numero,


               Fone2Ramal         = NEW.Fone2Ramal,


               ResTipo            = NEW.ResTipo,


               ResOnus            = NEW.ResOnus,


               ResTempo           = NEW.ResTempo,


               Empresa            = NEW.Empresa,


               EmpAdmissao        = NEW.EmpAdmissao,


               EmpCEP             = NEW.EmpCEP,


               EmpComprovado      = NEW.EmpComprovado,


               EmpFoneDDD         = NEW.EmpFoneDDD,


               EmpFoneNumero      = NEW.EmpFoneNumero,


               EmpFoneRamal       = NEW.EmpFoneRamal,


               EmpOutrasDescricao = NEW.EmpOutrasDescricao,


               EmpOutrasFaixa     = NEW.EmpOutrasFaixa,


               EmpOutrasValor     = NEW.EmpOutrasValor,


               EmprEndaFaixa      = NEW.EmprEndaFaixa,


               EmprEndaValor      = NEW.EmprEndaValor,


               EmpRua             = NEW.EmpRua,


               EmpEstado          = NEW.EmpEstado,


               EmpCidade          = NEW.EmpCidade,


               EmpBairro          = NEW.EmpBairro,


               EmpCargo           = NEW.EmpCargo,


               Conjuge            = NEW.Conjuge,


               ConNome            = NEW.ConNome,


               ConAdmissao        = NEW.ConAdmissao,


               ConCEP             = NEW.ConCEP,


               ConEmpresa         = NEW.ConEmpresa,


               ConFoneDDD         = NEW.ConFoneDDD,


               ConFoneNumero      = NEW.ConFoneNumero,


               ConFoneRamal       = NEW.ConFoneRamal,


               ConNascto          = NEW.ConNascto,


               ConRendaFaixa      = NEW.ConRendaFaixa,


               ConRendaValor      = NEW.ConRendaValor,


               ConRua             = NEW.ConRua,


               ConEstado          = NEW.ConEstado,


               ConCidade          = NEW.ConCidade,


               ConBairro          = NEW.ConBairro,


               ConCargo           = NEW.ConCargo,


               Referencia         = NEW.Referencia,


               RefTipo            = NEW.RefTipo,


               RefRua             = NEW.RefRua,


               RefEstado          = NEW.RefEstado,


               RefCidade          = NEW.RefCidade,


               RefBairro          = NEW.RefBairro,


               RefCEP             = NEW.RefCEP,


               RefFoneDDD         = NEW.RefFoneDDD,


               RefFoneNumero      = NEW.RefFoneNumero,


               RefFoneRamal       = NEW.RefFoneRamal,


               RefFone2DDD        = NEW.RefFone2DDD,


               RefFone2Numero     = NEW.RefFone2Numero,


               RefFone2Ramal      = NEW.RefFone2Ramal,


               Observacoes        = NEW.Observacoes,


               EMail              = NEW.EMail,


               Automovel          = NEW.Automovel,


               Cartaocredito      = NEW.Cartaocredito,


               Cartaoloja         = NEW.Cartaoloja,


               Cheque             = NEW.Cheque,


               Chequeespecial     = NEW.Chequeespecial,


               DepEndentes        = NEW.Dependentes,


               Onus               = NEW.Onus,


               ContribICMS        = NEW.ContribICMS





           WHERE Cliente    = NEW.Codigo AND


                 TipoCliente       = 'C' AND


                 Situacao IN ('O',  -- [O]rçado


                              'R',  -- [R]eservado


                              'F'); -- [F]aturado


                              


      if coalesce(new.atendimentogeroufichaalerta,0) = 


         coalesce(old.atendimentogeroufichaalerta,0) then  /* evitar problemas com o cruzamento de triggers orcamento, atendimento e clientes */


                                                     


        UPDATE Orcamentos 


                SET Nome             =    NEW.Nome,


                --Nascto             =    NEW.Nascto,


                --ApelIdo            =    NEW.ApelIdo,


                --Sexo               =    NEW.Sexo,


                --Civil              =    NEW.Civil,


                --CivilData          =    NEW.CivilData,


                --IdDocumento        =    NEW.IdDocumento,


                --IdOrgao            =    NEW.IdOrgao,


                --IdData             =    NEW.IdData,


                --IdEstado           =    NEW.IdEstado,


                PessoaTipo           =    NEW.PessoaTipo,


                PessoaNumero         =    NEW.PessoaNumero,


                --Mae                =    NEW.Mae,


                --Pai                =    NEW.Pai,


                --Conceito           =    NEW.Conceito,


                --NaturalCidade      =    NEW.NaturalCidade,


                --NaturalEstado      =    NEW.NaturalEstado,


                Rua                  =    NEW.Rua,


                Estado               =    NEW.Estado,


                Cidade               =    NEW.Cidade,


                Bairro               =    NEW.Bairro,


                CEP                  =    NEW.CEP,


                Numero               =    NEW.Numero,


                complemento          =    new.complemento,


                --FoneTipo           =    NEW.FoneTipo,


                FoneDDD              =    NEW.FoneDDD,


                FoneNumero           =    NEW.FoneNumero,


                FoneRamal            =    NEW.FoneRamal,


                Fone2DDD             =    NEW.Fone2DDD,


                Fone2Numero          =    NEW.Fone2Numero,


                Fone2Ramal           =    NEW.Fone2Ramal,


                --ResTipo            =    NEW.ResTipo,


                --ResOnus            =    NEW.ResOnus,


                --ResTempo           =    NEW.ResTempo,


                --Empresa            =    NEW.Empresa,


                --EmpAdmissao        =    NEW.EmpAdmissao,


                --EmpCEP             =    NEW.EmpCEP,


                --EmpComprovado      =    NEW.EmpComprovado,


                --EmpFoneDDD         =    NEW.EmpFoneDDD,


                --EmpFoneNumero      =    NEW.EmpFoneNumero,


                --EmpFoneRamal       =    NEW.EmpFoneRamal,


                --EmpOutrasDescricao =    NEW.EmpOutrasDescricao,


                --EmpOutrasFaixa     =    NEW.EmpOutrasFaixa,


                --EmpOutrasValor     =    NEW.EmpOutrasValor,


                --EmprEndaFaixa      =    NEW.EmprEndaFaixa,


                --EmprEndaValor      =    NEW.EmprEndaValor,


                --EmpRua             =    NEW.EmpRua,


                --EmpEstado          =    NEW.EmpEstado,


                --EmpCidade          =    NEW.EmpCidade,


                --EmpBairro          =    NEW.EmpBairro,


                EmpCargo             =    NEW.EmpCargo,


                --Conjuge            =    NEW.Conjuge,


                --ConNome            =    NEW.ConNome,


                --ConAdmissao        =    NEW.ConAdmissao,


                --ConCEP             =    NEW.ConCEP,


                --ConEmpresa         =    NEW.ConEmpresa,


                --ConFoneDDD         =    NEW.ConFoneDDD,


                --ConFoneNumero      =    NEW.ConFoneNumero,


                --ConFoneRamal       =    NEW.ConFoneRamal,


                --ConNascto          =    NEW.ConNascto,


                --ConRendaFaixa      =    NEW.ConRendaFaixa,


                --ConRendaValor      =    NEW.ConRendaValor,


                --ConRua             =    NEW.ConRua,


                --ConEstado          =    NEW.ConEstado,


                --ConCidade          =    NEW.ConCidade,


                --ConBairro          =    NEW.ConBairro,


                --ConCargo           =    NEW.ConCargo,


                --Referencia         =    NEW.Referencia,


                --RefTipo            =    NEW.RefTipo,


                --RefRua             =    NEW.RefRua,


                --RefEstado          =    NEW.RefEstado,


                --RefCidade          =    NEW.RefCidade,


                --RefBairro          =    NEW.RefBairro,


                --RefCEP             =    NEW.RefCEP,


                --RefFoneDDD         =    NEW.RefFoneDDD,


                --RefFoneNumero      =    NEW.RefFoneNumero,


                --RefFoneRamal       =    NEW.RefFoneRamal,


                --RefFone2DDD        =    NEW.RefFone2DDD,


                --RefFone2Numero     =    NEW.RefFone2Numero,


                --RefFone2Ramal      =    NEW.RefFone2Ramal,


                --Observacoes        =    NEW.Observacoes,


                EMail                =    NEW.EMail


                --Automovel          =    NEW.Automovel,


                --Cartaocredito      =    NEW.Cartaocredito,


                --Cartaoloja         =    NEW.Cartaoloja,


                --Cheque             =    NEW.Cheque,


                --Chequeespecial     =    NEW.Chequeespecial,


                --DepEndentes        =    NEW.Dependentes,


                --Onus               =    NEW.Onus,


                --ContribICMS        =    NEW.ContribICMS


                


         WHERE Cliente    = NEW.Codigo AND


               TipoCliente       = 'C' AND


               Situacao IN ('A');  -- [A]berto


               


      end if;  


      


   END IF;


          


   IF COALESCE(NEW.Conceito, 0) <> COALESCE(OLD.Conceito, 0)


   THEN 


        UPDATE Contratos


           SET Conceito = NEW.Conceito 


           WHERE Cliente     = NEW.Codigo AND


                 TipoCliente = 'C'        AND


                 COALESCE(Conceito, 0) <> NEW.Conceito;





        UPDATE DadosFiscais


           SET Conceito = NEW.Conceito 


           WHERE Cliente     = NEW.Codigo AND


                 TipoCliente = 'C'        AND


                 COALESCE(Conceito, 0) <> NEW.Conceito;


   END IF;








   RETURN NEW;





End;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;

ALTER FUNCTION public.clientes_depoisatualizar ()
  OWNER TO tecsoft;