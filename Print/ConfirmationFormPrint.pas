unit ConfirmationFormPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TqrpConfirmationForm = class(TQuickRep)
    TitleBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrlGuestName: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qrlCheckIn: TQRLabel;
    qrlCheckOut: TQRLabel;
    qrlRate: TQRLabel;
    qrlDeposit: TQRLabel;
    QRLabel22: TQRLabel;
    qrlClerk: TQRLabel;
    qrlNotes: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    qrlAddress: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    qrlUserId: TQRLabel;
    qrlSuite: TQRLabel;
    qrlExecutive: TQRLabel;
    qrlSuperior: TQRLabel;
    qrlExtraBed: TQRLabel;
  private
     function LoadData(AResId:integer):boolean;
  public
     procedure Executes(AResID:integer);
  end;

var
  qrpConfirmationForm: TqrpConfirmationForm;

implementation

uses UTransaction, SQLServerConnections, UMaster, un_ryu, UConst;

{$R *.DFM}

{ TqrpConfirmationForm }

procedure TqrpConfirmationForm.Executes(AResID: integer);
begin
  if LoadData(AResID) then
    PreviewModal;
end;

function TqrpConfirmationForm.LoadData(AResId: integer):boolean;
var    vReservation : TReservation;
begin
  if AResID <= 0 then exit;
  vReservation := TReservation.Create;
  Result := vReservation.SelectInDB(AResID);
  if not Result then begin
    Alert(MSG_NO_DATA_FOUND);
    vReservation.Free;
    exit;
  end;
{  txtReservation.Text := vReservation.ResNum;
  txtReservation.Tag  := vReservation.ResId;
  rbPersonal.Checked  := vReservation.ResType = RESERVATION_TYPE_PERSONAL;
  rbGroup.Checked     := vReservation.ResType = RESERVATION_TYPE_GROUP;}
  qrlRate.Caption     := FloatToStrFmt2(TReservation.getRate(AresId));
  qrlDeposit.Caption  := FloatToStrFmt2(TReservation.getDeposit(AresId));
  qrlSuite.Caption    := IntToStr(TReservation.getRoomRequired(ROOM_TYPE_SUITE,AResID));
  qrlExecutive.Caption:= IntToStr(TReservation.getRoomRequired(ROOM_TYPE_EXECUTIVE,AResID));
  qrlSuperior.Caption := IntToStr(TReservation.getRoomRequired(ROOM_TYPE_SUPERIOR,AResID));
  qrlExtraBed.Caption := IntToStr(TReservation.getRoomRequired(ROOM_TYPE_EXTRABED,AResID));
  qrlCheckIn.Caption  := FormatDateTime(ShortDateFormat,vReservation.CheckIn);
  qrlCheckOut.Caption := FormatDateTime(ShortDateFormat,vReservation.CheckOut);
  qrlNotes.Caption    := vReservation.Notes;
  qrlClerk.Caption    := vReservation.UserInsert;
  qrlUserId.Caption   := vReservation.UserInsert;
  qrlAddress.Caption  := vReservation.Guests.Address + ' Phone : '+vReservation.Guests.Phone1;

  //vReservation.Guests.SelectInDB(vReservation.Guests.GuestId);
  //guest
  with vReservation.Guests do begin
    qrlGuestName.Caption   := GuestName;
{    txtGuestName.Tag    := GuestId;
    mmAddress.Lines.Text:= Address;
    txtPhone.Text       := Phone1;
    txtKTP.Text     := KtpId;
    txtSIM.Text     := SimId;
    txtPasport.Text := PasportId;
    txtOccupation.Text := '';
    txtCompany.Text := CompanyName;
    dtpBirthdate.DateTime := BirthDate;
    txtNationality.Text := '';   }
  end;
  vReservation.Free;


end;

end.
