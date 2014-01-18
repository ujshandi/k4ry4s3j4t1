unit KartuStokPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid;

type
  TqrpKartuStok = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrl0: TQRLabel;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    qrl5: TQRLabel;
    qrl6: TQRLabel;
    shapeHeader: TQRShape;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    qrlSAwal: TQRLabel;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    ShapeKiriNoTrans: TQRShape;
    ShapeKiriMasuk: TQRShape;
    ShapeKiriKeluar: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure setDetailHeader;
     procedure setDetailItem(ARow:integer);
     procedure setDetailStok(ARow:integer);

  public
     procedure Executes(AGrid:TAdvStringGrid);

  end;

var
  qrpKartuStok: TqrpKartuStok;

implementation

uses UMaster, un_ryu, Subroutines;
const
  colNo = 0;
  colCode = 1;      colDate = 1;
  colName = 2;      colTrans = 2;
  colUNit = 3;      colSAwal = 3;
  colLimit= 4;      colQtyIn   = 4;
  colConversion=5;  colQtyOut = 5;
                    ColSaldo = 6;
                    colNotes = 7;
  colItemId = 8; 
  colTransId = 9;
  

{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpKartuStok.Executes(AGrid: TAdvStringGrid);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpKartuStok.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;

procedure TqrpKartuStok.setDetailHeader;
begin
  shapeHeader.Enabled := True;
  ShapeKiriMasuk.Enabled  := True;
  ShapeKiriKeluar.Enabled  := True;
  ShapeKiriNoTrans.Enabled := True;
  qrl3.Enabled := True;
  qrl3.Width := 70;
  qrl1.Width  := 85;
  qrlSAwal.Width  := 70;
  qrl0.Caption := '';
  qrl1.Caption := 'Tanggal';
  qrl2.Caption := 'No.Transaksi';
  qrl3.Caption := 'Qty.Masuk';
  qrl4.Caption := 'Qty.Keluar';
  qrl5.Caption := 'S.Akhir';
  qrl6.Caption := 'Keterangan';
  qrlSAwal.Caption := 'S.Awal';

  qrl1.Alignment := taCenter;
  qrl2.Alignment := taCenter;
  qrl3.Alignment := taCenter;
  qrl4.Alignment := taCenter;
  qrl5.Alignment := taCenter;
  qrl6.Alignment := taCenter;
  qrlSAwal.Alignment := taCenter;

  qrl1.Font.Style := [fsBold];
  qrl2.Font.Style := [fsBold];
  qrl3.Font.Style := [fsBold];
  qrl4.Font.Style := [fsBold];
  qrl5.Font.Style := [fsBold];
  qrl6.Font.Style := [fsBold];
  qrlSAwal.Font.Style := [fsBold];
end;

procedure TqrpKartuStok.setDetailItem(ARow: integer);
begin
  shapeHeader.Enabled := True;
  ShapeKiriMasuk.Enabled := False;
  ShapeKiriKeluar.Enabled  := False;
  ShapeKiriNoTrans.Enabled := False;
  qrl3.Enabled := False;
  qrlSAwal.Width := 220;
  qrl1.Width := 220;

  qrl0.Caption := MasterGrid.Cells[colNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colCode,aRow];
  qrl2.Caption := '';
  qrl3.Caption := '';
  qrlSAwal.Caption := MasterGrid.Cells[colName,aRow];
  qrl4.Caption := '';
  qrl5.Caption := MasterGrid.Cells[colUnit,aRow];
  qrl6.Caption := MasterGrid.Cells[colLimit,aRow];

  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taLeftJustify;
  qrlSAwal.Alignment := taLeftJustify;
  qrl4.Alignment := taCenter;
  qrl5.Alignment := taCenter;
  qrl6.Alignment := taRightJustify;

  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
  qrl5.Font.Style := [];
  qrl6.Font.Style := [];
  qrlSAwal.Font.Style := [];
end;

procedure TqrpKartuStok.setDetailStok(ARow: integer);
begin
  shapeHeader.Enabled := False;
  ShapeKiriMasuk.Enabled  := True;
  ShapeKiriKeluar.Enabled  := True;
  ShapeKiriNoTrans.Enabled := True;
  qrlSAwal.Enabled := True;
  qrl3.Enabled := True;
  qrlSAwal.Width := 70;
  
  qrl0.Caption := '';
  qrl1.Caption := MasterGrid.Cells[colDate,aRow];
  qrl2.Caption := MasterGrid.Cells[colTrans,aRow];
  qrl3.Caption := MasterGrid.Cells[colQtyIn,aRow];
  qrl4.Caption := MasterGrid.Cells[colQtyOut,aRow];
  qrl5.Caption := MasterGrid.Cells[colSaldo,aRow];
  qrl6.Caption := MasterGrid.Cells[colNotes,aRow];
  qrlSAwal.Caption := MasterGrid.Cells[colSAwal,aRow];

  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;
  qrl5.Alignment := taRightJustify;
  qrl6.Alignment := taLeftJustify;
  qrlSAwal.Alignment := taRightJustify;

  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
  qrl5.Font.Style := [];
  qrl6.Font.Style := [];
  qrlSAwal.Font.Style := [];
end;

procedure TqrpKartuStok.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount;
  if MoreData then begin
    if MasterGrid.IsNode(i) then
      setDetailItem(i)
    else if (MasterGrid.Cells[colItemId,i]='') and (MasterGrid.Cells[colTransId,i]='') then
      setDetailHeader
    else
      setDetailStok(i);

    inc(i);
  end;
end;

end.
