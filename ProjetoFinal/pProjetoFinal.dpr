program pProjetoFinal;

uses
  Vcl.Forms,
  uMenuBase in 'uMenuBase.pas' {Form2},
  uDmPrinc in 'uDmPrinc.pas' {DataModule1: TDataModule},
  uLogin in 'uLogin.pas' {Form1},
  Cpf_cnpj in 'Bibliotecas\Cpf_cnpj.pas',
  Extenso in 'Bibliotecas\Extenso.pas',
  opData in 'Bibliotecas\opData.pas',
  opMath in 'Bibliotecas\opMath.pas',
  opString in 'Bibliotecas\opString.pas',
  uClientDataSetHelper in 'Bibliotecas\uClientDataSetHelper.pas',
  uUsuario in 'uUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
