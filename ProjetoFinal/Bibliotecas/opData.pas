unit opData;

interface
function nomeDoMes(i: integer): String;
function diaDaSemana(dia: TDateTime): String;
function dataPorExtenso(munic: String; dia: TDateTime): String;

implementation

uses SysUtils;

function nomeDoMes(i: integer): String;
const mes: array[1..12] of string[9] = ('janeiro', 'fevereiro',
  'março', 'abril', 'maio', 'junho', 'julho', 'agosto',
  'setembro', 'outubro', 'novembro', 'dezembro');
begin
  nomeDoMes := mes[i];
end;

function diaDaSemana(dia: TDateTime): String;
const ds: array[1..7] of string[3] = ('dom', 'seg', 'ter',
  'qua', 'qui', 'sex', 'sab');
begin
  diaDaSemana := ds[DayOfWeek(dia)];
end;

function dataPorExtenso(munic: String; dia: TDateTime): String;
var d, m, a: word;
begin
  DecodeDate(dia, a, m, d);
  dataPorExtenso := munic + ', ' + IntToStr(d) + ' de ' +
    nomeDoMes(m) + ' de ' + IntToStr(a) + ' (' +
    diaDaSemana(dia) + ')';
end;

end.
