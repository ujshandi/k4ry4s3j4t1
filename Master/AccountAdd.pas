{ ********************************************************* }
{   By H@ndy  | dari tgl 160905 |                           }
{   2004/2005 | IndoRaya Software Corporation               }
{   - Sebagai Form Input Account                            }
{ ********************************************************* }
unit AccountAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls, strUtils, WinXP, Buttons;

type
  TfrmAccountAdd = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    txtNamel: TLabel;
    txtCode: TAdvEdit;
    txtName: TAdvEdit;
    WinXP1: TWinXP;
    btnSave: TButton;
    btnCancel: TButton;
    rbDebit: TRadioButton;
    rbCredit: TRadioButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
//    ListType  : TStringList;
    EditMode  : boolean;
    gAccID: integer;
//    gPsSeq : integer;
    procedure InitForm;
//    procedure DestroyList;
    procedure LoadData;
    procedure NewCode;

    function isValid: boolean;
    function isSaved: boolean;
  public
    procedure Execute(vMoneyId: integer);
    function NewExecute:integer;
  end;

var
  frmAccountAdd: TfrmAccountAdd;

implementation

uses UConst, UMaster, Subroutines, AutoBengkel, MainMenu, LOVNew;

{$R *.dfm}

{procedure TfrmAccountAdd.DestroyList;
begin
end;}

procedure TfrmAccountAdd.Execute(vMoneyId: integer);
begin
{  if (not Can_Browse(self)) then
  begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    Exit;
  end;}
  gAccID:= vMoneyId;
  EditMode  := vMoneyId <> 0;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
// (ModalResult in[mrOk,mrCancel]) then
end;

procedure TfrmAccountAdd.InitForm;
begin
  txtCode.Clear;
  txtName.Clear;
  txtCode.Enabled     := not EditMode;
  Self.Caption   := IfThen(EditMode,'Edit Biaya','New Biaya');
  btnSave.Caption:= IfThen(EditMode,'&Update','&Save');
  Self.ActiveControl := txtName;
  NewCode;
end;

function TfrmAccountAdd.isSaved: boolean;
var
  Account : TAccount;
begin
  Account := TAccount.Create;
  Account.AccCode := txtCode.Text;
  Account.AccName := txtName.Text; //txtName.Text+';'+txtBank.Text+';'+txtNoAcc.Text;
  Account.AccType := ACC_TYPE_EXPENSE;//.Names[cmbTipe.ItemIndex];
  Account.UserInsert := GlobalSystemUser.UserId;
  Account.UserEdit   := GlobalSystemUser.UserId;
//  Account.AccountNumber := txtNoAcc.Text;
  if EditMode then begin
    Account.AccId := gAccID;
    Result  := Account.UpdateOnDB;
  end else
    Result  := Account.InsertOnDB;
  Account.Free;
end;

function TfrmAccountAdd.isValid: boolean;
begin
  Result:= False;
 if txtCode.Text = '' then begin
    Alert('Kode Account belum diisi');
    txtCode.SetFocus;
  end else if txtName.Text = '' then begin
    Alert('Nama Account belum diisi');
    txtName.SetFocus;
  end else if ((TAccount.isExistCode(txtCode.Text)=True) and (not EditMode)) then begin
    Alert('Kode Dana '+txtCode.Text+#13+'Sudah ada');
    txtCode.SetFocus;
  end else
    Result:= true;
end;

procedure TfrmAccountAdd.LoadData;
var
  Acount: TAccount;
begin
  Acount  := TAccount.Create;
  if not  Acount.SelectOnDB(gAccID) then  begin
    Alert(MSG_NO_DATA_FOUND);
    Acount.Free;
    exit;
  end;
  txtCode.Text    := Acount.AccCode;
  txtName.Text    := Acount.AccName; // EkstrakString(MoneyAcount.MoneyName,';',1);
//  txtNoAcc.Text   := Acount.AccountNumber; //EkstrakString(MoneyAcount.MoneyName,';',3);
 // txtBank.Text    := Acount.BankName; //EkstrakString(MoneyAcount.MoneyName,';',2);
  Acount.Free;
end;

procedure TfrmAccountAdd.NewCode;
begin
  if not EditMode then
    txtCode.Text  := TAccount.getNewCode(ACC_TYPE_EXPENSE);
end;

procedure TfrmAccountAdd.btnSaveClick(Sender: TObject);
begin
  if IsValid and Confirmed(MSG_SAVE_CONFIRMATION)then
    if IsSaved and not EditMode then begin
      if Confirmed(MSG_ADD_DATA) then InitForm
      else ModalResult:= mrOk;
    end;
  if EditMode then ModalResult:= mrOk;
end;

procedure TfrmAccountAdd.btnCancelClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

function TfrmAccountAdd.NewExecute: integer;
begin
  Result := 0;
  EditMode := False;
//  MasterSeq := AItemSeq;
  InitForm;
  Run(Self);
  if ModalResult= mrOK then
    Result := getIntegerFromSQL('SELECT MAX(acc_id) FROM Account');
end;

end.
