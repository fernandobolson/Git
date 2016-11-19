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
  BibStr in 'Bibliotecas\BibStr.pas',
  BibGeral in 'Bibliotecas\BibGeral.pas',
  uEsqueciSenha in 'uEsqueciSenha.pas' {FEsqueciSenha},
  FormPadrao in 'Bibliotecas\FormPadrao.pas' {FPadraoManut},
  BibConsultas in 'Bibliotecas\BibConsultas.pas',
  uUsuario in 'Bibliotecas\uUsuario.pas',
  uAlterarSenha in 'uAlterarSenha.pas' {FAlterarSenha},
  uCadastroEspecies in 'uCadastroEspecies.pas' {FCadEspecie},
  uCadCidade in 'uCadCidade.pas' {FCadCidade},
  uSelPadrao in 'Bibliotecas\uSelPadrao.pas' {FSelPadrao},
  uSelEspecies in 'uSelEspecies.pas' {FSelEspecies},
  uCadRacas in 'uCadRacas.pas' {FCadRaca},
  uCadUsuario in 'uCadUsuario.pas' {FCadUsuario},
  uCadAnimal in 'uCadAnimal.pas' {FCadAnimal},
  uReconcileError in 'Bibliotecas\uReconcileError.pas' {ReconcileErrorForm},
  uSelRacas in 'uSelRacas.pas' {FSelRacas},
  uCadPessoa in 'uCadPessoa.pas' {FCadPessoa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmPrinc, DmPrinc);
  Application.CreateForm(TFMenuBase, FMenuBase);
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
