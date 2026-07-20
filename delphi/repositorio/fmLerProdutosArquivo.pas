unit fmLerProdutosArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ZQuery, ZPgSqlQuery, cpquery,
  cpdatasource, Grids, DBGrids, cpdbgrid, dmtecsoft, fmcadastropadrao,
  ComCtrls, ToolWin, fmajuda, frconsulta, frconsultacodigo, cpdbfindcontrols,
  ctconstantes, ComObj, biblio, DBCtrls, cpdbmemo, fmajudabt,
  fmnavcontroles, cptexto, clusuario, dmbasico, clparametrossistema, math,
  DBClient, Provider;


type
  TfrrmLerProdutosArquivo = class(TfrmNavControles)
    gbxNomedoArquivo: TGroupBox;
    edtNomedoArquivo: TEditTexto;
    OpenDialog1: TOpenDialog;
    dbgListaProdutosdoCliente: TtecDBGrid;
    dsrProdutos: TtecDataSource;
    qryProdutos: TtecQuery;
    pnlBottom: TPanel;
    bbnOK: TBitBtn;
    bbnCancelar: TBitBtn;
    qryProdutosproduto: TLargeintField;
    qryProdutosprodutocliente: TStringField;
    qryProdutosdescricaoprodutocliente: TStringField;
    qryProdutosquantidadeprodutocliente: TFloatField;
    qryProdutosprodutovisual: TStringField;
    sbnNomedoArquivo: TSpeedButton;
    qryClientesProdutos: TtecQuery;
    qryClientesProdutoscliente: TIntegerField;
    qryClientesProdutostipocliente: TStringField;
    qryClientesProdutosproduto: TLargeintField;
    qryClientesProdutosproduto_cliente: TStringField;
    qryClientesProdutosprodutovisual: TStringField;
    gbxVendedor: TGroupBox;
    fraConsultaVendedor: TfraConsultaCodigo;
    gbxCliente: TGroupBox;
    fraConsultaCliente: TfraConsultaCodigo;
    pnlTop: TPanel;
    dbgDocumentos: TtecDBGrid;
    dsrDocumento: TtecDataSource;
    qryDocumento: TtecQuery;
    qryDocumentodocumento: TStringField;
    qryDocumentocliente: TStringField;
    qryProdutosdocumento: TStringField;
    pnlLeft: TPanel;
    gbxObservacoes: TGroupBox;
    mmoObservacoes: TtecDBMemo;
    qryDocumentoobservacoes: TStringField;
    pnlListaProdutosdoCliente: TPanel;
    pnBootomlListaProdutosdoCliente: TPanel;
    Timer1: TTimer;
    qryClientesProdutosprocessamento: TDateTimeField;
    procedure sbnNomedoArquivo_Click(Sender: TObject);
    procedure sbnNomedoArquivoClick(Sender: TObject);
    procedure dbgListaProdutosdoClienteDblClick(Sender: TObject);
    procedure dbgListaProdutosdoClienteKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbnOKClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  protected
    ConsultaProduto : TfraConsultaCodigo;
    procedure AtribuirDadosProdutos(Found: Boolean);
    procedure AtribuirDadosDemaisProdutos;
    procedure AcionarPesquisaGrade;
    function TodosProdutosIdentificados: boolean;
    function ExistemProdutosDuplicados: boolean;

    procedure GravarClientesProdutos;
  private
    { Private declarations }
    fTipoImportacao: tpImportacaoArquivo;
    function ImportarExcel(XLS: string) : Boolean;
    procedure RelacionarClientesProdutos;
    procedure FocarGrid(Sender: TObject);
    procedure CondicoesItemProduto;

  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property TipoImportacao: tpImportacaoArquivo read fTipoImportacao write fTipoImportacao;
  end;

var
  frrmLerProdutosArquivo: TfrrmLerProdutosArquivo;
  AcionarTelaLerArquivo: function (Owner: TComponent; Vendedor, Cliente: Integer; TipoCliente:
    String; TipoImportacao: tpImportacaoArquivo): vTtecQuery;
  dtmBasico: TdtmBasico;

implementation


{$R *.dfm}


function AcionarTelaLerArquivo_(Owner: TComponent; Vendedor, Cliente: Integer; TipoCliente: String;  TipoImportacao: tpImportacaoArquivo):
   vTtecQuery;
