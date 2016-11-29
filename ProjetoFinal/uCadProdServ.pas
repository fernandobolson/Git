unit uCadProdServ;

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
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, cxTextEdit, cxDBEdit, cxImage,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFCadProdServ = class(TFPadraoManut)
    cxDBImage1: TcxDBImage;
    Label4: TLabel;
    EB_ID: TcxDBTextEdit;
    Label3: TLabel;
    EB_NM_PRODSERV: TcxDBTextEdit;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label6: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label8: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label11: TLabel;
    cxDBDateEdit1: TcxDBDateEdit;
    cdsPadraoCD_PRODSERV: TIntegerField;
    cdsPadraoREFERENCIA: TStringField;
    cdsPadraoCODIGOBARRAS: TStringField;
    cdsPadraoTIPO: TStringField;
    cdsPadraoUNIDADE: TStringField;
    cdsPadraoCATEGORIA: TIntegerField;
    cdsPadraoQTDMIN: TFloatField;
    cdsPadraoQTDATUAL: TFloatField;
    cdsPadraoQTDMAX: TFloatField;
    cdsPadraoPRECOVENDA: TFloatField;
    cdsPadraoOBS_GERAIS: TStringField;
    cdsPadraoMARCA: TStringField;
    cdsPadraoFOTO: TBlobField;
    cdsPadraoNM_PRODSERV: TStringField;
    cdsPadraoDTVALIDADE: TDateField;
    Label12: TLabel;
    cxDBComboBox1: TcxDBComboBox;
    cxGridTableViewCD_PRODSERV: TcxGridDBColumn;
    cxGridTableViewTIPO: TcxGridDBColumn;
    cxGridTableViewQTDATUAL: TcxGridDBColumn;
    cxGridTableViewPRECOVENDA: TcxGridDBColumn;
    cxGridTableViewColumn1: TcxGridDBColumn;
    Label7: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure cxGridTableViewTIPOGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
  private
    { Private declarations }
        procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadProdServ: TFCadProdServ;

implementation



{$R *.dfm}

{ TFCadProdServ }

procedure TFCadProdServ.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
  cdsPadrao.FieldByName('TIPO').AsString := 'P'; //Valor default
end;

function TFCadProdServ.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFCadProdServ.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Produtos e Serviços';
    TabelaBanco := 'PRODSERV';
    CampoChave := 'CD_PRODSERV';
  end;

end;

procedure TFCadProdServ.cxGridTableViewTIPOGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;

  if AText = 'S' then
    AText := 'Serviço'
  else
    AText := 'Produto';

end;

end.
