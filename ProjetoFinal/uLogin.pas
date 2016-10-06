unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxGroupBox, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFLogin = class(TForm)
    qryLogin: TSQLQuery;
    StatusBar1: TStatusBar;
    dbSenha: TcxDBMaskEdit;
    Label1: TLabel;
    Senha: TLabel;
    dbLogin: TcxDBMaskEdit;
    btEntrar: TSpeedButton;
    Image1: TImage;
    procedure btEntrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cUsuario : String;
    lLogado : Boolean;
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses uClientDataSetHelper, uDmPrinc, uMenuBase, uUsuario, BibStr, BibGeral;

procedure TFLogin.btEntrarClick(Sender: TObject);
begin
  lLogado := False;
  qryLogin.SQL.Text :=
    'SELECT NOME, SENHA FROM USUARIO WHERE LOGIN = '+ QuotedStr(dbLogin.Text);
  qryLogin.Open;

  //Verifica se está vazio a query
  if (qryLogin.IsEmpty) then
    begin
//    ShowMessage('Usuário não encontrado!');
    RespOkCancel('Atenção', 'Usuário não encontrado');
    dbLogin.SetFocus;
  end
  else
    begin
    if (qryLogin.FieldByName('SENHA').AsString = dbSenha.Text) then
      begin
      //ShowMessage('Usuário validado com sucesso!');
      lLogado := true;
      cUsuario := qryLogin.FieldByName('NOME').AsString;
      Self.Close;
    end
    else
      begin
      ShowMessage('Senha inválida!');
      dbSenha.SetFocus;
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
    Application.Terminate;  //Encerra a aplicação
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Acesso ao sistema '+ GetVersaoAtual;
end;

procedure TFLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
