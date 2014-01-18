unit PendapatanMekanikItemPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpPendapatanMekanikItem = class(TQuickRep)
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
    Shape1: TQRShape;
    Shape2: TQRShape;
    Shape3: TQRShape;
    Shape4: TQRShape;
    Shape0: TQRShape;
    Shape5: TQRShape;
    qrlPeriod: TQRLabel;
    qrmCompany: TQRMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure setDetailItem(ARow:integer);
     procedure setMekanik(ARow:integer);
     procedure setHeader;
     procedure setEmpty;
  public
     procedure Executes(AGrid:TAdvStringGrid;Apurpose:string);

  end;

var
  qrpPendapatanMekanikItem: TqrpPendapatanMekanikItem;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, UMaster,
  Subroutines;
const
  colgJenis = 1;
  colgBruto = 2;
  colgDiskon = 3;
  colgPiutang = 4;
  colgNetto = 5;
  colID = 6;
  coldTransId = 7;


{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpPendapatanMekanikItem.Executes(AGrid: TAdvStringGrid;APurpose:string);
begin

  MasterGrid := AGrid;
 // MasterGrid.ExpandAll;
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  qrlTitle.Caption := IfThen(Apurpose=SHIP_TYPE_SALES,'Global Sales','Global Pendapatan Service Per Mekanik');
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpPendapatanMekanikItem.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;


procedure TqrpPendapatanMekanikItem.setDetailItem(ARow: integer);
begin
  qrl0.Width := 150;
  Shape1.Enabled := True;
  Shape2.Enabled := True;
  Shape3.Enabled := True;
  Shape4.Enabled := True;
  Shape5.Enabled := True;
  Shape0.Enabled := True;
  
  if ARow = MasterGrid.RowCount-1 then begin
    qrl0.Caption := MasterGrid.StrippedCells[colgJenis,aRow];
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
    qrl0.Caption := MasterGrid.Cells[colgJenis,aRow];
  end;

  qrl1.Caption := MasterGrid.Cells[colgBruto,aRow];
  qrl2.Caption := MasterGrid.Cells[colgDiskon,aRow];
  qrl3.Caption := MasterGrid.Cells[colgPiutang,aRow];
  qrl4.Caption := MasterGrid.Cells[colgNetto,aRow];

  qrl0.Alignment := taCenter;
  qrl1.Alignment := taRightJustify;
  qrl2.Alignment := taRightJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;


end;

procedure TqrpPendapatanMekanikItem.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount;
  if MoreData then begin
      if MasterGrid.Ints[colID,i] >0 then
        setMekanik(i)
      else if (MasterGrid.Ints[colID,i] = 0)and (MasterGrid.Ints[coldTransId,i] = 0) then begin
        if MasterGrid.Cells[colgJenis,i] = '' then
          setEmpty
        else
          setHeader;
      end
      else
        setDetailItem(i);
      Inc(i) ;
  END;
end;


procedure TqrpPendapatanMekanikItem.setMekanik(ARow: integer);
begin
  qrl0.Font.Style := [fsBold];
  qrl0.Alignment  := taLeftJustify;
  qrl0.Caption := '  '+MasterGrid.StrippedCells[colgJenis,arow];
  qrl0.Width := 500;
  qrl1.Caption := '';
  qrl2.Caption := '';
  qrl3.Caption := '';
  qrl4.Caption := '';
  Shape1.Enabled := False;
  Shape2.Enabled := False;
  Shape3.Enabled := False;
  Shape4.Enabled := False;
  Shape5.Enabled := True;
  Shape0.Enabled := True;
end;

procedure TqrpPendapatanMekanikItem.setHeader;
begin
  qrl0.Alignment := taCenter;
  qrl1.Alignment := taCenter;
  qrl2.Alignment := taCenter;
  qrl3.Alignment := taCenter;
  qrl4.Alignment := taCenter;

  qrl0.Width := 150;
  qrl0.Font.Style := [fsBold];
  qrl1.Font.Style := [fsBold];
  qrl2.Font.Style := [fsBold];
  qrl3.Font.Style := [fsBold];
  qrl4.Font.Style := [fsBold];

  qrl0.Caption := 'Jenis';
  qrl1.Caption := 'Bruto';
  qrl2.Caption := 'Diskon';
  qrl3.Caption := 'Piutang';
  qrl4.Caption := 'Total';
  Shape1.Enabled := True;
  Shape2.Enabled := True;
  Shape3.Enabled := True;
  Shape4.Enabled := True;
  Shape5.Enabled := True;
  Shape0.Enabled := True;
end;

procedure TqrpPendapatanMekanikItem.setEmpty;
begin
  qrl0.Caption := '';
  qrl1.Caption := '';
  qrl2.Caption := '';
  qrl3.Caption := '';
  qrl4.Caption := '';
  Shape1.Enabled := False;
  Shape2.Enabled := False;
  Shape3.Enabled := False;
  Shape4.Enabled := False;
  Shape5.Enabled := False;
  Shape0.Enabled := False;
end;

end.
