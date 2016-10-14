program pProjetoFinal;

uses
  Vcl.Forms,
  uMenuBase in 'uMenuBase.pas' {FMenuBase},
  uDmPrinc in 'uDmPrinc.pas' {DmPrinc: TDataModule},
  uLogin in 'uLogin.pas' {FLogin},
  Cpf_cnpj in 'Bibliotecas\Cpf_cnpj.pas',
  Extenso in 'Bibliotecas\Extenso.pas',
  opData in 'Bibliotecas\opData.pas',
  opMath in 'Bibliotecas\opMath.pas',
  uClientDataSetHelper in 'Bibliotecas\uClientDataSetHelper.pas',
  uUsuario in 'uUsuario.pas',
  BibStr in 'Bibliotecas\BibStr.pas',
  BibGeral in 'Bibliotecas\BibGeral.pas',
  uEsqueciSenha in 'uEsqueciSenha.pas' {FEsqueciSenha},
  steste in 'steste.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmPrinc, DmPrinc);
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
