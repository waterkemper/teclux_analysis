unit fmConferenciaDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fmajuda, frselecaoaleatoria, StdCtrls, ComCtrls, db, ctconstantes,
  frconsultacodigo, cpdbfindcontrols, cpdatasource, ZQuery, ZPgSqlQuery,
  cpquery, dmtecsoft, Grids, DBGrids, cpdbgrid, cptexto, dmbasico,
  biblio, ExtCtrls, Buttons, clparametrossistema, frVisualizarImageURL,
  cpnumero, frxClass, frxDBSet, ZSqlBuffer, MMSystem, MPlayer, Mask;

type
  TfrmConferenciaDocumentos = class(TfrmAjuda)
    qryVolumesDadosfiscaisConferencia: TtecQuery;
    dsrVolumesDadosfiscaisConferencia: TtecDataSource;
    dbgProdutos: TtecDBGrid;
    qryProcuraProdutosCodigoBarras: TtecQuery;
    qryProcuraProdutosCodigoBarrascodigo: TLargeintField;
    qryProcuraProdutosCodigoBarrascodigovisual: TStringField;
    qryProcuraProdutosCodigoBarrascodigobarras: TStringField;
    qryProcuraProdutosCodigoBarrasdescricao: TStringField;
    qryProcuraProdutos: TtecQuery;
    qryProcuraProdutoscodigo: TLargeintField;
    qryProcuraProdutoscodigovisual: TStringField;
    qryProcuraProdutosdescricao: TStringField;
    shAtendidos: TShape;
    lblAtendidos: TLabel;
    sbnReConferir: TBitBtn;
    pnlTopo: TPanel;
    pnlRodape: TPanel;
    sbnSalvar: TBitBtn;
    qryConferencia: TtecQuery;
    dsrConferencia: TtecDataSource;
    qryConferenciatipo: TStringField;
    qryConferenciacodigo: TStringField;
    qryConferenciadata: TDateTimeField;
    qryConferenciausuario: TIntegerField;
    qryProcuraProdutosnomefoto: TStringField;
    qryProcuraProdutosnomethumb: TStringField;
    qryProdutosCompostos: TtecQuery;
    qryProdutosCompostoscomposto: TLargeintField;
    qryProdutosCompostoscomponente: TLargeintField;
    qryProdutosCompostoscomponentevisual: TStringField;
    qryProdutosCompostosquantidade: TFloatField;
    qryProdutosCompostoscodigo: TLargeintField;
    qryProdutosCompostosdescricao: TStringField;
    qryProdutosCompostospreco: TFloatField;
    qryProdutosCompostostotal: TFloatField;
    qryProdutosCompostosunidadecaracteristica: TStringField;
    qryProdutosCompostosordem: TIntegerField;
    qryProdutosCompostospossuicustofrete: TBooleanField;
    qryProdutosCompostosqueima: TBooleanField;
    qryProdutosCompostosqtceramicacarga: TIntegerField;
    qryProdutosCompostospercperda: TFloatField;
    qryProdutosCompostosimprimirosp: TBooleanField;
    qryProdutosCompostosdesconsiderarcusto: TBooleanField;
    qryProdutosCompostosunidade: TStringField;
    qryProdutosCompostosfatorconversao: TFloatField;
    qryProdutosCompostosexibirfluxogramaplanilhacusto: TBooleanField;
    qryProdutosCompostosquantidadeehsomatoriodoscomponentes: TBooleanField;
    qryProdutosCompostoscompostovisual: TStringField;
    qryProcuraProdutosCodigoBarrasvalorgrade1: TStringField;
    qryProcuraProdutosCodigoBarraslinha: TStringField;
    qryProcuraProdutosCodigoBarrasvalorgrade2: TStringField;
    qryProcuraProdutosCodigoBarrascoluna: TStringField;
    qryProcuraProdutosvalorgrade1: TStringField;
    qryProcuraProdutoslinha: TStringField;
    qryProcuraProdutosvalorgrade2: TStringField;
    qryProcuraProdutoscoluna: TStringField;
    qryProdutosCompostosvalorgrade1: TStringField;
    qryProdutosCompostoslinha: TStringField;
    qryProdutosCompostosvalorgrade2: TStringField;
    qryProdutosCompostoscoluna: TStringField;
    qryEstoques: TtecQuery;
    qryEstoqueslocalizacao: TStringField;
    pnlDetalhes: TPanel;
    frxProdutosConferenciaVisao: TfrxDBDataset;
    frxImpressaoConferencia: TfrxReport;
    btnImprimir: TBitBtn;
    qryIdentificacao: TtecQuery;
    qryIdentificacaoidentificacao: TStringField;
    frxIdentificacao: TfrxDBDataset;
    frxProdutosConferenciaVisao_: TfrxDBDataset;
    qryVolumesDadosfiscaisConferenciatipo: TStringField;
    qryVolumesDadosfiscaisConferenciacodigo: TStringField;
    qryVolumesDadosfiscaisConferenciadadofiscal: TIntegerField;
    qryVolumesDadosfiscaisConferenciafilial: TIntegerField;
    qryVolumesDadosfiscaisConferenciaserie: TStringField;
    qryVolumesDadosfiscaisConferencianumero: TIntegerField;
    qryVolumesDadosfiscaisConferenciachv_nfe: TStringField;
    qryVolumesDadosfiscaisConferenciavolume: TIntegerField;
    qryVolumesDadosfiscaisConferenciaconferido: TBooleanField;
    qryVolumesDadosFiscais: TtecQuery;
    qryVolumesDadosFiscaiscodigo: TStringField;
    qryVolumesDadosFiscaisdadofiscal: TIntegerField;
    qryVolumesDadosFiscaisvolume: TIntegerField;
    gbxPesquisaNFe: TGroupBox;
    edtNFE: TMaskEdit;
    qryVolumesDadosFiscaisnrvolume: TIntegerField;
    qryVolumesDadosfiscaisConferencianrvolume: TIntegerField;
    qryVolumesDadosFiscaischv_nfe: TStringField;
    qryVolumesDadosFiscaischv_nfevolumes: TStringField;
    qryVolumesDadosfiscaisConferenciachv_nfevolumes: TStringField;
    qryVolumesDadosFiscaisfilial: TIntegerField;
    qryVolumesDadosFiscaisserie: TStringField;
    qryVolumesDadosFiscaisnumero: TIntegerField;
    qryVolumesDadosfiscaisConferenciavolumes: TStringField;
    qryVolumesDadosfiscaisConferencianumerovolume: TIntegerField;
    qryVolumesDadosFiscaisnumerovolume: TIntegerField;
    qryVolumesDadosfiscaisConferenciaconferidodigitado: TBooleanField;
    qryVolumesDadosfiscaisConferenciadatahora_inclusao: TDateTimeField;
    qryVolumesDadosfiscaisConferenciadatahora_alteracao: TDateTimeField;
    qryConferencialidos: TLargeintField;
    shNaoAtendidos: TShape;
    Label1: TLabel;
    qryAtualizarSituacaoRomaneio: TtecQuery;
    qryAtualizarSituacaoRomaneioatualizar_situacao_romaneio: TStringField;
    qryConferenciafilial: TIntegerField;
    qryVolumesDadosfiscaisConferenciausuario: TIntegerField;
    qryVolumesDadosfiscaisConferenciafilialregistro: TIntegerField;
    qryApagarRegistrosRPS: TtecQuery;
    procedure FormShow(Sender: TObject);
    procedure sbnReConferirClick(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbnSalvarClick(Sender: TObject);
    procedure dbgProdutosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure frxImpressaoConferenciaGetValue(const VarName: String;
      var Value: Variant);
    procedure edtNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryVolumesDadosfiscaisConferenciaCalcFields(
      DataSet: TDataSet);
    procedure dsrVolumesDadosfiscaisConferenciaDataChange(Sender: TObject;
      Field: TField);
    procedure qryVolumesDadosfiscaisConferenciaNewRecord(
      DataSet: TDataSet);
    procedure qryVolumesDadosfiscaisConferenciaBeforePost(
      DataSet: TDataSet);
    procedure edtNFEEnter(Sender: TObject);
    procedure edtNFEDblClick(Sender: TObject);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure qryConferenciaNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    EscParaVoltar : Boolean;
  protected
    dmbasico : TdtmBasico;


    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure LocalizarChaveNFe(TextodePesquisa: String);
    procedure ConferirVolumesDadosFiscais(RefazerDadosFiscais: boolean = false);

//    procedure PlaySound_;

  public
    { Public declarations }
    qryTabelaDadosFiscais: TtecQuery;
    NomeCampoRomaneio, NomeCampoDadoFiscal, Tipo, TipoRomaneio: String;
    CodigoDocumento: TStringList;
    LereGravar: Boolean;
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;
  end;

  procedure ConferirVolumesDadosFiscais(qryTabelaDadosFiscais: TtecQuery;
                             NomeCampoRomaneio, NomeCampoDadoFiscal, Tipo: String;
                             CodigoDocumento: TStringList;
                             TipoRomaneio: String;
                             LereGravar: boolean = false);  overload;



var
  frmConferenciaDocumentos: TfrmConferenciaDocumentos;

implementation

uses frconsulta;

{$R *.dfm}


constructor TfrmConferenciaDocumentos.Create(Aowner: Tcomponent);
begin
  inherited;
  dmbasico := TdtmBasico.Create(self);
//  edtNFE.on
end;

destructor TfrmConferenciaDocumentos.Destroy;
begin

  inherited;
end;

procedure TfrmConferenciaDocumentos.KeyDown(var Key: Word;
  Shift: TShiftState);
begin
  if {EscParaVoltar and} (key = VK_ESCAPE) THEN
    close
  ELSE
    case Key of
      VK_F5 : if sbnSalvar.enabled then
               sbnSalvarClick(self);

               {
      VK_F7 : if btnImprimir.enabled then
               btnImprimirClick(self);
               }

      else
      inherited;
    end;

end;

procedure TfrmConferenciaDocumentos.LocalizarChaveNFe(TextodePesquisa: String);
begin


    if TipoRomaneio = 'N' then
    begin

      if not qryVolumesDadosfiscaisConferencia.Locate('chv_nfe', TextodePesquisa, []) then
      begin
        biblio.PlaySound(self);

        MensagemAviso('O chave da NFe não está presente na lista', true)

      end
      else
      begin
        if qryVolumesDadosfiscaisConferenciaconferido.AsBoolean then
        begin
          biblio.PlaySound(self);

          MensagemAviso('O chave da NFe já foi conferida!', true)

        end
        else
        begin
          qryVolumesDadosfiscaisConferencia.Edit;
          qryVolumesDadosfiscaisConferenciaconferido.AsBoolean := true;
          qryVolumesDadosfiscaisConferenciaconferidodigitado.AsBoolean := false;
          qryVolumesDadosfiscaisConferencia.post;
          sbnsalvar.enabled := true;
        end;
      end;

    end
    else
    begin

      if not qryVolumesDadosfiscaisConferencia.Locate('chv_nfevolumes', TextodePesquisa, []) then
      begin
        biblio.PlaySound(self);

        MensagemAviso('O chave da NFe não está presente na lista', true)

      end
      else
      begin
        if qryVolumesDadosfiscaisConferenciaconferido.AsBoolean then
        begin
          biblio.PlaySound(self);

          MensagemAviso('O chave da NFe/Volumes já foi conferida!', true)

        end
        else
        begin
          qryVolumesDadosfiscaisConferencia.Edit;
          qryVolumesDadosfiscaisConferenciaconferido.AsBoolean := true;
          qryVolumesDadosfiscaisConferenciaconferidodigitado.AsBoolean := false;
          qryVolumesDadosfiscaisConferencia.post;
          sbnsalvar.enabled := true;
        end;

      end;

    end;

end;

procedure TfrmConferenciaDocumentos.ConferirVolumesDadosFiscais(RefazerDadosFiscais: boolean = false);
var
//  vRegistroAtual : TBookMark;
  vRegistroAtualVisao : TBookMark;
  i: integer;


begin
  with frmConferenciaDocumentos do
  begin
//    vRegistroAtual := qryTabelaDadosFiscais.getbookMark;
    vRegistroAtualVisao := qryVolumesDadosfiscaisConferencia.getbookMark;


    if not RefazerDadosFiscais then
    begin
      if tipo = 'ROP' then {Sempre que for incluido um ROP, no caso de uma anulação da saída RPS, deve-se apagar os dois, se existir o RPS}
      begin
        qryApagarRegistrosRPS.macroByname('codigo').asString := StringdaLista(CodigoDocumento, '''', ', ');
        qryApagarRegistrosRPS.execsql;
        dmbasico.Perpetrar([]);
      end;

      qryConferencia.ParamByname('tipo').AsString := Tipo;
      qryConferencia.macroByname('codigo').AsString := StringdaLista(CodigoDocumento, '''', ', ');
      qryConferencia.Close;
      qryConferencia.Open;

      for i:=0 to  CodigoDocumento.Count-1 do
      begin
        if not qryConferencia.Locate('codigo', CodigoDocumento[i], []) then
        begin
          qryConferencia.append;
          qryConferenciatipo.AsString := Tipo;
          qryConferenciacodigo.AsString := CodigoDocumento[i];
          qryConferenciadata.AsDateTime := now;
          qryConferenciausuario.AsInteger := dmbasico.CodigoUsuario;
          qryConferencia.post;
        end;
      end;

      qryVolumesDadosFiscais.macroByname('codigo').AsString := qryConferencia.macroByname('codigo').AsString;
      qryVolumesDadosfiscais.Close;
      qryVolumesDadosfiscais.Open;

      qryVolumesDadosfiscaisConferencia.ParamByname('tipo').AsString := Tipo;
      qryVolumesDadosfiscaisConferencia.macroByname('codigo').AsString := qryConferencia.macroByname('codigo').AsString;
      qryVolumesDadosfiscaisConferencia.Close;
      qryVolumesDadosfiscaisConferencia.Open;

      qryVolumesDadosfiscais.First;
      if (tipo = 'ROS') or
         (tipo = 'RPS') or
         (tipo = 'ROE') or
         (tipo = 'ROP') then
      begin

        while not qryVolumesDadosfiscais.eof do
        begin
          if not qryVolumesDadosfiscaisConferencia.Locate('tipo;codigo;dadofiscal;volume;nrvolume',
                 VarArrayOf([tipo,
                             qryVolumesDadosFiscaiscodigo.asinteger,
                             qryVolumesDadosFiscaisdadofiscal.asinteger,
                             qryVolumesDadosFiscaisvolume.asinteger,
                             qryVolumesDadosFiscaisnrvolume.asinteger]), []) then
          begin
            qryVolumesDadosfiscaisConferencia.append;
            qryVolumesDadosfiscaisConferenciatipo.asString        :=  tipo;
            qryVolumesDadosFiscaisConferenciacodigo.asinteger     :=  qryVolumesDadosFiscaiscodigo.asinteger;
            qryVolumesDadosFiscaisConferenciadadofiscal.asinteger :=  qryVolumesDadosFiscaisdadofiscal.asinteger;
            qryVolumesDadosfiscaisConferencianumerovolume.asinteger := qryVolumesDadosfiscaisnumerovolume.asinteger;
            qryVolumesDadosFiscaisConferenciavolume.asinteger     :=  qryVolumesDadosFiscaisvolume.asinteger;
            qryVolumesDadosFiscaisConferencianrvolume.asinteger   :=  qryVolumesDadosFiscaisnrvolume.asinteger;
            qryVolumesDadosfiscaisConferenciachv_nfe.asString := qryVolumesDadosfiscaischv_nfe.asString;
            qryVolumesDadosfiscaisConferenciachv_nfevolumes.asString := qryVolumesDadosfiscaischv_nfevolumes.asString;

            qryVolumesDadosfiscaisConferenciafilial.asString := qryVolumesDadosFiscaisfilial.asString;
            qryVolumesDadosfiscaisConferenciaserie.asString := qryVolumesDadosFiscaisserie.asString;
            qryVolumesDadosfiscaisConferencianumero.asinteger := qryVolumesDadosFiscaisnumero.asinteger;

            qryVolumesDadosfiscaisConferencia.Post;
          end;

          if LereGravar and (qrytabeladadosfiscais.name = 'qryRomaneiosNotasSaidas') and ((tipo = 'ROS') or (tipo ='RPS')) then
          begin

            if (qryVolumesDadosFiscaisConferenciadadofiscal.asInteger =
                qrytabeladadosfiscais.fieldbyname('dadofiscal').asInteger) and

               (qryVolumesDadosFiscaisConferenciacodigo.asinteger =
                qrytabeladadosfiscais.fieldbyname('romaneio').asInteger) and

               (qryVolumesDadosfiscaisConferencianumerovolume.asinteger =
                qrytabeladadosfiscais.fieldbyname('numerovolume').asInteger) and

               (qryVolumesDadosFiscaisConferencianrvolume.asinteger =
                qrytabeladadosfiscais.fieldbyname('nrvolume_').asInteger) then
            begin
              qryVolumesDadosfiscaisConferencia.Edit;
              qryVolumesDadosfiscaisConferenciaconferido.asBoolean := qrytabeladadosfiscais.fieldbyname('conferido').asBoolean;
              qryVolumesDadosfiscaisConferenciaconferidodigitado.Clear;
              qryVolumesDadosfiscaisConferencia.post;
            end;

          end;

          qryVolumesDadosfiscais.next;
        end;
      end;

      qryVolumesDadosfiscaisConferencia.First;
      if (tipo = 'ROS') or
         (tipo = 'RPS') or
         (tipo = 'ROE') or
         (tipo = 'ROP') then
      begin
        while not qryVolumesDadosfiscaisConferencia.eof do
        begin
          if not qryVolumesDadosfiscais.Locate('codigo;dadofiscal;volume;nrvolume',
                 VarArrayOf([qryVolumesDadosFiscaisConferenciacodigo.asinteger,
                             qryVolumesDadosFiscaisConferenciadadofiscal.asinteger,
                             qryVolumesDadosFiscaisConferenciavolume.asinteger,
                             qryVolumesDadosFiscaisConferencianrvolume.asinteger]), []) then
            qryVolumesDadosfiscaisConferencia.delete
          else
            qryVolumesDadosfiscaisConferencia.next;
        end;
      end;
    end;



    if RefazerDadosFiscais then
    begin
      qryVolumesDadosfiscaisConferencia.first;
      while not qryVolumesDadosfiscaisConferencia.eof do
      begin
        qryVolumesDadosfiscaisConferencia.Edit;
        qryVolumesDadosfiscaisConferenciaconferido.Clear;
        qryVolumesDadosfiscaisConferenciaconferidodigitado.Clear;

        qryVolumesDadosfiscaisConferencia.post;
        qryVolumesDadosfiscaisConferencia.next
      end;
    end;

    if qryVolumesDadosfiscaisConferencia.BookmarkValid(vRegistroAtualVisao) then
    begin
      qryVolumesDadosfiscaisConferencia.GotoBookmark(vRegistroAtualVisao);
      qryVolumesDadosfiscaisConferencia.FreeBookmark(vRegistroAtualVisao);
    end;

//    qryVolumesDadosfiscaisConferencia.EnableControls;
//    qryTabelaProdutos.GotoBookmark(vRegistroAtual);
//    qryTabelaProdutos.FreeBookmark(vRegistroAtual);

    sbnSalvar.Enabled := false;

    if TipoRomaneio = 'N' then
      edtNFE.EditMask := '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9;0;_'
    else
      edtNFE.EditMask := '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9\-999\-999;0;_';

    if not RefazerDadosFiscais and not LereGravar then
      ShowModal;

    if LereGravar then
      sbnSalvarClick(nil);  

  end;

end;


procedure ConferirVolumesDadosFiscais(qryTabelaDadosFiscais: TtecQuery;
                             NomeCampoRomaneio, NomeCampoDadoFiscal,
                             Tipo: String; CodigoDocumento: TStringList;
                             TipoRomaneio: String;
                             LereGravar: boolean);
begin

  if not assigned(frmConferenciaDocumentos) then
    frmConferenciaDocumentos := TfrmConferenciaDocumentos.Create(frmConferenciaDocumentos);

  frmConferenciaDocumentos.qryTabelaDadosFiscais := qryTabelaDadosFiscais;
  frmConferenciaDocumentos.NomeCampoRomaneio     := NomeCampoRomaneio;
  frmConferenciaDocumentos.NomeCampoDadoFiscal   := NomeCampoDadoFiscal;

  frmConferenciaDocumentos.Tipo                  := Tipo;
  frmConferenciaDocumentos.CodigoDocumento       := CodigoDocumento;
  frmConferenciaDocumentos.TipoRomaneio          := TipoRomaneio;
  frmConferenciaDocumentos.LereGravar := LereGravar; 

  frmConferenciaDocumentos.ConferirVolumesDadosFiscais;

//  frmConferenciaDocumentos.sbnsalvar.enabled := false;;

end;

procedure TfrmConferenciaDocumentos.FormShow(Sender: TObject);
begin
  inherited;
  edtNFE.SetFocus;
  edtNFE.SelectAll;
end;

procedure TfrmConferenciaDocumentos.sbnReConferirClick(Sender: TObject);
begin
  inherited;
  ConferirVolumesDadosFiscais(True);
end;

procedure TfrmConferenciaDocumentos.dbgProdutosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);

var
  imgVisualFormURL : timage;
  URLThumb, URLNomeFoto : String;
  x,y : integer;

begin
  inherited;
  (*
  if column.index = 7 then
  begin

    dmbasico.RefazConsultaPorNome(qryProcuraProdutos,['codigo','codigovisual'], [qryProdutosConferenciaproduto.asstring,'']);

    if (qryProcuraProdutosnomefoto.asString <> '') or (qryProcuraProdutosnomethumb.asString <> '') then
    begin

      URLThumb := 'http://' + parsistema.SiteEmpresa+'/fotos/'+qryProcuraProdutosnomethumb.asString;
      URLNomeFoto := 'http://'+ parsistema.SiteEmpresa+'/fotos/'+qryProcuraProdutosnomefoto.asString;

      try
        imgVisualFormURL := Timage.create(self);
        imgVisualFormURL.Proportional := true;
        imgVisualFormURL.Stretch := true;
//        DownloadImagem(URLNomeFoto, imgVisualFormURL, true);
        DownloadImagem(URLThumb, imgVisualFormURL, true);

        with TDBGrid(Sender) do
        begin
        {
          x := (Rect.Right - Rect.Left - imgVisualFormURL.Picture.Bitmap.Width) div 2 + Rect.Left;
          y := (Rect.Bottom - Rect.Top - imgVisualFormURL.Picture.Bitmap.Height) div 2 + Rect.Top;
          Canvas.Draw(x div 2 + Rect.Left,
          y, imgVisualFormURL.Picture.Bitmap);
         }
           Canvas.Draw(Rect.Left, Rect.Top, imgVisualFormURL.Picture.Bitmap);
        end;
      except
      end;

    end;
  end
  else

  begin
  *)

    if qryVolumesDadosfiscaisConferenciaconferido.AsBoolean then
    begin
      TDBGrid(Sender).Canvas.Font.Color := clGreen;
      TDBGrid(Sender).Canvas.Font.Style := [fsBold];
    end
    else
    begin
      TDBGrid(Sender).Canvas.Font.Color := clRed;
      TDBGrid(Sender).Canvas.Font.Style := [];
    end;

    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
//  end;

end;

procedure TfrmConferenciaDocumentos.sbnSalvarClick(Sender: TObject);
begin
  inherited;

  if tipo = 'ROE' then
  begin


    AtribuirDados(qryConferencia, [qryConferencia.fieldbyname('lidos')], [Null], true);
    AtribuirDados(qryTabelaDadosFiscais, [qryTabelaDadosFiscais.fieldbyname('lidos')], [Null], true);

    qryVolumesDadosfiscaisConferencia.first;
    while not qryVolumesDadosfiscaisConferencia.eof do
    begin

      if not qryConferencia.locate('codigo', qryVolumesDadosfiscaisConferenciacodigo.AsString, []) then
        qryConferencia.append
      else
        qryConferencia.Edit;


      qryConferenciatipo.AsString := qryVolumesDadosfiscaisConferenciatipo.asString;
      qryConferenciacodigo.AsString := qryVolumesDadosfiscaisConferenciacodigo.AsString;
      qryConferenciadata.AsDateTime := now;
      qryConferenciausuario.AsInteger := dmbasico.CodigoUsuario;

      if qryVolumesDadosfiscaisConferenciaconferido.asBoolean then
        qryConferencia.fieldbyname('lidos').asinteger := qryConferencia.fieldbyname('lidos').asinteger + 1;

      qryConferencia.post;

      if qryTabelaDadosFiscais.locate('romaneio;dadofiscal',
           VarArrayOf([qryVolumesDadosfiscaisConferenciacodigo.asstring,
                      qryVolumesDadosfiscaisConferenciadadofiscal.asinteger]), []) then
      begin
        qryTabelaDadosFiscais.edit;

        if qryVolumesDadosfiscaisConferenciaconferido.asBoolean then
          qryTabelaDadosFiscais.fieldbyname('lidos').asinteger := qryTabelaDadosFiscais.fieldbyname('lidos').asinteger + 1;

        if (qryTabelaDadosFiscais.fieldbyname('lidos').asinteger >=
           qryTabelaDadosFiscais.fieldbyname('volumes').asinteger) and
           (qryTabelaDadosFiscais.fieldbyname('lidos').asinteger <> 0) then
          qryTabelaDadosFiscais.fieldbyname('sit_romaneio_df_entr').asString := 'CONFIRMADA'
        else
        if (qryTabelaDadosFiscais.fieldbyname('lidos').asinteger <
            qryTabelaDadosFiscais.fieldbyname('volumes').asinteger) and
            (qryTabelaDadosFiscais.fieldbyname('lidos').asinteger <> 0) then
          qryTabelaDadosFiscais.fieldbyname('sit_romaneio_df_entr').asString := 'CONFIRMADA PARCIAL'
        else
          qryTabelaDadosFiscais.fieldbyname('sit_romaneio_df_entr').asString := 'NÃO CONFIRMADA';

        qryTabelaDadosFiscais.post;
      end;
      qryVolumesDadosfiscaisConferencia.next;
    end;

                 {

    CodigoDocumento.Delimiter := ',';
    qryRomaneios.macroByname('codigo').AsString := CodigoDocumento.DelimitedText;
    qryRomaneios.Close;
    qryRomaneios.Open;

    }

    qryConferencia.first;
    while not qryConferencia.eof do
    begin
      qryTabelaDadosFiscais.first;
      while not qryTabelaDadosFiscais.eof do
      begin
        if qryTabelaDadosFiscais.fieldbyname('romaneio').asinteger = qryConferenciacodigo.asinteger then
        begin
          qryTabelaDadosFiscais.edit;
          qryTabelaDadosFiscais.fieldbyname('selecionar').asBoolean := qryConferencialidos.asinteger >=
                               qryTabelaDadosFiscais.fieldbyname('aler').asinteger;


          if (qryConferencialidos.asinteger >=
             qryTabelaDadosFiscais.fieldbyname('aler').asinteger) and
             (qryConferencialidos.asinteger<>0) then
          begin
            qryTabelaDadosFiscais.fieldbyname('situacaoromaneioentrada').asString := 'CONFIRMADA';
            {
            if qryRomaneios.locate('numero', qryConferenciacodigo.asinteger, []) then
            begin
              qryRomaneios.edit;
              qryRomaneiossituacao_romaneio.asString := 'ENTREGUE';
              qryRomaneios.post;
            end;
            }
          end
          else
          if (qryConferencialidos.asinteger <
              qryTabelaDadosFiscais.fieldbyname('aler').asinteger) and
              (qryConferencialidos.asinteger <> 0) then
          begin
            qryTabelaDadosFiscais.fieldbyname('situacaoromaneioentrada').asString := 'CONFIRMADA PARCIAL';
            {
            if qryRomaneios.locate('numero', qryConferenciacodigo.asinteger, []) then
            begin
              qryRomaneios.edit;
              qryRomaneiossituacao_romaneio.asString := 'ENTREGUE PARCIAL';
              qryRomaneios.post;
            end;
            }
          end
          else
          begin
            qryTabelaDadosFiscais.fieldbyname('situacaoromaneioentrada').asString := 'NÃO CONFIRMADA';
            {
            if qryRomaneios.locate('numero', qryConferenciacodigo.asinteger, []) then
            begin
              qryRomaneios.edit;
              qryRomaneiossituacao_romaneio.asString := 'EM TRÂNSITO';
              qryRomaneios.post;
            end;
            }
          end;

          qryTabelaDadosFiscais.post;
        end;
        qryTabelaDadosFiscais.next;
      end;
      qryConferencia.next;
    end;

  end;

  dmbasico.Perpetrar([qryConferencia, qryVolumesDadosfiscaisConferencia]);

//  if (tipo = 'ROS') or (tipo = 'RPS') or  (tipo = 'ROP') then
  if (tipo = 'ROS') or (tipo = 'RPS') or  (tipo = 'ROP') or (tipo = 'ROE') then
  begin
    qryConferencia.first;
    while not  qryConferencia.eof do
    begin
      qryAtualizarSituacaoRomaneio.parambyname('romaneio').asinteger := qryConferenciacodigo.asinteger;
      qryAtualizarSituacaoRomaneio.execsql;
      dmbasico.perpetrar([]);
      qryConferencia.next;
    end;
  end;

  sbnSalvar.Enabled := false;

  if EscParaVoltar then
    close;
end;

procedure TfrmConferenciaDocumentos.dbgProdutosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = vk_return then
    if pnlDetalhes.visible then
    begin
//      edtQtdeLida.setfocus;
//      edtQtdeLida.selectall;
    end;
  {
  if key = vk_return then
  begin
    if dbgprodutos.SelectedField = qryProdutosConferencialido then
    begin
      if not (qryProdutosConferencia.state in [dsedit, dsinsert]) then
        qryProdutosConferencia.edit;

      if qryProdutosConferencialido.AsCurrency <> 0 then
        qryProdutosConferenciadigitado.AsBoolean := true
      else
        qryProdutosConferenciadigitado.AsBoolean := false;

      qryProdutosConferencia.post;
    end;
  end;
  }
end;


procedure TfrmConferenciaDocumentos.btnImprimirClick(Sender: TObject);
var
  PV: TfrxComponent;
begin
  inherited;
  (*
  qryIdentificacao.ParamByName('tipo').asString := tipo;
  qryIdentificacao.ParamByName('codigo').asString := CodigoDocumento;
  qryIdentificacao.close;
  qryIdentificacao.open;

  if FileExists(LogotipoFilialBase) then
  begin
    PV := frxImpressaoConferencia.FindObject('fpvLogo');
    if (PV is TfrxPictureView) then
      TfrxPictureView(PV).picture.LoadFromFile(LogotipoFilialBase);
  end;


//  frxImpressaoConferencia.DesignReport(true,false);
  frxImpressaoConferencia.ShowReport(true);
  *)

end;

procedure TfrmConferenciaDocumentos.frxImpressaoConferenciaGetValue(
  const VarName: String; var Value: Variant);
begin
  inherited;
  if VarName = 'MascaraQuantidade' then
    Value := ParSistema.MascaraQuantidadeGrade
  else if VarName = 'CordoZebrado' then
    Value :=  strtoint(parsistema.CorZebradoRelatorio)
  else if VarName = 'RAZAOFILIALBASE' then
    Value := fRazaoFilialBase
  else if VarName = 'ENDERECO_BAIRRO' then
    Value :=  fRuaFilialBase+ ' - '+fBairroFilialBase
  else if VarName = 'CEP_CIDADE_UF' then
    Value :=  FormatarCEP(fCEPFilialBase)+'  '+fCidadeFilialBase+ '  '+ fEstadoFilialBase;

end;

(*
procedure TfrmConferenciaDocumentos.PlaySound_;
  var
   vTempoInicial : DWORD;
//   vMediaPlayer : TMediaPlayer;
//   Controle: TWinControl;

begin
  if FileExists(ExtractFilePath(Application.ExeName) + 'alerta.mp3') then
  begin
//    Controle := TWinControl.Create(self);

//    vMediaPlayer := MPlayer.TMediaPlayer.Create(Application);
//    vMediaPlayer.Parent := Application.mainform;
//    vMediaPlayer.name := 'MPlay';
//    vMediaPlayer.left := 5;
//    vMediaPlayer.TOP := 5;

//    vMediaPlayer.AutoEnable := false;
//    vMediaPlayer.Parent := self;
//    vMediaPlayer.Hide;
//   vMediaPlayer.Wait := true;
//    vMediaPlayer.ParentWindow := 0;
//    vMediaPlayer.TimeFormat := tfHMS;
    vMediaPlayer.FileName := ExtractFilePath(Application.ExeName) + 'alerta.mp3';
//    vMediaPlayer.FileName := ExtractFilePath(Application.ExeName) + 'alert.wma';
    vMediaPlayer.open;
    vMediaPlayer.Play;
//    Sleep(240000);
//    vMediaPlayer.destroy;

//    vMediaPlayer.close;
             {
    MediaPlayer1.FileName := ExtractFilePath(Application.ExeName) + 'alert.wma';
    MediaPlayer1.Wait := false;
    MediaPlayer1.open;
    MediaPlayer1.Play;
    }

  end;



{
  MessageDlg('1', mtInformation, mbOKCancel, 0);
  SndPlaySound('C:\Windows\Media\notificar.wav',SND_ASYNC);


  MessageDlg('2', mtInformation, mbOKCancel, 0);
  MessageBeep(0);


  MessageDlg('3', mtInformation, mbOKCancel, 0);
  }
//  Application.ProcessMessages;
{
    MessageBeep(16);
    sleep(300);
    MessageBeep(64);
    sleep(300);
    MessageBeep(14);
    sleep(400);
    MessageBeep(16);
    }

    {
    sleep(500);
    MessageBeep(64);
    sleep(500);
    MessageBeep(64);
    sleep(500);
    MessageBeep(64);
    }


//    sndPlaySound('C:\Windows\Media\notificar.wav', SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);

    (*
    sleep(2000);
    sndPlaySound('C:\Windows\Media\notificar.wav', SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);
    sleep(2000);
    sndPlaySound(nil, 0); // Stops the sound
    sleep(2000);
    playsound(PChar('C:\Windows\Media\notificar.wav'), 0, SND_ASYNC);
    sleep(2000);
    playsound(nil, 0, SND_PURGE);
    sleep(2000);

          windows.Beep(1200, 500);
          windows.Beep(1200, 300);
          windows.Beep(1200, 900);




(*
  Application.ProcessMessages;
    MessageBeep(16);
    Application.ProcessMessages;
    MessageBeep(16);
    Application.ProcessMessages;
    MessageBeep(16);

//  MessageDlg('4', mtInformation, mbOKCancel, 0);

Application.ProcessMessages;
    MessageBeep(64);
    Application.ProcessMessages;
    MessageBeep(64);
    Application.ProcessMessages;
    MessageBeep(64);
    Application.ProcessMessages;
    MessageBeep(64);
    Application.ProcessMessages;
    MessageBeep(64);

{
  MessageDlg('5', mtInformation, mbOKCancel, 0);
}
Application.ProcessMessages;
    sndPlaySound('C:\Windows\Media\notificar.wav', SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);
  sndPlaySound(nil, 0); // Stops the sound

//  MessageDlg('6', mtInformation, mbOKCancel, 0);


Application.ProcessMessages;
  playsound(PChar('C:\Windows\Media\notificar.wav'), 0, SND_ASYNC);
  playsound(nil, 0, SND_PURGE);

  //sndPlaySound('C:\Windows\Media\sound.wav',
  // SND_NODEFAULT Or SND_ASYNC Or SND_LOOP);


Application.ProcessMessages;

{
          Windows.Beep(1200, 500);
          Windows.Beep(1200, 300);
          Windows.Beep(1200, 900);
          }


end;
*)

procedure TfrmConferenciaDocumentos.edtNFEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    try
      if edtNFE.Text<>''then
        LocalizarChaveNFe(edtNFE.Text);
    finally
      edtNFE.SetFocus;
      while ActiveControl.Name <> edtNFE.Name do
        edtNFE.SetFocus;

      SendMessage(edtNFE.Handle, EM_SETSEL, 0, 54 {length(edtNFE.Text)});
      edtNFE.SelectAll;

//      edtNFE.EditMask :=  '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9\-999\-999;0;_';
    end
  end;

end;

procedure TfrmConferenciaDocumentos.qryVolumesDadosfiscaisConferenciaCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  qryVolumesDadosfiscaisConferenciavolumes.asString :=
   qryVolumesDadosfiscaisConferencianrvolume.asString + '\' +
   qryVolumesDadosfiscaisConferenciavolume.asString;
end;

procedure TfrmConferenciaDocumentos.dsrVolumesDadosfiscaisConferenciaDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if field = qryVolumesDadosfiscaisConferenciaconferido then
  begin
    qryVolumesDadosfiscaisConferenciaconferidodigitado.AsBoolean := field.asBoolean;
    sbnSalvar.Enabled := true;
  end;
end;

procedure TfrmConferenciaDocumentos.qryVolumesDadosfiscaisConferenciaNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryVolumesDadosfiscaisConferenciadatahora_inclusao.asDatetime := now();
  qryVolumesDadosfiscaisConferenciausuario.asinteger := dmbasico.CodigoUsuario;
  qryVolumesDadosfiscaisConferenciafilialregistro.asinteger := filialbase;
end;

procedure TfrmConferenciaDocumentos.qryVolumesDadosfiscaisConferenciaBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  qryVolumesDadosfiscaisConferenciadatahora_alteracao.asDatetime := now();
end;

procedure TfrmConferenciaDocumentos.edtNFEEnter(Sender: TObject);
begin
  inherited;
  edtNFE.SelectAll;
//  edtNFE.EditMask :=  '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9\-999\-999;0;_'

end;

procedure TfrmConferenciaDocumentos.edtNFEDblClick(Sender: TObject);
begin
  inherited;
//  edtNFE.EditMask :=  '99\-9999\-99999999999999\-99\-999\-999999999\-9\-99999999\-9\-999\-999;0;_';
  edtNFE.SelectAll;

end;

procedure TfrmConferenciaDocumentos.FormContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  inherited;

  if ActiveControl.Name = 'edtNFE' then
    Handled := True;


end;

procedure TfrmConferenciaDocumentos.qryConferenciaNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qryConferenciafilial.asinteger := filialbase;
end;

end.



