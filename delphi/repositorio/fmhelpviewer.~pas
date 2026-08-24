unit fmhelpviewer;

interface

uses
  SysUtils, Types, Classes, Variants, Controls, Forms, ComCtrls,
   Buttons, ActnList, Windows, ToolWin {Qete,};

type
  TfrmHelpForm = class(TForm)
    tblBarra: TToolBar;
    sbnAvancar: TSpeedButton;
    sbnVoltar: TSpeedButton;
    sbnConteudo: TSpeedButton;
    sbnSeparador: TToolButton;
    aclNavegador: TActionList;
    actConteudo: TAction;
    actVoltar: TAction;
    actAvancar: TAction;
    procedure actVoltarExecute(Sender: TObject);
    procedure actConteudoExecute(Sender: TObject);
    procedure actAvancarExecute(Sender: TObject);
    procedure actVoltarUpdate(Sender: TObject);
    procedure actAvancarUpdate(Sender: TObject);
    procedure tblBarraResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function FormHelp(HelpType: THelpType; HelpContext: THelpContext;
      const HelpKeyword, HelpFile: String; var Handled: Boolean): Boolean;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
  end;

  procedure RegisterHelpViewer;

var
  frmHelpForm: TfrmHelpForm;

implementation

uses
  HelpIntfs, biblio;

{$R *.dfm}

procedure CreateBrowser;
begin
  if not Assigned(frmHelpForm) then
    Application.CreateForm(TfrmHelpForm, frmHelpForm);
end;

{TfrmHelpForm}

constructor TfrmHelpForm.Create(AOwner: TComponent);
begin
  inherited;
  Dimensionar(Self, poMainFormCenter);
  Constraints.MinHeight:= ClientHeight;
  Constraints.MinWidth := ClientWidth;
  Caption := 'Ajuda do ' + Application.Title;
end;

procedure TfrmHelpForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FindForm(TForm(Application.MainForm));
end;

function TfrmHelpForm.FormHelp(HelpType: THelpType; HelpContext: THelpContext;
  const HelpKeyword, HelpFile: String; var Handled: Boolean): Boolean;
begin
  Result := True;
  Handled := True;
end;

procedure TfrmHelpForm.KeyDown(var Key: Word; Shift: TShiftState);
begin
  if Shift = [] then
    case Key of
      VK_ESCAPE: Close;
          VK_F3: sbnVoltar.Click;
          VK_F4: sbnAvancar.Click;
          VK_F9: sbnConteudo.Click;
    end;
    inherited;
end;

procedure TfrmHelpForm.tblBarraResize(Sender: TObject);
begin
  tblBarra.Repaint;
end;

procedure TfrmHelpForm.actVoltarExecute(Sender: TObject);
begin
//  bwrConteudo.Backward;
end;

procedure TfrmHelpForm.actAvancarExecute(Sender: TObject);
begin
//  bwrConteudo.Forward;
end;

procedure TfrmHelpForm.actVoltarUpdate(Sender: TObject);
begin
//  sbnVoltar.Enabled := bwrConteudo.CanGoBackward;
end;

procedure TfrmHelpForm.actAvancarUpdate(Sender: TObject);
begin
//  sbnAvancar.Enabled := bwrConteudo.CanGoForward;
end;

procedure TfrmHelpForm.actConteudoExecute(Sender: TObject);
begin
//  bwrConteudo.LoadFromFile(Application.HelpFile);
end;

{TtecHelpViewer}

type
  TtecHelpViewer = class(TInterfacedObject, ICustomHelpViewer)
  private
    FHelpStrings: TStringList;
    FHelpManager: IHelpManager;
    FViewerID: Integer;
    FHTMLFile: String;
    FHTMLAnchor: String;
  public
    function GetViewerName: String;
    function UnderstandsKeyword(const HelpString: String): Integer;
    function GetHelpStrings(const HelpString: String): TStringList;
    function CanShowTableOfContents: Boolean;
    procedure ShowHelp(const HelpString: String);
    procedure ShowTableOfContents;
    procedure NotifyID(const ViewerID: Integer);
    procedure SoftShutDown;
    procedure ShutDown;
    property HelpManager: IHelpManager read FHelpManager write FHelpManager;
    property ViewerID: Integer read FViewerID;
    property HelpStrings: TStringList read FHelpStrings;
  end;

