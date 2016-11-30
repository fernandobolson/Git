unit uClientDataSetHelper;

interface

uses
  DateUtils, System.SysUtils, Data.DB, Datasnap.DBClient;

type
  TClientDataSetHelper = class helper for TClientDataSet
    private
      { private declarations }
    protected
      { protected declarations }
    public
      { public declarations }
      procedure AppendOrEdit;
      procedure EditAndPostField(AFieldName: String; AValue: Variant);
      function AsBoolean(const FieldName: String): boolean;
      function AsDate(const FieldName: String): TDateTime;
      function AsFloat(const FieldName: String): Double;
      function AsInt(const FieldName: String): integer;
      function AsStr(const FieldName: String): string;
    published
      { published declarations }
    end;


implementation

procedure TClientDataSetHelper.AppendOrEdit;
begin
  if (Self.IsEmpty) then
    Self.Append
  else
    Self.Edit;
end;

procedure TClientDataSetHelper.EditAndPostField(AFieldName: String;
  AValue: Variant);
begin
  Self.Edit;
  Self.FieldByName(AFieldName).Value := AValue;
  Self.Post;
end;


function TClientDataSetHelper.AsBoolean(const FieldName: String): boolean;
var
  s : String;
begin
  s := Self.AsStr(FieldName);
  Result := (s[1] in ['S','s']);
end;

function TClientDataSetHelper.AsDate(const FieldName: String): TDateTime;
begin
  Result := FieldByName(FieldName).AsDateTime;
end;

function TClientDataSetHelper.AsFloat(const FieldName: String): Double;
begin
  try
    Result := FieldByName(FieldName).AsFloat;
  except
    on e: EConvertError do
      Result := 0.0
    else
      Raise;
  end;
end;

function TClientDataSetHelper.AsInt(const FieldName: String): integer;
begin
  try
    Result := FieldByName(FieldName).AsInteger;
  except
    on e: EConvertError do
      Result := 0
    else
      raise;
  end;
end;

function TClientDataSetHelper.AsStr(const FieldName: String): string;
begin
  Result := FieldByName(FieldName).AsString;
end;


end.
