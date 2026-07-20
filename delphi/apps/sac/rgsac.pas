unit rgsac;

interface

Uses
  //CLX
  classes;

implementation

uses
  fmcadastroatendimento, fmcadastrotiposatendimentos, fmligarclientes,
  fmligarclientesdadoscliente, fmmaladireta, fmManutencaoAgendamento;

initialization
  RegisterClasses([TfrmCadastroAtendimento, Tfrmcadastrotiposatendimentos, TfrmLigarClientes,
                   Tfrmligarclientesdadoscliente, TfrmMalaDireta, TfrmManutencaoAgendamento]);

end.
 