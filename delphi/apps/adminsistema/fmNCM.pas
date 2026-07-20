unit fmNCM;

interface

uses dmNCM,
  SysUtils, FileCtrl, Types, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls, DBCtrls, windows,
  //Terceiros
  ZQuery, ZPgSqlQuery, biblio,
  // PRojeto
  fmcadastropadrao, cpdbfindcontrols, Mask, cptexto,fmconsultabasica,
  fmconsultaporcampo,
  //biblio
  ctconstantes, ToolWin, cpdbmemo, cpdbtext, Grids, DBGrids, cpdbgrid,
  cpdbradiogroup, cpdbedittext, ActnList, cpnumero, frconsulta, frconsultacodigo, db;


Type  T_Secao = Record
        CapInicial: integer;
        CapFinal:   integer;
        Descricao:  string;
      end;

Const Romano: Array[1..21] of string[05] = ('I',   'II',   'III',   'IV',   'V',
                                            'VI',  'VII',  'VIII',  'IX',   'X',
                                            'XI',  'XII',  'XIII',  'XIV',  'XV',
                                            'XVI', 'XVII', 'XVIII', 'XVIX', 'XX',
                                            'XXI');
      Secoes: Array [1..21] of T_Secao =
             ((CapInicial:  1; CapFinal:  5; Descricao: 'Animais vivos e produtos do reino animal'),
              (CapInicial:  6; CapFinal: 14; Descricao: 'Produtos do reino vegetal'),
              (CapInicial: 15; CapFinal: 15; Descricao: 'Gorduras e óleos animais ou vegetais; produtos da sua dissociação; gorduras alimentares elaboradas; ceras de origem animal ou vegetal'),
              (CapInicial: 16; CapFinal: 24; Descricao: 'Produtos das indústrias alimentares; bebidas, líquidos alcoólicos e vinagres; tabaco e seus sucedâneos manufaturados'),
              (CapInicial: 25; CapFinal: 27; Descricao: 'Produtos minerais'),
              (CapInicial: 28; CapFinal: 38; Descricao: 'Produtos das indústrias químicas ou das indústrias conexas'),
              (CapInicial: 39; CapFinal: 40; Descricao: 'Plásticos e suas obras; borracha e suas obras'),
              (CapInicial: 41; CapFinal: 43; Descricao: 'Peles, couros, peleteria (peles com pelo) e obras destas matérias; artigos de correeiro ou de seleiro; artigos de viagem, bolsas e artefatos semelhantes; obras de tripa'),
              (CapInicial: 44; CapFinal: 46; Descricao: 'Madeira, carvão vegetal e obras de madeira; cortiça e suas obras; obras de espartaria ou de cestaria'),
              (CapInicial: 47; CapFinal: 49; Descricao: 'Pastas de madeira ou de outras matérias fibrosas celulósicas; papel ou cartão para reciclar (desperdícios e aparas); papel ou cartão e suas obras'),
              (CapInicial: 50; CapFinal: 63; Descricao: 'Matérias têxteis e suas obras'),
              (CapInicial: 64; CapFinal: 67; Descricao: 'Calçados, chapéus e artefatos de uso semelhante, guarda-chuvas, guarda-sóis, bengalas, chicotes e suas partes; penas preparadas e suas obras; flores artificiais; obras de cabelo'),
              (CapInicial: 68; CapFinal: 70; Descricao: 'Obras de pedas, gesso, cimento, amianto, mica ou de matérias semelhantes; produtos cerâmicos; vidro e suas obras'),
              (CapInicial: 71; CapFinal: 71; Descricao: 'Pérolas naturais ou cultivadas, pedras preciosas ou semipreciosas e semelhantes, metais preciosos, metais folheados ou chapeados (plaquê) de metais preciosos, e suas obras; bijuterias; moedas'),
              (CapInicial: 72; CapFinal: 83; Descricao: 'Metais comuns e suas obras'),
              (CapInicial: 84; CapFinal: 85; Descricao: 'Máquinas e aparelhos, equipamentos elétricos, e suas partes; aparelhos de gravação ou de reprodução de som, aparelhos de gravação ou de reprodução de imagens e de som em televisão, e suas partes e acessórios'),
              (CapInicial: 86; CapFinal: 89; Descricao: 'Material de transporte'),
              (CapInicial: 90; CapFinal: 92; Descricao: 'Instrumentos e aparelhos de ótica, de fotografia, de cinematografia, de medida, de controle ou de precisão; instrumentos e aparelhos médico-cirúrgicos; aparelhos de relojoaria; instrumentos musicais; suas partes e acessórios'),
              (CapInicial: 93; CapFinal: 93; Descricao: 'Armas, munições, suas partes e acessórios'),
              (CapInicial: 94; CapFinal: 96; Descricao: 'Mercadorias e produtos diversos'),
              (CapInicial: 97; CapFinal: 97; Descricao: 'Objetos de arte, de coleção e antiguidades'));

var DirSugestao: string;
    SQL:         string;



