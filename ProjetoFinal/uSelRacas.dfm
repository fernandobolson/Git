inherited FSelRacas: TFSelRacas
  Caption = 'Sele'#231#227'o de Ra'#231'as'
  ClientWidth = 697
  ExplicitWidth = 713
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 697
  end
  inherited cxGrid: TcxGrid
    Width = 697
    inherited cxGridTableView: TcxGridDBTableView
      object cxGridTableViewCD_RACA: TcxGridDBColumn
        Caption = 'C'#243'd. Ra'#231'a'
        DataBinding.FieldName = 'CD_RACA'
      end
      object cxGridTableViewNM_RACA: TcxGridDBColumn
        Caption = 'Nome Ra'#231'a'
        DataBinding.FieldName = 'NM_RACA'
        Width = 401
      end
      object cxGridTableViewCD_ESPECIE: TcxGridDBColumn
        Caption = 'C'#243'd. Esp'#233'cie'
        DataBinding.FieldName = 'CD_ESPECIE'
        Width = 72
      end
      object cxGridTableViewNM_ESPECIE: TcxGridDBColumn
        Caption = 'Nome Esp'#233'cie'
        DataBinding.FieldName = 'NM_ESPECIE'
      end
    end
  end
  inherited cdsSel: TClientDataSet
    object cdsSelCD_RACA: TIntegerField
      FieldName = 'CD_RACA'
      Required = True
    end
    object cdsSelCD_ESPECIE: TIntegerField
      FieldName = 'CD_ESPECIE'
      Required = True
    end
    object cdsSelNM_RACA: TStringField
      FieldName = 'NM_RACA'
      Size = 100
    end
    object cdsSelPORTE: TStringField
      FieldName = 'PORTE'
      FixedChar = True
      Size = 1
    end
    object cdsSelFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 1
    end
    object cdsSelNM_ESPECIE: TStringField
      FieldName = 'NM_ESPECIE'
      Size = 100
    end
  end
  inherited qrySel: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'ESPECIE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM RACA WHERE CD_ESPECIE =:ESPECIE')
  end
  inherited cxStyleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
