unit PendapatanMekanikPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,advGrid;

type
  TqrpPendapatanMekanik = class(TQuickRep)
    TitleBand1: TQRBand;
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
    qrl7: TQRLabel;
    Shape0: TQRShape;
    qrlTitle: TQRLabel;
    QRSysData1: TQRSysData;
    Shape1: TQRShape;
    Shape2: TQRShape;
    Shape3: TQRShape;
    Shape4: TQRShape;
    Shape5: TQRShape;
    ShapeTop: TQRShape;
    ShapeBottom: TQRShape;
    qrmCompany: TQRMemo;
    qrlPeriod: TQRLabel;
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
     MasterGrid : TAdvStringGrid;
     i:integer;
     procedure ReportSetLabel(var ABand : TQRBand;FontSize:integer;FontStyle:TFontStyles;Align:TAlignment);
     procedure setHeader(Arow:integer);
     procedure setHeaderTrans(Arow:integer);
     procedure setHeaderTransDetail(Arow:integer);
     procedure setDetail(Arow:integer);
     procedure setDetailTrans(Arow:integer);
     procedure setSubDetail(Arow:integer);
     procedure setFooter(Arow:integer);
  public
     procedure Executes(AGrid : TAdvStringGrid);
  end;

var
  qrpPendapatanMekanik: TqrpPendapatanMekanik;

implementation

uses UMaster, un_ryu, Subroutines;

{$R *.DFM}
const
  {Master}
  colNo = 0;
  colCode = 1;
  colName = 2;
  colID = 6;

  {DETAIL}
  coldDate = 1;
  coldTrans = 2;
  coldTotal = 3;
  coldTransId = 7;

  {SUBDETAIL}
  colsCode = 1;
  colsName =2;
  colsQty =3;
  colsPrice = 4;
  colsAmount = 5;

{ TqrpPendapatanMekanikTrans }

procedure TqrpPendapatanMekanik.Executes(AGrid: TAdvStringGrid);
begin
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;
  ReportTitle := qrlTitle.Caption;
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlPeriod.Caption := CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  PreviewModal;
end;

procedure TqrpPendapatanMekanik.ReportSetLabel(var ABand: TQRBand;
  FontSize: integer; FontStyle: TFontStyles;Align:TAlignment);
var i:integer;
    vLabel : TQRLabel;
begin
  for i := 0 to Self.Componentcount-1 do begin
      if (Self.Components[i] is TQRLabel) then begin
         vLabel := (Self.components[i] as TQRLabel);
         if vLabel.Parent <>  ABand then Continue;
         vLabel.Alignment  := Align;
         vLabel.Font.Size  := FontSize;
         vLabel.Font.Style := FontStyle;
         vLabel.Caption    := '';
         if vLabel.Name = 'qrl1' then
           vLabel.Width := 115;
      end;
  end;
  Shape0.Enabled := False;
  Shape1.Enabled := False;
  Shape2.Enabled := False;
  Shape3.Enabled := False;
  Shape4.Enabled := False;
  Shape5.Enabled := False;
  ShapeTop.Enabled := False;
  ShapeBottom.Enabled := False;
  DetailBand1.Height := 20;
end;

procedure TqrpPendapatanMekanik.setDetail(Arow: integer);
begin
  ReportSetLabel(DetailBand1,10,[fsBold],taLeftJustify);
  qrl1.Width := 300;
  qrl0.Caption := MasterGrid.Cells[colNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colName,aRow]+' ('+MasterGrid.Cells[colCode,arow]+')';
 // qrl2.Caption := MasterGrid.Cells[colName,aRow];
  
end;

procedure TqrpPendapatanMekanik.setDetailTrans(Arow: integer);
begin
  ReportSetLabel(DetailBand1,8,[],taLeftJustify);
  qrl1.Caption := MasterGrid.Cells[coldDate,arow];
  qrl2.Caption := MasterGrid.Cells[coldTrans,aRow];
  qrl3.Caption := MasterGrid.Cells[coldTotal,aRow];
  qrl3.Alignment := taRightJustify;
  Shape1.Enabled := True;
  Shape2.Enabled := True;
  Shape3.Enabled := True;
  Shape0.Enabled := True;
  Shape5.Enabled := True;
  ShapeTop.Enabled := True;
//  ShapeBottom.Enabled := True;
end;

