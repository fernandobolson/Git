object FLogin: TFLogin
  Left = 0
  Top = 0
  Caption = 'Acessar Sistema VetShop 1.0.0.1'
  ClientHeight = 318
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 127
    Caption = 'Por favor, Insira suas credenciais'
    TabOrder = 0
    Height = 183
    Width = 320
    object Label1: TLabel
      Left = 15
      Top = 42
      Width = 35
      Height = 16
      Caption = 'Login:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Senha: TLabel
      Left = 15
      Top = 75
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
    object dbLogin: TcxDBMaskEdit
      Left = 69
      Top = 75
      Properties.PasswordChar = '*'
      TabOrder = 0
      Width = 203
    end
    object dbSenha: TcxDBMaskEdit
      Left = 69
      Top = 40
      TabOrder = 1
      Width = 203
    end
    object btEntrar: TcxButton
      Left = 79
      Top = 102
      Width = 75
      Height = 25
      Hint = 'Pressione para tentar entrar no sistema'
      Caption = 'Entrar'
      TabOrder = 2
      OnClick = btEntrarClick
    end
    object btSair: TcxButton
      Left = 181
      Top = 102
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
      OnClick = btSairClick
    end
  end
  object qryLogin: TSQLQuery
    Params = <>
    Left = 224
    Top = 56
  end
end
