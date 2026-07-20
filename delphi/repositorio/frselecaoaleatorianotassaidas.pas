unit frselecaoaleatorianotassaidas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frselecaoaleatoria, DB, frconsultacodigo, cpdbfindcontrols, ctconstantes, biblio,
  ExtCtrls, StdCtrls, Mask;

type
  Tfraselecaoaleatorianotassaidas = class(TFrame)
    fraselecaoaleatorianotassaidas: TfraSelecaoAleatoria;
    pnlParametros: TPanel;
    gbxPesquisaNFe: TGroupBox;
    edtNFE: TMaskEdit;
    procedure fraselecaoaleatorianotassaidasqrySelecaoAleatoriaAfterOpen(
      DataSet: TDataSet);
    procedure fraselecaoaleatorianotassaidasqrySelecaoAleatoriaNewRecord(
      DataSet: TDataSet);
    procedure fraselecaoaleatorianotassaidasdbgSelecaoAleatoriaDblClick(
      Sender: TObject);
    procedure fraselecaoaleatorianotassaidassbnProcuraClick(Sender: TObject);
    procedure fraselecaoaleatorianotassaidasdbgSelecaoAleatoriaKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtNFEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function GetListaCondicional: String;
    procedure AtribuirDadosnotas(Found: Boolean);
    procedure AcionarPesquisaGrade;
    procedure LocalizarNfe(chv_nfe: String);


    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    property ListaCondicional: String read GetListaCondicional;
    procedure AdicionarListaporDadoFiscal(ListaDadosFiscais: String);

  end;

implementation

uses frconsulta;

{$R *.dfm}

procedure Tfraselecaoaleatorianotassaidas.fraselecaoaleatorianotassaidasqrySelecaoAleatoriaAfterOpen(
  DataSet: TDataSet);
begin
  with fraselecaoaleatorianotassaidas do
  begin
    qrySelecaoAleatoria.FieldByName('codigo').DisplayLabel := 'Código';
    qrySelecaoAleatoria.FieldByName('codigo').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('tipo').DisplayLabel := 'T';
    qrySelecaoAleatoria.FieldByName('tipo').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('descricao').DisplayLabel := 'Nome do Cliente';
    qrySelecaoAleatoria.FieldByName('descricao').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('serie').DisplayLabel := 'Série';
    qrySelecaoAleatoria.FieldByName('serie').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('numeronota').DisplayLabel := 'Número';
    qrySelecaoAleatoria.FieldByName('numeronota').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('operacao').DisplayLabel := 'Op';
    qrySelecaoAleatoria.FieldByName('operacao').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('chv_nfe').DisplayLabel := 'Chave';
    qrySelecaoAleatoria.FieldByName('chv_nfe').ReadOnly := true;

    qrySelecaoAleatoria.FieldByName('valornota').DisplayLabel := 'Valor';
    qrySelecaoAleatoria.FieldByName('chv_nfe').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('opcomparacao').DisplayLabel := 'Comparação';
    qrySelecaoAleatoria.FieldByName('opcomparacao').ReadOnly := false;

    qrySelecaoAleatoria.FieldByName('oplogico').DisplayLabel := 'Lógica';
    qrySelecaoAleatoria.FieldByName('oplogico').ReadOnly := false;

    qrySelecaoAleatoria.Append;
    qrySelecaoAleatoria.Post;
  end;

end;

procedure Tfraselecaoaleatorianotassaidas.fraselecaoaleatorianotassaidasqrySelecaoAleatoriaNewRecord(
  DataSet: TDataSet);
begin
  with fraselecaoaleatorianotassaidas do
  begin
    qrySelecaoAleatoria.FieldByName('campo').asString := 'dadofiscal';
    qrySelecaoAleatoria.FieldByName('opcomparacao').asString := '= Igual a';
    qrySelecaoAleatoria.FieldByName('oplogico').asString := 'ou';
  end;
end;

procedure Tfraselecaoaleatorianotassaidas.fraselecaoaleatorianotassaidasdbgSelecaoAleatoriaDblClick(
  Sender: TObject);
