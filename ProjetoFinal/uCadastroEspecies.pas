unit uCadastroEspecies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxContainer, Data.FMTBcd, Data.SqlExpr, cxClasses, Datasnap.Provider,
  Datasnap.DBClient, System.Actions, Vcl.ActnList, System.ImageList,
  Vcl.ImgList, cxGroupBox, Vcl.Buttons, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, cxTextEdit, cxMaskEdit,
  cxDBEdit;

type
  TFCadEspecie = class(TFPadraoManut)
    EB_ID: TcxDBMaskEdit;
    lbID: TLabel;
    Label2: TLabel;
    EB_DESCRICAO: TcxDBMaskEdit;
    cxTableViewID: TcxGridDBColumn;
    cxTableViewDESCRICAO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function CheckDadosFinal : Boolean; override;
  public
    { Public declarations }
  end;

var
  FCadEspecie: TFCadEspecie;

implementation

{$R *.dfm}

function TFCadEspecie.CheckDadosFinal : Boolean;
begin
  inherited;
  Result := True;
end;

procedure TFCadEspecie.FormCreate(Sender: TObject);
begin
  Self.TabelaBanco := 'ESPECIES';
  Self.CampoChave := 'ID';
  inherited;
end;

end.
