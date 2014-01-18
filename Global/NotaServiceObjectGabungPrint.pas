unit NotaServiceObjectGabungPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, StrUtils, Math,
  AutoBengkel, UMaster, UTransaction;

type
  TqrpNotaServiceObjectGabung = class(TQuickRep)
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    adoMaster: TADOQuery;
    DetailBand1: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    qrlTitle: TQRLabel;
    qrShapeKiriNomor: TQRShape;
    qrShapeKiriNama: TQRShape;
    qrShapeKiriQty: TQRShape;
    qrShapeKiriPrice: TQRShape;
    qrShapeKiriNett: TQRShape;
    qrlNomor: TQRLabel;
    qrlDisc: TQRLabel;
    qrlQty: TQRLabel;
    qrlPrice: TQRLabel;
    qrlAMount: TQRLabel;
    qrShapeKananAmount: TQRShape;
    qrShapeTopBottom: TQRShape;
    qrSumTotal: TQRLabel;
    qrlRow: TQRLabel;
    qrlRealRow: TQRLabel;
    adoMasterShip_id: TLargeintField;
    adoMasterShip_Num: TStringField;
    adoMasterShip_Type: TStringField;
    adoMasterUser_insert: TStringField;
    adoMasterShip_Date: TDateTimeField;
    adoMasterPerson_id: TLargeintField;
    adoMasteraddress: TStringField;
    adoMastercity: TStringField;
    adoMasterPhone1: TStringField;
    adoMastertotal: TBCDField;
    adoMasterNotes: TStringField;
    adoMasterquantity: TFloatField;
    adoMasterprice_tampil: TBCDField;
    adoMasterAmount: TBCDField;
    adoMastertipe: TStringField;
    adoMasterdetail_seq: TLargeintField;
    QRDBText1: TQRDBText;
    adoMastermekanik: TStringField;
    adoMasterPerson_name: TStringField;
    adoMasterPerson_code: TStringField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    adoMastermotor_name: TStringField;
    adoMastermtr_year: TIntegerField;
    adoMastermtr_rangka: TStringField;
    adoMastermtr_mesin: TStringField;
    adoMasterdiscount: TFloatField;
    qrlCode: TQRLabel;
    qrShapeKiriCode: TQRShape;
    qrlNett: TQRLabel;
    qrShapeKiriDisc: TQRShape;
    qrShapeKiriAmount: TQRShape;
    qrlSumDisc: TQRLabel;
    qrlSumNet: TQRLabel;
    QRMemo1: TQRMemo;
    adoMasterdisc_faktur: TBCDField;
    adoMastersubtotal: TBCDField;
    adoMasteritem_id: TLargeintField;
    adoMasteritem_code: TStringField;
    adoMasteritem_name: TStringField;
    adoMasterservice_parent: TIntegerField;
    adoMastership_service_type: TStringField;
    qrlCompany: TQRLabel;
    qrlAddress: TQRLabel;
    qrlMoto: TQRLabel;
    qrMemoInfo: TQRMemo;
    qrlSUmDp: TQRLabel;
    adoMasterdown_payment: TBCDField;
    adoMasteris_post: TSmallintField;
    qrlNetto: TQRLabel;
    QRDBText6: TQRDBText;
    adoMasterexpr_Date: TDateTimeField;
    QRSysData1: TQRSysData;
    adoMasteris_ksg: TSmallintField;
    qrlMemoNotes: TQRMemo;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRImage1: TQRImage;
    adoMasternopol: TStringField;
    qrMemoMekanik: TQRMemo;
    QRDBText7: TQRDBText;
    adoMasterKilometer: TStringField;
    QRDBText8: TQRDBText;
    adoMastersatuan: TStringField;
    qrlNama: TQRRichText;
    qrMemoAddress: TQRMemo;
    qrlInfoMobil: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QRDBText11Print(sender: TObject; var Value: String);
  private
    //isDetail: Boolean;
    vTipe : string; vTambahanRow : integer;
    gNoUrut,vRealRow,vTotalRecord,vTampungan,vPosisiRecord,vRow,vCounterKosong: Integer;
    vTotal,vGrantTotal, vDP :Double;
    vDisc, vGrandDisc,
    //vDiscTransisi,  vNettTransisi,vTotalTransisi,
    vNett, vGrantNett : Double;
    isFooter : boolean;
    function NeoLoadData(AOfferSeq:integer): Boolean;
    procedure SetFooterBand;
    procedure SetColumHeaderAll(AType:string);
    {yg dipake dibawah}
    procedure SetDetailAll(ANomor:integer;ANama:WideString;ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string;
              aItemId,aServiceParent:integer;aShipType:string;isKsg:boolean;satuan:string);

