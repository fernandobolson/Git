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
  Vcl.Buttons, Vcl.ExtCtrls, cxTextEdit, cxDBEdit;

type
  TFCadCidade = class(TFPadraoManut)
    cxGridTableViewCD_CIDADE: TcxGridDBColumn;
    cxGridTableViewNM_CIDADE: TcxGridDBColumn;
    Label4: TLabel;
    EB_ID: TcxDBTextEdit;
    EB_DESCRICAO: TcxDBTextEdit;
    Label3: TLabel;
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    function CheckDadosFinal: Boolean; override;
    procedure CriaObjetoCrud; override;
    { Private declarations }
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
  if Trim(EB_DESCRICAO.Text) = EmptyStr then
    begin
    raise Exception.Create('Informe uma Descrição Válida');
    Result := False;
  end;

end;

procedure TFCadCidade.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
  begin
    Nome := 'Cadastro de Cidades';
    TabelaBanco := 'CIDADE';
    CampoChave := 'CD_CIDADE';
  end;
end;

end.
