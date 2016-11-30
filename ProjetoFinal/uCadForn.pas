unit uCadForn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Data.FMTBcd,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, Data.SqlExpr,
  cxClasses, Datasnap.Provider, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, cxGridLevel,
  cxGridCustomView, cxGrid, cxPC, Vcl.StdCtrls, cxButtons, cxGroupBox,
  Vcl.Buttons, Vcl.ExtCtrls, cxMaskEdit, cxDBEdit, cxTextEdit;

type
  TFCadForn = class(TFPadraoManut)
    cxGridTableViewCD_FORNECEDOR: TcxGridDBColumn;
    cxGridTableViewNM_FORN: TcxGridDBColumn;
    cxGridTableViewTELEFONE1: TcxGridDBColumn;
    cxGridTableViewTELEFONE2: TcxGridDBColumn;
    cxGridTableViewEMAIL: TcxGridDBColumn;
    cxGridTableViewCEP: TcxGridDBColumn;
    Label9: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    btSelRaca: TSpeedButton;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label4: TLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    Label5: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cdsPadraoCD_FORNECEDOR: TIntegerField;
    cdsPadraoNM_FORN: TStringField;
    cdsPadraoTELEFONE1: TStringField;
    cdsPadraoTELEFONE2: TStringField;
    cdsPadraoCRMV: TStringField;
    cdsPadraoEMAIL: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoNUMERO: TStringField;
    cdsPadraoCOMPLEMENTO: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCD_CIDADE: TIntegerField;
    cdsPadraoCNPJ: TStringField;
    cdsPadraoRG: TStringField;
    cdsPadraoOBSERVACOES: TStringField;
    cdsPadraoREGIAO: TIntegerField;
    cdsPadraoNM_CIDADE: TStringField;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure ac_PesquisarExecute(Sender: TObject);
  private
    { Private declarations }
        { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    function CheckDadosExclusao: Boolean; override;
    procedure RealizaBuscaCidades;
  public
    { Public declarations }
  end;

var
  FCadForn: TFCadForn;

implementation

{$R *.dfm}
uses
  uSelCidades;

{ TFCadForn }

procedure TFCadForn.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  CdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1;
end;

procedure TFCadForn.ac_PesquisarExecute(Sender: TObject);
begin
  inherited;
  if PodeRealizarBuscaF3 then
    RealizaBuscaCidades
end;

procedure TFCadForn.RealizaBuscaCidades;
var
  cDescricao :String;
  nCod : Integer;
begin
  if Application.FindComponent('FSelCidade') = nil then
    Application.CreateForm(TFSelCidade, FSelCidade);

  FSelCidade.RetornaCampos(nCod, cDescricao);

  if nCod <> 0 then
    begin
    CdsPadrao.FieldByName('CD_CIDADE').AsInteger  := nCod;
    CdsPadrao.FieldByName('NM_CIDADE').AsString  := cDescricao;
  end;
end;

function TFCadForn.CheckDadosExclusao: Boolean;
begin
  Result := True;
end;

function TFCadForn.CheckDadosFinal: Boolean;
begin
  Result := True;

  if CdsPadrao.FieldByName('NM_FORN').AsString = EmptyStr then
    begin
    Result := False;
    raise Exception.Create('Informe o nome do fornecedor');
  end;
  
end;

procedure TFCadForn.CriaObjetoCrud;
begin
  inherited;

  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Fornecedores';
    TabelaBanco := 'FORNECEDORES';
    CampoChave := 'CD_FORNECEDOR';
  end;

end;

end.
