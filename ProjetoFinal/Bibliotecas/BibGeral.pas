unit BibGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Imaging.jpeg;


  procedure RespOkCancel(sTit, sMsg :String);

implementation

procedure RespOkCancel(sTit, sMsg : String);
begin
  Application.MessageBox(sMsg, sTit,
      MB_OKCANCEL + MB_ICONINFORMATION);
end;


end.
