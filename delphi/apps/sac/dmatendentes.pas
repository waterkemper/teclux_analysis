unit dmatendentes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmbasico,dmtecsoft, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery,
  ctconstantes;

type
  TdtmAtendentes = class(TdtmBasico)
    qryUsuarios: TtecQuery;
    dsrUsuarios: TtecDataSource;
    dsrFiltrosSac: TtecDataSource;
    qryFiltrosSac: TtecQuery;
    dsrShadow: TtecDataSource;
    qryShadow: TtecQuery;
    qryFiltrosSacdescricao: TStringField;
    qryFiltrosSacnumero: TIntegerField;
    qryShadowusename: TStringField;
    qryShadowusesysid: TIntegerField;
    qryUsuarioscodigo: TIntegerField;
    qryUsuariosnome: TStringField;
    qryUsuariosoperador: TStringField;
    qryUsuariosinativo: TDateField;
    qryUsuariosfiltrosac: TIntegerField;
    qryUsuariosligacao: TIntegerField;
    qryUsuariosshadow: TIntegerField;
    procedure qryUsuariosAfterPost(DataSet: TDataSet);
  protected
    { Private declarations }
    function GetCodigoShadow    : integer;
    function GetCodigoFiltrosac : integer;
    function GetConsultaFiltroSac : TtecQuery;
    function GetConsultaShadow    : TtecQuery;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    procedure AtualizaFiltroSac(FiltroSac:integer);
    procedure AtualizaShadow(Shadow:integer);
    function  ExisteFiltroSac(campo, codigo: string): boolean;
    function  ExisteShadow(campo, codigo: string): boolean;
    property  CodigoFiltroSac    : integer  read GetCodigoFiltroSac;
    property  CodigoShadow       : integer  read GetCodigoShadow;
    property  ConsultaFiltroSac  : TtecQuery read GetConsultaFiltroSac;
    property  ConsultaShadow     : TtecQuery read GetConsultaShadow;
  end;

{var
  dtmAtendentes: TdtmAtendentes;}

implementation

{$R *.dfm}

{ TdtmAtendentes }

procedure TdtmAtendentes.AtualizaFiltroSac(FiltroSac: integer);
begin
  if not (qryUsuarios.State in [dsEdit,dsInsert]) then
     qryUsuarios.Edit;
  qryUsuariosfiltrosac.AsInteger:=FiltroSac;
  qryUsuarios.Post;
//  Perpetrar([qryUsuarios]);
end;

procedure TdtmAtendentes.AtualizaShadow(Shadow: integer);
begin
  if not (qryUsuarios.State in [dsEdit,dsInsert]) then
     qryUsuarios.Edit;
  qryUsuariosshadow.AsInteger:=Shadow;
  qryUsuarios.Post;
//  Perpetrar([qryUsuarios]);
end;

constructor TdtmAtendentes.Create(AOwner: TComponent);
begin
  inherited;
  qryUsuarios.Tag             := ctAtendentes;
  qryFiltrosSac.Tag           := ctAtendentesConsulta;
  qryShadow.Tag               := ctAtendentesConsulta;
end;

function TdtmAtendentes.ExisteFiltroSac(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryFiltrosSac, campo, codigo);
end;

function TdtmAtendentes.ExisteShadow(campo, codigo: string): boolean;
begin
  Result := ExisteCodigo(qryShadow, campo, codigo);
end;

function TdtmAtendentes.GetCodigoFiltrosac: integer;
begin
  Result := qryFiltrosSacnumero.AsInteger
end;

function TdtmAtendentes.GetCodigoShadow: integer;
begin
  Result := qryShadowusesysid.AsInteger
end;

function TdtmAtendentes.GetConsultaFiltroSac: TtecQuery;
begin
  Result := qryFiltrosSac;
end;

function TdtmAtendentes.GetConsultaShadow: TtecQuery;
begin
  Result := qryShadow;
end;

procedure TdtmAtendentes.qryUsuariosAfterPost(DataSet: TDataSet);
begin
  inherited;
  Perpetrar([qryUsuarios]);
end;

end.