begin
  if not assigned(frrmLerProdutosArquivo) or (frrmLerProdutosArquivo.Owner <> Owner) then
  begin

    result := nil;

    if assigned(frrmLerProdutosArquivo) then
      frrmLerProdutosArquivo.free;

    frrmLerProdutosArquivo := TfrrmLerProdutosArquivo.create(Owner);

    if vendedor <> 0 then
    begin
      frrmLerProdutosArquivo.fraConsultaVendedor.edfcodigo.text := inttostr(vendedor);
      frrmLerProdutosArquivo.fraConsultaVendedor.edfcodigo.exist;
      frrmLerProdutosArquivo.fraConsultaVendedor.enabled := true;
    end
    else
    if usuariologin.vendedor then
    begin
      frrmLerProdutosArquivo.fraConsultaVendedor.edfcodigo.text := inttostr(usuariologin.codigousuario);
      frrmLerProdutosArquivo.fraConsultaVendedor.edfcodigo.exist;
      frrmLerProdutosArquivo.fraConsultaVendedor.enabled := false;
    end;

    if cliente <> 0 then
    begin
      frrmLerProdutosArquivo.fraConsultaCliente.qryProcuraCliente.parambyname('codigo').asinteger := cliente;
      frrmLerProdutosArquivo.fraConsultaCliente.qryProcuraCliente.parambyname('tipocliente').asstring := tipocliente;
      frrmLerProdutosArquivo.fraConsultaCliente.edfcodigo.text := inttostr(cliente);
      frrmLerProdutosArquivo.fraConsultaCliente.edfcodigo.exist;
    end;

    if frrmLerProdutosArquivo.fraConsultaVendedor.enabled then
      frrmLerProdutosArquivo.activeControl := frrmLerProdutosArquivo.fraConsultaVendedor.edfCodigo
    else
      frrmLerProdutosArquivo.activeControl := frrmLerProdutosArquivo.fraConsultaCliente.edfcodigo;


    frrmLerProdutosArquivo.Tipoimportacao := TipoImportacao;

    if tipoimportacao = OrcamentosProdDescQtde then
    begin
      frrmLerProdutosArquivo.pnlLeft.visible := true;
      frrmLerProdutosArquivo.qryProdutos.mastersource := frrmLerProdutosArquivo.dsrDocumento;
      frrmLerProdutosArquivo.gbxVendedor.visible := true;
      frrmLerProdutosArquivo.gbxCliente.enabled := true;
    end
    else
    begin
      frrmLerProdutosArquivo.qryProdutos.mastersource := nil;
      frrmLerProdutosArquivo.pnlLeft.visible := false;
      frrmLerProdutosArquivo.gbxVendedor.visible := false;
      frrmLerProdutosArquivo.gbxCliente.enabled := false;
    end;

    frrmLerProdutosArquivo.showmodal;
    if frrmLerProdutosArquivo.modalresult = mrOk then
    begin
      case tipoimportacao of
         OrcamentosProdDescQtde :
         begin
           SetLength(result, 4);
           result[0] := frrmLerProdutosArquivo.qryDocumento;
           result[1] := frrmLerProdutosArquivo.qryProdutos;
           result[2] := frrmLerProdutosArquivo.fraconsultavendedor.qryProcuraVendedores;
           result[3] := frrmLerProdutosArquivo.fraConsultaCliente.qryprocuracliente;
         end;
         ProdDescQtde :
         begin
           SetLength(result, 1);
           result[0] := frrmLerProdutosArquivo.qryProdutos;
         end;
      end;
    end
    else
    begin

      case tipoimportacao of
         OrcamentosProdDescQtde :
         begin
           SetLength(result, 4);
           result[0] := nil;
           result[1] := nil;
           result[2] := nil;
           result[3] := nil;
         end;
         ProdDescQtde :
         begin
           SetLength(result, 1);
           result[0] := nil;
         end;
      end;

    end;


  end;

//  frrmLerProdutosArquivo.Free;

end;


procedure TfrrmLerProdutosArquivo.AtribuirDadosProdutos(Found: Boolean);
begin
  qryProdutosproduto.AsString := ConsultaProduto.qryProcuraItemProdutos.FieldByName('produto').AsString;
  qryProdutosprodutovisual.AsString := ConsultaProduto.qryProcuraItemProdutos.FieldByName('produtovisual').AsString;

  AtribuirDadosDemaisProdutos;

end;

constructor TfrrmLerProdutosArquivo.Create(AOwner: TComponent);
begin
  inherited;
  dtmBasico := TdtmBasico.Create(self);

  ConsultaProduto := TfraConsultaCodigo.Create(self);
{  ConsultaProduto.parent := dbgListaProdutosdoCliente;
  ConsultaProduto.visible := false;
  ConsultaProduto.edfcodigo.visible := false;
  }
  ConsultaProduto.edfcodigo.OnExit := FocarGrid;

  ConsultaProduto.Name := 'fraConsultaProduto';
  ConsultaProduto.edfCodigo.MaxLength := 30;
  ConsultaProduto.edfCodigo.DataSource := dsrProdutos;
  ConsultaProduto.edfCodigo.DataField := 'produtovisual';
  ConsultaProduto.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaProduto.edfCodigo.LookupSource := ConsultaProduto.dsrProcuraItemProdutos;
  ConsultaProduto.edfCodigo.LookupQueryParameter := 'ProdutoVisual';
  ConsultaProduto.edfCodigo.LookupField := 'ProdutoVisual';
