unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxGroupBox, Vcl.Mask;

type
  TFAlterarSenha = class(TForm)
    cxGroupBox1: TcxGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    Senha: TLabel;
    ebSenha: TMaskEdit;
    ebUser: TMaskEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlterarSenha: TFAlterarSenha;

implementation

{$R *.dfm}

end.
