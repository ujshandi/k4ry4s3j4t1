unit KartuStok;
{******************************************}
{                                          }
{    Copyright(C) work@home                }
{                                          }
{           All rights reserved            }
{
 28.06.07  nilai stok di lov dengan di rekap beda karena salah fungsi get_stok_total_periodeNew

{                                          }
{                                          }
{******************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, ExtCtrls,UMaster,strUtils,
  AdvEdit, Menus, SUIButton;

type
  TfrmKartuStok = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    d: TBevel;
    l: TLabel;
    btnReset: TButton;
    cmbOpr1: TComboBox;
    dtpDari1: TDateTimePicker;
    dtpSampai1: TDateTimePicker;
    StaticText1: TStaticText;
    Panel1: TPanel;
    Panel2: TPanel;
    asgRekap: TAdvStringGrid;
    btnPrint: TButton;
    btnFilter: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDetail: TButton;
    btnOk: TButton;
    StaticText2: TStaticText;
    Bevel1: TBevel;
    StaticText3: TStaticText;
    Bevel2: TBevel;
    rbKartu: TRadioButton;
    rbRekap: TRadioButton;
    StaticText4: TStaticText;
    rbGlobal: TRadioButton;
    Label15: TLabel;
    txtKode: TAdvEdit;
    Label14: TLabel;
    txtNama: TAdvEdit;
    chkNol: TCheckBox;
    rbRekapDetail: TRadioButton;
    PopupMenu1: TPopupMenu;
    BenerinStock1: TMenuItem;
    Label1: TLabel;
    txtLimit: TAdvEdit;
    spdFirst: TsuiButton;
    spdPrev: TsuiButton;
    spdNext: TsuiButton;
    spdLast: TsuiButton;
    lblHal: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRekapExpandNode(Sender: TObject; ARow, ARowreal: Integer);
    procedure rbKartuClick(Sender: TObject);
    procedure rbRekapClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure rbGlobalClick(Sender: TObject);
    procedure cmbOpr1Change(Sender: TObject);
    procedure txtKodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbRekapDetailClick(Sender: TObject);
    procedure BenerinStock1Click(Sender: TObject);
    procedure asgRekapRightClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure Label1Click(Sender: TObject);
    procedure spdLastClick(Sender: TObject);
    procedure spdNextClick(Sender: TObject);
    procedure spdPrevClick(Sender: TObject);
    procedure spdFirstClick(Sender: TObject);
  private
    { Private declarations }
    MasterPurpose : string;
    halaman,totalHalaman : integer;
    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadGrid;
    procedure ReloadValue;
//    procedure RekapStok;
    procedure RekapStok2;
    procedure RekapGlobal;
    procedure RekapStokDetail;//ADA NILAI PERSEDIAAN
//    procedure RekapStokDetail2;//TIDAK ADA NILAI PERSEDIAAN
  public

    function Execute:boolean;
    procedure ExecuteValue;
  end;

var
  frmKartuStok: TfrmKartuStok;
const
  {untuk IN_UNIT}
  colNo = 0;
  colCode = 1;      colDate = 1;
  colName = 2;      colTrans = 2;
  colUNit = 3;      colSAwal = 3;
  colLimit= 4;      colQtyIn   = 4;
  colConversion=5;  colQtyOut = 5;
                    ColSaldo = 6;
                    colNotes = 7;
  colItemId = 8;
  colTransId = 9;

  {untuk IN_VALUE}
  colvNo = 0;
  colvCode = 1;    colvDate = 1;
  colvName = 2;    colvTrans = 2;
  colvUnit = 3;    colvQtyIn = 3;
  colvUnit2 = 4;   colvPriceIn = 4;
  colvPrice = 5;   colvValueIn = 5;
  colvConversion=6; colvQtyOut = 6;
                   colvPriceOut = 7;
                   colvValueOut = 8;
                   colvSaldo = 9;
                   colvNotes = 10;
  colvItemId = 11;
  colvTransId = 12;

  //ntuk IN_REKAP old ada niulai persediaan
  colzNo = 0;
  colzCode = 1;     colzDate = 1;
  colzName = 2;     colzPrice = 2;
  colzUnit = 3;     colzBalance = 3;
  colzLimit = 4;    colzValue = 4;
  colzItemId = 5;
  colzBalanceId=6;

  {untuk IN_REKAP old
  colrNo = 0;
  colrCode = 1;     colrDate = 1;
  colrName = 2;     colrPrice = 2;
  colrUnit = 3;     colrBalance = 3;
  colrLimit = 4;    colrMasuk = 4;
                    colrKeluar = 5;
                    colrSakhir = 6;
  colrItemId = 7;
  colrBalanceId=8;}

  {utk rekap new}
  colrNo = 0;
  colrCode = 1;     //colrDate = 1;
  colrName = 2;     //colrPrice = 2;
  colrUnit = 3;     colrBalance = 5;
  colrLimit = 4;    colrMasuk = 6;
                    colrKeluar = 7;
                    colrSakhir = 8;
  colrItemId = 9;
//colrBalanceId=8;

  {UNTUK in_global}
  colgCode = 1;
  colgName = 2;
  colgStok = 3;
  colgPrice= 4;
  colgPersediaan = 5;

  IN_VALUE = 'V';
  IN_UNIT  = 'U';
  IN_REKAP = 'R';
  IN_GLOBAL = 'G';
  IN_REKAP_DETAIL = 'D';
implementation

uses MainMenu, UConst, Subroutines, un_ryu, SQLServerConnections, AutoBengkel,
  UTransaction, KartuStokPrint, StokGlobalPrint, StokRekaplPrint, LOVFlat,
  StokRekapDetailPrint;

{$R *.dfm}

{ TfrmKartuStok }

procedure TfrmKartuStok.ArrangeColSize;
begin
  asgRekap.AutoSizeColumns(True,5);
  asgRekap.ColWidths[colNo] := 45;
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  case MasterPurpose[1] of
  IN_UNIT : begin
      asgRekap.ColWidths[colItemId]:= 0;
      asgRekap.ColWidths[colTransId]:= 0;
    end;
  IN_VALUE : begin
      asgRekap.ColWidths[colvItemId]:= 0;
      asgRekap.ColWidths[colvTransId]:= 0;
    end;
  IN_REKAP : begin
      asgRekap.ColWidths[colrItemId]:= 0;
      //asgRekap.ColWidths[colrBalanceId]:= 0;
    end;
  IN_GLOBAL : begin
    asgRekap.ColWidths[colgPersediaan+1] :=0;
  end;
  IN_REKAP_DETAIL : begin
      asgRekap.ColWidths[colzItemId]:= 0;
      asgRekap.ColWidths[colzBalanceId]:= 0;
    end;
  end;
end;

function TfrmKartuStok.Execute: boolean;
begin
  Result := True;
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  halaman := 1; totalHalaman := 0;
  MasterPurpose := IN_UNIT;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter,100);
//  if G_ITEM_LIST.Count = 0 then
  //  TItems.getListName(G_ITEM_LIST);
  Result := True;
  InitForm;
  //btnOk.Click;
  Run(Self);
end;

procedure TfrmKartuStok.InitFIlter;
begin

  //NameValueListToValueList(G_ITEM_LIST,cmbBahan.Items);
  //cmbBahan.ItemIndex:= 0;
  cmbOpr1.ItemIndex    := cmbOpr1.Items.Count-1;
  chkNol.Checked := False;
  cmbOpr1Change(Self);
  txtKode.Clear;
  txtNama.Clear;
  dtpSampai1.Enabled:= (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
  dtpDari1.Date     := ServerNow-7;
  dtpSampai1.Date   := ServerNow;
  txtLimit.IntValue := 25;
  halaman := 1;totalHalaman :=0;
end;

procedure TfrmKartuStok.InitForm;
begin
  StaticText1.Font.Color := clBlack;
  
  rbGlobal.Checked := True;
  rbGlobalClick(Self);
  InitFIlter;
  InitGrid;
  MainPanel.Update;
end;

procedure TfrmKartuStok.InitGrid;
begin
  asgRekap.ExpandAll;
  asgRekap.Clear;
  asgRekap.SortSettings.Show := False;
  asgRekap.FloatingFooter.Visible := False;
  case MasterPurpose[1] of
  IN_UNIT : begin
      ResetGrid(asgRekap,2,11,1,1);
      with asgRekap do begin
         Cells[colNo,0]     := 'No.';
         Cells[colCode,0]   := 'Kode Part ';
         Cells[colName,0]   := 'Nama Part';
         Cells[colUnit,0]   := 'Satuan';
         Cells[colLimit,0]  := 'Limit Stok';
         MergeCells(colLimit+1,0,3,1);
         Cells[colItemID,0] := 'ItemID';
         Cells[colTransID,0]:= 'TransID';
      end;
    end;
  IN_VALUE : begin
      ResetGrid(asgRekap,2,14,1,1);
      with asgRekap do begin
         Cells[colvNo,0]      := 'No.';
         Cells[colvCode,0]    := 'Kode Part';
         Cells[colvName,0]    := 'Nama Part';
         Cells[colvUnit,0]    := 'Used Unit';
         Cells[colvUnit2,0]   := 'Purchase Unit';
         Cells[colvPrice,0]   := 'Purchase Price';
         Cells[colvCOnversion,0]:= 'Conversion';
         Cells[colvItemID,0]  := 'ItemID';
         Cells[colvTransID,0] := 'TransID';
      end;
    end;
  IN_REKAP : begin
      //rekap stok
      {ResetGrid(asgRekap,2,8,1,1);
      with asgRekap do begin
         Cells[colrNo,0]    := 'No.';
         Cells[colrCode,0]  := 'Kode Part';
         Cells[colrName,0]  := 'Nama Part';
         Cells[colrUnit,0]  := 'Satuan';
         Cells[colrLimit,0] := 'Limit Stok';
         Cells[colrItemID,0]:= 'ItemID';
         Cells[colrBalanceID,0]  := 'BalanceID';
      end;}
      //rekap stok 2
      ResetGrid(asgRekap,3,11,1,1);
      asgRekap.FloatingFooter.Visible := True;
      asgRekap.SortSettings.Show := True;
      with asgRekap do begin
         Cells[colrNo,0]    := 'No.';
         Cells[colrCode,0]  := 'Kode Part';
         Cells[colrName,0]  := 'Nama Part';
         Cells[colrUnit,0]  := 'Satuan';
         Cells[colrLimit,0] := 'Limit Stok';
         Cells[colrBalance,0] := 'Stok Awal';
         Cells[colrMasuk,0] := 'Total Masuk';
         Cells[colrKeluar,0]:= 'Total Keluar';
         Cells[colrSAkhir,0]:= 'Stok akhir';
         Cells[colrItemID,0]:= 'ItemID';
//         Cells[colrBalanceID,0]  := 'BalanceID';
      end;

    end;
  IN_GLOBAL : begin
     ResetGrid(asgRekap,3,7,1,1);
     asgRekap.FloatingFooter.Visible := True;
     asgRekap.SortSettings.Show := True;
      with asgRekap do begin
         Cells[colrNo,0]    := 'No.';
         Cells[colgCode,0]  := 'Kode Part';
         Cells[colgName,0]  := 'Nama Part';
         Cells[colgStok,0]  := 'Stok';
         Cells[colgPrice,0] := 'H.Beli';//'H.Jual';
         Cells[colgPersediaan,0] := 'Nilai Persediaan';
      end;
  end;
  IN_REKAP_DETAIL : BEGIN
    ResetGrid(asgRekap,3,8,1,1);
      asgRekap.FloatingFooter.Visible := True;
      asgRekap.SortSettings.Show := True;
      with asgRekap do begin
         Cells[colzNo,0]    := 'No.';
         Cells[colzCode,0]  := 'Kd.Part/Barang';
         Cells[colzName,0]  := 'Nama Part/Barang';
         Cells[colzUnit,0]  := 'Satuan';
         Cells[colzLimit,0] := 'Limit Stok';
         Cells[colzBalance,0] := 'Stok Awal';
         Cells[colzItemID,0]:= 'ItemID';
         Cells[colzBalanceID,0]  := 'BalanceID';
      end;
   end;
  end;

  ArrangeColSize;
end;

procedure TfrmKartuStok.ReloadGrid;
var vITem : TItems_Arr;
   i,j,vRow1,vRow2:integer;
    vDetail : TItemDetail_Arr;
    vDate : TDate;
    vSaldo : Double;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
     if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
       vDate := 0
     else
       vDate := dtpDari1.Date;
     with vITem.Filter do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
//       if cmbBahan.ItemIndex <> -1 then
  //        ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
     end;
   end;

   procedure setHeader(aRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colDate,aRow,colNotes);
     with asgRekap do begin
       Cells[colDate,aRow] := 'Tanggal';
       Cells[colTrans,aRow]:= 'No.Transaksi';
       Cells[colSAWal,aRow]:= 'S.Awal';
       Cells[colQtyIn,aRow] := 'Qty.Masuk';
       Cells[colQtyOut,aRow]:= 'Qty.Keluar';
       Cells[colSaldo,aRow] := 'S.Akhir';
       Cells[colNotes,aRow] := 'Keterangan';
     end;
   end;

begin
  try
    Screen.Cursor := crSQLWait;
    vITem := TItems_Arr.Create;
    vDetail := TItemDetail_Arr.Create;
    InitGrid;
    setFilter;
    totalHalaman := vITem.countFindFlat(True,chkNol.Checked) div  txtLimit.IntValue + 1;
    lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
    vITem.FindFlat(True,chkNol.Checked,False,txtLimit.IntValue,((halaman-1)*txtLimit.IntValue));
    frmMainMenu.Gauge.Show;
    for i:= 0 to vITem.Count-1 do begin
      frmMainMenu.Gauge.Progress := round((i+1)/(vITem.Count)*100);
      asgRekap.Update;
      vRow1 := asgRekap.RowCount-1;
//      asgRekap.Ints[colNo,vRow1]    := i+1;
      asgRekap.Ints[colNo,vRow1] := (i+1)+((halaman-1)*txtLimit.IntValue);
      asgRekap.Cells[colCOde,vRow1] := vITem[i].ItemCode;
      asgRekap.Cells[colName,vRow1] := vITem[i].ItemName;
      asgRekap.Ints[colItemId,vRow1]:= vITem[i].ItemId;
      asgRekap.Cells[colUnit,vRow1] := vITem[i].UsedUnit;
      asgRekap.Ints[colLimit,vRow1]:= vITem[i].StokLimit;
      asgRekap.MergeCells(colLimit+1,vRow1,3,1);
      vDetail.Filter.ItemBalance.Items.ItemId := vITem[i].ItemId;
      vDetail.FindKartuStok;

      asgRekap.AddRow;
      setHeader(asgRekap.RowCount-1);
      asgRekap.AddRow;
      vRow2 := asgRekap.RowCount-1;
      asgRekap.Ints[colTransId,vRow2]:= 1;
      vSaldo := TItems.getStokTotalPeriodeNew(vITem[i].ItemId,vDate);//TItems.getStokTotalPeriode(vITem[i].ItemId,vDate); //29.06.07  
      asgRekap.Floats[colSAwal,vRow2] := vSaldo;
      asgRekap.Floats[colSaldo,vRow2] := vSaldo;
      for j:= 0 to vDetail.Count-1 do begin
        asgRekap.AddRow;
        vRow2 := asgRekap.RowCount-1;
        asgRekap.Cells[colDate,vRow2] := NewFormatDate(vDetail[j].Shipment.ShipDate);
        asgRekap.Cells[colTrans,vRow2]:= vDetail[j].Shipment.ShipNum;
        if vDetail[j].DbCrType = DB_CR_TYPE_DEBIT then begin
          asgRekap.Floats[colQtyIn,vRow2] := vDetail[j].Quantity;
          vSaldo := vSaldo + vDetail[j].Quantity;
        end
        else begin
          asgRekap.Floats[colQtyOut,vRow2]:= vDetail[j].Quantity;
          vSaldo := vSaldo - vDetail[j].Quantity;
        end;
        asgRekap.Floats[colSaldo,vRow2]   := vSaldo;
        asgRekap.Ints[colTransId, vRow2]  := vDetail[j].Shipment.ShipId;
        asgRekap.Cells[colNotes,vRow2]    := TShipment.getDesc(vDetail[j].Shipment.ShipType);
      end;
      if asgRekap.Floats[colSaldo,vRow2] < asgRekap.Floats[colLimit,vRow1] then
        SetCellColor(asgRekap,clRed,colCode,vRow1,colLimit);
      asgRekap.AddRow;
      asgRekap.AddNode(vRow1,vRow2-vRow1+1);
    end;
    DeleteRowTerakhir(asgRekap,2,1);
    asgRekap.ContractAll;
  finally
    frmMainMenu.Gauge.Hide;
    Screen.Cursor := crDefault;
    ArrangeColSize;
    vITem.Free;
  end;
end;

procedure TfrmKartuStok.btnOkClick(Sender: TObject);
begin
   if (txtKode.Text = '') and (txtNama.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;

   halaman := 1;
  totalHalaman :=0;
  spdFirst.Enabled:= False;
  spdPrev.Enabled:= False;    
   case MasterPurpose[1] of
    IN_UNIT :  ReloadGrid;  //kartu stok
    IN_VALUE : ReloadValue;
    IN_REKAP : RekapStok2;
    IN_GLOBAL : RekapGlobal;
    IN_REKAP_DETAIL : RekapStokDetail;
   end;
    spdNext.Enabled:= (halaman< totalHalaman);
    spdLast.Enabled:= (halaman< totalHalaman);
end;

procedure TfrmKartuStok.btnResetClick(Sender: TObject);
begin
  InitFIlter;
end;

procedure TfrmKartuStok.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,100);
end;

procedure TfrmKartuStok.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  case MasterPurpose[1] of
  IN_UNIT : begin
      if ARow = 0 then
         HAlign := taCenter
       else if (asgRekap.Ints[colItemID,ARow] = 0)and (asgRekap.Ints[colTransId,ARow] = 0) then
         HAlign := taCenter
       else if (asgRekap.Ints[colTransID,ARow] > 0) then begin
         if ACol in [colQtyIn,colQtyOut,colSaldo,colSAwal] then
           HAlign := taRightJustify;
       end
       else if ACol in [colLimit] then
         HAlign := taRightJustify;
     end;
  IN_VALUE : begin
        if ARow = 0 then
         HAlign := taCenter
       else if (asgRekap.Ints[colvItemID,ARow] = 0)and (asgRekap.Ints[colvTransId,ARow] = 0) then begin
         HAlign := taCenter;
         if (asgRekap.Cells[colvTrans,ARow] = 'Total') and (ACol in [colvValueIn,colvValueOut]) then
             HAlign := taRightJustify;
       end
       else if (asgRekap.Ints[colvTransID,ARow] > 0) then begin
         if ACol in [colvQtyIn,colvQtyOut,colvSaldo,colvPriceIn,colvValueIn,colvPriceOut,colvValueOut] then
           HAlign := taRightJustify;
       end
       else if ACol in [colConversion,colvPrice] then
         HAlign := taRightJustify;
     end;
   IN_REKAP : begin
      if ARow = 0 then
         HAlign := taCenter
      else if ACol in [colrBalance,colrMasuk,colrKeluar,colrSAkhir,colrLimit] then
         HAlign := taRightJustify; 

      {else if (asgRekap.Ints[colrItemID,ARow] = 0)and (asgRekap.Ints[colrBalanceId,ARow] = 0) then begin
         HAlign := taCenter;
         if (asgRekap.Cells[colrPrice,ARow] = 'Total') and (ACol in [colrBalance,colrMasuk,colrKeluar,colrSAkhir]) then
             HAlign := taRightJustify;
      end
      else if (asgRekap.Ints[colrBalanceID,ARow] > 0) then begin
        if ACol in [colrPrice,colrBalance,colrMasuk,colrKeluar,colrSAkhir] then
          HAlign := taRightJustify;
      end
      else if ACol in [colrLimit] then
         HAlign := taRightJustify;}
     end;
     IN_REKAP_DETAIL : begin
       if ARow = 0 then
         HAlign := taCenter
      else if (asgRekap.Ints[colzItemID,ARow] = 0)and (asgRekap.Ints[colzBalanceId,ARow] = 0) then begin
         HAlign := taCenter;
         if (asgRekap.Cells[colzPrice,ARow] = 'Total') and (ACol in [colzBalance,colzValue]) then
             HAlign := taRightJustify;
      end
      else if (asgRekap.Ints[colzBalanceID,ARow] > 0) then begin
        if ACol in [colzPrice,colzBalance,colzValue] then
          HAlign := taRightJustify;
      end
      else if ACol in [colzLimit] then
         HAlign := taRightJustify;
     end;
     IN_GLOBAL : begin
      if ARow = 0 then
         HAlign := taCenter
      else if ACol in [colgStok,colgPrice,colgPersediaan] then
         HAlign := taRightJustify;
     end;
  end;
end;

procedure TfrmKartuStok.ExecuteValue;
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  halaman := 1; totalHalaman := 0;
  MasterPurpose := IN_VALUE;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter,100);
  //if G_ITEM_LIST.Count = 0 then
    //TItems.getListName(G_ITEM_LIST);
  InitForm;
//  btnOk.Click;
  Run(Self);
end;

procedure TfrmKartuStok.ReloadValue;
var vITem : TItems_Arr;
   i,j,vRow1,vRow2:integer;
    vDetail : TItemDetail_Arr;
    vDate : TDate;
    vSaldo : Double;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
     if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
       vDate := 0
     else
       vDate := dtpDari1.Date;
     with vITem.Filter do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
//       if cmbBahan.ItemIndex <> -1 then
  //        ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
     end;
   end;

   procedure setHeader(aRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colvDate,aRow,colvNotes);
     with asgRekap do begin
       Cells[colvDate,aRow] := 'Date';
       Cells[colvTrans,aRow]:= 'Trans.Number';
       Cells[colvQtyIn,aRow] := 'Qty.In';
       Cells[colvPriceIn,aRow] := 'Price In';
       Cells[colvValueIn,aRow] := 'Value In';
       Cells[colvQtyOut,aRow]:= 'Qty.Out';
       Cells[colvPriceOut,aRow] := 'Price Out';
       Cells[colvValueOut,aRow] := 'Value Out';
       Cells[colvSaldo,aRow] := 'Balance';
       Cells[colvNotes,aRow] := 'Notes';
     end;
   end;

   procedure setFooter(aRow:integer);
   begin
      SetCellColor(asgRekap,clSkyBlue,colvDate,aRow,colvNotes);
     with asgRekap do begin
       Cells[colvTrans,aRow]:= 'Total';
     end;
   end;

begin
  vITem := TItems_Arr.Create;
  vDetail := TItemDetail_Arr.Create;
  InitGrid;
  setFilter;
  totalHalaman := vITem.countFindFlat(False,True) div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
  vITem.FindFlat(False,True,False,txtLimit.IntValue,((halaman-1)*txtLimit.IntValue));
  for i:= 0 to vITem.Count-1 do begin
    asgRekap.Update;
    vRow1 := asgRekap.RowCount-1;
   // asgRekap.Ints[colvNo,vRow1]    := i+1;
    asgRekap.Ints[colvNo,vRow1] := (i+1)+((halaman-1)*txtLimit.IntValue);
    asgRekap.Cells[colvCOde,vRow1] := vITem[i].ItemCode;
    asgRekap.Cells[colvName,vRow1] := vITem[i].ItemName;
    asgRekap.Ints[colvItemId,vRow1]:= vITem[i].ItemId;
    asgRekap.Cells[colvUnit,vRow1] := vITem[i].UsedUnit;
    asgRekap.Cells[colvUnit2,vRow1]:= vITem[i].PurchaseUnit;
    asgRekap.Floats[colvConversion,vRow1]:= vITem[i].Conversion;
    vDetail.Filter.ItemBalance.Items.ItemId := vITem[i].ItemId;
    vDetail.FindKartuStok;
    asgRekap.AddRow;
    setHeader(asgRekap.RowCount-1);
    asgRekap.AddRow;
    vRow2 := asgRekap.RowCount-1;
    asgRekap.Cells[colvTrans,vRow2] := 'Saldo Awal';
    asgRekap.Ints[colvTransId,vRow2]:= 1;
    vSaldo := TItems.getStokTotalPeriode(vITem[i].ItemId,vDate);
    asgRekap.Floats[colvSaldo,vRow2] := vSaldo;
    for j:= 0 to vDetail.Count-1 do begin
      asgRekap.AddRow;
      vRow2 := asgRekap.RowCount-1;
      asgRekap.Cells[colvDate,vRow2] := FormatDateTime(ShortDateFormat,vDetail[j].Shipment.ShipDate);
      asgRekap.Cells[colvTrans,vRow2]:= vDetail[j].Shipment.ShipNum;
      if vDetail[j].DbCrType = DB_CR_TYPE_DEBIT then begin
        asgRekap.Floats[colvQtyIn,vRow2] := vDetail[j].Quantity;
        asgRekap.Floats[colvPriceIn,vRow2] := vDetail[j].Price;
        asgRekap.Floats[colvValueIn,vRow2] := vDetail[j].Amount;
        vSaldo := vSaldo + vDetail[j].Quantity;
      end
      else begin
        asgRekap.Floats[colvQtyOut,vRow2]:= vDetail[j].Quantity;
        asgRekap.Floats[colvPriceOut,vRow2] := vDetail[j].Price;
        asgRekap.Floats[colvValueOut,vRow2] := vDetail[j].Amount;
        vSaldo := vSaldo - vDetail[j].Quantity;
      end;
      asgRekap.Floats[colvSaldo,vRow2]   := vSaldo;
      asgRekap.Ints[colvTransId, vRow2]  := vDetail[j].Shipment.ShipId;
      asgRekap.Cells[colvNotes,vRow2]    := TShipment.getDesc(vDetail[j].Shipment.ShipType);
    end;
    asgRekap.AddRow;
    vRow2 := asgRekap.RowCount-1;
    setFooter(vRow2);
    asgRekap.Floats[colvValueIn,vRow2]:= asgRekap.ColumnSum(colvValueIn,vRow1+2,vRow2-1);
    asgRekap.Floats[colvValueOut,vRow2]:= asgRekap.ColumnSum(colvValueOut,vRow1+2,vRow2-1);

    asgRekap.AddRow;
    asgRekap.AddNode(vRow1,vRow2-vRow1+1);
  end;
  DeleteRowTerakhir(asgRekap,2,1);
  asgRekap.ContractAll;
  ArrangeColSize;
  vITem.Free;
  with vITem do begin
    try
      FindOnDb
    finally
      Free;
    end;
  end;
end;

procedure TfrmKartuStok.asgRekapExpandNode(Sender: TObject; ARow,
  ARowreal: Integer);
begin
  ArrangeColSize;
end;

{procedure TfrmKartuStok.RekapStok;
var vITem : TItems_Arr;
   i,j,vRow1,vRow2:integer;
    vDetail : TItemDetail_Arr;
    vDate : TDate;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
     if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
       vDate := 0
     else
       vDate := dtpDari1.Date;
     with vITem.Filter do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
//       if cmbBahan.ItemIndex <> -1 then
  //        ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
     end;
   end;

   procedure setHeader(aRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colrDate,aRow,colrBalance);
     with asgRekap do begin
       Cells[colrDate,aRow] := 'Tanggal';
       Cells[colrBalance,aRow]:= 'Stok';
       Cells[colrPrice,aRow] := 'Harga';
     end;
   end;

   procedure SetFooter(vRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colrDate,vRow,colrBalance);
     with asgRekap do begin
       Cells[colrPrice,vRow] := 'Total';
     end;
   end;

begin
  try
    Screen.Cursor := crSQLWait;
    vITem := TItems_Arr.Create;
    vDetail := TItemDetail_Arr.Create;
    InitGrid;
    setFilter;
    vITem.FindFlat;
    frmMainMenu.Gauge.Show;
    for i:= 0 to vITem.Count-1 do begin
      asgRekap.Update;
      frmMainMenu.Gauge.Progress := round((i+1)/(vITem.Count)*100);
      vRow1 := asgRekap.RowCount-1;
      asgRekap.Ints[colrNo,vRow1]    := i+1;
      asgRekap.Cells[colrCOde,vRow1] := vITem[i].ItemCode;
      asgRekap.Cells[colrName,vRow1] := vITem[i].ItemName;
      asgRekap.Ints[colrItemId,vRow1]:= vITem[i].ItemId;
      asgRekap.Cells[colrUnit,vRow1] := vITem[i].UsedUnit;
      asgRekap.Ints[colrLimit,vRow1]:= vITem[i].StokLimit;
      vDetail.Clear;
      vDetail.Filter.ItemBalance.Items.ItemId := vITem[i].ItemId;
      vDetail.FindRekapStok;
      asgRekap.AddRow;
      setHeader(asgRekap.RowCount-1);
      for j:= 0 to vDetail.Count-1 do begin
        asgRekap.AddRow;
        vRow2 := asgRekap.RowCount-1;
        asgRekap.Cells[colrDate,vRow2] := NewFormatDate(vDetail[j].ItemBalance.BalanceDate);
        asgRekap.Floats[colrPrice,vRow2]:= vDetail[j].ItemBalance.Price;  //vDetail[j].Quantity;
        asgRekap.Floats[colrBalance,vRow2]   := vDetail[j].ItemBalance.Balance;//vSaldo;
        asgRekap.Ints[colrBalanceId, vRow2]  := vDetail[j].ItemBalance.ItemBalanceId;
      end;
      asgRekap.AddRow;
      vRow2 := asgRekap.RowCount-1;
      SetFooter(vRow2);
      asgRekap.Floats[colrBalance,vRow2] := asgRekap.ColumnSum(colrBalance,vRow1+2,vRow2-1);
      if asgRekap.Floats[colrBalance,vRow2] < asgRekap.Floats[colrLimit,vRow1] then
        SetCellColor(asgRekap,clRed,colrCode,vRow1,colrLimit);
      asgRekap.AddRow;
      asgRekap.AddNode(vRow1,vRow2-vRow1+1);
    end;
    DeleteRowTerakhir(asgRekap,2,1);
  finally
    Screen.Cursor := crDefault;
    frmMainMenu.Gauge.Hide;
    asgRekap.ContractAll;
    ArrangeColSize;
    vITem.Free;
  end;
end;         }

procedure TfrmKartuStok.rbKartuClick(Sender: TObject);
begin
  MasterPurpose := IN_UNIT;
end;

procedure TfrmKartuStok.rbRekapClick(Sender: TObject);
begin
  MasterPurpose := IN_REKAP;
end;

procedure TfrmKartuStok.btnPrintClick(Sender: TObject);
begin
  if rbKartu.Checked then begin
    Application.CreateForm(TqrpKartuStok,qrpKartuStok);
    qrpKartuStok.Executes(asgRekap);
    qrpKartuStok.Free;
  end;
  if rbGlobal.Checked then begin
    Application.CreateForm(TqrpStokGlobal,qrpStokGlobal);
    qrpStokGlobal.Executes(asgRekap);
    qrpStokGlobal.Free;
  end;
  if rbRekap.Checked then begin
    Application.CreateForm(TqrpStokRekap,qrpStokRekap);
    qrpStokRekap.Executes(asgRekap);
    qrpStokRekap.Free;
  end;
  if rbRekapDetail.Checked then begin
    Application.CreateForm(TqrpStokRekapDetail,qrpStokRekapDetail);
    qrpStokRekapDetail.Executes(asgRekap);
    qrpStokRekapDetail.Free;
  end;
  ArrangeColSize;
end;

procedure TfrmKartuStok.rbGlobalClick(Sender: TObject);
begin
  MasterPurpose := IN_GLOBAL;
end;

procedure TfrmKartuStok.RekapGlobal;
var vITem : TItems_Arr;
   i,vRow1:integer;
   vDate : TDate;
   vMaxPrice : Double;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
     if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) or
        (GlobalPeriode.OpPeriodeAwal1 = soEquals) then
       vDate := dtpDari1.Date
     else
       vDate := dtpSampai1.Date;
     with vITem.Filter do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