//    procedure SetEmpty(AType:string);
    procedure SetFooter(AType:string;ATotal,ADisc,ANett:Double;AShowShape:Boolean=True);
  public
    procedure Executes(AServiceSeq:integer;isEstimasi:boolean=false);
  end;

var
  qrpNotaServiceObjectGabung: TqrpNotaServiceObjectGabung;

implementation

uses SQLServerConnections, un_ryu, UConst;

const TOTAL_ROW = 40;
      ROW_BARU  = 48;
      BATAS_EMPTY = 1;//4; 1
{$R *.DFM}

{ TqrpRekapPO }

procedure TqrpNotaServiceObjectGabung.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  isFooter := False;
  vTambahanRow := 0;
  gNoUrut := 0;
  vTotal := 0; vDisc := 0; vNett := 0;
  vGrantTotal := 0; vGrandDisc:=0; vGrantNett:=0;
//  vTotalTransisi := 0;vDiscTransisi:=0; vNettTransisi:=0;
  vRealRow :=  0;
  vCounterKosong :=1;
  vPosisiRecord :=0;
  adoMaster.First;
  vRow := -1;
  vTipe := '';
  vDP := 0;
end;

procedure TqrpNotaServiceObjectGabung.QRDBText14Print(sender: TObject; var Value: String);
begin
 // if Value <> '' then
   // gNoUrut := gNoUrut + 1;
   // Value := IntToStr(gNoUrut);
end;

function TqrpNotaServiceObjectGabung.NeoLoadData(AOfferSeq:integer): Boolean;
var
  Sql, vFilter: String;
begin
  vFilter := '';
  if AOfferSeq <> 0 then
    vFilter := vFilter + ' AND S.ship_id ='+FormatSQLNumber(AOfferSeq);



  Sql :=  '   SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date,'+
          ' S.Person_id, P.person_name, P.address,p.city, P.Phone1,S.total,  S.Notes,'+
          ' v.service_id as item_id, v.service_code as item_code, v.service_name as item_name, d.quantity, d.price as price_tampil, '+
          ' d.Amount, ''A'' as tipe,service_detail_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code, '+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date, d.is_ksg,S.nopol,S.Kilometer, ''pcs'' as satuan,2 as urut '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.service_detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.persons_car PC  ON PC.person_id = s.person_id and PC.nopol = s.nopol INNER JOIN '+
           '  dbo.Services v ON v.Service_id = d.service_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON PC.motor_id = m.motor_id '+
           ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' +
          ' UNION '+
          'SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date, '+
          ' S.Person_id, P.Person_name, P.address,p.city, P.Phone1,S.total,   S.Notes, '+
          ' b.item_id, i.item_code, i.item_name, d.quantity, d.price as price_tampil,'+
          ' d.Amount, ''A'' as tipe, item_detail_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code,'+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date, d.is_ksg,S.nopol,S.Kilometer, i.used_unit as satuan, 1 as urut '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.Item_Detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
          '  dbo.persons_car PC  ON PC.person_id = s.person_id and PC.nopol = s.nopol INNER JOIN '+
           '  dbo.Items i ON b.item_id = i.item_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON PC.motor_id = m.motor_id '+
           ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' +
           //blok dummy
           ' UNION '+
           '   SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date,'+
          ' S.Person_id, P.person_name, P.address,p.city, P.Phone1,S.total,  S.Notes,'+
          ' v.service_id as item_id, v.service_code as item_code, v.service_name as item_name, d.quantity, d.price as price_tampil, '+
          ' d.Amount, ''A'' as tipe,dump_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code, '+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date, d.is_ksg,S.nopol,S.Kilometer, ''pcs'' as satuan, 3 as urut '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.dummy_item_detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Services v ON v.Service_id = d.service_id LEFT OUTER JOIN '+
           '  dbo.persons_car PC  ON PC.person_id = s.person_id and PC.nopol = s.nopol INNER JOIN '+
           '  dbo.Motor m ON PC.motor_id = m.motor_id '+
           ' WHERE d.item_id IS NULL AND    (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' +
          ' UNION '+
          'SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date, '+
          ' S.Person_id, P.Person_name, P.address,p.city, P.Phone1,S.total,   S.Notes, '+
          ' d.item_id, i.item_code, i.item_name, d.quantity, d.price as price_tampil,'+
          ' d.Amount, ''A'' as tipe, dump_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code,'+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date, d.is_ksg,S.nopol,S.Kilometer, i.used_unit as satuan, 3 as urut '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.DUmmy_Item_Detail d ON s.ship_id = d.ship_id INNER JOIN '+
            '  dbo.persons_car PC  ON PC.person_id = s.person_id and PC.nopol = s.nopol INNER JOIN '+
       //   '  dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
           '  dbo.Items i ON d.item_id = i.item_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON PC.motor_id = m.motor_id '+
           ' WHERE  d.service_id IS NULL AND   (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' ;


  //Sql := Sql + ' Order By s.ship_id,ship_date,tipe desc,item_code, detail_seq ';
  Sql := Sql + ' Order By s.ship_id,ship_date,urut, detail_seq ';
  adoMaster.Connection := myConnection.ADOConnection;
  adoMaster.Close;
  adoMaster.SQL.Clear;
  adoMaster.SQL.Text := Sql;
  adoMaster.Open;
  qrlMemoNotes.Lines.Text := 'Keterangan : '+#13+adoMasterNotes.Value;
  qrMemoMekanik.Lines.Text :=   TShipmentMechanic_Arr.getMechanic(adoMasterShip_id.Value);
  qrMemoAddress.Lines.Text := adoMasteraddress.Value;
  qrlInfoMobil.Caption := adoMastermotor_name.Value + ' ('+adoMasternopol.Value+')';
  vTotalRecord := adoMaster.RecordCount;
  vTampungan := vTotalRecord + 5;
  Result := adoMaster.RecordCount <> 0;
  ReportTitle := 'Nota Service';
  qrlNetto.Caption := IfThen(adoMasteris_post.Value=TRUE_VALUE,'Netto','Sisa');
