unit frcgccpf;

interface

uses
  //CLX
  SysUtils, Types, Classes, Graphics, Controls, Forms, Dialogs, DBCtrls, cpdbtext, StdCtrls,
  Mask, cpcpfcnpj2;

type
  TfraCPFCGC = class(TFrame)
    dtxCPFCGC: TDBEditCPFCNPJ2;
    lblcpfcgc: TLabel;
  end;

implementation

{$R *.dfm}

end.
