unit PenerimaanPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, StrUtils, Math,
  AutoBengkel, UMaster, UTransaction;

type
  TqrpPenerimaan = class(TQuickRep)
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
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
    qrShapeKiriAMount: TQRShape;
    qrlNomor: TQRLabel;
    qrlNama: TQRLabel;
    qrlQty: TQRLabel;
    qrlPrice: TQRLabel;
    qrlAMount: TQRLabel;
    qrShapeKananAmount: TQRShape;
    qrShapeTopBottom: TQRShape;
    QRLabel1: TQRLabel;
    qrSumTotal: TQRLabel;
    qrlRow: TQRLabel;
    qrlRealRow: TQRLabel;
    qrShapeKiriDisc: TQRShape;
    qrlDisc: TQRLabel;
    qrShapeKiriNett: TQRShape;
    qrlNett: TQRLabel;
    qrShapeKiriCode: TQRShape;
    qrlCode: TQRLabel;
    qrlSumDisc: TQRLabel;
    qrlSumNett: TQRLabel;
    adoMaster: TADOQuery;
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
    adoMasteritem_id: TLargeintField;
    adoMasteritem_code: TStringField;
    adoMasteritem_name: TStringField;
    adoMasterquantity: TFloatField;
    adoMasterprice_tampil: TBCDField;
    adoMasterAmount: TBCDField;
    adoMastertipe: TStringField;
    adoMasterdetail_seq: TLargeintField;
    adoMastermekanik: TStringField;
    adoMasterPerson_name: TStringField;
    adoMasterPerson_code: TStringField;
    adoMastermotor_name: TStringField;
    adoMastermtr_year: TIntegerField;
    adoMastermtr_rangka: TStringField;
    adoMastermtr_mesin: TStringField;
    adoMasterdiscount: TFloatField;
    adoMastermaster_discount: TBCDField;
    adoMastersubtotal: TBCDField;
    qrlCompany: TQRLabel;
    qrlMoto: TQRLabel;
    qrlAddress: TQRLabel;
    adoMasterdown_payment: TBCDField;
    qrlNetto: TQRLabel;
    adoMasteris_post: TSmallintField;
    QRDBText1: TQRDBText;
    adoMasterexpr_date: TDateTimeField;
    QRSysData1: TQRSysData;
    QRDBText2: TQRDBText;
    adoMastertgl_kirim: TDateTimeField;
    adoMastertgl_sampai: TDateTimeField;
    adoMasterdelivery_num: TStringField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
//    OfferFilter: TOffer_Arr;
    isDetail: Boolean;
    vTipe : string;
    gNoUrut,vRealRow,vTotalRecord,vTampungan,vPosisiRecord,vRow,vCounterKosong,vTambahanRow: Integer;
    vTotal,vGrantTotal,vTotalTransisi :Double;
    vDisc, vGrandDisc, vDiscTransisi,
    vNett, vGrantNett, vNettTransisi : Double;
    function NeoLoadData(AOfferSeq:integer): Boolean;
    procedure SetFooterBand;
    procedure SetColumHeader(AType:String);
    procedure SetColumHeaderAll(AType:string);
    procedure SetDetailAll(ANomor:integer;ANama,ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string);
    procedure SetDetail(ANomor:integer;ANama:string;AKonversi,AQty,APrice,AAMount:real;AType:string);
    procedure SetEmpty(AType:string);
    procedure SetFooter(AType:string;ATotal,ADisc,ANett:Double);
  public
//    procedure Executes(AOfferArr: TOffer_Arr; ADetail: Boolean);
    procedure Executes(AServiceSeq:integer);
  end;

var
  qrpPenerimaan: TqrpPenerimaan;

implementation

uses SQLServerConnections, un_ryu, UConst;

const TOTAL_ROW = 46;//48;//40;
      ROW_BARU  = 54;//56;//48;
      BATAS_EMPTY = 1;
{$R *.DFM}

{ TqrpRekapPO }

