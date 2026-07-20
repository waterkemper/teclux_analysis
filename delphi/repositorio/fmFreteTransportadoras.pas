unit fmFreteTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, DBAdvGrid, StdCtrls, Buttons,
  DB, DBClient, ACBrBase, ACBrSocket, ACBrFrenet, clparametrossistema, cpquery,
  biblio, ExtCtrls, dmtecsoft, ZQuery, ZPgSqlQuery;

type
  TfrmFreteTransportadoras = class(TForm)
    cdsCotacao: TClientDataSet;
    dsrCotacao: TDataSource;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    DBAdvCotacao: TDBAdvGrid;
    Frenet: TACBrFrenet;
    mRetFrenet: TMemo;
    pnlBottom: TPanel;
    qryTabela_Frete: TtecQuery;
    qryFretes_Isencao: TtecQuery;
    qryTabela_Fretecodigo: TLargeintField;
    qryTabela_Fretedescricao: TStringField;
    qryTabela_Freteativa: TBooleanField;
    qryTabela_Fretecubagem: TFloatField;
    qryTabela_Fretecodigo_servico: TStringField;
    qryTabela_Fretenome_site: TStringField;
    qryTabela_Fretefornecedor: TIntegerField;
    qryTabela_Fretedescricao_servico: TStringField;
    qryTabela_Fretenome_transportador: TStringField;
    qryFretes_Isencaocodigotabela_frete: TLargeintField;
    qryFretes_Isencaocodigofretes_isencao: TIntegerField;
    qryFretes_Isencaocodigotransportador: TStringField;
    qryFretes_Isencaotransportador: TStringField;
    qryFretes_Isencaoprazo_entrega: TIntegerField;
    qryFretes_Isencaocodigoservico: TStringField;
    qryFretes_Isencaodescricaoservico: TStringField;
    qryFretes_Isencaofornecedor: TIntegerField;
    qryFretes_Isencaoorigem: TStringField;
    qryFretes_Isencaopeso_frete: TFloatField;
    qryFretes_Isencaovalor_para_frete_gratis: TFloatField;
    qryFretes_Isencaovalor_frete: TFloatField;
    qryFretes_Isencaopeso_inicial: TFloatField;
    qryFretes_Isencaopeso_final: TFloatField;
    qryFretes_Isencaopeso_maximo_frete_gratis: TFloatField;
    qryFretes_Isencaovalor_frete_2: TFloatField;
    qryTabela_Fretefilial: TIntegerField;
    qryTabela_Fretevalor_para_frete_gratis: TFloatField;
    qryTabela_Fretepeso_maximo_frete_gratis: TFloatField;
    qryTabela_Fretevalor_frete_fixo: TFloatField;
    qryTabela_Fretevalor_peso_cubado_minimo: TFloatField;
    qryTabela_Freteprazo_expedicao: TIntegerField;
    qryRestricoesVigilancia: TtecQuery;
    qryRestricoesVigilancianome_transportador: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbnOKClick(Sender: TObject);
  private
//    vPesoTotal : double;
    vListaProdutos: String;
    fTipo: String;
    fqryDocumento: TtecQuery;
    { Private declarations }
    procedure LerRetorno;
    function VerificarFornecedor: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Tipo: String read fTipo write fTipo;
    property qryDocumento: TtecQuery read fqryDocumento write fqryDocumento;

  end;

var
  frmFreteTransportadoras: TfrmFreteTransportadoras;
  AcionarTelaFreteTransportadoras: function (Owner: TComponent; Tipo: String; qryDocumento: TtecQuery; qryProdutos: TtecQuery): tModalResult;

implementation


{$R *.dfm}
function AcionarTelaFreteTransportadoras_(Owner: TComponent; tipo: String; qryDocumento: TtecQuery; qryProdutos: TtecQuery): tModalResult;

  procedure AdicionarFreteProprio;
  begin

    with frmFreteTransportadoras do
      While not qryFretes_Isencao.eof do
      begin
        cdSCotacao.Append;