begin
//  if (fraselecaoaleatorianotassaidas.dbgSelecaoAleatoria.SelectedField = fraselecaoaleatorianotassaidas.qrySelecaoAleatoria.FieldByName('codigo')) then
    acionarPesquisaGrade;

end;

procedure Tfraselecaoaleatorianotassaidas.fraselecaoaleatorianotassaidassbnProcuraClick(
  Sender: TObject);
begin
  AcionarPesquisaGrade;

end;

constructor Tfraselecaoaleatorianotassaidas.Create(AOwner: TComponent);
begin
  inherited;
  fraselecaoaleatorianotassaidas.pnlAbaixoDireita.visible := true;
  fraselecaoaleatorianotassaidas.PossuiCampoFilial := true;
  fraselecaoaleatorianotassaidas.PossuiCamposerie := true;
  fraselecaoaleatorianotassaidas.PossuiCamponumeronota := true;
  fraselecaoaleatorianotassaidas.PossuiCampooperacao := true;
  fraselecaoaleatorianotassaidas.PossuiCampochv_nfe := true;
//  fraselecaoaleatorianotassaidas.PossuiCampocodigonota := false;
  fraselecaoaleatorianotassaidas.PossuiCampodadofiscal := true;

  fraselecaoaleatorianotassaidas.qrySelecaoAleatoria.Sql.Text :=
    'SELECT  cast(null as char(18)) as codigo, '+
    '            cast(null as char(1)) as tipo, '+
    '            cast(null as integer) as filial, '+
    '            cast(null as varchar(50)) as descricao, '+
    '            cast(null as varchar(3)) as serie, '+
    '            cast(null as integer) as numeronota, '+
    '            cast(null as char(1)) as operacao, '+
    '            cast(null as varchar(44)) as chv_nfe, '+
    '            cast(null as numeric(11,2)) as valornota, '+
    '            cast(null as integer) as dadofiscal, '+
    '            cast(null as varchar(35)) as campo, '+
    '            cast(null as varchar(20)) as opcomparacao, '+
    '            cast(null as varchar(2)) as oplogico ';



  fraselecaoaleatorianotassaidas.CampoParaLista := 'codigo';
  fraselecaoaleatorianotassaidas.CampoParaLista2 := 'tipo';
  fraselecaoaleatorianotassaidas.CampoParaLista3 := 'serie';
  fraselecaoaleatorianotassaidas.CampoParaLista4 := 'numeronota';

  fraselecaoaleatorianotassaidas.Campo_chv_nfe := 'chv_nfe';
  fraselecaoaleatorianotassaidas.Campo_codigonota := 'dadofiscal';

  with fraselecaoaleatorianotassaidas do
  begin
    ConsultaSelecaoAleatoria := TfraConsultaCodigo.Create(self);
    ConsultaSelecaoAleatoria.Name := 'fraConsultaSelecaoAleatorianotassaidas';
    ConsultaSelecaoAleatoria.edfCodigo.MaxLength := 4;
    ConsultaSelecaoAleatoria.edfCodigo.DataSource := dsrSelecaoAleatoria;
    ConsultaSelecaoAleatoria.edfCodigo.DataField := 'dadofiscal';
    ConsultaSelecaoAleatoria.edfCodigo.Operacao := opATRIBUICAO;
    ConsultaSelecaoAleatoria.edfCodigo.LookupSource := ConsultaSelecaoAleatoria.dsrprocuraNotas;
    ConsultaSelecaoAleatoria.edfCodigo.LookupQueryParameter := 'dadofiscal';
    ConsultaSelecaoAleatoria.edfCodigo.LookupField := 'dadofiscal';
    ConsultaSelecaoAleatoria.edfCodigo.NaoExecutarLookupFound := true;
    ConsultaSelecaoAleatoria.AbrirTabelaProcura := false;
//    ConsultaSelecaoAleatoria.CondicoesdaConsulta := CondicoesFluxoGramasOperacoes;
    ConsultaSelecaoAleatoria.TipoPesquisa := pesNOTAS;
    ConsultaSelecaoAleatoria.OnFound := AtribuirDadosnotas;
