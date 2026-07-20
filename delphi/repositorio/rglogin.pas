unit rglogin;

interface

Uses
  //CLX
  Forms, classes;

implementation

Uses
  //Pojeto
  dmbasico, dmtecsoft,
  fmlogin, fmsplash, fmrenovarsenha;

initialization
  RegisterClasses([TdtmBasico, Tdtmtecsoft, TfrmLogin, TfrmSplash, TfrmRenovarSenha]);
end.