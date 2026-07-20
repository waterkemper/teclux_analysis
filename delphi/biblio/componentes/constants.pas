unit constants;

interface

type

  TtecPrivilege = (pvSELECT, pvINSERT, pvDELETE, pvUPDATE, pvEXECUTE);
  TtecSetPrivilege = Set of TtecPrivilege;

implementation

end.
 