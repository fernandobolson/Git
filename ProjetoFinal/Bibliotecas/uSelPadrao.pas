unit uSelPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, uDmPrinc,
  Vcl.Menus, cxButtons;

type
  TFSelPadrao = class(TForm)
    cdsSel: TClientDataSet;
    dsSel: TDataSource;
    qrySel: TSQLQuery;
    dspSel: TDataSetProvider;
    Panel1: TPanel;
    cxGrid: TcxGrid;
    cxGridTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxStyleRepo: TcxStyleRepository;
    StyleAzul: TcxStyle;
    StyleVerde: TcxStyle;
    cxStyleOver: TcxStyle;
    btSelReg: TcxButton;
    btCancelar: TcxButton;
    procedure btSelRegClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridTableViewCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    lRetornaDados : Boolean;
  end;

var
  FSelPadrao: TFSelPadrao;

implementation

{$R *.dfm}

procedure TFSelPadrao.btCancelarClick(Sender: TObject);
begin
  lRetornaDados := False;
  Self.Close;
end;

procedure TFSelPadrao.btSelRegClick(Sender: TObject);
begin
  lRetornaDados := (not CdsSel.IsEmpty);
  Self.Close;
end;

procedure TFSelPadrao.cxGridTableViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  lRetornaDados:= (not CdsSel.IsEmpty);
  Self.Close;
end;

procedure TFSelPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFSelPadrao.FormCreate(Sender: TObject);
begin
  lRetornaDados := False;
end;

end.
