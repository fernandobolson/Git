object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Sistema VetShop'
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
    object cxButton1: TcxButton
      Left = 79
      Top = 102
      Width = 75
      Height = 25
      Action = acLogar
      TabOrder = 2
    end
    object cxButton2: TcxButton
      Left = 181
      Top = 102
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 3
    end
  end
  object acLogin: TActionList
    Left = 283
    Top = 49
    object acLogar: TAction
      Caption = 'Entrar'
      Hint = 'Pressione para tentar entrar no sistema'
    end
    object acSair: TAction
      Caption = 'Sair'
    end
  end
end
