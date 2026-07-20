unit fmselecionarformapagamentotefdiscado;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, Grids,
  //biblio
  ctconstantes,
  //Repositorio
  fmnavcontroles,
  //Componentes
  cpnumero, cppagecontrol;

type
  TfrmSelecionarFormaPagamentoTEFDiscado = class(TfrmNavControles)
    pgcFormaPag: TtecPageControl;
    tstDebito: TTabSheet;
    tstCredito: TTabSheet;
    dbgDebito: TStringGrid;
    lblTotalSelecionadoDeb: TLabel;
    edtTotalSelecionadoDeb: TEditNumero;
    edtTotalSelecionadoCred: TEditNumero;
    lblTotalSelecionadoCred: TLabel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    dbgCredito: TStringGrid;
    tstDinheiro: TTabSheet;
    lblValorDisponivelCartoes: TLabel;
    lblPagamentoDinheiro: TLabel;
    edtPagamentoDinheiro: TEditNumero;
    edtValorDisponivelCartoes: TEditNumero;
    edtPrestacaoDinheiro: TEditNumero;
    lblPrestacaoDinheiro: TLabel;
    pnlDin: TPanel;
    tstCDC: TTabSheet;
    dbgCDC: TStringGrid;
    lblTotalSelecionadoCDC: TLabel;
    edtTotalSelecionadoCDC: TEditNumero;
    procedure bbnOKClick(Sender: TObject);
    procedure edtTotalSelecionadoDebChange(Sender: TObject);
    procedure edtTotalSelecionadoCredChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgcFormaPagChange(Sender: TObject);
    procedure edtPagamentoDinheiroChange(Sender: TObject);
    procedure pgcFormaPagChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure edtTotalSelecionadoCDCChange(Sender: TObject);
  private
    FFormaPagamento: Integer;
    CredParcelas,
    DebParcelas,
    CDCParcelas: array of TtecParcelasTEF;
    FPrestacaoDinheiro,
    FValorPagarDinheiro,
    FCreditoValorPagar,
    FCreditoValorPagarOriginal,
    FValorDisponivelCartao,
    FDeditoValorPagar,
    FDeditoValorPagarOriginal,
    FCDCValorPagar,
    FCDCValorPagarOriginal: Currency;
    FUltimoCartao: Boolean;
    function  getCreditoQtdadeParcelas: Integer;
    function  getCreditoValorPagar: Currency;
    function  getDebitoQtdadeParcelas: Integer;
    function  getDeditoValorPagar: Currency;
    function getCDCQtdadeParcelas: Integer;
    function getCDCValorPagar: Currency;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure CreditoParcelasPagar(var Parcelas: array of integer);
    procedure DebitoParcelasPagar(var Parcelas: array of integer);
    procedure CDCParcelasPagar(var Parcelas: array of integer);
    procedure Parcelas(Parcelas: array of TtecParcelasTEF; ValorDinheiro: Currency; QtdadeCartoes: Integer);
    property CreditoQtdadeParcelas: Integer read getCreditoQtdadeParcelas;
    property CreditoValorPagar: Currency read getCreditoValorPagar;
    property ValorPagarDinheiro: Currency read FValorPagarDinheiro;
    property DebitoQtdadeParcelas: Integer read getDebitoQtdadeParcelas;
    property DeditoValorPagar: Currency read getDeditoValorPagar;
    property CDCQtdadeParcelas: Integer read getCDCQtdadeParcelas;
    property CDCValorPagar: Currency read getCDCValorPagar;
    property FormaPagamento: Integer read FFormaPagamento;
    property UltimoCartao: Boolean read FUltimoCartao write FUltimoCartao;
  end;

var
  frmSelecionarFormaPagamentoTEFDiscado : TfrmSelecionarFormaPagamentoTEFDiscado;


implementation

Uses
  biblio,
  fmajuda;

{$R *.dfm}

procedure TfrmSelecionarFormaPagamentoTEFDiscado.bbnOKClick(Sender: TObject);
var
  Valor, ValorMaximo: Real;
  Edit: TEditNumero;
