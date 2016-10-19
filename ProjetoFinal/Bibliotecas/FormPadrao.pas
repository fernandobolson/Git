unit FormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.FMTBcd, Data.DB, Datasnap.Provider, Data.SqlExpr,
  Datasnap.DBClient;

type

  TEstado = (tIncluir, tAlterar, tExcluir, tCancelar);

  TForm2 = class(TForm)
    PnTools: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    PnCaption: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Img: TImageList;
    ImgActions: TImageList;
    Acoes: TActionList;
    Ac_Incluir: TAction;
    Ac_Cancelar: TAction;
    Ac_Editar: TAction;
    Ac_Visualizar: TAction;
    Ac_Imprimir: TAction;
    Ac_Excluir: TAction;
    Ac_Salvar: TAction;
    Ac_Fechar: TAction;
    Ac_Anterior: TAction;
    Ac_Primeiro: TAction;
    Ac_Proximo: TAction;
    Ac_Ultimo: TAction;
    StatusBar1: TStatusBar;
    cdsPadrao: TClientDataSet;
    sqlDSPadrao: TSQLDataSet;
    dspPadrao: TDataSetProvider;
    dsPadrao: TDataSource;
  private
    FEstado: TEstado;
    procedure SetEstado(const Value: TEstado);
    { Private declarations }
  public
    { Public declarations }
    property Estado :TEstado read FEstado write SetEstado;
  protected
//    procedure SetNomeRotina; abstract; virtual;

  end;

var
  Form2: TForm2;

implementation

uses
    uDmPrinc
  , BibStr
  , BibGeral
  , uUsuario;

{$R *.dfm}

{ TForm2 }

procedure TForm2.SetEstado(const Value: TEstado);
begin
  FEstado := Value;

  Ac_Incluir.Enabled  := (FEstado in [tCancelar, tExcluir]);
  Ac_Editar.Enabled   := (FEstado in [tCancelar, tExcluir]);
  Ac_Excluir.Enabled  := (FEstado = tCancelar);
  Ac_Salvar.Enabled   := (FEstado in [tCancelar, TIncluir]);
  Ac_Cancelar.Enabled := (FEstado in [tCancelar, TIncluir]);

  //Ajusta o caption do formulário
  if Pos(' - [', Caption) > 0 then
    Caption := Copy(Caption, 1, Pos(' - [', Caption) - 1);

  case FEstado of
    TIncluir: Caption := Caption + ' - [Inclusão]';
    TAlterar: Caption := Caption + ' - [Alteração]';
    TExcluir: Caption := Caption + ' - [Exclusão]';
  end;
end;

end.
