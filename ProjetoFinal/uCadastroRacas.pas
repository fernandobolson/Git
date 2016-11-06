unit uCadastroRacas;

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
  Vcl.Buttons, Vcl.ExtCtrls, cxTextEdit, cxDBEdit, cxImage, cxRadioGroup,
  Vcl.DBCtrls, uClientDataSetHelper;

type
  TFCadRacas = class(TFPadraoManut)
    cxGridTableViewCD_RACA: TcxGridDBColumn;
    cxGridTableViewCD_ESPECIE: TcxGridDBColumn;
    cxGridTableViewNM_RACA: TcxGridDBColumn;
    cxGridTableViewPORTE: TcxGridDBColumn;
    cdsPadraoCD_RACA: TIntegerField;
    cdsPadraoCD_ESPECIE: TIntegerField;
    cdsPadraoNM_RACA: TStringField;
    cdsPadraoPORTE: TStringField;
    cdsPadraoFOTO: TBlobField;
    cxDBImage1: TcxDBImage;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxButton2: TcxButton;
    cxTextEdit1: TcxTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure cxGridTableViewPORTEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadRacas: TFCadRacas;

implementation

{$R *.dfm}

procedure TFCadRacas.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
end;

function TFCadRacas.CheckDadosFinal: Boolean;
begin
  Result := True;
  if (Trim(CdsPadrao.AsStr('NM_RACA')) = EmptyStr)then
    begin
    Result := False;
    raise Exception.Create('Informe o nome da Raça.');
  end;


end;

procedure TFCadRacas.CriaObjetoCrud;
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

procedure TFCadRacas.cxGridTableViewPORTEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if AText = 'P' then
    AText := 'Pequeno'
  else if AText = 'M' then
    AText := 'Médio'
  else if AText = 'G' then
    AText := 'Grande';
end;

end.
