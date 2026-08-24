object dtmSenhaAutorizacao: TdtmSenhaAutorizacao
  OldCreateOrder = False
  Left = 285
  Top = 340
  Height = 162
  Width = 283
  object dbaTecSoft_u: TtecDatabase
    Port = '5432'
    Encoding = etNone
    LoginPrompt = False
    Connected = False
    Left = 50
    Top = 30
  end
  object tstTecSoft_u: TtecTransact
    Options = []
    AutoCommit = False
    Database = dbaTecSoft_u
    AutoRecovery = True
    TransactSafe = True
    TransIsolation = ptDefault
    Left = 138
    Top = 38
  end
end
