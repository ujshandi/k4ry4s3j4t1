unit NotaServiceObjectPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, StrUtils, Math,
  AutoBengkel, UMaster, UTransaction;

type
  TqrpNotaServiceObject = class(TQuickRep)
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    adoMaster: TADOQuery;
    DetailBand1: TQRBand;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    qrlTitle: TQRLabel;
    qrShapeKiriNomor: TQRShape;
    qrShapeKiriNama: TQRShape;
    qrShapeKiriQty: TQRShape;
    qrShapeKiriPrice: TQRShape;
    qrShapeKiriNett: TQRShape;
    qrlNomor: TQRLabel;
    qrlNama: TQRLabel;
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
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    //isDetail: Boolean;
    vTipe : string;
    gNoUrut,vRealRow,vTotalRecord,vTampungan,vPosisiRecord,vRow,vCounterKosong: Integer;
    vTotal,vGrantTotal,vTotalTransisi, vDP :Double;
    vDisc, vGrandDisc, vDiscTransisi,
    vNett, vGrantNett, vNettTransisi : Double;
    function NeoLoadData(AOfferSeq:integer): Boolean;
    procedure SetFooterBand;
    procedure SetColumHeaderAll(AType:string);
    {yg dipake dibawah}
    procedure SetDetailAll(ANomor:integer;ANama,ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string;
              aItemId,aServiceParent:integer;aShipType:string);

    procedure SetEmpty(AType:string);
    procedure SetFooter(AType:string;ATotal,ADisc,ANett:Double;AShowShape:Boolean=True);
  public
    procedure Executes(AServiceSeq:integer);
  end;

var
  qrpNotaServiceObject: TqrpNotaServiceObject;

implementation

uses SQLServerConnections, un_ryu, UConst;

const TOTAL_ROW = 40;
      ROW_BARU  = 48;
      BATAS_EMPTY = 1;//4; 1
{$R *.DFM}

{ TqrpRekapPO }

procedure TqrpNotaServiceObject.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  gNoUrut := 0;
  vTotal := 0; vDisc := 0; vNett := 0;
  vGrantTotal := 0; vGrandDisc:=0; vGrantNett:=0;
  vTotalTransisi := 0;vDiscTransisi:=0; vNettTransisi:=0;
  vRealRow :=  0;
  vCounterKosong :=1;
  vPosisiRecord := 0;
  adoMaster.First;
  vRow := 0;
  vTipe := '';
  vDP := 0;
end;

procedure TqrpNotaServiceObject.QRDBText14Print(sender: TObject; var Value: String);
begin
  if Value <> '' then
    gNoUrut := gNoUrut + 1;
    Value := IntToStr(gNoUrut);
end;