{procedure TqrpOfferGabungObject.Executes(AOfferArr: TOffer_Arr; ADetail: Boolean);
begin
  OfferFilter := AOfferArr;
  isDetail := ADetail;
  DetailBand1.Enabled := ADetail;
  QRBand1.Enabled     := ADetail;
  ReportTitle := qrlTitle.Caption;
  if NeoLoadData(0) then
    PreviewModal
  else
    Inform(MSG_NO_DATA_FOUND);
end;
 }
procedure TqrpPenerimaan.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vTambahanRow := 0;
  gNoUrut := 0;
  vTotal := 0; vDisc := 0; vNett := 0;
  vGrantTotal := 0; vGrandDisc:=0; vGrantNett:=0;
  vTotalTransisi := 0;vDiscTransisi:=0; vNettTransisi:=0;
  vRealRow :=  0;
  vCounterKosong :=0;
  vPosisiRecord := 0;
  adoMaster.First;
  vRow := 0;
  vTipe := '';
end;

procedure TqrpPenerimaan.QRDBText14Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    gNoUrut := gNoUrut + 1;
    Value := IntToStr(gNoUrut);
end;

function TqrpPenerimaan.NeoLoadData(AOfferSeq:integer): Boolean;
var
  Sql: String;
begin


  Sql := 'SELECT TOP 100 PERCENT s.ship_id, s.ship_num, s.ship_type, s.user_insert, s.ship_date, s.person_id, P.person_name, P.address, P.city, P.phone1, s.total, '+
         ' s.notes, b.item_id, i.item_code, i.item_name, (d.quantity/d.conversion) as quantity, d.price AS price_tampil, d.amount, ''B'' AS tipe, d.item_detail_id AS detail_seq, '+
          ' dbo.get_mekanik(s.mekanik_id) AS mekanik, P.person_code, m.motor_name, P.mtr_year, P.mtr_rangka, P.mtr_mesin, d.discount,s.discount, '+
          's.discount as master_discount, s.subtotal, s.down_payment, s.is_post,s.expr_date '+
          ', s.tgl_kirim, s.tgl_sampai, s.delivery_num '+
          ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.Item_Detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
           '  dbo.Items i ON b.item_id = i.item_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON P.motor_id = m.motor_id '+
            ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')'+
           ' UNION ALL '+
           ' SELECT TOP 100 PERCENT s.ship_id, s.ship_num, s.ship_type, s.user_insert, s.ship_date, s.person_id, '+
           ' P.person_name, P.address, P.city, P.phone1, s.total,  s.notes, d.item_id, i.item_code, i.item_name, d.quantity,'+
           ' d.price AS price_tampil, d.amount, ''B'' AS tipe, d.dump_id AS detail_seq,  dbo.get_mekanik(s.mekanik_id) AS mekanik,'+
           '  P.person_code, m.motor_name, P.mtr_year, P.mtr_rangka, P.mtr_mesin, d.discount,s.discount, s.discount as master_discount,'+
           '  s.subtotal, s.down_payment, s.is_post,s.expr_date'+
           ', s.tgl_kirim, s.tgl_sampai, s.delivery_num '+
           ' FROM dbo.Shipment s INNER JOIN   dbo.Persons P ON s.person_id = P.person_id'+
           ' INNER JOIN   dbo.dummy_Item_Detail d ON s.ship_id = d.ship_id'+
           ' INNER JOIN   dbo.Items i ON d.item_id = i.item_id LEFT OUTER JOIN   dbo.Motor m ON P.motor_id = m.motor_id'+
             ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')';

  Sql := Sql + ' Order By s.ship_id,ship_date,tipe, detail_seq ';
  adoMaster.Connection := myConnection.ADOConnection;
  adoMaster.Close;
  adoMaster.SQL.Clear;
  adoMaster.SQL.Text := Sql;
  adoMaster.Open;
  vTotalRecord := adoMaster.RecordCount;
  vTampungan := vTotalRecord + 5;
  Result := adoMaster.RecordCount <> 0;
  ReportTitle := qrlTitle.Caption;
  qrlNetto.Caption := IfThen(adoMasteris_post.Value=TRUE_VALUE,'Netto','Sisa');
end;

procedure TqrpPenerimaan.QRDBText9Print(sender: TObject; var Value: String);
begin
  Value := Value + ' Hari';
end;


