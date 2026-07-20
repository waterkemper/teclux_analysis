unit fmImportarAlugueis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, cpdata, Buttons, ActnList, fmajudabt, ComCtrls,
  ToolWin, ExtCtrls, DB, ZQuery, ZPgSqlQuery, cpquery, biblio, dmbasico, dmtecsoft,
  clparametrossistema, ctconstantes;

type
  TfrmImportarAlugueis = class(TfrmAjudaBt)
    gbxMesAnoReferencia: TGroupBox;
    edtMesAno: TEditMesAno;
    gbxArquivoAluguel: TGroupBox;
    dlgImportarlugueis: TOpenDialog;
    lblArquivoAluguel: TLabel;
    sbnProcuraAlugueis: TSpeedButton;
    actLiberar: TActionList;
    aclLiberar: TAction;
    qryClientes: TtecQuery;
    qryAlugueis: TtecQuery;
    qryClientescodigo: TIntegerField;
    qryClientesnome: TStringField;
    qryClientespessoatipo: TStringField;
    qryClientespessoanumero: TStringField;
    spccontatosclienteproximocodigo: TtecQuery;
    spccontatosclienteproximocodigocodigo: TIntegerField;
    qryClientesrua: TStringField;
    qryClientesnumero: TIntegerField;
    qryClientesestado: TStringField;
    qryClientescidade: TIntegerField;
    qryClientesbairro: TIntegerField;
    qryClientescep: TIntegerField;
    qryAlugueiscliente: TIntegerField;
    qryAlugueisdata: TDateField;
    qryAlugueisvalor: TFloatField;
    qryAlugueispiscst: TStringField;
    qryAlugueispisaliquota: TFloatField;
    qryAlugueiscofinscst: TStringField;
    qryAlugueiscofinsaliquota: TFloatField;
    qryAlugueisnumero: TIntegerField;
    qryAlugueisfilialemissao: TIntegerField;
    qryAlugueisnat_bc_cred: TStringField;
    spcalugueisproximonumero: TtecQuery;
    spcalugueisproximonumeronumero: TLargeintField;
    ckbApagarDadosMes: TCheckBox;
    qryApagarAlugueisMes: TtecQuery;
    procedure sbnProcuraAlugueisClick(Sender: TObject);
    procedure aclLiberarUpdate(Sender: TObject);
  private
    { Private declarations }
  protected
    dmbasico : TdtmBasico;

  public
    { Public declarations }
    constructor Create(Aowner:Tcomponent);override;
    destructor Destroy; override;

  end;

var
  frmImportarAlugueis: TfrmImportarAlugueis;

implementation

uses DateUtils;

{$R *.dfm}