begin
  inherited;
  Edit  := nil;
  if FFormaPagamento < 4 then begin
     Valor       := 0;
     ValorMaximo := 0;
    if FFormaPagamento = 1 then begin
      try
        Valor       := StrToFloat(edtTotalSelecionadoCred.ValorSemFormatacao);
        ValorMaximo := FCreditoValorPagarOriginal;
        Edit        := edtTotalSelecionadoCred;
      except
        Valor := 0
      end;
    end else if FFormaPagamento = 2 then begin
      try
        Valor       := StrToFloat(edtTotalSelecionadoDeb.ValorSemFormatacao);
        ValorMaximo := FDeditoValorPagarOriginal;
        Edit        := edtTotalSelecionadoDeb;
      except
        Valor := 0
      end;
    end else if FFormaPagamento = 3 then
    begin
      try
        Valor       := StrToFloat(edtTotalSelecionadoCDC.ValorSemFormatacao);
        ValorMaximo := FCDCValorPagarOriginal;
        Edit        := edtTotalSelecionadoCDC;
      except
        Valor := 0
      end;
    end;
    if Valor = 0 then
      MensagemAviso('O Valor da transação não pode ser zero.')
    else if Valor <= ValorMaximo then
      if FUltimoCartao then
        if Valor = ValorMaximo then
          ModalResult := mrok
        else
          MensagemAviso('Último cartão! O Valor tem que ser igual ao saldo restante.')
      else
        ModalResult := mrok
    else begin
      MensagemAviso('O Valor da transação excede o saldo restante.');
      Edit.SetFocus
    end
  end else begin
    if FValorPagarDinheiro > FValorDisponivelCartao then begin
      MensagemAviso('O Pagamento em dinheiro excede o valor total dos cartões.');
      edtPagamentoDinheiro.SetFocus
    end else
      ModalResult := mrok
  end;
end;

constructor TfrmSelecionarFormaPagamentoTEFDiscado.Create(AOwner: TComponent);
begin
  inherited;
  dbgDebito.ColWidths[0]  := 60;
  dbgDebito.ColWidths[1]  := 100;
  dbgDebito.Cells[0,0]    := 'Parcelas';
  dbgDebito.Cells[1,0]    := 'Valores';
  dbgCredito.ColWidths[0] := dbgDebito.ColWidths[0];
  dbgCredito.ColWidths[1] := dbgDebito.ColWidths[1];
  dbgCredito.Cells[0,0]   := dbgDebito.Cells[0,0];
  dbgCredito.Cells[1,0]   := dbgDebito.Cells[1,0];
  dbgCDC.ColWidths[0]     := dbgDebito.ColWidths[0];
  dbgCDC.ColWidths[1]     := dbgDebito.ColWidths[1];
  dbgCDC.Cells[0,0]       := dbgDebito.Cells[0,0];
  dbgCDC.Cells[1,0]       := dbgDebito.Cells[1,0];
  FFormaPagamento         := 1;
  Sleep(500);
end;

destructor TfrmSelecionarFormaPagamentoTEFDiscado.Destroy;
begin
  inherited;
  frmSelecionarFormaPagamentoTEFDiscado := nil;
end;


procedure TfrmSelecionarFormaPagamentoTEFDiscado.CreditoParcelasPagar(var Parcelas: array of integer);
var
  a: Integer;
begin
  if High(CredParcelas) > -1 then
    for a := 0 to High(CredParcelas) do
      Parcelas[a] := CredParcelas[a].Numero;
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.DebitoParcelasPagar(var Parcelas: array of integer);
var
  a: Integer;
begin
  if High(DebParcelas) > -1 then
    for a := 0 to High(DebParcelas) do
      Parcelas[a] := DebParcelas[a].Numero;
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.edtPagamentoDinheiroChange(Sender: TObject);
begin
  inherited;
  try
    FValorPagarDinheiro := StrToFloat(edtPagamentoDinheiro.ValorSemFormatacao)
  except
    FValorPagarDinheiro := 0;
  end;
  bbnOK.Enabled := (FValorPagarDinheiro > 0)
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.edtTotalSelecionadoCredChange(Sender: TObject);
begin
  inherited;
  try
    FCreditoValorPagar := StrToFloat(edtTotalSelecionadoCred.ValorSemFormatacao)
  except
    FCreditoValorPagar := 0
  end
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.edtTotalSelecionadoDebChange(Sender: TObject);
begin
  inherited;
  try
    FDeditoValorPagar := StrToFloat(edtTotalSelecionadoDeb.ValorSemFormatacao)
  except
    FDeditoValorPagar := 0;
  end
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.FormShow(Sender: TObject);
begin
  Sleep(500);
  inherited;
  if High(CredParcelas) > -1 then
    edtTotalSelecionadoCred.SetFocus
  else if High(DebParcelas) > -1 then begin
    pgcFormaPag.ActivePage := tstDebito;
    edtTotalSelecionadoDeb.SetFocus;
  end else if High(CDCParcelas) > -1 then begin
    pgcFormaPag.ActivePage := tstCDC;
    edtTotalSelecionadoCDC.SetFocus;
  end else
    bbnOK.Enabled := False
