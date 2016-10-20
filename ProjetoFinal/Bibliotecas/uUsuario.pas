unit uUsuario;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr;

type
  TUsuario = class
  private
    FDtInclusao: TDateTime;
    FId: Integer;
    FSenha: String;
    FNome: String;
    FSenhaDescript : String;
    FLoginDescript: string;
    procedure SetDtInclusao(const Value: TDateTime);
    procedure SetSenha(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    function EncriptaSenha(pSenha : String) : String;
    function EncriptaNome(pNome : String) : String;
    function GetSenhaDescript: string;
    function GetLoginDescript: string;
  protected
  public
    Constructor Create(ID : Integer); overload;
    property ID : Integer read FId write SetId;
    property Login : String read FNome write SetNome;
    property Senha : String read FSenha write SetSenha;
    property DtInclusao : TDateTime read FDtInclusao write SetDtInclusao;
    property SenhaDescript : string read GetSenhaDescript write FSenhaDescript;
    property LoginDescript : string read GetLoginDescript write FLoginDescript;

  published

  end;

implementation

uses
  BibStr, System.DateUtils, uDmPrinc;

{ TMyClass }



{ TUsuario }
constructor TUsuario.Create(ID: Integer);
var
  qry : TSQLQuery;
begin
  inherited Create;
  try
    try
      qry := TSQLQuery.Create(nil);
      qry.Close;
      qry.SQLConnection := DmPrinc.sqlCon;
      qry.SQl.Add('SELECT * FROM USUARIOS WHERE ID ='+IntToStr(ID));
      qry.Open;

      if qry.IsEmpty then
        Exit;

      with Self do
        begin
        ID            := qry.FieldByName('ID').AsInteger;
        Login         := qry.FieldByName('LOGIN').AsString;
        LoginDescript := Descriptografa(qry.FieldByName('SENHA').AsString);
        Senha         := qry.FieldByName('SENHA').AsString;
        SenhaDescript := Descriptografa(qry.FieldByName('SENHA').AsString);
        DtInclusao    := qry.FieldByName('DTINCLUSAO').AsDateTime;
      end;

    except
      on E: Exception do
        raise Exception.Create('Erro: '+E.Message);
    end;

  finally
   if Assigned(qry) then
    FreeAndNil(qry);
  end;
end;

function TUsuario.EncriptaNome(pNome: String): String;
begin

end;

function TUsuario.EncriptaSenha(pSenha: String): String;
begin

end;

function TUsuario.GetLoginDescript: string;
begin
  Result := FLoginDescript;
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

procedure TUsuario.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
