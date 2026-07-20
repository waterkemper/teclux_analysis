unit dmimprimesaldocliente;

interface

uses
  SysUtils, Classes, dmbasico, DB, ZQuery, ZPgSqlQuery, cpquery,
  clparametrossistema, cltextprinter, ctconstantes, ctepson, biblio,
  ZTransact, clecf, Controls;

type
  Tdtmimprimesaldocliente = class(TdtmBasico)
    qryTrocas: TtecQuery;
    qryTrocasnumero: TIntegerField;
    qryTrocastipo: TStringField;
    qryTrocasdata: TDateTimeField;
    qryTrocascliente: TIntegerField;
    qryTrocastipocliente: TStringField;
    qryTrocassaldo: TFloatField;
    qryTrocasreferencia: TStringField;
    qryTrocasnome: TStringField;
    qryTrocasvalor: TFloatField;
  protected
    function ObterSaldo(Cliente: Integer; TipoCliente: String): Boolean;
    function Imprimir(Cliente: Integer; TipoCliente: String): Boolean;
  private
    { Private declarations }
  public
    function ImprimirSaldo(Cliente: Integer; TipoCliente: String): Boolean;
    function ImprimirComSaldo(Cliente: Integer; TipoCliente: String): Boolean;

    { Public declarations }
  end;

var
  dtmimprimesaldocliente: Tdtmimprimesaldocliente;

implementation

uses fmselecionarimpressoras;

{$R *.dfm}

{ Tdtmimprimesaldocliente }
function Tdtmimprimesaldocliente.ImprimirSaldo(Cliente: Integer;
  TipoCliente: String): Boolean;
begin
  Result := False;
  if ObterSaldo(Cliente, TipoCliente) then begin
    try
      Result := Imprimir(Cliente, TipoCliente);
    except
      raise
    end
  end;
end;

function Tdtmimprimesaldocliente.ObterSaldo(Cliente: Integer;
  TipoCliente: String): Boolean;
begin
  RefazConsulta(qryTrocas, [0,1], [Cliente, TipoCliente]);
  Result := qryTrocas.RecordCount > 0;

  if not Result then
    MensagemAviso(ctCLIENTESEMSALDO);
end;

function Tdtmimprimesaldocliente.Imprimir(Cliente: Integer;
  TipoCliente: String): Boolean;

var
  MaxCol, nLinhas, Comp, a, I : Integer;
  Linha: String;
  Relatorio : TStringList;
  Imprimindonaecf : boolean;
  vcontinuar : Boolean;


  procedure Alinhar(Tipo: TAlignment; PosAtual: Integer = 0);
  begin
    case Tipo of
      taCenter: Insert(stringOfChar(' ', (MaxCol - Length(linha)) div 2), Linha, 1);
      taRightJustify: Insert(stringOfChar(' ', MaxCol - Length(linha) - PosAtual), Linha, 1);
    end
  end;

  procedure ImprimirLinha(texto: String;posicao: integer); overload;
  begin
    if (texto = '') then
      Relatorio.Append(stringOfChar(' ', MaxCol))
    else
      Relatorio.Append(texto);

    if (texto = '') then
      TextPrinter.writeln
    else
      TextPrinter.WriteTextln(texto, posicao);
  end;


begin

  ImprimindonaECF := assigned(ecfpadrao);
  NomeImpressoraEscolhida := parsistema.NomeImpressoraFechamentoCaixa;
  vcontinuar := assigned(ECFPadrao) or (NomeImpressoraEscolhida<>'');

  if not vcontinuar then
  begin
    frmSelecionarImpressoras := TfrmSelecionarImpressoras.Create(frmSelecionarImpressoras, 'F');
    try
      if frmSelecionarImpressoras.ShowModal = mrok then
      begin
        NomeImpressoraEscolhida := frmSelecionarImpressoras.NomeImpressora;
        vcontinuar := True;
      end
      else
      begin
        vcontinuar := False;
        MensagemAviso(ctSELECIONARIMPRESSORA);
      end;
    finally
      frmSelecionarImpressoras.Free;
    end;
  end;

  if vcontinuar then
  begin
    Relatorio := TStringList.Create;
    try

      if ParSistema.MaxColAutenticadora <> 0 then
        MaxCol := ParSistema.MaxColAutenticadora
      else
        MaxCol := 60;

      with TextPrinter do
      begin

        if ImprimindonaECF then
          ImprimirParaArquivo := True
        else
          ImprimirParaArquivo := False;
        Text.Clear;

        if ParSistema.Autenticadora in [1,2,4] then
        begin
          BeginDoc('', False);
