unit opString;

interface

function Space(n: integer): string;

implementation

function Space(n: integer): string;
var
  i: integer;
  s: string;
begin
  s := '';
  for i := 1 to n do
  begin
    s := s + ' ';
  end;

  Space := s;
end;

end.
