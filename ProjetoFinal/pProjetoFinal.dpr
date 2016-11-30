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
  FormPadrao in 'Bibliotecas\FormPadrao.pas' {FPadraoManut},
  BibConsultas in 'Bibliotecas\BibConsultas.pas',
  uUsuario in 'Bibliotecas\uUsuario.pas',
  uCadastroEspecies in 'uCadastroEspecies.pas' {FCadEspecie},
  uCadCidade in 'uCadCidade.pas' {FCadCidade},
  uSelPadrao in 'Bibliotecas\uSelPadrao.pas' {FSelPadrao},
  uSelEspecies in 'uSelEspecies.pas' {FSelEspecies},
  uCadRacas in 'uCadRacas.pas' {FCadRaca},
  uCadUsuario in 'uCadUsuario.pas' {FCadUsuario},
  uCadAnimal in 'uCadAnimal.pas' {FCadAnimal},
  uReconcileError in 'Bibliotecas\uReconcileError.pas' {ReconcileErrorForm},
  uSelRacas in 'uSelRacas.pas' {FSelRacas},
  uCadPessoa in 'uCadPessoa.pas' {FCadPessoa},
  uCadProfissionais in 'uCadProfissionais.pas' {FCadProfissionais},
  uSelCliente in 'uSelCliente.pas' {FSelClientes},
  uCadProdServ in 'uCadProdServ.pas' {FCadProdServ},
  uVendas in 'uVendas.pas' {FVenda},
  uSelItens in 'uSelItens.pas' {FSelItens},
  uCadForn in 'uCadForn.pas' {FCadForn},
  uSelCidades in 'uSelCidades.pas' {FSelCidade},
  uContasRec in 'uContasRec.pas' {FContasRec},
  uCadProcedimentos in 'uCadProcedimentos.pas' {FCadProcedimentos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmPrinc, DmPrinc);
  Application.CreateForm(TFMenuBase, FMenuBase);
  Application.CreateForm(TFLogin, FLogin);
  Application.Run;
end.
