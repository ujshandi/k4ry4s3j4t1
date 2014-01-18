unit ServiceGlobalPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpServiceGlobal = class(TQuickRep)
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
    qrl5: TQRLabel;
    qrl6: TQRLabel;
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
  qrpServiceGlobal: TqrpServiceGlobal;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, UMaster,
  Subroutines;
const
   colgJenis = 1;
      colgBruto = 2;
      colgDisc = 3;
      colgPiutang = 4;
      colgPiutang2 = 5;
      colgPiutang3 = 6;
      colgNett = 7;


{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpServiceGlobal.Executes(AGrid: TAdvStringGrid;APurpose:string);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
 // MasterGrid.ExpandAll;
  qrlTitle.Caption := IfThen(Apurpose=SHIP_TYPE_SALES,'Global Sales','Global Service');
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpServiceGlobal.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;


procedure TqrpServiceGlobal.setDetailItem(ARow: integer);
begin
  qrl1.Caption := MasterGrid.StrippedCells[colgBruto,aRow];
  qrl2.Caption := MasterGrid.StrippedCells[colgDisc,aRow];
  qrl3.Caption := MasterGrid.StrippedCells[colgPiutang,aRow];
  qrl4.Caption := MasterGrid.StrippedCells[colgPiutang2,aRow];
  qrl5.Caption := MasterGrid.StrippedCells[colgPiutang3,aRow];
  qrl6.Caption := MasterGrid.StrippedCells[colgNett,aRow];

  if ARow in [MasterGrid.RowCount-1,MasterGrid.RowCount-2,MasterGrid.RowCount-3] then begin
    qrl0.Caption := MasterGrid.StrippedCells[colgJenis,aRow];
    if ARow = MasterGrid.RowCount-1 then begin
      qrl1.Caption := '';
      qrl2.Caption := '';
    end;
    qrl0.Font.Style := [fsBold];
    qrl1.Font.Style := [fsBold];
    qrl2.Font.Style := [fsBold];
    qrl3.Font.Style := [fsBold];
    qrl4.Font.Style := [fsBold];
    qrl5.Font.Style := [fsBold];
    qrl6.Font.Style := [fsBold];
  end
  else begin
    qrl0.Font.Style := [];
    qrl1.Font.Style := [];
    qrl2.Font.Style := [];
    qrl3.Font.Style := [];
    qrl4.Font.Style := [];
    qrl5.Font.Style := [];
    qrl6.Font.Style := [];
    qrl0.Caption := MasterGrid.StrippedCells[colgJenis,aRow];
  end;



  qrl0.Alignment := taCenter;
  qrl1.Alignment := taRightJustify;
  qrl2.Alignment := taRightJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;
  qrl5.Alignment := taRightJustify;
  qrl6.Alignment := taRightJustify;

end;

procedure TqrpServiceGlobal.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount;
  if MoreData then begin
      setDetailItem(i);
      Inc(i)
  END;
end;


end.
