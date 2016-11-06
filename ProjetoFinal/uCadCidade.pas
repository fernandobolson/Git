unit uCadCidade;

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
  Vcl.Buttons, Vcl.ExtCtrls, cxMaskEdit, cxSpinEdit, cxDBEdit, cxTextEdit;

type
  TFCadCidade = class(TFPadraoManut)
    cxGridTableViewCD_CIDADE: TcxGridDBColumn;
    cxGridTableViewNM_CIDADE: TcxGridDBColumn;
    cdsPadraoCD_CIDADE: TIntegerField;
    cdsPadraoNM_CIDADE: TStringField;
    cdsPadraoCD_ESTADO: TIntegerField;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBSpinEdit2: TcxDBSpinEdit;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    { Private declarations }
        procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadCidade: TFCadCidade;

implementation

{$R *.dfm}

procedure TFCadCidade.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
end;


function TFCadCidade.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFCadCidade.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  ObjCrud.Nome := 'Cadastro de Cidades';
  ObjCrud.CampoChave := 'CD_CIDADE';
  ObjCrud.TabelaBanco := 'CIDADE';
end;

end.