//  ConsultaProduto.edfCodigo.LocateParameters := 'produtovisual';
  ConsultaProduto.AbrirTabelaProcura := false;
  ConsultaProduto.CondicoesdaConsulta := CondicoesItemProduto;
  ConsultaProduto.TipoPesquisa := pesITEMPRODUTOS;
  ConsultaProduto.OnFound := AtribuirDadosProdutos;

  fraConsultaVendedor.tipopesquisa := pesVendedores;
  fraConsultaCliente.tipopesquisa := pesClientes;
  fraConsultaCliente.TipoCliente  := 'C';



end;

destructor TfrrmLerProdutosArquivo.Destroy;
begin

  qryProdutos.close;
  inherited;
  frrmLerProdutosArquivo := nil;

end;

function TfrrmLerProdutosArquivo.ImportarExcel(XLS: string): Boolean;
const
    xlCellTypeLastCell = $0000000B;

var

  XLApp, oSheet: OLEVariant;
  Linha, LinhaAtual, Previsoes, Coluna, ColunaAtual, p,
  QtdeProdutos, Planilhas, produtos, NovaLinha, ultimacoluna: integer;
  TotalProdutos: Currency;

  RangeMatrix: Variant;

  vcliente, vOrdemdeCompra, vEndereco, vProdutonoCliente, vDescricaoProdutonoCliente : String;
  vQuantidadeProdutonoCliente : Currency;


  col_Cliente,
  col_Ordem_de_Compra,
  col_Endereco,
  col_CodigoProduto,
  col_DescProd,
  col_Qtd: integer;

  vConteudocelula: String;
  vConteudo : Variant;


begin
  result := true;

  try


    XLApp:= CreateOleObject('Excel.Application');
    XLApp.visible := false;
    XLApp.Workbooks.Open(XLS);

    oSheet:= XLApp.Workbooks[ExtractFileName(XLS)].WorkSheets[1];
    oSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;


    linha := XLApp.ActiveCell.Row;