procedure TqrpPendapatanMekanik.setHeader(Arow:integer);
begin
  ReportSetLabel(DetailBand1,10,[fsBold],taCenter);
  qrl0.Caption := MasterGrid.Cells[colNo,aRow];
  qrl1.Caption := MasterGrid.Cells[colCode,arow];
  qrl2.Caption := MasterGrid.Cells[colName,aRow];
  
end;

procedure TqrpPendapatanMekanik.setHeaderTrans(Arow: integer);
begin
  ReportSetLabel(DetailBand1,8,[fsBold],taCenter);
  qrl1.Caption := MasterGrid.Cells[coldDate,arow];
  qrl2.Caption := MasterGrid.Cells[coldTrans,aRow];
  qrl3.Caption := MasterGrid.Cells[coldTotal,aRow];

  Shape0.Enabled := True;
  Shape1.Enabled := True;
  Shape2.Enabled := True;
  Shape3.Enabled := True;
  Shape5.Enabled := True;
  ShapeTop.Enabled := True;
//  ShapeBottom.Enabled := True;

end;

procedure TqrpPendapatanMekanik.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount-1;
  if MoreData then begin
    if i = 0 then
      setHeader(i)
    else if MasterGrid.Ints[colId,i]>0 then
      setDetail(i)
    else if (MasterGrid.Ints[coldTransId,i]=0) and (MasterGrid.Ints[colId,i]=0) then begin
      if MasterGrid.Cells[colCode,i] = '' then begin
        ReportSetLabel(DetailBand1,8,[],taLeftJustify);
        DetailBand1.Height := 5;
      end
      else  if MasterGrid.Cells[colsPrice,i] <> '' then
        setHeaderTransDetail(i)
      else if MasterGrid.Cells[colsCode,i] <> '' then
        setHeaderTrans(i)

    end
    else if MasterGrid.Ints[coldTransId,i] > 0 then begin
      if MasterGrid.Ints[coldTransId,i] = 1 then
        setFooter(i)
      else if MasterGrid.Cells[colsPrice,i] <> '' then
        setSubDetail(i)
      else
       setDetailTrans(i);
    end;

    inc(i);
  end;
end;

procedure TqrpPendapatanMekanik.setFooter(Arow: integer);
begin
  ReportSetLabel(DetailBand1,7,[fsItalic],taLeftJustify);
  qrl4.Caption := MasterGrid.Cells[colsPrice,aRow];
  qrl5.Caption := MasterGrid.Cells[colsAmount,aRow];
  qrl5.Alignment := taRightJustify;
  Shape4.Enabled := True;
  Shape3.Enabled := True;
  Shape0.Enabled := True;
  Shape5.Enabled := True;
  ShapeTop.Enabled := True;
  ShapeBottom.Enabled := True;
end;

procedure TqrpPendapatanMekanik.setHeaderTransDetail(Arow: integer);
begin
  ReportSetLabel(DetailBand1,7,[fsBold,fsItalic],taCenter);
  qrl1.Caption := MasterGrid.Cells[colsCode,arow];
  qrl2.Caption := MasterGrid.Cells[colsName,aRow];
  qrl3.Caption := MasterGrid.Cells[colsQty,aRow];
  qrl4.Caption := MasterGrid.Cells[colsPrice,aRow];
  qrl5.Caption := MasterGrid.Cells[colsAmount,aRow];
  Shape1.Enabled := True;
  Shape2.Enabled := True;
  Shape3.Enabled := True;
  Shape4.Enabled := True;
  Shape0.Enabled := True;
  Shape5.Enabled := True;
  ShapeTop.Enabled := True;
  ShapeBottom.Enabled := True;
end;

procedure TqrpPendapatanMekanik.setSubDetail(Arow: integer);
begin
  ReportSetLabel(DetailBand1,7,[fsItalic],taLeftJustify);
  qrl1.Caption := MasterGrid.Cells[colsCode,arow];
  qrl2.Caption := MasterGrid.Cells[colsName,aRow];
  qrl3.Caption := MasterGrid.Cells[colsQty,aRow];
  qrl4.Caption := MasterGrid.Cells[colsPrice,aRow];
  qrl5.Caption := MasterGrid.Cells[colsAmount,aRow];
  qrl3.Alignment := taRightJustify;
  qrl4.Alignment := taRightJustify;
  qrl5.Alignment := taRightJustify;

  Shape1.Enabled := True;
  Shape2.Enabled := True;
  Shape3.Enabled := True;
  Shape4.Enabled := True;
  Shape0.Enabled := True;
  Shape5.Enabled := True;
end;

procedure TqrpPendapatanMekanik.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  i := 1;
end;

end.
