unit ServicePrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,strUtils,AdvGrid,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, UMaster;

type
  TqrpService = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlTitle: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    qrlNamaHeader: TQRLabel;
    SummaryBand1: TQRBand;
    qrlname: TQRLabel;
    qrlNo: TQRLabel;
    qrlCode: TQRLabel;
    qrlPRice: TQRLabel;
    QRLabel1: TQRLabel;
    qrlType: TQRLabel;
    qrmCompany: TQRMemo;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    i:integer;
    MasterPurpose:string;
    MasterGrid  : TAdvStringGrid;
  public
    procedure Executes(APurpose:string;vFilter: TServices=nil);
    procedure ExecuteGrid(AGrid: TAdvStringGrid;APurpose:string);
  end;

var
  qrpService: TqrpService;

implementation

uses SQLServerConnections, UConst;
const colSNo = 0;
  colSCode = 1;
  colSName = 2;
  colSType = 3;
  colSPrice = 4;
  colSId = 5;

{$R *.DFM}

{ TqrpService }

procedure TqrpService.ExecuteGrid(AGrid: TAdvStringGrid;APurpose:string);
begin
  MasterGrid := AGrid;
  qrlTitle.Caption := 'Data Jasa/Service'+IfThen(APurpose=SERVICE_TYPE_OTHERS,' Lain-Lain');
  qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpService.Executes(APurpose:string;vFilter: TServices);
var vTitle : string;
begin
 // qrlTitle.Caption := 'Data '+IfThen(,'Jasa','Biaya');
  MasterPurpose := APurpose;
  if MasterPurpose=SERVICE_TYPE_SINGLE then
    vTitle := 'Jasa'
  else
    vTitle := 'Biaya';
  qrlTitle.Caption := 'Data '+vTitle;
  qrlNamaHeader.Caption := 'Nama '+vTitle;
 { ADOQuery1.Connection:= MyConnection.ADOConnection;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close;
 // ADOQuery1.SQL.Text:= TService_Arr.GetSQLService(MasterPurpose,vFilter);
  ADOQuery1.Open;
  }
  ReportTitle := qrlTitle.Caption;
  PreviewModal;
end;

procedure TqrpService.QRDBText4Print(sender: TObject; var Value: String);
begin
  if Value = SERVICE_TYPE_SINGLE
  then Value:= 'Jasa'
  else if Value = SERVICE_TYPE_OTHERS
  then Value:= 'Lain'

end;

procedure TqrpService.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:=0;
end;

procedure TqrpService.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i < MasterGrid.RowCount-1;
   if MoreData then begin

     qrlNo.Caption    := IntToStr(i+1);
     qrlCode.Caption  := MasterGrid.Cells[colsCode,i+1];
     qrlType.Caption  := MasterGrid.Cells[colsType,i+1];
     qrlName.Caption  := MasterGrid.Cells[colsName,i+1];
     qrlPRice.Caption  := MasterGrid.Cells[colsPrice,i+1];
     Inc(i);
   end;
end;

end.