//        cdSCotacao.FieldValues['CodigoTransportador'] := qryFretes_IsencaoCodigoTransportador.asString;
        cdSCotacao.FieldValues['Transportador'] := qryFretes_IsencaoTransportador.asString;
        cdSCotacao.FieldValues['PrazoEntrega'] := qryFretes_Isencaoprazo_entrega.asinteger;
  //      cdSCotacao.FieldValues['Mensagem'] := Frenet.Cotacoes[i].Mensagem;
        cdSCotacao.FieldValues['CodigoServico'] := qryFretes_Isencaocodigoservico.asString;
        cdSCotacao.FieldValues['DescricaoServico'] := qryFretes_IsencaoDescricaoServico.asString;
        cdSCotacao.FieldValues['Valor'] := qryFretes_Isencaovalor_frete_2.asCurrency;
        cdSCotacao.FieldValues['PrazoEntregaOriginal'] := qryFretes_Isencaoprazo_entrega.asinteger;
        cdSCotacao.FieldValues['ValorOriginal'] := qryFretes_Isencaovalor_frete_2.asCurrency;

  //      cdSCotacao.FieldValues['TempoResposta'] := Frenet.Cotacoes[i].TempoResposta;
        cdSCotacao.FieldValues['origem'] := qryFretes_Isencaoorigem.asString;
//        cdSCotacao.FieldValues['Erro'] := qryFretes_Isencaoerro.asString;

        cdSCotacao.FieldValues['codigofretes_isencao'] := qryFretes_Isencaocodigofretes_isencao.asinteger;
        cdSCotacao.FieldValues['codigotabela_frete'] := qryFretes_Isencaocodigotabela_frete.asinteger;

        if qryFretes_Isencaofornecedor.asinteger <> 0 then
          cdSCotacao.FieldValues['fornecedorfrete'] := qryFretes_Isencaofornecedor.asinteger;

        cdSCotacao.Post;
        qryFretes_Isencao.next
      end;


  end;


begin

  if qryDocumento.fieldbyname('CepCalculoFrete').isnull or
     qryProdutos.isempty then
    exit; 

  if not assigned(frmFreteTransportadoras) or (frmFreteTransportadoras.Owner <> Owner) then
  begin
    if assigned(frmFreteTransportadoras) then
      frmFreteTransportadoras.free;

    frmFreteTransportadoras := TfrmFreteTransportadoras.create(Owner);
    frmFreteTransportadoras.cdsCotacao.CreateDataSet;
    frmFreteTransportadoras.Tipo := tipo;
    frmFreteTransportadoras.qryDocumento := qryDocumento;

    with frmFreteTransportadoras do
    begin

      if tipo = 'Contratos' then
      begin

        Frenet.Token := parsistema.chave_frenet;
        Frenet.CepOrigem := fcepfilialbase;
        Frenet.CepDestino := qryDocumento.fieldbyname('CepCalculoFrete').asString;

        Frenet.ValorDeclarado := qryDocumento.fieldbyname('totalprodutos').asFloat;

        // Apagar itens anteriores
        Frenet.Itens.Clear;

        qryProdutos.First;
//        vPesoTotal := 0;
        vListaProdutos := '';

        while (not  qryProdutos.Eof) do
        begin

          with Frenet.Itens.New do
          begin
            Quantidade := qryProdutos.FieldByName('quantidade').AsInteger;
            Peso := qryProdutos.FieldByName('peso_entrega').AsFloat;
            Altura := qryProdutos.FieldByName('altura').AsFloat;
            Largura := qryProdutos.FieldByName('largura').AsFloat;
            Comprimento := qryProdutos.FieldByName('comprimento').AsFloat;
            Diametro  := qryProdutos.FieldByName('diametro').AsFloat;

            SKU := qryProdutos.FieldByName('produto').AsString;
            Categoria := ''; //qryProdutos.FieldByName('Categoria').AsString;

//            vPesoTotal := vPesoTotal + (qryProdutos.FieldByName('quantidade').AsInteger * qryProdutos.FieldByName('peso_entrega').AsFloat);
            vListaProdutos := vListaProdutos + qryProdutos.FieldByName('produto').asString
          end;

          qryProdutos.Next;
          if not qryProdutos.eof then
            vListaProdutos := vListaProdutos + ', ';

        end;


        mRetFrenet.Clear;

        if not Frenet.CotarFrete then
          mRetFrenet.Lines.Add('ERRO: '+Frenet.msgerro );

        // Ler Cotacoes
        LerRetorno;

