object FAlterarSenha: TFAlterarSenha
  Left = 0
  Top = 0
  Caption = 'Alterar Senha'
  ClientHeight = 158
  ClientWidth = 384
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Caption = 'Informe uma nova senha'
    TabOrder = 0
    Height = 142
    Width = 368
    object Label1: TLabel
      Left = 42
      Top = 22
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
      Top = 72
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
      Left = 42
      Top = 94
      Width = 214
      Height = 21
      PasswordChar = '*'
      TabOrder = 1
      Text = ''
      TextHint = 'Senha'
    end
    object ebUser: TMaskEdit
      Left = 42
      Top = 45
      Width = 214
      Height = 21
      TabOrder = 0
      Text = ''
      TextHint = 'Us'#250'ario'
    end
  end
  object Edit1: TEdit
    Left = 382
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
end
