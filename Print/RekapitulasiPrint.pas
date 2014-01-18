unit RekapitulasiPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid,UTransaction, DB,
  ADODB;

type
  TqrpRekapitulasi = class(TQuickRep)
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
    qrl7: TQRLabel;
    qrl6: TQRLabel;
    qrl8: TQRLabel;
    qrl9: TQRLabel;
    ShapeHorizontal: TQRShape;
    qrl10: TQRLabel;
    qrl11: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure setDetailItem(ARow:integer);
     procedure setClear;
     procedure setHeader;
     procedure setDetail;
     procedure setFrameLable(AState:Boolean);
  public
     procedure Executes(AGrid:TAdvStringGrid;Apurpose:string);

  end;

var
  qrpRekapitulasi: TqrpRekapitulasi;

implementation

uses AutoBengkel, un_ryu, SQLServerConnections, UConst, UMaster,
  Subroutines;
const
    colpNo = 1;
    colpCode = 2;
    colpName = 3;
    colpPrice= 4;
    colpQty = 5;
    colpBruto = 6;
    colpDisc = 7;
    colpPiutang = 8;
    colpPiutang2 = 9;
    colpPiutang3 = 10;
    colpNetto = 11;
    colpTrans =12;


{$R *.DFM}

{ TqrpKartuStok }

procedure TqrpRekapitulasi.Executes(AGrid: TAdvStringGrid;APurpose:string);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  qrlTitle.Caption := IfThen(Apurpose=SHIP_TYPE_SALES,'Global Sales',IfThen(Apurpose=SHIP_TYPE_RETUR_SERVICE,'Rekapitulasi Retur Service', 'Rekapitulasi Service'));
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpRekapitulasi.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 1;
end;


procedure TqrpRekapitulasi.setDetailItem(ARow: integer);
begin
  setClear;
  if ARow = MasterGrid.RowCount-1 then begin
    qrl0.Caption := MasterGrid.StrippedCells[colpNo,aRow];
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
    //qrl0.Caption := MasterGrid.Cells[colpNo,aRow];
  end;

  if MasterGrid.IsNode(aRow) then begin
    qrl0.Width := 50;
    qrl0.Height := 14;
    qrl0.Caption := UpperCase(MasterGrid.StrippedCells[colpNo,aRow]);
    qrl0.Font.Style := [fsBold];
    qrl0.Font.Size := 8;
  end
  else begin
    qrl0.Height := 12;
    if MasterGrid.Cells[colpNo,ARow] = 'Item' then
      setHeader
    else
      setDetail;
    //qrl0.Font.Style := [];
    qrl0.Caption := '  '+MasterGrid.Cells[colpNo,aRow];
    qrl1.Caption := '  '+MasterGrid.Cells[colpCode,aRow];
    qrl2.Caption := '  '+MasterGrid.Cells[colpName,aRow];
    if (Trim(MasterGrid.StrippedCells[colpPrice,ARow]) = 'Sub Total') or
       (Trim(MasterGrid.StrippedCells[colpPrice,ARow]) = 'Grand Total')or
       (Trim(MasterGrid.StrippedCells[colpPrice,ARow]) = 'Discount Faktur') or
       (Trim(MasterGrid.StrippedCells[colpPrice,ARow]) = 'Nett Sales') then begin
       ShapeHorizontal.Enabled := True;
       qrl3.Caption := '  '+Trim(MasterGrid.StrippedCells[colpPrice,ARow]);
       qrl4.Caption := '';
    end
    else begin
      qrl3.Caption := '  '+MasterGrid.Cells[colpPrice,aRow];
      qrl4.Caption := '  '+MasterGrid.Cells[colpQty,aRow];
    end;

    qrl5.Caption := '  '+MasterGrid.Cells[colpBruto,aRow];
    qrl6.Caption := '  '+MasterGrid.Cells[colpDisc,aRow];
    qrl7.Caption := '  '+MasterGrid.Cells[colpPiutang,aRow];
    qrl8.Caption := '  '+MasterGrid.Cells[colpPiutang2,aRow];
    qrl9.Caption := '  '+MasterGrid.Cells[colpPiutang3,aRow];
    qrl10.Caption := '  '+MasterGrid.Cells[colpNetto,aRow];
    qrl11.Caption := '  '+MasterGrid.Cells[colpTrans,aRow];
  end;

end;

procedure TqrpRekapitulasi.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount;
  if MoreData then begin
      setDetailItem(i);
      Inc(i)
  END;
end;


