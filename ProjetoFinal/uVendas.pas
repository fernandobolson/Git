unit uVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Data.FMTBcd, Data.SqlExpr,
  Vcl.ExtCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxTextEdit, cxClasses, Datasnap.Provider, Datasnap.DBClient,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.StdCtrls, cxButtons, cxGroupBox,
  Vcl.Buttons, BibStr, BibGeral;

type
  TFVenda = class(TFPadraoManut)
    EB_CLIENTE: TcxDBTextEdit;
    EB_CDVENDA: TcxDBTextEdit;
    Label1: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label8: TLabel;
    cxDBDateEdit2: TcxDBDateEdit;
    SpeedButton2: TSpeedButton;
    cxDBTextEdit5: TcxDBTextEdit;
    Panel1: TPanel;
    Bevel1: TBevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxButton2: TcxButton;
    AdicionarItem: TAction;
    sqlDsItens: TSQLDataSet;
    dspItens: TDataSetProvider;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    EB_TOTAL: TcxDBMaskEdit;
    cdsItensCD_VENDA: TIntegerField;
    cdsItensCD_PRODSERV: TIntegerField;
    cdsItensVLRPRODSERV: TFloatField;
    cdsItensVLRDESCONTO: TFloatField;
    cdsItensVLRCOBRADO: TFloatField;
    cdsItensSEQLANCA: TIntegerField;
    ac_Pesq: TActionList;
    ac_Find: TAction;
    cxGridTableViewCD_VENDA: TcxGridDBColumn;
    cxGridTableViewDTVENDA: TcxGridDBColumn;
    cxGridTableViewNM_CLIENTE: TcxGridDBColumn;
    cxGridTableViewTOTAL: TcxGridDBColumn;
    cxGridDBTableView1CD_VENDA: TcxGridDBColumn;
    cxGridDBTableView1CD_PRODSERV: TcxGridDBColumn;
    cxGridDBTableView1VLRPRODSERV: TcxGridDBColumn;
    cxGridDBTableView1VLRDESCONTO: TcxGridDBColumn;
    cxGridDBTableView1VLRCOBRADO: TcxGridDBColumn;
    cxGridDBTableView1SEQLANCA: TcxGridDBColumn;
    lbVlrTotal: TLabel;
    cdsPadraoCD_VENDA: TIntegerField;
    cdsPadraoDTVENDA: TDateField;
    cdsPadraoHORAVENDA: TSQLTimeStampField;
    cdsPadraoCD_CLIENTE: TIntegerField;
    cdsPadraoNM_CLIENTE: TStringField;
    cdsPadraoOBSERVACOES: TStringField;
    cdsPadraoCD_PROFISSIONAL: TIntegerField;
    cdsPadraoNM_PROFISSIONAL: TStringField;
    cdsPadraoTOTAL: TFloatField;
    DataSource1: TDataSource;
    Label3: TLabel;
    EB_DESCONTOS: TcxDBMaskEdit;
    cxButton3: TcxButton;
    Action1: TAction;
    procedure Ac_SalvarExecute(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AdicionarItemExecute(Sender: TObject);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure ac_FindExecute(Sender: TObject);
    procedure Ac_CancelarExecute(Sender: TObject);
    procedure cxDBTextEdit4PropertiesChange(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsItensVLRDESCONTOChange(Sender: TField);
    procedure cxButton3Click(Sender: TObject);
  private
    FSeqVenda: integer;
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    procedure ac_PesquisarExecute(Sender: TObject);
    procedure RealizaBuscaClientes;
    procedure AdicionaFieldsAoCdsItens(nItem: Integer);
    procedure AtualizaValorTotal;
    procedure SalvaCabecalho;
    procedure SalvaItensTabelaVendaItens;
    procedure RealizaBuscaItens;
    procedure SetSeqVenda(const Value: integer);
    function GetSeqVenda: integer;
    procedure BuscaItensVinculadosCab;
    procedure ExcluiCabecalho;
    procedure ExcluiItens;
    procedure DeletaItemClient;
    procedure ValidaDadosCabecalho;
  public
    { Public declarations }
    property SeqVenda : integer read GetSeqVenda write SetSeqVenda;
  end;

var
  FVenda: TFVenda;

implementation

uses
  uSelCliente, uDmPrinc, uSelItens;

{$R *.dfm}


procedure TFVenda.Ac_CancelarExecute(Sender: TObject);
begin
  inherited;
  //cdsItens.ReadOnly;
end;

procedure TFVenda.Ac_ExcluirExecute(Sender: TObject);
begin
  //inherited;
  if RespSN('Você realmente deseja excluir esse registro?') then
    begin
    ExcluiItens;
    ExcluiCabecalho;
  end;
end;

procedure TFVenda.ExcluiCabecalho;
var
  lReadOnly : Boolean;
begin
  try
    lReadOnly := CdsPadrao.ReadOnly;
    if lReadOnly then
      cdsPadrao.ReadOnly := False;
    CdsPadrao.Delete;
    try
      cdsPadrao.ApplyUpdates(0);
    except
      On e: Exception do
        raise Exception.Create('Erro ao excluir o registro: '+E.Message);
    end;
  finally
    if lReadOnly then
      cdsPadrao.ReadOnly := True;
  end;
end;

procedure TFVenda.ExcluiItens;
begin
  try
    cdsItens.Delete;
    try
      cdsItens.ApplyUpdates(0);
    except
      On e: Exception do
        raise Exception.Create('Erro ao excluir o registro: '+E.Message);
    end;

  finally
    cdsPadrao.ReadOnly := True;
  end;
end;

procedure TFVenda.FormShow(Sender: TObject);
begin
  inherited;
  cdsPadrao.Close;
  CdsPadrao.Open;
end;

procedure TFVenda.ac_FindExecute(Sender: TObject);
begin
  inherited;
  if PodeRealizarBuscaF3 and EB_CLIENTE.Focused then
    RealizaBuscaClientes;
end;

procedure TFVenda.Ac_IncluirExecute(Sender: TObject);

  function GetId : Integer;
  var
    qry : TSqlQuery;
  begin
    try
      qry := TSQLQuery.Create(nil);
      qry.SQLConnection := DmPrinc.sqlCon;
      qry.SQL.Clear;
      qry.SQL.Add('SELECT gen_id(GENID_VENDACAB, 1) from rdb$database');
      qry.Open;
      Result := Qry.Fields[0].AsInteger;

    finally
      FreeAndNil(qry);
    end;
  end;

begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := GetID;
  cdsPadrao.FieldByName('DTVENDA').AsDateTime    := Date;
  cdsPadrao.FieldByName('HORAVENDA').AsDateTime    := Time;
end;

procedure TFVenda.ac_PesquisarExecute(Sender: TObject);
begin

end;

procedure TFVenda.Ac_SalvarExecute(Sender: TObject);
begin
  //inherited;
  if CheckDadosFinal then
    begin
    SalvaCabecalho;
    SalvaItensTabelaVendaItens;
  end;
end;

procedure TFVenda.SalvaItensTabelaVendaItens;
begin
  try
    if cdsItens.State in [dsEdit, dsInsert] then
      cdsItens.Post;

    cdsItens.ApplyUpdates(-1);
    cdsItens.Refresh;
    cdsItens.ReadOnly := True;
  except
      on E: Exception do
        RespOkCancel('Houve um erro ao gravar aos dados do cabeçalho.'+sLineBreak+
                    'Msg Erro: '+E.Message);
  end;
end;

procedure TFVenda.SetSeqVenda(const Value: integer);
begin
  FSeqVenda := Value;
end;

procedure TFVenda.SalvaCabecalho;
begin
  try
    if CdsPadrao.State in [dsEdit, dsInsert] then
      cdsPadrao.Post;

    cdsPadrao.ApplyUpdates(-1);
    Estado := TVisualizando;

    cdsPadrao.Refresh;
    cdsPadrao.ReadOnly := True;
  except
      on E: Exception do
        RespOkCancel('Houve um erro ao gravar aos dados do cabeçalho.'+sLineBreak+
                    'Msg Erro: '+E.Message);
  end;
end;

procedure TFVenda.AtualizaValorTotal;
var
  nVlrAcumulado, nDesc, nTotal : Extended;
  cds : TClientDataSet;
begin
  try
    try

      cds := TClientDataSet.Create(nil);
      cds.CloneCursor(cdsItens, False, True);
      cds.First;
      //Dessa maneira o Cds não pega o Delta do CdsItens e acaba nao funcionando corretamente o calculo.
      nVlrAcumulado := 0;
      nDesc := 0;
      while not cds.Eof do
        begin
        nVlrAcumulado :=  nVlrAcumulado + cds.FieldByName('VLRPRODSERV').AsFloat;
        nDesc := nDesc + cds.FieldByName('VLRDESCONTO').AsFloat;
        cds.Next;
      end;

      nTotal := nVlrAcumulado - nDesc;

      if nTotal <= 0 then
        nTotal := 0;

      cdsPadrao.Edit;
      cdsPadrao.FieldByName('TOTAL').AsFloat := nTotal;
      cdsPadrao.Post;
    except
      raise Exception.Create('Erro ao atualizar o valor total');
    end;

  finally
    FreeAndNil(cds);
  end;
end;

procedure TFVenda.AdicionarItemExecute(Sender: TObject);
begin
  inherited;
  if not PodeRealizarBuscaF3 then
    Exit;

  ValidaDadosCabecalho;
  RealizaBuscaItens;
  AtualizaValorTotal;
end;

procedure TFVenda.ValidaDadosCabecalho;
begin
  if Trim(cdsPadrao.FieldByName('NM_CLIENTE').AsString) = EmptyStr  then
    raise Exception.Create('Informe um Cliente.');
end;


procedure TFVenda.RealizaBuscaItens;
var
  nCodSelecionado : SmallInt;
begin
  if Application.FindComponent('FSelItens') = nil then
    Application.CreateForm(TFSelItens, FSelItens);

   nCodSelecionado := FSelItens.RetornaCodigoItemSelecionado;;
   AdicionaFieldsAoCdsItens(nCodSelecionado);
end;

procedure TFVenda.AdicionaFieldsAoCdsItens(nItem : Integer);

  procedure BuscaDadosProdServ(var qry : TSQLQuery);
  begin
    //Realiza a busca trazendo a informação do produto ou serviço.
    qry.SQLConnection := DmPrinc.sqlCon;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT * FROM PRODSERV WHERE CD_PRODSERV =:CD');
    qry.ParamByName('CD').AsInteger := nItem;
    qry.Open;
  end;

  function IncSeqLanca : integer;
  begin
    Result := cdsitens.RecordCount +1;
  end;

var
  qry :TSQLQuery;
begin
  qry := TSQLQuery.Create(nil);
  BuscaDadosProdServ(qry);

  if not CdsItens.Active then
    CdsItens.Open;

  cdsItens.Edit;
  cdsItens.FieldByName('CD_VENDA').AsInteger    := SeqVenda;
  cdsItens.FieldByName('SEQLANCA').AsInteger    := IncSeqLanca;

  cdsItens.FieldByName('CD_PRODSERV').AsInteger := qry.FieldByName('CD_PRODSERV').AsInteger;
  cdsItens.FieldByName('VLRPRODSERV').AsFloat   := qry.FieldByName('PRECOVENDA').AsFloat;
  cdsItens.FieldByName('VLRDESCONTO').AsFloat   := 0;
  cdsItens.Post;
end;

function TFVenda.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFVenda.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Vendas';
    TabelaBanco := 'VENDACAB';
    CampoChave := 'CD_VENDA';
  end;
end;

procedure TFVenda.cxButton3Click(Sender: TObject);
begin
  inherited;
  if cdsItens.RecordCount > 0 then
    DeletaItemClient;
end;

procedure TFVenda.DeletaItemClient;
begin
  if dsItens.State in [dsInsert, dsEdit] then
    cdsItens.Edit;

  cdsItens.Delete;
end;

procedure TFVenda.cxDBTextEdit4PropertiesChange(Sender: TObject);
begin
  inherited;
  BuscaItensVinculadosCab;
end;

procedure TFVenda.BuscaItensVinculadosCab;
var
  n : Integer;
begin
  n := CdsPadrao.FieldByName('CD_VENDA').AsInteger;
  sqlDsItens.Close;
  sqlDsItens.CommandText := 'SELECT * FROM VENDAITEM WHERE CD_VENDA = :CDVENDA';
  sqlDsItens.ParamByName('CDVENDA').AsInteger := n;
  sqlDsItens.Open;

  cdsItens.Close;
  cdsItens.Open;
end;

procedure TFVenda.cdsItensVLRDESCONTOChange(Sender: TField);
begin
  inherited;
  AtualizaValorTotal;
end;

function TFVenda.GetSeqVenda: integer;
begin
  try
    Result := cdsPadrao.FieldByName('CD_VENDA').AsInteger
  except
    Result := 0;
  end;
end;

procedure TFVenda.RealizaBuscaClientes;
var
  nCod : Integer;
  cDescricao : String;
begin
  if Application.FindComponent('FSelCliente') = nil then
    Application.CreateForm(TFSelClientes, FSelClientes);

  FSelClientes.RetornaCampos(nCod, cDescricao);

  if nCod <>  0 then
    begin
    CdsPadrao.FieldByName('CD_CLIENTE').AsInteger := nCod;
    CdsPadrao.FieldByName('NM_CLIENTE').AsString  := cDescricao;
  end;

end;

procedure TFVenda.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if PodeRealizarBuscaF3 then
    RealizaBuscaClientes;
end;

end.
