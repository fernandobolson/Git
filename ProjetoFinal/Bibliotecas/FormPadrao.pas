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
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.Menus, Registry;

type

  TEstado = (tIncluir, tAlterar, tExcluir, tCancelar, TVisualizando);

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
    dspPadrao: TDataSetProvider;
    dsPadrao: TDataSource;
    imgFlat: TImageList;
    PC: TPageControl;
    tbCadastro: TTabSheet;
    pnFundoCadastro: TPanel;
    tbConsulta: TTabSheet;
    cxGrid: TcxGrid;
    cxTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxStyleRepo: TcxStyleRepository;
    StyleAzul: TcxStyle;
    StyleVerde: TcxStyle;
    ac_Consultas: TAction;
    ac_Refresh: TAction;
    PnTools: TPanel;
    SpeedButton5: TSpeedButton;
    GbComandosPadrao: TcxGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    gbSaveCancel: TcxGroupBox;
    SpeedButton7: TSpeedButton;
    SpeedButton6: TSpeedButton;
    gbNavegacao: TcxGroupBox;
    SpeedButton12: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    cxGroupBox4: TcxGroupBox;
    SpeedButton8: TSpeedButton;
    QryPadrao: TSQLQuery;
    cxStyleOver: TcxStyle;
    PopupMenu1: TPopupMenu;
    asdsadas1: TMenuItem;
    ac_AjustarGrid: TAction;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxTableViewDblClick(Sender: TObject);
    procedure ac_RefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ac_ConsultasExecute(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure Ac_EditarExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);
    procedure Ac_PrimeiroExecute(Sender: TObject);
    procedure Ac_AnteriorExecute(Sender: TObject);
    procedure Ac_ProximoExecute(Sender: TObject);
    procedure Ac_UltimoExecute(Sender: TObject);
    procedure Ac_FecharExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ac_AjustarGridExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FEstado: TEstado;
    oRotina : TRotina;
    procedure SetEstado(const Value: TEstado);
    function BuscaDadosPadrao(Campos, Tabela : String; cWhere :String = '(0=0)' ) : OleVariant;
    procedure MudaPaginaParaCadastro;
    procedure RealizaConsultaRegistrosCadastro;

    procedure MudaPaginaParaConsulta;
    procedure RealizaConsultaQuery;
    function GetProxCodigo : Integer;
    function ConfirmaNavegacao: Boolean;
    procedure GravaInfoRegedit;
  public
    { Public declarations }
    property Estado :TEstado read FEstado write SetEstado;
  protected
    CampoChave,
    TabelaBanco : String;
    Registro : TRegistry;
    procedure SetNomeRotina; virtual; abstract;
    procedure SetObjRotina; virtual; abstract;
    function CheckDadosFinal: Boolean; virtual; abstract;
  end;


var
  FPadraoManut: TFPadraoManut;

const
  _PageCadastro = 0;
  _PageConsulta = 1;

implementation

uses
    uDmPrinc
  , BibStr
  , BibGeral
  , uUsuario
  , uClientDataSetHelper;

{$R *.dfm}

{ TForm2 }

function TFPadraoManut.BuscaDadosPadrao(Campos, Tabela : String; cWhere :String = '(0=0)' ) : OleVariant;
var
  qryLocal :TSQLQuery;
begin
  try
    qryLocal := TSQLQuery.Create(nil);
    qryLocal.SQLConnection := DmPrinc.sqlCon;
    if (Campos <> EmptyStr) and (Tabela <> EmptyStr) then
      begin
      qryLocal.SQL.Add('SELECT '+Campos+' FROM '+Tabela+ ' WHERE '+cWhere);
      qryLocal.Open;
    end;

    Result := dspPadrao.Data;
  except

  end;
end;

procedure TFPadraoManut.ac_AjustarGridExecute(Sender: TObject);
begin
  if cdsPadrao.RecordCount > 0 then
    cxTableView.ApplyBestFit();
end;

procedure TFPadraoManut.Ac_AnteriorExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.Prior;
end;

procedure TFPadraoManut.Ac_CancelarExecute(Sender: TObject);
begin
  Estado := tCancelar;
  cdsPadrao.Cancel;
end;

procedure TFPadraoManut.ac_ConsultasExecute(Sender: TObject);
begin
  if not ConfirmaNavegacao then
    Exit;

  Estado := TVisualizando;
  MudaPaginaParaConsulta;
end;

procedure TFPadraoManut.Ac_EditarExecute(Sender: TObject);
begin
//
  Estado := tAlterar;
  cdsPadrao.Edit;
end;

procedure TFPadraoManut.Ac_FecharExecute(Sender: TObject);
begin
  case MessageDlg('Você realmente deseja fechar essa tela?',  mtInformation,
    [mbYes, mbNo], 0) of
    mrYes:  Close;
    mrNo: Exit;
  end;
end;

procedure TFPadraoManut.Ac_IncluirExecute(Sender: TObject);
var
  cds :TClientDataSet;
begin
  Estado := tIncluir;
  cdsPadrao.Append;
  SelectFirst;
  cdsPadrao.FieldByName(CampoChave).AsInteger := GetProxCodigo;

  MudaPaginaParaCadastro;
end;

procedure TFPadraoManut.Ac_PrimeiroExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.First;
end;

