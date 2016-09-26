unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxGroupBox, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TFLogin = class(TForm)
    cxGroupBox1: TcxGroupBox;
    dbLogin: TcxDBMaskEdit;
    Label1: TLabel;
    Senha: TLabel;
    dbSenha: TcxDBMaskEdit;
    btEntrar: TcxButton;
    btSair: TcxButton;
    qryLogin: TSQLQuery;
    procedure btEntrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
    lLogado : Boolean;
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses uClientDataSetHelper, uDmPrinc, uMenuBase, uUsuario, BibStr;

procedure TFLogin.btEntrarClick(Sender: TObject);
begin
  lLogado := False;
  qryLogin.SQL.Text :=
    'SELECT NOME, SENHA FROM USUARIO WHERE LOGIN = '+ QuotedStr(dbLogin.Text);
  qryLogin.Open;

  //Verifica se est� vazio a query
  if (qryLogin.IsEmpty) then
    begin
    ShowMessage('Usu�rio n�o encontrado!');
    dbLogin.SetFocus;
  end
  else
    begin
    if (qryLogin.FieldByName('SENHA').AsString = edtSenha.Text) then
      begin
      //ShowMessage('Usu�rio validado com sucesso!');
      lLogado := true;
      cUsuario := qryLogin.FieldByName('NOME').AsString;
      Self.Close;
    end
    else
      begin
      ShowMessage('Senha inv�lida!');
      edtSenha.SetFocus;
    end;
  end;

  qryLogin.Close;
end;

procedure TFLogin.btSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if lLogado then
    Action := caFree //Fecha essa tela e abre o menu
  else
    Application.Terminate;  //Encerra a aplica��o
end;

procedure TFLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
    begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.