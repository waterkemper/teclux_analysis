unit ctdaruma;

interface

const
  DARUMA_OK                                       = 1;
  DARUMA_ERR_COMUNICACAO                          = 0;
  NAK                                             = 21;
{ST1}
  DARUMA_ERR_ININAOENCONTRADO                     = -4;
  DARUMA_ERR_ABRIRPORTASERIAL                     = -5;


  DARUMA_ERR_NROPARAMETROSINVALIDO                = 1;
  DARUMA_ERR_CUPOMABERTO                          = 2;
  DARUMA_ERR_COMANDOINEXISTENTE                   = 4;
  DARUMA_ERR_PRIMEIROCODIGODIFEREDEESC            = 8;
  DARUMA_ERR_IMPRESSORACOMERRO                    = 16;
  DARUMA_ERR_ERRONORELOGIO                        = 32;
  DARUMA_ERR_POUCOPAPEL                           = 64;
  DARUMA_ERR_FIMPAPEL                             = 128;
{ST2}
  DARUMA_ERR_COMANDONAOEXECUTADO                  = 1;
  DARUMA_ERR_CGCIENAOPROGRAMADO                   = 2;
  DARUMA_ERR_CANCELAMENTONAOPERMITIDO             = 4;
  DARUMA_ERR_NROALIQLOTADA                        = 8;
  DARUMA_ERR_ALIQUOTANAOPROGRAMADA                = 16;
  DARUMA_ERR_ERRORAMCMOS                          = 32;
  DARUMA_ERR_MEMORIAFISCALCHEIA                   = 64;
  DARUMA_ERR_TIPOPARAMETROINVALIDO                = 128;

implementation

end.