type
  TfrmNCM = class(TfrmCadastroPadrao)
    gbxSecao: TGroupBox;
    gbxDescricao: TGroupBox;
    pgcTabelaNCM: TPageControl;
    tstSecoes: TTabSheet;
    tstCapitulos: TTabSheet;
    mmoDescricaoSecao: TtecDBMemo;
    edtNrSecao: TtecDbEditFind;
    gbxNotasSecao: TGroupBox;
    mmoSecoesNotas: TtecDBMemo;
    gbxSecoesCapitulos: TGroupBox;
    dbgSecoesCapitulos: TtecDBGrid;
    gbxCapituloNumero: TGroupBox;
    edtCapitulo: TtecDbEditFind;
    GroupBox2: TGroupBox;
    mmoDescricaoCapitulo: TtecDBMemo;
    gbxNotasCapitulos: TGroupBox;
    mmoNotasCapitulos: TtecDBMemo;
    gbxTabelaNCM: TGroupBox;
    dbgTabelaNCM: TtecDBGrid;
    gbxSecaoCapitulo: TGroupBox;
    tstImportacao: TTabSheet;
    gbxAliquotaIPI: TGroupBox;
    lblLei12741: TLabel;
    pgcImportacao: TPageControl;
    tstImportarIPI_NCM: TTabSheet;
    tstAliquotasLei12741: TTabSheet;
    gbxPastaTabelaIPI: TGroupBox;
    sbnPastaTabelaIPI: TSpeedButton;
    lblPastaTabelaIPI: TLabel;
    rgbImportarSecaoCapitulo: TtecDBRadioGroup;
    rbnSecoes: TtecRadioButton;
    rbnCapitulos: TtecRadioButton;

    gbxSecoes: TGroupBox;
    ckbSecao01: TCheckBox;
    ckbSecao02: TCheckBox;
    ckbSecao03: TCheckBox;
    ckbSecao04: TCheckBox;
    ckbSecao05: TCheckBox;
    ckbSecao06: TCheckBox;
    ckbSecao07: TCheckBox;
    ckbSecao08: TCheckBox;
    ckbSecao09: TCheckBox;
    ckbSecao10: TCheckBox;
    ckbSecao11: TCheckBox;
    ckbSecao12: TCheckBox;
    ckbSecao13: TCheckBox;
    ckbSecao14: TCheckBox;
    ckbSecao15: TCheckBox;
    ckbSecao16: TCheckBox;
    ckbSecao17: TCheckBox;
    ckbSecao18: TCheckBox;
    ckbSecao19: TCheckBox;
    ckbSecao20: TCheckBox;
    ckbSecao21: TCheckBox;

    lblSecao08: TLabel;
    lblSecao12: TLabel;
    lblSecao14: TLabel;
    lblSecao16: TLabel;
    lblSecao18: TLabel;

    pgcSecoesCapitulos: TPageControl;
    tstImportarSecoes: TTabSheet;
    tstImportarCapitulos: TTabSheet;
    gbxCapitulos: TGroupBox;
    lblCapSecao01: TLabel;
    lblCapSecao19: TLabel;
    lblCapSecao20: TLabel;
    lblCapSecao21: TLabel;
    lblCapSecao18: TLabel;
    lblCapSecao17: TLabel;
    lblCapSecao16: TLabel;
    lblCapSecao15: TLabel;
    lblCapSecao14: TLabel;
    lblCapSecao13: TLabel;
    lblCapSecao12: TLabel;
    lblCapSecao11: TLabel;
    lblCapSecao10: TLabel;
    lblCapSecao09: TLabel;
    lblCapSecao08: TLabel;
    lblCapSecao05: TLabel;
    lblCapSecao06: TLabel;
    lblCapSecao07: TLabel;
    lblCapSecao04: TLabel;
    lblCapSecao03: TLabel;
    lblCapSecao02: TLabel;
    ckbMarcarTodasSecoes: TCheckBox;
    gbxCapituloSecao: TGroupBox;
    mmoSecaoImportacao: TtecDBMemo;
    gbxTabelaNCMImportacao: TGroupBox;
    dbgCapituloImportar: TtecDBGrid;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    spdAliquotasIBPT: TSpeedButton;
    lblPastaAliquotasIBPT: TLabel;
    gbxInformacoesIBPT: TGroupBox;
    mmoInformacoesIBPT: TMemo;
    pnlSecaoTop: TPanel;
    pnlSecaoTopLeft: TPanel;
    pnlCapituloTop: TPanel;
    pnlCapituloLeft: TPanel;
    mmoSecaoCapitulo: TtecDBMemo;
    sbnGerar: TSpeedButton;
    actHabilitar: TActionList;
    actGerar: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    gbxCapituloImportacao: TGroupBox;
    GroupBox4: TGroupBox;
    mmoDescricaoCapituloImportacao: TtecDBMemo;
    edtCapituloImportacao: TtecDbEditFind;
    pnlTopImportacao: TPanel;
    tstNCMInexistentes: TTabSheet;
    dbgNCMsInexistentes: TtecDBGrid;
    stxCapitulo_99: TStaticText;
    gbxVigencia: TGroupBox;
    lblVigencia: TLabel;
    stxFornecidos: TStaticText;
    stxAliquotasIBPT: TStaticText;
    tstMVA: TTabSheet;
    gbxProtocolo: TGroupBox;
    gbxCodigo: TGroupBox;
    gbxDescricaoProtocolo: TGroupBox;
    gbxGrupoMVA: TGroupBox;
    gbxProdutosMVA: TGroupBox;
    dbgMVAGrupos: TtecDBGrid;
    dbgMVAProdutosNCM: TtecDBGrid;
    gbxUFProtocolo: TGroupBox;
    dbgProtocoloEstados: TtecDBGrid;
    sbnIncluirMVAGrupos: TSpeedButton;
    sbnExcluirMVAGrupos: TSpeedButton;
    sbnIncluirMVAProdutosNCM: TSpeedButton;
    sbnExcluirMVAProdutosNCM: TSpeedButton;
    edfProtocolo: TtecDbEditFind;
    edtDescricaoProtocolo: TDBEditTexto;
    tstIPIprodutosSemNCM: TTabSheet;
    dbgIPIprodutosSemNCM: TtecDBGrid;
    tstMVACadastradas: TTabSheet;
    dbgMVACadastradas: TtecDBGrid;
    procedure sbnPastaTabelaIPIClick(Sender: TObject);
    procedure ckbMarcarTodasSecoesClick(Sender: TObject);
    procedure pgcTabelaNCMChange(Sender: TObject);
    procedure edtCapituloFound(Found: Boolean);
    procedure rbnSecoesClick(Sender: TObject);
    procedure rbnCapitulosClick(Sender: TObject);
    procedure actGerarUpdate(Sender: TObject);
    procedure sbnGerarClick(Sender: TObject);
    procedure ckbSecao01Click(Sender: TObject);
    procedure sbnProcurarClick(Sender: TObject);
    procedure pgcImportacaoChange(Sender: TObject);
    procedure spdAliquotasIBPTClick(Sender: TObject);
    procedure sbnIncluirMVAGruposClick(Sender: TObject);
    procedure sbnIncluirMVAProdutosNCMClick(Sender: TObject);
    procedure sbnExcluirMVAGruposClick(Sender: TObject);
    procedure sbnExcluirMVAProdutosNCMClick(Sender: TObject);
    procedure dbgMVAGruposKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgMVAProdutosNCMKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
    MarcandoTodos: boolean;
  protected
