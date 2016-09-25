unit opMath;

interface

function fat(n: integer): integer;

var usuarioLogado: string;

implementation


function fat(n: integer): integer;
var i, f: integer;
begin
  f := 1;
  for i:=1 to n do
  begin
    f := f * i;
  end;

  fat := f;
end;


end.
