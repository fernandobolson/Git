unit uSelPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Data.FMTBcd, Datasnap.Provider, Data.SqlExpr, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSelecao = class
  private
    FCod: string;
    FDesc: string;
    procedure SetCod(const Value: string);
    procedure SetDesc(const Value: string);
    public
      property Cod :string read FCod write SetCod;
      property Desc : string read FDesc write SetDesc;
  end;

  TFSelPadrao = class(TForm)
    cdsSel: TClientDataSet;
    dsSel: TDataSource;
    cxGrid: TcxGrid;
    cxGridTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    qrySel: TSQLQuery;
    dspSel: TDataSetProvider;
    Panel1: TPanel;
    btSelReg: TButton;
    btCancelar: TButton;
    procedure btSelRegClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure CriaObjSel;
    { Private declarations }
  public
    { Public declarations }
  protected
    oSel : TSelecao;
    procedure RetornaDados(var obj: TSelecao); virtual; abstract;
  end;

var
  FSelPadrao: TFSelPadrao;

implementation

{$R *.dfm}

procedure TFSelPadrao.btCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFSelPadrao.btSelRegClick(Sender: TObject);
begin
  RetornaDados(oSel);
  Self.Close;
end;


procedure TFSelPadrao.FormCreate(Sender: TObject);
begin
  CriaObjSel;
end;


procedure TFSelPadrao.CriaObjSel;
begin

end;

{ TSelecao }

procedure TSelecao.SetCod(const Value: string);
begin
  FCod := Value;
end;

procedure TSelecao.SetDesc(const Value: string);
begin
  FDesc := Value;
end;

end.