//    dtmNCM: TdtmNCM;
    ConsultaClassificacaoIPI: TfraConsultaCodigo;
    ConsultaMVAProtocolos: TfraConsultaCodigo;
    procedure AtribuirDadosClassificacaoIPI(Found: Boolean);
    procedure AbrirMVAProtocolos;

    function ImportarDadosCapitulo(Secao, Capitulo: Integer; AbrirCapitulo: boolean = false): boolean; overload;
    function ImportarDadosCapitulo(Capitulo: Integer): boolean; overload;

    function ImportarDadosSecoes: boolean;
    function ImportarAliquotasLei12741: boolean;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure AlterarEstadoBotoes; override;
    procedure StateChange(Sender: TObject);

    function  InternoExcluir: Boolean; override;
    function  InternoIncluir: Boolean; override;
    function  InternoGravar: Boolean; override;





  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
  end;
var
  frmNCM: TfrmNCM;

implementation

{$R *.dfm}

{ TfrmNCM }

constructor TfrmNCM.Create(AOwner: TComponent);
begin
  dtmNCM:= TdtmNCM.Create(Self);
  inherited;
  dataset := dtmNCM.qryMVAProtocolos;
  DirSugestao:= ExtractFilePath(Application.ExeName) + 'NCM';

//  DirSugestao:= 'n:\legislação\ncm';

  if DirSugestao <> '' then
  begin
    lblPastaTabelaIPI.    Caption:= DirSugestao + '\';
    lblPastaAliquotasIBPT.Caption:= DirSugestao + '\';
  end;

  pgcTabelaNCM.ActivePage := tstSecoes;
  edtNrSecao.setfocus;

  pgcSecoesCapitulos.ActivePage := tstImportarSecoes;

  ConsultaClassificacaoIPI := TfraConsultaCodigo.Create(self);
  ConsultaClassificacaoIPI.Name := 'fraConsultaClassificacaoIPI';
  ConsultaClassificacaoIPI.edfCodigo.DataSource := dtmNCM.dsrSecoes;
  ConsultaClassificacaoIPI.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaClassificacaoIPI.AbrirTabelaProcura := false;
  ConsultaClassificacaoIPI.TipoPesquisa := pesNCMTABELAIPI;
  ConsultaClassificacaoIPI.OnFound := AtribuirDadosClassificacaoIPI;

  ConsultaMVAProtocolos := TfraConsultaCodigo.Create(self);
  ConsultaMVAProtocolos.Name := 'fraConsultaMVAProtocolos';
  ConsultaMVAProtocolos.edfCodigo.DataSource := dtmNCM.dsrMVAProtocolos;
  ConsultaMVAProtocolos.edfCodigo.Operacao := opATRIBUICAO;
  ConsultaMVAProtocolos.AbrirTabelaProcura := false;
  ConsultaMVAProtocolos.qryProcuraMVAProtocolos := dtmNCM.qryMVAProtocolos;
  ConsultaMVAProtocolos.TipoPesquisa := pesMVAProtocolos;
//  ConsultaMVAProtocolos.OnFound := AtribuirDadosMVAProtocolos;

  dtmNCM.dsrSecoes.OnStateChange := StateChange;

  dbgMVAGrupos.ondelete :=  dtmNCM.ExcluirMVAGrupos;
  dbgMVAProdutosNCM.ondelete := dtmNCM.ExcluirMVAProdutosNCM;



end;

destructor TfrmNCM.Destroy;
begin
  dtmNCM:= nil;
  inherited;
  frmNCM:= nil;
end;


procedure TfrmNCM.sbnPastaTabelaIPIClick(Sender: TObject);
var Diretorio: string;
begin
  inherited;
  if SelectDirectory('Selecione a pasta onde estão os arquivos' + CrLf +
                     '*.txt para importação dos dados:',
                     DirSugestao, Diretorio)
  then begin
     lblPastaTabelaIPI.Caption:= Diretorio;
  end;
end;