function TtecHelpViewer.GetViewerName: String;
begin
  Result := 'Tecsoft';
end;

procedure TtecHelpViewer.NotifyID(const ViewerID: Integer);
begin
  FViewerID := ViewerID;
end;

procedure TtecHelpViewer.ShutDown;
begin
  frmHelpForm.Free;
end;

procedure TtecHelpViewer.SoftShutDown;
begin
  frmHelpForm.Close;
  if Assigned(FHelpManager) then
    FHelpManager := nil;
end;

function TtecHelpViewer.UnderstandsKeyword(const HelpString: String): Integer;
var
  AnchorPos: Integer;
begin
  if Pos('.htm', AnsiLowerCase(HelpString)) = 0 then
    Result := 0
  else
  begin
    AnchorPos := Length(HelpString);
    while (AnchorPos > 0) and (HelpString[AnchorPos] <> '#') do
      Dec(AnchorPos);
    if AnchorPos > 0 then
      FHTMLAnchor := Copy(HelpString, AnchorPos + 1, MaxInt)
    else
    begin
      FHTMLAnchor := '';
      AnchorPos := Length(HelpString) + 1;
    end;
    FHTMLFile := ExtractFilePath(FHelpManager.GetHelpFile);
    if FHTMLFile = '' then
      FHTMLFile := ExtractFilePath(Application.HelpFile);
    FHTMLFile := FHTMLFile + Copy(HelpString, 1, AnchorPos - 1);
    if FileExists(FHTMLFile) then
      Result := 1
    else
      Result := 0;
  end
end;

function TtecHelpViewer.GetHelpStrings(const HelpString: String): TStringList;
begin
  Result := TStringList.Create;
  Result.Add(FHTMLFile + FHTMLAnchor);
  FHelpStrings := Result;
end;

procedure TtecHelpViewer.ShowHelp(const HelpString: String);
begin
{
  CreateBrowser;
  with frmHelpForm do
  begin
    bwrConteudo.LoadFromFile(FHTMLFile);
    if FHTMLAnchor <> '' then
      bwrConteudo.ScrollToAnchor(FHTMLAnchor);
    ShowModal;
  end;
  }
end;

function TtecHelpViewer.CanShowTableOfContents: Boolean;
begin
  Result := FileExists(FHelpManager.GetHelpFile);
end;

procedure TtecHelpViewer.ShowTableOfContents;
begin
{
  CreateBrowser;
  with frmHelpForm do
  begin
    bwrConteudo.LoadFromFile(FHelpManager.GetHelpFile);
    Show;
  end;
  }
end;

var
  Viewer: TtecHelpViewer;

{ TtecHelpSelector }
type
  TtecHelpSelector = class(TInterfacedObject, IHelpSelector)
  public    function SelectKeyword(Keywords: TStrings) : Integer;
    function TableOfContents(Contents: TStrings): Integer;
  end;

function TtecHelpSelector.SelectKeyword(Keywords: TStrings): Integer;
var
  cnt: Integer;
begin
  Result := 0;
  for cnt := 0 to Keywords.Count - 1 do
    if Pos(AnsiLowerCase(ExtractFilePath(Application.HelpFile)), AnsiLowerCase(Keywords[cnt])) <> 0 then
    begin
      Result := cnt;
      Break;
    end;
end;

function TtecHelpSelector.TableOfContents(Contents: TStrings): Integer;
var
  cnt: Integer;
begin
  Result := 0;
  for cnt := 0 to Contents.Count - 1 do
    if Pos(AnsiLowerCase(ExtractFilePath(Application.HelpFile)), AnsiLowerCase(Contents[cnt])) <> 0 then
    begin
      Result := cnt;
      Break;
    end;
end;

var
  Selector: TtecHelpSelector;
procedure RegisterHelpViewer;
begin
  Viewer := TtecHelpViewer.Create;
  Selector := TtecHelpSelector.Create;
  RegisterViewer(Viewer, Viewer.FHelpManager);
  Application.HelpSystem.AssignHelpSelector(Selector);
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'help\' + GetArquivoAjuda;
end;

end.