procedure TqrpRekapitulasi.setClear;
begin
  ShapeHorizontal.Enabled := False;

  qrl0.Width   := 27;
  qrl0.Height  := 12;
  qrl0.Caption := '';
  qrl1.Caption := '';
  qrl2.Caption := '';
  qrl3.Caption := '';
  qrl4.Caption := '';
  qrl5.Caption := '';
  qrl6.Caption := '';
  qrl7.Caption := '';
  qrl8.Caption := '';
  qrl9.Caption := '';
  qrl10.Caption := '';
  qrl11.Caption := '';

  qrl0.Font.Style := [];
  qrl1.Font.Style := [];
  qrl2.Font.Style := [];
  qrl3.Font.Style := [];
  qrl4.Font.Style := [];
  qrl5.Font.Style := [];
  qrl6.Font.Style := [];
  qrl7.Font.Style := [];
  qrl8.Font.Style := [];
  qrl9.Font.Style := [];
  qrl10.Font.Style := [];
  qrl11.Font.Style := [];

  qrl0.Font.Size := 7;
  qrl1.Font.Size := 7;
  qrl2.Font.Size := 7;
  qrl3.Font.Size := 7;
  qrl4.Font.Size := 7;
  qrl5.Font.Size := 7;
  qrl6.Font.Size := 7;
  qrl7.Font.Size := 7;
  qrl8.Font.Size := 7;
  qrl9.Font.Size := 7;
  qrl10.Font.Size := 7;
  qrl11.Font.Size := 7;

  setFrameLable(False);


end;

procedure TqrpRekapitulasi.setFrameLable(AState: Boolean);
begin
  qrl0.Frame.DrawTop    := AState;
  qrl0.Frame.DrawBottom := AState;
  qrl0.Frame.DrawLeft   := AState;
  qrl0.Frame.DrawRight  := AState;

  qrl1.Frame.DrawTop    := AState;
  qrl1.Frame.DrawBottom := AState;
  qrl1.Frame.DrawLeft   := AState;
  qrl1.Frame.DrawRight  := AState;

  qrl2.Frame.DrawTop    := AState;
  qrl2.Frame.DrawBottom := AState;
  qrl2.Frame.DrawLeft   := AState;
  qrl2.Frame.DrawRight  := AState;

  qrl3.Frame.DrawTop    := AState;
  qrl3.Frame.DrawBottom := AState;
  qrl3.Frame.DrawLeft   := AState;
  qrl3.Frame.DrawRight  := AState;

  qrl4.Frame.DrawTop    := AState;
  qrl4.Frame.DrawBottom := AState;
  qrl4.Frame.DrawLeft   := AState;
  qrl4.Frame.DrawRight  := AState;

  qrl5.Frame.DrawTop    := AState;
  qrl5.Frame.DrawBottom := AState;
  qrl5.Frame.DrawLeft   := AState;
  qrl5.Frame.DrawRight  := AState;

  qrl6.Frame.DrawTop    := AState;
  qrl6.Frame.DrawBottom := AState;
  qrl6.Frame.DrawLeft   := AState;
  qrl6.Frame.DrawRight  := AState;

  qrl7.Frame.DrawTop    := AState;
  qrl7.Frame.DrawBottom := AState;
  qrl7.Frame.DrawLeft   := AState;
  qrl7.Frame.DrawRight  := AState;

  qrl8.Frame.DrawTop    := AState;
  qrl8.Frame.DrawBottom := AState;
  qrl8.Frame.DrawLeft   := AState;
  qrl8.Frame.DrawRight  := AState;

  qrl9.Frame.DrawTop    := AState;
  qrl9.Frame.DrawBottom := AState;
  qrl9.Frame.DrawLeft   := AState;
  qrl9.Frame.DrawRight  := AState;

  qrl10.Frame.DrawTop    := AState;
  qrl10.Frame.DrawBottom := AState;
  qrl10.Frame.DrawLeft   := AState;
  qrl10.Frame.DrawRight  := AState;

  qrl11.Frame.DrawTop    := AState;
  qrl11.Frame.DrawBottom := AState;
  qrl11.Frame.DrawLeft   := AState;
  qrl11.Frame.DrawRight  := AState;
end;

procedure TqrpRekapitulasi.setHeader;
begin
  qrl0.Alignment := taCenter;
  qrl1.Alignment := taCenter;
  qrl2.Alignment := taCenter;
  qrl3.Alignment := taCenter;
  qrl4.Alignment := taCenter;
  qrl5.Alignment := taCenter;
  qrl6.Alignment := taCenter;
  qrl7.Alignment := taCenter;
  qrl8.Alignment := taCenter;
  qrl9.Alignment := taCenter;
  qrl10.Alignment := taCenter;
  qrl11.Alignment := taCenter;

  qrl0.Font.Style := [fsBold];
  qrl1.Font.Style := [fsBold];
  qrl2.Font.Style := [fsBold];
  qrl3.Font.Style := [fsBold];
  qrl4.Font.Style := [fsBold];
  qrl5.Font.Style := [fsBold];
  qrl6.Font.Style := [fsBold];
  qrl7.Font.Style := [fsBold];
  qrl8.Font.Style := [fsBold];
  qrl9.Font.Style := [fsBold];
  qrl10.Font.Style := [fsBold];
  qrl11.Font.Style := [fsBold];

  setFrameLable(True);
end;

procedure TqrpRekapitulasi.setDetail;
begin
  qrl0.Alignment := taLeftJustify;
  qrl1.Alignment := taLeftJustify;
  qrl2.Alignment := taLeftJustify;
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;
  qrl5.Alignment := taRightJustify;
  qrl6.Alignment := taRightJustify;
  qrl7.Alignment := taRightJustify;
  qrl8.Alignment := taRightJustify;
  qrl9.Alignment := taRightJustify;
  qrl10.Alignment := taRightJustify;
  qrl11.Alignment := taLeftJustify;
end;

end.
