object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'VetSoft 1.0.0.1'
  ClientHeight = 377
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 39
    Width = 759
    Height = 32
    Align = alTop
    Color = clAqua
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 720
  end
  object ActionMainMenuBar1: TActionMainMenuBar
    Left = 0
    Top = 0
    Width = 759
    Height = 39
    UseSystemFont = False
    ActionManager = acMenu
    Caption = 'ActionMainMenuBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 7171437
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clBlack
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Spacing = 0
    ExplicitWidth = 720
  end
  object acMenu: TActionManager
    ActionBars = <
      item
        Visible = False
      end
      item
        ActionBar = ActionMainMenuBar1
      end>
    Left = 562
    Top = 103
    StyleName = 'Platform Default'
  end
  object ActionList1: TActionList
    Left = 445
    Top = 103
    object Action1: TAction
      Caption = 'Action1'
    end
  end
  object MainMenu1: TMainMenu
    Left = 174
    Top = 133
    object Configurações: TMenuItem
      Caption = 'Configura'#231#245'es'
      object Configuraesgerais1: TMenuItem
        Caption = 'Configura'#231#245'es gerais'
      end
      object ConfiguraesUsuarios1: TMenuItem
        Caption = 'Configura'#231#245'es Usuarios'
      end
    end
  end
end
