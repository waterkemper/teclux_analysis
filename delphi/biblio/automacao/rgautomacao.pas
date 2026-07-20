unit rgautomacao;

interface

uses
  classes;

implementation

uses
{  clecf_bematech, clecf_elgin, clecf_mecaf, climpressorachequebematech, climpressorachequetsp;}

  clecf, {clecf_bematech, clecf_mecaf, clecf_daruma, clecf_elgin, clecf_sweda,}
  climpressorachequepadrao, climpressorachequebematech, climpressorachequetsp,
  cltextprinter, cltefdedicado{$IFDEF MSWINDOWS}, clbackuptefdiscado{$ENDIF};

initialization
  RegisterClasses([{TtecECFBematech, TtecECFMecaf, TtecECFDaruma, TtecECFElgin, TtecECFSweda,}
                   TtecImpChequeBematech, TtecImpChequeTSP]);

{  RegisterClasses([TtecECFBematech, TtecECFMecaf, TtecImpChequeBematech,
                   TtecImpChequeTSP]);
 }

end.