function TFPadraoManut.ConfirmaNavegacao : Boolean;
begin
  Result := True;
  if Estado in [tIncluir, tAlterar] then
    begin
    case
      Application.MessageBox('Toda alteração não salva será perdida, tem certeza que deseja fazer isso?',
      'Atenção', MB_YESNO + MB_ICONWARNING) of
      //IDYES:
      IDNO:
        begin
          Result := False;
        end;
    end;
  end;
end;

procedure TFPadraoManut.Ac_ProximoExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.Next;
end;

function TFPadraoManut.GetProxCodigo : Integer;
var
  qryLocal : TSQLQuery;
begin
  Result := 999;
  qryLocal := TSQLQuery.Create(Self);
  qryLocal.SQLConnection := DmPrinc.sqlCon;
  qryLocal.Close;
  qryLocal.SQL.Add('SELECT MAX('+CampoChave+') FROM '+TabelaBanco);
  qryLocal.Open;
  if qryLocal.RecordCount = 0 then
    Result := 1
  else
    Result := qryLocal.FieldByName(CampoChave).AsInteger;

end;


procedure TFPadraoManut.SetEstado(const Value: TEstado);
begin
  FEstado := Value;

  Ac_Incluir.Enabled  := (FEstado in [tCancelar, tExcluir, TVisualizando]);
  Ac_Editar.Enabled   := (FEstado in [tCancelar, tExcluir, TVisualizando]);
  Ac_Excluir.Enabled  := (FEstado = tCancelar);
  Ac_Salvar.Enabled   := (FEstado in [tCancelar, TIncluir]);
  Ac_Cancelar.Enabled := (FEstado in [tCancelar, TIncluir]);
  ac_Consultas.Enabled:= (FEstado <> TVisualizando);

  //Ajusta o caption do formulário
  if Pos(' - [', Caption) > 0 then
    Caption := Copy(Caption, 1, Pos(' - [', Caption) - 1);

  case FEstado of
    TIncluir: Caption := Caption + ' - [Inclusão]';
    TAlterar: Caption := Caption + ' - [Alteração]';
    TExcluir: Caption := Caption + ' - [Exclusão]';
  end;
end;

procedure TFPadraoManut.ac_RefreshExecute(Sender: TObject);
begin
  //
end;

procedure TFPadraoManut.Ac_SalvarExecute(Sender: TObject);
begin
  if CheckDadosFinal then
    begin

    cdsPadrao.Post;
    try
      cdsPadrao.ApplyUpdates(0);
      Estado := tCancelar;
    except
      on E: Exception do
        RespOkCancel('Houve um erro ao gravar aos dados, Msg: '+E.Message);
    end;
  end;

end;

procedure TFPadraoManut.Ac_UltimoExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.Last;
end;

procedure TFPadraoManut.cxTableViewDblClick(Sender: TObject);
begin
  if cdsPadrao.RecordCount > 0 then
    MudaPaginaParaCadastro;
end;

procedure TFPadraoManut.MudaPaginaParaCadastro;
begin
  PC.ActivePageIndex := _PageCadastro;
  tbConsulta.TabVisible := False;
  tbCadastro.TabVisible := True;
end;

procedure TFPadraoManut.MudaPaginaParaConsulta;
begin
  PC.ActivePageIndex := _PageConsulta;
  tbConsulta.TabVisible := True;
  tbCadastro.TabVisible := False;
  //Estado := TVisualizando;
end;

procedure TFPadraoManut.PCChange(Sender: TObject);
begin
//  if PC.ActivePageIndex = _PageConsulta then
//    Estado := TVisualizando;
end;

procedure TFPadraoManut.RealizaConsultaRegistrosCadastro;
begin
 //
end;

procedure TFPadraoManut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GravaInfoRegedit;

  Action := caFree; //Destrói o form
  self := nil; //Tira referência na memória
end;

procedure TFPadraoManut.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := MessageDlg('Você realmente deseja sair?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TFPadraoManut.FormCreate(Sender: TObject);
begin
  Estado := TVisualizando;
  MudaPaginaParaConsulta;
  RealizaConsultaQuery;
end;

procedure TFPadraoManut.RealizaConsultaQuery;
begin
  try
    QryPadrao.Close;
    QryPadrao.SQL.Text := 'SELECT * FROM '+TabelaBanco;
    QryPadrao.Open;
    cdsPadrao.Open;
  except
    On e: Exception do
      raise Exception.Create('Houve um erro ao realizar a consulta: '+sLineBreak+'Msg Erro: '+E.Message);
  End;
end;


procedure  TFPadraoManut.GravaInfoRegedit;
var
  i, j : Integer;
begin

 for I := 0 to ComponentCount -1 do
    begin
    Registro.OpenKey(_RaizPadrao, True);

    if Components[i] is TEdit then
      Registro.WriteString(Components[i].Name, TEdit(Components[i]).Text)
    else if Components[i] is TComboBox then
      Registro.WriteInteger(Components[i].Name, TComboBox(Components[i]).ItemIndex);

    Registro.CloseKey;
  end;

  Registro.Free;
end;



procedure TFPadraoManut.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // Muda os campos clicando Tab ou Enter
  if (Key = #13) or (Key = #10) then
    begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TFPadraoManut.FormShow(Sender: TObject);
begin
//
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

{ TRotinaCrud }

end.
