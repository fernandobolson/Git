unit uSelCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSelPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Data.FMTBcd, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, Datasnap.Provider, Data.SqlExpr, Datasnap.DBClient,
  cxGridLevel, cxGridCustomView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFSelClientes = class(TFSelPadrao)
    cxGridTableViewCD_CLIENTE: TcxGridDBColumn;
    cxGridTableViewNM_CLIENTE: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RetornaCampos(var nCod : integer;var cDesc : String);
  end;

var
  FSelClientes: TFSelClientes;

implementation


procedure TFSelClientes.RetornaCampos(var nCod: integer;
  var cDesc: String);
begin
  try
    nCod := 0;

    cdsSel.Open;
    Self.ShowModal;

    if lRetornaDados then
      begin
      nCod  := CdsSel.FieldByName('CD_CLIENTE').AsInteger;
      cDesc := CdsSel.FieldByName('NM_CLIENTE').AsString;
    end;

  except
    on E: Exception do
      begin
      ShowMessage('Erro ao retornar os Dados: ' + E.Message);
      Self.Close;
    end;
  end;

end;

{$R *.dfm}

end.