procedure TqrpPenerimaan.SetFooterBand;
begin
 // qrlSUmDp.Caption   := FloatToStrFmt2(adoMasterdown_payment.Value);
  qrSumTotal.Caption := FloatToStrFmt2(adoMastersubtotal.Value);// vGrantTotal);//adoMastertotal.Value);
  qrlSumDisc.Caption := FloatToStrFmt2(adoMastermaster_discount.Value);
  qrlSumNett.Caption := FloatToStrFmt2(adoMastertotal.Value); //vGrantNett);
end;

procedure TqrpPenerimaan.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  SetFooterBand;
end;

procedure TqrpPenerimaan.Executes(AServiceSeq:integer);
var vCompany : TCompanyProfile;
begin
  //qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  vCompany := TCompanyProfile.Create;
  vCompany.SelectInDB;
  qrlCompany.Caption := vCompany.CompanyName;
  qrlMoto.Caption    := vCompany.Branch;
  qrlAddress.Caption := vCompany.Address +' '+vCompany.City+' Telp. '+ vCompany.Telp1+
                        ' Fax. '+vCompany.Fax;
  //qrMemoInfo.Lines.Text := 'Info : '+vCompany.Info;//
  //qrlTitle.Caption := IfThen(MasterPurpose=SHIP_TYPE_TERIMA_BARANG,'Penerimaan Barang','Retur Beli');
  if NeoLoadData(AServiceSeq) then
    PreviewModal
  else
    Inform(MSG_NO_DATA_FOUND);
  vCompany.Free;  
end;

procedure TqrpPenerimaan.SetColumHeader(AType: String);
begin
  qrlNomor.Font.Style    := [fsBold];
  qrlQty.Font.Style      := [fsBold];
  qrlDisc.Font.Style     := [fsBold];
  qrlPrice.Font.Style    := [fsBold];
  qrlAMount.Font.Style   := [fsBold];
  qrlNama.Font.Style     := [fsBold];
  qrlCode.Font.Style     := [fsBold];
  qrlNett.Font.Style     := [fsBold];

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taCenter;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taCenter;
  qrlNett.Alignment   := taCenter;
  qrlCode.Alignment   := taCenter;
  qrlDisc.Alignment   := taCenter;

  qrlNomor.Caption    := 'No.';
  qrlQty.Caption      := 'QTY';
  qrlDisc.Caption     := 'Diskon';
  qrlPrice.Caption    := 'Harga Satuan';
  qrlAMount.Caption   := 'Subtotal';
  qrlNett.Caption     := 'Netto';


  if AType = 'B' then begin// bahan
    qrlNama.Caption := 'Nama Part';
    qrlCode.Caption := 'Kode Part';
  end
  else begin
    qrlNama.Caption := 'Jenis Service';
    qrlCode.Caption := 'Kode Service';
  end;
end;

procedure TqrpPenerimaan.SetDetail(ANomor: integer; ANama: string;
  AKonversi, AQty, APrice, AAMount: real;AType:string);
begin
qrlNomor.Font.Style    := [];
  qrlQty.Font.Style      := [];
  qrlPrice.Font.Style    := [];
  qrlAMount.Font.Style   := [];
  qrlNama.Font.Style     := [];
  qrlCode.Font.Style     := [];
  qrlNett.Font.Style     := [];
  qrlDisc.Font.Style     := [];

  qrShapeTopBottom.Enabled    := False;

  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taLeftJustify;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taRightJustify;
  qrlCode.Alignment   := taCenter;
  qrlDisc.Alignment   := taRightJustify;
  qrlNett.Alignment   := taRightJustify;

  qrlNomor.Caption  := IfThen(ANomor=0,'',IntToStr(ANomor));
  qrlNama.Caption   := ANama;
  qrlQty.Caption      := IfThen(ANomor=0,'',FloatToStrFmt2(AQty));
  qrlPrice.Caption    := IfThen(ANomor=0,'',FloatToStrFmt2(APrice));
  qrlAMount.Caption   := FloatToStrFmt2(AAMount);
end;

procedure TqrpPenerimaan.SetEmpty(AType:string);
begin

  qrShapeTopBottom.Enabled    := False;

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
end;