//          writeText(#$0F,0);
        end
        else begin
          BeginDoc('', True);
          writeText(EPS_ON_CONDENSED,0);
        end;

        Linha := RazaoFilialBase;
        Alinhar(taCenter);
        ImprimirLinha(linha, 0);

        Linha := RuaFilialBase + ' - ' + BairroFilialBase;
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        Linha := FormatarCEP(CEPFilialBase) + ' - ' + CidadeFilialBase + ' - ' + EstadoFilialBase;
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        Linha := ctCGCMF + ' ' + FormatarCPFouCGC(CNPJFilialBase) ;
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        Linha := ctIE + ' ' + InscricaoEstadualFilialBase ;
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        ImprimirLinha('', 0);

        Linha := 'IMPRESSAO DE SALDO DO CLIENTE';
        Alinhar(taCenter);
        ImprimirLinha(Linha,0);

        ImprimirLinha('', 0);

        Linha := ANSIUpperCase(ctCLIENTE) + '.: ' +Format('%-28s', [qryTrocasnome.AsString]);
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        Linha := format('%-15s',[ANSIUpperCase(ctCAIXA) + '...: '+inttostr(CodigoUsuario)])+
                 format('%-12s',[ANSIUpperCase(ctFILIAL) + '.: '+inttostr(filialbase)]);
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        ImprimirLinha('', 0);

        Linha := 'DATA      NUMERO  REFERENCIA                 VALOR';
        Alinhar(taCenter);
        ImprimirLinha(Linha,0);

        Linha := StringOfChar('-', 50);
        Alinhar(taCenter);
        ImprimirLinha(Linha,0);

        linha:='';
        qryTrocas.SortByField('Numero');
        qryTrocas.First;
        while not qryTrocas.Eof do begin
          Linha := FormatDateTime('dd/mm/yy',qryTrocasdata.AsDateTime) + '  ' +
                    Format('%-6s', [qryTrocasnumero.AsString]) + '  ' +
                    Format('%-21s', [qryTrocasreferencia.AsString]) + '  ' +
                    format('%9s',[trim(Trocar(Trocar(Trocar(Trocar(Format('%8.2m',[qryTrocasvalor.AsFloat]),'R',''),'$',''),'(','-'),')',''))]);
          Alinhar(taCenter);
          ImprimirLinha(Linha,0);
          qryTrocas.Next;
        end;

        ImprimirLinha('', 0);

        Linha := 'SALDO ATUAL: ' + Format('%8.2m', [qryTrocassaldo.AsFloat]);
        Comp := length(Linha);
        Alinhar(taRightJustify,Comp);
        ImprimirLinha(Linha,0);

        ImprimirLinha('', 0);
        ImprimirLinha('', 0);

        if parsistema.diasvalidadecreditotroca <> '' then
        begin
          Linha := format('SALDO DE CRÉDITO VÁLIDO ATÉ %s (%s DIAS)',
                  [FormatDateTime('dd/MM/yyyy',DataServidor+strtoint(parsistema.diasvalidadecreditotroca)),
                   parsistema.diasvalidadecreditotroca]);
          Comp := length(Linha);
          Alinhar(taCenter,Comp);
          ImprimirLinha(Linha,0);

          ImprimirLinha('', 0);
          ImprimirLinha('', 0);
        end;

        Linha := CidadeFilialBase + ', ' + FormatDateTime( 'dd'' de ''mmmm'' de ''yyyy', DataServidor);
        Alinhar(taCenter);
        ImprimirLinha(Linha, 0);

        if ParSistema.Autenticadora in [1,4] then
          writeText(#$12, 0)
        else if ParSistema.Autenticadora = 2 then
          writeText(#$56, 0)
        else
          writeText(EPS_OFF_CONDENSED,0);
        FormFeed;

        qryTrocas.Close;

        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);
        ImprimirLinha('', 0);

        EndDoc('TecLUX - Imprimindo Saldo de Troca.');
        Result := True;


        if Imprimindonaecf then
          ECFPadrao.RelatorioGerencial(Relatorio);

      end;


    finally

      Relatorio.free;
      NomeImpressoraEscolhida := '';

    end;

  end;

end;

function Tdtmimprimesaldocliente.ImprimirComSaldo(Cliente: Integer;
  TipoCliente: String): Boolean;
begin

  Result := False;
  RefazConsulta(qryTrocas, [0,1], [Cliente, TipoCliente]);
  qryTrocas.first;
  if qrytrocassaldo.ascurrency > 0 then
    if MensagemSelecionaOpcao('O cliente possui saldo de '+formatFloat('###,##0.00',qrytrocassaldo.ascurrency)+ '. Deseja imprimir?') = smbYES then
      result := Imprimir(Cliente, TipoCliente);
end;

end.