//       if cmbBahan.ItemIndex <> -1 then
  //        ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
     end;
   end;

begin
  try
    Screen.Cursor := crSQLWait;
    frmMainMenu.Gauge.Show;
    vITem := TItems_Arr.Create;
    InitGrid;
    setFilter;
    totalHalaman := vITem.countFindFlat(True,chkNol.Checked) div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
    vITem.FindFlat(True,chkNol.Checked,false,txtLimit.IntValue,((halaman-1)*txtLimit.IntValue));
    for i:= 0 to vITem.Count-1 do begin
      asgRekap.Update;
      frmMainMenu.Gauge.Progress := round((i+1)/(vITem.Count)*100);
      vRow1 := asgRekap.RowCount-2;
//      asgRekap.Ints[colrNo,vRow1]    := i+1;
      asgRekap.Ints[colrNo,vRow1] := (i+1)+((halaman-1)*txtLimit.IntValue);
      asgRekap.Cells[colgCOde,vRow1] := vITem[i].ItemCode;
      asgRekap.Cells[colgName,vRow1] := vITem[i].ItemName;
      asgRekap.Floats[colgStok,vRow1]  := TItems.getStokTotalPeriodeNew(vITem[i].ItemId,vDate,False);//TItems.getStokTotal(vITem[i].ItemId);
      //28.06.07 //
      vMaxPrice := TItemPricePurchase.getPriceActive(vITem[i].ItemId); //TItems.getMaxPriceBel(SHIP_TYPE_TERIMA_BARANG,vITem[i].ItemId,SHIP_TYPE_MUTASI_MASUK);
      asgRekap.Floats[colgPrice,vRow1] := IfThen(vMaxPrice>0,vMaxPrice,vITem[i].PricePurchase); //vITem[i].Price;
      asgRekap.Floats[colgPersediaan,vRow1] := asgRekap.Floats[colgPrice,vRow1] * asgRekap.Floats[colgStok,vRow1];
      //02.10.07  --diganti degan pengalian kolom qty * harga we...
      //TItemBalance.getNilaiPersediaan(vITem[i].ItemId,GlobalPeriode,True); //02.10.07 ditambah with balance date
      asgRekap.AddRow;
    end;
    DeleteRowTerakhir(asgRekap,3,1);
    asgRekap.Cells[colgName,asgRekap.RowCount-1] := 'Total';
  //  asgRekap.Floats[colgStok,asgRekap.RowCount-1]:= asgRekap.ColumnSum(colgStok,1,asgRekap.RowCount-2);
    asgRekap.FloatingFooter.ColumnCalc[colgStok] := acSUM;
    asgRekap.FloatingFooter.ColumnCalc[colgPersediaan] := acSUM;
  finally
    frmMainMenu.Gauge.Hide;
    Screen.Cursor := crDefault;
    ArrangeColSize;
    vITem.Free;
  end;