end;

procedure TqrpNotaServiceObjectGabung.QRDBText9Print(sender: TObject; var Value: String);
begin
  Value := Value + ' Hari';
end;


procedure TqrpNotaServiceObjectGabung.SetFooterBand;
begin
  qrlSUmDp.Caption   := FloatToStrFmt2(adoMasterdown_payment.Value);
  qrSumTotal.Caption := FloatToStrFmt2(vGrantNett);//19.04.07 vGrantTotal);//adoMastersubtotal.Value); //
  qrlSumDisc.Caption := FloatToStrFmt2(adoMasterdisc_faktur.Value);//19.04.07 --hanya diskon faktur saja + vGrandDisc);
  qrlSumNet.Caption := FloatToStrFmt2(vGrantNett - adoMasterdown_payment.Value - adoMasterdisc_faktur.Value);//adoMastertotal.Value);
end;

procedure TqrpNotaServiceObjectGabung.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  SetFooterBand;
end;

procedure TqrpNotaServiceObjectGabung.Executes(AServiceSeq:integer;isEstimasi:boolean=false);
var vCompany : TCompanyProfile;
begin
  vCompany := TCompanyProfile.Create;
  vCompany.SelectInDB;
  qrlCompany.Caption := vCompany.CompanyName;
  qrlMoto.Caption    := vCompany.Branch;
  qrlAddress.Caption := vCompany.Address +' '+vCompany.City+' Telp. '+ vCompany.Telp1+
                        ' Fax. '+vCompany.Fax;
  qrMemoInfo.Lines.Text := 'Info : '+vCompany.Info;//
  qrlDisc.Enabled := False;
  if NeoLoadData(AServiceSeq) then
    Preview
  else
    Inform(MSG_NO_DATA_FOUND);

  vCompany.Free;
end;