//        qryFretes_Isencao.ParamByName('peso').asFloat := vPesoTotal;

        qryFretes_Isencao.MacroByName('ListaProdutos').asString := vListaProdutos;
        qryFretes_Isencao.ParamByName('filial').asFloat := fFilialBase;
        qryFretes_Isencao.ParamByName('cepdestino').asinteger := qryDocumento.fieldbyname('CepCalculoFrete').asinteger;
        qryFretes_Isencao.ParamByName('totalprodutos').asFloat := qryDocumento.fieldbyname('totalprodutos').asFloat;

        qryFretes_Isencao.close;
        qryFretes_Isencao.open;

        AdicionarFreteProprio;

        dsrcotacao.dataset := cdsCotacao;

      end
      else
      if tipo = 'Orçamento' then
      begin


        Frenet.Token := parsistema.chave_frenet;
        Frenet.CepOrigem := fcepfilialbase;
        Frenet.CepDestino := qryDocumento.fieldbyname('CepCalculoFrete').asString;

        Frenet.ValorDeclarado := qryDocumento.fieldbyname('totalprodutos').asFloat;

        // Apagar itens anteriores
        Frenet.Itens.Clear;

        qryProdutos.First;
        vListaProdutos := '';

        while (not  qryProdutos.Eof) do
        begin

          with Frenet.Itens.New do
          begin
            Quantidade := qryProdutos.FieldByName('quantidade').AsInteger;
            Peso := qryProdutos.FieldByName('peso_entrega').AsFloat;
            Altura := qryProdutos.FieldByName('altura').AsFloat;
            Largura := qryProdutos.FieldByName('largura').AsFloat;
            Comprimento := qryProdutos.FieldByName('comprimento').AsFloat;
            Diametro  := qryProdutos.FieldByName('diametro').AsFloat;

            SKU := qryProdutos.FieldByName('produto').AsString;
            Categoria := ''; //qryProdutos.FieldByName('Categoria').AsString;

            vListaProdutos := vListaProdutos + qryProdutos.FieldByName('produto').asString
          end;

          qryProdutos.Next;

          if not qryProdutos.eof then
            vListaProdutos := vListaProdutos + ', ';

        end;


        mRetFrenet.Clear;

        if not Frenet.CotarFrete then
          mRetFrenet.Lines.Add('ERRO: '+Frenet.msgerro );

        // Ler Cotacoes
        LerRetorno;


        qryFretes_Isencao.MacroByName('ListaProdutos').asString := vListaProdutos;
        qryFretes_Isencao.ParamByName('filial').asFloat := fFilialBase;
        qryFretes_Isencao.ParamByName('cepdestino').asinteger := qryDocumento.fieldbyname('CepCalculoFrete').asinteger;
        qryFretes_Isencao.ParamByName('totalprodutos').asFloat := qryDocumento.fieldbyname('totalprodutos').asFloat;

        qryFretes_Isencao.close;
        qryFretes_Isencao.open;

        AdicionarFreteProprio;

        dsrcotacao.dataset := cdsCotacao;

      end;
      showmodal;
      result := frmFreteTransportadoras.ModalResult;
    end;
  end;

  freeandnil(frmFreteTransportadoras);
end;


{ TfrmFreteTransportadoras }

constructor TfrmFreteTransportadoras.Create(AOwner: TComponent);
begin
  inherited;
  if parsistema.URL_FRENET<>'' then
    Frenet.UrlConsulta := parsistema.URL_FRENET;
end;

destructor TfrmFreteTransportadoras.Destroy;
begin

  inherited;
end;

procedure TfrmFreteTransportadoras.LerRetorno;
var
  i: integer;
