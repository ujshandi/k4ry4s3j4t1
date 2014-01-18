unit PersonAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinXP, ComCtrls, AdvEdit, StdCtrls, ExtCtrls,  StrUtils, Math;

type
  TfrmPersonAdd = class(TForm)
    WinXP1: TWinXP;
    sttInfo: TStaticText;
    Bevel1: TBevel;
    lblCode: TLabel;
    txtCode: TAdvEdit;
    txtName: TAdvEdit;
    txtAddress: TAdvEdit;
    txtCity: TAdvEdit;
    txtPhone: TAdvEdit;
    txtPhone2: TAdvEdit;
    btnSave: TButton;
    btnCancel: TButton;
    pnlMotor: TPanel;
    StaticText1: TStaticText;
    txtYear: TAdvEdit;
    txtNoRangka: TAdvEdit;
    txtNoMesin: TAdvEdit;
    cmbMotorType: TComboBox;
    txtFax: TAdvEdit;
    txtCP: TAdvEdit;
    txtAccount: TAdvEdit;
    lblCP: TLabel;
    lblNoRek: TLabel;
    procedure cmbStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbStatusSelect(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cmbMotorTypeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtPhone2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    EditMode   : boolean;
    gMasterSeq :integer;
    gMasterTipe: string;
    isReference : boolean;
    ListMotor : TStringList;
    procedure NewCode;
    procedure InitForm;
    procedure LoadData;
    function IsValid: boolean;
    function IsSaved: boolean;
  public
    function ExecuteCustomer(ARSeq: integer=0):integer;
    function ExecuteSubdealer(ARSeq: integer=0):integer;
    function ExecuteMekanik(ARSeq: integer=0):integer;
    function ExecuteSupplier(ARSeq: integer=0):integer;

    function NewExecute(ARsType:string;APsName:string='';APsSeqUsed:integer=0):integer;

  end;

var
  frmPersonAdd: TfrmPersonAdd;

implementation

uses
  UConst, subroutines, MainMenu, un_ryu, AutoBengkel, UMaster;
{$R *.dfm}

procedure TfrmPersonAdd.cmbStatusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) then txtName.SetFocus;
end;

procedure TfrmPersonAdd.cmbCityKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) then txtPhone.SetFocus;
end;

procedure TfrmPersonAdd.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) then btnSave.SetFocus;
end;

procedure TfrmPersonAdd.InitForm;
var tipe: string;
begin
//  pnlKontak.Visible := (gMasterTipe = PS_TYPE_CONTACT);
  txtName.Clear;
  txtAddress.Clear;
  txtPhone.Clear;
  txtPhone2.Clear;
  txtCity.Clear;
  cmbMotorType.ItemIndex := -1;
  txtYear.Clear;
  txtNoRangka.Clear;
  txtNoMesin.Clear;
  txtCode.Clear;
  txtFax.Clear;
  txtCP.Clear;
  txtAccount.Clear;
  btnSave.Caption:= IfThen(EditMode,'&Update','&Save');
  txtCP.Visible := (gMasterTipe[1]=PS_TYPE_SUPPLIER);
  txtAccount.Visible := (gMasterTipe[1]=PS_TYPE_SUPPLIER);
  lblCP.Visible := (gMasterTipe[1]=PS_TYPE_SUPPLIER);
  lblNoRek.Visible := (gMasterTipe[1]=PS_TYPE_SUPPLIER);

  case gMasterTipe[1] of
    PS_TYPE_CUSTOMER : begin
      lblCode.Caption := 'No.Polisi/Kode';
      tipe:= ' Customer';
      Self.ActiveControl := txtCode;
      NewCode;
      txtCode.ReadOnly := False;
      sttInfo.Caption := '    Data Pelanggan    ';
    end;
    PS_TYPE_SUBDEALER : begin
      tipe:= ' Sub Dealer';
      lblCode.Caption := 'Kode';
      NewCode;
      Self.ActiveControl := txtName;
      sttInfo.Caption := '    Data Sub Dealer     ';
      txtCode.ReadOnly := True;
    end;
    PS_TYPE_MECHANIC : begin
      tipe:= ' Mechanic';
      sttInfo.Caption := '    Data Mekanik    ';
      NewCode;
      Self.ActiveControl := txtName;
      txtCode.ReadOnly := True;
    end;
    PS_TYPE_SUPPLIER : begin
      tipe:= ' Supplier';
      lblCode.Caption := 'Kode';
      NewCode;
      Self.ActiveControl := txtName;
      sttInfo.Caption := '    Data Supplier     ';
      txtCode.ReadOnly := True;
    end;
  end;
  Self.Caption:= IfThen(EditMode,'Edit '+tipe, 'Input Baru '+tipe);



