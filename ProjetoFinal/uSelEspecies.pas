unit uSelEspecies;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmPrinc, uSelPadrao, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  Data.DB, cxDBData, Data.FMTBcd, Datasnap.Provider, Data.SqlExpr,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid;

type
  TFSelEspecies = class(TFSelPadrao)
    cxGridTableViewID: TcxGridDBColumn;
    cxGridTableViewDESCRICAO: TcxGridDBColumn;
    cdsSelID: TIntegerField;
    cdsSelDESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RetornaCampos(var nCod : integer;var cDesc : String);
  end;

var
  FSelEspecies: TFSelEspecies;

implementation

{$R *.dfm}

{ TFSelEspecies }

procedure TFSelEspecies.RetornaCampos(var nCod: integer;
  var cDesc: String);
begin
  try
    cdsSel.Open;
    Self.ShowModal;
    nCod := 0;

    if lRetornaDados then
      begin
      nCod  := CdsSel.FieldByName('ID').AsInteger;
      cDesc := CdsSel.FieldByName('DESCRICAO').AsString;
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
