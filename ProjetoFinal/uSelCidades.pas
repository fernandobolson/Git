unit uSelCidades;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSelPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Data.FMTBcd, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, Datasnap.Provider,
  Data.SqlExpr, Datasnap.DBClient, cxGridLevel, cxGridCustomView, cxGrid,
  Vcl.ExtCtrls;

type
  TFSelCidade = class(TFSelPadrao)
    cxGridTableViewCD_CIDADE: TcxGridDBColumn;
    cxGridTableViewNM_CIDADE: TcxGridDBColumn;
    cxGridTableViewCD_ESTADO: TcxGridDBColumn;
  private
    { Private declarations }

  public
    { Public declarations }
    procedure RetornaCampos(var nCod : integer;var cDesc : String);
  end;

var
  FSelCidade: TFSelCidade;

implementation

{$R *.dfm}

{ TFSelPadrao1 }


procedure TFSelCidade.RetornaCampos(var nCod: integer;
  var cDesc: String);
begin
  try
    nCod := 0;
    cDesc := EmptyStr;
    cdsSel.Open;
    Self.ShowModal;

    if lRetornaDados then
      begin
      nCod  := CdsSel.FieldByName('CD_CIDADE').AsInteger;
      cDesc := CdsSel.FieldByName('NM_CIDADE').AsString;
    end;

  except
    on E: Exception do
      begin
      ShowMessage('Erro ao retornar os Dados: ' + E.Message);
      Self.Close;
    end;
  end;

end;


end.
