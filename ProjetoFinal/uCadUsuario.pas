unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormPadrao, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, Data.FMTBcd, Data.SqlExpr,
  cxClasses, Datasnap.Provider, Datasnap.DBClient, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxPC, Vcl.StdCtrls, cxButtons, cxGroupBox,
  Vcl.Buttons, Vcl.ExtCtrls, uUsuario, Vcl.DBCtrls, cxMaskEdit, cxDBEdit,
  cxTextEdit;

type
  TFCadUsuario = class(TFPadraoManut)
    cxGridTableViewID: TcxGridDBColumn;
    cxGridTableViewLOGIN: TcxGridDBColumn;
    cxGridTableViewSUPERVISOR: TcxGridDBColumn;
    cdsPadraoID: TIntegerField;
    cdsPadraoLOGIN: TStringField;
    cdsPadraoSENHA: TStringField;
    cdsPadraoPERGUNTA: TStringField;
    cdsPadraoRESPOSTAPERG: TStringField;
    cdsPadraoDTINCLUSAO: TSQLTimeStampField;
    cdsPadraoSUPERVISOR: TStringField;
    EB_ID: TcxDBTextEdit;
    Label4: TLabel;
    Label3: TLabel;
    EB_DESCRICAO: TcxDBTextEdit;
    Label1: TLabel;
    EB_SENHA: TcxDBMaskEdit;
    Label5: TLabel;
    EB_PERGUNTA: TcxDBTextEdit;
    EB_RESPOSTA: TcxDBTextEdit;
    Label6: TLabel;
    DBCheckBox1: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cxGridTableViewSUPERVISORGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
  private
    { Private declarations }
    User : TUsuario;
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    function CheckDadosExclusao: Boolean; override;
    procedure CriaObjetoUsuario;
  public
    { Public declarations }
  end;

var
  FCadUsuario: TFCadUsuario;


implementation

uses
 uMenuBase;

{$R *.dfm}

{ TFPadraoManut1 }

function TFCadUsuario.CheckDadosExclusao: Boolean;
begin
  //
end;

function TFCadUsuario.CheckDadosFinal: Boolean;
begin
  Result := True;
end;

procedure TFCadUsuario.CriaObjetoCrud;
begin
  inherited;

  ObjCrud := TObjCrud.Create;
  With ObjCrud do
  begin
    Nome := 'Cadastro de Usúarios';
    TabelaBanco := 'USUARIOS';
    CampoChave := 'ID';
  end;

end;

procedure TFCadUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  //
  CriaObjetoUsuario;

  with User do
    begin
    if not IsSupervisor then
      begin
      QryPadrao.Close;
      QryPadrao.Sql.Text := EmptyStr;
      QryPadrao.SQL.Add('SELECT * FROM USUARIOS WHERE LOGIN = '+QuotedStr(Login));
      QryPadrao.Open;
    end;
  end;


end;

procedure TFCadUsuario.CriaObjetoUsuario;
begin
  User := TUsuario.Create(FMenuBase.nCodUsuario);
end;


procedure TFCadUsuario.cxGridTableViewSUPERVISORGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
begin
  inherited;
  if UpperCase(AText) = 'S' then
    AText := 'Sim'
  else
    AText := 'Não';
end;

end.
