unit uUsuario;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TUsuario = class
  private
    FDtInclusao: TDateTime;
    FUserId: Integer;
    FSenha: String;
    FNome: String;
    procedure SetDtInclusao(const Value: TDateTime);
    procedure SetSenha(const Value: String);
    procedure SetUserId(const Value: Integer);
    procedure SetNome(const Value: String);
    function EncriptaSenha(pSenha : String) : String;
    function EncriptaNome(pNome : String) : String;
    function GetSenhaDescript: string;
  protected
    property UserId : Integer read FUserId write SetUserId;
    property Nome : String read FNome write SetNome;
    property Senha : String read FSenha write SetSenha;
    property DtInclusao : TDateTime read FDtInclusao write SetDtInclusao;
    property SenhaDescript : string read GetSenhaDescript;
  public
    Constructor Create(UserId : Integer); overload;

  published

  end;

implementation

uses
  BibStr, System.DateUtils;

{ TMyClass }



{ TUsuario }


constructor TUsuario.Create(UserId: Integer);
begin
//
end;

function TUsuario.EncriptaNome(pNome: String): String;
begin

end;

function TUsuario.EncriptaSenha(pSenha: String): String;
begin

end;

function TUsuario.GetSenhaDescript: string;
begin
  Result := Descriptografa(FSenha);
end;

procedure TUsuario.SetDtInclusao(const Value: TDateTime);
begin
  FDtInclusao := Value;
end;

procedure TUsuario.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TUsuario.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TUsuario.SetUserId(const Value: Integer);
begin
  FUserId := Value;
end;

end.