{procedure TqrpNotaServiceObject.SetEmpty(AType:string);
begin
  qrShapeKiriNomor.Enabled    := False;
  qrShapeKiriNama.Enabled     := False;
  qrShapeKiriQty.Enabled      := False;
  qrShapeKiriPrice.Enabled    := False;
  qrShapeKiriAMount.Enabled   := False;
  qrShapeKananAmount.Enabled  := False;
  qrShapeTopBottom.Enabled    := False;
  qrShapeKiriCode.Enabled     := False;
  qrShapeKiriNett.Enabled     := False;
  qrShapeKiriDisc.Enabled     := False;


  qrlNomor.Caption  := '';
  qrlNama.Caption   := '';
  qrlQty.Caption      := '';
  qrlPrice.Caption    := '';
  qrlAMount.Caption   := '';
  qrlCode.Caption     := '';
  qrlDisc.Caption     := '';
  qrlNett.Caption     := '';
  vTotal := 0;
  vDisc  := 0;
  vNett  := 0;
end;          }

procedure TqrpNotaServiceObjectGabung.SetFooter(AType:string;ATotal,ADisc,ANett:Double;AShowShape:Boolean);
begin
  qrlNomor.Font.Style    := [fsBold];
  qrlQty.Font.Style      := [fsBold];
  qrlPrice.Font.Style    := [fsBold];
  qrlAMount.Font.Style   := [fsBold];
  qrlNama.Font.Style     := [fsBold];
  qrlNett.Font.Style     := [fsBold];
  qrlDisc.Font.Style     := [fsBold];
  qrlCode.Font.Style     := [fsBold];

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taLeftJustify;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taRightJustify;
  qrlDisc.Alignment := taRightJustify;
  qrlNett.Alignment := taRightJustify;

  qrShapeTopBottom.Enabled    := True;
  
  qrlCode.Caption   := '';
  qrlNomor.Caption  := '';
  qrlNama.Lines.Text:= '';
//  QRRichText1.Lines.Clear;
  qrlQty.Caption      := '';
  qrlPrice.caption  := '';
  qrlQty.Caption    := 'Total ';//+IfThen(AType='A','Jasa','Part');
  qrlAMount.Caption   := FloatToStrFmt2(ATotal);
  qrlDisc.Caption   := FloatToStrFmt2(ADisc);
  qrlNett.Caption   := FloatToStrFmt2(ANett);
  isFooter := False;
  if (adoMastertipe.Value<> AType) then begin
     vTotal := 0;
    vDisc  := 0;
    vNett  := 0;
//    vTotalTransisi := ATotal;
 //   vNettTransisi  := ANett;
  //  vDiscTransisi  := ADisc;
  end;

  if (adoMastertipe.Value = AType) and (vRow = TOTAL_ROW) or
   (vRealRow =(TOTAL_ROW * Self.Printer.PageNumber + (3 * (Self.Printer.PageNumber-1)))) then begin
 {   vTotalTransisi := ATotal;
    vNettTransisi  := ANett;
    vDiscTransisi  := ADisc;}
  end
  else begin
    
   { vTotalTransisi := 0;
    vDiscTransisi  := 0;
    vNettTransisi  := 0;
    }
   /// vTotal := 0;
   // vDisc  := 0;
  //  vNett  := 0;
  end;
end;

procedure TqrpNotaServiceObjectGabung.SetColumHeaderAll(AType: string);
begin
  qrlNomor.Font.Style    := [fsBold];
  qrlQty.Font.Style      := [fsBold];
  qrlPrice.Font.Style    := [fsBold];
  qrlAMount.Font.Style   := [fsBold];
  qrlNama.Font.Style     := [fsBold];
  qrlDisc.Font.Style  := [fsBold];
  qrlNett.Font.Style  := [fsBold];
  qrlCode.Font.Style  := [fsBold];

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taCenter;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taCenter;
  qrlCode.Alignment    := taCenter;
  qrlNett.Alignment  := taCenter;
  qrlDisc.Alignment := taCenter;

  qrlNomor.Enabled  := True;
  qrlNama.Enabled   := True;
  qrlQty.Enabled    := True;
  qrlPrice.Enabled  := True;
  qrlAMount.Enabled := True;
  qrlNett.Enabled    := false;//True;
  qrlCode.Enabled  := false;//True;
  qrlDisc.Enabled := false;//True;


  qrShapeTopBottom.Enabled    := True;
  
  qrlQty.Enabled   := AType <> 'Z';
  qrlPrice.Enabled := AType <> 'Z';

   //QRRichText1.Lines.Clear;
  {qrShapeKiriQty.Enabled   := AType <> 'Z';
  qrShapeKiriPrice.Enabled := AType <> 'Z';}

  qrlNomor.Caption    := 'No.';
  qrlQty.Caption      := 'QTY';
  qrlPrice.Caption    := 'Harga Satuan';
  qrlAMount.Caption   := 'Subtotal';

  qrlDisc.Caption    := 'Diskon';
  qrlNett.Caption    := 'Netto';

  if AType = 'B' then begin// bahan
    qrlNama.Lines.Text := 'Nama Part';
    qrlCode.Caption    := 'Kode Part';
  end
  else if AType = 'A' then begin //JASA
    qrlNama.Lines.Text := 'Nama Part / Jenis Service';
    qrlCode.Caption    := 'Kode Service';
  end
  else begin //BIAYA
    qrlNama.Lines.Text := 'Nama Biaya';
    qrlQty.Caption  := 'Tgl.Awal';
    qrlPrice.Caption:= 'Tgl.Akhir';
  end;