//    Coluna := XLApp.ActiveCell.Column;

    coluna := 256;

    RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[Linha, Coluna]].Value;

    qryDocumento.close;
    qryDocumento.open;
    qryDocumento.delete;

    qryProdutos.close;
    qryProdutos.open;
    qryProdutos.delete;

    LinhaAtual := 1;

    if (linha > 1) and (coluna >=3) then
    begin

      repeat

        for ColunaAtual := 1 to coluna do
        begin

          if (LinhaAtual = 1) then
          begin

            try
              case tipoimportacao of
                OrcamentosProdDescQtde :
                begin

                  vConteudocelula := uppercase(retiraacento(RangeMatrix[LinhaAtual, ColunaAtual]));

                  if (vConteudocelula = uppercase('Cliente')) then
                    col_Cliente := ColunaAtual;

                  if (vConteudocelula = uppercase('Ordem de Compra')) then
                    col_Ordem_de_Compra := ColunaAtual;

                  if (vConteudocelula = uppercase('Endereco')) then
                    col_Endereco := ColunaAtual;

                  if (vConteudocelula = uppercase('Cod Cliente')) then
                    col_CodigoProduto := ColunaAtual;

                  if (vConteudocelula = uppercase('Desc Prod')) then
                    col_DescProd := ColunaAtual;

                  if (vConteudocelula = uppercase('Qtd')) then
                    col_Qtd := ColunaAtual;

                end;

                ProdDescQtde:
                begin

                  if (uppercase(retiraacento(RangeMatrix[LinhaAtual, ColunaAtual])) = uppercase('Cod Cliente')) then
                    col_CodigoProduto := ColunaAtual;

                  if (uppercase(retiraacento(RangeMatrix[LinhaAtual, ColunaAtual])) = uppercase('Desc Prod')) then
                    col_DescProd := ColunaAtual;

                  if (uppercase(retiraacento(RangeMatrix[LinhaAtual, ColunaAtual])) = uppercase('Qtd')) then
                    col_Qtd := ColunaAtual;

                end;
              end;

            except
              begin
                case tipoimportacao of
                  OrcamentosProdDescQtde : MensagemErro('A tabela deve possuir possuir registros e titulos de colunas: Cliente, Ordem de Compra, Endereço, Cód Cliente, Desc Prod e Qtd');
                  ProdDescQtde : MensagemErro('A tabela deve possuir possuir registros e titulos de colunas: Cód Cliente, Desc Prod e Qtd');
                end;

                result := false;
                break;
              end;
            end;

          end
          else
          begin

            vConteudo := RangeMatrix[LinhaAtual, ColunaAtual];

            case tipoimportacao of
              OrcamentosProdDescQtde:
              begin
                if col_Cliente = ColunaAtual then
                begin
                  if VartoStr(vConteudo) <> '' then
                    vcliente := VartoStr(vConteudo);
                end;

                if col_Ordem_de_Compra = ColunaAtual then
                begin
                  if VartoStr(vConteudo) <> '' then
                    vOrdemdeCompra := VartoStr(vConteudo);
                end;

                if col_Endereco = ColunaAtual then
                begin
                  if VartoStr(vConteudo) <> '' then
                    vEndereco := VartoStr(vConteudo);
                end;

                if col_CodigoProduto = ColunaAtual then
                    vProdutonoCliente := VartoStr(vConteudo);

                if col_DescProd = ColunaAtual then
                    vDescricaoProdutonoCliente := VartoStr(vConteudo);

                if col_Qtd = ColunaAtual then
                begin
                  try
                    vQuantidadeProdutonoCliente := vConteudo;
                  except
                    vQuantidadeProdutonoCliente := 0;
                  end;
                end;
              end;

              ProdDescQtde:
              begin
                if col_CodigoProduto = ColunaAtual then
                    vProdutonoCliente := VartoStr(vConteudo);

                if col_DescProd = ColunaAtual then
                    vDescricaoProdutonoCliente := VartoStr(vConteudo);

                if col_Qtd = ColunaAtual then
                begin
                  try
                    vQuantidadeProdutonoCliente := vConteudo;
                  except
                    vQuantidadeProdutonoCliente := 0;
                  end;
                end;
              end;

            end;

          end;

        end;

        if  LinhaAtual <> 1 then
        begin
          if vProdutonoCliente = '' then
          begin
            vcliente := '';
            vOrdemdeCompra := '';
            vEndereco := '';
            vDescricaoProdutonoCliente := '';
            vQuantidadeProdutonoCliente := 0;
          end;

          case tipoimportacao of

            OrcamentosProdDescQtde:
            begin

              if (vOrdemdeCompra<>'') then
              begin

                if not qryDocumento.locate('documento', vOrdemdeCompra, []) then
                begin
                  qryDocumento.append;
                  qryDocumentodocumento.asString := vOrdemdeCompra;
                  qryDocumentocliente.asString := vcliente;
                  qryDocumentoobservacoes.asString := vEndereco;
                  qryDocumento.post;
                end;

                if not qryProdutos.locate('documento,produto', varArrayof([vOrdemdeCompra,vProdutonoCliente]), [])  then
                begin
                  qryProdutos.append;
                  qryProdutosdocumento.asString := vOrdemdeCompra;
                  qryProdutosprodutocliente.asString := vProdutonoCliente;
                  qryProdutosdescricaoprodutocliente.asString := vDescricaoProdutonoCliente;

                  try
                    qryProdutosquantidadeprodutocliente.asCurrency := vQuantidadeProdutonoCliente
                  except
                    qryProdutosquantidadeprodutocliente.clear;
                  end;
                  qryProdutos.post;
                end;

              end;
            end;

            ProdDescQtde:
            begin

              if (vProdutonoCliente <> '') and
                 (vDescricaoProdutonoCliente <> '') and
                 (vQuantidadeProdutonoCliente <> 0) then
              begin
                qryProdutos.append;
                qryProdutosprodutocliente.asString := vProdutonoCliente;
                qryProdutosdescricaoprodutocliente.asString := vDescricaoProdutonoCliente;
                try
                  qryProdutosquantidadeprodutocliente.asCurrency := vQuantidadeProdutonoCliente
                except
                  qryProdutosquantidadeprodutocliente.clear;
                end;
                qryProdutos.post;
              end;

            end;

          end;
        end
        else
        if (LinhaAtual = 1) then
        begin
          case tipoimportacao of
            OrcamentosProdDescQtde :
            begin

              if (col_Cliente = 0) or
                 (col_Ordem_de_Compra = 0) or
                 (col_Endereco = 0) or
                 (col_CodigoProduto = 0) or
                 (col_DescProd = 0) or
                 (col_Qtd = 0) then
              begin
                MensagemErro('A tabela deve possuir possuir registros e titulos de colunas: Cliente, Ordem de Compra, Endereço, Cód Cliente, Desc Prod e Qtd');
                result := false;
                break;
              end;
            end;

            ProdDescQtde :
            begin
              if (col_CodigoProduto = 0) or
                 (col_DescProd = 0) or
                 (col_Qtd = 0) then
              begin
                MensagemErro('A tabela deve possuir possuir registros e titulos de colunas: Cód Cliente, Desc Prod e Qtd');
                result := false;
                break;
              end;
            end;
          end;
        end;

        Inc(LinhaAtual);

        if not result then
          break;

      until LinhaAtual > Linha
    end
    else
    begin
      case tipoimportacao of
        OrcamentosProdDescQtde : MensagemErro('A tabela deve possuir possuir registros e titulos de colunas: Cliente, Ordem de Compra, Endereço, Cód Cliente, Desc Prod e Qtd');
        ProdDescQtde : MensagemErro('A tabela deve possuir possuir registros e titulos de colunas: Cód Cliente, Desc Prod e Qtd');
      end;
    end;

  finally

    if not VarIsEmpty(XLApp) then
    begin
      XLApp.Quit;
      XLApp  := Unassigned;
      oSheet :=Unassigned;
    end;

  end;
end;

procedure TfrrmLerProdutosArquivo.sbnNomedoArquivo_Click(Sender: TObject);

begin

  if OpenDialog1.execute then
  begin
    edtNomedoArquivo.text := OpenDialog1.filename;
    ImportarExcel(edtNomedoArquivo.text);
  end;

end;

