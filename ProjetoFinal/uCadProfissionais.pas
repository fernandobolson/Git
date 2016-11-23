unit uCadProfissionais;

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
  Vcl.DBCtrls, cxMaskEdit, cxTextEdit;

type
  TFCadProfissionais = class(TFPadraoManut)
    cdsPadraoCD_PROFISSIONAL: TIntegerField;
    cdsPadraoNM_PROFISSIONAL: TStringField;
    cdsPadraoSEXO: TStringField;
    cdsPadraoAPELIDO: TStringField;
    cdsPadraoTELEFONE1: TStringField;
    cdsPadraoTELEFONE2: TStringField;
    cdsPadraoCD_TP_PROFISSIONAL: TIntegerField;
    cdsPadraoCRMV: TStringField;
    cdsPadraoEMAIL: TStringField;
    cdsPadraoCEP: TStringField;
    cdsPadraoENDERECO: TStringField;
    cdsPadraoNUMERO: TStringField;
    cdsPadraoCOMPLEMENTO: TStringField;
    cdsPadraoBAIRRO: TStringField;
    cdsPadraoCD_CIDADE: TIntegerField;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    EB_CLIENTE: TcxDBTextEdit;
    cxDBMaskEdit1: TcxDBMaskEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    DBRadioGroup1: TDBRadioGroup;
    cxDBTextEdit1: TcxDBTextEdit;
    Label9: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label10: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label11: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    Label12: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    btSelRaca: TSpeedButton;
    cxDBTextEdit9: TcxDBTextEdit;
    Label13: TLabel;
    cxDBTextEdit10: TcxDBTextEdit;
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadProfissionais: TFCadProfissionais;

implementation

{$R *.dfm}

{ TFCadProfissionais }

procedure TFCadProfissionais.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1;
end;

function TFCadProfissionais.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFCadProfissionais.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Profissionais';
    TabelaBanco := 'PROFISSIONAIS';
    CampoChave := 'CD_PROFISSIONAL';
  end;
end;

end.
