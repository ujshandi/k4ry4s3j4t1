unit StokGlobalPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpStokGlobal = class(TQuickRep)
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
    qrlSum: TQRLabel;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    qrl4: TQRLabel;
    qrl5: TQRLabel;
    qrlSumPers: TQRLabel;
    qrlNo: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure setDetailItem(ARow:integer);

  public
     procedure Executes(AGrid:TAdvStringGrid);

  end;

var
  qrpStokGlobal: TqrpStokGlobal;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, UMaster,
  Subroutines;
const
   {UNTUK in_global}
  colgCode = 1;
  colgName = 2;
  colgStok = 3;
  colgPrice= 4;
  colgPersediaan = 5;
{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpStokGlobal.Executes(AGrid: TAdvStringGrid);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
  qrlTitle.Caption := 'Laporan Global ';//IfThen(Apurpose=SHIP_TYPE_SALES,'Global Sales','Global Service');
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpStokGlobal.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;


procedure TqrpStokGlobal.setDetailItem(ARow: integer);
begin
{  if ARow = MasterGrid.RowCount-1 then begin
    qrl1.Font.Style := [fsBold];
    qrl2.Font.Style := [fsBold];
    qrl3.Font.Style := [fsBold];
  end
  else begin
    qrl1.Font.Style := [];
    qrl2.Font.Style := [];
    qrl3.Font.Style := [];
  end;      }
  qrlNo.Caption := MasterGrid.Cells[0,aRow];
  qrl1.Caption := MasterGrid.Cells[colgCode,aRow];
  qrl2.Caption := MasterGrid.Cells[colgName,aRow];
  qrl3.Caption := MasterGrid.Cells[colgStok,aRow];
  qrl4.Caption := MasterGrid.Cells[colgPrice,aRow];
  qrl5.Caption := MasterGrid.Cells[colgPersediaan,aRow];

end;

procedure TqrpStokGlobal.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount-1;
  if MoreData then begin
      setDetailItem(i);
      Inc(i)
  END;
end;


procedure TqrpStokGlobal.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlSum.Caption := MasterGrid.Cells[colgStok,MasterGrid.rowcount-1];
  qrlSumPers.Caption := MasterGrid.Cells[colgPersediaan,MasterGrid.rowcount-1];
end;

end.
