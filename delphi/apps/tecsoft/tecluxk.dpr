program tecluxk;



uses
  dmbasico,
  QForms,
  fmsplash,
  fmtecsoft in 'fmtecsoft.pas' {frmTecsoft},
  fmdescricaoteclux in 'fmdescricaoteclux.pas' {frmDescricaoTecLUX},
  versao in 'versao.pas';

{$R *.res}

begin
  Application.Initialize;
  try
    Application.Title := 'tecLUX - Automação Comercial';
    frmSplash := TfrmSplash.Create(Application);
    frmSplash.setVersao(GetVersao);
    frmSplash.Show;
    if LerConfiguracaoSistema(frmSplash.Notificacao) then begin
      VersaoBanco := TdtmBasico.VersaoBanco;
      Application.CreateForm(TfrmTecsoft, frmTecsoft);
      VerificarECF(frmSplash.Notificacao);
    end;
  finally
    frmSplash.Free;
    if Assigned(frmTecsoft) then
      frmTecsoft.VerificarMenu;
    Application.Run;
  end;
end.
