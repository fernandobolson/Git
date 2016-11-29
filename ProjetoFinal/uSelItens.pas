unit uSelItens;

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
  TFSelItens = class(TFSelPadrao)
    cdsSelCD_PRODSERV: TIntegerField;
    cdsSelREFERENCIA: TStringField;
    cdsSelCODIGOBARRAS: TStringField;
    cdsSelTIPO: TStringField;
    cdsSelUNIDADE: TStringField;
    cdsSelCATEGORIA: TIntegerField;
    cdsSelQTDMIN: TFloatField;
    cdsSelQTDATUAL: TFloatField;
    cdsSelQTDMAX: TFloatField;
    cdsSelPRECOVENDA: TFloatField;
    cdsSelOBS_GERAIS: TStringField;
    cdsSelMARCA: TStringField;
    cdsSelFOTO: TBlobField;
    cdsSelNM_PRODSERV: TStringField;
    cdsSelDTVALIDADE: TDateField;
    cxGridTableViewCD_PRODSERV: TcxGridDBColumn;
    cxGridTableViewCODIGOBARRAS: TcxGridDBColumn;
    cxGridTableViewQTDATUAL: TcxGridDBColumn;
    cxGridTableViewPRECOVENDA: TcxGridDBColumn;
    cxGridTableViewNM_PRODSERV: TcxGridDBColumn;
  private
    procedure RetornaCampos(var nCod: integer; var cDesc: String);
    { Private declarations }
  public
    { Public declarations }
    function RetornaCodigoItemSelecionado : Integer;
  end;

var
  FSelItens: TFSelItens;

implementation
{$R *.dfm}

procedure TFSelItens.RetornaCampos(var nCod: integer;
  var cDesc: String);
begin
  try
    nCod := 0;


    cdsSel.Open;
    Self.ShowModal;

    if lRetornaDados then
      nCod  := CdsSel.FieldByName('CD_PRODSERV').AsInteger;
      cDesc := CdsSel.FieldByName('NM_PRODSERV').AsString;
  except
    on E: Exception do
      begin
      ShowMessage('Erro ao retornar os Dados: ' + E.Message);
      Self.Close;
    end;
  end;

end;



function TFSelItens.RetornaCodigoItemSelecionado: Integer;
begin
  try
    Result := 0;
    cdsSel.Open;
    Self.ShowModal;

    if lRetornaDados then
      Result := CdsSel.FieldByName('CD_PRODSERV').AsInteger;
  except
    on E: Exception do
      begin
      ShowMessage('Erro ao retornar os Dados: ' + E.Message);
      Self.Close;
    end;
  end

end;

end.
