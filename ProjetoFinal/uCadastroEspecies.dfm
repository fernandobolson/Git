inherited FCadEspecie: TFCadEspecie
  Caption = 'FCadEspecie'
  ClientHeight = 548
  ClientWidth = 868
  ExplicitWidth = 874
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnCaption: TPanel
    Width = 868
    ExplicitWidth = 868
    inherited lbNameCrud: TLabel
      Width = 203
      Caption = 'Cadastro de Esp'#233'cies'
      ExplicitWidth = 203
    end
  end
  inherited PnTools: TPanel
    Width = 868
    ExplicitWidth = 868
    inherited cxGroupBox4: TcxGroupBox
      Left = 787
      ExplicitLeft = 787
    end
  end
  inherited PC: TcxPageControl
    Width = 868
    Height = 444
    ExplicitWidth = 868
    ExplicitHeight = 444
    ClientRectBottom = 440
    ClientRectRight = 864
    inherited tbCadastro: TcxTabSheet
      ExplicitLeft = 4
      ExplicitTop = 41
      ExplicitWidth = 860
      ExplicitHeight = 399
      object Label3: TLabel [0]
        Left = 23
        Top = 72
        Width = 147
        Height = 18
        Caption = 'Descri'#231#227'o.................'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel [1]
        Left = 23
        Top = 31
        Width = 127
        Height = 18
        Caption = 'N'#186' Identificador.....'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object EB_DESCRICAO: TcxDBTextEdit [2]
        Left = 149
        Top = 69
        DataBinding.DataField = 'DESCRICAO'
        DataBinding.DataSource = dsPadrao
        Style.BorderStyle = ebsUltraFlat
        TabOrder = 3
        Width = 352
      end
      object EB_ID: TcxDBTextEdit [3]
        Left = 149
        Top = 32
        DataBinding.DataField = 'ID'
        DataBinding.DataSource = dsPadrao
        Properties.ReadOnly = True
        TabOrder = 1
        Width = 68
      end
      inherited GB2: TcxGroupBox
        TabOrder = 2
      end
      inherited GB3: TcxGroupBox
        TabOrder = 4
      end
    end
    inherited tbConsulta: TcxTabSheet
      ExplicitWidth = 860
      ExplicitHeight = 399
      inherited cxGrid: TcxGrid
        Width = 860
        Height = 399
        ExplicitWidth = 860
        ExplicitHeight = 399
        inherited cxGridTableView: TcxGridDBTableView
          object cxGridTableViewID: TcxGridDBColumn
            Caption = 'C'#243'd Id'
            DataBinding.FieldName = 'ID'
            Width = 71
          end
          object cxGridTableViewDESCRICAO: TcxGridDBColumn
            Caption = 'Descri'#231#227'o'
            DataBinding.FieldName = 'DESCRICAO'
            Width = 793
          end
        end
      end
    end
  end
  inherited cdsPadrao: TClientDataSet
    Active = True
    object cdsPadraoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPadraoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
  end
  inherited cxStyleRepo: TcxStyleRepository
    PixelsPerInch = 96
  end
  inherited QryPadrao: TSQLQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM ESPECIES')
  end
end
