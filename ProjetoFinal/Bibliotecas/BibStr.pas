unit BibStr;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

  function Space(n: integer): string;
  function Descriptografa(s:string):String;
  function AsciiToInt(Caracter: Char): Integer;
  function Criptografa(s:string):String;

implementation

const
  ChavePadrao = 86;
  Chave2 = 21;

function Space(n: integer): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to n do
    Result := Result + ' ';
end;

function AsciiToInt(Caracter: Char): Integer;
var
  i: Integer;
begin
  i := 32;
  while i < 255 do
    begin
    if Chr(i) = Caracter then
      Break;
    i := i + 1;
  end;
  Result := i;
end;

function Criptografa(s : string) : String;
var
  n:integer;
begin
  if (Trim(s) = EmptyStr) or (ChavePadrao = 0) then
    result := s
  else
    begin
    Result:='';
    for n:=1 to length(s) do
      Result := Result + Chr(AsciiToInt(s[n])+ChavePadrao);
  end;
end;

function Descriptografa(s : String): String;
var
  n:integer;
begin
  if (Trim(s) = EmptyStr) or (ChavePadrao = 0) then
    result := s
  else
    begin
    Result := '';
    for n:=1 to length(s) do
      Result := Result + Chr(AsciiToInt(s[n])-ChavePadrao);
  end;
end;


end.
