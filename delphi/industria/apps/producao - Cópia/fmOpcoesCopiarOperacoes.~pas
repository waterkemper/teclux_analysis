unit fmOpcoesCopiarOperacoes;

interface

uses
  SysUtils, Types, Classes, Variants, Graphics, Controls, Forms, Dialogs,
  dmcadastroosp, fmnavcontroles, Grids, DBGrids, cpdbgrid,
  StdCtrls, cpnumero, Buttons, DB, cpdatasource, fmcadastropadrao,
  ComCtrls, ExtCtrls, zquery, Windows, Mask, cpdbfindcontrols, frconsulta,
  frconsultacodigo, ctconstantes;

type
  TfrmOpcoesCopiarOperacoes = class(TfrmNavControles)
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    gbxOpcoesCopiarOperacoes: TGroupBox;
    ckbMaquinas: TCheckBox;
    ckbDescricaoSetup: TCheckBox;
    ckbControldeProcesso: TCheckBox;
    ckbFalhasAssociadas: TCheckBox;
    gbxCopiarProcessos: TGroupBox;
    gbxCopiarOperacoes: TGroupBox;
    fraConsultaOperacoes: TfraConsultaCodigo;
    gbxCopiaC1: TGroupBox;
    edfCopiaC1: TtecDBFindLookup;
    gbxCopiaC2: TGroupBox;
    edfCopiaC2: TtecDBFindLookup;
    gbxCopiaC3: TGroupBox;
    edfCopiaC3: TtecDBFindLookup;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent);

    destructor  Destroy; override;

  end;

var
  frmOpcoesCopiarOperacoes: TfrmOpcoesCopiarOperacoes;

implementation

{$R *.dfm}

{ TfrmOpcoesCopiarOperacoes }

{ TfrmOpcoesCopiarOperacoes }


{ TfrmOpcoesCopiarOperacoes }

constructor TfrmOpcoesCopiarOperacoes.Create(AOwner: TComponent);
begin
  Inherited Create(AOwner);
  fraConsultaOperacoes.TipoPesquisa := pesOPERACOES;


  fraConsultaOperacoes.edfCodigo.readonly := true;
  edfCopiaC1.readonly := true;
  edfCopiaC2.readonly := true;
  edfCopiaC3.readonly := true;
  fraConsultaOperacoes.AbrirPesquisaQuandoReadOnly := true;


end;


destructor TfrmOpcoesCopiarOperacoes.Destroy;
begin
  inherited;
  frmOpcoesCopiarOperacoes := nil;
end;

end.