//    ConsultaSelecaoAleatoria.Tiponotas := 'C';
    ConsultaSelecaoAleatoria.edfCodigo.ExibirMensagem := false;
  end;

  fraselecaoaleatorianotassaidas.UtilizarCamparacaoeLogica := true;


end;

function Tfraselecaoaleatorianotassaidas.GetListaCondicional: String;

var
 vCampo: String;

  function Conjuncao: String;
  begin
    result := '';
    if fraselecaoaleatorianotassaidas.qryselecaoaleatoria.recno <> fraselecaoaleatorianotassaidas.qryselecaoaleatoria.recordcount then
    begin
      if  fraselecaoaleatorianotassaidas.qryselecaoaleatoria.fieldbyname('oplogico').asstring = 'e' then result := 'and'
      else result := 'or';
    end;
  end;

begin

  result := '';
  with fraselecaoaleatorianotassaidas do
  begin
    if qrySelecaoAleatoria.active then
    begin

      qryselecaoaleatoria.first;
      while not qryselecaoaleatoria.eof do
      begin
        vCampo := qryselecaoaleatoria.fieldbyname('campo').asstring;

        if qryselecaoaleatoria.fieldbyname('campo').asstring =  'filial' then
          vCampo := 'filial'
        else
        if qryselecaoaleatoria.fieldbyname('campo').asstring =  'serie' then
          vCampo := 'serie'
        else
        if qryselecaoaleatoria.fieldbyname('campo').asstring =  'numero' then
           vCampo := 'numeronota';

        if vcampo = '[filial, serie, numero]' then
        begin

          if qryselecaoaleatoria.fieldbyname('filial').isnull or
             qryselecaoaleatoria.fieldbyname('serie').isnull or
             qryselecaoaleatoria.fieldbyname('numeronota').isnull  then
          begin
            dbgSelecaoAleatoria.SetFocus;
            MensagemErro('A expressão lógica esta incorreta. O contúdo dos campos ''[filial, serie, numero]'' estão incompletos.');
            abort;
          end
          else
          begin
          {incompleto...não implementado}
            result := result + '(' +

                    'codigo' + ' ' + operador(qryselecaoaleatoria.fieldbyname('opcomparacao').asstring) + ' ' +
                    quotedstr(qryselecaoaleatoria.fieldbyname(qryselecaoaleatoria.fieldbyname('campo').asstring).asstring) + ') ' +

                    Conjuncao + ' ';
            qryselecaoaleatoria.next;
          end;

        end
        else
        begin
          if qryselecaoaleatoria.fieldbyname(vCampo).isnull then
          begin
            dbgSelecaoAleatoria.SetFocus;
            vCampo := qryselecaoaleatoria.fieldbyname('campo').asString;
            if vCampo <>  'dadofiscal' then
              dbgSelecaoAleatoria.SelectedIndex := dbgSelecaoAleatoria.ColumnByName(vCampo).Index;
            MensagemErro('A expressão lógica esta incorreta. O contúdo do campo '+quotedstr(qryselecaoaleatoria.fieldbyname('campo').asstring)+ ' está vazio.');
            abort;
          end
          else
          begin
            if vCampo = 'valornota' then
              result := result +

                      ' '+qryselecaoaleatoria.fieldbyname('campo').asstring + ' ' + operador(qryselecaoaleatoria.fieldbyname('opcomparacao').asstring) + ' ' +
                      trocar(quotedstr(qryselecaoaleatoria.fieldbyname(qryselecaoaleatoria.fieldbyname('campo').asstring).asstring),',','.') + ' ' +

                      Conjuncao + ' '
            else
              result := result +

                      ' '+qryselecaoaleatoria.fieldbyname('campo').asstring + ' ' + operador(qryselecaoaleatoria.fieldbyname('opcomparacao').asstring) + ' ' +
                      quotedstr(qryselecaoaleatoria.fieldbyname(qryselecaoaleatoria.fieldbyname('campo').asstring).asstring) + ' ' +

                      Conjuncao + ' ';
            qryselecaoaleatoria.next;
          end;
        end;

      end;
    end;
  end;

  result := trocar(result, ' dadofiscal ', 'df.numero');
  result := trocar(result, ' codigo ','df.cliente');
  result := trocar(result, ' tipo ','df.tipocliente');
  result := trocar(result, ' serie ','n.serie');
  result := trocar(result, ' numeronota ','n.numero');
  result := trocar(result, ' descricao ','vf.nome');
  result := trocar(result, ' valornota ','df.valortotal');
