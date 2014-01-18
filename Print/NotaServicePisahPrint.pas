unit NotaServicePisahPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, UTransaction;

type
  TqrpNotaServicePisah = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlNama: TQRLabel;
    qrlAlamat: TQRLabel;
    qrlTlp: TQRLabel;
    qrlNoPol: TQRLabel;
    qrlTipeMotor: TQRLabel;
    qrlNomor: TQRLabel;
    qrlTgl: TQRLabel;
    qrlID: TQRLabel;
    qrlUraian: TQRLabel;
    qrlJenis: TQRLabel;
    qrlQty: TQRLabel;
    qrlHarga: TQRLabel;
    qrlDisc: TQRLabel;
    qrlNett: TQRLabel;
    qrlBruto: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    qrlTotal: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    qrlShipIdUsed: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure qrlTotalPrint(sender: TObject; var Value: String);
  private
    vShipment : TShipment;
    NeedService : boolean;
    i,j,
    masterId : integer;
    vTotal : Double;
    function LoadData:boolean;
  public
     procedure Executes(AShipID:integer;APurpose:string);
  end;

var
  qrpNotaServicePisah: TqrpNotaServicePisah;

implementation

uses un_ryu, UConst, UMaster, AutoBengkel;

{$R *.DFM}

{ TqrpNotaService }

procedure TqrpNotaServicePisah.Executes(AShipID: integer;APurpose:string);
var vTitle : string;
begin
  masterId := AShipId;
  vShipment := TShipment.Create;
  if not LoadData then begin
    Alert(MSG_NO_DATA_FOUND);
    vShipment.Free;
    exit;
  end;
   case APurpose[1] of
     SHIP_TYPE_SERVICE : begin
       vTitle := 'Nota Jasa Bengkel';
       qrlShipIdUsed.Enabled := False;
     end;
     SHIP_TYPE_RETUR_SERVICE : begin
       vTitle := 'Nota Retur Jasa Bengkel';
       qrlShipIdUsed.Enabled := True;
     end;
   end;
   qrlTitle.Caption := vTitle;
  PreviewModal;
  vShipment.Free;
end;

function TqrpNotaServicePisah.LoadData: boolean;
begin
  Result := vShipment.SelectInDb(MasterId);
  if not Result then
    exit;
  qrlNomor.Caption := vShipment.ShipNum;
  qrlTgl.Caption   := NewFormatDate(vShipment.ShipDate);
  TPersons(vShipment.Persons).SelectInDB(vShipment.Persons.PersonId);
  qrlNama.Caption  := vShipment.Persons.PersonName;
  qrlAlamat.Caption:= vShipment.Persons.Address;
  qrlShipIdUsed.Caption := 'No.Service : '+TShipment.getNumFromID(vShipment.ShipIdUsed);
  qrlTlp.Caption   := vShipment.Persons.Phone1;
  qrlNoPol.Caption := vShipment.Persons.PersonCode;
  qrlTipeMotor.Caption := TMotor.getName(vShipment.Persons.Motor.MotorId);
  vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
  vShipment.ServiceDetailArr.FindOnDb(vShipment.ShipId);     
end;

procedure TqrpNotaServicePisah.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 0;NeedService := False;j:=0;
  vTotal := 0;
end;

procedure TqrpNotaServicePisah.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := (i<vShipment.ItemDetailArr.Count);
  if not MoreData then begin
    MoreData := (j<vShipment.ServiceDetailArr.Count);
    NeedService := True;
  end;
  if MoreData and (not NeedService) then  begin
    qrlID.Caption     := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
    qrlUraian.Caption := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
    qrlJenis.Caption  := TItems.getDesc(vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType);
    qrlQty.Caption    := FloatToStrFmt(vShipment.ItemDetailArr[i].Quantity);
    qrlHarga.Caption  := FloatToStrFmt(vShipment.ItemDetailArr[i].Price);
    qrlBruto.Caption  := FloatToStrFmt(vShipment.ItemDetailArr[i].Quantity * vShipment.ItemDetailArr[i].Price);
    qrlDisc.Caption   := FloatToStrFmt(vShipment.ItemDetailArr[i].Discount);
    qrlNett.Caption   := FloatToStrFmt(vShipment.ItemDetailArr[i].Amount);
    vTotal := vTotal + vShipment.ItemDetailArr[i].Amount;
    Inc(i);
  end
  else if MoreData and NeedService then begin
    qrlID.Caption     := vShipment.ServiceDetailArr[j].Services.ServiceCode;
    qrlUraian.Caption := vShipment.ServiceDetailArr[j].Services.ServiceName;
    qrlJenis.Caption  := TItems.getDesc(vShipment.ServiceDetailArr[j].Services.ServiceType);
    qrlQty.Caption    := FloatToStrFmt(vShipment.ServiceDetailArr[j].Quantity);
    qrlHarga.Caption  := FloatToStrFmt(vShipment.ServiceDetailArr[j].Price);
    qrlBruto.Caption  := FloatToStrFmt(vShipment.ServiceDetailArr[j].Quantity * vShipment.ServiceDetailArr[j].Price);
    qrlDisc.Caption   := FloatToStrFmt(vShipment.ServiceDetailArr[j].Discount);
    qrlNett.Caption   := FloatToStrFmt(vShipment.ServiceDetailArr[j].Amount);
    vTotal := vTotal + vShipment.ServiceDetailArr[j].Amount;
    Inc(j);
  end;
end;

procedure TqrpNotaServicePisah.qrlTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrFmt2(vTotal);
end;

end.