procedure TfrmImportarAlugueis.sbnProcuraAlugueisClick(Sender: TObject);
var
  vArquivo : TStringList;
  vListaCNPJ: TStringList;
  vListaCodigoCliente : TStringList;
  vListaNomes: TStringList;
  vListaValores: TStringList;

  vLinha : String;
  vCNPJ : String;
  vLinhaEmpreendedorEncontrada : Boolean;
  i: integer;

  function VerificarEmpreendedor: boolean;
  var
    i: integer;
    vCNPJEncontrado: boolean;
  begin
    result := false;
    vCNPJEncontrado := false;
    for i:=0 to vArquivo.Count do
    begin
      result := false;
      vLinha := vArquivo.Strings[i];

      if copy(trim(vLinha),1,12) = 'Empreendedor' then
        vLinhaEmpreendedorEncontrada := true;

      if vLinhaEmpreendedorEncontrada and (copy(vLinha,60,18) <> '') then
      begin
        vCNPJEncontrado := true;
        vCNPJ := SomenteNumero(copy(vLinha,60,18));
        if not dmbasico.VerificarCNPJFilial(vCNPJ) then
        begin
          MensagemErro(format('O CNPJ do empreendedor %s não existe no cadastro de filiais',[vCNPJ]));
          break;
        end
        else
        begin
          result := true;
          break;
        end;

        vLinhaEmpreendedorEncontrada := false;
      end;

    end;
    if not vCNPJEncontrado then
      MensagemErro('Este arquivo não é válido para a importação dos aluguéis');

  end;

  function VerificarClientesAlugueis: boolean;
  var
    i: integer;
    vCNPJEncontrado: boolean;
    vLinhaLojistaEncontrada: boolean;
    vStringsCNPJ, vListaAlugueis: String;
    vDiasnoMes: word;
    VData: TDateTime;
    
  begin
    result := false;
    vLinhaLojistaEncontrada := false;
    vCNPJEncontrado := false;
    vListaAlugueis := '';

    for i:=0 to vArquivo.Count-1 do
    begin
      vLinha := vArquivo.Strings[i];

      if vLinhaLojistaEncontrada and (somentenumero(copy(vLinha,60,18))<>'') then
      begin
        vCNPJEncontrado := true;
        vStringsCNPJ := vStringsCNPJ + quotedstr(somentenumero(copy(vLinha,60,18)))+ ', ';

        vListaCNPJ.Append(somentenumero(copy(vLinha,60,18)));
        vListaNomes.Append(trim(copy(vLinha,1,59)));
        vListaValores.Append(copy(vLinha,79,115));
      end;

      if copy(trim(vLinha),1,7) = 'Lojista' then
        vLinhaLojistaEncontrada := true;

//      if copy(trim(vLinha),1,12) = 'Empreendedor' then
//        break;
    end;

    if not vCNPJEncontrado then
      MensagemErro('Este arquivo não é válido para a importação dos aluguéis')
    else
    begin

      result := true;

      if ckbApagarDadosMes.checked then
      begin
        qryApagarAlugueisMes.ParamByName('mes').asinteger := monthof(strtodatetime('01/'+edtMesAno.Text));
        qryApagarAlugueisMes.ParamByName('ano').asinteger := yearof(strtodatetime('01/'+edtMesAno.Text));
        qryApagarAlugueisMes.execSQL;
        result := dmbasico.perpetrar([], SomenteGravacao);
      end;

      if result then
      begin

        delete(vStringsCNPJ,length(vStringsCNPJ)-1,2);
        qryclientes.MacroByName('ListaCNPJs').AsString := vStringsCNPJ;
        qryClientes.Close;
        qryClientes.open;

        vDiasNoMes := DaysInMonth(strtodatetime('01/'+edtMesAno.Text));
        vData := strtodateTime(inttostr(vDiasNoMes)+'/'+edtMesAno.Text);


        for i:=0 to vlistacnpj.Count-1 do
        begin
          if not qryClientes.locate('pessoanumero',vlistacnpj[i],[]) then
          begin
            spccontatosclienteproximocodigo.Close;
            spccontatosclienteproximocodigo.open;

            qryclientes.append;
            qryClientescodigo.AsInteger := spccontatosclienteproximocodigocodigo.AsInteger;

            qryClientesnome.AsString := vListaNomes[i];
            if (length(vListaCNPJ[i])=14) then
              qryClientespessoatipo.AsString := 'J'
            else
              qryClientespessoatipo.AsString := 'F';
            qryClientespessoanumero.AsString := vListaCNPJ[i];
            qryClientesrua.AsString     := dmbasico.RuaFilialBase;
            qryClientesnumero.AsString := dmbasico.NumeroFilialBase;
            qryClientesestado.AsString  := dmbasico.EstadoFilialBase;
            qryClientescidade.AsString := dmbasico.CodigoCidadeFilialBase;
            qryClientesbairro.AsString := dmbasico.CodigoBairroFilialBase;
            qryClientescep.AsString    := dmbasico.CEPFilialBase;

            qryclientes.post;
          end;

          vListaCodigoCliente.Append(qryClientescodigo.asstring);
          vListaAlugueis := vListaAlugueis + '('+qryClientescodigo.AsString+', '+quotedstr(FormatDateTime('YYYY-MM-DD', vdata))+'), ';
        end;

        delete(vListaAlugueis,length(vListaAlugueis)-1,2);
        qryAlugueis.MacroByName('ListaAlugueis').AsString := vListaAlugueis;
        qryAlugueis.Close;
        qryAlugueis.open;

        qryalugueis.First;
        while not qryAlugueis.Eof do
          qryalugueis.delete;

        for i:=0 to vlistacnpj.Count-1 do
        begin
          if not qryAlugueis.locate('cliente;data',VarArrayOf([strtoint(vListaCodigoCliente[i]),VData]),[]) then
          begin
            spcalugueisproximonumero.Close;
            spcalugueisproximonumero.Open;

            qryAlugueis.append;
            qryAlugueisnumero.AsInteger := spcalugueisproximonumeronumero.AsInteger;
            qryAlugueiscliente.AsString := vListaCodigoCliente[i];
            qryAlugueisdata.AsDateTime := VData;
            qryAlugueisvalor.AsCurrency := strtofloat(trocar(vListaValores[i],'.',''));
            qryAlugueispiscst.AsString := '01';
            qryAlugueispisaliquota.AsCurrency := ParSistema.PISAliquotaImoveis;
            qryAlugueiscofinscst.AsString := '01';
            qryAlugueiscofinsaliquota.AsCurrency := parsistema.CofinsAliquotaImoveis;
            qryAlugueisfilialemissao.AsInteger := FilialBase;
            qryAlugueisnat_bc_cred.AsString := '05';
            qryalugueis.Post;

          end
          else
          begin
            qryAlugueis.edit;

            qryAlugueisvalor.AsCurrency := qryAlugueisvalor.AsCurrency + strtofloat(trocar(vListaValores[i],'.',''));
            qryAlugueispiscst.AsString := '01';
            qryAlugueispisaliquota.AsCurrency := ParSistema.PISAliquotaImoveis;
            qryAlugueiscofinscst.AsString := '01';
            qryAlugueiscofinsaliquota.AsCurrency := parsistema.CofinsAliquotaImoveis;
            qryAlugueisfilialemissao.AsInteger := FilialBase;
            qryAlugueisnat_bc_cred.AsString := '05';
            qryAlugueis.post;
          end;
        end;

        result := dmbasico.Perpetrar([qryclientes,qryalugueis], SomenteGravacao);

      end;

    end;

  end;


