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
  Vcl.Buttons, Vcl.ExtCtrls, cxDBEdit, cxTextEdit, Vcl.DBCtrls;

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
  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    function BuscaDescricaoEspecie: String;
  public
    { Public declarations }
  end;

var
  FCadRaca: TFCadRaca;

implementation

uses
  uSelEspecies;

{$R *.dfm}


procedure TFCadRaca.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
end;

procedure TFCadRaca.ac_PesquisarExecute(Sender: TObject);
var
  cDescricao :String;
  nCod : Integer;
begin
  inherited;
  if EB_CDESPECIE.Focused then
    begin
    if Application.FindComponent('FSelEspecies') = nil then
      Application.CreateForm(TFSelEspecies, FSelEspecies);

    FSelEspecies.RetornaCampos(nCod, cDescricao);

    CdsPadrao.FieldByName('CD_ESPECIE').AsInteger  := nCod;
    CdsPadrao.FieldByName('NM_ESPECIE').AsString  := cDescricao;
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