end;

procedure TqrpNotaServiceObjectGabung.SetDetailAll(ANomor:integer;ANama:WideString;ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string;
              aItemId,aServiceParent:integer;aShipType:string;isKsg:boolean;satuan:string);
begin
  qrlNomor.Font.Style  := [];
  qrlQty.Font.Style    := [];
  qrlPrice.Font.Style  := [];
  qrlAMount.Font.Style := [];
  qrlNama.Font.Style   := [];
  qrlCode.Font.Style   := [];
  qrlNett.Font.Style   := [];
  qrlDisc.Font.Style   := [];


  qrShapeTopBottom.Enabled    := False;

  qrlNomor.Alignment := taCenter;
  qrlNama.Alignment  := taLeftJustify;
  qrlCode.Alignment  := taCenter;
  qrlQty.Alignment   := taRightJustify;
  qrlPrice.Alignment := taRightJustify;
  qrlDisc.Alignment  := taRightJustify;
  qrlNett.Alignment  := taRightJustify;
  qrlAMount.Alignment:= taRightJustify;

  qrlNomor.Enabled  := True;
  qrlNama.Enabled   := True;
  qrlQty.Enabled    := True;
  qrlPrice.Enabled  := True;
  qrlAMount.Enabled := True;
  qrlCode.Enabled   := false;//True;
  qrlDisc.Enabled   := false;//True;
  qrlNett.Enabled   := false;//True;

  qrlQty.Enabled   := AType <> 'Z';
  qrlPrice.Enabled := AType <> 'Z';

  qrlNomor.Caption  := IfThen(ANomor=0,'',IntToStr(ANomor));
  qrlCode.Caption   := ACode;
  qrlNama.Lines.Text   := ANama;

  qrlQty.Caption    := IfThen(ANomor=0,'',FloatToStrFmt2(AQty)+' '+satuan);
  qrlPrice.Caption  := IfThen(ANomor=0,'',FloatToStrFmt2(APrice));
  //update chan 28.11.07
  //if (aShipType = SHIP_SERVICE_TYPE_KSG) and (aServiceParent>0) then begin
   if (aShipType = SHIP_SERVICE_TYPE_KSG) and  ((aServiceParent>0)or(isKsg)) then begin
    //TServicePackage.get
    qrlAMount.Caption := TServicePackage.getNotes(aItemId,aServiceParent,AType='A');
    qrlDisc.Caption   := FloatToStrFmt2(0);
    qrlNett.Caption   := FloatToStrFmt2(0);
  end
  else begin
   { vTotalTransisi := vTotalTransisi + (AQty * APrice);
    vDiscTransisi  := vDiscTransisi + ADisc;
    vNettTransisi  := vNettTransisi + AAMount;}
    qrlAMount.Caption := FloatToStrFmt2(AAMount);//IfThen(ANomor>0,AQty * APrice,AAMount));//AAMount);
    qrlDisc.Caption   := FloatToStrFmt2(ADisc); //IfThen(ANomor=0,'',FloatToStrFmt2(ADisc));
    qrlNett.Caption   := IfThen(ANomor=0,FloatToStrFmt2(AAMount-ADisc),FloatToStrFmt2(AAMount));//-ADisc));
  end;

end;