function TfrmNCM.ImportarAliquotasLei12741: boolean;
var Arquivo:     TextFile;
    ArqNome:     String;
    ArqPesquisa: TSearchRec;
    Linha:       String;
    NrLinhas :    Integer;


    {------------------------------------- LAYOUT DO ARQUIVO --------------------------------------}
    {                                                                                              }
    { O arquivo contém todas  os códigos NCM – Nomenclatura  Comum do Mercosul e NBS – Nomenclatura}
    { Brasileira de Serviços, bem como, em se tratando de serviços, a NBS – Nomenclatura Brasileira}
    { de Serviços ou os itens da Lei Complementar 116, no formato:                                 }
    {                                                                                              }
    { Codigo;Ex;NCMouNBSouLei116;Descricao;AliqNacional;AliqImportado;Versão                       }
    {                                                                                              }
    { Código:           Contém a NCM - Nomenclatura comum do MERCOSUL ou                           }
    {                            NBS - Nomenclatura brasileiro de serviços                         }
    {                            ou o código do item da Lei Complementar 116                       }
    {                                                                                              }
    { Ex:                Exceção fiscal da NCM ou TIPI                                             }
    {                                                                                              }
    { NCMouNBS:          Se "0", o código é NCM;                                                   }
    {                    Se "1", é NBS;                                                            }
    {                                                                                              }
    { Descricao:         Campo que contém  a descrição do  produto ou  serviço de                  }
    {                    acordo com a tabela correspondente.                                       }
    {                                                                                              }
    { NacionalFederal:   Carga tributária federal para os produtos nacionais (99,99)               }
    {                                                                                              }
    { ImportadosFederal: Carga tributária federal para os produtos nacionais (99,99)               }
    {                                                                                              }
    { Estadual:          Carga tribuária estadual (99,99)                                          }
    {                                                                                              }
    { Municipal:         Carga tribuária municipal (99,99)                                         }
    {                                                                                              }
    { VigênciaInício:    Data de início da vigência desta alíquota (DD/MM/AAAA)                    }
    {                                                                                              }
    { VigênciaFim:       Data de fim da vigência desta alíquota (DD/MM/AAAA)                       }
    {                                                                                              }
    { Chave:             Chave que associa a tabela IBPTax baixada com a empresa, data e parâmetros}
    {                    informados pela empresa e que foram utilizadas no cálculo                 }
    {                                                                                              }
    { Versão:            Nº da versão disponibilizada - ATUAL: 15.1.B                              }
    {                                                                                              }
    { Fonte:             Órgão/entidade responsável pelos dados                                    }
    {----------------------------------------------------------------------------------------------}




    function Campo(N1, N2: integer): string;                    {Retorna o campo existente em linha}
    begin                                                       {entre os ponto e vírgulas n1 e n2 }
       if N1 = 0
       then Result:= Trim(Copy(Linha,1,PosOcor(';',Linha,N2)-1))
       else if PosOcor(';',Linha,N1) + 1 = PosOcor(';',Linha,N2)
            then Result:= 'NULL'
            else if N2 <= PosOcor(';',Linha,0)
                 then Result:= Trim(Copy(Linha,PosOcor(';',Linha,N1) + 1,
                                               PosOcor(';',Linha,N2) -
                                               PosOcor(';',Linha,N1) - 1))
                 else Result:= Trim(Copy(Linha,PosOcor(';',Linha,N1) + 1,Length(Linha)));
    end; {Campo}



    function Data(N1, N2: integer): string;           {Retorna a data do campo(N1, N2), que está no}
    var Data: String[10];                             {formato DD/MM/AAAA, no formato AAAA-MM-DD   }
    begin
       Data  := Campo(N1, N2);
       Result:= Copy(Data,7,4) + '-' + Copy(Data,4,2) + '-' + Copy(Data,1,2);
    end; {Data}



