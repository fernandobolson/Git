unit uCfgGerais;

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
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFCfgGerais = class(TFPadraoManut)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCfgGerais: TFCfgGerais;

implementation

{$R *.dfm}

end.
