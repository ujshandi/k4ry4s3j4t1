unit MotorPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, AdvGrid,strUtils,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB, UMaster;

type
  TqrpMotor = class(TQuickRep)
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
  qrpMotor: TqrpMotor;

implementation

uses SQLServerConnections, UConst;

const
  colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colYear  = 3;
  colSeq   = 4;
{$R *.DFM}

{ TqrpItem }

procedure TqrpMotor.ExecuteGrid(APurpose:string;AGrid: TAdvStringGrid);
begin
  MasterPurpose := APurpose;
  qrlTitle.Caption := IfThen(MasterPurpose=MOTOR_TYPE,' Data Kendaraan','Data Oli');
  ReportTitle := qrlTitle.Caption;
  MasterGrid := AGrid;
  PreviewModal;
end;

procedure TqrpMotor.Executes(vFilter: TItems);
begin
  ReportTitle := qrlTitle.Caption;
////  ADOQuery1.Connection:= MyConnection.ADOConnection;
 // ADOQuery1.SQL.Clear;
 // ADOQuery1.Close;
//  ADOQuery1.SQL.Text:= TItems_Arr.GetSQLItem(vFilter);
//  ADOQuery1.Open;
  PreviewModal;
end;

procedure TqrpMotor.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:=0;
end;

procedure TqrpMotor.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
   MoreData := i < MasterGrid.RowCount-1;
   if MoreData then begin

     qrlNo.Caption    := IntToStr(i+1);
     qrlCode.Caption  := MasterGrid.Cells[colCode,i+1];
     qrlName.Caption  := MasterGrid.Cells[colName,i+1];
     qrlUnit.Caption  := MasterGrid.Cells[colYear,i+1];
//     qrlLimit.Caption  := MasterGrid.Cells[colLimit,i+1];
  //   qrlNotes.Caption  := MasterGrid.Cells[colNotes,i+1];
     Inc(i);
   end;
end;

end.