begin
   Result := true;
   ArqNome:= lblPastaAliquotasIBPT.Caption + '\' + 'AliquotasIBPT.csv';

   NrLinhas:= 0;
   if FindFirst(ArqNome,faArchive,ArqPesquisa) = 0
   then begin
      AssignFile(Arquivo, ArqNome);
      Reset(Arquivo);     SQL:= '';
      while not eof(Arquivo) do begin
         Result := VerificarTeclaESC;

         if not Result
         then break
         else begin
            inc(NrLinhas);
            ReadLn(Arquivo, Linha);
            if Campo(2, 3) = '0'                            {Só serão importados códigos NCM}
            then begin
               SQL:= SQL + 'UPDATE NCMTabela SET NacionalFederal = '   + Campo( 4,  5) + ', '
                                              + 'ImportadosFederal = ' + Campo( 5,  6) + ', '
                                              + 'CargaEstadual = '     + Campo( 6,  7) + ', '
                                              + 'CargaMunicipal = '    + Campo( 7,  8) + ', '
                                              + 'VigenciaInicio = '''  + Data ( 8,  9) + ''', '
                                              + 'VigenciaFim = '''     + Data ( 9, 10) + ''', '
                                              + 'ChaveIBPT = '''       + Campo(10, 11) + ''', '
                                              + 'Versao = '''          + Campo(11, 12) + ''', '
                                              + 'FonteDados = '''      + Campo(12, 13) + ''' '
                         + ' WHERE CodigoTIPI = ''' + FStr(FLVal(Campo(0, 1)),$81) + ''' AND ExTIPI ';

               if Campo(1, 2) = 'NULL' then SQL:= SQL + 'IS NULL;' + CrLf
                                       else SQL:= SQL + '= ''' + FStr(FLVal(Campo(1, 2)),$21) + ''';' + CrLf;
            end;

            if NrLinhas mod 100 = 0 then begin
               dtmNCM.ShowProcessando(Format('Já foram processados %d registros', [NrLinhas]));
               dtmNCM.qryImportar.Sql.Text := SQL;
               dtmNCM.qryImportar.ExecSql;
               Result := dtmNCM.Perpetrar([dtmNCM.qryImportar]);
               SQL := '';
               if not Result
               then break;
            end;
         end;
      end;
      CloseFile(Arquivo);
   end
   else begin
      MensagemErro('O arquivo "' + ArqNome + '" não foi encontrado');
      Result := false;
   end;

   if Result and (SQL <> '') then
   begin
     dtmNCM.qryImportar.Sql.Text := SQL;
     dtmNCM.qryImportar.ExecSql;

     Result := dtmNCM.Perpetrar([dtmNCM.qryImportar]);
   end;

   SQL := '';

   dtmNCM.ShowProcessando;
end;



function TfrmNCM.ImportarDadosCapitulo(Secao, Capitulo: Integer; AbrirCapitulo: boolean): boolean;
var Arquivo:     TextFile;
    ArqNome:     String;
    ArqPesquisa: TSearchRec;

    CodigoTIPI:  String;
    Descricao:   String;
    ExTIPI:      String;
    Aliquota:    String;
    SouA:        Char;
    Primeiro:    Boolean;
    Linha:       string;
    Kemper:      integer;
    SQLa: string;



    function Campo(N1, N2: integer): string;                    {Retorna o campo existente em linha}
    begin                                                       {entre os caracteres TAB n1 e n2   }
       if N1 = 0
       then Result:= Trim(Copy(Linha,1,PosOcor(Tab,Linha,N2)-1))
       else if PosOcor(Tab,Linha,N1) + 1 = PosOcor(Tab,Linha,N2)
            then Result:= 'NULL'
            else if N2 <= PosOcor(Tab,Linha,0)
                 then Result:= Trim(Copy(Linha,PosOcor(Tab,Linha,N1) + 1,
                                               PosOcor(Tab,Linha,N2) -
                                               PosOcor(Tab,Linha,N1) - 1))
                 else Result:= Trim(Copy(Linha,PosOcor(Tab,Linha,N1) + 1,Length(Linha)));
    end; {Campo}



begin
   Result := true;
   ArqNome:= lblPastaTabelaIPI.Caption + '\' + 'Capitulo-' + FStr(Capitulo,$21) + '.TXT';
   if FindFirst(ArqNome,faArchive,ArqPesquisa) = 0
   then begin

      Result := VerificarTeclaEsc;

      if Result
      then begin
         AssignFile(Arquivo, ArqNome);
         Reset(Arquivo);

         Primeiro:= true;
         dtmNCM.ShowProcessando('Seção '+ FStr(Secao, $00) + ' Capítulo ' + FStr(Capitulo, $00));
         while not eof(Arquivo) do begin
            ReadLn(Arquivo, Linha);

            if Trim(Trocar(Linha,Tab,'')) <> '' then begin             {A linha não está em branco?}
               CodigoTIPI:= Campo(0, 1);
               if (Length(CodigoTIPI) = 5) and (Copy(CodigoTIPI,3,1) = '.')
               then Delete(CodigoTIPI,3,1);

               Descricao := Trocar(
                            Trocar(Campo(1, 2),#$A0, ''),                   {#$0A lixo da tabela   }
                                               '''', '''''');               {Colocando aspas duplas}
               if Length(CodigoTIPI) = 10 then begin
                  if PosOcor(Tab,Linha,0) = 3
                  then ExTIPI:= Trocar('''' + Campo(3, 4) + '''','Ex ','')
                  else ExTIPI:= 'NULL';

                  SouA    := 'A';
                  Aliquota:= Trocar(Campo(2, 3),#$A0,'');                      {#$0A lixo da tabela}
                  if Aliquota = 'NT' then Aliquota:= 'NULL';
               end
               else begin
                  ExTIPI  := 'NULL';
                  SouA    := 'S';
                  Aliquota:= 'NULL';
               end;

               if Primeiro then begin
                  Primeiro:= false;
                  SQL:= SQL + 'DELETE FROM NCMTabela WHERE SUBSTRING(CodigoTIPI,1,2) = ''' +
                                                                   FStr(Capitulo,$21) + ''';' + CrLf
                                                                                              + CrLf
                            + '/* Capítulo ' + FStr(Capitulo,$00) + ' - ' + Descricao + '*/'  + CrLf;
               end;

               CodigoTIPI:= Trocar(Trocar(CodigoTIPI,'.',''),' ','');
//               SQL:= SQL + 'INSERT INTO NCMTabela (Codigo, Secao, CodigoTIPI, ExTIPI, SouA, Descricao, Aliquota) ' +
//                                  'VALUES (NULL, ' + FStr(Secao,0) + ', ''' + CodigoTIPI + ''', '
//                                                   + ExTIPI        + ', ''' + SouA       + ''', '''
//                                                   + Descricao     + ''', ' + Aliquota   +  ');'   + CrLf;
               SQLa:= 'INSERT INTO NCMTabela (Codigo, Secao, CodigoTIPI, ExTIPI, SouA, Descricao, Aliquota) ' +
                             'VALUES (NULL, ' + FStr(Secao,0) + ', ''' + CodigoTIPI + ''', '
                                              + ExTIPI        + ', ''' + SouA       + ''', '''
                                              + Descricao     + ''', ' + Aliquota   +  ');'   + CrLf;
               SQL:= SQL + SQLa;
if (Secao = 6) and (CodigoTIPI = '28530090')
then begin
   kemper:= 0;
end;
            end;
         end;
         CloseFile(Arquivo);
         SQL:= SQL + CrLf + CrLf;
      end;
   end
   else
      Result:= MensagemConfirmacao('O arquivo "' + ArqNome +
                                   '" não foi encontrado. Deseja continuar?') = smbOK;


   if Result then begin
      if ckbMarcarTodasSecoes.Checked and       {Se forem importadas todas as seções e for a última}
         (Secao = 21)                           {seção, inclui-se 99 - Serviços Diversos           }
      then SQL:= SQL + 'INSERT INTO NCMTabela (Codigo, Secao, CodigoTIPI, ExTIPI, SouA, Descricao, Aliquota) ' +
                              'VALUES (NULL, 99, ''99'', NULL, ''A'', ''Serviços Diversos'', 0);' + CrLf;


      dtmNCM.qryImportar.SQL.Text := SQL;
      dtmNCM.qryImportar.ExecSQL;
      Result := dtmNCM.Perpetrar([dtmNCM.qryImportar]);
   end;

   if AbrirCapitulo
   then dtmNCM.RefazConsultaPorNome(dtmNCM.qryCapitulos,['capitulo'], [Capitulo]);

   SQL := '';
   dtmNCM.ShowProcessando;
end;




function TfrmNCM.ImportarDadosSecoes: boolean;
var Capitulo: Integer;
    Secao:    Integer;
begin
   Result := false;
   if ckbMarcarTodasSecoes.Checked
   then SQL:= 'DELETE FROM NCMTabela;' + CrLf
                                       + CrLf +
              'ALTER SEQUENCE NCMTabela_ProximoCodigo RESTART 1;' + CrLf
   else SQL:= '';

   for Secao:= 1 to 21 do with Secoes[Secao] do begin
       if TCheckBox(FindComponent('ckbSecao'  + FStr(Secao,$21))).Checked
       then begin
          SQL:= SQL + '/* SEÇÃO ' + Romano[Secao] + ' - ' + AnsiUpperCase(Descricao) + '*/' + CrLf
                                                                                     + CrLf
                    + 'INSERT INTO NCMTabela (Codigo, Secao, CodigoTIPI, ExTIPI, SouA, Descricao, Aliquota) ' +
                               'VALUES (NULL, ' + FStr(Secao,0) + ', ''' + FStr(Secao,$41)+ ''', NULL, ''S'', ''' + Descricao + ''', NULL);'
                    + CrLf + CrLf;
          for Capitulo:= CapInicial to CapFinal do begin
              Result:= ImportarDadosCapitulo(Secao, Capitulo);

              if not Result then Break;
          end;

          if not Result then Break;
       end;
   end;
end;


procedure TfrmNCM.ckbMarcarTodasSecoesClick(Sender: TObject);
var i: Integer;
begin
   inherited;
   MarcandoTodos:= ckbMarcarTodasSecoes.Checked;
   for i:= 0 to ComponentCount -1  do
       if Components[i] is TCheckBox
       then if  (Copy(Components[i].Name,1,8) = 'ckbSecao')
            then TCheckBox(Components[i]).Checked:= ckbMarcarTodasSecoes.Checked;
   MarcandoTodos := false;
end;


procedure TfrmNCM.pgcTabelaNCMChange(Sender: TObject);
begin
  inherited;

  case  pgcTabelaNCM.ActivePageIndex of
     0:                     {tstSecoes}
     begin
        edtCapitulo.ActiveSetControls := false;
        edtCapituloImportacao.ActiveSetControls := false;
        ConsultaClassificacaoIPI.edfCodigo.DataSource := dtmNCM.dsrSecoes;
        edtNrSecao.ActiveSetControls := true;
        edtNrSecao.setfocus;
     end;

     1:                  {tstCapitulos}
     begin
       edtNrSecao.ActiveSetControls := false;
       edtCapituloImportacao.ActiveSetControls := false;
       ConsultaClassificacaoIPI.edfCodigo.DataSource := dtmNCM.dsrCapitulos;
       edtCapitulo.ActiveSetControls := true;
       edtCapitulo.setfocus;
     end;

     2:                 {tstImportacao}
     begin
       edtNrSecao.ActiveSetControls := false;
       edtCapitulo.ActiveSetControls := false;
       edtCapituloImportacao.ActiveSetControls := true;
       ConsultaClassificacaoIPI.edfCodigo.DataSource := dtmNCM.dsrCapitulos;
       edtCapituloImportacao.setfocus;
     end;

     3:            {tstNCMInexistentes}
     begin
       dtmNCM.qryNCMInexistentes.Close;
       dtmNCM.qryNCMInexistentes.open;
     end;

     4:          {tstIPIprodutosSemNCM}
     begin
       dtmNCM.qryIPIsemNCM.Close;
       dtmNCM.qryIPIsemNCM.Open;
     end;

     5:                       {tstMVA}
     begin
      edfProtocolo.SetFocus;
     end;

     6:            {tstMVACadastrados}
     begin
       dtmNCM.qryMVACadastradas.ParamByName('FilialBase').AsInteger:= dtmNCM.FilialBase;
       dtmNCM.qryMVACadastradas.Close;
       dtmNCM.qryMVACadastradas.Open;
     end;
  end;

  AlterarEstadoBotoes;

end;


procedure TfrmNCM.edtCapituloFound(Found: Boolean);
begin
  inherited;
  gbxSecaoCapitulo.Caption := ' SEÇÃO ' + Romano[dtmNCM.qryCapitulossecao.AsInteger] + ' ';
  gbxCapituloSecao.Caption := ' SEÇÃO ' + Romano[dtmNCM.qryCapitulossecao.AsInteger] + ' ';
end;

procedure TfrmNCM.rbnSecoesClick(Sender: TObject);
begin
  inherited;
  pgcSecoesCapitulos.ActivePage := tstImportarSecoes;  
end;

procedure TfrmNCM.rbnCapitulosClick(Sender: TObject);
begin
  inherited;
  pgcSecoesCapitulos.ActivePage := tstImportarCapitulos;
  pgcTabelaNCMChange(rbnCapitulos);
end;

procedure TfrmNCM.actGerarUpdate(Sender: TObject);
var i: integer;
    vSecaoMarcada: Boolean;
begin
  inherited;
  case  pgcTabelaNCM.ActivePageIndex of
     0, {tstSecoes}
     1, {tstCapitulos}
     2, {tstImportacao}
     3: {tstNCMInexistentes}
     begin
       vSecaoMarcada := false;

       if rbnSecoes.Checked
       then for i := 0 to ComponentCount -1 do
                if Components[i] is TCheckBox
                then if (Copy(Components[i].Name,1,8) = 'ckbSecao') and
                        TCheckBox(Components[i]).Checked
                     then begin
                        vSecaoMarcada := true;
                        break;
                     end;

      sbnGerar.Enabled := (((rbnSecoes.Checked and vSecaoMarcada) or
                            (rbnCapitulos.Checked and (edtCapituloImportacao.Text<>''))) and (lblPastaTabelaIPI.Caption <> '') and (pgcImportacao.ActivePage = tstImportarIPI_NCM) ) or
                          ((pgcImportacao.ActivePage = tstAliquotasLei12741) and (lblPastaAliquotasIBPT.Caption <> ''));
     end;

     4 {tstMVA} :
     begin
       sbnGerar.Enabled := not dtmNCM.qryMVAProtocolos.isempty and not sbnSalvar.Enabled;
       sbnIncluirMVAGrupos.enabled := not dtmNCM.qryMVAProtocolos.isempty or (dtmNCM.qryMVAProtocolos.state = dsinsert);
       sbnExcluirMVAGrupos.enabled := not dtmNCM.qryMVAProtocolos.isempty or (dtmNCM.qryMVAProtocolos.state = dsinsert);


       sbnIncluirMVAProdutosNCM.enabled := (not dtmNCM.qryMVAProtocolos.isempty and
                                            not dtmNCM.qryMVAGrupos.isempty)  or (dtmNCM.qryMVAProdutosNCM.state = dsinsert);

       sbnExcluirMVAProdutosNCM.enabled := (not dtmNCM.qryMVAProtocolos.isempty and
                                            not dtmNCM.qryMVAGrupos.isempty)  or (dtmNCM.qryMVAProdutosNCM.state = dsinsert);
     end;
  end;
end;

procedure TfrmNCM.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;

  if not CtrlOn then
  begin
    if  (key = vk_f7) and sbnGerar.Enabled then
      sbnGerarClick(self)
    else
    if (key = VK_F9) and sbnProcurar.Enabled then
    begin
      case  pgcTabelaNCM.ActivePageIndex of
         0, {tstSecoes}
         1, {tstCapitulos}
         2, {tstImportacao}
         3: {tstNCMInexistentes} 
         begin
           ConsultaClassificacaoIPI.InternoPesquisar('NCM');
           self.SetFocus;
         end;

         4 {tstMVA} :
         begin
           ConsultaMVAProtocolos.InternoPesquisar('MVA Protocolos');
           self.SetFocus;
         end;
      end;

    end;
  end;

end;

procedure TfrmNCM.sbnGerarClick(Sender: TObject);
var
  state : TKeyboardState;

begin
  inherited;

  case  pgcTabelaNCM.ActivePageIndex of
     0, {tstSecoes}
     1, {tstCapitulos}
     2, {tstImportacao}
     3: {tstNCMInexistentes}
     begin

       State[VK_Escape] := 0;            {if it's on, turn it off}
       SetKeyboardState(State);       {Actually set the new state}

       if pgcImportacao.ActivePage = tstImportarIPI_NCM then begin
          if rbnSecoes.Checked then begin
             if ImportarDadosSecoes
             then MensagemAviso(ctIMPORTACAOSUCESSO);
          end
          else if rbnCapitulos.Checked
               then if ImportarDadosCapitulo(strtoint(edtCapituloImportacao.text))
                    then MensagemAviso(ctIMPORTACAOSUCESSO);
       end
       else if ImportarAliquotasLei12741
            then MensagemAviso(ctIMPORTACAOSUCESSO);

     end;

     4 {tstMVA} : dtmNCM.AtualizarMVAs;
  end;


end;

procedure TfrmNCM.ckbSecao01Click(Sender: TObject);
var i: integer;
    vTodosMarcados: boolean;
begin
   inherited;

   if not MarcandoTodos
   then begin
      vTodosMarcados := true;
      for i:= 1 to 21 do begin
          if not TCheckBox(FindComponent('ckbSecao'  + fstr(i,$21))).Checked
          then begin
             ckbMarcarTodasSecoes.OnClick := nil;
             ckbMarcarTodasSecoes.Checked := false;
             ckbMarcarTodasSecoes.OnClick := ckbMarcarTodasSecoesClick;
             vTodosMarcados := false;
             break;
          end
      end;

      if vTodosMarcados and not ckbMarcarTodasSecoes.Checked
      then begin
         ckbMarcarTodasSecoes.OnClick := nil;
         ckbMarcarTodasSecoes.Checked := true;
         ckbMarcarTodasSecoes.OnClick := ckbMarcarTodasSecoesClick;
      end;
   end;
end;

function TfrmNCM.ImportarDadosCapitulo(Capitulo: Integer): boolean;
var Secao : integer;
begin
   Result:= false;
   for Secao:= 1 to 21 do with Secoes[Secao] do
       if (Capitulo >= CapInicial) and (Capitulo <= CapFinal)
       then Result:= ImportarDadosCapitulo(Secao, Capitulo, true);
end;

procedure TfrmNCM.AtribuirDadosClassificacaoIPI(Found: Boolean);
begin
  if pgcTabelaNCM.ActivePage = tstSecoes
  then dtmNCM.RefazConsultaPorNome(dtmNCM.qrySecoes,['secao'],[ConsultaClassificacaoIPI.qryconsultancmTabelasecao.asinteger])
  else if pgcTabelaNCM.ActivePage = tstCapitulos
      then begin
         dtmNCM.RefazConsultaPorNome(dtmNCM.qryCapitulos,['Capitulo'],[ConsultaClassificacaoIPI.qryconsultancmTabelasecao.asinteger]);
         edtCapituloFound(true);
      end
     else if (pgcTabelaNCM.ActivePage = tstImportacao) and
             rbnCapitulos.Checked
          then begin
             dtmNCM.RefazConsultaPorNome(dtmNCM.qryCapitulos,['Capitulo'],[ConsultaClassificacaoIPI.qryconsultancmTabelasecao.asinteger]);
             edtCapituloFound(true);
          end;
end;

procedure TfrmNCM.sbnProcurarClick(Sender: TObject);
begin
  inherited;
  keybd_event(VK_F9,0,0,0);
  {
  ConsultaClassificacaoIPI.InternoPesquisar('NCM');
  self.SetFocus;
  }
end;

procedure TfrmNCM.pgcImportacaoChange(Sender: TObject);
begin
  inherited;
  pgcTabelaNCMChange(pgcImportacao);
end;

procedure TfrmNCM.spdAliquotasIBPTClick(Sender: TObject);
var Diretorio: string;
begin
  inherited;
  if SelectDirectory('Selecione a pasta onde está o arquivo AliquotasIBPT.csv' + CrLf +
                     ' para importação dos dados:',
                     DirSugestao, Diretorio)
  then begin
     lblPastaAliquotasIBPT.Caption := Diretorio;
  end;

end;

procedure TfrmNCM.AlterarEstadoBotoes;
begin
  inherited;
  sbnIncluir.Enabled  := (DataSet.Active and (Dataset.State = dsBrowse) and (pgcTabelaNCM.ActivePageIndex in [4])) or
                         (dtmNCM.qrySecoes.Active and (dtmNCM.qrySecoes.State = dsBrowse) and (pgcTabelaNCM.ActivePageIndex in [0,1,2,3]));

  sbnProcurar.Enabled := sbnIncluir.Enabled;

  sbnExcluir.Enabled  := (DataSet.Active and not DataSet.IsEmpty and (pgcTabelaNCM.ActivePageIndex in [4])) or
                         (dtmNCM.qrySecoes.Active and not dtmNCM.qrySecoes.IsEmpty and (pgcTabelaNCM.ActivePageIndex in [0,1,2,3]));

  sbnSalvar.Enabled   := ((DataSet.State in [dsEdit, dsInsert]) and (pgcTabelaNCM.ActivePageIndex in [4])) or
                         ((dtmNCM.qrySecoes.State in [dsedit, dsInsert]) and (pgcTabelaNCM.ActivePageIndex in [0,1,2,3]));
                         
end;

procedure TfrmNCM.StateChange(Sender: TObject);
begin
  AlterarEstadoBotoes;
end;

function TfrmNCM.InternoExcluir: Boolean;
begin
  case  pgcTabelaNCM.ActivePageIndex of
     0 {tstSecoes} :
     begin

     end;

     1 {tstCapitulos} :
     begin

     end;

     2 {tstImportacao} :
     begin

     end;

     3 {tstNCMInexistentes} :
     begin

     end;

     4 {tstMVA} :
       dtmNCM.ExcluirMVAProtocolos;
  end;

end;

function TfrmNCM.InternoIncluir: Boolean;
begin
  case  pgcTabelaNCM.ActivePageIndex of
     0 {tstSecoes} :
     begin

     end;

     1 {tstCapitulos} :
     begin

     end;

     2 {tstImportacao} :
     begin

     end;

     3 {tstNCMInexistentes} :
     begin

     end;

     4 {tstMVA} :
     begin
       dtmNCM.IncluirMVAProtocolos;
     end;
  end;
end;

procedure TfrmNCM.sbnIncluirMVAGruposClick(Sender: TObject);
begin
  inherited;
  dtmNCM.IncluirMVAGrupos;
end;

procedure TfrmNCM.sbnIncluirMVAProdutosNCMClick(Sender: TObject);
begin
  inherited;
  dtmNCM.IncluirMVAProdutosNCM;
end;

procedure TfrmNCM.sbnExcluirMVAGruposClick(Sender: TObject);
begin
  inherited;
  dtmNCM.ExcluirMVAGrupos;
end;

procedure TfrmNCM.sbnExcluirMVAProdutosNCMClick(Sender: TObject);
begin
  inherited;
  dtmNCM.ExcluirMVAProdutosNCM;
end;

procedure TfrmNCM.dbgMVAGruposKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if CtrlOn then
  begin
    if (key = TeclaInserirRegistro) and sbnIncluirMVAGrupos.Enabled then
      dtmNCM.IncluirMVAGrupos
    else
    if key = TeclaEditarRegistro then
      dtmNCM.EditarMVAGrupos
    else
    if (key = TeclaExcluirRegistro) and sbnExcluirMVAGrupos.enabled then
      dtmNCM.ExcluirMVAGrupos;
  end;
end;

procedure TfrmNCM.dbgMVAProdutosNCMKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if CtrlOn then
  begin
    if (key = TeclaInserirRegistro) and sbnIncluirMVAProdutosNCM.Enabled then
      dtmNCM.IncluirMVAProdutosNCM
    else
    if key = TeclaEditarRegistro then
      dtmNCM.EditarMVAProdutosNCM
    else
    if (key = TeclaExcluirRegistro) and sbnExcluirMVAProdutosNCM.enabled then
      dtmNCM.ExcluirMVAProdutosNCM;
  end;

end;

procedure TfrmNCM.AbrirMVAProtocolos;
begin

end;

function TfrmNCM.InternoGravar: Boolean;
begin
  inherited internogravar;
  case  pgcTabelaNCM.ActivePageIndex of
     0 {tstSecoes} :
     begin

     end;

     1 {tstCapitulos} :
     begin

     end;

     2 {tstImportacao} :
     begin

     end;

     3 {tstNCMInexistentes} :
     begin

     end;

     4 {tstMVA} :
       dtmNCM.GravarMVAProtocolos;
  end;

end;

end.