end;

procedure Tfraselecaoaleatorianotassaidas.AtribuirDadosnotas(Found: Boolean);
begin
  with fraselecaoaleatorianotassaidas,
       fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria do
  begin

    if not qrySelecaoAleatoria.active then
    begin
      qrySelecaoAleatoria.open;
      qrySelecaoAleatoria.delete;
      qrySelecaoAleatoria.delete;
    end;

    qrySelecaoAleatoria.cancel;
    if not qryselecaoaleatoria.locate('dadofiscal',qryProcuraNotas.fieldbyname('dadofiscal').asInteger, []) then
    begin
      qrySelecaoAleatoria.append;

      qrySelecaoAleatoria.fieldByName('codigo').asInteger :=
        qryProcuraNotas.fieldbyname('filial').asInteger;

      qrySelecaoAleatoria.fieldByName('tipo').asString := 'L';

      qrySelecaoAleatoria.fieldByName('descricao').asString :=
        qryProcuraNotas.fieldbyname('nome').asString;

      qrySelecaoAleatoria.fieldByName('serie').asString :=
        qryProcuraNotas.fieldbyname('serie').asString;

      qrySelecaoAleatoria.fieldByName('numeronota').asInteger :=
        qryProcuraNotas.fieldbyname('numero').asInteger;

      qrySelecaoAleatoria.fieldByName('operacao').asString := 'S';

      qrySelecaoAleatoria.fieldByName('chv_nfe').asString :=
        qryProcuraNotas.fieldbyname('chv_nfe').asString;

      qrySelecaoAleatoria.fieldByName('dadofiscal').asInteger :=
        qryProcuraNotas.fieldbyname('dadofiscal').asInteger;

      qrySelecaoAleatoria.fieldByName('valornota').asCurrency :=
        qryProcuraNotas.fieldbyname('valortotal').asCurrency;

      qrySelecaoAleatoria.Post;

    end;
  end;
end;

procedure Tfraselecaoaleatorianotassaidas.AcionarPesquisaGrade;
begin
  with fraselecaoaleatorianotassaidas do
  begin
    dbgSelecaoAleatoria.SetFocus;
    ConsultaSelecaoAleatoria.CtrlOn := True;
    ConsultaSelecaoAleatoria.InternoPesquisar('Notas de Saída');
    dbgSelecaoAleatoria.SetFocus;
    dbgSelecaoAleatoria.SelectedIndex :=  0;
  end;
end;

procedure Tfraselecaoaleatorianotassaidas.fraselecaoaleatorianotassaidasdbgSelecaoAleatoriaKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
//                     if (fraselecaoaleatorianotassaidas.dbgSelecaoAleatoria.SelectedField = fraselecaoaleatorianotassaidas.qrySelecaoAleatoria.FieldByName('codigo')) then
                     begin
                       fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria.CtrlOn := Shift = [ssCtrl];
//                       if (Shift = []) or fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria.CtrlOn then
                         AcionarPesquisaGrade
                     end;
                  end;
    end;
  end;
  (*
  else
  case Key of
    VK_Return:  //if (fraselecaoaleatorianotassaidas.dbgSelecaoAleatoria.SelectedField = fraselecaoaleatorianotassaidas.qrySelecaoAleatoria.FieldByName('codigo')) then
                begin
                  fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria.edfCodigo.text := fraselecaoaleatorianotassaidas.qrySelecaoAleatoria.FieldByName('codigonota').asString;
                  fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria.edfCodigo.exist;
                  if not fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria.qryProcuraNotasPag.IsEmpty then
                    AtribuirDadosnotas
                  else
                  begin
                    key := 0;
                    fraselecaoaleatorianotassaidas.dbgSelecaoAleatoria.SelectedIndex := 0;
                    fraselecaoaleatorianotassaidas.dbgSelecaoAleatoria.SetFocus;
                  end;
                end;
  end;
  *)

