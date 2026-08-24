program XMLBrowser;

uses
  Forms,
  MainForm in 'forms\MainForm.pas' {frmMain},
  ParamaterEditorForm in 'forms\ParamaterEditorForm.pas' {frmEditParam},
  ECXMLTokenizer in '..\..\ECXMLTokenizer.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'XML Browser';
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
