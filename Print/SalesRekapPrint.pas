unit SalesRekapPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpSalesRekap = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    adoqMaster: TADOQuery;
    QRDBText3: TQRDBText;
    dsMaster: TDataSource;
    adoqDetail: TADOQuery;
    adoqMastership_date: TDateTimeField;
    adoqMastership_num: TStringField;
    adoqMasterperson_id: TLargeintField;
    adoqMasterperson_name: TStringField;
    adoqMastership_id: TLargeintField;
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRSysData2: TQRSysData;
    QRBand1: TQRBand;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    adqService: TADOQuery;
    shapeHeader: TQRShape;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    qrNoSUbDetail: TQRExpr;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i,j:integer;
     vDetail : TItemDetail_Arr;
     needDetail, needHeader : boolean;
     procedure setDetailHeader;
     procedure setDetailItem(ARow:integer);
     procedure setDetailTrans(AIndex:integer);

  public
     procedure Executes(AGrid:TAdvStringGrid);
     procedure ExecutQuery(AFilter:TShipment;APostCriteria:boolean);

  end;

var
  qrpSalesRekap: TqrpSalesRekap;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, Subroutines,
  UMaster;
const
  colNo =0;
  colNum = 1;
  colDate = 2;
  colSupplier = 3;
  colNotes = 4;
  colOperator = 5;
  colSeq = 6;

 colCode = 1;
 colName = 2;
 colQty = 3;
 colPrice = 4;
 colAmount = 5;


