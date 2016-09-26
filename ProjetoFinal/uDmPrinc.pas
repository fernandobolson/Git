unit uDmPrinc;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOracle, Data.FMTBcd,
  Data.SqlExpr, Data.DB, Datasnap.DBClient, Datasnap.Provider;

type
  TDmPrinc = class(TDataModule)
    sqlCon: TSQLConnection;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesCD_PESSOA: TFMTBCDField;
    cdsClientesNM_PESSOA: TWideStringField;
    cdsClientesTP_PESSOA: TFMTBCDField;
    sqlClientes: TSQLQuery;
    procedure sqlConAfterConnect(Sender: TObject);
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

procedure TDmPrinc.sqlConAfterConnect(Sender: TObject);
begin
  //IMPORTANTE - Configura os parâmetros do Oracle para a sessão
  //Linguagem
  sqlCon.Execute('ALTER SESSION SET NLS_LANGUAGE = "BRAZILIAN PORTUGUESE"',
     NIL, NIL);
  //País
  sqlCon.Execute('ALTER SESSION SET NLS_TERRITORY = BRAZIL', NIL, NIL);
  //Formato de data
  sqlCon.Execute('ALTER SESSION SET NLS_DATE_FORMAT = ''MM/DD/YYYY''',
    NIL, NIL);
  //Tratamento de campos numéricos, se não colocar da problema com campos inteiros
  sqlCon.Execute('ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ''.,''',
    NIL, NIL);
end;

end.