begin

  qryRestricoesVigilancia.MacroByName('ListadeProdutos').asString := vListaProdutos;
  qryRestricoesVigilancia.close;
  qryRestricoesVigilancia.open;

  cdSCotacao.EmptyDataSet;

  for i := 0 to Frenet.Cotacoes.Count-1 do
  begin
    if not Frenet.Cotacoes[i].Erro then
    begin
      if not qryRestricoesVigilancia.locate('nome_transportador', Frenet.Cotacoes[i].Transportador, []) then
      begin

        refazconsultapornome(qryTabela_Frete,
         ['codigo_servico','nome_transportador'],
         [Frenet.Cotacoes[i].CodigoServico,
          Frenet.Cotacoes[i].Transportador]);

        cdSCotacao.Append;

        cdSCotacao.FieldValues['CodigoTransportador'] := Frenet.Cotacoes[i].CodigoTransportador;
        cdSCotacao.FieldValues['Transportador'] := Frenet.Cotacoes[i].Transportador;
        cdSCotacao.FieldValues['PrazoEntrega'] := Frenet.Cotacoes[i].PrazoEntrega + qryTabela_Freteprazo_expedicao.asinteger;
        cdSCotacao.FieldValues['Mensagem'] := Frenet.Cotacoes[i].Mensagem;
        cdSCotacao.FieldValues['CodigoServico'] := Frenet.Cotacoes[i].CodigoServico;
        cdSCotacao.FieldValues['DescricaoServico'] := Frenet.Cotacoes[i].DescricaoServico;
        cdSCotacao.FieldValues['Valor'] := Frenet.Cotacoes[i].Valor;
        cdSCotacao.FieldValues['PrazoEntregaOriginal'] := Frenet.Cotacoes[i].PrazoEntregaOriginal;
        cdSCotacao.FieldValues['ValorOriginal'] := Frenet.Cotacoes[i].ValorOriginal;

        cdSCotacao.FieldValues['TempoResposta'] := Frenet.Cotacoes[i].TempoResposta;
        cdSCotacao.Fieldbyname('origem').asString := 'FRENET';


        // Erro nesta cotaçao - nao retornou valor de frete
        if Frenet.Cotacoes[i].Erro then
          cdSCotacao.FieldValues['Erro'] := 'ERRO: '+Frenet.Cotacoes[i].mensagem;

        cdSCotacao.Post;

      end;
    end;
  end;

end;

procedure TfrmFreteTransportadoras.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Canclose := (modalresult = mrOk) or (modalresult = mrCancel);
end;

