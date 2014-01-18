unit BillPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,UTransaction;

type
  TqrpBillPrint = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    qrlRegNum: TQRLabel;
    qrlGuestName: TQRLabel;
    qrlCheckIn: TQRLabel;
    qrlRoomNo: TQRLabel;
    qrlShipNum: TQRLabel;
    qrlDate: TQRLabel;
    qrlTotal: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel7: TQRLabel;
    qrlPhone: TQRLabel;
    qrlAddress: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlRoomType: TQRLabel;
    qrlRoomRate: TQRLabel;
    qrlSubtotal: TQRLabel;
    qrlTax: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlGrandTotal: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    qrlTotalRate: TQRLabel;
    qrlPeriod: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlQty: TQRLabel;
    qrlPrice: TQRLabel;
    qrlNo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRSubDetail1NeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrlGrandTotalPrint(sender: TObject; var Value: String);
  private
     i,j:integer;
     vGrandTotal : Double;
     NeedDetail : boolean;
     vReg : TRegistration;
     vShipment  : TShipment_Arr;
     vServing : TServingShipment_Arr;
     function LoadData(ARoomNum:String):boolean;
  public
     procedure Executes(ARoomNum:String);
  end;

var
  qrpBillPrint: TqrpBillPrint;

implementation

uses UConst, un_ryu, AutoHotel, UMaster;

{$R *.DFM}

{ TqrpBillPrint }

procedure TqrpBillPrint.Executes(ARoomNum:String);
begin
  vShipment := TShipment_Arr.Create;
  vReg := TRegistration.Create;
  vServing  := TServingShipment_Arr.Create;
  LoadData(ARoomNum);
  PreviewModal;
  vShipment.Free;
  vServing.Create;
  vReg.Free;
end;

function TqrpBillPrint.LoadData(ARoomNum:string):boolean;
begin

  vReg.RegId := TRegistration.getId('',aRoomNum);
  if not vReg.SelectInDB(vReg.RegId) then begin
    Alert(MSG_NO_DATA_FOUND);
    exit;
  end;

  qrlRegNum.Caption := vReg.RegNum;
  qrlGuestName.Caption := vReg.Guests.GuestName;
  qrlPhone.Caption     := vReg.Guests.Phone1;
  qrlAddress.Caption   := vReg.Guests.Address;
  qrlPeriod.Caption   := FloatToStrFmt(vReg.Period);
  vGrandTotal := vReg.Period * vReg.Rooms.Price;
  qrlTotalRate.Caption:= FloatToStrFmt2(vReg.Period * vReg.Rooms.Price);
  qrlCheckIn.Caption  := FormatDateTime(ShortDateFormat,vReg.RegDate);
 // dtpDeparture.Date := vReg.CheckOut;
  //txtGuestNo.IntValue:= vReg.GuestNo;
  //txtPeriod.IntValue := vReg.Period;
 // txtPeriod.IntValue:= trunc(dtpDeparture.Date) - trunc(dtpArrival.Date);
 // cmbRoomType.ItemIndex := G_ROOM_TYPE.IndexOfName(vReg.Rooms.RoomType);
  qrlRoomNo.Caption    := vReg.Rooms.RoomCode;
  qrlRoomType.Caption  := TRooms.getDescRoomtType(vReg.Rooms.RoomType);
  qrlRoomRate.Caption  := FloatToStrFmt2(vReg.Rooms.Price);
//  chkPleasure.Checked := vReg.SetVisit(vReg.Purpose,VISIT_OF_PLEASURE);

 // chkBusiness.Checked := vReg.SetVisit(vReg.Purpose,VISIT_OF_BUSSINESS);
//  chkFamily.Checked := vReg.SetVisit(vReg.Purpose,VISIT_OF_FAMILY);
//  chkGoverment.Checked := vReg.SetVisit(vReg.Purpose,VISIT_OF_GOVERMENT);
  vShipment.Filter.Shipment.Registration.RegId := vReg.RegId;
//  vDetail := TServingShipment_Arr.Create;
  vShipment.FindOnDb;
  {
  end;}

end;

procedure TqrpBillPrint.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);

begin
  i:= 0;//vGrandTotal := 0;
  NeedDetail := False;
end;

procedure TqrpBillPrint.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
   MoreData := i <= vShipment.Count-1;
   if not MoreData then
     MoreData := j <= vServing.Count-1;
   NeedDetail := j <= vServing.Count-1;
   if MoreData and (not NeedDetail) then begin
       qrlNo.Caption := IntToStr(i+1)+'.';
       ChildBand1.Enabled := True;
       qrlShipNum.Font.Size := 10;
       qrlSubtotal.Font.Size:= 10;
       qrlShipNum.Font.Style := [];
       qrlDate.Font.Style := [];
       qrlSubtotal.Font.Style := [];
       qrlTax.Font.Style := [];
       qrlTotal.Font.Style := [];
       qrlQty.Caption := '';
       qrlPrice.Caption := '';
       qrlShipNum.Caption  := vShipment[i].ShipNum;
       qrlDate.Caption    := FormatDateTime(ShortDateFormat,vShipment[i].ShipDate);
       qrlSubtotal.Caption    := FloatToStrFmt2(vShipment[i].Subtotal);
       qrlTax.Caption  := FloatToStrFmt2(vShipment[i].Ppn);
       qrlTotal.Caption   := FloatToStrFmt2(vShipment[i].Total);
       vServing.Clear;
       j := 0;
       NeedDetail := vServing.FindOnDB(vShipment[i].ShipId);
       vGrandTotal := vGrandTotal + vShipment[i].Total;
       Inc(i);

   end
   else if NeedDetail then begin
     qrlNo.Caption := '';
     ChildBand1.Enabled := False;
     qrlShipNum.Font.Size := 8;
     qrlSubtotal.Font.Size:= 8;
     qrlShipNum.Font.Style := [fsItalic];
     qrlDate.Font.Style := [fsItalic];
     qrlQty.Font.Style := [fsItalic];
     qrlPrice.Font.Style := [fsItalic];
     qrlTotal.Font.Style := [fsItalic];
     qrlSubtotal.Font.Style := [fsItalic];
     qrlShipNum.Caption:= '   * '+vServing[j].Serving.ServingName;
     qrlDate.Caption := '';
     qrlTax.Caption :='';
     qrlTotal.Caption:='';
     qrlQty.Caption := FloatToStrFmt(vServing[j].Quantity);
     qrlPrice.Caption := FloatToStrFmt2(vServing[j].Price);
     qrlSubtotal.Caption := FloatToStrFmt2(vServing[j].Amount);
     Inc (j);
   end;

end;

procedure TqrpBillPrint.QRSubDetail1NeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  { MoreData := j< vServing.Count-1;
   if MoreData then begin
     qrlCode.Caption:= vServing[j].Serving.ServingCode;
     qrlName.Caption := vServing[j].Serving.ServingName;
     qrlQty.Caption := FloatToStrFmt(vServing[j].Quantity);
     qrlPrice.Caption := FloatToStrFmt2(vServing[j].Price);
     qrlAmount.Caption := FloatToStrFmt2(vServing[j].Amount);
   end;
   Inc(j);}
end;

procedure TqrpBillPrint.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
 // j:=0;
end;

procedure TqrpBillPrint.qrlGrandTotalPrint(sender: TObject;
  var Value: String);
begin
    Value := FloatToStrFmt2(vGrandTotal);
end;

end.
