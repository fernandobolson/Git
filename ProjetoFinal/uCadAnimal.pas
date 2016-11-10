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
  Vcl.Buttons, Vcl.ExtCtrls, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit;

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
    Label1: TLabel;
    cxDBSpinEdit1: TcxDBSpinEdit;
    Label3: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    Label4: TLabel;
    cxDBSpinEdit2: TcxDBSpinEdit;
    Label5: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label6: TLabel;
    cxDBSpinEdit3: TcxDBSpinEdit;
    Label7: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    { Private declarations }
     procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadAnimal: TFCadAnimal;

implementation

{$R *.dfm}

{ TFCadAnimal }

procedure TFCadAnimal.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
end;

function TFCadAnimal.CheckDadosFinal: Boolean;
begin
  Result := True;
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

end.
