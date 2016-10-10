unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxGroupBox, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TFLogin = class(TForm)
    qryLogin: TSQLQuery;
    Label1: TLabel;
    Senha: TLabel;
    ebSenha: TMaskEdit;
    lbEsqueciSenha: TLabel;
    btEntrar: TcxButton;
    ebUser: TMaskEdit;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    lbVersao: TLabel;
    btFechar: TcxButton;
    Panel2: TPanel;
    lbDesenv: TLabel;
    acLogin: TActionList;
    acConectar: TAction;
    acFechar: TAction;

    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormCreate(Sender: TObject);
    procedure acConectarExecute(Sender: TObject);
    procedure acFecharExecute(Sender: TObject);
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

uses
  uClientDataSetHelper
  , uDmPrinc
  , uMenuBase
  , uUsuario
  , BibStr
  , BibGeral;

procedure TFLogin.acConectarExecute(Sender: TObject);
begin
  lLogado := False;
  qryLogin.SQL.Text :=
    'SELECT NOME, SENHA FROM USUARIO WHERE LOGIN = '+ QuotedStr(ebUser.Text);
  qryLogin.Open;

  //Verifica se está vazio a query
  if (qryLogin.IsEmpty) then
    begin
    RespOkCancel('Atenção', 'Usuário não encontrado');
    ebUser.SetFocus;
  end
  else
    begin
    if (qryLogin.FieldByName('SENHA').AsString = ebSenha.Text) then
      begin
      lLogado := true;
      cUsuario := qryLogin.FieldByName('NOME').AsString;
      Self.Close;
    end
    else
      begin
      ShowMessage('Senha inválida!');
      ebSenha.SetFocus;
    end;
  end;

  qryLogin.Close;
end;

procedure TFLogin.acFecharExecute(Sender: TObject);
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
var
  sVersao : String;
begin
  sVersao := GetVersaoAtual;
  Self.Caption := 'Acesso ao sistema VetShop '+ sVersao;
  lbVersao.Caption := 'Versão: ' + sVersao;
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
