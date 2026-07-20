unit frconsultadadosclientecod;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  frconsultadadoscliente, DBCtrls, cpdbtext, StdCtrls, cpdbmemo, Grids,
  DBGrids, cpdbgrid, ExtCtrls, frendereco, ComCtrls, cppagecontrol,
  Mask, cpcpfcnpj, DB, cpdatasource, Buttons, cpnumero, cpfone, cptexto;

type
  TfraConsultaDadosClienteCod = class(TfraConsultaDadosCliente)
    lblCodigoCliente: TLabel;
    lblNomeCliente: TLabel;
    dtxCodigoCliente: TtecDBText;
    dtxNomeCliente: TtecDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fraConsultaDadosClienteCod: TfraConsultaDadosClienteCod;

implementation

{$R *.dfm}

end.
