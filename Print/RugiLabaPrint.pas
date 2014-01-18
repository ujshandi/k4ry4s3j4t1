unit RugiLabaPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,Math,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,BaseGrid, AdvGrid;

type
  TqrpRugiLaba = class(TQuickRep)
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    qrlTitle: TQRLabel;
    qrlReportTitle: TQRLabel;
    qrlPEriode: TQRLabel;
    qrlMstrDesc: TQRLabel;
    qrlChldDesc: TQRLabel;
    qrlValue1: TQRLabel;
    qrlValue2: TQRLabel;
    qrlValue4: TQRLabel;
    qrlValue3: TQRLabel;
    QRSysData1: TQRSysData;
    qrMemCompany: TQRMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    gLobalGrid : TAdvStringGrid;
    i:integer;
    procedure SetFrame(ALabel : TQRLabel;FrameStyle:string);
  public
    procedure Executes(AGrid : TAdvStringGrid);
  end;

var
  qrpRugiLaba: TqrpRugiLaba;

implementation

uses un_ryu, UMaster, AutoBengkel;
const
  colLeft      = 0;
  colMstrDesc  = 1;     rowCompanyID = 1;
  colChldDesc  = 2;     rowReptID    = 2;
  colValue1    = 3;     rowPeriode   = 3;
  colValue2    = 4;     rowBevel     = 4;
  colValue3    = 5;
  colValue4    = 6;      csTop    = 'T';
  colRight     = 7;      csBottom = 'B';
  colBorder    = 8;      csTopBottom = 'TB';
  colColor     = 9;      clReds      = 'M';

{$R *.DFM}

{ TqrpRugiLaba }

procedure TqrpRugiLaba.Executes(AGrid: TAdvStringGrid);
begin
  qrMemCompany.Lines.Text := TCompanyProfile.getProfile;
  gLobalGrid := AGrid;
  ReportTitle := gLobalGrid.Cells[colMstrDesc,rowCompanyId];
  qrlTitle.Caption       := gLobalGrid.Cells[colMstrDesc,rowCompanyId];
  qrlReportTitle.Caption := gLobalGrid.Cells[colMstrDesc,rowReptId];
  qrlPEriode.Caption     := gLobalGrid.Cells[colMstrDesc,rowPeriode];

  PreviewModal;
end;

procedure TqrpRugiLaba.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:=rowBevel+1;
end;

procedure TqrpRugiLaba.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
   MoreData := (i<gLobalGrid.RowCount);
   if MoreData and (gLobalGrid.RowHeights[i]<>10) then begin
     qrlMstrDesc.Caption  := gLobalGrid.StrippedCells[colMstrDesc,i];
     if qrlMstrDesc.Caption = '' then begin
        qrlChldDesc.Caption := gLobalGrid.StrippedCells[colChldDesc,i];
        qrlValue1.Caption   := gLobalGrid.StrippedCells[colValue1,i];
        qrlValue2.Caption   := gLobalGrid.StrippedCells[colValue2,i];
        qrlValue3.Caption   := gLobalGrid.StrippedCells[colValue3,i];
        qrlValue4.Caption   := gLobalGrid.StrippedCells[colValue4,i];
         SetFrame(qrlValue1,gLobalGrid.Cells[colBorder,i]);
         SetFrame(qrlValue2,gLobalGrid.Cells[colBorder,i]);
         SetFrame(qrlValue3,gLobalGrid.Cells[colBorder,i]);
         SetFrame(qrlValue4,gLobalGrid.Cells[colBorder,i]);
     end
     else begin
        qrlChldDesc.Caption := '';
        qrlValue1.Caption   := '';
        qrlValue2.Caption   := '';
        qrlValue3.Caption   := '';
        qrlValue4.Caption   := '';
        if (gLobalGrid.Cells[colBorder,i] = 'B') or (gLobalGrid.Cells[colBorder,i] = 'T') or
           (gLobalGrid.Cells[colBorder,i] = 'TB') then
          qrlValue4.Caption   := gLobalGrid.StrippedCells[colValue4,i];
        if qrlMstrDesc.Caption = 'Zakat' then  begin
          qrlValue2.Caption   := gLobalGrid.StrippedCells[colvalue2,i]+ ' %';
          qrlValue4.Caption   := gLobalGrid.StrippedCells[colValue4,i];
        end;
        if qrlMstrDesc.Caption = 'Laba Kotor Penjualan' then
          qrlValue4.Caption   := gLobalGrid.StrippedCells[colValue4,i];
     end;
     SetFrame(qrlValue1,gLobalGrid.Cells[colBorder,i]);
     SetFrame(qrlValue2,gLobalGrid.Cells[colBorder,i]);
     SetFrame(qrlValue3,gLobalGrid.Cells[colBorder,i]);
     SetFrame(qrlValue4,gLobalGrid.Cells[colBorder,i]);
   end
   else begin
     qrlMstrDesc.Caption := '';
     qrlChldDesc.Caption := '';
      qrlValue1.Caption   := '';
      qrlValue2.Caption   := '';
      qrlValue3.Caption   := '';
      qrlValue4.Caption   := '';
      SetFrame(qrlValue1,gLobalGrid.Cells[colBorder,i]);
     SetFrame(qrlValue2,gLobalGrid.Cells[colBorder,i]);
     SetFrame(qrlValue3,gLobalGrid.Cells[colBorder,i]);
     SetFrame(qrlValue4,gLobalGrid.Cells[colBorder,i]);
   end;

   Inc(i);
end;

procedure TqrpRugiLaba.SetFrame(ALabel: TQRLabel; FrameStyle: string);
begin
   {csTop    = 'T';      csBottom = 'B';    csTopBottom = 'TB';
    clReds      = 'M';}
  ALabel.Frame.DrawTop := False;
  ALabel.Frame.DrawLeft := False;
  ALabel.Frame.DrawRight := False;
  ALabel.Frame.DrawBottom := False;

  if (ALabel.Caption = '')  then exit;

  if FrameStyle = csTop then
    ALabel.Frame.DrawTop := True;
  if FrameStyle = csBottom then
    ALabel.Frame.DrawBottom := True;
  if FrameStyle = csTopBottom then begin
    ALabel.Frame.DrawBottom := True;
    ALabel.Frame.DrawTop := True;
  end;
end;

end.