end;

procedure TfrmKartuStok.cmbOpr1Change(Sender: TObject);
begin
   dtpSampai1.Enabled := cmbOpr1.ItemIndex=3;
end;

procedure TfrmKartuStok.RekapStok2;
var //vITem : TItems_Arr;
   j,vRow2:integer;
    vDetail : TItemDetail_Arr;
  //  vDate : TDate;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
    { if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
       vDate := 0
     else
       vDate := dtpDari1.Date;}
     //with vITem.Filter do begin
     with vDetail.Filter.ItemBalance.Items do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
     end;

   end;

begin
  try
    Screen.Cursor := crSQLWait;
    vDetail := TItemDetail_Arr.Create;
    InitGrid;
    setFilter;
    frmMainMenu.Gauge.Show;

    totalHalaman := vDetail.countFindRekapStokNew(chkNol.Checked) div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
      vDetail.FindRekapStokNew(chkNol.Checked,txtLimit.IntValue,((halaman-1)*txtLimit.IntValue));
      for j:= 0 to vDetail.Count-1 do begin
        asgRekap.Update;
        frmMainMenu.Gauge.Progress := round((j+1)/(vDetail.Count)*100);
        vRow2 := asgRekap.RowCount-2;
        //asgRekap.Ints[colrNo,vRow2]    := j+1;
        asgRekap.Ints[colrNo,vRow2] := (j+1)+((halaman-1)*txtLimit.IntValue);
        asgRekap.Cells[colrCOde,vRow2] := vDetail[j].ItemBalance.Items.ItemCode;
        asgRekap.Cells[colrName,vRow2] := vDetail[j].ItemBalance.Items.ItemName;
        asgRekap.Ints[colrItemId,vRow2]:= vDetail[j].ItemBalance.Items.ItemId;
        asgRekap.Cells[colrUnit,vRow2] := vDetail[j].ItemBalance.Items.UsedUnit;
        asgRekap.Ints[colrLimit,vRow2] := vDetail[j].ItemBalance.Items.StokLimit;
        asgRekap.Floats[colrBalance,vRow2] := vDetail[j].ItemBalance.Balance;//vSaldo;
        asgRekap.Floats[colrMasuk,vRow2]   := vDetail[j].ItemBalance.DbBalance;
        asgRekap.Floats[colrKeluar,vRow2]  := vDetail[j].ItemBalance.CrBalance;
        asgRekap.Floats[colrsAkhir,vRow2]  := //vDetail[j].Quantity;
        (vDetail[j].ItemBalance.Balance + vDetail[j].ItemBalance.DbBalance -
                                                vDetail[j].ItemBalance.CrBalance);
        if asgRekap.Floats[colrSAkhir,vRow2] < asgRekap.Floats[colrLimit,vRow2] then
          SetCellColor(asgRekap,clRed,colrCode,vRow2,colrSAkhir);
        asgRekap.AddRow;
      end;
       DeleteRowTerakhir(asgRekap,3,1);
       asgRekap.FloatingFooter.ColumnCalc[colrBalance] := acSUM;
       asgRekap.FloatingFooter.ColumnCalc[colrMasuk] := acSUM;
       asgRekap.FloatingFooter.ColumnCalc[colrKeluar] := acSUM;
       asgRekap.FloatingFooter.ColumnCalc[colrSAkhir] := acSUM;

  finally
    Screen.Cursor := crDefault;
    frmMainMenu.Gauge.Hide;
    asgRekap.ContractAll;
    ArrangeColSize;
  end;

