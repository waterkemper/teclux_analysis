unit dmimprimetermos;
{---------------------------------------------------------------------------------------------------
                                        INSTRUÇÃO NORMATIVA
                   DIRETORIA DO DEPARTAMENTO DE REGISTRO EMPRESARIAL E INTEGRAÇÃO
                          DREI Nº 11 DE 05.12.2013 - D.O.U.: 09.12.2013

Dispõe sobre procedimentos para a validade e eficácia dos instrumentos de escrituração dos
empresários individuais, das empresas individual de responsabilidade Ltda - Eireli, das sociedades
empresárias, das cooperativas, dos consórcios, dos grupos de sociedades, dos leiloeiros, dos
tradutores públicos e intérpretes comerciais.

....

Capítulo II - Dos Termos de Abertura e de Encerramento

Art. 9º Os instrumentos de escrituração das entidades conterão termos de abertura e de encerramento,
        que indicarão:

        I - TERMO DE ABERTURA:

            a) o nome empresarial do empresário ou da sociedade empresária a que pertença o
               instrumento de escrituração;

            b) o Número de Identificação do Registro de Empresas - NIRE e a data do arquivamento dos
               atos constitutivos ou do ato de conversão de sociedade simples em sociedade empresá-
               ria pela Junta Comercial;

            c) o município da sede ou filial;

            d) a finalidade a que se destina o instrumento de escrituração (denominação do livro);

            e) o número de ordem do instrumento de escrituração;

            f) a quantidade de:

               f.1 - folhas, se numeradas apenas no anverso;
               f.2 - páginas, se numeradas no anverso e verso;
               f.3 - fotogramas, se microfichas;
               f.4 - registros, se livro digital;

            g) o número da inscrição no Cadastro Nacional da Pessoa Jurídica - CNPJ, administrado
               pela Receita Federal do Brasil;

            h) data de encerramento do exercício social.

        II - TERMO DE ENCERRAMENTO:

            a) o nome da entidade a que pertença o instrumento de escrituração;

            b) o fim a que se destinou o instrumento escriturado (denominação do livro);

            c) o período a que se refere a escrituração, nos livros contábeis;

            d) a data de início do período da escrituração, nos livros de natureza não contábil,
               quando apresentados em branco para autenticação;

            e) o número de ordem do instrumento de escrituração;

            f) a quantidade de:

               f.1 - folhas, se numeradas apenas no anverso;
               f.2 - páginas, se numeradas no anverso e verso;
               f.3 - fotogramas, se microfichas;
               f.4 - registros, se livro digital.



        § 1º No Termo de Encerramento do livro Diário com escrituração resumida deverá constar
             relação que identifique todos os livros auxiliares a ele associados, com indicação da
             finalidade de cada um deles e seus respectivos números sequenciais.

        § 2º Cada livro auxiliar, no respectivo Termo de Encerramento, deverá indicar o(s) número(s)
             do(s) livro(s) Diário com escrituração resumida a que esteja(m) vinculado(s).

        § 3º Quando os livros Diário com escrituração resumida e seus auxiliares forem digitais, as
             informações previstas nos parágrafos 1º e 2º serão inseridas em registro específico.

        § 4º Existindo erro ou omissão de algum dado obrigatório do Termo de Abertura, Termo de
             Encerramento ou de formalidade intrínseca relacionadas à apresentação ou aparência das
             demonstrações contábeis, no livro em papel, poderá ser feita ressalva na própria folha
             ou página, a qual deverá ser assinada pelos mesmos signatários do Termo e homologada
             pelo autenticador do instrumento pela Junta Comercial, mediante Termo de homologação
             por esse datado e assinado.

Art. 10: Os Termos de Abertura e de Encerramento serão datados e assinados pelo empresário,
         administrador de sociedade empresária ou procurador e por contabilista legalmente habili-
         tado, com indicação do número de sua inscrição no Conselho Regional de Contabilidade - CRC
         e dos nomes completos dos signatários e das respectivas funções (art. 7º do Decreto nº
         64.567, de 1969), consoante o parágrafo primeiro deste artigo.

         § 1º As funções a que se refere o caput do presente artigo, são as constantes da Tabela de
              Qualificação de Assinantes abaixo:

              Código                           Descrição da função
                203         Diretor
                204         Conselheiro de Administração
                205         Administrador
                206         Administrador de Grupo
                207         Administrador de Sociedade Filiada
                220         Administrador Judicial - Pessoa Física
                222         Administrador Judicial -Pessoa Jurídica -Profissional Responsável
                223         Administrador Judicial/Gestor
                226         Gestor Judicial
                309         Procurador
                312         Inventariante
                313         Liquidante
                315         Interventor
                801         Empresário
                401         Titular Pessoa Física - EIRELI
                900         Contador
                999         Outros
---------------------------------------------------------------------------------------------------}
interface

uses
  SysUtils, Classes, FR_Class, clparametrossistema, ctconstantes,
  dmbasico, ZTransact;

type
  TdtmImprimeTermos = class(TDtmBasico)
    frpTermos_P: TfrReport;
    frpTermos_R: TfrReport;
    procedure frpTermos_PGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpTermos_RBeforePrint(Memo: TStringList; View: TfrView);
    procedure frpTermos_RGetValue(const ParName: String;
      var ParValue: Variant);
    procedure frpTermos_PBeforePrint(Memo: TStringList; View: TfrView);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmImprimeTermos: TdtmImprimeTermos;

implementation

{$R *.dfm}

procedure TdtmImprimeTermos.frpTermos_PGetValue(const ParName: String;
  var ParValue: Variant);
begin
  if ParName = 'NOMECONTADOR' then ParValue := ParSistema.NomeContador
  else if ParName = 'CPFCONTADOR' then ParValue := ParSistema.CPFContador
  else if ParName = 'CRCCONTADOR' then ParValue := ParSistema.CRCContador
  else if ParName = 'RESPONSAVEL1' then ParValue := ParSistema.ResponsavelLivros1
  else if ParName = 'RESPONSAVEL2' then ParValue := ParSistema.ResponsavelLivros2
  else if Parname = 'FOLHA_OU_PAGINA' then
       case ParSistema.LivrosFiscaisFolhaouPagina of
        0: ParValue := ctFOLHA;
        1: ParValue := ctPAGINA;
       end;
end;

procedure TdtmImprimeTermos.frpTermos_RBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpTermos_R, View);
end;

procedure TdtmImprimeTermos.frpTermos_RGetValue(const ParName: String;
  var ParValue: Variant);
begin
  inherited;
  if ParName = 'NOMECONTADOR' then ParValue := ParSistema.NomeContador
  else if ParName = 'CPFCONTADOR' then ParValue := ParSistema.CPFContador
  else if ParName = 'CRCCONTADOR' then ParValue := ParSistema.CRCContador
  else if ParName = 'RESPONSAVEL1' then ParValue := ParSistema.ResponsavelLivros1
  else if ParName = 'RESPONSAVEL2' then ParValue := ParSistema.ResponsavelLivros2
  else if Parname = 'FOLHA_OU_PAGINA' then
       case ParSistema.LivrosFiscaisFolhaouPagina of
        0: ParValue := ctFOLHA;
        1: ParValue := ctPAGINA;
       end;
end;

procedure TdtmImprimeTermos.frpTermos_PBeforePrint(Memo: TStringList;
  View: TfrView);
begin
  inherited;
  ZebrarLinhaRelatorio(frpTermos_P, View);
end;

end.
