unit frdadoscliente;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask,
  //Repositorio
  frtelefone, frfoneramal, frendereco, frcgcoucpf,
  //Componentes
  cpdbdata, cptexto, cpnumero, cpdbtext, cpcpfcnpj2;

type
  TfraDadosCliente = class(TFrame)
    gbxDadosCliente: TGroupBox;
    lblNomeCliente: TLabel;
    dtxNomeCliente: TtecDBText;
    dxtNasctoCliente: TtecDBText;
    fraEnderecoCliente: TfraEndereco;
    frFoneResidencial: TfraFoneRamal;
    gbxDocumentoCliente: TGroupBox;
    lblNumeroDocumento: TLabel;
    lblOrgaoDoc: TLabel;
    lblEmissaoDocumento: TLabel;
    lblEstadoEmissao: TLabel;
    dtxIdDataCliente: TtecDBText;
    dtxIdEstadoCliente: TtecDBText;
    dtxIdOrgaoCliente: TtecDBText;
    dtxIdDocumentoCliente: TtecDBText;
    lblDataNascimento: TLabel;
    gbxEmpresaCliente: TGroupBox;
    frFoneEmpresa: TfraFoneRamal;
    lblNomeEmpresa: TLabel;
    dtxEmpresaCliente: TtecDBText;
    lblCPFCNPJ: TLabel;
    DBEditTexto1: TDBEditCPFCNPJ2;
    dtxDescricaoConceito: TtecDBText;
    lblConceito: TLabel;
  end;

implementation

{$R *.dfm}

end.