procedure TfrrmLerProdutosArquivo.sbnNomedoArquivoClick(Sender: TObject);
begin
  inherited;
  if (fraConsultaVendedor.edfcodigo.text <> '') and fraConsultaVendedor.edfcodigo.exist then
  begin
    if (fraConsultaCliente.edfcodigo.text <> '') and fraConsultaCliente.edfcodigo.exist then
    begin
      if OpenDialog1.execute then
      begin
        edtNomedoArquivo.text := OpenDialog1.filename;
        if ImportarExcel(edtNomedoArquivo.text) then
          RelacionarClientesProdutos;
      end;
    end
    else
    begin
      MensagemAviso('Indique o cliente para continuar com a operação.');
      fraConsultaCliente.edfcodigo.setfocus;
    end;
 end
 else
 begin
    MensagemAviso('Indique o vendedor para continuar com a operação.');
    fraConsultavendedor.edfcodigo.setfocus;
 end;

end;

procedure TfrrmLerProdutosArquivo.dbgListaProdutosdoClienteDblClick(
  Sender: TObject);
begin
  inherited;
  acionarPesquisaGrade;
end;

procedure TfrrmLerProdutosArquivo.dbgListaProdutosdoClienteKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);

  Procedure VerificarProduto;
  begin
    if (qryProdutos.State in [dsedit,dsinsert]) or
       not (qryProdutos.IsEmpty) then

    case dbgListaProdutosdoCliente.SelectedIndex of
    0: begin
          if (qryProdutos.State in [dsedit,dsinsert]) then
            qryProdutos.post;

//          ConsultaProduto.edfCodigo.Parent :=
          ConsultaProduto.edfCodigo.DoExit;
          if ConsultaProduto.qryProcuraItemProdutos.IsEmpty then
          begin
            if not (qryProdutos.State in [dsedit, dsinsert]) then
              qryProdutos.Edit;
            qryProdutosproduto.Clear;
            qryProdutosprodutovisual.Clear;
            qryProdutos.post;
            
            AtribuirDadosDemaisProdutos;

            dbgListaProdutosdoCliente.SetFocus;
            dbgListaProdutosdoCliente.SelectedIndex := 0;
          end
          else
          begin
            if not (qryProdutos.State in [dsedit, dsinsert]) then
              qryProdutos.Edit;

            AtribuirDadosProdutos(true);

            if (qryProdutos.State in [dsedit, dsinsert]) then
              qryProdutos.post;

            dbgListaProdutosdoCliente.SetFocus;
            dbgListaProdutosdoCliente.SelectedIndex := 0;
          end;


       end;
    end;
  end;

begin
  inherited;
  if Shift = [ssCtrl] then
  begin
    case Key of
      VK_F9     : begin
                     ConsultaProduto.CtrlOn := Shift = [ssCtrl];
                     if (Shift = []) or ConsultaProduto.CtrlOn then
                       AcionarPesquisaGrade
                   end;
    end;
  end
  else
  case Key of
    VK_Return: VerificarProduto;

    VK_UP,
    VK_DOWN,
    VK_PRIOR,
    VK_NEXT: begin
                if (qryProdutosproduto.isnull or qryProdutosprodutovisual.isnull) and (qryProdutos.state = dsedit) then
                begin
                  qryProdutos.edit;
                  qryProdutos.CheckRequiredFields;
                  key := 0;
                end;
              end;

    VK_ESCAPE : begin
                   qryProdutos.cancel;
                   if dbgListaProdutosdoCliente.Focused then
                   begin
                     dbgListaProdutosdoCliente.SetFocus;
                     dbgListaProdutosdoCliente.SelectedIndex := 0;
                   end;
                 end;

  end;
end;

procedure TfrrmLerProdutosArquivo.AcionarPesquisaGrade;
begin
  if not qryProdutos.ReadOnly then
  begin
    ConsultaProduto.CtrlOn := True;
    dbgListaProdutosdoCliente.SetFocus;
    case dbgListaProdutosdoCliente.SelectedIndex of
      0: begin
           case ConsultaProduto.InternoPesquisar(ctPRODUTO) of
           mrOk   : begin
                      dbgListaProdutosdoCliente.SetFocus;
                      dbgListaProdutosdoCliente.selectedIndex := 0;
                    end;
           mrCancel: begin
                      dbgListaProdutosdoCliente.SetFocus;
                      dbgListaProdutosdoCliente.SelectedIndex :=  2;
                    end;
           end
         end;
    end;
  end;
end;

