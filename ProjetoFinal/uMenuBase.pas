unit uMenuBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnMan, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFMenuBase = class(TForm)
    acmMenu: TActionManager;
    aclMenu: TActionList;
    Action1: TAction;
    Image1: TImage;
    acEspecies: TAction;
    ActionToolBar1: TActionToolBar;
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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConectaBanco;
    procedure MostraTelaLogin;
  public
    { Public declarations }
  end;

var
  FMenuBase: TFMenuBase;

implementation

{$R *.dfm}

uses uDmPrinc, uLogin;

procedure TFMenuBase.ConectaBanco;
begin
  DmPrinc.sqlCon.Close;
  DmPrinc.sqlCon.Params.Clear;
  DmPrinc.sqlCon.Params.LoadFromFile('..\..\Conexao.ini');
  DmPrinc.sqlCon.Open;
end;

procedure TFMenuBase.FormCreate(Sender: TObject);
begin
  ConectaBanco;
  MostraTelaLogin;
end;

procedure TFMenuBase.MostraTelaLogin;
begin
    //Esconde a tela principal
  Application.ShowMainForm := False;

  //Abre a tela de login
  if Application.FindComponent('FLogin') = nil then
    Application.CreateForm(TFLogin, FLogin);
  FLogin.ShowModal;
end;

end.
