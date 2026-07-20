library ecfmecaf;

uses
  SysUtils,
  Classes,
  bbmecaf in 'bbmecaf.pas';

{$SONAME 'tececfmecaf.so'}
{$SOPREFIX 'tec'}
{$SOVERSION '1.0'}

exports
    OpenCif name 'OpenCif',
    CloseCif name 'CloseCif',
    ImprimeValidacao name 'ImprimeValidacao',
    ModoChequeValidacao name 'ModoChequeValidacao',
    ImprimeCheque name 'ImprimeCheque',
    CancelaChequeValidacao name 'CancelaChequeValidacao',
    AbreCupomFiscal name 'AbreCupomFiscal',
    VendaItem name 'VendaItem',
    DescontoItem name 'DescontoItem',
    TotalizarCupom name 'TotalizarCupom',
    TotalizarCupomParcial name 'TotalizarCupomParcial',
    PagamentoA name 'Pagamento',
    CancelamentoItem name 'CancelamentoItem',
    FechaCupomFiscalA name 'FechaCupomFiscal',
    CancelaCupomFiscal name 'CancelaCupomFiscal',
    LeituraX name 'LeituraX',
    ReducaoZ name 'ReducaoZ',
    LeMemFiscalData name 'LeMemFiscalData',
    LeMemFiscalReducaoA name 'LeMemFiscalReducao',
    AbreCupomVinculado name 'AbreCupomVinculado',
    AbreCupomNaoVinculado name 'AbreCupomNaoVinculado',
    EncerraCupomNaoFiscal name 'EncerraCupomNaoFiscal',
    CancelaCupomNaoFiscal name 'CancelaCupomNaoFiscal',
    OperRegNaoVinculadoA name 'OperRegNaoVinculado',
    ImprimeLinhaNaoFiscalA name 'ImprimeLinhaNaoFiscal',
    ImprimeNaoFiscal name 'ImprimeNaoFiscal',
    ProgramaLegenda name 'ProgramaLegenda',
    AbrirGaveta name 'AbrirGaveta',
    ProgramaHorarioVerao name 'ProgramaHorarioVerao',
    ImprimeTotalizadores name 'ImprimeTotalizadores',
    TransTabAliquotas name 'TransTabAliquotas',
    TransTotCont name 'TransTotCont',
    TransStatus name 'TransStatus',
    TransDataHora name 'TransDataHora',
    EcfPar name 'EcfPar',
    ProgLinhaAdicional name 'ProgLinhaAdicional',
    AjusteHora name 'AjusteHora',
    EcfID name 'EcfID',
    ObtemRetorno name 'ObtemRetorno',
    ProgRelogio name 'ProgRelogio',
    GravaDados name 'GravaDados',
    RecompoeDadosNOVRAM name 'RecompoeDadosNOVRAM',
    ProgAliquotas name 'ProgAliquotas',
    ProgSimbolo name 'ProgSimbolo',
    ProgRazaoSocial name 'ProgRazaoSocial',
    Prog_Moeda name 'Prog_Moeda',
    ProgArredondamento name 'ProgArredondamento';

procedure SignalHandler(Reason: Integer);
begin
  if Reason = 0 then
    UnhookSignal(RTL_SIGDEFAULT);
end;

begin
  HookSignal(RTL_SIGDEFAULT);
  DllProc := @SignalHandler;
end.