end;

procedure TfrmKartuStok.txtKodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId:integer;
begin
  if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtKode.Text,'ITEM','');
    txtKode.Text := TItems.getFieldValue(vId,'item_code');
  end;

end;

procedure TfrmKartuStok.txtNamaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId:integer;
begin
  if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('NAME',txtNama.Text,'ITEM','');
    txtNama.Text := TItems.getFieldValue(vId,'item_name');
  end;
end;

procedure TfrmKartuStok.RekapStokDetail;
var vITem : TItems_Arr;
   i,j,vRow1,vRow2:integer;
    vDetail : TItemBalance_Arr;
    vDate : TDate;
    vGrandBalance,vGrandSTok :Double;
    vStokZero : TBooleanOperator;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     vStokZero := boNone;
     if chkNol.Checked then
//       if rbNol.Checked then
          vStokZero := boTrue;
  //     else if rbNotNol.Checked then
    //     vStokZero := boFalse;

     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
     if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
       vDate := 0
     else
       vDate := dtpDari1.Date;
     with vITem.Filter do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
     end;
   end;

   procedure setHeader(aRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colzDate,aRow,colrBalance);
     with asgRekap do begin
       Cells[colzDate,aRow] := 'Tanggal';
       Cells[colzBalance,aRow]:= 'Stok';
       Cells[colzPrice,aRow] := 'Harga';
       Cells[colzValue,aRow] := 'Nilai Persediaan';
     end;
   end;

   procedure SetFooter(vRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colzDate,vRow,colrBalance);
     with asgRekap do begin
       Cells[colzPrice,vRow] := 'Total';
     end;
   end;