function TqrpNotaServiceObject.NeoLoadData(AOfferSeq:integer): Boolean;
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
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.service_detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Services v ON v.Service_id = d.service_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON P.motor_id = m.motor_id '+
           ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' +
          ' UNION '+
          'SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date, '+
          ' S.Person_id, P.Person_name, P.address,p.city, P.Phone1,S.total,   S.Notes, '+
          ' b.item_id, i.item_code, i.item_name, d.quantity, d.price as price_tampil,'+
          ' d.Amount, ''B'' as tipe, item_detail_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code,'+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.Item_Detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
           '  dbo.Items i ON b.item_id = i.item_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON P.motor_id = m.motor_id '+
           ' WHERE     (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' +
           //blok dummy
           ' UNION '+
           '   SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date,'+
          ' S.Person_id, P.person_name, P.address,p.city, P.Phone1,S.total,  S.Notes,'+
          ' v.service_id as item_id, v.service_code as item_code, v.service_name as item_name, d.quantity, d.price as price_tampil, '+
          ' d.Amount, ''A'' as tipe,dump_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code, '+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.dummy_item_detail d ON s.ship_id = d.ship_id INNER JOIN '+
           '  dbo.Services v ON v.Service_id = d.service_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON P.motor_id = m.motor_id '+
           ' WHERE d.item_id IS NULL AND    (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' +
          ' UNION '+
          'SELECT S.Ship_id, S.Ship_Num, S.Ship_Type, S.User_insert, S.Ship_Date, '+
          ' S.Person_id, P.Person_name, P.address,p.city, P.Phone1,S.total,   S.Notes, '+
          ' d.item_id, i.item_code, i.item_name, d.quantity, d.price as price_tampil,'+
          ' d.Amount, ''B'' as tipe, dump_id as detail_seq,dbo.get_mekanik(s.mekanik_id) as mekanik,p.Person_code,'+
          ' m.motor_name, p.mtr_year, p.mtr_rangka, p.mtr_mesin, d.discount, s.discount as disc_faktur, s.subtotal '+
          ' ,d.service_parent, s.ship_service_type, s.down_payment,s.is_post,s.expr_Date '+
           ' FROM dbo.Shipment s INNER JOIN '+
           '  dbo.Persons P ON s.person_id = P.person_id INNER JOIN '+
           '  dbo.DUmmy_Item_Detail d ON s.ship_id = d.ship_id INNER JOIN '+
       //   '  dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
           '  dbo.Items i ON d.item_id = i.item_id LEFT OUTER JOIN '+
           '  dbo.Motor m ON P.motor_id = m.motor_id '+
           ' WHERE  d.service_id IS NULL AND   (s.ship_id = '+FormatSQLNumber(AOfferSeq)+')' ;


  Sql := Sql + ' Order By s.ship_id,ship_date,tipe, detail_seq ';
  adoMaster.Connection := myConnection.ADOConnection;
  adoMaster.Close;
  adoMaster.SQL.Clear;
  adoMaster.SQL.Text := Sql;
  adoMaster.Open;
  vTotalRecord := adoMaster.RecordCount;
  vTampungan := vTotalRecord + 5;
  Result := adoMaster.RecordCount <> 0;
  ReportTitle := 'Nota Service';
  qrlNetto.Caption := IfThen(adoMasteris_post.Value=TRUE_VALUE,'Netto','Sisa');
end;

procedure TqrpNotaServiceObject.QRDBText9Print(sender: TObject; var Value: String);
begin
  Value := Value + ' Hari';
end;


procedure TqrpNotaServiceObject.SetFooterBand;
begin
  qrlSUmDp.Caption   := FloatToStrFmt2(adoMasterdown_payment.Value);
  qrSumTotal.Caption := FloatToStrFmt2(vGrantNett);//19.04.07 vGrantTotal);//adoMastersubtotal.Value); //
  qrlSumDisc.Caption := FloatToStrFmt2(adoMasterdisc_faktur.Value);//19.04.07 --hanya diskon faktur saja + vGrandDisc);
  qrlSumNet.Caption := FloatToStrFmt2(vGrantNett - adoMasterdown_payment.Value - adoMasterdisc_faktur.Value);//adoMastertotal.Value);
end;

procedure TqrpNotaServiceObject.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  SetFooterBand;
end;

procedure TqrpNotaServiceObject.Executes(AServiceSeq:integer);
var vCompany : TCompanyProfile;
begin
  //qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  vCompany := TCompanyProfile.Create;
  vCompany.SelectInDB;
  qrlCompany.Caption := vCompany.CompanyName;
  qrlMoto.Caption    := vCompany.Branch;
  qrlAddress.Caption := vCompany.Address +' '+vCompany.City+' Telp. '+ vCompany.Telp1+
                        ' Fax. '+vCompany.Fax;
  qrMemoInfo.Lines.Text := 'Info : '+vCompany.Info;//
  if NeoLoadData(AServiceSeq) then
    PreviewModal
  else
    Inform(MSG_NO_DATA_FOUND);

  vCompany.Free;
end;

