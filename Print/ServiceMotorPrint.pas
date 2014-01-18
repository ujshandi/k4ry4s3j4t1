unit ServiceMotorPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpServiceMotor = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrl1: TQRLabel;
    qrl2: TQRLabel;
    qrl3: TQRLabel;
    qrl4: TQRLabel;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    qrl0: TQRLabel;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure setDetailItem(ARow:integer);

  public
     procedure Executes(AGrid:TAdvStringGrid;Apurpose:string);

  end;

var
  qrpServiceMotor: TqrpServiceMotor;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, Subroutines,
  UMaster;
const
      coluCode = 1;
      coluMotor = 2;
      coluTahun = 3;
      coluQty  = 4;
      coluTotal = 5;
      coluId = 6;


{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpServiceMotor.Executes(AGrid: TAdvStringGrid;APurpose:string);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
 // MasterGrid.ExpandAll;
  qrlTitle.Caption := 'Global Service Per Motor';
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpServiceMotor.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1; 
end;


procedure TqrpServiceMotor.setDetailItem(ARow: integer);
begin
  if ARow = MasterGrid.RowCount-1 then begin
    qrl0.Caption := 'Total';//MasterGrid.StrippedCells[colgJenis,aRow];
    qrl0.Font.Style := [fsBold];
    qrl1.Font.Style := [fsBold];
    qrl2.Font.Style := [fsBold];
    qrl3.Font.Style := [fsBold];
    qrl4.Font.Style := [fsBold];
  end
  else begin
    qrl0.Font.Style := [];
    qrl1.Font.Style := [];
    qrl2.Font.Style := [];
    qrl3.Font.Style := [];
    qrl4.Font.Style := [];
    qrl0.Caption := MasterGrid.Cells[coluCode,aRow];
  end;
  
  qrl1.Caption := MasterGrid.Cells[coluMotor,aRow];
  qrl2.Caption := MasterGrid.Cells[coluTahun,aRow];
  qrl3.Caption := MasterGrid.Cells[coluQty,aRow];
  qrl4.Caption := MasterGrid.Cells[coluTotal,aRow];

  qrl0.Alignment := taCenter;
  qrl1.Alignment := taRightJustify;
  qrl2.Alignment := taRightJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;


end;

procedure TqrpServiceMotor.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount;
  if MoreData then begin
      setDetailItem(i);
      Inc(i)
  END;
end;


end.
