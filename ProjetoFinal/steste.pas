unit steste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  BibStr;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Memo1.Lines.Add(Criptografa(Edit1.Text));
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Memo1.Lines.Add(Descriptografa(Edit1.Text));
end;

end.
