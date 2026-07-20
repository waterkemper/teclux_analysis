unit fmconfirmarimpressaonocontrato;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, Windows,
  StdCtrls, biblio, {Qete,} ctconstantes,
  //REpositorio
  fmnavcontroles, ExtCtrls, Buttons, cptexto, clparametrossistema;

type
  TfrmConfirmarImpressaoNoContrato = class(TfrmNavControles)
    ckbImprimirContrato: TCheckBox;
    ckbImprimirCarne:    TCheckBox;
    ckbImprimirBoleto:   TCheckBox;
    ckbImprimirSaldo: TCheckBox;
    pnlFundoJanela: TPanel;
    gbxFundoJanela: TGroupBox;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    ckbImprimirCarneAbertas: TCheckBox;
    lblParcelas: TLabel;
    edtParcelas: TEdit;
    ckbImprimirContratomeiaPagina: TCheckBox;
    ckbImprimirEtiquetasListaCasamento: TCheckBox;
    PnlImprimirContrato: TPanel;
    pnllinha: TPanel;
    pnlImprimirContratomeiaPagina: TPanel;
    PnlImprimirCarne: TPanel;
    pnlImprimirCarneAbertas: TPanel;
    pnlParcelas: TPanel;
    pnlImprimirBoleto: TPanel;
    pnlImprimirSaldo: TPanel;
    pnlImprimirEtiquetasListaCasamento: TPanel;
    ckbEnviarPDFBoletoViaEmail: TCheckBox;
    pnlImprimirListaProdutosporLocalizacoes: TPanel;
    ckbImprimirListaProdutosporLocalizacao: TCheckBox;
    ckbComFotos: TCheckBox;
    procedure ckbImprimirCarneClick(Sender: TObject);
    procedure ckbImprimirCarneAbertasClick(Sender: TObject);
    procedure bbnOKClick(Sender: TObject);
    procedure edtParcelasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ckbImprimirBoletoClick(Sender: TObject);
    procedure ckbImprimirContratoClick(Sender: TObject);
    procedure ckbImprimirContratomeiaPaginaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckbComFotosClick(Sender: TObject);
  private
    FValorInicialIntervalo: String;
    FValorFinalIntervalo: String;
    FValorIntervalo: vString;
    function GetValorInicialIntervalo: String;
    function GetValorFinalIntervalo: String;
    function GetValorIntervalo: vString;
    function GetContratoMeiaPagina: Boolean;
    function GetEtiquetasListaCasamento: Boolean;
  private
    FIntervaloCarnesAbertas: vString;
    FIntervaloCarnes: vString;
    FUltimaAberta: String;
    FPrimeiraAberta: String;
    FPrimeiraParcela: String;
    FSequencia: vString;
    function GetCarne: Boolean;
    function GetContrato: Boolean;
    function GetBoleto: Boolean;
    function GetSaldo: Boolean;
    function GetCarneAbertas: Boolean;
    function ValidarFaixaImpressao: boolean;
    property ValorIntervalo: vString read GetValorIntervalo write FValorIntervalo;
    property ValorInicialIntervalo: String read GetValorInicialIntervalo write FValorInicialIntervalo;
    property ValorFinalIntervalo: String read GetValorFinalIntervalo write FValorFinalIntervalo;


  public
    constructor Create(AOwner: TComponent; Contrato, Carne, CarneAbertas, Boleto, Saldo: Boolean; Caption: Integer;
               ImprimirEtiquetasListaCasamento: boolean = true); reintroduce;
    destructor  Destroy; override;

    property Contrato: Boolean read GetContrato;
    property ContratoMeiaPagina: Boolean read GetContratoMeiaPagina;
    property Carne: Boolean read GetCarne;
    property Boleto: Boolean read GetBoleto;
    property Saldo : Boolean read GetSaldo;
    property CarneAbertas: Boolean read GetCarneAbertas;
    property EtiquetasListaCasamento: Boolean read GetEtiquetasListaCasamento;
    property IntervaloCarnes: vString read FIntervaloCarnes write FIntervaloCarnes;
    property IntervaloCarnesAbertas: vString read FIntervaloCarnesAbertas write FIntervaloCarnesAbertas;
    property UltimaAberta: String read FUltimaAberta write FUltimaAberta;
    property PrimeiraAberta: String read FPrimeiraAberta write FPrimeiraAberta;
    property PrimeiraParcela: String read FPrimeiraParcela write FPrimeiraParcela;
    property Sequencia: vString read FSequencia write FSequencia;

  end;

var
  frmConfirmarImpressaoNoContrato : tfrmConfirmarImpressaoNoContrato;

implementation


{$R *.dfm}

{ TfrmConfirmarImpressaoNoContrato }

constructor TfrmConfirmarImpressaoNoContrato.Create(AOwner: TComponent;
  Contrato, Carne, CarneAbertas, Boleto, Saldo: Boolean; Caption: Integer;
  ImprimirEtiquetasListaCasamento: boolean);
