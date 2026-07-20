{**********************************************************}
{                                                          }
{         Simple HTML HelpViewer                           }
{                                                          }
{         Version 1.0.0 - 24 September 2001                }
{                                                          }
{         Copyright (c) 2001  Jan Goyvaerts                }
{                                                          }
{         http://www.helpscribble.com/                     }
{         http://www.jgsoft.com/                           }
{         mailto:jg@jgsoft.com                             }
{                                                          }
{**********************************************************}

{
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}

unit SimpleHTMLHelp;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

type
  TFormSimpleHTMLHelpViewer = class(TForm)
    Browser: TTextBrowser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSimpleHTMLHelpViewer: TFormSimpleHTMLHelpViewer;

implementation

uses
  HelpIntfs;

{$R *.dfm}

procedure CreateBrowser;
begin
  if not Assigned(FormSimpleHTMLHelpViewer) then Application.CreateForm(TFormSimpleHTMLHelpViewer, FormSimpleHTMLHelpViewer);
end;

type
  TSimpleHTMLHelpViewer = class(TInterfacedObject, ICustomHelpViewer)
  private
//    FHelpStrings : TStringList;
    FViewerID : Integer;
    FHelpManager : IHelpManager;
    FHTMLFile: string;
    FHTMLAnchor: string;
  public
    { ICustomHelpViewer }
    function GetViewerName: string;
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
  end;

{ TSimpleHTMLHelpViewer }

function TSimpleHTMLHelpViewer.CanShowTableOfContents: Boolean;
begin
  Result := FileExists(FHelpManager.GetHelpFile);
end;

function TSimpleHTMLHelpViewer.GetHelpStrings(const HelpString: String): TStringList;
begin
  Result := TStringList.Create;
  Result.Add(FHTMLFile + FHTMLAnchor);
end;

function TSimpleHTMLHelpViewer.GetViewerName: String;
begin
  Result := 'Simple HTML HelpViewer';
end;

procedure TSimpleHTMLHelpViewer.NotifyID(const ViewerID: Integer);
begin
  FViewerID := ViewerID;
end;

procedure TSimpleHTMLHelpViewer.ShowHelp(const HelpString: String);
begin
  CreateBrowser;
  FormSimpleHTMLHelpViewer.Browser.LoadFromFile(FHTMLFile);
  if FHTMLAnchor <> '' then FormSimpleHTMLHelpViewer.Browser.ScrollToAnchor(FHTMLAnchor);
  FormSimpleHTMLHelpViewer.Show;
end;

procedure TSimpleHTMLHelpViewer.ShowTableOfContents;
begin
  CreateBrowser;
  FormSimpleHTMLHelpViewer.Browser.LoadFromFile(FHelpManager.GetHelpFile);
  FormSimpleHTMLHelpViewer.Show;
end;

procedure TSimpleHTMLHelpViewer.ShutDown;
begin
  // Do not use FormSimpleHTMLHelpViewer at this point
  // It probably most likely has been destroyed already
end;

procedure TSimpleHTMLHelpViewer.SoftShutDown;
begin
  FormSimpleHTMLHelpViewer.Close;
  if Assigned(FHelpManager) then FHelpManager := nil;
end;

function TSimpleHTMLHelpViewer.UnderstandsKeyword(const HelpString: String): Integer;
var
  AnchorPos: Integer;
begin
  if Pos('.htm', AnsiLowerCase(HelpString)) = 0 then Result := 0
  else begin
    // See if there is an anchor
    AnchorPos := Length(HelpString);
    while (AnchorPos > 0) and (HelpString[AnchorPos] <> '#') do Dec(AnchorPos);
    if AnchorPos > 0 then begin
      FHTMLAnchor := Copy(HelpString, AnchorPos+1, MaxInt);
    end
    else begin
      FHTMLAnchor := '';
      AnchorPos := Length(HelpString) + 1;
    end;
    // Get the path to the HTML files
    FHTMLFile := ExtractFilePath(FHelpManager.GetHelpFile);
    if FHTMLFile = '' then FHTMLFile := ExtractFilePath(Application.ExeName);
    // Get the HTML file
    FHTMLFile := FHTMLFile + Copy(HelpString, 1, AnchorPos-1);
    // If the file exists, we can show it
    if FileExists(FHTMLFile) then Result := 1 else Result := 0;
  end
end;

var
  HelpViewer: TSimpleHTMLHelpViewer;

initialization
  HelpViewer := TSimpleHTMLHelpViewer.Create;
  HelpIntfs.RegisterViewer(HelpViewer, HelpViewer.FHelpManager);
end.

