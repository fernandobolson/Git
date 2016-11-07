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
  TFSelPadrao1 = class(TFSelPadrao)
    cxGridTableViewID: TcxGridDBColumn;
    cxGridTableViewDESCRICAO: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSelPadrao1: TFSelPadrao1;

implementation

{$R *.dfm}

end.