procedure TqrpPenerimaan.SetFooter(AType:string;ATotal,ADisc,ANett:Double);
begin
  qrlNomor.Font.Style    := [];
  qrlQty.Font.Style      := [];
  qrlPrice.Font.Style    := [];
  qrlAMount.Font.Style   := [];
  qrlNama.Font.Style     := [];
  qrlNett.Font.Style     := [];
  qrlDisc.Font.Style     := [];
  qrlCode.Font.Style     := [];


  qrShapeTopBottom.Enabled    := True;


  qrlNomor.Alignment  := taCenter;
  qrlNama.Alignment   := taLeftJustify;
  qrlQty.Alignment    := taCenter;
  qrlPrice.Alignment  := taCenter;
  qrlAMount.Alignment := taRightJustify;
  qrlDisc.Alignment := taRightJustify;
  qrlNett.Alignment := taRightJustify;

  qrlCode.Caption   := '';
  qrlNomor.Caption  := '';
  qrlNama.Caption   := '';
  qrlQty.Caption      := '';
  qrlPrice.caption  := '';
  qrlQty.Caption    := 'Total';
  qrlAMount.Caption   := FloatToStrFmt2(ATotal);
  qrlDisc.Caption   := FloatToStrFmt2(ADisc);
  qrlNett.Caption   := FloatToStrFmt2(ANett);
                                 //asalnya and
  if (adoMastertipe.Value = AType) or (vRow = TOTAL_ROW) or
   (vRealRow =(TOTAL_ROW * Self.Printer.PageNumber + (3 * (Self.Printer.PageNumber-1)))) then begin
    vTotalTransisi := ATotal;
    vNettTransisi  := ANett;
    vDiscTransisi  := ADisc;
  end
  else begin
    vGrantTotal := vGrantTotal + ATotal;
    vGrandDisc  := vGrandDisc + ADisc;
    vGrantNett  := vGrantNett + ANett;
    vTotalTransisi := 0;
    vDiscTransisi  := 0;
    vNettTransisi  := 0;

    vTotal := 0;
    vDisc  := 0;
    vNett  := 0;
  end;
end;

procedure TqrpPenerimaan.SetColumHeaderAll(AType: string);
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
  qrlNett.Enabled    := True;
  qrlCode.Enabled  := True;
  qrlDisc.Enabled := True;

  qrShapeTopBottom.Enabled    := True;

  qrlQty.Enabled   := AType <> 'Z';
  qrlPrice.Enabled := AType <> 'Z';

  {qrShapeKiriQty.Enabled   := AType <> 'Z';
  qrShapeKiriPrice.Enabled := AType <> 'Z';}

  qrlNomor.Caption    := 'No.';
  qrlQty.Caption      := 'QTY';
  qrlPrice.Caption    := 'Harga Satuan';
  qrlAMount.Caption   := 'Subtotal';

  qrlDisc.Caption    := 'Diskon';
  qrlNett.Caption    := 'Netto';

  if AType = 'B' then begin// bahan
    qrlNama.Caption := 'Nama Part';
    qrlCode.Caption    := 'Kode Part';
  end
  else if AType = 'S' then begin //JASA
    qrlNama.Caption := 'Jenis Service';
    qrlCode.Caption    := 'Kode Service';
  end
  else begin //BIAYA
    qrlNama.Caption := 'Nama Biaya';
    qrlQty.Caption  := 'Tgl.Awal';
    qrlPrice.Caption:= 'Tgl.Akhir';
  end;
end;