begin
  vLinhaEmpreendedorEncontrada := false;
  if dlgImportarlugueis.Execute and
     (MensagemConfirmacao('Confirma a importação dos aluguéis?') = smbOk) then
  begin
    lblArquivoAluguel.Caption := dlgImportarlugueis.FileName;
    if edtMesAno.DataValida then
    begin
      vArquivo      := TStringList.Create;
      vListaCNPJ    := TStringList.Create;
      vListaNomes   := TStringList.Create;
      vListaValores := TStringList.Create;
      vListaCodigoCliente := TStringList.Create;

      vArquivo.LoadFromFile(dlgImportarlugueis.FileName);

      if VerificarEmpreendedor then
        if VerificarClientesAlugueis then
          MensagemAviso('Aluguéis importados com sucesso.');

      vArquivo.free;
      vListaCNPJ.free;
      vListaNomes.free;
      vListaValores.free;
      vListaCodigoCliente.free;

    end;
  end;

end;

destructor TfrmImportarAlugueis.Destroy;
begin

  inherited;
  frmImportarAlugueis := nil;
  sbnProcuraAlugueis.caption := '';
end;

procedure TfrmImportarAlugueis.aclLiberarUpdate(Sender: TObject);
begin
  inherited;
  sbnProcuraAlugueis.Enabled := trim(edtMesAno.Text)<>'/';

end;

constructor TfrmImportarAlugueis.Create(Aowner: Tcomponent);
begin
  inherited;
  dmbasico := TdtmBasico.Create(self);
  ckbApagarDadosMes.checked := false;
end;

end.
