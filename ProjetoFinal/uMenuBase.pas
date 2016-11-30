unit uMenuBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnMan, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.ComCtrls, Vcl.Buttons, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.StdCtrls, Vcl.ActnColorMaps, System.ImageList, Vcl.ImgList,
  System.DateUtils , uUsuario, MidasLib, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox;

type
  TFMenuBase = class(TForm)
    acmMenu: TActionManager;
    aclMenu: TActionList;
    acEspecies: TAction;
    MainMenuBase: TMainMenu;
    Action11: TMenuItem;
    ConfiguraesGerais1: TMenuItem;
    ConfiguraesdeUsuarios1: TMenuItem;
    CadastrosGerais1: TMenuItem;
    CadastrodePelagens1: TMenuItem;
    CadastrodeCidades1: TMenuItem;
    acRacas: TAction;
    Timer: TTimer;
    StatusBar1: TStatusBar;
    Pessoas1: TMenuItem;
    ac_CadPessoas: TAction;
    Action21: TMenuItem;
    Image1: TImage;
    PnCaption: TPanel;
    ImgMenu: TImageList;
    ac_CadEspecie: TAction;
    ac_Fechar: TAction;
    ac_CfgGeral: TAction;
    ac_CadCidade: TAction;
    ac_CadAnimal: TAction;
    ac_CadUser: TAction;
    ac_CadProfissionais: TAction;
    CadastrodeProfissionais1: TMenuItem;
    ac_CadFornecedores: TAction;
    Financeiro1: TMenuItem;
    Estoque1: TMenuItem;
    ac_Vendas: TAction;
    Vendas1: TMenuItem;
    ac_CadProd: TAction;
    CadastrodeProdutos1: TMenuItem;
    ac_Estoque: TAction;
    Estoque2: TMenuItem;
    ac_CadPessoa: TAction;
    Animais1: TMenuItem;
    CadastrodeAnimais2: TMenuItem;
    CadastrodeEspcies2: TMenuItem;
    CadastrodeRaas2: TMenuItem;
    ac_CfgGerais: TAction;
    acMenuIcones: TActionList;
    GbComandosPadrao: TcxGroupBox;
    ac_MenuAnimal: TAction;
    ac_MenuClientes: TAction;
    ac_VendasMenu: TAction;
    gbSaveCancel: TcxGroupBox;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ac_Atendimentos: TAction;
    Atendimentos1: TMenuItem;
    N1: TMenuItem;
    ac_CadForn: TAction;
    CadastrodeFornecedores1: TMenuItem;
    ac_CadPelagem: TAction;
    ac_CadProcedimento: TAction;
    CadastrodeProcedimentos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ac_FecharExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ac_CadEspecieExecute(Sender: TObject);
    procedure ac_CadCidadeExecute(Sender: TObject);
    procedure acRacasExecute(Sender: TObject);
    procedure ac_CadAnimalExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ac_CadUserExecute(Sender: TObject);
    procedure ac_CadPessoaExecute(Sender: TObject);
    procedure ac_CadProfissionaisExecute(Sender: TObject);
    procedure ac_CadProdExecute(Sender: TObject);
    procedure ac_VendasExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_CadFornExecute(Sender: TObject);
    procedure ac_CadProcedimentoExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ConectaBanco;
    procedure MostraTelaLogin;

    procedure CriaObjetoUsuario;
    procedure ConfiguraCaptionForm;
    function MontaMsgBoasVindasStatusBar : String;
  public
    { Public declarations }
    nCodUsuario : SmallInt;
    oUsuario : TUsuario;
  protected
  //
  end;

var
  FMenuBase: TFMenuBase;

implementation

{$R *.dfm}

uses
    uDmPrinc
  , uLogin
  , BibStr
  , BibGeral
  , BibConsultas
  , uCadastroEspecies
  , uCadCidade
  , uCadRacas
  , uCadAnimal
  , uCadUsuario
  , uCadPessoa
  , uCadProfissionais
  , uCadProdServ
  , uVendas
  , uCadForn
  , uCadProcedimentos;

procedure TFMenuBase.acRacasExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadRaca') = nil then
    Application.CreateForm(TFCadRaca, FCadRaca);

  FCadRaca.Show;
end;

procedure TFMenuBase.ac_CadAnimalExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadAnimal') = nil then
    Application.CreateForm(TFCadAnimal, FCadAnimal);

  FCadAnimal.Show;
end;

procedure TFMenuBase.ac_CadCidadeExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadCidade') = nil then
    Application.CreateForm(TFCadCidade, FCadCidade);

  FCadCidade.Show;
