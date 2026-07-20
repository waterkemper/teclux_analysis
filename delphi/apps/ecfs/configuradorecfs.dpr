program configuradorecfs;

uses
  Forms,
  fmprincipal in 'fmprincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Configurador de ECF´s';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