procedure TfrrmLerProdutosArquivo.RelacionarClientesProdutos;
begin

  if tipoimportacao = OrcamentosProdDescQtde then
    qryProdutos.mastersource := nil;

  qryClientesProdutos.macrobyname('ListadeProdutos').asString := 'and cp.produto_cliente in ('+
                       RetornarLista(qryProdutos, qryProdutosprodutocliente, nil, true)+') and p.inativo is null AND (estoques_preco(p.codigo, :FilialBase) > 0) ';

  RefazConsultaPorNome(qryClientesProdutos, ['cliente', 'tipocliente', 'FilialBase'],
                         [fraConsultaCliente.qryProcuraClientecodigo.asinteger,
                          fraConsultaCliente.qryProcuraClientetipo.asString,
                          ifthen(dtmbasico.TipoFilial<>'V', dtmbasico.FilialBase, dtmbasico.FilialBasedaVirtual)
                          ]);


  qryProdutos.disablecontrols;
  qryProdutos.first;
  while not qryProdutos.eof do
  begin

    if qryClientesProdutos.locate('produto_cliente', qryProdutosprodutocliente.asString, []) then
    begin
      qryprodutos.edit;
      qryprodutosproduto.asstring       := qryClientesProdutosproduto.asString;
      qryProdutosprodutovisual.asString := qryClientesProdutosprodutovisual.asString;
      qryprodutos.post;
    end;

    qryProdutos.next;

  end;

  qryProdutos.enablecontrols;
  
  if tipoimportacao = OrcamentosProdDescQtde then
    qryProdutos.mastersource := dsrDocumento;

end;

procedure TfrrmLerProdutosArquivo.FocarGrid(Sender: TObject);
begin
  dbgListaProdutosdoCliente.setfocus;
end;


procedure TfrrmLerProdutosArquivo.CondicoesItemProduto;
const
  SQLOrcamento = 'and p.inativo is null AND (estoques_preco(p.codigo, :FilialBase) > 0)';
{
        'and (case when :ConsiderarMarkupClientes then(estoques_preco(p.codigo, :FilialPreco, (coalesce(:markup,0))) > 0) '  +
                 ' when :ConsiderarMarkupcargos then (estoques_preco(p.codigo, :FilialBase, (coalesce(:MarkupCargos,0))) >0) ' +
                 ' else (estoques_preco(p.codigo, :FilialBase) > 0) end) ';
}
begin

  ConsultaProduto.qryProcuraItemProdutos.MacroByName('SQLFiltroItemProdutos').AsString := SQLOrcamento;
  ConsultaProduto.qryConsultaItemProdutos.MacroByName('SQLFiltroItemProdutos').AsString := SQLOrcamento;

//  ConsultaProduto.qryProcuraItemProdutos.parambyName('considerarMarkupClientes').asboolean := ParSistema.ConsiderarMarkupClientes;
//  ConsultaProduto.qryConsultaItemProdutos.parambyName('considerarMarkupClientes').asboolean := ParSistema.ConsiderarMarkupClientes;

//  ConsultaProduto.qryProcuraItemProdutos.parambyName('FilialPreco').asInteger := ifthen(dtmbasico.TipoFilial<>'V', FilialBase, dtmbasico.FilialBasedaVirtual);
//  ConsultaProduto.qryConsultaItemProdutos.parambyName('FilialPreco').asInteger := ifthen(TipoFilial<>'V', FilialBase, FilialBasedaVirtual);

//  ConsultaProduto.qryProcuraItemProdutos.parambyName('markup').asCurrency :=  fraConsultaCliente.qryProcuraClientemarkup.ascurrency;
//  ConsultaProduto.qryConsultaItemProdutos.parambyName('markup').asCurrency := fraConsultaCliente.qryProcuraClientemarkup.ascurrency;

//  ConsultaProduto.qryProcuraItemProdutos.parambyName('markupcargos').asCurrency :=
//  ConsultaProduto.qryConsultaItemProdutos.parambyName('markupcargos').asCurrency :=

//  ConsultaProduto.qryProcuraItemProdutos.parambyName('ConsiderarMarkupcargos').asboolean := ParSistema.PrecosporCargo;
//  ConsultaProduto.qryConsultaItemProdutos.parambyName('ConsiderarMarkupcargos').asboolean := ParSistema.PrecosporCargo;

  ConsultaProduto.qryProcuraItemProdutos.parambyName('FilialBase').asInteger := ifthen(dtmbasico.TipoFilial<>'V', dtmbasico.FilialBase, dtmbasico.FilialBasedaVirtual);
  ConsultaProduto.qryConsultaItemProdutos.parambyName('FilialBase').asInteger := ifthen(dtmbasico.TipoFilial<>'V', dtmbasico.FilialBase, dtmbasico.FilialBasedaVirtual);

end;


procedure TfrrmLerProdutosArquivo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  If key = VK_RETURN then
  Begin
//    Key:= #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;

end;

procedure TfrrmLerProdutosArquivo.AtribuirDadosDemaisProdutos;
var
  vRegistroDocumento, vRegistroProduto : tBookMark;
  vcodigoProduto, vCodigoVisual, vProdutoCliente : String;
