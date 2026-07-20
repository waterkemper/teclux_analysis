object dtmSenhaAutorizacao: TdtmSenhaAutorizacao
  OldCreateOrder = False
  Left = 285
  Top = 340
  Height = 162
  Width = 283
  object dbaTecSoft: TtecDatabase
    BeforeConnect = dbaTecSoftBeforeConnect
    Port = '5432'
    Encoding = etNone
    LoginPrompt = False
    Connected = False
    Left = 50
    Top = 30
  end
  object tstTransact: TtecTransact
    Options = [toHourGlass]
    AutoCommit = False
    Database = dbaTecSoft
    AutoRecovery = True
    TransactSafe = True
    TransIsolation = ptDefault
    Left = 135
    Top = 30
  end
end
