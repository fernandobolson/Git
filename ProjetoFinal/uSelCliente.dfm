inherited FSelClientes: TFSelClientes
  Caption = 'Sele'#231#227'o de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    inherited cxGridTableView: TcxGridDBTableView
      object cxGridTableViewCD_CLIENTE: TcxGridDBColumn
        Caption = 'C'#243'd. Cliente'
        DataBinding.FieldName = 'CD_CLIENTE'
      end
      object cxGridTableViewNM_CLIENTE: TcxGridDBColumn
        Caption = 'Nome Cliente'
        DataBinding.FieldName = 'NM_CLIENTE'
      end
    end
  end
  inherited cdsSel: TClientDataSet
    Active = True
  end
  inherited qrySel: TSQLQuery
    SQL.Strings = (
      'SELECT CD_CLIENTE, NM_CLIENTE  FROM CLIENTE')
  end
  inherited cxStyleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
