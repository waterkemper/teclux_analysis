object dtmTecSoft: TdtmTecSoft
  OldCreateOrder = True
  Left = 564
  Top = 335
  Height = 332
  Width = 420
  object dbaTecSoft: TtecDatabase
    AfterConnect = dbaTecSoftAfterConnect
    Host = '10.16.1.1'
    Port = '5434'
    Database = 'apolonia'
    Encoding = etNone
    Login = 'tecsoft'
    Password = 'filosofia'
    LoginPrompt = False
    Connected = False
    Left = 50
    Top = 14
  end
  object tstTecSoft: TtecTransact
    Options = []
    AutoCommit = False
    OnAfterConnect = tstTecSoftAfterConnect
    Database = dbaTecSoft
    AutoRecovery = True
    TransactSafe = True
    TransIsolation = ptDefault
    Left = 130
    Top = 22
  end
  object Timer1: TTimer
    Interval = -1
    OnTimer = Timer1Timer
    Left = 200
    Top = 24
  end
  object ZMonitor1: TZMonitor
    OnMonitorEvent = ZMonitor1MonitorEvent
    Left = 72
    Top = 80
  end
end
