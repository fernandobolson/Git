unit uPadraoDB;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls,
  Vcl.Buttons, System.UITypes, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Vcl.Grids, Vcl.DBGrids, Data.FMTBcd, Data.SqlExpr, System.Actions,
  Vcl.ActnList;

type
  //Tipo para identificar a opera��o que est� sendo executada
  //e que ir� interferir no layout do form
  TOperacoes = (topIncluir, topAlterar, topExcluir, topCancelar);

  TFPadraoDB = class(TForm)
    pnlDados: TPanel;
    pnlBotoes: TPanel;
    grbManutencao: TGroupBox;
    grbConsulta: TGroupBox;
    pnlNavega: TPanel;
    pnlGrid: TPanel;
    dbnNavega: TDBNavigator;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    btnFechar: TBitBtn;
    dsp: TDataSetProvider;
    cds: TClientDataSet;
    DBGrid1: TDBGrid;
    sqlDS: TSQLDataSet;
    ds: TDataSource;
    actBotoes: TActionList;
    actIncluir: TAction;
    actAlterar: TAction;
    actExcluir: TAction;
    actSalvar: TAction;
    actCancelar: TAction;
    actFechar: TAction;
    Panel1: TPanel;
    edtLocalizar: TLabeledEdit;
    Label5: TLabel;
    cmbCampo: TComboBox;
    btnLocalizar: TButton;
    btnLimpar: TButton;
    actLocalizar: TAction;
    actPesquisa: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cdsAfterApplyUpdates(Sender: TObject; var OwnerData: OleVariant);
    procedure actAlterarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actCancelarExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actFecharExecute(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
  private
    FOperacao: TOperacoes;
    procedure SetOperacao(const Value: TOperacoes);
    { Private declarations }
  public
    { Public declarations }
    property Operacao : TOperacoes read FOperacao write SetOperacao;
  protected
    //Campo que um formul�rio filho pode passar para que seja tratado o auto incremento
    //do c�digo automaticamente
    cCampoIniProximoCodigo: string;

    //fun��o que ser� obrigatoriamente implementada
    //nos formul�rios filhos, pois aqui ela � abstrata,
    //ou seja, sem implementa��o.
    //Para poder ser sobrescrita (polimorfismo),
    //coloca-se o virtual.
    function DadosValidos: boolean; virtual; abstract;
  end;

var
  FPadraoDB: TFPadraoDB;

implementation

{$R *.dfm}

uses uDM;

{ TfrmPadraoDB }

procedure TFPadraoDB.SetOperacao(const Value: TOperacoes);
begin
  FOperacao := Value;
  //Habilita/Desabilita bot�es
  btnNovo.Enabled := (FOperacao in [topCancelar, topExcluir]);
  btnAlterar.Enabled := btnNovo.Enabled;
  btnExcluir.Enabled := (FOperacao = topCancelar);
  grbConsulta.Enabled := btnExcluir.Enabled;
  btnSalvar.Enabled := (FOperacao in [topAlterar, topIncluir]);
  btnCancelar.Enabled := btnSalvar.Enabled;
  grbManutencao.Enabled := btnSalvar.Enabled;
  //Ajusta o caption do formul�rio
  if Pos(' - [', Caption) > 0 then
    //Se j� existe o hifen e colchete no caption, copia o que tem
    //at� ele
    Caption := Copy(Caption, 1, Pos(' - [', Caption) - 1);
  case FOperacao of
    topIncluir: Caption := Caption + ' - [Inclus�o]';
    topAlterar: Caption := Caption + ' - [Altera��o]';
    topExcluir: Caption := Caption + ' - [Exclus�o]';
  end;
end;

procedure TFPadraoDB.actAlterarExecute(Sender: TObject);
begin
  Operacao := topAlterar;
  cds.Edit; //Coloca o registro corrente em edi��o





end;

procedure TFPadraoDB.actCancelarExecute(Sender: TObject);
begin
  Operacao := topCancelar;
  cds.Cancel; //Cancela as opera��es em aberto

end;

procedure TFPadraoDB.actExcluirExecute(Sender: TObject);
begin
  Operacao := topExcluir;
  if (not cds.IsEmpty) and
     (Application.MessageBox('Deseja excluir o registro selecionado?',
       'Confirma��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idYes) then
    begin
    cds.Delete; //Exclui o registro
    if (cds.ApplyUpdates(0) <> 0) then //Confirma a opera��o
      begin
      MessageDlg('Erro ao excluir o registro! ', mtError, [mbOK], 0);
      Exit;
    end;
  end;
  Operacao := topCancelar;
end;

procedure TFPadraoDB.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TFPadraoDB.actIncluirExecute(Sender: TObject);
var
  nPxCod: integer;
begin
  //Verifica se deve inicializar o pr�ximo c�digo com �ltimo + 1
  if (cCampoIniProximoCodigo <> '') then
    begin
    cds.Last;
    nPxCod := cds.FieldByName(cCampoIniProximoCodigo).AsInteger + 1;
  end;

  Operacao := topIncluir;
  SelectFirst; //Coloca o foco no primeiro componente
  cds.Append; //Cria uma nova linha para inser��o de dados

  //Verifica se deve inicializar o pr�ximo c�digo com �ltimo + 1
  if (cCampoIniProximoCodigo <> '') then
    cds.FieldByName(cCampoIniProximoCodigo).Value := nPxCod;
end;

procedure TFPadraoDB.actLocalizarExecute(Sender: TObject);
begin
  edtLocalizar.SetFocus;
end;

procedure TFPadraoDB.actSalvarExecute(Sender: TObject);
begin
  if DadosValidos then
    begin
    cds.Post; //salva a opera��o (edi��o ou inclus�o)
    if (cds.ApplyUpdates(0) = 0) then  //Confirma no banco de dados
      Operacao := topCancelar
    else
      ShowMessage('Erro ao gravar o registro!');
  end;
end;

procedure TFPadraoDB.btnLimparClick(Sender: TObject);
begin
  edtLocalizar.Clear;
  cmbCampo.ItemIndex := 0;
  //Desfaz o filtro existente
  cds.Filtered := False;
  cds.Filter := '';
  cds.Filtered := True;
end;

procedure TFPadraoDB.cdsAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
  cds.Close;
  cds.Open;
end;

Procedure TFPadraoDB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree; //Destr�i o form
  self := nil; //Tira refer�ncia na mem�ria
end;

procedure TFPadraoDB.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //CanClose := MessageDlg('Voc� deseja realmente sair?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TFPadraoDB.FormCreate(Sender: TObject);
begin
  cCampoIniProximoCodigo := '';

  Operacao := topCancelar;
  try
    cds.Open;
  except
    on E: Exception do
    MessageDlg('Erro ao abrir a fonte de dados! ' + E.Message,
      mtError, [mbOK], 0);
  end;
end;

procedure TFPadraoDB.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //Mudar de campo ao pressionar o Enter
  if key = #13 then
    begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
