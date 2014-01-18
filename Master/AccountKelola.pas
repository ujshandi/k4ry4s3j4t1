{ ********************************************************* }
{   By H@ndy  | dari tgl 160905 |                           }
{   2004/2005 | IndoRaya Software Corporation               }
{   - Sebagai Form Kelola Account                           }
{ ********************************************************* }
unit AccountKelola;
{________________________________
***FINAL TEST OK BY CHAN 'LO  ***
_________________________________}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ExtCtrls, StdCtrls, StrUtils, AdvEdit,
  WinXP, Buttons,
  UMaster;

type
  TfrmAccountKelola = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    Bevel1: TBevel;
    asgAccount: TAdvStringGrid;
    cmbTipe: TComboBox;
    WinXP1: TWinXP;
    btnReset: TButton;
    btnFilter: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnPrint: TButton;
    l: TStaticText;
    btnOK: TButton;
    procedure asgAccountGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
//    ListTipe: TStringList;
   //Chan ANTI N.A.T.O gAccCode, gAccType, gAccNama: String;

  //  procedure CreateList;
  //  procedure DestroyList;
    procedure ArrangColSize;
    procedure InitGrid;
    procedure InitForm;
    procedure InitFilter;
    procedure SetFilter;
    procedure LoadData;
  public
    procedure Execute;
  end;

var
  frmAccountKelola: TfrmAccountKelola;

implementation

uses  UConst, un_ryu, Subroutines,
  SQLServerConnections, MainMenu, AutoBengkel, AccountAdd;

const
  colNo     = 0;
  colCode   = 1;
  colName   = 2;
  colTipe   = 3;
  colID   = 4;

{$R *.dfm}

{ TfrmAccountKelola }

procedure TfrmAccountKelola.ArrangColSize;
begin
  asgAccount.AutoSizeColumns(True,4);
  asgAccount.AutoNumberCol(colNo);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  asgAccount.ColWidths[colId] := 0;
end;

{procedure TfrmAccountKelola.CreateList;
begin
  if ListTipe = nil then
    ListTipe := TStringList.Create;
  if AcountArr = nil then
    AcountArr :=TMoneyAccount_Arr.Create;
end;

procedure TfrmAccountKelola.DestroyList;
begin
  ListTipe.Destroy;
  AcountArr.Free;
end;}

procedure TfrmAccountKelola.Execute;
begin
  if (not Can_Access(self)) then
  begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    Exit;
  end;
  pnlFilter.Height := 0;
  InitForm;
  btnOK.Click;
  Run(Self);
end;

procedure TfrmAccountKelola.InitFilter;
begin
{  if ListTipe.Count = 0 then
    TMoneyAccount.getListAccountType(ListTipe,true);
  NameValueListToValueList(ListTipe, cmbTipe.Items);
  cmbTipe.ItemIndex:= 0;}
end;

procedure TfrmAccountKelola.InitForm;
begin

  InitGrid;
  InitFilter;
end;

procedure TfrmAccountKelola.InitGrid;
begin
  ResetGrid(asgAccount,2,6,1,1);
  with asgAccount do begin
    Cells[colNo,0]   := 'No.';
    Cells[colCode,0] := 'Kode Biaya';
    Cells[colName,0] := 'Nama Biaya';
    Cells[colTipe,0] := 'Tipe';
//    Cells[colBank,0] := 'Bank Name';
  //  Cells[colAccNum,0] := 'Bank Account';
    Cells[colID,0] := 'Id';

  end;
  ArrangColSize;
end;

procedure TfrmAccountKelola.LoadData;
var AcountArr : TAccount_Arr;
  i : Integer;
begin

  AcountArr := TAccount_Arr.Create;
  InitGrid;
  SetFilter;
  AcountArr.FindOnDB();
  frmMainMenu.Gauge.Show;
  Screen.Cursor := crSQLWait;
  for i:= 0 to AcountArr.Count-1 do begin
    frmMainMenu.Gauge.Progress := round((100/AcountArr.Count)*i);
    Bevel1.Update;
    asgAccount.Update;
    asgAccount.Cells[colCode, i+1]  := AcountArr[i].AccCode;
    asgAccount.Cells[colName, i+1]  := AcountArr[i].AccName; // EkstrakString(AcountArr[i].MoneyName, ';', 1);
    asgAccount.Cells[colTipe, i+1]  := IfThen(AcountArr[i].DbCrType= DB_CR_TYPE_DEBIT, 'Debit', 'Kredit');
//    asgAccount.Cells[colBank, i+1]  := AcountArr[i].BankName;// EkstrakString(AcountArr[i].MoneyName, ';', 3);
 //   asgAccount.Cells[colAccNum,i+1] := AcountArr[i].AccountNumber;
    asgAccount.Ints[colId, i+1]  := AcountArr[i].AccId;
    asgAccount.AddRow;
  end;
  Screen.Cursor := crDefault;
  frmMainMenu.Gauge.Hide;
  DeleteRowTerakhir(asgAccount,1,1);
  ArrangColSize;
  AcountArr.Free;
end;

procedure TfrmAccountKelola.SetFilter;
begin
{  AcountArr.Filter.Reset;
  if (cmbTipe.ItemIndex>0) then
    AcountArr.Filter.MoneyType  := ListTipe.Names[cmbTipe.ItemIndex];}
end;

procedure TfrmAccountKelola.asgAccountGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ACol = colNo then HAlign:= taRightJustify;
  if ARow = 0 then HAlign:= taCenter;
end;

procedure TfrmAccountKelola.FormDestroy(Sender: TObject);
begin
//  DestroyList;
end;

procedure TfrmAccountKelola.FormCreate(Sender: TObject);
begin
//   CreateList;
end;

procedure TfrmAccountKelola.btnOKClick(Sender: TObject);
begin
 
  LoadData;
end;

procedure TfrmAccountKelola.btnResetClick(Sender: TObject);
begin
  InitFilter
end;

procedure TfrmAccountKelola.btnFilterClick(Sender: TObject);
begin
 SetFilterSize(pnlFilter, btnFilter,90);
end;

procedure TfrmAccountKelola.btnAddClick(Sender: TObject);
begin
   frmAccountAdd.Execute(0);
  LoadData;
end;

procedure TfrmAccountKelola.btnEditClick(Sender: TObject);
begin
  if asgAccount.Row = 0 then exit;
  frmAccountAdd.Execute(asgAccount.Ints[colId, asgAccount.Row]);
  LoadData;
end;

procedure TfrmAccountKelola.btnPrintClick(Sender: TObject);
begin
  Alert(MSG_UNDERCONSTRUCTION);
{   Application.CreateForm(TqrpKelolaAccount,qrpKelolaAccount);
   qrpKelolaAccount.Executes(asgAccount, AcountArr);
   qrpKelolaAccount.Free;}
end;

end.
