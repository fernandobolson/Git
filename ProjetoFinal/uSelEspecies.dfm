inherited FSelEspecies: TFSelEspecies
  Caption = 'Sele'#231#227'o de Esp'#233'cies'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    inherited cxGridTableView: TcxGridDBTableView
      object cxGridTableViewID: TcxGridDBColumn
        Caption = 'C'#243'd. Esp'#233'cie'
        DataBinding.FieldName = 'ID'
        Width = 78
      end
      object cxGridTableViewDESCRICAO: TcxGridDBColumn
        Caption = 'Nome Esp'#233'cie'
        DataBinding.FieldName = 'DESCRICAO'
      end
    end
  end
  inherited cdsSel: TClientDataSet
    Active = False
    object cdsSelID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSelDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 200
    end
  end
end
