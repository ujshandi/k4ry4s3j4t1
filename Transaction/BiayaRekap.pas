unit BiayaRekap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit, ComCtrls, ExtCtrls;

type
  TfrmBiayaRekap = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    d: TBevel;
    l: TLabel;
    btnReset: TButton;
    cmbOpr1: TComboBox;
    dtpDari1: TDateTimePicker;
    dtpSampai1: TDateTimePicker;
    btnOk: TButton;
    StaticText1: TStaticText;
    Panel1: TPanel;
    Panel2: TPanel;
    asgRekap: TAdvStringGrid;
    btnPrint: TButton;
    btnFilter: TButton;
    btnAdd: TButton;
    btnDetail: TButton;
    procedure btnFilterClick(Sender: TObject);
    procedure asgRekapDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnAddClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure cmbOpr1Change(Sender: TObject);
  private
    { Private declarations }
    MasterPurpose : string;
    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadGrid;
  public
    { Public declarations }
    function Execute(aPurpose:string;AMenuId:integer):boolean;
  end;

var
  frmBiayaRekap: TfrmBiayaRekap;

implementation

uses UConst, Subroutines, MainMenu, un_ryu, UMaster, Biaya, UFinance,
  SQLServerConnections;
const colNo =0;
      colNum = 1;
      colDate = 2;
      colNotes = 3;
      colOperator = 4;
      colSeq = 5;

{$R *.dfm}

{ TfrmBiayaRekap }

procedure TfrmBiayaRekap.ArrangeColSize;
begin
  with asgRekap do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
    if GlobalSystemUser.AccessLevel  > LEVEL_OWNER then exit;
    ColWidths[colSeq] := 0;
  end;
end;

function TfrmBiayaRekap.Execute(aPurpose: string;
  AMenuId: integer): boolean;
begin
  Result := True;
 if not Can_Access(Self,AMenuId) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  MasterPurpose := aPurpose;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter,90);
  Result := True;
  InitForm;
  btnAdd.Click;
  btnOk.Click;
  Run(Self);
end;

procedure TfrmBiayaRekap.InitFIlter;
begin
  cmbOpr1.ItemIndex :=  3;
  cmbOpr1Change(Self);
  dtpDari1.DateTime := ServerNow - 7;
  dtpSampai1.DateTime := ServerNow;
  
end;

procedure TfrmBiayaRekap.InitForm;
begin
  StaticText1.Font.Color := clBlack;
//  btnAdd.Caption := IfThen(MasterPurpose=SHIP_TYPE_TERIMA_BARANG,'&New..','&New Order');
  InitFIlter;
  InitGrid;
  MainPanel.Update;
end;

procedure TfrmBiayaRekap.InitGrid;
begin
  asgRekap.Clear;
  ResetGrid(asgRekap,2,7,1,1);
  with asgRekap do begin
     Cells[colNo,0]   := 'No.';
     Cells[colNum,0]  := 'No.Transaksi';
     Cells[colDate,0] := 'Tanggal';
     Cells[colNotes,0]:= 'Keterangan';
     Cells[colOperator,0]:= 'Operator';
     Cells[colSeq,0]  := 'Sequence';
  end;
  ArrangeColSize;
end;

procedure TfrmBiayaRekap.ReloadGrid;
var vPaymentArr : TPayment_Arr;
   i,vRow : integer;
begin
  vPaymentArr := TPayment_Arr.Create;
  SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
  vPaymentArr.FindOnDB;
  InitGrid;
  for i:= 0 to vPaymentArr.Count-1 do
    with asgRekap do begin
      vRow := RowCount-1;
      Cells[colNum,vRow]  := vPaymentArr[i].PaymentNum;
      Cells[colDate,vRow] := NewFormatDate(vPaymentArr[i].PaymentDate);
      Cells[colNotes,vRow]:= vPaymentArr[i].Notes;
      Cells[colOperator,vRow] := vPaymentArr[i].UserInsert;
      Ints[colSeq,vRow]   := vPaymentArr[i].PaymentId;
      AddRow;
    end;
  DeleteRowTerakhir(asgRekap,2,1);  
  ArrangeColSize;
  vPaymentArr.Free;
end;

procedure TfrmBiayaRekap.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,90);
end;

procedure TfrmBiayaRekap.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
    if ARow = 0 then exit;
  btnDetail.Click;
end;

procedure TfrmBiayaRekap.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter;
end;

procedure TfrmBiayaRekap.btnAddClick(Sender: TObject);
begin
  if frmBiaya.Execute(0) then
      btnOk.Click;
end;

procedure TfrmBiayaRekap.btnDetailClick(Sender: TObject);
begin
  if asgRekap.Row = 0 then exit;
  if asgRekap.Ints[colseq,asgRekap.Row] = 0 then exit;
  frmBiaya.Execute(asgRekap.Ints[colseq,asgRekap.Row]);
  //btnOk.Click;
end;

procedure TfrmBiayaRekap.btnOkClick(Sender: TObject);
begin
  ReloadGrid;
end;

procedure TfrmBiayaRekap.cmbOpr1Change(Sender: TObject);
begin
  dtpSampai1.Enabled := cmbOpr1.ItemIndex = 3;
end;

end.