begin
  try
    Screen.Cursor := crSQLWait;
    vITem := TItems_Arr.Create;
    vDetail := TItemBalance_Arr.Create;
    InitGrid;
    setFilter;
    totalHalaman := vITem.countFindFlat() div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
    vITem.FindFlat(false,true,false,txtLimit.IntValue,((halaman-1)*txtLimit.IntValue));
    vGrandBalance := 0; vGrandSTok := 0;
    frmMainMenu.Gauge.Show;
    for i:= 0 to vITem.Count-1 do begin
      asgRekap.Update;
      frmMainMenu.Gauge.Progress := round((i+1)/(vITem.Count)*100);
      vRow1 := asgRekap.RowCount-2;
      //asgRekap.Ints[colzNo,vRow1]    := i+1;
      asgRekap.Ints[colzNo,vRow1] := (i+1)+((halaman-1)*txtLimit.IntValue);
      asgRekap.Cells[colzCOde,vRow1] := vITem[i].ItemCode;
      asgRekap.Cells[colzName,vRow1] := vITem[i].ItemName;
      asgRekap.Ints[colzItemId,vRow1]:= vITem[i].ItemId;
      asgRekap.Cells[colzUnit,vRow1] := vITem[i].UsedUnit;
      asgRekap.Ints[colzLimit,vRow1]:= vITem[i].StokLimit;
      vDetail.Clear;
      vDetail.Filter.Items.ItemId := vITem[i].ItemId;
      vDetail.FindStokValue(vStokZero,true);
      asgRekap.AddRow;
      setHeader(asgRekap.RowCount-2);
      for j:= 0 to vDetail.Count-1 do begin
        asgRekap.AddRow;
        vRow2 := asgRekap.RowCount-2;
        asgRekap.Cells[colzDate,vRow2] := NewFormatDate(vDetail[j].BalanceDate);
        asgRekap.Floats[colzPrice,vRow2]:= vDetail[j].Price;  //vDetail[j].Quantity;
        asgRekap.Floats[colzBalance,vRow2]   := vDetail[j].Balance;//vSaldo;
        asgRekap.Floats[colzValue,vRow2]     := vDetail[j].Price * vDetail[j].Balance;
        vGrandSTok := vGrandSTok + vDetail[j].Balance;
        vGrandBalance := vGrandBalance + asgRekap.Floats[colzValue,vRow2];
        asgRekap.Ints[colzBalanceId, vRow2]  := vDetail[j].ItemBalanceId;
      end;
      asgRekap.AddRow;
      vRow2 := asgRekap.RowCount-2;
      SetFooter(vRow2);
      asgRekap.Floats[colzBalance,vRow2] := asgRekap.ColumnSum(colzBalance,vRow1+2,vRow2-1);
      asgRekap.Floats[colzValue,vRow2] := asgRekap.ColumnSum(colzValue,vRow1+2,vRow2-1);
      if asgRekap.Floats[colzBalance,vRow2] < asgRekap.Floats[colzLimit,vRow1] then
        SetCellColor(asgRekap,clRed,colzCode,vRow1,colzLimit);
      asgRekap.AddRow;
      asgRekap.AddNode(vRow1,vRow2-vRow1+1);
    end;
    DeleteRowTerakhir(asgRekap,3,1);
    //asgRekap.MergeCells(colzPrice,asgRekap.RowCount-1,2,1);
    asgRekap.Cells[colzPrice,asgRekap.RowCount-1] := 'Total Nilai Persediaan';
    asgRekap.Floats[colzValue,asgRekap.RowCount-1] := vGrandBalance;
    asgRekap.Floats[colzBalance,asgRekap.RowCount-1] := vGrandSTok;

  finally
    Screen.Cursor := crDefault;
    frmMainMenu.Gauge.Hide;
    asgRekap.ContractAll;
    ArrangeColSize;
    vITem.Free;
  end;

