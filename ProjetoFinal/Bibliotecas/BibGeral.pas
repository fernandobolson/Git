unit BibGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Imaging.jpeg;

function RespOkCancel(sTit, sMsg: String) : Integer; overload;
function RespOkCancel(sMsg: String) : Integer; overload;
function GetVersaoAtual: String;

const
  _RaizPadrao = 'Software/Programa';

implementation

function RespOkCancel(sTit, sMsg: String) : Integer;
begin
  Result := Application.MessageBox(PChar(sMsg), PChar(sTit), MB_OKCANCEL + MB_ICONINFORMATION);
end;

function RespOkCancel(sMsg: String) : Integer; overload;
begin
  Result := Application.MessageBox(PChar(sMsg), 'Atenção', MB_OKCANCEL + MB_ICONINFORMATION);
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

end.