end;

function TfrmSelecionarFormaPagamentoTEFDiscado.getCreditoQtdadeParcelas: Integer;
begin
  if High(CredParcelas) = -1 then
    Result := 0
  else
    Result := High(CredParcelas) + 1
end;

function TfrmSelecionarFormaPagamentoTEFDiscado.getCreditoValorPagar: Currency;
begin
  Result := FCreditoValorPagar
end;

function TfrmSelecionarFormaPagamentoTEFDiscado.getDebitoQtdadeParcelas: Integer;
begin
  if High(DebParcelas) = -1 then
    Result := 0
  else
    Result := High(DebParcelas) + 1;
end;

function TfrmSelecionarFormaPagamentoTEFDiscado.getDeditoValorPagar: Currency;
begin
  Result := FDeditoValorPagar
end;
   
procedure TfrmSelecionarFormaPagamentoTEFDiscado.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if TeclaEnterOuReturn(Key) and (Shift = []) and bbnOK.Enabled then
    bbnOKClick(bbnOK);
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.Parcelas(Parcelas: array of TtecParcelasTEF; ValorDinheiro: Currency; QtdadeCartoes: Integer);
var
  a, ContCred, ContDeb, ContCDC: Integer;
begin
  ContCred           := 1;
  ContDeb            := 1;
  ContCDC            := 1;
  FCreditoValorPagar := 0;
  FDeditoValorPagar  := 0;
  FCDCValorPagar     := 0;
  if High(Parcelas) > -1 then
    for a := 0 to High(Parcelas) do begin
      if Parcelas[a].FormaPagto = 'C' then begin
        dbgCredito.RowCount           := ContCred + 1;
        dbgCredito.Cells[0, ContCred] := IntToStr(Parcelas[a].Numero);
        dbgCredito.Cells[1, ContCred] := FloatToStrF(Parcelas[a].Valor, ffCurrency, 15,2);
        SetLength(CredParcelas, ContCred);
        CredParcelas[ContCred - 1].Numero := Parcelas[a].Numero;
        CredParcelas[ContCred - 1].Valor  := Parcelas[a].Valor;
        FCreditoValorPagar                := FCreditoValorPagar + Parcelas[a].Valor;
        Inc(ContCred);
      end else if Parcelas[a].FormaPagto = 'B' then begin
        dbgDebito.RowCount          := ContDeb + 1;
        dbgDebito.Cells[0, ContDeb] := IntToStr(Parcelas[a].Numero);
        dbgDebito.Cells[1, ContDeb] := FloatToStrF(Parcelas[a].Valor, ffCurrency, 15,2);
        SetLength(DebParcelas, ContDeb);
        DebParcelas[ContDeb - 1].Numero := Parcelas[a].Numero;
        DebParcelas[ContDeb - 1].Valor  := Parcelas[a].Valor;
        FDeditoValorPagar               := FDeditoValorPagar + Parcelas[a].Valor;
        Inc(ContDeb);
      end else
      begin
        dbgCDC.RowCount          := ContCDC + 1;
        dbgCDC.Cells[0, ContCDC] := IntToStr(Parcelas[a].Numero);
        dbgCDC.Cells[1, ContCDC] := FloatToStrF(Parcelas[a].Valor, ffCurrency, 15,2);
        SetLength(CDCParcelas, ContCDC);
        CDCParcelas[ContCDC - 1].Numero := Parcelas[a].Numero;
        CDCParcelas[ContCDC - 1].Valor  := Parcelas[a].Valor;
        FCDCValorPagar                  := FCDCValorPagar + Parcelas[a].Valor;
        Inc(ContCDC);
      end;
    end;
  FCreditoValorPagarOriginal       := FCreditoValorPagar;
  FDeditoValorPagarOriginal        := FDeditoValorPagar;
  FCDCValorPagarOriginal           := FCDCValorPagar;
  FValorDisponivelCartao           := FCreditoValorPagar + FDeditoValorPagar + FCDCValorPagar;
  edtTotalSelecionadoCred.OnChange := nil;
  edtTotalSelecionadoCred.Text     := FloatToStrF(FCreditoValorPagar, ffCurrency, 15, 2);
  edtTotalSelecionadoCred.OnChange := edtTotalSelecionadoCredChange;
  dbgDebito.Enabled                := High(DebParcelas) > 0;
  edtTotalSelecionadoDeb.OnChange  := nil;
  edtTotalSelecionadoDeb.Text      := FloatToStrF(FDeditoValorPagar, ffCurrency, 15, 2);
  edtTotalSelecionadoDeb.OnChange  := edtTotalSelecionadoDebChange;
  dbgCDC.Enabled                   := High(CDCParcelas) > 0;
  edtTotalSelecionadoCDC.OnChange  := nil;
  edtTotalSelecionadoCDC.Text      := FloatToStrF(FCDCValorPagar, ffCurrency, 15, 2);
  edtTotalSelecionadoCDC.OnChange  := edtTotalSelecionadoCDCChange;
  edtPagamentoDinheiro.Enabled     := (FCreditoValorPagar > 0) or (FDeditoValorPagar > 0);
  FPrestacaoDinheiro               := ValorDinheiro;
  tstDinheiro.TabVisible           := (ValorDinheiro = 0) and (QtdadeCartoes = 0);
  edtPrestacaoDinheiro.Text        := FloatToStrF(FPrestacaoDinheiro, ffCurrency, 15, 2);
  edtValorDisponivelCartoes.Text   := FloatToStrF(FValorDisponivelCartao, ffCurrency, 15, 2);
  bbnOK.Enabled                    := FCreditoValorPagar > 0;
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.pgcFormaPagChange(Sender: TObject);
begin
  inherited;
  FFormaPagamento := pgcFormaPag.ActivePageIndex + 1;
  if FFormaPagamento = 1 then
    bbnOK.Enabled := FCreditoValorPagar > 0
  else if FFormaPagamento = 2 then
    bbnOK.Enabled := FDeditoValorPagar > 0
  else if FFormaPagamento = 3 then
    bbnOK.Enabled := FCDCValorPagar > 0
  else if FFormaPagamento = 4 then
    bbnOK.Enabled := FValorPagarDinheiro > 0;
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.pgcFormaPagChanging(
  Sender: TObject; var AllowChange: Boolean);
