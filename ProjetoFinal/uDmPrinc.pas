unit uDmPrinc;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOracle, Data.FMTBcd,
  Data.SqlExpr, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.DBXFirebird, Data.DBXInterBase;

type
  TDmPrinc = class(TDataModule)
    sqlCon: TSQLConnection;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    cdsCD_PESSOA: TFMTBCDField;
    cdsNM_PESSOA: TWideStringField;
    cdsTP_PESSOA: TFMTBCDField;
    sql: TSQLQuery;
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmPrinc: TDmPrinc;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmPrinc.DataModuleDestroy(Sender: TObject);
begin
  if sqlCon.Connected then
    sqlCon.Close;
end;

end.