//  btnContact.Visible:= (gMasterTipe = PS_TYPE_CONTACT); //--chan---Anti N.A.T.O--gMasterTipe <> PS_TYPE_CONTACT;
end;

function TfrmPersonAdd.IsSaved: boolean;
var vRelation: TPersons;
begin
  vRelation:= TPersons.Create;
  vRelation.PersonId   := gMasterSeq; //jika posisi edit
  vRelation.PersonCode  := txtCode.Text;
  vRelation.PersonName  := txtName.Text;
  vRelation.PersonType  := gMasterTipe;
  if gMasterTipe = PS_TYPE_CUSTOMER then begin
    vRelation.Motor.MotorId := StrToInt(ListMotor.Names[cmbMotorType.itemIndex]);
    vRelation.MtrYear   := txtYear.IntValue;
    vRelation.MtrMesin  := txtNoMesin.Text;
    vRelation.MtrRangka := txtNoRangka.Text;
  end;
  vRelation.Phone1  := txtPhone.Text;
  vRelation.Phone2  := txtPhone2.Text;
  vRelation.Phone3  := txtFax.Text;
  vRelation.Address := txtAddress.Text;
  vRelation.City    := txtCity.Text;
  vRelation.ContactPerson := txtCP.Text;
  vRelation.Account    := txtAccount.Text;
  vRelation.UserInsert := GlobalSystemUser.UserId;
  vRelation.UserEdit := GlobalSystemUser.UserId;
  if EditMode then
    Result:= vRelation.UpdateOnDB
  else Result:= vRelation.InsertOnDB;
  vRelation.Free;
end;

function TfrmPersonAdd.IsValid: boolean;
begin
  Result:= False;
  if (TPersons.ExistInDB(txtCode.Text,IfThen(EditMode,gMasterSeq,0))) then
    Inform('Kode sudah ada.')
  else
  if ValidMessage(txtCode,'Kode') then
   if ValidMessage(txtName,'Nama') then  begin
     if gMasterTipe = PS_TYPE_CUSTOMER then begin
       Result := ValidMessage(cmbMotorType,'Tipe Kendaraan') ;

     end
     else
       result:= true;
   end;
end;

