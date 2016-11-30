inherited FSelCidade: TFSelCidade
  Caption = 'Sele'#231#227'o de Cidades'
  PixelsPerInch = 96
  TextHeight = 13
  inherited cxGrid: TcxGrid
    inherited cxGridTableView: TcxGridDBTableView
      object cxGridTableViewCD_CIDADE: TcxGridDBColumn
        Caption = 'C'#243'd. Cidade'
        DataBinding.FieldName = 'CD_CIDADE'
      end
      object cxGridTableViewNM_CIDADE: TcxGridDBColumn
        Caption = 'Nome'
        DataBinding.FieldName = 'NM_CIDADE'
        Width = 542
      end
      object cxGridTableViewCD_ESTADO: TcxGridDBColumn
        DataBinding.FieldName = 'CD_ESTADO'
        Visible = False
      end
    end
  end
  inherited cdsSel: TClientDataSet
    Active = True
  end
  inherited qrySel: TSQLQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM CIDADE')
  end
  inherited cxStyleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
end
