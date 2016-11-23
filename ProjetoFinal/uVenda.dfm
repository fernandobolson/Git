object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 479
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PnCaption: TPanel
    Left = 0
    Top = 0
    Width = 720
    Height = 41
    Align = alTop
    Color = 9328397
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -327
    ExplicitWidth = 1020
    object lbNameCrud: TLabel
      AlignWithMargins = True
      Left = 26
      Top = 9
      Width = 117
      Height = 23
      Margins.Top = 10
      Caption = 'lbNameCrud'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
  end
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 41
    Width = 720
    Height = 438
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    ExplicitLeft = 192
    ExplicitTop = 192
    ExplicitWidth = 289
    ExplicitHeight = 193
    ClientRectBottom = 434
    ClientRectLeft = 4
    ClientRectRight = 716
    ClientRectTop = 24
    object cxTabSheet1: TcxTabSheet
      Caption = 'cxTabSheet1'
      ImageIndex = 0
      ExplicitWidth = 685
      ExplicitHeight = 260
      object LabeledEdit1: TLabeledEdit
        Left = 22
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = '* Cliente '
        TabOrder = 0
      end
      object LabeledEdit2: TLabeledEdit
        Left = 149
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Animal'
        TabOrder = 1
      end
      object Panel1: TPanel
        Left = 0
        Top = 260
        Width = 712
        Height = 150
        Align = alBottom
        Caption = 'Panel1'
        TabOrder = 3
        ExplicitTop = 176
        ExplicitWidth = 749
        object cxGrid: TcxGrid
          Left = 1
          Top = 1
          Width = 710
          Height = 148
          Align = alClient
          TabOrder = 0
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = True
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 652
          ExplicitHeight = 287
          object cxGridTableView: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
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
          end
          object cxGridLevel: TcxGridLevel
            GridView = cxGridTableView
          end
        end
      end
      object LabeledEdit3: TLabeledEdit
        Left = 276
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Telefone'
        TabOrder = 2
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'cxTabSheet2'
      ImageIndex = 1
      ExplicitWidth = 685
      ExplicitHeight = 260
    end
  end
end