end; 

procedure TfrmKartuStok.rbRekapDetailClick(Sender: TObject);
begin
  MasterPurpose := IN_REKAP_DETAIL;
end;

{procedure TfrmKartuStok.RekapStokDetail2;
var vITem : TItems_Arr;
   i,j,vRow1,vRow2:integer;
    vDetail : TItemBalance_Arr;
    vDate : TDate;
    vGrandBalance,vGrandSTok :Double;
    vStokZero : TBooleanOperator;
   procedure setFilter;
   begin
     GlobalPeriode.Reset;
     vStokZero := boNone;
     if chkNol.Checked then
//       if rbNol.Checked then
          vStokZero := boTrue;
  //     else if rbNotNol.Checked then
    //     vStokZero := boFalse;

     GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.Date);
     if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
       vDate := 0
     else
       vDate := dtpDari1.Date;
     with vITem.Filter do begin
       Reset;
       ItemCode := txtKode.Text;
       ItemName := txtNama.Text;
     end;
   end;

   procedure setHeader(aRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colzDate,aRow,colrBalance);
     with asgRekap do begin
       Cells[colzDate,aRow] := 'Tanggal';
       Cells[colzBalance,aRow]:= 'Stok';
       Cells[colzPrice,aRow] := 'Harga';
//       Cells[colzValue,aRow] := 'Nilai Persediaan';
     end;
   end;

   procedure SetFooter(vRow:integer);
   begin
     SetCellColor(asgRekap,clSkyBlue,colzDate,vRow,colrBalance);
     with asgRekap do begin
       Cells[colzPrice,vRow] := 'Total';
     end;
   end;

