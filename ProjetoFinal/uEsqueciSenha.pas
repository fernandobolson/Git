unit uEsqueciSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Data.FMTBcd, Data.DB, Data.SqlExpr, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxDBEdit;

type
  TFEsqueciSenha = class(TForm)
    Label1: TLabel;
    Senha: TLabel;
    ebSenha: TMaskEdit;
    ebUser: TMaskEdit;
    cxDBComboBox1: TcxDBComboBox;
    SQLQuery1: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEsqueciSenha: TFEsqueciSenha;

implementation

{$R *.dfm}

uses uDmPrinc, BibGeral, BibStr, uLogin, uClientDataSetHelper;

end.