begin
  inherited Create(AOwner);
  case Caption of
    1: begin
         ckbImprimirContrato.Caption:= 'Imprimir Contrato';
         pnlImprimirContratomeiaPagina.Enabled := Contrato;
       end;
    2: begin
         ckbImprimirContrato.Caption:= 'Imprimir Ordem de Serviço';
         pnlImprimirContratomeiaPagina.Enabled := false;
       end;
  end;

  pnlImprimirContrato.visible := Contrato;
  pnlImprimirCarne.visible    := Carne;
  pnlImprimirCarneAbertas.visible := CarneAbertas;
  pnlImprimirBoleto.visible   := Boleto;
  pnlImprimirSaldo.visible    := Saldo;
  pnlImprimirEtiquetasListaCasamento.Visible := ImprimirEtiquetasListaCasamento;

  edtParcelas.Enabled         := Carne or CarneAbertas or ImprimirEtiquetasListaCasamento;

//  ckbComFotos.visible := ParSistema.ImprimirContratoSimples;
end;

function TfrmConfirmarImpressaoNoContrato.GetCarne: Boolean;
begin
  Result := ckbImprimirCarne.Checked
end;

function TfrmConfirmarImpressaoNoContrato.GetContrato: Boolean;
begin
  Result := ckbImprimirContrato.Checked
end;


function TfrmConfirmarImpressaoNoContrato.GetBoleto: Boolean;
begin
  Result := ckbImprimirBoleto.Checked;
end;

function TfrmConfirmarImpressaoNoContrato.GetSaldo: Boolean;
begin
  Result := ckbImprimirSaldo.Checked
end;


function TfrmConfirmarImpressaoNoContrato.GetCarneAbertas: Boolean;
begin
  Result := ckbImprimirCarneAbertas.Checked
end;

procedure TfrmConfirmarImpressaoNoContrato.ckbImprimirCarneClick(
  Sender: TObject);
begin
  inherited;
  if ckbImprimirCarne.Checked then
  begin
    ckbImprimirCarneAbertas.Checked := false;
    edtParcelas.Enabled:= True;
    edtParcelas.Text := IntervaloCarnes[0]+'-'+
                        IntervaloCarnes[length(IntervaloCarnes)-1];
  end;
end;

procedure TfrmConfirmarImpressaoNoContrato.ckbImprimirCarneAbertasClick(
  Sender: TObject);
begin
  inherited;
   if ckbImprimirCarneAbertas.Checked then
    begin
      ckbImprimirCarne.Checked:= False;
      edtParcelas.Enabled:= True;
      edtParcelas.Text := IntervaloCarnesAbertas[0]+'-'+
                          IntervaloCarnesAbertas[length(IntervaloCarnesAbertas)-1];
    end;

end;
procedure TfrmConfirmarImpressaoNoContrato.bbnOKClick(Sender: TObject);
begin
  inherited;
  if ckbImprimirCarne.Checked or
     ckbImprimirCarneAbertas.Checked or
     ckbImprimirBoleto.Checked or
     ckbEnviarPDFBoletoViaEmail.Checked then
  begin
    if Validarfaixaimpressao then
      ModalResult := mrOK
    else
      ModalResult := mrNone;
  end
  else
   ModalResult := mrOK;
end;

function TfrmConfirmarImpressaoNoContrato.ValidarFaixaImpressao: boolean;
var
  C, a, inicio, fim, i: integer;
  v,aux,valorinicio,valorfim: string;

  procedure GerarSequencia;
  var i: integer;
  begin
    if ((valorinicio<>'') and (valorfim<>'')) then
    begin
      if strtoint(valorinicio)<=strtoint(valorfim) then
      begin
        for i:= strtoint(valorinicio) to strtoint(valorfim) do
        begin
          SetLength(Fsequencia,length(sequencia)+1);
          sequencia[a]:= inttostr(i);
          inc(a);
        end;
      end
      else
      begin
        for i:= strtoint(valorinicio) downto strtoint(valorfim) do
        begin
          SetLength(Fsequencia,length(sequencia)+1);
          sequencia[a]:= inttostr(i);
          inc(a);
        end;
      end;
      valorinicio := '';
      valorfim    := '';
    end;
  end;

begin
  try
    result := false;
    a:=0;
    sequencia := nil;
    for c:=1 to length(edtParcelas.Text) do
    begin
      aux := Copy(edtParcelas.Text, C, 1);
      if (aux = '-') then
      begin
        if v<>'' then
          valorinicio := v
        else
          valorinicio := ValorInicialIntervalo;
        v:='';

        if (c=length(edtParcelas.Text)) then
          valorfim := ValorFinalIntervalo;

      end
      else
      if aux = ';' then
      begin
        if valorinicio='' then
          valorinicio := v;
        valorfim := v;
        v:='';

        if Copy(edtParcelas.Text, C-1, 1)='-' then
          valorfim := ValorFinalIntervalo;

      end
      else
        v:= v+Copy(edtParcelas.Text, C, 1);

      GerarSequencia;

    end;

    if (valorfim='') and  PossuiNumero(v) then
    begin
      valorfim := v;
      if valorinicio = '' then
        valorinicio := v;
    end;

    GerarSequencia;


    for i:=0 to length(sequencia)-1 do
    begin
      result := false;
      for a:=0 to length(Valorintervalo)-1 do
        if Sequencia[i] = ValorIntervalo[a] then
        begin
          result:= True;
          Break;
        end;

      if not result then
      begin
        MensagemAviso('A Parcela '+Sequencia[i]+' não foi encontrada'+ #10#13 +
                    'Escolha um Intervalo Válido entre '+ValorIntervalo[0]+' e '+
                        ValorIntervalo[length(ValorIntervalo)-1]);
        Break;
      end;
    end;
  except
    MensagemAviso('A Parcela não foi encontrada'+ #10#13 +
                'Escolha um Intervalo Válido entre '+ValorIntervalo[0]+' e '+
                    ValorIntervalo[length(ValorIntervalo)-1]);
  end;

