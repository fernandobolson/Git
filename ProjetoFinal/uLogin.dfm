object FLogin: TFLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 330
  ClientWidth = 297
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 42
    Top = 140
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
    Left = 42
    Top = 186
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
  object lbEsqueciSenha: TLabel
    Left = 70
    Top = 262
    Width = 158
    Height = 13
    Caption = 'Esqueceu sua senha? Clique aqui'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = lbEsqueciSenhaClick
  end
  object Label4: TLabel
    Left = 77
    Top = 40
    Width = 147
    Height = 42
    Caption = 'VetShop'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ebSenha: TMaskEdit
    Left = 42
    Top = 205
    Width = 214
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = ''
    TextHint = 'Senha'
  end
  object btEntrar: TcxButton
    Left = 54
    Top = 232
    Width = 88
    Height = 24
    Action = acConectar
    TabOrder = 3
  end
  object ebUser: TMaskEdit
    Left = 42
    Top = 159
    Width = 214
    Height = 21
    TabOrder = 1
    Text = ''
    TextHint = 'Us'#250'ario'
  end
  object Panel1: TPanel
    Left = -12
    Top = 88
    Width = 328
    Height = 29
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
  end
  object btFechar: TcxButton
    Left = 157
    Top = 232
    Width = 88
    Height = 24
    Action = acFechar
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 0
    Top = 299
    Width = 297
    Height = 31
    Align = alBottom
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 5
    object lbDesenv: TLabel
      Left = 38
      Top = 9
      Width = 223
      Height = 13
      Caption = 'Desenvolvido por Fernando Bolson Dias - 2016'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object qryLogin: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmPrinc.sqlCon
    Left = 258
    Top = 12
  end
  object acLogin: TActionList
    Left = 14
    Top = 11
    object acConectar: TAction
      Caption = 'Conectar'
      OnExecute = acConectarExecute
    end
    object acFechar: TAction
      Caption = 'Fechar'
      OnExecute = acFecharExecute
    end
  end
end
