object FSelPadrao: TFSelPadrao
  Left = 0
  Top = 0
  Caption = 'FSelPadrao'
  ClientHeight = 322
  ClientWidth = 652
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 287
    Width = 652
    Height = 35
    Align = alBottom
    TabOrder = 1
    object btSelReg: TButton
      Left = 16
      Top = 6
      Width = 129
      Height = 25
      Caption = 'Selecionar Registro'
      TabOrder = 0
      OnClick = btSelRegClick
    end
    object btCancelar: TButton
      Left = 168
      Top = 6
      Width = 129
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btCancelarClick
    end
  end
  object cxGrid: TcxGrid
    Left = 0
    Top = 0
    Width = 652
    Height = 287
    Align = alClient
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    object cxGridTableView: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      OnCellDblClick = cxGridTableViewCellDblClick
      DataController.DataSource = dsSel
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Clique aqui para definir um filtro'
      FilterRow.Visible = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.InvertSelect = False
      OptionsView.NoDataToDisplayInfoText = '<N'#227'o h'#225' informa'#231#245'es para exibi'#231#227'o>'
      OptionsView.GroupByBox = False
      Styles.ContentEven = StyleAzul
    end
    object cxGridLevel: TcxGridLevel
      GridView = cxGridTableView
    end
  end
  object cdsSel: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSel'
    Left = 32
    Top = 144
  end
  object dsSel: TDataSource
    DataSet = cdsSel
    Left = 32
    Top = 200
  end
  object qrySel: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      '')
    SQLConnection = DmPrinc.sqlCon
    Left = 32
    Top = 24
  end
  object dspSel: TDataSetProvider
    DataSet = qrySel
    Left = 32
    Top = 80
  end
  object cxStyleRepo: TcxStyleRepository
    Left = 260
    Top = 86
    PixelsPerInch = 96
    object StyleAzul: TcxStyle
      AssignedValues = [svColor]
      Color = clGradientInactiveCaption
    end
    object StyleVerde: TcxStyle
      AssignedValues = [svColor]
      Color = clMoneyGreen
    end
    object cxStyleOver: TcxStyle
      AssignedValues = [svColor]
      Color = 14680021
    end
  end
end
