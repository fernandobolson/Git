unit uCadastroEspecies;

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
  Vcl.Buttons, Vcl.ComCtrls, Vcl.ExtCtrls, cxTextEdit, cxDBEdit;

type
  TFCadEspecie = class(TFPadraoManut)
    cxGridTableViewID: TcxGridDBColumn;
    cxGridTableViewDESCRICAO: TcxGridDBColumn;
    Label3: TLabel;
    cdsPadraoID: TIntegerField;
    cdsPadraoDESCRICAO: TStringField;
    EB_DESCRICAO: TcxDBTextEdit;
    EB_ID: TcxDBTextEdit;
    Label4: TLabel;
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadEspecie: TFCadEspecie;

implementation

{$R *.dfm}



procedure TFCadEspecie.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  cdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1; //Sera incrementado a partir de uma trigger no BD
end;

function TFCadEspecie.CheckDadosFinal: Boolean;
begin
  Result := True;
  if Trim(EB_DESCRICAO.Text) = EmptyStr then
    begin
    raise Exception.Create('Informe uma Descrição Válida');
    Result := False;
  end;

end;

procedure TFCadEspecie.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
  begin
    Nome := 'Cadastro de Espécies';
    TabelaBanco := 'ESPECIES';
    CampoChave := 'ID';
  end;
end;

end.
