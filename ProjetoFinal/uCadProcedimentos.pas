unit uCadProcedimentos;

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
  Vcl.Buttons, Vcl.ExtCtrls, cxMemo, cxDBEdit, cxTextEdit;

type
  TFCadProcedimentos = class(TFPadraoManut)
    cdsPadraoCD_PROCEDIMENTO: TIntegerField;
    cdsPadraoNM_PROCEDIMENTO: TStringField;
    cdsPadraoOBSERVACOES: TStringField;
    cdsPadraoHORA: TTimeField;
    cxGridTableViewCD_PROCEDIMENTO: TcxGridDBColumn;
    cxGridTableViewNM_PROCEDIMENTO: TcxGridDBColumn;
    cxGridTableViewOBSERVACOES: TcxGridDBColumn;
    Label1: TLabel;
    EB_CDVENDA: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    Label3: TLabel;
    cxDBMemo1: TcxDBMemo;
    Label4: TLabel;
    procedure Ac_IncluirExecute(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
  end;

var
  FCadProcedimentos: TFCadProcedimentos;

implementation

{$R *.dfm}

{ TFCadProcedimentos }

procedure TFCadProcedimentos.Ac_IncluirExecute(Sender: TObject);
begin
  inherited;
  cdsPadrao.Edit;
  CdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1;
end;

function TFCadProcedimentos.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFCadProcedimentos.CriaObjetoCrud;
begin
  inherited;
  ObjCrud := TObjCrud.Create;
  With ObjCrud do
    begin
    Nome := 'Cadastro de Procedimentos';
    TabelaBanco := 'PROCEDIMENTOS';
    CampoChave := 'CD_PROCEDIMENTO';
  end;
end;

end.