begin
  try
    Screen.Cursor := crSQLWait;
    vITem := TItems_Arr.Create;
    vDetail := TItemBalance_Arr.Create;
    InitGrid;
    setFilter;
    vITem.FindFlat;
    vGrandBalance := 0; vGrandSTok := 0;
    frmMainMenu.Gauge.Show;
    for i:= 0 to vITem.Count-1 do begin
      asgRekap.Update;
      frmMainMenu.Gauge.Progress := round((i+1)/(vITem.Count)*100);
      vRow1 := asgRekap.RowCount-2;
      asgRekap.Ints[colzNo,vRow1]    := i+1;
      asgRekap.Cells[colzCOde,vRow1] := vITem[i].ItemCode;
      asgRekap.Cells[colzName,vRow1] := vITem[i].ItemName;
      asgRekap.Ints[colzItemId,vRow1]:= vITem[i].ItemId;
      asgRekap.Cells[colzUnit,vRow1] := vITem[i].UsedUnit;
      asgRekap.Ints[colzLimit,vRow1]:= vITem[i].StokLimit;
      vDetail.Clear;
      vDetail.Filter.Items.ItemId := vITem[i].ItemId;
      vDetail.FindStokValue(vStokZero,True);
      asgRekap.AddRow;
      setHeader(asgRekap.RowCount-2);
      for j:= 0 to vDetail.Count-1 do begin
        asgRekap.AddRow;
        vRow2 := asgRekap.RowCount-2;
        asgRekap.Cells[colzDate,vRow2] := NewFormatDate(vDetail[j].BalanceDate);
        asgRekap.Floats[colzPrice,vRow2]:= vDetail[j].Price;  //vDetail[j].Quantity;
        asgRekap.Floats[colzBalance,vRow2]   := vDetail[j].Balance;//vSaldo;
      //  asgRekap.Floats[colzValue,vRow2]     := vDetail[j].Price * vDetail[j].Balance;
        vGrandSTok := vGrandSTok + vDetail[j].Balance;
       // vGrandBalance := vGrandBalance + asgRekap.Floats[colzValue,vRow2];
        asgRekap.Ints[colzBalanceId, vRow2]  := vDetail[j].ItemBalanceId;
      end;
      asgRekap.AddRow;
      vRow2 := asgRekap.RowCount-2;
      SetFooter(vRow2);
      asgRekap.Floats[colzBalance,vRow2] := asgRekap.ColumnSum(colzBalance,vRow1+2,vRow2-1);
  //    asgRekap.Floats[colzValue,vRow2] := asgRekap.ColumnSum(colzValue,vRow1+2,vRow2-1);
      if asgRekap.Floats[colzBalance,vRow2] < asgRekap.Floats[colzLimit,vRow1] then
        SetCellColor(asgRekap,clRed,colzCode,vRow1,colzLimit);
      asgRekap.AddRow;
      asgRekap.AddNode(vRow1,vRow2-vRow1+1);
    end;
    DeleteRowTerakhir(asgRekap,3,1);
    //asgRekap.MergeCells(colzPrice,asgRekap.RowCount-1,2,1);
    asgRekap.Cells[colzPrice,asgRekap.RowCount-1] := 'Total Nilai Persediaan';
