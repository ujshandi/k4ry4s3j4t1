unit ItemPriceAktifPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, AdvGrid,strUtils,Math,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, UMaster;

type
  TqrpItemPRiceAktif = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitle: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    qrlNo: TQRLabel;
    qrlCode: TQRLabel;
    qrlName: TQRLabel;
    qrlUnit: TQRLabel;
    qrlLimit: TQRLabel;
    qrlNotes: TQRLabel;
    qrmCompany: TQRMemo;
    qrlBeli: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    i:integer;
    MasterGrid : TAdvStringGrid;
    MasterPurpose : string;
  public
    procedure Executes(vFilter: TItems);
    procedure ExecuteGrid(APurpose:string;AGrid:TAdvStringGrid);
  end;

var
  qrpItemPRiceAktif: TqrpItemPRiceAktif;

implementation

uses SQLServerConnections, UConst;

const
  {Part}
  colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colUnit  = 3;
  colLimit = 4;
   colPurchase = 5;
  colPrice = 6;
  colSeq   = 7;
  colPriceId = 8;

  {Service}
  colSNo = 0;
  colSCode = 1;
  colSName = 2;
  colSPrice = 3;
  colSType = 4;
  colSId = 5;
  colsPriceId = 6;

  {OLI}
  colONo    = 0;
  colOCode  = 1;
  colOName  = 2;
  colOUnit  = 3;
  colOLimit  = 4;
  colOPurchase = 5;
  colOPrice = 6;
  colOID   = 7;
  colOPriceId = 8;
{$R *.DFM}

{ TqrpItem }

procedure TqrpItemPRiceAktif.ExecuteGrid(APurpose:string;AGrid: TAdvStringGrid);
begin
  MasterPurpose := APurpose;
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  qrlTitle.Caption := IfThen(MasterPurpose=ITEM_TYPE_PART,' Daftar Harga Part',IfThen(MasterPurpose=ITEM_TYPE_OIL,'Daftar Harga Oli','Daftar Harga Service'));
  ReportTitle := qrlTitle.Caption;
  MasterGrid := AGrid;
  PreviewModal;
end;

procedure TqrpItemPRiceAktif.Executes(vFilter: TItems);
begin
  ReportTitle := qrlTitle.Caption;
////  ADOQuery1.Connection:= MyConnection.ADOConnection;
 // ADOQuery1.SQL.Clear;
 // ADOQuery1.Close;
//  ADOQuery1.SQL.Text:= TItems_Arr.GetSQLItem(vFilter);
//  ADOQuery1.Open;
  PreviewModal;
end;

procedure TqrpItemPRiceAktif.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:=0;
end;

procedure TqrpItemPRiceAktif.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
   MoreData := i < MasterGrid.RowCount-1;
   if MoreData then begin

     qrlNo.Caption    := IntToStr(i+1);
     qrlCode.Caption  := MasterGrid.Cells[colCode,i+1];
     qrlName.Caption  := MasterGrid.Cells[colName,i+1];
     qrlUnit.Caption  := MasterGrid.Cells[colUnit,i+1];
     qrlLimit.Caption  := MasterGrid.Cells[colLimit,i+1];
     qrlNotes.Caption  := MasterGrid.Cells[IfThen(MasterPurpose=SERVICE_TYPE_SINGLE, colsPrice,colPrice),i+1];
     qrlBeli.Caption   := IfThen(MasterPurpose=SERVICE_TYPE_SINGLE,'',
                              IfThen(MasterPurpose=ITEM_TYPE_PART,MasterGrid.Cells[colPurchase,i+1],MasterGrid.Cells[colOPurchase,i+1]));
     Inc(i);
   end;
end;

end.