begin
  inherited;
  if pgcFormaPag.ActivePage = tstCredito then begin
    if edtTotalSelecionadoCred.Modified then
      edtTotalSelecionadoCred.Text := FloatToStr(FCreditoValorPagarOriginal)//, ffCurrency, 15, 2)
  end else if pgcFormaPag.ActivePage = tstDebito then begin
    if edtTotalSelecionadoDeb.Modified then
      edtTotalSelecionadoDeb.Text := FloatToStr(FDeditoValorPagarOriginal)//, ffCurrency, 15, 2)
  end else if pgcFormaPag.ActivePage = tstCDC then begin
    if edtTotalSelecionadoCDC.Modified then
      edtTotalSelecionadoCDC.Text := FloatToStr(FCDCValorPagarOriginal)
  end else
    edtPagamentoDinheiro.Clear;
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.edtTotalSelecionadoCDCChange(
  Sender: TObject);
begin
  inherited;
  try
    FCDCValorPagar := StrToFloat(edtTotalSelecionadoCDC.ValorSemFormatacao)
  except
    FCDCValorPagar := 0;
  end;
end;

procedure TfrmSelecionarFormaPagamentoTEFDiscado.CDCParcelasPagar(var Parcelas: array of integer);
var
  a: Integer;
begin
  if High(CDCParcelas) > -1 then
    for a := 0 to High(CDCParcelas) do
      Parcelas[a] := CDCParcelas[a].Numero;
end;

function TfrmSelecionarFormaPagamentoTEFDiscado.getCDCQtdadeParcelas: Integer;
begin
  if High(CDCParcelas) = -1 then
    Result := 0
  else
    Result := High(CDCParcelas) + 1;
end;

function TfrmSelecionarFormaPagamentoTEFDiscado.getCDCValorPagar: Currency;
begin
    Result := FCDCValorPagar
end;


end.