procedure TqrpNotaServiceObjectGabung.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
//  var vAwalPage:integer;
begin
    MoreData := vPosisiRecord <  adoMaster.RecordCount;
   // vPosisiRecord := TCustomADODataSet(adoMaster).RecNo;
   if MoreData then begin
      qrlRow.Caption := IntToStr(vRow+1);
      qrlRealRow.Caption := IntToStr(vRealRow+1);
      if vTipe <> adoMastertipe.Value then begin
        if (vTotal > 0) or (isFooter) then begin
          {adoMastertipe.Value}
//gabung ga ada total per tipe 11.01.12          SetFooter(vTipe,vTotal,vDisc,vNett);
          isFooter := False;      
        end
        else begin
          isFooter := True;
          vCounterKosong := 0;
          vTipe := adoMastertipe.Value;
          SetColumHeaderAll(vTipe);
          vRow := 0;

          gNoUrut := 0;
        END;
      end
      else begin //jika tipeAktif = posisi tipe pada dsMaster
        if ((vPosisiRecord) = adoMaster.RecordCount) OR (vRow = (TOTAL_ROW + vTambahanRow)) then begin
          SetFooter(adoMastertipe.Value,vGrantTotal,vGrandDisc,vGrantNett);
         //11.01.2012 SetFooter(adoMastertipe.Value,vTotal,vDisc,vNett);
         isFooter := False;
          vRow := -2; //reset posisi row ke -1
          if (vPosisiRecord = adoMaster.RecordCount) then
             Inc(vPosisiRecord);
        end
        else if vRow <= 0 then begin
            //SetEmpty(adoMastertipe.Value);//or(vRow = -1)
            if ((vRow = -2)) THEN begin //(ROW_BARU * (Printer.PageNumber-1)))   then begin
              qrpNotaServiceObjectGabung.NewPage;
              vTambahanRow := 10;
              SetColumHeaderAll(vTipe);//adoMastertipe.Value
              vRow := -1;
            end
            else if (vRow = -1) then begin // ((ROW_BARU * (Printe.rPageNumber-1))+1))  then begin
                 SetDetailAll(0,'Total Sebelumnya ','',0,0,vTotal,vDisc ,vTipe,0,0,'',(adoMasteris_ksg.Value=TRUE_VALUE),adoMastersatuan.Value);//adoMastertipe.Value
                 vRow := 0;
                 vCounterKosong := 0;
            end;
        end
        else begin
           Inc(gNoUrut);
           //update 28.11.07 chan
//           if (adoMastership_service_type.Value = SHIP_SERVICE_TYPE_KSG) and
  //            (adoMasterservice_parent.Value>0) then begin
          if (adoMastership_service_type.Value = SHIP_SERVICE_TYPE_KSG) and
              ((adoMasterservice_parent.Value>0) or (adoMasteris_ksg.Value=-1)) then begin

           end
           else begin                     //19.04.07  total sebelum disc  adoMasterAmount.Value
             vTotal := vTotal + (adoMasterquantity.Value * adoMasterprice_tampil.Value);// + vTotalTransisi;
             vDisc  := vDisc + adoMasterdiscount.Value;// + vDiscTransisi;
             vNett  := vNett + (adoMasterAmount.Value) ;//+ vNettTransisi;

             vGrantTotal := vGrantTotal + (adoMasterquantity.Value * adoMasterprice_tampil.Value);
             vGrandDisc  := vGrandDisc + adoMasterdiscount.Value;
             vGrantNett  := vGrantNett + adoMasterAmount.Value;
           end;


           //gNoUrut
           if (vPosisiRecord<=adoMaster.RecordCount) then
          SetDetailAll(gNoUrut, adoMasteritem_name.Value,adoMasteritem_code.Value,adoMasterquantity.Value,
                  adoMasterprice_tampil.Value,adoMasterAmount.Value,adoMasterdiscount.Value,vTipe,//adoMastertipe.Value
                  adoMasterItem_Id.Value,adoMasterService_Parent.Value,adoMastership_service_type.Value,(adoMasteris_ksg.Value=TRUE_VALUE),adoMastersatuan.Value);

          Inc(vPosisiRecord);
          adoMaster.Next;
        end;
      end;
      if vRow >= 0 then
        Inc(vRow);
      Inc(vRealRow);
   end;//end more data
 
end;

procedure TqrpNotaServiceObjectGabung.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  Value := EkstrakString(Value,'/',5);
end;

end.
