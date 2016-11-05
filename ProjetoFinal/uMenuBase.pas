unit uMenuBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnMan, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.ComCtrls, Vcl.Buttons, Data.FMTBcd, Data.DB, Data.SqlExpr, uUsuario,
  Vcl.StdCtrls, Vcl.ActnColorMaps, System.ImageList, Vcl.ImgList, System.DateUtils;

type
  TFMenuBase = class(TForm)
    acmMenu: TActionManager;
    aclMenu: TActionList;
    acEspecies: TAction;
    MainMenu1: TMainMenu;
    Action11: TMenuItem;
    ConfiguraesGerais1: TMenuItem;
    ConfiguraesdeUsuarios1: TMenuItem;
    CadastrosGerais1: TMenuItem;
    CadastrodeEspcies1: TMenuItem;
    CadastrodeRaas1: TMenuItem;
    CadastrodePelagens1: TMenuItem;
    N1: TMenuItem;
    CadastrodeCidades1: TMenuItem;
    CadastrodePessoas1: TMenuItem;
    acRacas: TAction;
    Timer: TTimer;
    StatusBar1: TStatusBar;
    Action1: TAction;
    Pessoas1: TMenuItem;
    ac_CadPessoas: TAction;
    Action21: TMenuItem;
    Image1: TImage;
    PnCaption: TPanel;
    Image2: TImage;
    XPColorMap1: TXPColorMap;
    ImageList1: TImageList;
    ac_CadEspecie: TAction;
    ac_Fechar: TAction;
    ac_CfgGeral: TAction;
    ac_CadCidade: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_FecharExecute(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure ac_CadEspecieExecute(Sender: TObject);
    procedure ac_CadCidadeExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ConectaBanco;
    procedure MostraTelaLogin;
    procedure VerificaPrimeiroAcessoPedindoAlterarSenha;
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
  , uAlterarSenha
  , BibStr
  , BibGeral
  , BibConsultas
  , uCadastroEspecies
  , uCadCidade;

procedure TFMenuBase.ac_CadCidadeExecute(Sender: TObject);
begin
   if Application.FindComponent('FCadCidade') = nil then
    Application.CreateForm(TFCadCidade, FCadCidade);
  FCadEspecie.Show;
end;

procedure TFMenuBase.ac_CadEspecieExecute(Sender: TObject);
begin
   if Application.FindComponent('FCadEspecie') = nil then
    Application.CreateForm(TFCadEspecie, FCadEspecie);
  FCadEspecie.Show;
end;

procedure TFMenuBase.ac_FecharExecute(Sender: TObject);
begin
//
end;

procedure TFMenuBase.ConectaBanco;
begin
  try
    DmPrinc.sqlCon.Close;
    DmPrinc.sqlCon.Params.Clear;
    DmPrinc.sqlCon.Params.LoadFromFile('..\..\Conexao.ini');
    DmPrinc.sqlCon.Open;
  except
    On e: Exception do
    raise Exception.Create('Não foi possivel carregar o arquivo Conexao.ini, por favor, verifique se os dados estão corretos'+
                          sLineBreak + E.Message);
  end; 
end;

procedure TFMenuBase.ConfiguraCaptionForm;
begin
  Self.Caption := 'VetSoft -  '+GetVersaoAtual;
end;

procedure TFMenuBase.FormCreate(Sender: TObject);
begin
  try
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

procedure TFMenuBase.CriaObjetoUsuario;
begin
  oUsuario := TUsuario.Create(nCodUsuario);
end;

procedure TFMenuBase.FormShow(Sender: TObject);
begin
  VerificaPrimeiroAcessoPedindoAlterarSenha;
end;

procedure TFMenuBase.VerificaPrimeiroAcessoPedindoAlterarSenha;
begin
  if (oUsuario.Login = 'ADM') and (oUsuario.SenhaDescript = '456') then
    begin
    if (not Assigned(FAlterarSenha)) then
      Application.CreateForm(TFAlterarSenha, FAlterarSenha);
    FAlterarSenha.ShowModal;
  end;

end;

procedure TFMenuBase.MostraTelaLogin;
begin
  try
    Application.ShowMainForm := False;

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
  Result := GetSaudacaoConformeHorario + 'Hoje é dia '+ IntToStr(DayOf(Date)) + ' de ' + GetMesAtual;
end;

end.
