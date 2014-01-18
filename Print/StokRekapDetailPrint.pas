unit StokRekapDetailPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpStokRekapDetail = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    SummaryBand1: TQRBand;
    qrlSumAwal: TQRLabel;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    qrl4: TQRLabel;
    qrl0: TQRLabel;
    qrlDate: TQRLabel;
    qrlPrice: TQRLabel;
    qrlSTok: TQRLabel;
    qrlValue: TQRLabel;
    ShapeDate: TQRShape;
    ShapeStok: TQRShape;
    ShapeValue: TQRShape;
    ShapeName: TQRShape;
    ShapeUnit: TQRShape;
    ShapeHeader: TQRShape;
    ShapeDetail: TQRShape;
    qrlSumStok: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure setDetailItem(ARow:integer);
     procedure setDetailHeader(Arow:integer);
     procedure setDetailStok(ARow:integer);
     procedure setDefault;
  public
     procedure Executes(const AGrid:TAdvStringGrid);

  end;

var
  qrpStokRekapDetail: TqrpStokRekapDetail;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, UMaster,
  Subroutines;
const

  colzNo = 0;
  colzCode = 1;     colzDate = 1;
  colzName = 2;     colzPrice = 2;
  colzUnit = 3;     colzBalance = 3;
  colzLimit = 4;    colzValue = 4;
  colzItemId = 5;
  colzBalanceId=6;
//

{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpStokRekapDetail.Executes(const AGrid: TAdvStringGrid);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  qrlTitle.Caption := 'Laporan Rekap Stok(Detail)';//IfThen(Apurpose=SHIP_TYPE_SALES,'Global Sales','Global Service');
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpStokRekapDetail.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;


procedure TqrpStokRekapDetail.setDetailItem(ARow: integer);
begin

  ShapeDetail.Enabled := True;
  qrl4.Alignment := taRightJustify;
  qrl0.Caption := MasterGrid.Cells[colzNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colzCode,aRow];
  qrl2.Caption := MasterGrid.Cells[colzName,aRow];
  qrl3.Caption := MasterGrid.Cells[colzUnit,aRow];
  qrl4.Caption := MasterGrid.Cells[colzLimit,aRow];

end;

procedure TqrpStokRekapDetail.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount-1;
  if MoreData then begin
      setDefault;
      if MasterGrid.IsNode(i) then
        setDetailItem(i)
      else if (MasterGrid.Cells[colzItemId,i] =  '') and (MasterGrid.Cells[colzBalanceId,i]='') then
        setDetailHeader(i)
      else
        setDetailStok(i);
      Inc(i)
  END;
end;


procedure TqrpStokRekapDetail.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlSumAwal.Caption := MasterGrid.Cells[colzValue,MasterGrid.rowcount-1];
  qrlSumStok.Caption := MasterGrid.Cells[colzBalance,MasterGrid.rowcount-1];

end;

procedure TqrpStokRekapDetail.setDetailHeader(Arow: integer);
begin
  ShapeHeader.Enabled := True;
  ShapeDate.Enabled := True;
  ShapeStok.Enabled := True;
  ShapeValue.Enabled := True;
  ShapeName.Enabled := False;
  ShapeUnit.Enabled  := False;
  qrlDate.Alignment := taCenter;
  qrlPrice.Alignment := taCenter;
  qrlSTok.Alignment := taCenter;
  qrlValue.Alignment := taCenter;


  qrlDate.Caption := MasterGrid.Cells[colzDate,aRow];
  qrlPrice.Caption := MasterGrid.Cells[colzPrice,aRow];
  qrlSTok.Caption := MasterGrid.Cells[colzBalance,aRow];
  qrlValue.Caption := MasterGrid.Cells[colzValue,aRow];

  IF qrlPrice.Caption = 'Total' then begin
    qrlSTok.Alignment := taRightJustify;
    qrlValue.Alignment := taRightJustify;
  end;
end;

procedure TqrpStokRekapDetail.setDetailStok(ARow: integer);
begin

  ShapeDate.Enabled := True;
  ShapeStok.Enabled := True;
  ShapeValue.Enabled := True;
  ShapeName.Enabled := False;
  ShapeUnit.Enabled  := False;

  qrlDate.Alignment := taLeftJustify;
  qrlPrice.Alignment := taRightJustify;
  qrlSTok.Alignment := taRightJustify;
  qrlValue.Alignment := taRightJustify;

  qrlDate.Caption := MasterGrid.Cells[colzDate,aRow];
  qrlPrice.Caption := MasterGrid.Cells[colzPrice,aRow];
  qrlSTok.Caption := MasterGrid.Cells[colzBalance,aRow];
  qrlValue.Caption := MasterGrid.Cells[colzValue,aRow];
end;

procedure TqrpStokRekapDetail.setDefault;
begin
  ShapeDetail.Enabled := False;
  ShapeHeader.Enabled := False;
  ShapeDate.Enabled := False;
  ShapeStok.Enabled := False;
  ShapeValue.Enabled := False;
  ShapeName.Enabled := True;
  ShapeUnit.Enabled  := True;
  qrl0.Caption := '';
  qrl1.Caption := '';
  qrl2.Caption := '';
  qrl3.Caption := '';
  qrl4.Caption := '';

  qrlDate.Caption := '';
  qrlPrice.Caption := '';
  qrlSTok.Caption := '';
  qrlValue.Caption := '';

  qrl0.Alignment := taLeftJustify;
  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taLeftJustify;
  qrl4.Alignment := taLeftJustify;
  
end;

end.