//    asgRekap.Floats[colzValue,asgRekap.RowCount-1] := vGrandBalance;
    asgRekap.Floats[colzBalance,asgRekap.RowCount-1] := vGrandSTok;

  finally
    Screen.Cursor := crDefault;
    frmMainMenu.Gauge.Hide;
    asgRekap.ContractAll;
    ArrangeColSize;
    vITem.Free;
  end;


end;  }

procedure TfrmKartuStok.BenerinStock1Click(Sender: TObject);
begin
    if Confirmed('Apakah data barang '+TItems.getFieldValue(asgRekap.Ints[colrItemId,asgRekap.Row],'item_name')+
              ' ('+TItems.getFieldValue(asgRekap.Ints[colrItemId,asgRekap.Row],'item_code')+')') then begin
       try
          Screen.Cursor := crSQLWait;
          TItems.BenerinStock(asgRekap.Ints[colrItemId,asgRekap.Row]);
       finally
          Screen.Cursor := crDefault;
       end;
    end;
end;

procedure TfrmKartuStok.asgRekapRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (MasterPurpose = IN_REKAP) and (ARow>0) then
    if asgRekap.Ints[colrItemId,ARow] > 0 then
      PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmKartuStok.Label1Click(Sender: TObject);
begin
  Inform('Untuk memperbaiki stock tipe laporan harus dalam bentuk Rekap Stock.'+#13+
        ' Kemudian Klik kanan pada item/part yang mau '+
        ' diperbaiki nilai stock nya.');
end;

procedure TfrmKartuStok.spdLastClick(Sender: TObject);
begin
spdFirst.Enabled:= True;
    spdPrev.Enabled:= True;
    spdNext.Enabled:= False;
    spdLast.Enabled:= False;
    halaman := totalHalaman;
    lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
    case MasterPurpose[1] of
    IN_UNIT :  ReloadGrid;  //kartu stok
    IN_VALUE : ReloadValue;
    IN_REKAP : RekapStok2;
    IN_GLOBAL : RekapGlobal;
    IN_REKAP_DETAIL : RekapStokDetail;
   end;
end;

procedure TfrmKartuStok.spdNextClick(Sender: TObject);
begin
inc(halaman);
    spdFirst.Enabled:= True;
    spdPrev.Enabled:= True;
    lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
    spdNext.Enabled:= (halaman< totalHalaman);
    spdLast.Enabled:= (halaman< totalHalaman);
    case MasterPurpose[1] of
    IN_UNIT :  ReloadGrid;  //kartu stok
    IN_VALUE : ReloadValue;
    IN_REKAP : RekapStok2;
    IN_GLOBAL : RekapGlobal;
    IN_REKAP_DETAIL : RekapStokDetail;
   end;
end;

procedure TfrmKartuStok.spdPrevClick(Sender: TObject);
begin
 dec(halaman);
    spdFirst.Enabled:= halaman > 0;
    spdPrev.Enabled:= halaman > 0;
    spdNext.Enabled:= True;
    spdLast.Enabled:= True;
   // lblHal.Caption:= 'Halaman: ' + IntToStr((txtLimit.Tag + txtLimit.IntValue) div txtLimit.IntValue);
     lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
    case MasterPurpose[1] of
    IN_UNIT :  ReloadGrid;  //kartu stok
    IN_VALUE : ReloadValue;
    IN_REKAP : RekapStok2;
    IN_GLOBAL : RekapGlobal;
    IN_REKAP_DETAIL : RekapStokDetail;
   end;
end;

procedure TfrmKartuStok.spdFirstClick(Sender: TObject);
begin
txtLimit.Tag:= 0;
    spdFirst.Enabled:= False;
    spdPrev.Enabled:= False;
    spdNext.Enabled:= True;
    spdLast.Enabled:= True;
    halaman := 1;
     lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
  //  lblHal.Caption:= 'Halaman: 1';


    case MasterPurpose[1] of
    IN_UNIT :  ReloadGrid;  //kartu stok
    IN_VALUE : ReloadValue;
    IN_REKAP : RekapStok2;
    IN_GLOBAL : RekapGlobal;
    IN_REKAP_DETAIL : RekapStokDetail;
   end;
end;

end.
