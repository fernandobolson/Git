unit FormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.FMTBcd, Data.DB, Datasnap.Provider, Data.SqlExpr,
  Datasnap.DBClient, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type

  TEstado = (tIncluir, tAlterar, tExcluir, tCancelar);

  TRotina = class
  private
    FTabelaBanco: String;
    FCampoChave: String;
    procedure SetCampoChave(const Value: String);
    procedure SetTabelaBanco(const Value: String);
  //
  protected
  //
  public
    property CampoChave : String read FCampoChave write SetCampoChave;
    property TabelaBanco : String read FTabelaBanco write SetTabelaBanco;
  end;

  TFPadraoManut = class(TForm)
    PnTools: TPanel;
    PnCaption: TPanel;
    Image1: TImage;
    Label1: TLabel;
    imgNormal: TImageList;
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
    imgFlat: TImageList;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    SpeedButton12: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    cxGroupBox4: TcxGroupBox;
    SpeedButton8: TSpeedButton;
    PC: TPageControl;
    tbCrud: TTabSheet;
    pnControls: TPanel;
    tbQuery: TTabSheet;
    cxGrid: TcxGrid;
    cxTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FEstado: TEstado;
    oRotina : TRotina;
    procedure SetEstado(const Value: TEstado);
    function DadosValidos: Boolean;
  public
    { Public declarations }
    property Estado :TEstado read FEstado write SetEstado;
  protected
    CampoChave,
    TabelaBanco : String;
    procedure SetNomeRotina; virtual; abstract;
    procedure SetObjRotina; virtual; abstract;
  end;

var
  FPadraoManut: TFPadraoManut;

implementation

uses
    uDmPrinc
  , BibStr
  , BibGeral
  , uUsuario, uClientDataSetHelper;

{$R *.dfm}

{ TForm2 }

function BuscaDadosPadrao(Campos, Tabela : String; cWhere :String = '(0=0)' ) : OleVariant;
var
  qryLocal :TSQLQuery;
begin
  try
    qryLocal := TSQLQuery.Create(nil);
    qryLocal.SQLConnection := DmPrinc.sqlCon;
    qryLocal.SQL.Add('SELECT '+Campos+' FROM '+Tabela+ ' WHERE '+cWhere);
    qryLocal.Open;

    Result := DmPrinc.dsp.Data;
  except

  end;
end;


procedure TFPadraoManut.Ac_IncluirExecute(Sender: TObject);
var
  cds :TClientDataSet;
begin
  Estado := tIncluir;

  //dsPadrao.DataSet.Append;
  if CampoChave <> EmptyStr then
  begin
    cds := TClientDataSet.Create(nil);;
    cds.Data := BuscaDadosPadrao('MAX('+CampoChave+')', TabelaBanco);
    cdsPadrao.Append;
    cdsPadrao.FieldByName(CampoChave).AsInteger :=cds.AsInt(CampoChave);
  end;
end;


procedure TFPadraoManut.SetEstado(const Value: TEstado);
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

procedure TFPadraoManut.Ac_SalvarExecute(Sender: TObject);
begin
  if DadosValidos then
    ShowMessage('segue o baile');
end;

function TFPadraoManut.DadosValidos : Boolean;
begin
   //
end;

procedure TFPadraoManut.FormKeyPress(Sender: TObject; var Key: Char);
begin
 //Mudar de campo ao pressionar o Enter
  if (Key = #13) or (Key = #10) then
    begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFPadraoManut.FormShow(Sender: TObject);
begin
  SetObjRotina;
end;

{ TRotina }

procedure TRotina.SetCampoChave(const Value: String);
begin
  FCampoChave := Value;
end;

procedure TRotina.SetTabelaBanco(const Value: String);
begin
  FTabelaBanco := Value;
end;

end.