procedure TfrmPersonAdd.LoadData;
var vRelation: TPersons;
begin
  vRelation:= TPersons.Create;
  if not vRelation.SelectInDb(gMasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    vRelation.Free;
    Exit;
  end;
  txtCode.Text   := vRelation.PersonCode;
  txtName.Text   := vRelation.PersonName;
  gMasterTipe    := vRelation.PersonType;
  if gMasterTipe = PS_TYPE_CUSTOMER then begin
    cmbMotorType.ItemIndex := ListMotor.IndexOfName(IntToStr(vRelation.Motor.MotorId));
    txtNoRangka.Text := vRelation.MtrRangka;
    txtYear.IntValue := vRelation.MtrYear;
    txtNoMesin.Text  := vRelation.MtrMesin;
  end;
  txtPhone.Text  := vRelation.Phone1;
  txtPhone2.Text := vRelation.Phone2;
  txtAddress.Text:= vRelation.Address;
  txtCity.Text   := vRelation.City;
  txtFax.Text := vRelation.Phone3;
  txtCP.Text   := vRelation.ContactPerson;
  txtAccount.Text := vRelation.Account;
  vRelation.Free;
end;

function TfrmPersonAdd.ExecuteCustomer(ARSeq: integer):integer;
begin
  ListMotor := TStringList.Create;
  if pnlMotor.Height = 0 then begin
    Self.Height := 420;
    pnlMotor.Height := 150;
  end;
  TMotor.getListType(ListMotor,cmbMotorType.Items);
  Result := 0;
  isReference := False;
  EditMode   := ARSeq<>0;
  gMasterSeq := ARSeq;
  gMasterTipe:= PS_TYPE_CUSTOMER;
  InitForm;
  if EditMode then
    LoadData;

  Run(Self);

  if ModalResult = mrOk then
    Result :=  getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
  ListMotor.Free;
end;

procedure TfrmPersonAdd.btnSaveClick(Sender: TObject);
begin
  if IsValid and Confirmed(MSG_SAVE_CONFIRMATION)then
    if IsSaved then
      if not EditMode then begin
        if isReference then
          ModalResult := mrOk
        else if Confirmed(MSG_ADD_DATA) then InitForm
        else ModalResult:= mrOk;
      end
      else
        ModalResult:= mrOk;
end;

procedure TfrmPersonAdd.NewCode;
begin
  txtCode.Text:= TPersons.GetNewNumber(gMasterTipe);
end;

procedure TfrmPersonAdd.cmbStatusSelect(Sender: TObject);
begin
  NewCode
end;

function TfrmPersonAdd.NewExecute(ARsType: string;APsName:string;APsSeqUsed:integer): integer;
begin
  isReference := True;
  EditMode   := False;
  gMasterSeq := 0;
  gMasterTipe:= ARsType;
  InitForm;
  txtName.Text := APsName;
  Result := 0;
  Run(Self);
  if ModalResult = mrOk then
    Result :=  getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
end;

procedure TfrmPersonAdd.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

function TfrmPersonAdd.ExecuteMekanik(ARSeq: integer): integer;
begin
  Result := 0;
  if pnlMotor.Height > 0 then begin
    Self.Height := 420-150;
    pnlMotor.Height := 0;
  end;
  isReference := False;
  EditMode   := ARSeq<>0;
  gMasterSeq := ARSeq;
  gMasterTipe:= PS_TYPE_MECHANIC;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
  if ModalResult = mrOk then
    Result :=  getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
end;

function TfrmPersonAdd.ExecuteSubdealer(ARSeq: integer): integer;
begin
  Result := 0;
  if pnlMotor.Height > 0 then begin
    Self.Height := 420-150;
    pnlMotor.Height := 0;
  end;

 // Self.AutoSize := True;

  isReference := False;
  EditMode   := ARSeq<>0;
  gMasterSeq := ARSeq;
  gMasterTipe:= PS_TYPE_SUBDEALER;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
  if ModalResult = mrOk then
    Result :=  getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
end;

procedure TfrmPersonAdd.cmbMotorTypeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    txtYear.SetFocus;
end;

procedure TfrmPersonAdd.txtPhone2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    if gMasterTipe = PS_TYPE_CUSTOMER then
      cmbMotorType.SetFocus
    else
      btnSave.SetFocus;
end;

function TfrmPersonAdd.ExecuteSupplier(ARSeq: integer): integer;
begin
  Result :=0;
  if pnlMotor.Height > 0 then begin
    Self.Height := 420-150;
    pnlMotor.Height := 0;
  end;

 // Self.AutoSize := True;

  isReference := False;
  EditMode   := ARSeq<>0;
  gMasterSeq := ARSeq;
  gMasterTipe:= PS_TYPE_SUPPLIER;
  InitForm;
  if EditMode then LoadData;
  Run(Self);

  if ModalResult = mrOk then
    Result :=  getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
end;

end.
