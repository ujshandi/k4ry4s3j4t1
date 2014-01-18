unit ItemPriceHistoryPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls,AdvGrid;

type
  TqrpItemPriceHistory = class(TQuickRep)
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrmCompany: TQRMemo;
    qrlTitle: TQRLabel;
    QRShape1: TQRShape;
    qrlNo: TQRLabel;
    qrlName: TQRLabel;
    qrlCode: TQRLabel;
    qrlTipe: TQRLabel;
    ShapeDetail: TQRShape;
    QRShape2: TQRShape;
    ShapeTop: TQRShape;
    qrlPrice: TQRLabel;
    ShapePrice: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    i:integer;
    MasterGrid : TAdvStringGrid;
  public
    procedure Executes(const AGrid :TAdvStringGrid);
  end;

var
  qrpItemPriceHistory: TqrpItemPriceHistory;
const
   colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colUnit  = 3;
  colLimit = 4;
  colPurchase = 5;
  colPrice = 6;
  colSeq   = 7;
  colPriceId = 8;

implementation

uses UMaster;

{$R *.DFM}

{ TqrpItemPriceHistory }

procedure TqrpItemPriceHistory.Executes(const AGrid: TAdvStringGrid);
begin
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  //qrlTitle.Caption := IfThen(MasterPurpose=ITEM_TYPE_PART,' Data Part','Data Oli');
  ReportTitle := qrlTitle.Caption;
  MasterGrid := AGrid;
  MasterGrid.ExpandAll;

  PreviewModal;

end;

procedure TqrpItemPriceHistory.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:= 0;
end;

procedure TqrpItemPriceHistory.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
   MoreData := i < MasterGrid.RowCount-1;
   if MoreData then begin
     if MasterGrid.IsNode(i+1) then begin
        qrlPrice.Caption := '';
        ShapeDetail.Enabled := True;
        ShapeTop.Enabled := True;
        ShapePrice.Enabled := False;
        //ShapeDetail.Shape := qrsRectangle;
        qrlNo.Caption    := MasterGrid.Cells[colNo,i+1];
        qrlCode.Caption  := MasterGrid.Cells[colCode,i+1];
        qrlName.Caption  := MasterGrid.Cells[colName,i+1];
        qrlName.Alignment := taLeftJustify;
       // qrlUnit.Caption  := MasterGrid.Cells[colUnit,i+1];
        qrlTipe.Caption := MasterGrid.Cells[colLimit,i+1];
       // qrlMesin.Caption := '';
//        qrlMesin.Caption := MasterGrid.Cells[colMesin,i+1];
//        qrlTipe.Caption  := MasterGrid.Cells[colTipe,i+1];

      end
      else begin// if MasterGrid.Ints[colPriceID,i+1] > 0 then begin //detail history
//        ShapeDetail.Enabled := False;
        qrlCode.Caption := MasterGrid.Cells[colCode,i+1];
        qrlName.Caption := '';
        qrlPrice.Caption := MasterGrid.Cells[colName,i+1];
        ShapeTop.Enabled := False;
        ShapePrice.Enabled := True;
        qrlNo.Caption   := '';
      //  qrlUnit.Caption := '';
        qrlTipe.Caption:= '';
        if MasterGrid.Ints[colPriceId,i+1] > 0 then begin
          qrlPrice.Alignment := taRightJustify;

         // ShapeDetail.Shape := qrsRightAndLeft;
         ShapeDetail.Enabled := False;
        end
        else begin
          qrlPrice.Alignment := taCenter;
//          ShapeDetail.Shape := qrsRectangle;
          ShapeDetail.Enabled := True;
        end;
       // qrlMesin.Caption:= '';
      end;
      Inc(i);
   end;
end;

end.
