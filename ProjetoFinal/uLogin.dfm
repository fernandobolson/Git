object FLogin: TFLogin
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 353
  ClientWidth = 297
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 42
    Top = 151
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
    Top = 197
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
    Top = 273
    Width = 158
    Height = 13
    Caption = 'Esqueceu sua senha? Clique aqui'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 70
    Top = 29
    Width = 138
    Height = 40
    Caption = 'VetShop'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'Lucida Sans Unicode'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbVersao: TLabel
    Left = 98
    Top = 83
    Width = 80
    Height = 13
    Caption = 'lbVersao 1.0.0.1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ebSenha: TMaskEdit
    Left = 42
    Top = 216
    Width = 214
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    Text = ''
    TextHint = 'Senha'
  end
  object btEntrar: TcxButton
    Left = 54
    Top = 243
    Width = 88
    Height = 24
    Action = acConectar
    TabOrder = 3
  end
  object ebUser: TMaskEdit
    Left = 42
    Top = 170
    Width = 214
    Height = 21
    TabOrder = 1
    Text = ''
    TextHint = 'Us'#250'ario'
  end
  object Panel1: TPanel
    Left = -12
    Top = 102
    Width = 328
    Height = 29
    Color = clGradientActiveCaption
    ParentBackground = False
    TabOrder = 0
    object Label3: TLabel
      Left = 107
      Top = 6
      Width = 95
      Height = 16
      Caption = 'Nome empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clHighlightText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object btFechar: TcxButton
    Left = 157
    Top = 243
    Width = 88
    Height = 24
    Action = acFechar
    TabOrder = 4
  end
  object Panel2: TPanel
    Left = 0
    Top = 322
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
    Left = 8
    Top = 13
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