begin

  vcodigoProduto := qryProdutosproduto.asString;
  vCodigoVisual := qryProdutosprodutovisual.asString;
  vProdutoCliente := qryProdutosprodutocliente.asString;

  case TipoImportacao of
    OrcamentosProdDescQtde:
    begin
      vRegistroDocumento := qryDocumento.getBookMark;
      vRegistroProduto := qryProdutos.getBookMark;

      qryprodutos.mastersource := nil;

      AtribuirDados(qryProdutos, [qryProdutosproduto, qryProdutosprodutovisual],
                                 [vcodigoProduto, vCodigoVisual],
                                 [qryProdutosprodutocliente],
                                 [vProdutoCliente],
                                 ['='], true, false);

      qryProdutos.mastersource := dsrDocumento;

      qryDocumento.gotoBookMark(vRegistroDocumento);
      qryProdutos.gotoBookMark(vRegistroProduto);

      qryDocumento.FreeBookMark(vRegistroDocumento);
      qryProdutos.FreeBookMark(vRegistroProduto);

    end;

    ProdDescQtde:
    begin
      vRegistroProduto := qryProdutos.getBookMark;

      AtribuirDados(qryProdutos, [qryProdutosproduto, qryProdutosprodutovisual],
                                 [vcodigoProduto, vCodigoVisual],
                                 [qryProdutosprodutocliente],
                                 [vProdutoCliente],
                                 ['='], true, false);
      qryProdutos.gotoBookMark(vRegistroProduto);
      qryProdutos.FreeBookMark(vRegistroProduto);

    end;

  end;

end;

procedure TfrrmLerProdutosArquivo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if not (ModalResult = mrCancel) then
  begin
    CanClose := TodosProdutosIdentificados;
    if canclose then
    begin
      self.oncloseQuery := nil;
      modalresult := mrOk;
      close;

    end
    else
      modalresult := mrNone;
  end
  else
  begin
   self.oncloseQuery := nil;
   GravarClientesProdutos;
   close;
  end;

end;

function TfrrmLerProdutosArquivo.TodosProdutosIdentificados: boolean;
var
  vdocumento, vproduto, vProdutocliente : String;

begin
  result := true;

  if qryDocumento.active or
     qryProdutos.active then
  begin

    case TipoImportacao of
      OrcamentosProdDescQtde:
      begin

        qryprodutos.mastersource := nil;
        qryDocumento.disablecontrols;
        qryprodutos.disablecontrols;

        if qryprodutos.locate('produto', '', []) or
           qryprodutos.locate('produto', null, []) then
        begin
          result := false;
          vdocumento := qryprodutosdocumento.asstring;
          vproduto := qryProdutosproduto.asstring;
          vprodutocliente := qryProdutosprodutocliente.asString;
        end;

        qryProdutos.mastersource := dsrDocumento;
        qryDocumento.enablecontrols;
        qryprodutos.enablecontrols;

        qryDocumento.first;
        qryprodutos.first;


        if not result then
        begin
          if qrydocumento.locate('documento',vdocumento,[]) then
            if qryprodutos.locate('documento,produtocliente', VarArrayof([vdocumento,vprodutocliente]),[]) then
               MensagemAviso('Este ítem não está identificado')
        end;


      end;

      ProdDescQtde:
      begin
        qryprodutos.disablecontrols;
        if qryprodutos.locate('produto', '', []) or
           qryprodutos.locate('produto', null, []) then
        begin
          result := false;
          vdocumento := qryprodutosdocumento.asstring;
          vproduto := qryProdutosproduto.asstring;
          vprodutocliente := qryProdutosprodutocliente.asString;
        end;

        qryprodutos.enablecontrols;
        qryprodutos.first;

        if not result then
          if qryprodutos.locate('documento,produtocliente', VarArrayof([vdocumento,vprodutocliente]),[]) then
             MensagemAviso('Este ítem não está identificado');

      end;

    end;
  end;

  if result then
  begin
    if not ExistemProdutosDuplicados then
      GravarClientesProdutos
    else
      result := false;
  end

end;

procedure TfrrmLerProdutosArquivo.bbnOKClick(Sender: TObject);
var
  vCanclose : boolean;
begin
  inherited;
  FormCloseQuery(self, vCanClose);
  if vCanClose then
    modalresult := mrOk;
end;

procedure TfrrmLerProdutosArquivo.Timer1Timer(Sender: TObject);
begin
  inherited;
  if (dbgListaProdutosdoCliente.SelectedField = qryProdutosprodutovisual) then
    pnBootomlListaProdutosdoCliente.caption := 'Pressione CTRL+F9 para pesquisar'
  else
    pnBootomlListaProdutosdoCliente.caption := '';

end;

