unit FormPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Data.FMTBcd, Data.DB, Datasnap.Provider, Data.SqlExpr,
  Datasnap.DBClient, Vcl.Menus, Registry, uClientDataSetHelper,
  //Uses dos componentes DevXpress
  cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,
  dxBarBuiltInMenu, cxPC, cxButtons, cxDBEdit, cxDBData, Vcl.DBCtrls,
  cxGridCustomPopupMenu, cxGridPopupMenu;

type

  TEstado = (tIncluir, tAlterar, tExcluir, tCancelar, TVisualizando);

  TObjCrud = class
  private
    FTabelaBanco: String;
    FCampoChave: String;
    FNome: string;
    procedure SetCampoChave(const Value: String);
    procedure SetTabelaBanco(const Value: String);
    procedure SetNome(const Value: string);
  protected
  public
    property CampoChave : String read FCampoChave write SetCampoChave;
    property TabelaBanco : String read FTabelaBanco write SetTabelaBanco;
    property Nome : string read FNome write SetNome;
  end;


  TFPadraoManut = class(TForm)
    PnCaption: TPanel;
    lbNameCrud: TLabel;
    imgNormal: TImageList;
    Acoes: TActionList;
    Ac_Incluir: TAction;
    Ac_Cancelar: TAction;
    Ac_Editar: TAction;
    Ac_Imprimir: TAction;
    Ac_Excluir: TAction;
    Ac_Salvar: TAction;
    Ac_Fechar: TAction;
    Ac_Anterior: TAction;
    Ac_Primeiro: TAction;
    Ac_Proximo: TAction;
    Ac_Ultimo: TAction;
    cdsPadrao: TClientDataSet;
    dspPadrao: TDataSetProvider;
    dsPadrao: TDataSource;
    imgFlat: TImageList;
    cxStyleRepo: TcxStyleRepository;
    StyleAzul: TcxStyle;
    StyleVerde: TcxStyle;
    ac_Consultas: TAction;
    ac_Refresh: TAction;
    PnTools: TPanel;
    SpeedButton5: TSpeedButton;
    GbComandosPadrao: TcxGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    gbSaveCancel: TcxGroupBox;
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
    cxButton1: TcxButton;
    Label2: TLabel;
    PC: TcxPageControl;
    tbCadastro: TcxTabSheet;
    tbConsulta: TcxTabSheet;
    cxGridTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    SpeedButton4: TSpeedButton;
    BalloonHint1: TBalloonHint;
    GB1: TcxGroupBox;
    GB2: TcxGroupBox;
    GB3: TcxGroupBox;
    img1616: TImageList;
    acPesquisa: TActionList;
    ac_Pesquisar: TAction;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGridTableViewDblClick(Sender: TObject);
    procedure ac_RefreshExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ac_ConsultasExecute(Sender: TObject);
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
    procedure FormDestroy(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
  private
    FEstado: TEstado;
    procedure SetEstado(const Value: TEstado);
    procedure MudaPaginaParaCadastro;
    procedure MudaPaginaParaConsulta;
    procedure RealizaConsultaQuery;
    function ConfirmaNavegacao: Boolean;
    procedure GravaInfoRegedit;
    procedure DesabilitaCampos;
    procedure HabilitaCampos;
    function ComponenteEstaDentroPageControl(i: SmallInt): Boolean;
    procedure AtualizaClientPadrao;
  public
    { Public declarations }
    property Estado :TEstado read FEstado write SetEstado;
  protected
    Registro : TRegistry;
    ObjCrud : TObjCrud;
    procedure SetNomeRotina; virtual; abstract;
    procedure SetObjRotina; virtual; abstract;
    function CheckDadosFinal: Boolean; virtual; abstract;
    procedure CriaObjetoCrud; virtual; abstract;
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
  , uMenuBase;

{$R *.dfm}

{ TForm2 }



procedure TFPadraoManut.ac_AjustarGridExecute(Sender: TObject);
begin
  if cdsPadrao.RecordCount > 0 then
    cxGridTableView.ApplyBestFit();
end;

procedure TFPadraoManut.Ac_AnteriorExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.Prior;
end;

procedure TFPadraoManut.Ac_CancelarExecute(Sender: TObject);
begin
  if RespSN('Realmente deseja Cancelar? Toda os dados não salvos serão perdidos!') then
    begin
    Estado := tCancelar;
    cdsPadrao.Cancel;
    CdsPadrao.ReadOnly := True;
    CdsPadrao.Refresh;
    //AtualizaClientPadrao;
  end;

end;

procedure TFPadraoManut.ac_ConsultasExecute(Sender: TObject);
begin
  ConfirmaNavegacao;
  Estado := TVisualizando;
  MudaPaginaParaConsulta;
end;

procedure TFPadraoManut.Ac_EditarExecute(Sender: TObject);
begin
  Estado := tAlterar;
  if PC.ActivePageIndex = _PageConsulta then
    MudaPaginaParaCadastro
  else
    cdsPadrao.Edit;
end;

procedure TFPadraoManut.Ac_ExcluirExecute(Sender: TObject);
var
  lReadOnly: Boolean;
begin
  try
    if CdsPadrao.RecordCount <= 0 then
      Exit;

    lReadOnly := CdsPadrao.ReadOnly;
    if RespSN('Você realmente deseja excluir esse registro?') then
      begin
      if lReadOnly then
        cdsPadrao.ReadOnly := False;
      CdsPadrao.Delete;
      try
        cdsPadrao.ApplyUpdates(0);
      except
        On e: Exception do
          raise Exception.Create('Erro ao excluir o registro: '+E.Message);
      end;
    end;
  finally
    if lReadOnly then
      cdsPadrao.ReadOnly := True;
  end;
end;

procedure TFPadraoManut.Ac_FecharExecute(Sender: TObject);
begin
  GravaInfoRegedit;
  Close;
end;

procedure TFPadraoManut.Ac_IncluirExecute(Sender: TObject);
begin
  Estado := tIncluir;
  MudaPaginaParaCadastro;
  cdsPadrao.Append;
  SelectFirst;
end;

procedure TFPadraoManut.Ac_PrimeiroExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.First;
end;

function TFPadraoManut.ConfirmaNavegacao : Boolean;
begin
  Result := True;
  if DsPadrao.State in [dsInsert, dsEdit] then
    begin
    if RespSN('Toda alteração não salva será perdida, tem certeza que deseja fazer isso?') then
      begin
      Result := False;
      if DsPadrao.State = DsInsert then   //Se estiver incluindo, então exclui o registro recém criado no Cds
        cdsPadrao.Delete
      else
        CdsPadrao.Cancel; //Se não só cancela
    end;
  end;
end;

procedure TFPadraoManut.Ac_ProximoExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.Next;
end;

procedure TFPadraoManut.SetEstado(const Value: TEstado);
begin
  FEstado := Value;

  if FEstado in [tAlterar, tIncluir] then
    begin
    cdsPadrao.ReadOnly := False;
    HabilitaCampos;
  end
  else
    DesabilitaCampos;

  Ac_Incluir.Enabled  := (FEstado in [tCancelar, tExcluir, TVisualizando]);
  Ac_Editar.Enabled   := (FEstado in [tCancelar, tExcluir, TVisualizando]);
  Ac_Excluir.Enabled  := True;

  Ac_Salvar.Enabled   := (FEstado in [tCancelar, TIncluir, TAlterar]) and not(FEstado = TVisualizando);
  Ac_Cancelar.Enabled := Ac_Salvar.Enabled;

  lbNameCrud.Caption := ObjCrud.Nome;
  case FEstado of
    TIncluir: lbNameCrud.Caption := lbNameCrud.Caption + ' - [Inclusão]';
    TAlterar: lbNameCrud.Caption := lbNameCrud.Caption + ' - [Alteração]';
    TExcluir: lbNameCrud.Caption := lbNameCrud.Caption + ' - [Exclusão]';
    TVisualizando : lbNameCrud.Caption := lbNameCrud.Caption + ' - [Consultando Dados]';
    TCancelar : lbNameCrud.Caption := lbNameCrud.Caption + ' - [Consultando Dados]';
  end;

end;

procedure TFPadraoManut.DesabilitaCampos;
var
  i : Integer;
  CompParent : TComponent;
begin
  try
    //Se o parent for o PageControl, então realiza o controle
    //de habilitar/Desabilitar campos conforme estado do Form
    for I := 0 to ComponentCount-1 do
      begin
      if (Components[i] is TLabel) then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TLabel(Components[i]).Enabled := False
      end
      else if Components[i] is TcxDBTextEdit then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TcxDBTextEdit(Components[i]).Style.Font.Color := clBtnShadow
      end
      else if Components[i] is TcxDBCheckBox then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TcxDBCheckBox(Components[i]).Enabled := False
      end
      else if Components[i] is TcxDBMaskEdit then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TcxDBMaskEdit(Components[i]).Enabled := False;
      end
      else if Components[i] is TDBRadioGroup then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TDBRadioGroup(Components[i]).Enabled := False;
      end;
    end;

  except
    On e: Exception do
      raise Exception.Create('Erro ao desabilitar campos. Msg Erro: '+E.Message);
  end;
end;

function TFPadraoManut.ComponenteEstaDentroPageControl(i : SmallInt) : Boolean;
var
  CompParent : TComponent;
begin
  CompParent := Components[i].GetParentComponent;
  //Se estiver dentro do TbCadastro ou dentro de algums dos groupBox
  //disponiveis no FormPadrao, entao desbilita os campos em questão
  Result := (CompParent = tbCadastro) or
            (CompParent = GB1) or
            (CompParent = GB2) or
            (CompParent = GB3);
end;

procedure TFPadraoManut.HabilitaCampos;
var
  i : Integer;
begin
  try
    //Se o parent for o PageControl, então realiza o controle
    //de habilitar/Desabilitar campos conforme estado do Form

    for I := 0 to ComponentCount-1 do
      begin
      if Components[i] is TLabel then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TLabel(Components[i]).Enabled := True;
      end
      else if Components[i] is TcxDBTextEdit then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TcxDBTextEdit(Components[i]).Style.Font.Color := clBlack;
      end
      else if Components[i] is TcxDBCheckBox then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TcxDBCheckBox(Components[i]).Enabled := True;
      end
      else if Components[i] is TcxDBMaskEdit then
        begin
          if ComponenteEstaDentroPageControl(i) then
          TcxDBMaskEdit(Components[i]).Enabled := True;
      end
      else if Components[i] is TDBRadioGroup then
        begin
        if ComponenteEstaDentroPageControl(i) then
          TDBRadioGroup(Components[i]).Enabled := True;
      end;
    end;

  except
    On e: Exception do
      raise Exception.Create('Erro ao habilitar campos. Msg Erro: '+E.Message);
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
    //Campo Chave sera incrementado a partir de uma trigger no banco de dados
    cdsPadrao.Post;
    try
      cdsPadrao.ApplyUpdates(-1);
      Estado := TVisualizando;

      cdsPadrao.Refresh;
      //AtualizaClientPadrao;
      cdsPadrao.ReadOnly := True;
    except
      on E: Exception do
        RespOkCancel('Houve um erro ao gravar aos dados.'+sLineBreak+
                    'Msg Erro: '+E.Message);
    end;
  end;

end;

procedure TFPadraoManut.AtualizaClientPadrao;
begin
  if CdsPadrao.Active then
    CdsPadrao.Close;
  CdsPadrao.Open;
end;


procedure TFPadraoManut.Ac_UltimoExecute(Sender: TObject);
begin
  if ConfirmaNavegacao then
    cdsPadrao.Last;
end;

procedure TFPadraoManut.cxGridTableViewDblClick(Sender: TObject);
begin
  if cdsPadrao.RecordCount > 0 then
  begin
    MudaPaginaParaCadastro;
    CdsPadrao.ReadOnly:=True;
  end;
end;

procedure TFPadraoManut.MudaPaginaParaCadastro;
begin
  PC.ActivePageIndex := _PageCadastro;
  tbConsulta.TabVisible := False;
  tbCadastro.TabVisible := True;
//  CdsPadrao.ReadOnly := True; //Somente tira o ReadOnly ao clicar em Editar
end;

procedure TFPadraoManut.MudaPaginaParaConsulta;
begin
  PC.ActivePageIndex := _PageConsulta;
  tbConsulta.TabVisible := True;
  tbCadastro.TabVisible := False;
  Estado := TVisualizando;
end;

procedure TFPadraoManut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  self := nil;
end;

procedure TFPadraoManut.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := RespSN('Você realmente deseja sair?');
end;

procedure TFPadraoManut.FormCreate(Sender: TObject);
begin
  CriaObjetoCrud;
  Estado := TVisualizando;
  MudaPaginaParaConsulta;
  RealizaConsultaQuery;
  Registro := TRegistry.Create;
end;

procedure TFPadraoManut.FormDestroy(Sender: TObject);
begin
  ObjCrud.Free;
end;

procedure TFPadraoManut.RealizaConsultaQuery;
begin
  try
    QryPadrao.Close;
    QryPadrao.SQL.Text := 'SELECT * FROM '+ObjCrud.TabelaBanco;
    QryPadrao.Open;
    cdsPadrao.Open;
  except
    On e: Exception do
      raise Exception.Create('Houve um erro ao realizar a consulta: '+sLineBreak+'Msg Erro: '+E.Message);
  End;
end;


procedure  TFPadraoManut.GravaInfoRegedit;
var
  i : Integer;
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
  if Estado = tAlterar then
    begin
    if (Key = #13) or (Key = #10) then
      begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
    end;
  end;
end;

procedure TFPadraoManut.FormShow(Sender: TObject);
begin
//
end;

{ TRotina }

procedure TObjCrud.SetCampoChave(const Value: String);
begin
  FCampoChave := Value;
end;

procedure TObjCrud.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TObjCrud.SetTabelaBanco(const Value: String);
begin
  FTabelaBanco := Value;
end;

{ TRotinaCrud }

end.
