unit uMenuBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnMan, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ExtCtrls, dxGDIPlusClasses,
  Vcl.ComCtrls, Vcl.Buttons;

type
  TFMenuBase = class(TForm)
    acmMenu: TActionManager;
    aclMenu: TActionList;
    ac_Fechar: TAction;
    Image1: TImage;
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
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    ac_Pessoas: TAction;
    Action1: TAction;
    Pessoas1: TMenuItem;
    ac_CadPessoas: TAction;
    Action21: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ac_FecharExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ConectaBanco;
    procedure MostraTelaLogin;
    procedure ConfiguraStaturBar;
    procedure VerificaPrimeiroAcessoPedindoAlterarSenha;
  public
    { Public declarations }
  end;

var
  FMenuBase: TFMenuBase;

implementation

{$R *.dfm}

uses
    uDmPrinc
  , uLogin
  , uUsuario;

procedure TFMenuBase.ac_FecharExecute(Sender: TObject);
begin
//
end;

procedure TFMenuBase.ConectaBanco;
begin
  DmPrinc.sqlCon.Close;
  DmPrinc.sqlCon.Params.Clear;
  DmPrinc.sqlCon.Params.LoadFromFile('..\..\Conexao.ini');
  DmPrinc.sqlCon.Open;
end;

procedure TFMenuBase.ConfiguraStaturBar;
begin
  StatusBar1.Panels[0].Text := 'Usuário: ';//+ FLogin.cUsuario;
  StatusBar1.panels[1].Text := DateToStr(Date) + ', '+ Timer.ToString;
end;

procedure TFMenuBase.FormCreate(Sender: TObject);
begin
  try
    ConectaBanco;
    MostraTelaLogin;
    ConfiguraStaturBar;
  except
    on e: exception do
      Application.MessageBox('Houve um problema ao conectar com o Banco de Dados,'+
                          ' verifique se o arquivo Conexão.ini está correto.',
                          'Atenção', MB_OK + MB_ICONSTOP);
  end;
end;

procedure TFMenuBase.FormShow(Sender: TObject);
begin
  VerificaPrimeiroAcessoPedindoAlterarSenha;
end;

procedure TFMenuBase.VerificaPrimeiroAcessoPedindoAlterarSenha;
begin
//  if (Usuario.Nome = 'ADM') and (Usuario.SenhaDescript = '123') then
//
//  if (FTelaAlterarSenha = nil) then
//    Application.CreateForm(TFTelaAlterarSenha, FTelaAlterarSenha);
//  FTelaAlterarSenha.ShowModal;


end;

procedure TFMenuBase.MostraTelaLogin;
begin
  Application.ShowMainForm := False;

  if Application.FindComponent('FLogin') = nil then
    Application.CreateForm(TFLogin, FLogin);
  FLogin.ShowModal;

  if (Assigned(FLogin)) then
    FreeAndNil(FLogin);

  Application.ShowMainForm := True;
end;


end.