procedure TqrpPenerimaan.SetDetailAll(ANomor:integer;ANama,ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string);
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
  qrlCode.Enabled   := True;
  qrlDisc.Enabled   := True;
  qrlNett.Enabled   := True;

  qrlQty.Enabled   := AType <> 'Z';
  qrlPrice.Enabled := AType <> 'Z';

  qrlNomor.Caption  := IfThen((ANomor=0) or (ANomor=-1),'',IntToStr(ANomor));
  qrlCode.Caption   := ACode;
  qrlNama.Caption   := ANama;
  qrlQty.Caption    := IfThen((ANomor=0) or (ANomor=-1),'',FloatToStrFmt2(AQty));
  qrlPrice.Caption  := IfThen((ANomor=0) or (ANomor=-1),'',FloatToStrFmt2(APrice));
  qrlAMount.Caption := FloatToStrFmt2(AQty * APrice);//AAMount);
  qrlDisc.Caption   := IfThen((ANomor=0) or (ANomor=-1),'',FloatToStrFmt2(ADisc));
  qrlNett.Caption   := IfThen((ANomor=0) or (ANomor=-1),'',FloatToStrFmt2(AAMount));
  if ANomor = -1 then begin //utk total sebelumnya
    qrlAMount.Caption := FloatToStrFmt2(AAMount);//AAMount);
    qrlDisc.Caption   := FloatToStrFmt2(ADisc);
    qrlNett.Caption   := FloatToStrFmt2(AQty);
  end
end;

procedure TqrpPenerimaan.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := vPosisiRecord < adoMaster.RecordCount+1;
  if MoreData then begin
    qrlRow.Caption := IntToStr(vRow+1);
    qrlRealRow.Caption := IntToStr(vRealRow+1);
    if vTipe <> adoMastertipe.Value then begin
      if vTotal > 0 then begin
        SetFooter(adoMastertipe.Value,vGrantTotal,vGrandDisc,vGrantNett);
      end
      else begin
        vCounterKosong := 0;
        SetColumHeaderAll(adoMastertipe.Value);
        vRow := 0;
        vTipe := adoMastertipe.Value;
        gNoUrut := 0;
      END;
    end
    else begin //jika tipeAktif = posisi tipe pada dsMaster
      //jika posisi record = jumlah data  atau posisi row = jumlah row ketentuan per page
      //maka akhiri saja pagenya dengan footer,
     // vAkhirPage := (TOTAL_ROW * Self.Printer.PageNumber + (3 * (Self.Printer.PageNumber-1)));
      if (vPosisiRecord = adoMaster.RecordCount) OR (vRow = (TOTAL_ROW+vTambahanRow)) then begin
        SetFooter(vTipe,vGrantTotal,vGrandDisc,vGrantNett);
        vRow := -2; //reset posisi row ke -1
         if (vPosisiRecord = adoMaster.RecordCount) then
             Inc(vPosisiRecord);
      end
      else if vRow <= 0 then begin
           if (vRow = -2) THEN begin //(ROW_BARU * (Printer.PageNumber-1)))   then begin
              qrpPenerimaan.NewPage;
              vTambahanRow := 5;
              SetColumHeaderAll(adoMastertipe.Value);
              vRow := -1;
            end
            else if (vRow = -1) then begin // ((ROW_BARU * (Printe.rPageNumber-1))+1))  then begin
                 SetDetailAll(-1,'Total Sebelumnya ','',vGrantNett,0,vGrantTotal,vGrandDisc ,adoMastertipe.Value);
                 vRow := 0;
                 vCounterKosong := 0;
            end;
      end
      else begin
        Inc(gNoUrut);
        SetDetailAll(gNoUrut, adoMasteritem_name.Value,adoMasteritem_code.Value,adoMasterquantity.Value,
                adoMasterprice_tampil.Value,adoMasterAmount.Value,adoMasterdiscount.Value,adoMastertipe.Value);
        vTotal := vTotal + {adoMasterAmount.Value}(adoMasterquantity.Value*
                adoMasterprice_tampil.Value) + vTotalTransisi;
        vDisc  := vDisc + adoMasterdiscount.Value + vDiscTransisi;
        vNett  := vNett + (adoMasterAmount.Value{ - adoMasterdiscount.Value}) + vNettTransisi;
         vGrantTotal := vGrantTotal + (adoMasterquantity.Value * adoMasterprice_tampil.Value);
           vGrandDisc  := vGrandDisc + adoMasterdiscount.Value;
           vGrantNett  := vGrantNett + adoMasterAmount.Value;
//        vGrantTotal := vGrantTotal + vTotal;
        Inc(vPosisiRecord);
        adoMaster.Next;
      end;
    end;
    if vRow >= 0 then
      Inc(vRow);
    Inc(vRealRow);
  end;

end;

end.