procedure TqrpNotaServiceObject.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
var vAkhirPage,vAwalPage:integer;
begin
  MoreData := vPosisiRecord < vTampungan;
  if MoreData then begin
    qrlRow.Caption := IntToStr(vRow+1);
    qrlRealRow.Caption := IntToStr(vRealRow+1);
    if vTipe <> adoMastertipe.Value then begin
      if vTotal > 0 then begin
        SetFooter(adoMastertipe.Value,vTotal,vDisc,vNett);
      end
     { else  if vCounterKosong < BATAS_EMPTY then begin
        SetEmpty('');
        Inc(vCounterKosong);
      end}
      else begin
        vCounterKosong := 0;
        SetColumHeaderAll(adoMastertipe.Value);
        vTipe := adoMastertipe.Value;
        gNoUrut := 0;
      END;
    end
    else begin //jika tipeAktif = posisi tipe pada dsMaster
      //jika posisi record = jumlah data  atau posisi row = jumlah row ketentuan per page
      //maka akhiri saja pagenya dengan footer,
      vAkhirPage := (TOTAL_ROW * Self.Printer.PageNumber + ((3*) * (Self.Printer.PageNumber-1)));//chan 21.04.07(3 * (Self.Printer.PageNumber-1)));
      if (vPosisiRecord = adoMaster.RecordCount) OR (vRow = TOTAL_ROW) or
        (vRealRow = vAkhirPage ) then begin
        SetFooter(adoMastertipe.Value,vTotal,vDisc,vNett);
        if (vRow = TOTAL_ROW) or (vRealRow = vAkhirPage) then begin
          vRow := -1; //reset posisi row ke -1
        end
        else //agar menghentikan posisi record biar tdk ngeprint detail lagi coz datasetnya dah abis
           vPosisiRecord := vPosisiRecord + (vTampungan- vPosisiRecord);
      end
      else if vPosisiRecord > adoMaster.RecordCount then begin //jika posisi record melebihi record data master
        SetEmpty(adoMastertipe.Value);
        Inc(vPosisiRecord);
      end
      else if vRow <= 0 then begin
        SetEmpty(adoMastertipe.Value);
        if vCounterKosong < BATAS_EMPTY then begin
          SetEmpty('');
          Inc(vCounterKosong);
        end
        else begin  //jika counter sudah >=4
          vAwalPage := (TOTAL_ROW * (Self.Printer.PageNumber-1) + (4 * (Self.Printer.PageNumber)) -
                (Self.Printer.PageNumber-1));
          if (vRealRow = vAwalPage) THEN begin //(ROW_BARU * (Printer.PageNumber-1)))   then begin
            SetColumHeaderAll(adoMastertipe.Value);
//          if (vRealRow = (ROW_BARU * (Printer.PageNumber-1))) then
            if vTotalTransisi <= 0 then begin
              vRow := 1;
              vCounterKosong := 0;
            end;
          end
          else if (vRealRow = vAwalPage+1) then begin // ((ROW_BARU * (Printer.PageNumber-1))+1))  then begin
            if vTotalTransisi <= 0 then begin
              vRow := 1;
              vCounterKosong := 0;
            end
            else begin
               SetDetailAll(0,'Total Sebelumnya ','',0,0,vTotalTransisi,0,adoMastertipe.Value,0,0,'');

               vRow := 1;
               vCounterKosong := 0;
            end;
          end;
        end;//jika counter sudah >= 5
      end
      else begin
        Inc(gNoUrut);
         if (adoMastership_service_type.Value = SHIP_SERVICE_TYPE_KSG) and
            (adoMasterservice_parent.Value>0) then begin

         end
         else begin                     //19.04.07  total sebelum disc  adoMasterAmount.Value
           vTotal := vTotal + (adoMasterquantity.Value * adoMasterprice_tampil.Value) + vTotalTransisi;
           vDisc  := vDisc + adoMasterdiscount.Value + vDiscTransisi;
           vNett  := vNett + (adoMasterAmount.Value{ - adoMasterdiscount.Value}) + vNettTransisi;
         end;

        SetDetailAll(gNoUrut, adoMasteritem_name.Value,adoMasteritem_code.Value,adoMasterquantity.Value,
                adoMasterprice_tampil.Value,adoMasterAmount.Value,adoMasterdiscount.Value,adoMastertipe.Value,
                adoMasterItem_Id.Value,adoMasterService_Parent.Value,adoMastership_service_type.Value);

        vTotalTransisi := 0;
        vDiscTransisi := 0;
        vNettTransisi := 0;
        Inc(vPosisiRecord);
        adoMaster.Next;
      end;
    end;
    if vRow >= 0 then
      Inc(vRow);
    Inc(vRealRow);
  end;