function TfrmFreteTransportadoras.VerificarFornecedor: boolean;
begin
  result := false;
  if cdsCotacao.recordcount <> 0 then
  begin

    if cdsCotacao.fieldbyname('origem').asString = 'FRENET' then
    begin
      if cdsCotacao.fieldbyname('erro').asString <> '' then
      begin
        MensagemErro(cdsCotacao.fieldbyname('erro').asString);
        result := false;
      end
      else
      begin

        refazconsultapornome(qryTabela_Frete,
               ['codigo_servico','nome_transportador'],
               [cdsCotacao.fieldbyname('CodigoServico').asString,
                cdsCotacao.fieldbyname('Transportador').asString]);

        result := qryTabela_Frete.recordcount = 1;

        if not result then
        begin
          if qryTabela_Frete.recordcount > 1 then
            MensagemErro(format('O código de Serviço: ''%s'' da transportadora: ''%s'' está vinculado a mais de uma tabela_frete',
            [cdsCotacao.fieldbyname('CodigoServico').asString, cdsCotacao.fieldbyname('Transportador').asString]))
          else
            MensagemErro(format('O código de Serviço: ''%s'' da transportadora: ''%s'' não está vinculado a uma tabela_frete',
            [cdsCotacao.fieldbyname('CodigoServico').asString, cdsCotacao.fieldbyname('Transportador').asString]));
        end
        else
        begin
          if tipo = 'Orçamento' then
          begin
            if qryDocumento.readonly then
            begin
              MensagemAviso('O orçamento está no modo ''somente leitura'' e não pode ser gravado.');
              result := false;
            end
            else
            begin
              qryDocumento.edit;
              qryDocumento.fieldbyname('fornecedorfrete').asInteger := qryTabela_Frete.fieldbyname('fornecedor').asinteger;
              qryDocumento.fieldbyname('frete').asCurrency := cdsCotacao.fieldbyname('Valor').asCurrency;
              qryDocumento.fieldbyname('frete_servico').asString := cdsCotacao.fieldbyname('DescricaoServico').asString;
              qryDocumento.fieldbyname('frete_mensagem').asString := cdsCotacao.fieldbyname('Mensagem').asString;
              qryDocumento.fieldbyname('frete_prazo_entrega').asinteger := cdsCotacao.fieldbyname('PrazoEntrega').asinteger;

              if qryDocumento.findfield('codigotabela_frete')<>nil then
                qryDocumento.fieldbyname('codigotabela_frete').asinteger := qryTabela_Frete.fieldbyname('codigo').asinteger;

            end;
          end
          else
          if tipo = 'Contratos' then
          begin
            if qryDocumento.readonly then
            begin
              MensagemAviso('O contrato está no modo ''somente leitura'' e não pode ser gravado.');
              result := false;
            end
            else
            begin
              qryDocumento.edit;
              qryDocumento.fieldbyname('fornecedorfrete').asInteger := qryTabela_Frete.fieldbyname('fornecedor').asinteger;
              qryDocumento.fieldbyname('frete').asCurrency := cdsCotacao.fieldbyname('Valor').asCurrency;
              qryDocumento.fieldbyname('frete_servico').asString := cdsCotacao.fieldbyname('DescricaoServico').asString;
              qryDocumento.fieldbyname('frete_mensagem').asString := cdsCotacao.fieldbyname('Mensagem').asString;
              qryDocumento.fieldbyname('frete_prazo_entrega').asinteger := cdsCotacao.fieldbyname('PrazoEntrega').asinteger;

              if qryDocumento.findfield('codigotabela_frete')<>nil then
                qryDocumento.fieldbyname('codigotabela_frete').asinteger := qryTabela_Frete.fieldbyname('codigo').asinteger;
            end;
          end;
        end;
      end;
    end
    else
    if cdsCotacao.fieldbyname('origem').asString = 'FRETE PRÓPRIO' then
    begin
      if cdsCotacao.fieldbyname('erro').asString <> '' then
      begin
        MensagemErro(cdsCotacao.fieldbyname('erro').asString);
        result := false;
      end
      else
      begin

        if tipo = 'Orçamento' then
        begin
          if qryDocumento.readonly then
          begin
            MensagemAviso('O orçamento está no modo ''somente leitura'' e não pode ser gravado.');
            result := false;
          end
          else
          begin
            result := True;
            qryDocumento.edit;
            if cdsCotacao.fieldbyname('fornecedorfrete').asinteger <> 0 then
              qryDocumento.fieldbyname('fornecedorfrete').asInteger := cdsCotacao.fieldbyname('fornecedorfrete').asinteger;

            qryDocumento.fieldbyname('frete').asCurrency := cdsCotacao.fieldbyname('Valor').asCurrency;
            qryDocumento.fieldbyname('frete_servico').asString := cdsCotacao.fieldbyname('DescricaoServico').asString;
            qryDocumento.fieldbyname('frete_mensagem').asString := cdsCotacao.fieldbyname('Mensagem').asString;
            qryDocumento.fieldbyname('frete_prazo_entrega').asinteger := cdsCotacao.fieldbyname('PrazoEntrega').asinteger;

            if qryDocumento.findfield('codigofretes_isencao')<>nil then
              qryDocumento.fieldbyname('codigofretes_isencao').asinteger := cdsCotacao.fieldbyname('codigofretes_isencao').asinteger;

            if qryDocumento.findfield('codigotabela_frete')<>nil then
              qryDocumento.fieldbyname('codigotabela_frete').asinteger := cdsCotacao.fieldbyname('codigotabela_frete').asinteger;

          end;
        end
        else
        if tipo = 'Contratos' then
        begin
          if qryDocumento.readonly then
          begin
            MensagemAviso('O contrato está no modo ''somente leitura'' e não pode ser gravado.');
            result := false;
          end
          else
          begin
            result := True;          
            qryDocumento.edit;
            if cdsCotacao.fieldbyname('fornecedorfrete').asinteger <> 0 then
              qryDocumento.fieldbyname('fornecedorfrete').asInteger := cdsCotacao.fieldbyname('fornecedorfrete').asinteger;

            qryDocumento.fieldbyname('frete').asCurrency := cdsCotacao.fieldbyname('Valor').asCurrency;
            qryDocumento.fieldbyname('frete_servico').asString := cdsCotacao.fieldbyname('DescricaoServico').asString;
            qryDocumento.fieldbyname('frete_mensagem').asString := cdsCotacao.fieldbyname('Mensagem').asString;
            qryDocumento.fieldbyname('frete_prazo_entrega').asinteger := cdsCotacao.fieldbyname('PrazoEntrega').asinteger;

            if qryDocumento.findfield('codigofretes_isencao')<>nil then
              qryDocumento.fieldbyname('codigofretes_isencao').asinteger := cdsCotacao.fieldbyname('codigofretes_isencao').asinteger;

            if qryDocumento.findfield('codigotabela_frete')<>nil then
              qryDocumento.fieldbyname('codigotabela_frete').asinteger := cdsCotacao.fieldbyname('codigotabela_frete').asinteger;
          end;
        end;

      end;
    end;
  end
  else
    MensagemErro('Nenhum serviço de transporte encontrado');
end;

procedure TfrmFreteTransportadoras.bbnOKClick(Sender: TObject);
begin
  if VerificarFornecedor then
    modalresult := mrOK
  else
    modalresult := mrNone;
end;

initialization
   AcionarTelaFreteTransportadoras :=  AcionarTelaFreteTransportadoras_;

end.
