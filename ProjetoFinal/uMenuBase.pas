unit uMenuBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, System.Actions, Vcl.ActnMan, Vcl.Menus,
  Vcl.ToolWin, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    acMenu: TActionManager;
    ActionList1: TActionList;
    MainMenu1: TMainMenu;
    Configurações: TMenuItem;
    Configuraesgerais1: TMenuItem;
    ConfiguraesUsuarios1: TMenuItem;
    Panel1: TPanel;
    ActionMainMenuBar1: TActionMainMenuBar;
    Action1: TAction;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
