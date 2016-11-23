unit uSelRacas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uSelPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Data.FMTBcd, cxClasses, Datasnap.Provider, Data.SqlExpr,
  Datasnap.DBClient, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFSelRacas = class(TFSelPadrao)
    cxGridTableViewCD_RACA: TcxGridDBColumn;
    cxGridTableViewCD_ESPECIE: TcxGridDBColumn;
    cxGridTableViewNM_RACA: TcxGridDBColumn;
    cxGridTableViewNM_ESPECIE: TcxGridDBColumn;
    cdsSelCD_RACA: TIntegerField;
    cdsSelCD_ESPECIE: TIntegerField;
    cdsSelNM_RACA: TStringField;
    cdsSelPORTE: TStringField;
    cdsSelFOTO: TBlobField;
    cdsSelNM_ESPECIE: TStringField;
    procedure cxGridTableViewPORTEGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
  private
    { Private declarations }
  public
    { Public declarations }
     nEspecie : Integer;
     procedure RetornaCampos(var nCod : integer;var cDesc : String);

  end;

var
  FSelRacas: TFSelRacas;

implementation

{$R *.dfm}



procedure TFSelRacas.cxGridTableViewPORTEGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if AText = 'P' then
    AText := 'Pequeno'
  else if AText = 'M' then
    AText := 'Médio'
  else if AText = 'G' then
    AText := 'Grande'
  else
    AText := 'Indefinido';
end;

procedure TFSelRacas.RetornaCampos(var nCod: integer;
  var cDesc: String);
begin
  try
    nCod := 0;
    //qrySel.ParamByName('ESPECIE').AsInteger := nEspecie;

    cdsSel.Open;
    Self.ShowModal;

    if lRetornaDados then
      begin
      nCod  := CdsSel.FieldByName('CD_RACA').AsInteger;
      cDesc := CdsSel.FieldByName('NM_RACA').AsString;
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
