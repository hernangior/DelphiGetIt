object MainDM: TMainDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 313
  Width = 471
  object MainFDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite'
      'Database=F:\proj\Delphi\Commercial\TemplateOE\db\oe_template.db')
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object MainQuery: TFDQuery
    Connection = MainFDConnection
    Left = 160
    Top = 32
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 376
    Top = 24
  end
end
