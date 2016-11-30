unit uCadRacas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Data.FMTBcd, Data.SqlExpr,
  cxClasses, Datasnap.Provider, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.StdCtrls, cxButtons, cxGroupBox,
  Vcl.Buttons, Vcl.ExtCtrls, cxDBEdit, cxTextEdit, Vcl.DBCtrls, Vcl.Mask;

type
  TFCadRaca = class(TFPadraoManut)
    cxGridTableViewCD_RACA: TcxGridDBColumn;
    cxGridTableViewCD_ESPECIE: TcxGridDBColumn;
    cxGridTableViewNM_RACA: TcxGridDBColumn;
    cxGridTableViewPORTE: TcxGridDBColumn;
    cdsPadraoCD_RACA: TIntegerField;
    cdsPadraoCD_ESPECIE: TIntegerField;
    cdsPadraoNM_RACA: TStringField;
    cdsPadraoPORTE: TStringField;
    cdsPadraoFOTO: TBlobField;
    DBRadioGroup1: TDBRadioGroup;
    EB_CDESPECIE: TcxDBTextEdit;
    SpeedButton2: TSpeedButton;
    Label8: TLabel;
    Label9: TLabel;
    EB_NOMERACA: TcxDBTextEdit;
    EB_CDRACA: TcxDBTextEdit;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cdsPadraoNM_ESPECIE: TStringField;
    SqlDSEspecie: TSQLDataSet;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure ac_PesquisarExecute(Sender: TObject);
    procedure EB_CDESPECIEExit(Sender: TObject);
    procedure cxGridTableViewPORTEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    function BuscaDescricaoEspecie: String;
    procedure RealizaBuscaRacas;
    function CheckDadosExclusao: Boolean; override;
    function EspecieInformadaExiste: Boolean;
  public
    { Public declarations }
  end;

var
  FCadRaca: TFCadRaca;

implementation

uses
  uSelEspecies,
  uDmPrinc,
  BibGeral;

{$R *.dfm}


procedure TFCadRaca.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
  cdsPadrao.FieldByName('PORTE').AsString := 'P'; //Valor Default

end;

procedure TFCadRaca.ac_PesquisarExecute(Sender: TObject);
begin
  inherited;
  if EB_CDESPECIE.Focused and PodeRealizarBuscaF3 then
    RealizaBuscaRacas;
end;

procedure TFCadRaca.RealizaBuscaRacas;
var
  cDescricao :String;
  nCod : Integer;
begin
  if Application.FindComponent('FSelEspecies') = nil then
    Application.CreateForm(TFSelEspecies, FSelEspecies);

  FSelEspecies.RetornaCampos(nCod, cDescricao);

  if nCod <> 0 then
    begin
    CdsPadrao.FieldByName('CD_ESPECIE').AsInteger  := nCod;
    CdsPadrao.FieldByName('NM_ESPECIE').AsString  := cDescricao;
  end;
end;

procedure TFCadRaca.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if PodeRealizarBuscaF3 then
    RealizaBuscaRacas;
end;

function TFCadRaca.CheckDadosExclusao: Boolean;
var
  qry :TSQLQuery;
begin
  try
    Result := True;
    if (cdsPadrao.RecordCount <= 0)  then
      begin
      Result := False;
      raise Exception.Create('Não existe nenhum registro a ser excluido!');
    end;

    qry := TSQLQuery.Create(Self);
    qry.SQLConnection := DmPrinc.sqlCon;
    qry.SQL.Add('SELECT COUNT(*) FROM ANIMAL WHERE CD_RACA =' + QuotedStr(cdsPadrao.FieldByName('CD_RACA').AsString));
    qry.Open;

    if qry.RecordCount > 0 then
      begin
      Result := False;
      raise Exception.Create('Não é possível realizar a exclusão! '+sLineBreak +
                             'Existem animais cadastradas com essa Raça!');
    end;

  finally
    FreeAndNil(qry);
  end;

end;

function TFCadRaca.CheckDadosFinal: Boolean;
begin
  Result := True;
  if (Trim(CdsPadrao.AsStr('NM_RACA')) = EmptyStr)then
    begin
    Result := False;
    raise Exception.Create('Informe o nome da Raça.');
  end;

  if Trim(cdsPadrao.AsStr('CD_ESPECIE')) = EmptyStr then
    begin
    Result := False;
    raise Exception.Create('Informe a Espécie do Animal.');
  end;

  if not EspecieInformadaExiste then
    begin
    Result := False;
    raise Exception.Create('Informe uma Espécie válida para o Animal.');
  end;

end;

function TFCadRaca.EspecieInformadaExiste : Boolean;
var
  qry : TSQLQuery;
begin
  try
    Result := True;
    qry := TSQLQuery.Create(Self);
    qry.SQLConnection := DmPrinc.sqlCon;

    //Verifica Dependencias de Animais
    qry.SQL.Add('SELECT COUNT(*) FROM ESPECIES WHERE ID =' + QuotedStr(cdsPadrao.FieldByName('CD_ESPECIE').AsString));
    qry.Open;

    if qry.RecordCount <= 0 then
      Result := False;

  finally
    FreeAndNil(qry);
  end;

end;

procedure TFCadRaca.CriaObjetoCrud;
begin
  inherited;

  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Raças';
    TabelaBanco := 'RACA';
    CampoChave := 'CD_RACA';
  end;

end;

procedure TFCadRaca.cxGridTableViewPORTEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if AText = 'P' then
    AText := 'Pequeno'
  else if AText = 'M' then
    AText := 'Médio'
  else if AText = 'G' then
    AText := 'Grande'
  else
    AText := 'Indefinido';
end;

procedure TFCadRaca.EB_CDESPECIEExit(Sender: TObject);
begin
  inherited;
  cdsPadrao.FieldByName('NM_ESPECIE').AsString := BuscaDescricaoEspecie;
end;

function TFCadRaca.BuscaDescricaoEspecie : String;
begin
  Result := '';
  try
    SqlDSEspecie.Close;
    SqlDSEspecie.ParamByName('ID').Value := CdsPadrao.AsInt('CD_ESPECIE');
    SqlDSEspecie.Open;
    Result := SqlDSEspecie.FieldByName('DESCRICAO').AsString;
  except
  end;
end;



end.
