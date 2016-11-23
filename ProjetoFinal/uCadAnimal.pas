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
    cxGridTableViewSEXO: TcxGridDBColumn;
    SpeedButton14: TSpeedButton;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    EB_RACA: TcxDBTextEdit;
    Label4: TLabel;
    Label6: TLabel;
    EB_CLIENTE: TcxDBTextEdit;
    btSelCliente: TSpeedButton;
    btSelRaca: TSpeedButton;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label7: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    Label8: TLabel;
    MemoObsGerais: TcxDBMemo;
    QryPadraoCD_ANIMAL: TIntegerField;
    QryPadraoNM_ANIMAL: TStringField;
    QryPadraoCD_RACA: TIntegerField;
    QryPadraoNM_RACA: TStringField;
    QryPadraoCOR: TStringField;
    QryPadraoSEXO: TStringField;
    QryPadraoCD_CLIENTE: TIntegerField;
    QryPadraoNM_CLIENTE: TStringField;
    QryPadraoCD_VETERINARIO: TIntegerField;
    QryPadraoDT_NASCIMENTO: TDateField;
    QryPadraoOBS_GERAIS: TStringField;
    QryPadraoFOTO: TBlobField;
    QryPadraoAGRESSIVO: TStringField;
    QryPadraoHIPERATIVO: TStringField;
    QryPadraoANTISOCIAL: TStringField;
    cdsPadraoCD_ANIMAL: TIntegerField;
    cdsPadraoNM_ANIMAL: TStringField;
    cdsPadraoCD_RACA: TIntegerField;
    cdsPadraoNM_RACA: TStringField;
    cdsPadraoCOR: TStringField;
    cdsPadraoSEXO: TStringField;
    cdsPadraoCD_CLIENTE: TIntegerField;
    cdsPadraoNM_CLIENTE: TStringField;
    cdsPadraoCD_VETERINARIO: TIntegerField;
    cdsPadraoDT_NASCIMENTO: TDateField;
    cdsPadraoOBS_GERAIS: TStringField;
    cdsPadraoFOTO: TBlobField;
    cdsPadraoAGRESSIVO: TStringField;
    cdsPadraoHIPERATIVO: TStringField;
    cdsPadraoANTISOCIAL: TStringField;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure btSelRacaClick(Sender: TObject);
    procedure ac_PesquisarExecute(Sender: TObject);
    procedure btSelClienteClick(Sender: TObject);

  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
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
  BibGeral,
  uSelCliente;

{ TFCadAnimal }

procedure TFCadAnimal.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
  cdsPadrao.FieldByName('SEXO').AsString := 'M'; //Valor default
end;

procedure TFCadAnimal.ac_PesquisarExecute(Sender: TObject);
begin
  inherited;
  if not PodeRealizarBuscaF3 then
    Exit;

  if EB_RACA.Focused  then
    RealizaBuscaRacas;

  if EB_CLIENTE.Focused then
    RealizaBuscaClientes;

end;

procedure TFCadAnimal.RealizaBuscaRacas;
var
  nCod : Integer;
  cDescricao : String;
begin

  if Application.FindComponent('FSelRacas') = nil then
    Application.CreateForm(TFSelRacas, FSelRacas);

  //FSelRacas.nEspecie := cdsPadrao.FieldByName('CD_ESPECIE').AsInteger;
  FSelRacas.RetornaCampos(nCod, cDescricao);

  if nCod <> 0 then
    begin
    CdsPadrao.FieldByName('CD_RACA').AsInteger := nCod;
    CdsPadrao.FieldByName('NM_RACA').AsString  := cDescricao;
  end;
end;


procedure TFCadAnimal.RealizaBuscaClientes;
var
  nCod : Integer;
  cDescricao : String;
begin
  if Application.FindComponent('FSelCliente') = nil then
    Application.CreateForm(TFSelClientes, FSelClientes);

  FSelClientes.RetornaCampos(nCod, cDescricao);

  if nCod <>  0 then
    begin
    CdsPadrao.FieldByName('CD_CLIENTE').AsInteger  := nCod;
    CdsPadrao.FieldByName('NM_CLIENTE').AsString  := cDescricao;
  end;

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


procedure TFCadAnimal.btSelClienteClick(Sender: TObject);
begin
  inherited;
    if PodeRealizarBuscaF3 then
    RealizaBuscaClientes;
end;

procedure TFCadAnimal.btSelRacaClick(Sender: TObject);
begin
  inherited;
  if PodeRealizarBuscaF3 then
    RealizaBuscaRacas;
end;

end.
