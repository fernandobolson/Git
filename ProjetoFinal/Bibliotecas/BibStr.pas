unit BibStr;

interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

  //  function Crypt(Action, Src: String): String;
  function Space(n: integer): string;
  function RemoveAcentos(Str:String): String;
  function MaskCpf(cCPF : String) : String;
  function MaskCnpj(cCnpj : String) : String;

  function Criptografa(sTexto : String) : String;
  function Descriptografa(sTexto : String) : String;

implementation

const
  ChavePadrao = 91;
  Chave2 = 21;

  //Mascaras

  cMaskNum  = ',0.00';    {Mascara p/Valores}
  cMaskNum4  = ',0.00##;;#'; {Mascara p/Valores}
  cMaskNumZ4 = ',0.00##';    {Mascara p/Valores}
  cMaskQtd   = ',0.#####;;#'; {Mascara p/quantidades}
  cMaskQtdZ  = ',0.#####';    {Mascara p/quantidades}
  cMaskInt   = ',0;;#'; {Mascara p/ numeros inteiros}
  cMaskIntZ  = ',0';    {Mascara p/ numeros inteiros}

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

{function Criptografa(s : string) : String;
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
}




//function Crypt(Action, Src: String): String;
//Label Fim;
//var KeyLen : Integer;
//    KeyPos : Integer;
//    OffSet : Integer;
//    Dest, Key : String;
//    SrcPos : Integer;
//    SrcAsc : Integer;
//    TmpSrcAsc : Integer;
//    Range : Integer;
//begin
//  if (Src = '') Then
//    begin
//    Result:= '';
//    Goto Fim;
//  end;
//  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
//  Dest := '';
//  KeyLen := Length(Key);
//  KeyPos := 0;
//  SrcPos := 0;
//  SrcAsc := 0;
//  Range := 256;
//  if (Action = UpperCase('C')) then
//    begin
//    Randomize;
//    OffSet := Random(Range);
//    Dest := Format('%1.2x',[OffSet]);
//    for SrcPos := 1 to Length(Src) do
//      begin
//      Application.ProcessMessages;
//      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
//      if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
//
//      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
//      Dest := Dest + Format('%1.2x',[SrcAsc]);
//      OffSet := SrcAsc;
//    end;
//  end
//  else if (Action = UpperCase('D')) then
//    begin
//    OffSet := StrToInt('$' + copy(Src,1,2));//<--------------- adiciona o $ entra as aspas simples
//    SrcPos := 3;
//    repeat
//      SrcAsc := StrToInt('$' + copy(Src,SrcPos,2));//<--------------- adiciona o $ entra as aspas simples
//      if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
//        TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
//      if TmpSrcAsc <= OffSet then
//        TmpSrcAsc := 255 + TmpSrcAsc - OffSet
//      else
//        TmpSrcAsc := TmpSrcAsc - OffSet;
//      Dest := Dest + Chr(TmpSrcAsc);
//      OffSet := SrcAsc;
//      SrcPos := SrcPos + 2;
//    until (SrcPos >= Length(Src));
//  end;
//  Result:= Dest;
//  Fim:
//end;


function Criptografa(sTexto : String) : String;
var
  KeyLen, KeyPos, OffSet, SrcPos,
  SrcAsc, TmpSrcAsc, Range : Integer;
  Key : String;
begin
  Result:= '';
  if (sTexto = '') Then
    Exit;

  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;

  Randomize;
  OffSet := Random(Range);
  Result := Format('%1.2x',[OffSet]);
  for SrcPos := 1 to Length(sTexto) do
    begin
    Application.ProcessMessages;
    SrcAsc := (Ord(sTexto[SrcPos]) + OffSet) Mod 255;

    if KeyPos < KeyLen then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;

    SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    Result := Result + Format('%1.2x',[SrcAsc]);
    OffSet := SrcAsc;
  end;

end;

function Descriptografa(sTexto : String) : String;
var
  KeyLen, KeyPos, OffSet, SrcPos,
  SrcAsc, TmpSrcAsc, Range : Integer;
  Key : String;
begin
  Result:= '';
  if (sTexto = '') Then
    Exit;

  Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKL K3LAKDJSL9RTIKJ';
  KeyLen := Length(Key);
  KeyPos := 0;
  SrcPos := 0;
  SrcAsc := 0;
  Range := 256;

  OffSet := StrToInt('$' + copy(sTexto,1,2));
  SrcPos := 3;
  repeat
    SrcAsc := StrToInt('$' + copy(sTexto,SrcPos,2));
    if (KeyPos < KeyLen) Then
      KeyPos := KeyPos + 1
    else
      KeyPos := 1;

    TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
    if TmpSrcAsc <= OffSet then
      TmpSrcAsc := 255 + TmpSrcAsc - OffSet
    else
      TmpSrcAsc := TmpSrcAsc - OffSet;

    Result := Result + Chr(TmpSrcAsc);
    OffSet := SrcAsc;
    SrcPos := SrcPos + 2;
  until (SrcPos >= Length(sTexto));

end;

function RemoveAcentos(Str:String): String;
{Remove caracteres acentuados de uma string}
Const
  ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹∫™';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCUoa';
Var
  i : Integer;
Begin
  For i := 1 to Length(Str) do
    Begin
    if Pos(Str[i],ComAcento) <> 0 Then
       begin
       Str[i] := SemAcento[Pos(Str[i],ComAcento)];
       end;
    end;
  Result := Str;
end;

function MaskCpf(cCPF : String) : String;
{FunÁ„o : Retornar o Cpf formatado }
begin
  Result := '';//FormatMaskText('999.999.999-99;0;*', cCPF);
end;
(*--------------------------------------------------------------------*)

function MaskCnpj(cCnpj : String) : String;
{FunÁ„o: Retornar o Cnpj formatado}
begin
  Result := ''; //FormatMaskText('99.999.999/9999-99;0;*', cCnpj);


end;


end.
