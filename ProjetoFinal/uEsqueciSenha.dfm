object FEsqueciSenha: TFEsqueciSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Esqueci minha senha!'
  ClientHeight = 256
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 38
    Top = 27
    Width = 48
    Height = 16
    Caption = 'Usu'#225'rio:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Senha: TLabel
    Left = 38
    Top = 99
    Width = 41
    Height = 16
    Caption = 'Senha:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ebSenha: TMaskEdit
    Left = 85
    Top = 98
    Width = 214
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
    Text = ''
    TextHint = 'Senha'
  end
  object ebUser: TMaskEdit
    Left = 38
    Top = 46
    Width = 214
    Height = 21
    TabOrder = 1
    Text = ''
    TextHint = 'Us'#250'ario'
  end
  object cxDBComboBox1: TcxDBComboBox
    Left = 342
    Top = 60
    TabOrder = 2
    Width = 173
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 395
    Top = 140
  end
end
