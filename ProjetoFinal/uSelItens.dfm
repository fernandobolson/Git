inherited FSelItens: TFSelItens
  Caption = 'Sele'#231#227'o de Itens / Servi'#231'os'
  ClientWidth = 1021
  ExplicitWidth = 1037
  ExplicitHeight = 361
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 1021
    ExplicitWidth = 1021
  end
  inherited cxGrid: TcxGrid
    Width = 1021
    ExplicitWidth = 1021
    inherited cxGridTableView: TcxGridDBTableView
      object cxGridTableViewCD_PRODSERV: TcxGridDBColumn
        Caption = 'C'#243'd. Item'
        DataBinding.FieldName = 'CD_PRODSERV'
      end
      object cxGridTableViewNM_PRODSERV: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NM_PRODSERV'
      end
      object cxGridTableViewPRECOVENDA: TcxGridDBColumn
        DataBinding.FieldName = 'PRECOVENDA'
      end
      object cxGridTableViewCODIGOBARRAS: TcxGridDBColumn
        DataBinding.FieldName = 'CODIGOBARRAS'
      end
      object cxGridTableViewQTDATUAL: TcxGridDBColumn
        DataBinding.FieldName = 'QTDATUAL'
      end
    end
  end
  inherited cdsSel: TClientDataSet
    Active = True
    object cdsSelCD_PRODSERV: TIntegerField
      FieldName = 'CD_PRODSERV'
      Required = True
    end
    object cdsSelREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object cdsSelCODIGOBARRAS: TStringField
      FieldName = 'CODIGOBARRAS'
      Size = 50
    end
    object cdsSelTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 1
    end
    object cdsSelUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 5
    end
    object cdsSelCATEGORIA: TIntegerField
      FieldName = 'CATEGORIA'
    end
    object cdsSelQTDMIN: TFloatField
      FieldName = 'QTDMIN'
    end
    object cdsSelQTDATUAL: TFloatField
      FieldName = 'QTDATUAL'
    end
    object cdsSelQTDMAX: TFloatField
      FieldName = 'QTDMAX'
    end
    object cdsSelPRECOVENDA: TFloatField
      FieldName = 'PRECOVENDA'
    end
    object cdsSelOBS_GERAIS: TStringField
      FieldName = 'OBS_GERAIS'
      Size = 200
    end
    object cdsSelMARCA: TStringField
      FieldName = 'MARCA'
      Size = 50
    end
    object cdsSelFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object cdsSelNM_PRODSERV: TStringField
      FieldName = 'NM_PRODSERV'
      Size = 100
    end
    object cdsSelDTVALIDADE: TDateField
      FieldName = 'DTVALIDADE'
    end
  end
  inherited qrySel: TSQLQuery
    Active = True
    MaxBlobSize = 1
    SQL.Strings = (
      'SELECT * FROM PRODSERV')
  end
  inherited cxStyleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
