unit BibGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Imaging.jpeg, System.DateUtils;

function RespOkCancel(sTit, sMsg: String) : Integer; overload;
function RespOkCancel(sMsg: String) : Integer; overload;
function RespSN(sMsg : String) : Boolean; overload;
function GetVersaoAtual: String;
function GetMesAtual : String;
function GetSaudacaoConformeHorario : String;

const
  _RaizPadrao = 'software/programa';

implementation

function RespSN(sMsg : String) : Boolean;
begin
  Result := Application.MessageBox(PChar(sMsg), 'Atenção!', MB_YESNO + MB_ICONWARNING) = IDYES;
end;

function RespOkCancel(sTit, sMsg: String) : Integer;
begin
  Result := Application.MessageBox(PChar(sMsg), PChar(sTit), MB_OKCANCEL + MB_ICONINFORMATION);
end;

function RespOkCancel(sMsg: String) : Integer; overload;
begin
  Result := Application.MessageBox(PChar(sMsg), 'Atenção', MB_OKCANCEL + MB_ICONINFORMATION);
end;

function GetSaudacaoConformeHorario : String;
var
  n : SmallInt;
begin
  n := Trunc(Time * 24);
  case n of
    0..6  : Result := 'Boa madrugada! ';
    7..12 : Result := 'Bom dia! ';
    13..18: Result := 'Boa tarde! '
  else
    Result := 'Boa Noite! ';
  end;
end;

function GetVersaoAtual: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Tam: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Tam := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '- VetShop ';
  if Tam > 0 then
    begin
    Data := StrAlloc(Tam + 1);
    if GetFileVersionInfo(Parquivo, Handle, Tam, Data) then
      begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Result + Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs),
      LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs),
      LoWord(F^.dwFileVersionLs)]);
    end;
      StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function GetMesAtual : String;
var
  nMes :SmallInt;
begin
  nMes := MonthOf(Time);
  case nMes of
    1  : Result := 'Janeiro';
    2  : Result := 'Fevereiro';
    3  : Result := 'Março';
    4  : Result := 'Abril';
    5  : Result := 'Maio';
    6  : Result := 'Junho';
    7  : Result := 'Julho';
    8  : Result := 'Agosto';
    9  : Result := 'Setembro';
    10 : Result := 'Outubro';
    11 : Result := 'Novembro';
    12 : Result := 'Dezembro';
  end;
end;

end.