procedure TfrrmLerProdutosArquivo.GravarClientesProdutos;

  procedure Gravar(vListaProdutos_Cliente: String);
  begin

    if vListaProdutos_Cliente <> '' then
    begin
      qryClientesProdutos.macrobyname('ListadeProdutos').asString := 'and cp.produto in ('+
                           vListaProdutos_Cliente+')';

      RefazconsultaPorNome(qryClientesProdutos, ['cliente','tipocliente'], [fraConsultaCliente.qryProcuraClientecodigo.asinteger,
                          fraConsultaCliente.qryProcuraClientetipo.asString]);

      qryprodutos.first;
      while not qryprodutos.eof do
      begin

        if not qryProdutosprodutocliente.isnull and not qryProdutosproduto.isnull then
        begin
          if not qryClientesProdutos.locate('produto', qryProdutosproduto.asString, []) then
          begin
            qryClientesProdutos.append;
            qryClientesProdutoscliente.asinteger :=  fraConsultaCliente.qryProcuraClientecodigo.asinteger;
            qryClientesProdutostipocliente.asString := fraConsultaCliente.qryProcuraClientetipo.asString;
            qryClientesProdutosproduto.asString := qryProdutosproduto.asstring;
            qryClientesProdutosproduto_cliente.asString := qryProdutosprodutocliente.asString;
            qryClientesProdutosprocessamento.asDateTime := dtmBasico.dataHoraservidor;
  //          qryClientesProdutosdataultimoorcamento.asDateTime :=  dtmbasico.dataServidor;
            qryClientesProdutos.post;
          end
          else
          begin
  //          if (qryClientesProdutosproduto_cliente.asString <> qryProdutosprodutocliente.asString) then
            begin
              qryClientesProdutos.edit;
              qryClientesProdutosproduto_cliente.asString := qryProdutosprodutocliente.asString;
              qryClientesProdutosprocessamento.asDateTime := dtmBasico.dataHoraservidor;
              qryClientesProdutos.post;
            end;
          end;
        end;
        qryprodutos.next;
      end;

      dtmbasico.perpetrar([qryClientesProdutos]);
    end;
  end;

begin
  if qryDocumento.active or
     qryProdutos.active then
  begin
    case TipoImportacao of
      OrcamentosProdDescQtde:
      begin

        qryprodutos.mastersource := nil;
        qryprodutos.disablecontrols;

        Gravar(RetornarLista(qryProdutos, qryProdutosproduto, nil, true));

        qryProdutos.mastersource := dsrDocumento;
        qryprodutos.enablecontrols;

      end;

      ProdDescQtde:
      begin
        qryprodutos.disablecontrols;
        Gravar(RetornarLista(qryProdutos, qryProdutosproduto, nil, true));
        qryprodutos.enablecontrols;
      end;

    end;
  end;


end;

function TfrrmLerProdutosArquivo.ExistemProdutosDuplicados: boolean;
var
  vdocumento, vproduto, vProdutocliente : String;
  vrecno : integer;

begin
  result := false;


  if qryDocumento.active or
     qryProdutos.active then
  begin

    case TipoImportacao of
      OrcamentosProdDescQtde:
      begin

        qryprodutos.mastersource := nil;
        qryprodutos.disablecontrols;
        qryprodutos.sortbyfield('produto,produtocliente');

        qryprodutos.first;

        while not qryprodutos.eof do
        begin
          vdocumento := qryprodutosdocumento.asstring;
          vproduto := qryProdutosproduto.asstring;
          vprodutocliente := qryProdutosprodutocliente.asString;
          vRecno := qryProdutos.recno;

          repeat

            if (qryprodutos.recno <> vRecno) then
              if vproduto = qryprodutosproduto.asstring then
                if vprodutocliente <> qryProdutosprodutocliente.asString then
                begin
                  result := true;
                  break;
                end;

            qryprodutos.next;

          until (vproduto <> qryprodutosproduto.asstring) or qryprodutos.eof;

          if result then
            break
            {
          else
          begin
            qryprodutos.locate('documento,produto,produtocliente', VarArrayof([vdocumento,vproduto,vprodutocliente]),[]);
            qryprodutos.next;
          end;
          }
        end;

        qryProdutos.mastersource := dsrDocumento;
        qryprodutos.enablecontrols;

        if result then
          if qrydocumento.locate('documento',vdocumento,[]) then
            qryprodutos.locate('documento,produto,produtocliente', VarArrayof([vdocumento,vproduto,vprodutocliente]),[]);


      end;

      ProdDescQtde:
      begin
        qryprodutos.disablecontrols;
        qryprodutos.first;

        while not qryprodutos.eof do
        begin
          vdocumento := qryprodutosdocumento.asstring;
          vproduto := qryProdutosproduto.asstring;
          vprodutocliente := qryProdutosprodutocliente.asString;
          vRecno := qryProdutos.recno;

          repeat

            if (qryprodutos.recno <> vRecno) then
              if vproduto = qryprodutosproduto.asstring then
                if vprodutocliente <> qryProdutosprodutocliente.asString then
                begin
                  result := true;
                  break;
                end;

            qryprodutos.next;

          until (vproduto <> qryprodutosproduto.asstring) or qryprodutos.eof;

          if result then
            break
            {
          else
          begin
            qryprodutos.locate('documento,produto,produtocliente', VarArrayof([vdocumento,vproduto,vprodutocliente]),[]);
            qryprodutos.next;
          end;
          }
        end;

        qryprodutos.enablecontrols;

        if result then
          qryprodutos.locate('documento,produto,produtocliente', VarArrayof([vdocumento,vproduto,vprodutocliente]),[]);

      end;

    end;
  end;

  if result then
    MensagemAviso('Este item está com código duplicado');

end;

initialization
   AcionarTelaLerArquivo :=  AcionarTelaLerArquivo_;


end.
