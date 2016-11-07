inherited FSelPadrao1: TFSelPadrao1
  Caption = 'FSelPadrao1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    ExplicitLeft = 104
    ExplicitTop = 64
    ExplicitWidth = 635
    ExplicitHeight = 264
    inherited cxGridTableView: TcxGridDBTableView
      OnDblClick = nil
      object cxGridTableViewID: TcxGridDBColumn
        Caption = 'C'#243'd. Esp'#233'cie'
        DataBinding.FieldName = 'ID'
      end
      object cxGridTableViewDESCRICAO: TcxGridDBColumn
        Caption = 'Nome Esp'#233'cie'
        DataBinding.FieldName = 'DESCRICAO'
      end
    end
  end
end
