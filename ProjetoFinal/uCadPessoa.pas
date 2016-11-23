unit uCadPessoa;

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
  Vcl.Buttons, Vcl.ExtCtrls, cxDropDownEdit, cxCalendar, cxDBEdit,
  Vcl.DBCtrls, cxMaskEdit, cxTextEdit, cxMemo;

type
  TFCadPessoa = class(TFPadraoManut)
    qryAnimais: TSQLQuery;
    dsAnimais: TDataSource;
    cdsPadraoCD_CLIENTE: TIntegerField;
    cdsPadraoNM_CLIENTE: TStringField;
    cdsPadraoCPF: TStringField;
    cdsPadraoRG: TStringField;
    cdsPadraoSEXO: TStringField;
    cdsPadraoDT_CADASTRO: TDateField;
    cdsPadraoCELULAR: TStringField;
    cdsPadraoTELEFONE1: TStringField;
    cdsPadraoTELEFONE2: TStringField;
    cdsPadraoEMAIL: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoNUMERO: TIntegerField;
    cdsPadraoCOMPLEMENTO: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCD_CIDADE: TIntegerField;
    cdsPadraoOBS_GERAIS: TStringField;
    cdsPadraoCD_GRUPO: TIntegerField;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label4: TLabel;
    Label6: TLabel;
    EB_CLIENTE: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    Label5: TLabel;
    Label8: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    cxDBDateEdit1: TcxDBDateEdit;
    Label7: TLabel;
    cxGridTableViewCD_CLIENTE: TcxGridDBColumn;
    cxGridTableViewNM_CLIENTE: TcxGridDBColumn;
    cxGridTableViewDT_CADASTRO: TcxGridDBColumn;
    cxGridTableViewCELULAR: TcxGridDBColumn;
    qryAnimaisCD_ANIMAL: TIntegerField;
    qryAnimaisNM_ANIMAL: TStringField;
    cxGroupBox1: TcxGroupBox;
    cxAnimais: TcxGrid;
    TableViewAnimais: TcxGridDBTableView;
    TableViewAnimaisNM_ANIMAL: TcxGridDBColumn;
    TableViewAnimaisNM_RACA: TcxGridDBColumn;
    TableViewAnimaisNM_ESPECIE: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDBTextEdit1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    procedure BuscaAnimaisVinculados;
  public
    { Public declarations }
  end;

var
  FCadPessoa: TFCadPessoa;

implementation

uses
   uDmPrinc
 , uClientDataSetHelper ;

{$R *.dfm}

{ TFCadPessoa }

procedure TFCadPessoa.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  CdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
  cdsPadrao.FieldByName('DT_CADASTRO').AsDateTime := Date;
  cdsPadrao.FieldByName('SEXO').AsString := 'M'; //Valor Default
end;

function TFCadPessoa.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFCadPessoa.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Pessoas';
    TabelaBanco := 'CLIENTE';
    CampoChave := 'CD_CLIENTE';
  end;
end;

procedure TFCadPessoa.cxDBTextEdit1PropertiesChange(Sender: TObject);
begin
  inherited;
  BuscaAnimaisVinculados;
end;

procedure TFCadPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qryAnimais.Close;
end;

procedure TFCadPessoa.BuscaAnimaisVinculados;
begin
  with qryAnimais do
    begin
    Close;
    Sql.Clear;
    Sql.Add('SELECT * FROM ANIMAL WHERE CD_CLIENTE = :CDCLIENTE');
    ParamByName('CDCLIENTE').AsInteger := cdsPadrao.AsInt('CD_CLIENTE');
    Open;
  end;
end;

end.
