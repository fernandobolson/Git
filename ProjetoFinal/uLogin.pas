unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.StdCtrls,
  cxTextEdit, cxMaskEdit, cxDBEdit, cxGroupBox, Vcl.Menus, cxButtons,
  System.Actions, Vcl.ActnList, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Mask, uDmPrinc;

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
    cUsuario : String;

    procedure ValidaLoginSenha;
  public
    lUsuarioAutorizado : Boolean;
  end;
var
  FLogin: TFLogin;

implementation

{$R *.dfm}

uses
  uClientDataSetHelper   
  , uMenuBase
//  , uUsuario
  , BibStr
  , BibGeral;

procedure TFLogin.ValidaLoginSenha;
begin
  try
    qryLogin.Close;
    qryLogin.Sql.Text := 'SELECT LOGIN, SENHA FROM USUARIOS WHERE LOGIN='+ QuotedStr(ebuser.text);
    qryLogin.Open;

    if QryLogin.IsEmpty then
      begin
      RespOkCancel('Atenção', 'Usuário não encontrado');
      ebUser.SetFocus;
    end
    else
      begin 
      if Descriptografa(QryLogin.FieldByName('senha').AsString) = ebSenha.Text then
        begin
        lUsuarioAutorizado := True;
        FMenuBase.nCodUsuario := qryLogin.FieldByName('USERID').AsInteger;
        Close;
      end
      else
        RespOkCancel('Atenção', 'Senha incorreta, tente novamente.');            
    end;                                                                                
  except
    on E: Exception do
      begin
      RespOkCancel('Atenção', 'Houve um problema ao validar as suas credenciais, por favor, tente novamente');
      lUsuarioAutorizado := False;
    end;
  end;                                                                                
end;

procedure TFLogin.acConectarExecute(Sender: TObject);
begin              
  ValidaLoginSenha;
end;

procedure TFLogin.acFecharExecute(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if lUsuarioAutorizado then
    Action := caFree
  else
    Application.Terminate;
end;

procedure TFLogin.FormCreate(Sender: TObject);
var
  sVersao : String;
begin
  sVersao := GetVersaoAtual;
  Self.Caption := 'Acesso ao sistema VetShop '+ sVersao;
  lbVersao.Caption := 'Versão: ' + sVersao;
  lUsuarioAutorizado := False;
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
