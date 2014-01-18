unit ServiceRekapPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpServiceRekap = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    shapeHeader: TQRShape;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    adoqMaster: TADOQuery;
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
    QRBand1: TQRBand;
    adqService: TADOQuery;
    QRSubDetail2: TQRSubDetail;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    BandFooterService: TQRBand;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr3: TQRExpr;
    adqServiceservice_code: TStringField;
    adqServiceservice_name: TStringField;
    adqServicequantity: TFloatField;
    adqServiceprice: TBCDField;
    adqServiceamount: TBCDField;
    adoqDetailitem_code: TStringField;
    adoqDetailitem_name: TStringField;
    adoqDetailquantity: TFloatField;
    adoqDetailprice: TBCDField;
    adoqDetailamount: TBCDField;
    adoqMastertotal: TBCDField;
    QRDBText3: TQRDBText;
    QRDBText16: TQRDBText;
    adoqMasternotes: TStringField;
    bandHeaderService: TQRBand;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    qrlGrandTotal: TQRLabel;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrlGrandTotalPrint(sender: TObject; var Value: String);
  private
     MasterGrid : TAdvStringGrid;
     i,j:integer;
     vDetail : TItemDetail_Arr;
     needDetail, needHeader : boolean;
     vGrandTotal : Double;
     procedure setDetailHeader;
     procedure setDetailItem(ARow:integer);
     procedure setDetailTrans(AIndex:integer);

  public
     procedure Executes(AGrid:TAdvStringGrid);
     procedure ExecutQuery(AFilter:TShipment;APostCriteria:boolean;aSHipType:string);

  end;

var
  qrpServiceRekap: TqrpServiceRekap;

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

procedure TqrpServiceRekap.Executes(AGrid: TAdvStringGrid);
begin
  vDetail := TItemDetail_Arr.Create;
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  PreviewModal;
  vDetail.Free;
end;

procedure TqrpServiceRekap.setDetailHeader;
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

procedure TqrpServiceRekap.setDetailItem(ARow: integer);
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

procedure TqrpServiceRekap.setDetailTrans(AIndex: integer);
begin
  shapeHeader.Enabled := False;
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

procedure TqrpServiceRekap.ExecutQuery(AFilter:TShipment;APostCriteria:boolean;aSHipType:string);
var vSQL,vFilter : string;
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  vSQL := 'Select ship_date, ship_num, s.person_id, p.person_name, ship_id, total, s.notes '+
          ' from shipment s left join persons p on p.person_id = s.person_id '+
        ' where ship_type = '+FormatSQLString(aSHipType);
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

  vSQL := 'Select s.service_code, s.service_name, d.quantity, d.price, d.amount ' +
          ' FROM services s, service_detail d '+
          ' WHERE s.service_id = d.service_id '+
          ' and d.ship_id = :ship_id ';
  vSQL := vSQL + ' ORDER by S.service_code ';
  with adqService do begin
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

  vSQL := 'Select i.item_code, i.item_name, d.quantity, d.price, d.amount '+
        ' FROM items i, item_detail d, item_balance b '+
        ' WHERE i.item_id = b.item_id and b.item_balance_id = d.item_balance_id '+
        ' and d.ship_id = :ship_id ';
  vSQL := vSQL + ' ORDER by i.item_code ';      
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

  qrlTitle.Caption := IfThen(aSHipType=SHIP_TYPE_RETUR_SERVICE,'Rekap Retur Service','Rekap Service');
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpServiceRekap.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  vGrandTotal := vGrandTotal + StrFmtToFloatDef(Value,0);
end;

procedure TqrpServiceRekap.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  vGrandTotal := 0;
end;

procedure TqrpServiceRekap.qrlGrandTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrFmt2(vGrandTotal);
end;

end.
