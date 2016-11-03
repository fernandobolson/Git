unit BibConsultas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.ComCtrls, Data.FMTBcd, Data.DB, Datasnap.Provider, Data.SqlExpr,
  Datasnap.DBClient, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxGridLevel, Registry;


implementation

uses
  uDmPrinc;

function BuscaDadosPadrao(Campos, Tabela : String; cWhere :String = '(0=0)' ) : OleVariant;
var
  qryLocal :TSQLQuery;
begin
  try
    qryLocal := TSQLQuery.Create(nil);
    qryLocal.SQLConnection := DmPrinc.sqlCon;
    if (Campos <> EmptyStr) and (Tabela <> EmptyStr) then
      begin
      qryLocal.SQL.Add('SELECT '+Campos+' FROM '+Tabela+ ' WHERE '+cWhere);
      qryLocal.Open;
    end;

    Result := DmPrinc.dsp.Data;
  except

  end;
end;

end.
