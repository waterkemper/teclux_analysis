unit fratendimentosdocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, DB, ZQuery, ZPgSqlQuery, cpquery, cpdatasource, StdCtrls,
  DBCtrls, cpdbmemo, Mask, cpdbtext, Grids, DBGrids, cpdbgrid, dmtecsoft, frConsulta, frConsultaCodigo,
  ctconstantes, cpdbfindcontrols, Buttons, ExtCtrls, biblio, ComCtrls,
  ActnList;

type
  Tfraatendimentosdocumentos = class(TFrame)
    Splitter1: TSplitter;
    dsrOcorrencias: TtecDataSource;
    qryocorrencias: TtecQuery;
    qryocorrenciasorigem: TIntegerField;
    qryocorrenciascodigo: TIntegerField;
    qryocorrenciasdata: TDateField;
    qryocorrenciaslembrar: TDateField;
    qryocorrenciastipo: TStringField;
    qryocorrenciasassunto: TStringField;
    qryocorrenciasusuario: TIntegerField;
    qryocorrenciasnomeusuario: TStringField;
    qryocorrenciasdatainclusao: TDateTimeField;
    qryocorrenciasdescricaotipo: TStringField;
    qryocorrenciaslembrarhora: TTimeField;
    qryocorrenciasstatus: TStringField;
    qryocorrenciasinformes: TMemoField;
    lbxExibirInformes: TRichEdit;
    procedure FrameConstrainedResize(Sender: TObject; var MinWidth,
      MinHeight, MaxWidth, MaxHeight: Integer);
    procedure FrameEnter(Sender: TObject);
  private
    { Private declarations }
    FDocumento: TTecStringRetorno;
    fTtecProcedure: TtecProcedure;
    FTipoDocumento: TTecStringRetorno;
  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor  Destroy; override;

    property Documento: TTecStringRetorno read FDocumento write FDocumento;
    property TipoDocumento: TTecStringRetorno read FTipoDocumento write FTipoDocumento;

    function GetTabelaContatos: TZDataSet;
    property TabelaContatos: TZDataSet read GetTabelaContatos;
    property EditarFormulario: TtecProcedure read fTtecProcedure write fTtecProcedure;
    procedure AbrirTabelaAtendimentosDocumentos(Reabrir : boolean = false);

  end;

implementation

{$R *.dfm}

{ TFrame1 }



constructor Tfraatendimentosdocumentos.Create(Aowner: Tcomponent);
begin
  inherited;
end;

destructor Tfraatendimentosdocumentos.Destroy;
begin

  inherited;
end;

procedure Tfraatendimentosdocumentos.AbrirTabelaAtendimentosDocumentos(Reabrir: boolean);
begin
  if assigned(documento) and assigned(TipoDocumento) then
  begin
    if (tipodocumento <> '') AND (documento <> '') then  {orçamento}
    begin

      if tipodocumento = '2' then
      begin
        if (qryocorrencias.parambyname('orcamento').asString <> documento) or
           Reabrir then
        begin
          qryocorrencias.parambyname('orcamento').asString := Documento;
          qryocorrencias.parambyname('tipoatendimento').asInteger := 2;
          qryocorrencias.close;
          qryocorrencias.open;

          MontarInformesAtendimentos(lbxExibirInformes, qryocorrencias);

        end;
      end
      else
      if tipodocumento = '1' then
      begin
        if (qryocorrencias.parambyname('contrato').asString <> documento) or
           Reabrir then
        begin
          qryocorrencias.parambyname('contrato').asString := Documento;
          qryocorrencias.parambyname('tipoatendimento').asInteger := 1;
          qryocorrencias.close;
          qryocorrencias.open;

          MontarInformesAtendimentos(lbxExibirInformes, qryocorrencias);

        end;
      end

    end;

  end;
end;

function Tfraatendimentosdocumentos.GetTabelaContatos: TZDataSet;
begin
  result := qryocorrencias;
end;

procedure Tfraatendimentosdocumentos.FrameConstrainedResize(Sender: TObject;
  var MinWidth, MinHeight, MaxWidth, MaxHeight: Integer);
begin
  AbrirTabelaAtendimentosDocumentos;
end;

procedure Tfraatendimentosdocumentos.FrameEnter(Sender: TObject);
begin
  AbrirTabelaAtendimentosDocumentos;
end;

end.
