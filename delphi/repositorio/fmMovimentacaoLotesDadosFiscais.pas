unit fmMovimentacaoLotesDadosFiscais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cpdatasource, ZQuery, ZPgSqlQuery, cpquery, ExtCtrls, Grids,
  AdvObj, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, Buttons, Mask, DBCtrls,
  cpdbtext, biblio, dmtecsoft;

type
  TfrmMovimentacaoLotesDadosFiscais = class(TForm)
    DBAdvGridMovimentosRomaneioDadoFiscal: TDBAdvGrid;
    pnlBottom: TPanel;
    qryMovimentosRomaneioDadoFiscal: TtecQuery;
    dsrMovimentosRomaneioDadoFiscal: TtecDataSource;
    qryMovimentosRomaneioDadoFiscalfilial: TIntegerField;
    qryMovimentosRomaneioDadoFiscalserie: TStringField;
    qryMovimentosRomaneioDadoFiscalnumero: TIntegerField;
    qryMovimentosRomaneioDadoFiscalchv_nfe: TStringField;
    qryMovimentosRomaneioDadoFiscalvolume: TIntegerField;
    qryMovimentosRomaneioDadoFiscalconferido: TBooleanField;
    qryMovimentosRomaneioDadoFiscalusuario: TIntegerField;
    qryMovimentosRomaneioDadoFiscalnomeusuario: TStringField;
    qryMovimentosRomaneioDadoFiscalfilialregistro: TIntegerField;
    qryMovimentosRomaneioDadoFiscalnomefilial: TStringField;
    qryMovimentosRomaneioDadoFiscaldatahora_alteracao: TDateTimeField;
    pnlTop: TPanel;
    lblfilial: TStaticText;
    lblSerie: TStaticText;
    lblNumero: TStaticText;
    lblnfe: TStaticText;
    tecDBTextFilial: TtecDBText;
    tecDBTextSerie: TtecDBText;
    tecDBTextnumero: TtecDBText;
    tecDBTextchv_nfe: TtecDBText;
    bbnOK: TBitBtn;
    qryMovimentosRomaneioDadoFiscaldescricaotipo: TStringField;
    qryMovimentosRomaneioDadoFiscalvolumes: TStringField;
    qryMovimentosRomaneioDadoFiscalnrvolume: TIntegerField;
    procedure qryMovimentosRomaneioDadoFiscalCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MensagemMovimentacaoLotesDadosFiscais(
         AOwner: TComponent;
         Romaneio, dadofiscal: String
       ): TModalResult;


var
  frmMovimentacaoLotesDadosFiscais: TfrmMovimentacaoLotesDadosFiscais;

implementation

{$R *.dfm}

function MensagemMovimentacaoLotesDadosFiscais(
         AOwner: TComponent;
         Romaneio, dadofiscal: String): TModalResult;
begin
  frmMovimentacaoLotesDadosFiscais := TfrmMovimentacaoLotesDadosFiscais.create(AOwner);

  with frmMovimentacaoLotesDadosFiscais do
  begin

    RefazConsultaPorNome(qryMovimentosRomaneioDadoFiscal,['romaneio', 'dadofiscal'],
                          [Romaneio,
                           Dadofiscal]);

    showmodal;
    result := modalresult;
    free;
  end;

end;


procedure TfrmMovimentacaoLotesDadosFiscais.qryMovimentosRomaneioDadoFiscalCalcFields(
  DataSet: TDataSet);
begin
  qryMovimentosRomaneioDadoFiscalvolumes.asString :=

   qryMovimentosRomaneioDadoFiscalnrvolume.asString + '\' +
   qryMovimentosRomaneioDadoFiscalvolume.asString;


end;

end.
