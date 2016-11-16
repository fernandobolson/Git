unit uCadAnimal;

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
  Vcl.Buttons, Vcl.ExtCtrls, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  Vcl.DBCtrls, cxDropDownEdit, cxCalendar, cxMemo;

type
  TFCadAnimal = class(TFPadraoManut)
    cxGridTableViewCD_ANIMAL: TcxGridDBColumn;
    cxGridTableViewNM_ANIMAL: TcxGridDBColumn;
    cxGridTableViewNM_RACA: TcxGridDBColumn;
    cxGridTableViewNM_ESPECIE: TcxGridDBColumn;
    cxGridTableViewSEXO: TcxGridDBColumn;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    Label5: TLabel;
    EB_RACA: TcxDBTextEdit;
    EB_CDESPECIE: TcxDBTextEdit;
    btSelEspecie: TSpeedButton;
    cxDBTextEdit5: TcxDBTextEdit;
    btSelRaca: TSpeedButton;
    cxDBTextEdit3: TcxDBTextEdit;
    Label6: TLabel;
    EB_CLIENTE: TcxDBTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    cxDBDateEdit1: TcxDBDateEdit;
    Label7: TLabel;
    btSelCliente: TSpeedButton;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBMemo1: TcxDBMemo;
    Label8: TLabel;
    SpeedButton14: TSpeedButton;
    cdsPadraoCD_ANIMAL: TIntegerField;
    cdsPadraoNM_ANIMAL: TStringField;
    cdsPadraoCD_RACA: TIntegerField;
    cdsPadraoNM_RACA: TStringField;
    cdsPadraoCD_ESPECIE: TIntegerField;
    cdsPadraoNM_ESPECIE: TStringField;
    cdsPadraoCOR: TStringField;
    cdsPadraoSEXO: TStringField;
    cdsPadraoCD_CLIENTE: TIntegerField;
    cdsPadraoCD_VETERINARIO: TIntegerField;
    cdsPadraoDT_NASCIMENTO: TDateField;
    cdsPadraoOBS_GERAIS: TStringField;
    cdsPadraoFOTO: TBlobField;
    cdsPadraoAGRESSIVO: TStringField;
    cdsPadraoHIPERATIVO: TStringField;
    cdsPadraoANTISOCIAL: TStringField;
    cdsPadraoNM_CLIENTE: TStringField;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure btSelRacaClick(Sender: TObject);
    procedure ac_PesquisarExecute(Sender: TObject);
    procedure btSelEspecieClick(Sender: TObject);
  private
    { Private declarations }
     procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    procedure RealizaBuscaEspecies;
    procedure RealizaBuscaClientes;
    procedure RealizaBuscaRacas;
  public
    { Public declarations }
  end;

var
  FCadAnimal: TFCadAnimal;

implementation

{$R *.dfm}
uses
  uSelEspecies,
  uSelRacas,
  BibStr,
  BibGeral;

{ TFCadAnimal }

procedure TFCadAnimal.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
end;

procedure TFCadAnimal.ac_PesquisarExecute(Sender: TObject);
begin
  inherited;
  if not PodeRealizarBuscaF3 then
    Exit;

  if EB_CDESPECIE.Focused then
    RealizaBuscaEspecies;

  if EB_RACA.Focused  then
    RealizaBuscaRacas;

  if EB_CLIENTE.Focused then
    RealizaBuscaClientes;

end;

procedure TFCadAnimal.RealizaBuscaEspecies;
var
  nCod : Integer;
  cDescricao : String;
begin

  if Application.FindComponent('FSelEspecies') = nil then
    Application.CreateForm(TFSelEspecies, FSelEspecies);

  FSelEspecies.RetornaCampos(nCod, cDescricao);

  CdsPadrao.FieldByName('CD_ESPECIE').AsInteger  := nCod;
  CdsPadrao.FieldByName('NM_ESPECIE').AsString  := cDescricao;
end;

procedure TFCadAnimal.RealizaBuscaRacas;
var
  nCod : Integer;
  cDescricao : String;
begin
  if cdsPadrao.FieldByName('CD_ESPECIE').AsInteger <= 0 then
    begin
    RespOkCancel('Primeiramente informe uma espécie para realizar as buscas das raças.');
    Exit;
  end;

  if Application.FindComponent('FSelRacas') = nil then
    Application.CreateForm(TFSelRacas, FSelRacas);

  FSelRacas.nEspecie := cdsPadrao.FieldByName('CD_ESPECIE').AsInteger;
  FSelRacas.RetornaCampos(nCod, cDescricao);

  CdsPadrao.FieldByName('CD_RACA').AsInteger := nCod;
  CdsPadrao.FieldByName('NM_RACA').AsString  := cDescricao;
end;


procedure TFCadAnimal.RealizaBuscaClientes;
var
  nCod : Integer;
  cDescricao : String;
begin
  if Application.FindComponent('FSelEspecies') = nil then
    Application.CreateForm(TFSelEspecies, FSelEspecies);

  FSelEspecies.RetornaCampos(nCod, cDescricao);

  CdsPadrao.FieldByName('CD_ESPECIE').AsInteger  := nCod;
  CdsPadrao.FieldByName('NM_ESPECIE').AsString  := cDescricao;
end;



function TFCadAnimal.CheckDadosFinal: Boolean;
begin
  Result := True;
  try

    if Trim(cdsPadrao.FieldByName('NM_ANIMAL').AsString) = EmptyStr then
      begin
      raise Exception.Create('Informe o Nome do Animal.');
      Result := False;
    end;

    if cdsPadrao.FieldByName('CD_ESPECIE').AsInteger <= 0 then
      begin
      raise Exception.Create('Informe a Espécie do Animal.');
      Result := False;
    end;

    if cdsPadrao.FieldByName('CD_RACA').AsInteger <= 0 then
      begin
      raise Exception.Create('Informe a Raça do Animal.');
      Result := False;
    end;

  except
    Result := False;
  end;


end;

procedure TFCadAnimal.CriaObjetoCrud;
begin
  inherited;

  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Animais';
    TabelaBanco := 'ANIMAL';
    CampoChave := 'CD_ANIMAL';
  end;

end;

procedure TFCadAnimal.btSelEspecieClick(Sender: TObject);
begin
  inherited;

  if EB_CDESPECIE.Focused and PodeRealizarBuscaF3 then
    RealizaBuscaEspecies;
end;

procedure TFCadAnimal.btSelRacaClick(Sender: TObject);
begin
  inherited;
  if EB_RACA.Focused and PodeRealizarBuscaF3 then
    RealizaBuscaRacas;
end;

end.
