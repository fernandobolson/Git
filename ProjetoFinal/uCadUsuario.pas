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
  cxTextEdit, cxRadioGroup, Vcl.Mask;


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
    EB_LOGIN: TcxDBTextEdit;
    Label1: TLabel;
    Label5: TLabel;
    EB_PERGUNTA: TcxDBTextEdit;
    EB_RESPOSTA: TcxDBTextEdit;
    Label6: TLabel;
    RGSupervisor: TcxDBRadioGroup;
    EB_SENHA: TcxDBTextEdit;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cxGridTableViewSUPERVISORGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure Ac_IncluirExecute(Sender: TObject);
    procedure Ac_ExcluirExecute(Sender: TObject);
  private
    { Private declarations }
    User : TUsuario;
    procedure CriaObjetoCrud; override;
    function CheckDadosFinal: Boolean; override;
    function CheckDadosExclusao: Boolean; override;
    procedure CriaObjetoUsuario;

    procedure GravaSenhaEncriptografada;
    procedure SetaSenhasDescriptografadasClient;
  public
    { Public declarations }
  end;

var
  FCadUsuario: TFCadUsuario;


implementation

uses
   uMenuBase
 , BibStr;

{$R *.dfm}

{ TFPadraoManut1 }

procedure TFCadUsuario.Ac_ExcluirExecute(Sender: TObject);
begin
  if not User.IsSupervisor then
    raise Exception.Create('Somente usúarios Supervisores podem Excluir outros usuários');

  inherited;
end;

procedure TFCadUsuario.Ac_IncluirExecute(Sender: TObject);
begin

  if not User.IsSupervisor then
    raise Exception.Create('Somente usúarios Supervisores podem Incluir novos usuários');

  inherited;
  cdsPadrao.Edit;
  CdsPadrao.FieldByName(ObjCrud.CampoChave).AsInteger := -1;
end;

function TFCadUsuario.CheckDadosExclusao: Boolean;
begin
  //
end;

function TFCadUsuario.CheckDadosFinal: Boolean;
begin
  Result := True;

  if Trim(cdsPadrao.FieldByName('LOGIN').AsString) = EmptyStr then
    begin
    Result := False;
    raise Exception.Create('Informe um Login para acesso ao sistema');
  end;

  EB_ID.SetFocus; //Forçar a sair dos campos

  if Result then
    GravaSenhaEncriptografada;
end;

procedure TFCadUsuario.GravaSenhaEncriptografada;
begin
  cdsPadrao.Edit;
  cdsPadrao.FieldByName('SENHA').AsString := Criptografa(cdsPadrao.FieldByName('SENHA').AsString);
  cdsPadrao.Post;
end;

procedure TFCadUsuario.SetaSenhasDescriptografadasClient;
begin

end;

procedure TFCadUsuario.CriaObjetoCrud;
begin
  inherited;

  ObjCrud := TObjCrud.Create;
  With ObjCrud do
  begin
    Nome := 'Cadastro de Usuários';
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

      cdsPadrao.Close;
      cdsPadrao.Open;

      RGSupervisor.Enabled := False;
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