end;

procedure TFMenuBase.ac_CadEspecieExecute(Sender: TObject);
begin
   if Application.FindComponent('FCadEspecie') = nil then
    Application.CreateForm(TFCadEspecie, FCadEspecie);

  FCadEspecie.Show;
end;

procedure TFMenuBase.ac_CadFornExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadForn') = nil then
    Application.CreateForm(TFCadForn, FCadForn);
  FCadForn.Show;
end;

procedure TFMenuBase.ac_CadPessoaExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadPessoa') = nil then
    Application.CreateForm(TFCadPessoa, FCadPessoa);
  FCadPessoa.Show;
end;

procedure TFMenuBase.ac_CadProcedimentoExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadProcedimentos') = nil then
    Application.CreateForm(TFCadProcedimentos, FCadProcedimentos);
  FCadProcedimentos.Show;
end;

procedure TFMenuBase.ac_CadProdExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadProdServ') = nil then
    Application.CreateForm(TFCadProdServ, FCadProdServ);
  FCadProdServ.Show;
end;

procedure TFMenuBase.ac_CadProfissionaisExecute(Sender: TObject);
begin
  if Application.FindComponent('FCadProfissionais') = nil then
    Application.CreateForm(TFCadProfissionais, FCadProfissionais);
  FCadProfissionais.Show;
end;

procedure TFMenuBase.ac_CadUserExecute(Sender: TObject);
begin
   if Application.FindComponent('FCadUsuario') = nil then
    Application.CreateForm(TFCadUsuario, FCadUsuario);

  FCadUsuario.Show;
end;

procedure TFMenuBase.ac_FecharExecute(Sender: TObject);
begin
//
end;

procedure TFMenuBase.ac_VendasExecute(Sender: TObject);
begin
   if Application.FindComponent('FVenda') = nil then
    Application.CreateForm(TFVenda, FVenda);
  FVenda.Show;
end;

procedure TFMenuBase.ConectaBanco;
begin
  try
    DmPrinc.sqlCon.Close;
    DmPrinc.sqlCon.Params.Clear;
    DmPrinc.sqlCon.Params.LoadFromFile('..\..\Conexao.ini');
    DmPrinc.sqlCon.Open;
  except
    On E: Exception do
      begin
      RespOkCancel('Não foi possivel carregar o arquivo Conexao.ini, por favor, verifique se os dados estão corretos'+
                   sLineBreak + E.Message);
      Application.Terminate;
    end;
  end; 
end;

procedure TFMenuBase.ConfiguraCaptionForm;
begin
  Self.Caption := 'VetSoft -  '+GetVersaoAtual;
end;

procedure TFMenuBase.FormCreate(Sender: TObject);
begin
  try
    Application.ShowMainForm := False;
    ConectaBanco;
    MostraTelaLogin;
    CriaObjetoUsuario;
    ConfiguraCaptionForm;
    Timer.Enabled := True;
  except
    on E: exception do
      RespOkCancel('Houve um problema ao conectar com o Banco de Dados,'+
                   'verifique se o arquivo Conexão.ini está correto.' +
                   #13#10 + E.Message);
  end;
end;

procedure TFMenuBase.FormDestroy(Sender: TObject);
begin
//
end;

procedure TFMenuBase.FormShow(Sender: TObject);
begin
  ac_CadUser.Enabled := oUsuario.IsSupervisor;
end;

procedure TFMenuBase.CriaObjetoUsuario;
begin
  oUsuario := TUsuario.Create(nCodUsuario);
end;

procedure TFMenuBase.MostraTelaLogin;
begin
  try


    if Application.FindComponent('FLogin') = nil then
      Application.CreateForm(TFLogin, FLogin);
    FLogin.ShowModal;

    if (Assigned(FLogin)) then
      FreeAndNil(FLogin);

    Application.ShowMainForm := True;
  except
    on E: Exception do
      Raise Exception.Create('Houve um erro ao criar a tela de Login, Erro: '+E.Message);
  end;
end;

procedure TFMenuBase.TimerTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Usuário: ' + oUsuario.Login;
  StatusBar1.panels[1].Text := MontaMsgBoasVindasStatusBar;
  StatusBar1.panels[2].Text := TimeToStr(Time);
end;

function TFMenuBase.MontaMsgBoasVindasStatusBar :String;
begin
  Result := GetSaudacaoConformeHorario + 'Hoje é ' + GetDiaSemana + ', '+
            IntToStr(DayOf(Date)) + ' de ' + GetMesAtual +
            ' de '+GetAnoAtual;
end;

end.
