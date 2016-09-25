unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxGroupBox, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList;

type
  TFLogin = class(TForm)
    cxGroupBox1: TcxGroupBox;
    dbLogin: TcxDBMaskEdit;
    Label1: TLabel;
    Senha: TLabel;
    dbSenha: TcxDBMaskEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    acLogin: TActionList;
    acLogar: TAction;
    acSair: TAction;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses uClientDataSetHelper, uDmPrinc, uMenuBase, uUsuario, BibStr;

procedure TFLogin.cxButton1Click(Sender: TObject);
begin
  ShowMessage(Encript(dbSenha.Text));
end;

end.