{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpSalesRekap.Executes(AGrid: TAdvStringGrid);
begin
  vDetail := TItemDetail_Arr.Create;
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
  vDetail.Free;
end;

procedure TqrpSalesRekap.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1; needDetail := False;
   needHeader := False;
end;

procedure TqrpSalesRekap.setDetailHeader;
begin

  shapeHeader.Enabled := True;
  qrl1.Caption := 'Kode Part';
  qrl2.Caption := 'Nama Part';
  qrl3.Caption := 'Qty';
  qrl4.Caption := 'Harga';

  qrl1.Alignment := taCenter;
  qrl2.Alignment := taCenter;
  qrl3.Alignment := taCenter;
  qrl4.Alignment := taCenter;

  qrl1.Font.Style := [fsBold];
  qrl2.Font.Style := [fsBold];
  qrl3.Font.Style := [fsBold];
  qrl4.Font.Style := [fsBold];
end;

procedure TqrpSalesRekap.setDetailItem(ARow: integer);
begin
  shapeHeader.Enabled := True;
//  qrl0.Caption := MasterGrid.Cells[colNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colDate,aRow];
  qrl2.Caption := MasterGrid.Cells[colNum,aRow];
  qrl3.Caption := MasterGrid.Cells[colSupplier,aRow];
  qrl4.Caption := '';//MasterGrid.Cells[colPrice,aRow];

  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taLeftJustify;
  qrl4.Alignment := taRightJustify;

  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
end;

procedure TqrpSalesRekap.setDetailTrans(AIndex: integer);
begin
//  shapeHeader.Enabled := False;
  shapeHeader.Enabled  := True;
  //qrl0.Caption := '';
  qrl1.Caption := vDetail[j].ItemBalance.Items.ItemCode;
  qrl2.Caption := vDetail[j].ItemBalance.Items.ItemName;
  qrl3.Caption := FloatToStrFmt2(vDetail[j].Quantity);
  qrl4.Caption := FloatToStrFmt2(vDetail[j].Price);

  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;

  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
end;

procedure TqrpSalesRekap.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  {MoreData := i < MasterGrid.RowCount;
  if not MoreData then
    MoreData :=  j < vDetail.Count;
  if MoreData and (not needDetail) then begin
      setDetailItem(i);
      needHeader := True;
      setDetailHeader;
      j:= 0;
      vDetail.Clear;
      needDetail := vDetail.FindOnDB(Mastergrid.Ints[colSeq,i]);
      Inc(i)
  END
  else if needHeader then begin
      setDetailHeader;
      needHeader := False;
  end
  else if needDetail and MoreData then begin
    setDetailTrans(j);
    inc(j);
  end;}
end;

procedure TqrpSalesRekap.ExecutQuery(AFilter:TShipment;APostCriteria:boolean);
var vSQL,vFilter,vSQLdmp : string;
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  vSQL := 'Select ship_date, ship_num, s.person_id, p.person_name, ship_id '+
          ' from shipment s left join persons p on p.person_id = s.person_id '+
        ' where ship_type = '+FormatSQLString(SHIP_TYPE_SALES);
  vFilter := '';
  if APostCriteria then
    vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(AFilter.IsPost);

  if (AFilter.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(AFilter.ShipServiceType);

  if AFilter.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(AFilter.Persons.PersonId);
  if AFilter.Persons.PersonCode <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
          FormatSQLWildCard(AFilter.Persons.PersonCode+'%') +') ';
  if AFilter.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(AFilter.PersonsMekanik_Id.PersonId);

  if AFilter.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(AFilter.Warehouse.WhId);
  if AFilter.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(AFilter.WhIdOut);

  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND s.ship_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND s.ship_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if vFilter <> '' then
    vSQL := vSQL + vFilter;
  with adoqMaster do begin
    Close;
    SQL.Clear;
    SQL.Text := vSQL;
    Connection := MyConnection.ADOConnection;
    Open;
  end;
  dsMaster.DataSet := adoqMaster;
  vSQLdmp := '';
  vSQL := 'Select DISTINCT i.item_code, i.item_name, d.quantity, d.price, d.amount '+
        ' FROM items i, item_detail d, item_balance b '+
        ' WHERE i.item_id = b.item_id and b.item_balance_id = d.item_balance_id '+
        ' AND d.ship_id =  :ship_id ';
//  vFilter := vFilter + ' and d.ship_id = :ship_id ';
  vSQLdmp := 'Select DISTINCT i.item_code, i.item_name, d.quantity, d.price, d.amount '+
        ' FROM items i, dummy_item_detail d, shipment s '+
        ' WHERE i.item_id = d.item_id '+
        ' AND d.ship_id  = s.ship_id ';
//        ' and d.ship_id = :ship_id ';

 { if APostCriteria then begin
    if AFilter.IsPost then
       vSQL := vSQL + vFilter
    else
       vSQL := vSQLdmp + vFilter;
  end
  else
    vSQL := vSQL+ ' UNION '+vSQLdmp + vFilter;}

  with adoqDetail do begin
    Close;
    DataSource := dsMaster;
    SQL.Clear;
    SQL.Text := vSQL;
    Connection := MyConnection.ADOConnection;
    Parameters.AddParameter.Name := 'ship_id';
    Parameters.ParamByName('ship_id').Value := adoqMastership_id.Value;
    Prepared;
    Open;
  end;

  vSQL := 'Select s.service_code, s.service_name, d.quantity, d.price, d.amount ' +
          ' FROM services s, service_detail d '+
          ' WHERE s.service_id = d.service_id '+
          ' and d.ship_id = :ship_id ';
  vSQL := vSQL + ' ORDER by i.item_code ';        
  vSQLdmp := 'Select s.service_code, s.service_name, d.quantity, d.price, d.amount ' +
          ' FROM services s, dummy_item_detail d '+
          ' WHERE s.service_id = d.service_id '+
          ' and d.ship_id = :ship_id ';
  vSQLdmp := vSQLdmp + ' ORDER by s.service_code ';         
  if APostCriteria then begin
    if AFilter.IsPost then
       vSQL := vSQL
    else
       vSQL := vSQLdmp;
  end
  else
    vSQL := vSQL + ' UNION '+vSQLdmp;

  with adqService do begin
    Close;
    DataSource := dsMaster;
    SQL.Clear;
    SQL.Text := vSQL;
    Connection := MyConnection.ADOConnection;
    //Parameters.AddParameter.Name := 'ship_id';
    //Parameters.ParamByName('ship_id').Value := adoqMastership_id.Value;
    //Prepared;
   // Open;
  end;
  ReportTitle := 'Rekap Sales';
  PreviewModal;
end;

procedure TqrpSalesRekap.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   qrNoSUbDetail.Reset;
end;

end.