end;

procedure TqrpNotaServiceObject.SetEmpty(AType:string);
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
end;

procedure TqrpNotaServiceObject.SetFooter(AType:string;ATotal,ADisc,ANett:Double;AShowShape:Boolean);
begin
  qrlNomor.Font.Style    := [fsBold];
  qrlQty.Font.Style      := [fsBold];
  qrlPrice.Font.Style    := [fsBold];
  qrlAMount.Font.Style   := [fsBold];
  qrlNama.Font.Style     := [fsBold];
  qrlNett.Font.Style     := [fsBold];
  qrlDisc.Font.Style     := [fsBold];
  qrlCode.Font.Style     := [fsBold];

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := False;
  qrShapeKiriQty.Enabled      := False;
  qrShapeKiriPrice.Enabled    := False;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;
  qrShapeTopBottom.Enabled    := AShowShape;}

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
  qrlQty.Caption    := 'Total ';//+IfThen(AType='A','Jasa','Part');
  qrlAMount.Caption   := FloatToStrFmt2(ATotal);
  qrlDisc.Caption   := FloatToStrFmt2(ADisc);
  qrlNett.Caption   := FloatToStrFmt2(ANett);

  if (adoMastertipe.Value = AType) and (vRow = TOTAL_ROW) or
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

procedure TqrpNotaServiceObject.SetColumHeaderAll(AType: string);
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

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := True;
  qrShapeKiriQty.Enabled      := True;
  qrShapeKiriPrice.Enabled    := True;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;}
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
  else if AType = 'A' then begin //JASA
    qrlNama.Caption := 'Jenis Service';
    qrlCode.Caption    := 'Kode Service';
  end
  else begin //BIAYA
    qrlNama.Caption := 'Nama Biaya';
    qrlQty.Caption  := 'Tgl.Awal';
    qrlPrice.Caption:= 'Tgl.Akhir';
  end;
end;

procedure TqrpNotaServiceObject.SetDetailAll(ANomor:integer;ANama,ACode:string;AQty,APrice,AAMount,ADisc:real;AType:string;
              aItemId,aServiceParent:integer;aShipType:string);
begin
  qrlNomor.Font.Style  := [];
  qrlQty.Font.Style    := [];
  qrlPrice.Font.Style  := [];
  qrlAMount.Font.Style := [];
  qrlNama.Font.Style   := [];
  qrlCode.Font.Style   := [];
  qrlNett.Font.Style   := [];
  qrlDisc.Font.Style   := [];

  {qrShapeKiriNomor.Enabled    := True;
  qrShapeKiriNama.Enabled     := True;
  qrShapeKiriQty.Enabled      := True;
  qrShapeKiriPrice.Enabled    := True;
  qrShapeKiriAMount.Enabled   := True;
  qrShapeKananAmount.Enabled  := True;
  qrShapeKiriCode.Enabled     := True;
  qrShapeKiriNett.Enabled     := True;
  qrShapeKiriDisc.Enabled     := True;}
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

  qrlNomor.Caption  := IfThen(ANomor=0,'',IntToStr(ANomor));
  qrlCode.Caption   := ACode;
  qrlNama.Caption   := ANama;
  qrlQty.Caption    := IfThen(ANomor=0,'',FloatToStrFmt2(AQty));
  qrlPrice.Caption  := IfThen(ANomor=0,'',FloatToStrFmt2(APrice));
  if (aShipType = SHIP_SERVICE_TYPE_KSG) and (aServiceParent>0) then begin
    //TServicePackage.get
    qrlAMount.Caption := TServicePackage.getNotes(aItemId,aServiceParent,AType='A');
    qrlDisc.Caption   := FloatToStrFmt2(0);
    qrlNett.Caption   := FloatToStrFmt2(0);
  end  
  else begin
    qrlAMount.Caption := FloatToStrFmt2(AQty * APrice);//AAMount);
    qrlDisc.Caption   := IfThen(ANomor=0,'',FloatToStrFmt2(ADisc));
    qrlNett.Caption   := IfThen(ANomor=0,'',FloatToStrFmt2(AAMount));//-ADisc));
  end;

end;

end.
