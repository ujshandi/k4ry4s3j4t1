unit StokRekaplPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpStokRekap = class(TQuickRep)
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
    qrl5: TQRLabel;
    qrl6: TQRLabel;
    qrl7: TQRLabel;
    qrl8: TQRLabel;
    qrl0: TQRLabel;
    qrlSumTMasuk: TQRLabel;
    qrlSumTKeluar: TQRLabel;
    qrlSumSAkhir: TQRLabel;
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
  qrpStokRekap: TqrpStokRekap;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, UMaster,
  Subroutines;
const

  colrNo = 0;
  colrCode = 1;     //colrDate = 1;
  colrName = 2;     //colrPrice = 2;
  colrUnit = 3;
  colrLimit = 4;
  colrBalance = 5;
  colrMasuk = 6;
  colrKeluar = 7;
  colrSakhir = 8;
  colrItemId = 9;
//

{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpStokRekap.Executes(AGrid: TAdvStringGrid);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
  qrlTitle.Caption := 'Laporan Rekap Stok';//IfThen(Apurpose=SHIP_TYPE_SALES,'Global Sales','Global Service');
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpStokRekap.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;


procedure TqrpStokRekap.setDetailItem(ARow: integer);
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

  qrl0.Caption := MasterGrid.Cells[colrNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colrCode,aRow];
  qrl2.Caption := MasterGrid.Cells[colrName,aRow];
  qrl3.Caption := MasterGrid.Cells[colrUnit,aRow];
  qrl4.Caption := MasterGrid.Cells[colrLimit,aRow];
  qrl5.Caption := MasterGrid.Cells[colrBalance,aRow];
  qrl6.Caption := MasterGrid.Cells[colrMasuk,aRow];
  qrl7.Caption := MasterGrid.Cells[colrKeluar,aRow];
  qrl8.Caption := MasterGrid.Cells[colrSAkhir,aRow];

end;

procedure TqrpStokRekap.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount-1;
  if MoreData then begin
      setDetailItem(i);
      Inc(i)
  END;
end;


procedure TqrpStokRekap.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlSumAwal.Caption := MasterGrid.Cells[colrBalance,MasterGrid.rowcount-1];
  qrlSumTMasuk.Caption := MasterGrid.Cells[colrMasuk,MasterGrid.rowcount-1];
  qrlSumTKeluar.Caption := MasterGrid.Cells[colrKeluar,MasterGrid.rowcount-1];
  qrlSumSAkhir.Caption := MasterGrid.Cells[colrSAkhir,MasterGrid.rowcount-1];

end;

end.