end;

procedure Tfraselecaoaleatorianotassaidas.edtNFEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    if somentenumero(edtNFE.Text)<>'' then
    begin
      LocalizarNfe(somentenumero(edtNFE.Text));
      fraselecaoaleatorianotassaidas.dbgSelecaoAleatoria.SelectedIndex := 6;
      edtNFE.setfocus;
      edtNFE.selectall;
    end;

end;

procedure Tfraselecaoaleatorianotassaidas.LocalizarNfe(chv_nfe: String);
//  LerNotasCuponsIncluidos(true);
var
  vSerie, vNumeroNFE: String;

begin
  with fraselecaoaleatorianotassaidas,
       fraselecaoaleatorianotassaidas.ConsultaSelecaoAleatoria do
  begin
    if not qrySelecaoAleatoria.active or  not qrySelecaoAleatoria.Locate('chv_nfe', chv_nfe, []) then
    begin
      qryProcuraNotas.parambyname('filial').value := null;
      qryProcuraNotas.parambyname('serie').value := null;
      qryProcuraNotas.parambyname('numero').value := null;

      qryProcuraNotas.parambyname('chv_nfe').asString := chv_nfe;
      qryProcuraNotas.close;
      qryProcuraNotas.open;

      if not qryProcuraNotas.IsEmpty then
      begin

        vSerie     := copy(chv_nfe,23,3);
        vNumeroNFE := copy(chv_nfe,26,9);

        (*
        if (MensagemConfirmacao(
              format('A NFe não esta contida nesta lista. Deseja adicioná-la? ' +chr(13) +
                     'Fornecedor: ''%s'' ' + chr(13) +
                     'Série: ''%s'' '+ chr(13) +
                     'Número: %s ',
                     [qryProcuraNotasPag.fieldbyname('fornecedor').asString + '-' +
                      qryProcuraNotasPag.fieldbyname('tipofornecedor').asString+ ' '+
                      qryProcuraNotasPag.fieldbyname('razao').asString,
                      vSerie,vNumeroNFE]

                       )) =  smbOK) then
        begin

//          qrySelecaoAleatoria.Append;
        *)
          AtribuirDadosnotas(true);

//        end;
      end
      else
        MensagemAviso(ctNOTANAOENCONTRADA);
    end;

  end;

end;

procedure Tfraselecaoaleatorianotassaidas.AdicionarListaporDadoFiscal(
  ListaDadosFiscais: String);
begin

  with fraselecaoaleatorianotassaidas do
  begin
    LimparTabela(qrySelecaoAleatoria);

    ConsultaSelecaoAleatoria.qryProcuraNotas.macrobyname('SQL').asString := 'or df.numero in ('+
      ListaDadosFiscais+')';
    ConsultaSelecaoAleatoria.qryProcuraNotas.parambyname('Filial').asinteger := 0;
    ConsultaSelecaoAleatoria.qryProcuraNotas.parambyname('serie').asString := '';
    ConsultaSelecaoAleatoria.qryProcuraNotas.parambyname('Numero').asinteger := 0;
    ConsultaSelecaoAleatoria.qryProcuraNotas.parambyname('chv_nfe').asString := '';
    ConsultaSelecaoAleatoria.qryProcuraNotas.parambyname('dadofiscal').asinteger := 0;

    ConsultaSelecaoAleatoria.qryProcuraNotas.close;
    ConsultaSelecaoAleatoria.qryProcuraNotas.open;

    while not ConsultaSelecaoAleatoria.qryProcuraNotas.eof do
    begin
      AtribuirDadosnotas(true);
      ConsultaSelecaoAleatoria.qryProcuraNotas.next;
    end;
  end;

end;

end.