end;


procedure TfrmConfirmarImpressaoNoContrato.edtParcelasKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not ((key in [96..105,109,226]) or
          (key=VK_ESCAPE) or
          (key=VK_TAB) or
          (key=VK_Back) or
          (key=VK_SPACE) or
          (key=VK_Return) or
          (key=VK_Return) or
          (key=VK_INSERT) or
          (key=VK_Delete) or
          (key=VK_HOME) or
          (key=VK_END) or
          (key=VK_LEFT) or
          (key=VK_UP) or
          (key=VK_RIGHT) or
          (key=VK_DOWN) or
          (key=VK_PRIOR) or
          (key=VK_Next) or
          (key=VK_NEXT) or
          (key=VK_SHIFT) or
          (key=VK_CONTROL)) then
     Key:= 0;
end;

procedure TfrmConfirmarImpressaoNoContrato.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  Canclose := (ModalResult = mrOK) or (ModalResult = mrCANCEL);
end;

function TfrmConfirmarImpressaoNoContrato.GetValorInicialIntervalo: String;
begin
  if ckbImprimirCarne.Checked then
    FValorInicialIntervalo := intervaloCarnes[0]
  else
   if ckbImprimirCarneAbertas.Checked then
     FValorInicialIntervalo := intervaloCarnesabertas[0];

  Result := FValorInicialIntervalo;
end;

function TfrmConfirmarImpressaoNoContrato.GetValorFinalIntervalo: String;
begin
  if ckbImprimirCarne.Checked then
    FValorFinalIntervalo := IntervaloCarnes[length(IntervaloCarnes)-1]
  else
   if ckbImprimirCarneAbertas.Checked then
     FValorFinalIntervalo := IntervaloCarnesAbertas[length(IntervaloCarnesAbertas)-1];

  Result := FValorFinalIntervalo;
end;

function TfrmConfirmarImpressaoNoContrato.GetValorIntervalo: vString;
begin
  if ckbImprimirCarne.Checked then
    FValorIntervalo := IntervaloCarnes
  else
   if ckbImprimirCarneAbertas.Checked then
     FValorIntervalo := IntervaloCarnesAbertas;

   if ckbImprimirBoleto.Checked or ckbEnviarPDFBoletoViaEmail.Checked then
     FValorIntervalo := IntervaloCarnesAbertas;

  Result := FValorIntervalo;
end;

procedure TfrmConfirmarImpressaoNoContrato.ckbImprimirBoletoClick(
  Sender: TObject);
begin
  inherited;
      edtParcelas.Enabled:= True;
      edtParcelas.Text :=  IntervaloCarnesAbertas[0]+'-'+
                           IntervaloCarnesAbertas[length(IntervaloCarnesAbertas)-1];
end;

destructor TfrmConfirmarImpressaoNoContrato.Destroy;
begin
  inherited;
  frmConfirmarImpressaoNoContrato := nil;
end;

function TfrmConfirmarImpressaoNoContrato.GetContratoMeiaPagina: Boolean;
begin
  Result := ckbImprimirContratomeiaPagina.Checked
end;

procedure TfrmConfirmarImpressaoNoContrato.ckbImprimirContratoClick(
  Sender: TObject);
begin
  inherited;
  if ckbImprimirContrato.Checked then
    ckbImprimirContratomeiaPagina.Checked := false;
end;

procedure TfrmConfirmarImpressaoNoContrato.ckbImprimirContratomeiaPaginaClick(
  Sender: TObject);
begin
  inherited;
  if ckbImprimirContratomeiaPagina.Checked then
    ckbImprimirContrato.Checked := false;
end;

function TfrmConfirmarImpressaoNoContrato.GetEtiquetasListaCasamento: Boolean;
begin
  result := ckbImprimirEtiquetasListaCasamento.Checked;
end;

procedure TfrmConfirmarImpressaoNoContrato.FormShow(Sender: TObject);
begin
  inherited;
  self.BringToFront;
end;

procedure TfrmConfirmarImpressaoNoContrato.ckbComFotosClick(
  Sender: TObject);
begin
  inherited;
  if ckbComFotos.checked then
    ckbImprimirContrato.checked :=  ckbComFotos.checked;
end;

end.
