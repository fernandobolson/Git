unit uUsuario;

interface

type
  TMyClass = class
  private
    FNome: String;
    FEmpresa: String;
    FSenha: String;
    FLogin: String;
    FTempoLogado: TDateTime;
    procedure SetNome(const Value: String);
    procedure SetEmpresa(const Value: String);
    procedure SetLogin(const Value: String);
    procedure SetSenha(const Value: String);
    procedure SetTempoLogado(const Value: TDateTime);
  protected
    property Nome : String  read FNome write SetNome;
    property Login : String read FLogin write SetLogin;
    property Senha : String read FSenha write SetSenha;
    property Empresa : String read FEmpresa write SetEmpresa;
    property TempoLogado : TDateTime read FTempoLogado write SetTempoLogado;
  public

  published

  end;

implementation

{ TMyClass }

procedure TMyClass.SetEmpresa(const Value: String);
begin
  FEmpresa := Value;
end;

procedure TMyClass.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TMyClass.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TMyClass.SetSenha(const Value: String);
begin
  FSenha := Value;
end;

procedure TMyClass.SetTempoLogado(const Value: TDateTime);
begin
  FTempoLogado := Value;
end;

end.
