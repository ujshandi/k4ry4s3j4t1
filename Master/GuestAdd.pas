unit GuestAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, ComCtrls, ExtCtrls,strUtils, UMaster;

type
  TfrmGuestAdd = class(TForm)
    Label1: TLabel;
    txtCode: TAdvEdit;
    txtName: TAdvEdit;
    txtAddress: TAdvEdit;
    txtCompany: TAdvEdit;
    Label2: TLabel;
    txtOccup: TAdvEdit;
    txtPhone: TAdvEdit;
    btnSave: TButton;
    btnCancel: TButton;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    txtPhone2: TAdvEdit;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label19: TLabel;
    txtKTP: TAdvEdit;
    txtSIM: TAdvEdit;
    txtPasport: TAdvEdit;
    dtpBirth: TDateTimePicker;
    txtNationality: TAdvEdit;
    Label5: TLabel;
    rbPersonal: TRadioButton;
    rbGroup: TRadioButton;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    EditMode:boolean;
    MasterID : integer;
    vGuest : TGuests;
    procedure InitForm;
    function isValid:boolean;
    function isSaved:boolean;
    procedure LoadData;
    procedure NewCode;
  public
    { Public declarations }
    function Execute(AId:integer):boolean;
  end;

var
  frmGuestAdd: TfrmGuestAdd;

implementation

uses MainMenu, UConst, un_ryu, AutoHotel;

{$R *.dfm}

{ TfrmGuestAdd }

function TfrmGuestAdd.Execute(AId: integer): boolean;
begin
  vGuest := TGuests.Create;
  MasterID := AId;
  Result := True;
  EditMode := (AId>0);
  InitForm;
  if  EditMode then LoadData;
  Run(Self);
  vGuest.Free;
end;

procedure TfrmGuestAdd.InitForm;
begin
  vGuest.Reset;
  txtCode.Clear;
  txtName.Clear;
  txtAddress.Clear;
  txtCompany.Clear;
  txtOccup.Clear;
  txtPhone.Clear;
  txtPhone2.Clear;
  txtKTP.Clear;
  txtSIM.Clear;
  txtPasport.Clear;
  txtNationality.Clear;
  rbPersonal.Checked := True;
  rbGroup.Checked := False;
  dtpBirth.Date := StrToDate('01/01/1980');
end;

function TfrmGuestAdd.isSaved: boolean;
begin
   vGuest.Reset;
   with vGuest do begin
      GuestCode := txtCode.Text;
      GuestName := txtName.Text;
      GuestType := IfThen(rbPersonal.Checked,GUEST_TYPE_PERSONAL,GUEST_TYPE_GROUP);
      Address   := txtCompany.Text;
      CompanyName := txtCompany.Text;
      Occupation  := txtOccup.Text;
      Phone1    := txtPhone.Text;
      Phone2    := txtPhone2.Text;
      Nationality := txtNationality.Text;
      KtpId     := txtKTP.Text;
      SimId     := txtSIM.Text;
      PasportId := txtPasport.Text;
      BirthDate := dtpBirth.Date;
   end;
   if EditMode then  begin
      vGuest.GuestId := MasterID;
       Result := vGuest.UpdateOnDB()
   end
   else
     Result := vGuest.InsertOnDb();
end;

function TfrmGuestAdd.isValid: boolean;
begin
   Result := False;
   if txtCode.Text = '' then begin
     Alert('Kode belum diisi');
     txtCode.SetFocus;
   end
   else if (not EditMode) and TGuests.isExistCOde(txtCode.Text) then begin
     Alert('Kode Sudah ada');
     txtCode.SetFocus;
   end
   else if txtName.Text =  '' then begin
     Alert('Nama belum diisi');
     txtName.SetFocus;
   end
   else if txtPhone.Text = '' then begin
     Alert('Telepon belum diisi');
     txtPhone.SetFocus;
   end
   else
     Result := True;

end;

procedure TfrmGuestAdd.LoadData;
begin
   if not vGuest.SelectInDB(MasterID) then begin
     Alert(MSG_NO_DATA_FOUND);
     ModalResult := mrOk;
   end;
  txtCode.Text    := vGuest.GuestCode;
  txtName.Text    := vGuest.GuestName;
  txtAddress.Text := vGuest.Address;
  txtCompany.Text := vGuest.CompanyName;
  txtOccup.Text   := vGuest.Occupation;
  txtPhone.Text   := vGuest.Phone1;
  txtPhone2.Text  := vGuest.Phone2;
  txtKTP.Text     := vGuest.KtpId;
  txtSIM.Text     := vGuest.SimId;
  txtPasport.Text := vGuest.PasportId;
  txtNationality.Text := vGuest.Nationality;
  dtpBirth.Date   := vGuest.BirthDate;
  rbPersonal.Checked := vGuest.GuestType = GUEST_TYPE_PERSONAL;
  rbGroup.Checked := vGuest.GuestType = GUEST_TYPE_GROUP;
end;

procedure TfrmGuestAdd.NewCode;
begin
  if not EditMode then
    txtCode.Text := TGuests.getNewCode(IfThen(rbPersonal.Checked,GUEST_TYPE_PERSONAL,GUEST_TYPE_GROUP));
end;

procedure TfrmGuestAdd.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGuestAdd.btnSaveClick(Sender: TObject);
begin
  if isValid and SaveConfirmed then
    if isSaved then
      if EditMode then
         ModalResult := mrOk
      else if Confirmed(MSG_ADD_DATA) then
        InitForm
      else
        ModalResult := mrOk;
end;

end.
