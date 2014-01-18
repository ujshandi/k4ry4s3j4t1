unit PersonPrint;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,advGrid,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, ADODB,
  UMaster;

type
  TqrpPerson = class(TQuickRep)
    TitleBand1: TQRBand;
    qrlCaption: TQRLabel;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    ColumnHeaderBand1: TQRBand;
    QRShape1: TQRShape;
    SummaryBand1: TQRBand;
    qrlNo: TQRLabel;
    qrlCode: TQRLabel;
    qrlName: TQRLabel;
    qrlAddress: TQRLabel;
    qrlCity: TQRLabel;
    qrlPhone: TQRLabel;
    qrlHeadCode: TQRLabel;
    qrmCompany: TQRMemo;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    i:integer;
    MasterPurpose:String;
    MasterGrid:TAdvStringGrid;
  public
    procedure Executes(AFilter: TPersons);
    procedure ExecuteGrid(AGrid:TAdvStringGrid;APurpose:string);
  end;

var
  qrpPerson: TqrpPerson;

implementation

uses UConst, SQLServerConnections;
const

   colNo      = 0;
  colCode    = 1;
  colName    = 2;
  colAddress = 3;
  colCity    = 4;
  colPhone   = 5;
  colPhone2  = 6;
  colID    = 7;

  {SubDealer}
  colSNo      = 0;
  colSCode    = 1;
  colSName    = 2;
  colSAddress = 3;
  colSCity    = 4;
  colSPhone   = 5;
  colSPhone2  = 6;
  colSID    = 7;

  {mEKANIK}
  colMNo      = 0;
  colMCode    = 1;
  colMName    = 2;
  colMAddress = 3;
  colMCity    = 4;
  colMPhone   = 5;
  colMPhone2  = 6;
  colMID    = 7;

  {SUPPLIER}
  colpNo      = 0;
  colpCode    = 1;
  colpName    = 2;
  colpAddress = 3;
  colpCity    = 4;
  colpPhone   = 5;
  colpPhone2  = 6;
  colpID    = 7;
{$R *.DFM}

{ TqrpPerson }

procedure TqrpPerson.ExecuteGrid(AGrid: TAdvStringGrid;APurpose:string);
begin
   qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  MasterPurpose := APurpose;
  MasterGrid := AGrid;
  case MasterPurpose[1] of
      PS_TYPE_CUSTOMER : begin
        qrlCaption.Caption := 'Data Pelanggan';
        qrlHeadCode.Caption := 'No.Polisi';
      end;
      PS_TYPE_SUBDEALER : begin
        qrlCaption.Caption := 'Data Sub Dealer';
        qrlHeadCode.Caption := 'Kode';
      end;
      PS_TYPE_MECHANIC : begin
        qrlCaption.Caption := 'Data Mekanik';
        qrlHeadCode.Caption := 'Kode';
      end;
      PS_TYPE_SUPPLIER : begin
        qrlCaption.Caption := 'Data Supplier';
        qrlHeadCode.Caption := 'Kode';
      end;
    end;
  ReportTitle := qrlCaption.Caption;
  PreviewModal;
end;

procedure TqrpPerson.Executes(AFilter: TPersons);
begin
   qrmCompany.Lines.Text := TCompanyProfile.getProfile;
  if AFilter.PersonType = PS_TYPE_CUSTOMER then
    qrlCaption.Caption:= 'Data Customer  '

  else if AFilter.PersonType = PS_TYPE_SUBDEALER then
    qrlCaption.Caption:= 'Data Sub Dealer  '
  else if AFilter.PersonType = PS_TYPE_SUPPLIER then
    qrlCaption.Caption:= 'Data Supplier  '
  else if AFilter.PersonType = PS_TYPE_MECHANIC then
    qrlCaption.Caption:= 'Data Contact Person  ';
  ReportTitle := qrlCaption.Caption;
 { ADOQuery1.Connection:= MyConnection.ADOConnection;
  ADOQuery1.SQL.Clear;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text:= TPersons_Arr.GetSQLPerson(AFilter);
  ADOQuery1.Open;}
  PreviewModal;
end;

procedure TqrpPerson.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  i:=0;
end;

procedure TqrpPerson.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData := i<MasterGrid.RowCount-1;
  if MoreData then begin
    qrlNo.Caption := IntToStr(i+1);
    case MasterPurpose[1] of
      PS_TYPE_CUSTOMER : begin
        qrlCode.Caption := MasterGrid.Cells[colCode,i+1];
        qrlName.Caption := MasterGrid.Cells[colName,i+1];
        qrlAddress.Caption := MasterGrid.Cells[colAddress,i+1];
        qrlCity.Caption := MasterGrid.Cells[colCity,i+1];
        qrlPhone.Caption := MasterGrid.Cells[colPhone,i+1];
      //        .Caption := MasterGrid.Cells[colPhone2,i+1];
        //      .Caption := MasterGrid.Cells[colID,i+1];
      end;
      PS_TYPE_SUBDEALER : begin
        qrlCode.Caption := MasterGrid.Cells[colsCode,i+1];
        qrlName.Caption := MasterGrid.Cells[colsName,i+1];
        qrlAddress.Caption := MasterGrid.Cells[colsAddress,i+1];
        qrlCity.Caption := MasterGrid.Cells[colsCity,i+1];
        qrlPhone.Caption := MasterGrid.Cells[colsPhone,i+1];
      end;
      PS_TYPE_MECHANIC : begin
        qrlCode.Caption := MasterGrid.Cells[colmCode,i+1];
        qrlName.Caption := MasterGrid.Cells[colmName,i+1];
        qrlAddress.Caption := MasterGrid.Cells[colmAddress,i+1];
        qrlCity.Caption := MasterGrid.Cells[colmCity,i+1];
        qrlPhone.Caption := MasterGrid.Cells[colmPhone,i+1];
      end;
      PS_TYPE_SUPPLIER : begin
        qrlCode.Caption := MasterGrid.Cells[colpCode,i+1];
        qrlName.Caption := MasterGrid.Cells[colpName,i+1];
        qrlAddress.Caption := MasterGrid.Cells[colpAddress,i+1];
        qrlCity.Caption := MasterGrid.Cells[colpCity,i+1];
        qrlPhone.Caption := MasterGrid.Cells[colpPhone,i+1];
      end;
    end;
    inc(i);
  end;
end;

end.
