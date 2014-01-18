unit RugiLaba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, ExtCtrls,DateUtils,Math,
  asgprev;

type
  TfrmRugiLaba = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    d: TBevel;
    l: TLabel;
    btnReset: TButton;
    cmbOpr1: TComboBox;
    dtpDari1: TDateTimePicker;
    dtpSampai1: TDateTimePicker;
    StaticText1: TStaticText;
    btnOk: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    btnPrint: TButton;
    btnFilter: TButton;
    asgLabaRugi: TAdvStringGrid;
    AdvPreviewDialog1: TAdvPreviewDialog;
    rbTanggal: TRadioButton;
    rbBulan: TRadioButton;
    procedure btnFilterClick(Sender: TObject);
    procedure asgLabaRugiGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgLabaRugiGetCellBorder(Sender: TObject; ARow,
      ACol: Integer; APen: TPen; var Borders: TCellBorders);
    procedure asgLabaRugiGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure asgLabaRugiGetCellPrintBorder(Sender: TObject; ARow,
      ACol: Integer; APen: TPen; var Borders: TCellBorders);
    procedure asgLabaRugiGetCellPrintColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure asgLabaRugiPrintPage(Sender: TObject; Canvas: TCanvas;
      PageNr, PageXSize, PageYSize: Integer);
    procedure asgLabaRugiPrintSetColumnWidth(Sender: TObject;
      ACol: Integer; var Width: Integer);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure rbTanggalClick(Sender: TObject);
    procedure cmbOpr1Change(Sender: TObject);
  private
    { Private declarations }
    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadGrid;
    function getRowCount: integer;
    procedure setPeriode;
    procedure NewLabaRugi;
  public
    procedure Execute;
  end;

var
  frmRugiLaba: TfrmRugiLaba;

implementation

uses un_ryu, Subroutines, MainMenu, UConst, SQLServerConnections, UMaster,
  UTransaction, RugiLabaPrint;
const

  csTop    = 'T';
  csBottom = 'B';
  csTopBottom = 'TB';
  clReds      = 'M';

  RUGI_LABA = 'R';
  CASH_FLOW = 'C';

//column fixed index
  colLeft      = 0;
  colMstrDesc  = 1;
  colChldDesc  = 2;
  colValue1    = 3;
  colValue2    = 4;
  colValue3    = 5;
  colValue4    = 6;
  colRight     = 7;
  colBorder    = 8;
  colColor     = 9;

//row fixed index
  rowCompanyID = 1;
  rowReptID    = 2;
  rowPeriode   = 3;
  rowBevel     = 4;

  rowSales     = 5;
  rowRevenue   = 5;

{$R *.dfm}

{ TfrmRugiLaba }

procedure TfrmRugiLaba.ArrangeColSize;
begin
   asgLabaRugi.AutoSizeColumns(true, 10);
  if GlobalSystemUser.AccessLevel >= LEVEL_DEVELOPER then exit;
  asgLabaRugi.ColWidths[colBorder ]:= 0;
  asgLabaRugi.ColWidths[colColor  ]:= 0;
  asgLabaRugi.ColWidths[colLeft   ]:= 50;
  asgLabaRugi.ColWidths[colRight  ]:= 50;
end;

procedure TfrmRugiLaba.Execute;
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter,120);
  InitForm;
//  ReloadGrid;
  Run(Self);
end;

procedure TfrmRugiLaba.InitFIlter;
begin
  cmbOpr1.ItemIndex  := 3;
  cmbOpr1Change(Self);
  dtpDari1.Date := StartOfTheMonth(ServerNow);
  dtpSampai1.Date := ServerNow;
end;

procedure TfrmRugiLaba.InitForm;
begin
  rbTanggal.Checked := True;
  rbTanggalClick(Self);

  InitFIlter;
  InitGrid;
end;

procedure TfrmRugiLaba.InitGrid;
var  vCompany : TCompanyProfile;
begin
  vCompany := TCompanyProfile.Create;
  vCompany.SelectInDB;
  ResetGrid(asgLabaRugi, 6, 10, 0, 0);
      asgLabaRugi.ColumnSize.StretchColumn:= colChldDesc;
      with asgLabaRugi do begin
        MergeCells(colMstrDesc, rowCompanyID, 6,1 );
        MergeCells(colMstrDesc, rowReptID,    6,1 );
        MergeCells(colMstrDesc, rowPeriode,   6,1 );
        MergeCells(colMstrDesc, rowBevel,     6,1 );

        RowHeights[rowCompanyID]:= 35;
        RowHeights[rowReptID  ]:= 20;
        RowHeights[rowPeriode ]:= 20;
        RowHeights[rowBevel   ]:= 1;
        RowHeights[0          ]:= 0;

        Cells[colMstrDesc, rowCompanyID ]:= vCompany.CompanyName;
        Cells[colMstrDesc, rowReptID    ]:= 'Laporan Laba Rugi';
        Cells[colMstrDesc, rowPeriode   ]:= 'Periode';
     end;
     vCompany.Free;
end;

procedure TfrmRugiLaba.ReloadGrid;
var i, row: integer;
  vAccount: TAccount_Arr;
  vSales, vSalesDiscRetur, vSalesNet,
  vSalesCostOf, vSalesBrutto,vSalesDisc,

  vPurchaseDiscRetur, vPurchaseCharges, vPurchaseNet,
  vPurchaseCostOf,
  vInventory, vInventoryCurr, vInventoryNet,vBiaya,
  vServis, vServiceDisc,vServiceNet, vCharges, vLaba,vTempValue
  : double;

begin
  initGrid;
  vAccount:= TAccount_Arr.Create;
  setPeriode;
  try
    Screen.Cursor := crSQLWait;
  //set the report caption ...
  asgLabaRugi.Cells[colMstrDesc, rowPeriode]:= CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
  //'Periode Yang Berakhir ' + FormatDateTime('dd MMMM yyyy', EndOfTheMonth(dtpDari1.Date));
  asgLabaRugi.Update;
  //set the revenue value for grid ...
  //pendapatan penjualan ...
  vSales := 0;
  vSalesDisc := 0;
  vServis:= TShipment.getValueAll('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE);
  vServiceDisc := TShipment.getValueAll('s.discount',GlobalPeriode,SHIP_TYPE_SERVICE);

  vSales := TShipment.getValueAll('d.amount',GlobalPeriode,SHIP_TYPE_SALES);
  vSalesDisc := TShipment.getValueAll('s.discount',GlobalPeriode,SHIP_TYPE_SALES);
  vSalesNet := vSales - vSalesDisc;
  vServiceNet := vServis - vServiceDisc;
  asgLabaRugi.MergeCells(colMstrDesc,rowSales, 2,1);
  asgLabaRugi.Cells[colMstrDesc, rowSales]:= '<b>Pendapatan Penjualan dan Jasa</b>';

  vSalesDiscRetur:= 0;


  //set the salles netto ...
  row := getRowCount;
  asgLabaRugi.Cells[colChldDesc,row] := 'Pendapatan Sales';
  asgLabaRugi.Floats[colValue1,  row]:= vSales;
  row := getRowCount;
  asgLabaRugi.Cells[colChldDesc,row] := 'Discount Sales';
  asgLabaRugi.Floats[colValue1,  row]:= vSalesDisc;
  row := getRowCount;
  asgLabaRugi.FontStyles[colChldDesc,row]:= [fsBold];
  asgLabaRugi.FontStyles[colValue2,row]  := [fsBold];
  asgLabaRugi.Cells[colBorder,row]   := csTop;
  asgLabaRugi.Cells[colChldDesc,row] := 'Total Sales';
   asgLabaRugi.Floats[colValue2,  row]:= vSalesNet;
  row := getRowCount;
  asgLabaRugi.Cells[colChldDesc,row] := 'Pendapatan Service';
   asgLabaRugi.Floats[colValue1,  row]:= vServis;
  row := getRowCount;
  asgLabaRugi.Cells[colChldDesc,row] := 'Discount Service';
   asgLabaRugi.Floats[colValue1,  row]:= vServiceDisc;
  row := getRowCount;
  asgLabaRugi.FontStyles[colChldDesc,row]:= [fsBold];
  asgLabaRugi.FontStyles[colValue2,row]  := [fsBold];
   asgLabaRugi.Cells[colBorder,row]   := csTop;
  asgLabaRugi.Cells[colChldDesc,row] := 'Total Service';
  asgLabaRugi.Floats[colValue2,  row]:= vServiceNet;


  row:= getRowCount;
  vSalesNet:= (vSalesNet) +  (vServiceNet);
  asgLabaRugi.MergeCells(colMstrDesc,row, 2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Pendapatan Bersih</b>';
  asgLabaRugi.Cells[colBorder,  row]:= csTop;
  asgLabaRugi.Floats[colValue4, row]:= abs(vSalesNet);

  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the header caption for cost of goods sales ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Harga Pokok Penjualan:</b>';


  //awal dari akun-akun pembentuk harga pokok penjualan ...
  //begin here ...
  row:= getRowCount;
  vInventory:= TItemDetail_Arr.getPersediaan(True,False,GlobalPeriode);
  //DITUTUP TGL 15.01.06 vInventory:= abs(TAccountBalance.GetSaldoAwal(ACC_SEQ_PERSEDIAAN, dtpPeriode.Date));
  //TInventory.getInvent(StartOfTheMonth(dtpPeriode.Date),EndOfTheMonth(dtpPeriode.Date),True); //
  //vInventory := 0;//TItemBalance_Arr.GetPersediaan(StartOfTheMonth(dtpPeriode.Date), True, rdbRata.Checked,rgJenis.ItemIndex=1);
  asgLabaRugi.Cells[colChldDesc,row]:= 'Persediaan Awal, ' + FormatDateTime('dd MMMM yyyy', GlobalPeriode.PeriodeAwal1)+'</b>';
  asgLabaRugi.Floats[colValue3, row]:= vInventory;

  //set the purchase value for grid ...
 // vAccount.Filter.Reset;
//  vAccount.Filter.AccType:= ACC_TYPE_PEMBELIAN;
//  vAccount.getAccountValue(EndOfTheMonth(dtpPeriode.Date), False, True);
  vPurchaseNet:= TItemDetail_Arr.getPembelian(GlobalPeriode);
 // for i:= 0 to vAccount.Count-1 do begin
  //  row:= getRowCount;
 //   asgLabaRugi.Cells[colChldDesc, row]:= vAccount[i].AccName;
  //  asgLabaRugi.Floats[colValue2,  row]:= vAccount[i].StockOnHand;

    //cek dulu pakah debet/credit ... ga bisa gini atuh

 //   vAccount[i].StockOnHand:= IfThen(vAccount[i].AccSeq = ACC_SEQ_PEMBELIAN, abs(vAccount[i].StockOnHand), -abs(vAccount[i].StockOnHand));
  //  vPurchaseNet:= vPurchaseNet + vAccount[i].StockOnHand;

    //set then cell border
  //  if i = vAccount.Count-1 then
    //  asgLabaRugi.Cells[colBorder, row]:= csBottom;

    //set then cell Color
   // if vAccount[i].DbCrType = DB_CR_TYPE_CREDIT then
     // asgLabaRugi.Cells[colValue2, row]:= giveKurung(asgLabaRugi.Floats[colValue2,row]); //clReds;

  //end;

  //set the purchase netto ...
  row:= getRowCount;
  vPurchaseCostOf:= vPurchaseNet;
  asgLabaRugi.Cells[colChldDesc, row]:= '<b>Harga Pokok Pembelian</b>';
  asgLabaRugi.Floats[colValue3,  row]:= vPurchaseCostOf;
  asgLabaRugi.Cells[colBorder, row]:= csBottom;

  //set the current inventory value ...
  row:= getRowCount;
  vInventoryCurr:= vInventory + vPurchaseCostOf;
  asgLabaRugi.Cells[colChldDesc, row]:= '<b>Harga Pokok Barang yang Tersedia</b>';
  asgLabaRugi.Floats[colValue3, row]:= vInventoryCurr;

  //set the ending inventory value ...
  row:= getRowCount;
  //vInventoryNet:= TAccountBalance.getHPPersediaanAkhir(dtpPeriode.Date);
 //ditutup tgl 15.01.06 vInventoryNet:= abs(TAccountBalance.GetSaldoAwal(ACC_SEQ_PERSEDIAAN, dtpPeriode.Date, False));
 //TInventory.getInvent(StartOfTheMonth(dtpPeriode.Date),EndOfTheMonth(dtpPeriode.Date),False); //
  vInventoryNet := TItemDetail_Arr.getPersediaan(False,True,GlobalPeriode);
  asgLabaRugi.Cells[colChldDesc, row]:= '<b>Persediaan Akhir, ' + FormatDateTime('dd MMMM yyyy', IfThen(GlobalPeriode.PeriodeAkhir1 = 0,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1))+'</b>';
  asgLabaRugi.Floats[colValue3, row]:= vInventoryNet;
  asgLabaRugi.Cells[colBorder, row]:= csBottom;

  //set the cost of goods sales value ...
  row:= getRowCount;

  vSalesCostOf:= vInventoryCurr - vInventoryNet ;//dibalikkeun ku chan 2.1.6

  //diganti dei ku j 14.01.06 soalna kalao datana bener pasti sama dunks ...
   //ditutup deui 19.01.06 ku chan coz hpp mah teu boga saldo
  //vSalesCostOf:= abs(TAccountBalance.GetSaldoAwal(ACC_SEQ_HPP, dtpPeriode.Date, False));
  asgLabaRugi.Cells[colChldDesc,row]:= '<b>Harga Pokok Penjualan</b>';
  asgLabaRugi.Floats[colValue4, row]:= vSalesCostOf;
  asgLabaRugi.Cells[colBorder,  row]:= csBottom;

  //end here ... cost of goods sales builder

  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the header caption for sales brutto ...
  row:= getRowCount;
  vSalesBrutto:= abs(vSalesNet) - abs(vSalesCostOf);
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Laba Kotor Penjualan</b>';
  asgLabaRugi.Floats[colValue4, row]:=  vSalesBrutto ;//IfThen(vSalesBrutto<0,giveKurung(vSalesBrutto),FloatToStrFmt2(vSalesBrutto));// ANTI N.A.T.O vSalesCostOf;

  //set the servis revenue ...
 { row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Pendapatan Jasa</b>';
  asgLabaRugi.Floats[colValue4, row]:= abs(vServis);
  }
  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the header caption for sales brutto ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Biaya-biaya</b>';

  //set the operating values ...
  //vAccount.Filter.Reset;
 // vAccount.Filter.AccType := ACC_TYPE_BIAYA;
 // vAccount.getAccountValue(EndOfTheMonth(dtpPeriode.Date));
  vAccount.FindOnDb;
  vCharges:= 0;

  for i:= 0 to vAccount.Count-1 do begin
    row:= getRowCount;
    asgLabaRugi.Cells[colChldDesc, row]:= vAccount[i].AccName;
    vBiaya := TAccount.getAmountBiaya(vAccount[i].AccId,GlobalPeriode);
    asgLabaRugi.Floats[colValue3,  row]:= vBiaya;
    vCharges:= vCharges + vBiaya;//abs(vAccount[i].StockOnHand);
    if i = vAccount.Count-1 then
       asgLabaRugi.Cells[colBorder,  row]:= csBottom;
  end;

  //set the total expense ...
  row:= getRowCount;
  asgLabaRugi.Cells[colChldDesc,row]:= 'Jumlah Biaya </b>';
  asgLabaRugi.Floats[colValue4, row]:= vCharges;
  asgLabaRugi.Cells[colBorder,  row]:= csBottom;

  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the total laba bersih ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  vLaba := vSalesBrutto  - vCharges;//+ abs(vServis)
  asgLabaRugi.Cells[colMstrDesc,row]:= IfThen(vLaba <0,'<b>Rugi</b>', '<b>Laba Bersih</b>');

  asgLabaRugi.Floats[colValue4, row]:= vLaba;//IfThen(vLaba<0,giveKurung(vLaba),FloatToStrFmt2(vLaba));
  asgLabaRugi.Cells[colBorder,  row]:= csBottom;

 { //set Zakat
  row:= getRowCount;
  //asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
//  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Zakat</b>';
  asgLabaRugi.Colors[colValue2,row]  := clInfoBk;
  asgLabaRugi.Floats[colValue2,row] := 0;
  asgLabaRugi.Cells[colvalue3,row] := '<p align="left">%</p>';
  asgLabaRugi.Floats[colValue4, row]:= 0;//IfThen(vLaba<0, 0,0.03) * vLaba;
  asgLabaRugi.Cells[colBorder,  row]:= csBottom;}
  finally
    Screen.Cursor := crDefault;
    vAccount.Free;
    arrangeColSize;
  end;

end;

procedure TfrmRugiLaba.btnFilterClick(Sender: TObject);
begin
   SetFilterSize(pnlFilter,btnFilter,120);
end;

procedure TfrmRugiLaba.asgLabaRugiGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
//   case MasterPurpose[1] of
  //  RUGI_LABA : begin
      if ARow < rowBevel then HAlign:= taCenter
      else if ACol > colChldDesc then HAlign:= taRightJustify;
      if (asgLabaRugi.Cells[colMstrDesc,ARow] = '<b>Zakat</b>') and (ACol = colValue3) then
        HAlign := taLeftJustify;
  {  end;
    CASH_FLOW : begin
      if ARow < rowBevel then HAlign:= taCenter;
      if (asgLabaRugi.cells[colRight,Arow] = 'T') and (ACol in [colValue1..colValue4]) then
        HAlign := taRightJustify;
    end;
  end;}
end;

procedure TfrmRugiLaba.asgLabaRugiGetCellBorder(Sender: TObject; ARow,
  ACol: Integer; APen: TPen; var Borders: TCellBorders);
begin
{   case MasterPurpose[1] of
    RUGI_LABA : begin
   }   if (ACol > colLeft) and (ACol < colRight) then begin
        if ARow = rowBevel then Borders:= [cbBottom];

        if (ACol > colChldDesc) and (asgLabaRugi.Cells[ACol, ARow] <> '') then begin
          if asgLabaRugi.Cells[colBorder, ARow] = csTop then
            Borders:= [cbTop]
          else if asgLabaRugi.Cells[colBorder, ARow] = csBottom then
            Borders:= [cbBottom]
          else if asgLabaRugi.Cells[colBorder, ARow] = csTopBottom then
            Borders:= [cbBottom, cbTop]
        end;
      end;
   { end;
    CASH_FLOW : begin
      if asgLabaRugi.Cells[colBorder, ARow] = csTop then
        Borders:= [cbTop]
      else if (asgLabaRugi.Cells[colBorder, ARow] = csBottom) and
          (ACol in [colValue1,colValue2]) then
        Borders:= [cbBottom]
      else if asgLabaRugi.Cells[colBorder, ARow] = csTopBottom then
        Borders:= [cbBottom, cbTop];
    end;  }
end;

procedure TfrmRugiLaba.asgLabaRugiGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  { case MasterPurpose[1] of
    RUGI_LABA : begin
    }  case ARow of
        rowCompanyID:
        begin
          AFont.Size:= 12;
          AFont.Style:= [fsBold];
        end;
        rowReptID, rowPeriode:
        begin
          AFont.Size:= 10;
          AFont.Style:= [fsBold];
        end;
      end;

      if (ACol > colChldDesc) and (ACol < colRight) and
         (asgLabaRugi.Cells[ACol, ARow] <> '') and (asgLabaRugi.Cells[colColor, ARow] = clReds) then
         AFont.Color:= clRed;
   { end;
    CASH_FLOW : begin
      case ARow of
        rowCompanyID:
        begin
          AFont.Size:= 12;
          AFont.Style:= [fsBold];
        end;
        rowReptID, rowPeriode:
        begin
          AFont.Size:= 10;
          AFont.Style:= [fsBold];
        end;
      end;
    end;
  end; }
end;

procedure TfrmRugiLaba.asgLabaRugiGetCellPrintBorder(Sender: TObject; ARow,
  ACol: Integer; APen: TPen; var Borders: TCellBorders);
begin
  {case MasterPurpose[1] of
    RUGI_LABA : begin
    }  if (ACol > colLeft) and (ACol < colRight) then begin
        if ARow = rowBevel then Borders:= [cbBottom];

        if (ACol > colChldDesc) and (asgLabaRugi.Cells[ACol, ARow] <> '') then begin
          if asgLabaRugi.Cells[colBorder, ARow] = csTop then
            Borders:= [cbTop]
          else if asgLabaRugi.Cells[colBorder, ARow] = csBottom then
            Borders:= [cbBottom]
          else if asgLabaRugi.Cells[colBorder, ARow] = csTopBottom then
            Borders:= [cbBottom, cbTop]
        end;
      end;
   { end;
    CASH_FLOW : begin
      if asgLabaRugi.Cells[colBorder, ARow] = csTop then
        Borders:= [cbTop]
      else if (asgLabaRugi.Cells[colBorder, ARow] = csBottom) and
          (ACol in [colValue1,colValue2]) then
        Borders:= [cbBottom]
      else if asgLabaRugi.Cells[colBorder, ARow] = csTopBottom then
        Borders:= [cbBottom, cbTop];
    end;
  end;
}
end;

procedure TfrmRugiLaba.asgLabaRugiGetCellPrintColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  {case MasterPurpose[1] of
    RUGI_LABA : begin
    }  case ARow of
        rowCompanyID:
        begin
          AFont.Size:= 12;
          AFont.Style:= [fsBold];
        end;
        rowReptID, rowPeriode:
        begin
          AFont.Size:= 10;
          AFont.Style:= [fsBold];
        end;
      end;

      if (ACol > colChldDesc) and (ACol < colRight) and
         (asgLabaRugi.Cells[ACol, ARow] <> '') and (asgLabaRugi.Cells[colColor, ARow] = clReds) then
         AFont.Color:= clRed;
   { end;
    CASH_FLOW : begin
      case ARow of
        rowCompanyID:
        begin
          AFont.Size:= 12;
          AFont.Style:= [fsBold];
        end;
        rowReptID, rowPeriode:
        begin
          AFont.Size:= 10;
          AFont.Style:= [fsBold];
        end;
      end;
    end;
  end;}
end;

procedure TfrmRugiLaba.asgLabaRugiPrintPage(Sender: TObject;
  Canvas: TCanvas; PageNr, PageXSize, PageYSize: Integer);
var
  SaveFont: TFont;
  ts,tw: Integer;

const
  myowntitle: string = 'Bengkel';

begin
  if asgLabaRugi.PrintColStart <> 0 then
    Exit;
  with canvas do
  begin
    Savefont := TFont.create;
    SaveFont.Assign(Font);

    Font.Name := 'Arial';
    Font.Style := [fsBold];
    // Maps font height into current used logical units
    Font.Height := asgLabaRugi.MapFontHeight(10);
    Font.Color := clRed;

    ts := asgLabaRugi.PrintColOffset[0];
    tw := asgLabaRugi.PrintPagewidth;

    MoveTo(ts,-5);
    LineTo(ts+tw,-5);
    Lineto(ts+tw,-asgLabaRugi.printsettings.headersize+5);
    LineTo(ts,-asgLabaRugi.printsettings.headersize+5);
    LineTo(ts,-5);

    ts := ts+ ((tw-textwidth(myowntitle)) shr 1);

    TextOut(ts,-10,myowntitle);

    Font.Assign(SaveFont);
    SaveFont.Free;
  end;
end;

procedure TfrmRugiLaba.asgLabaRugiPrintSetColumnWidth(Sender: TObject;
  ACol: Integer; var Width: Integer);
begin
    if ACol in [colBorder,colColor,colRight] then
      Width :=-20;
end;

function TfrmRugiLaba.getRowCount: integer;
begin
   asgLabaRugi.AddRow;
  Result:= asgLabaRugi.RowCount-1;
end;

procedure TfrmRugiLaba.btnOkClick(Sender: TObject);
begin
  //ReloadGrid;
  NewLabaRugi;
end;

procedure TfrmRugiLaba.btnPrintClick(Sender: TObject);
begin
   //AdvPreviewDialog1.Execute;
   Application.CreateForm(TqrpRugiLaba,qrpRugiLaba);
   qrpRugiLaba.Executes(asgLabaRugi);
   qrpRugiLaba.Free;
end;

procedure TfrmRugiLaba.rbTanggalClick(Sender: TObject);
begin
  if rbTanggal.Checked then begin
     dtpDari1.DateMode := dmComboBox;
     dtpDari1.Format   := LongDateFormat;
     dtpSampai1.DateMode := dmComboBox;
     dtpSampai1.Format   := LongDateFormat;
  end
  else begin
    dtpDari1.DateMode := dmUpDown;
    dtpDari1.Format   := 'MMMM, yyyy';
    dtpSampai1.DateMode := dmUpDown;
    dtpSampai1.Format   := 'MMMM, yyyy';
  end;
end;

procedure TfrmRugiLaba.cmbOpr1Change(Sender: TObject);
begin
   dtpSampai1.Enabled := cmbOpr1.ItemIndex = 3;
end;

procedure TfrmRugiLaba.setPeriode;
begin
//  if rbTanggal.Checked then begin
    SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
 // end;
end;

procedure TfrmRugiLaba.NewLabaRugi;
var i, row: integer;
  vAccount: TAccount_Arr;
  vSales, vSalesDiscRetur, vSalesNet,
  vSalesCostOf, vSalesBrutto,
  vService, vServiceDisc,
  vPurchaseDiscRetur, vPurchaseCharges, vPurchaseNet,
  vPurchaseCostOf,

   vCharges, vLaba,vTempValue
  : double;

begin
  initGrid;
  vAccount:= TAccount_Arr.Create;

  try
    Screen.Cursor := crSQLWait;
  GlobalPeriode.Reset;
  //set the report caption ...
//  SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
  GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.DateTime,False);

  asgLabaRugi.Cells[colMstrDesc, rowPeriode]:= CaptionPeriode(GlobalPeriode.OpPeriodeAwal1,GlobalPeriode.PeriodeAwal1,GlobalPeriode.PeriodeAkhir1);
   //'Periode  ' + FormatDateTime('dd MMMM yyyy', EndOfTheMonth(dtpDari1.Date));

  //set the revenue value for grid ...
  //pendapatan penjualan ...

//  vSales := TShipment.getValueItemType('d.amount',GlobalPeriode,SHIP_TYPE_SALES,ITEM_TYPE_PART,0,'',boTrue);
  vSales := TShipment.getValueAll('d.amount',GlobalPeriode,SHIP_TYPE_SALES,False,boTrue);
  vService := TShipment.getValueAll('d.amount',GlobalPeriode,SHIP_TYPE_SERVICE,False,boTrue);
  asgLabaRugi.MergeCells(colMstrDesc,rowSales, 2,1);
  asgLabaRugi.Cells[colMstrDesc, rowSales]:= '<b>Pendapatan Penjualan dan Service</b>';

  row := getRowCount;
  asgLabaRugi.Cells[colMstrDesc,row] := '     Total Penjualan';
  asgLabaRugi.Floats[colValue3,row]  := vSales;

  row := getRowCount;
  vSalesDiscRetur := TShipment.getValueShipField('s.discount',GlobalPeriode,SHIP_TYPE_SALES,True,boTrue);
  asgLabaRugi.Cells[colMstrDesc,row] := '     Total Discount Penjualan';
  asgLabaRugi.Floats[colValue3,row]  := vSalesDiscRetur;
  //set service revenue
  row := getRowCount;
  asgLabaRugi.Cells[colMstrDesc,row] := '     Total Service';
  asgLabaRugi.Floats[colValue3,row]  := vService;

  row := getRowCount;
  vServiceDisc := TShipment.getValueShipField('s.discount',GlobalPeriode,SHIP_TYPE_SERVICE,True,boTrue);
  asgLabaRugi.Cells[colMstrDesc,row] := '     Total Discount Service';
  asgLabaRugi.Floats[colValue3,row]  := vServiceDisc;


  //set the salles netto ...
  row:= getRowCount;
  vSalesNet:= vSales - vSalesDiscRetur + vService - vServiceDisc;
  asgLabaRugi.MergeCells(colMstrDesc,row, 2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Pendapatan Bersih</b>';
  asgLabaRugi.Cells[colBorder,  row]:= csTop;
  asgLabaRugi.Floats[colValue4, row]:= abs(vSalesNet);

  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;


  row:= getRowCount;


  vPurchaseNet:= TItemDetail.getHpp(GlobalPeriode,SHIP_TYPE_SALES);
  vPurchaseNet := vPurchaseNet + TItemDetail.getHpp(GlobalPeriode,SHIP_TYPE_SERVICE);
  //set the purchase netto ...
  row:= getRowCount;
  vPurchaseCostOf:= vPurchaseNet;
  asgLabaRugi.Cells[colMstrDesc, row]:= '<b>Harga Pokok Penjualan</b>';

  row := getRowCount;
  asgLabaRugi.Cells[colMstrDesc,row] := '     Nilai Persediaan terjual ';
  asgLabaRugi.Floats[colValue4,  row]:= vPurchaseCostOf;
  asgLabaRugi.Cells[colBorder, row]:= csBottom;

  //set the ending inventory value ...

 //ditutup tgl 15.01.06 vInventoryNet:= abs(TAccountBalance.GetSaldoAwal(ACC_SEQ_PERSEDIAAN, dtpPeriode.Date, False));

 { vSalesCostOf := 0;
  //diganti dei ku j 14.01.06 soalna kalao datana bener pasti sama dunks ...
   //ditutup deui 19.01.06 ku chan coz hpp mah teu boga saldo
  asgLabaRugi.Cells[colChldDesc,row]:= '<b>Harga Pokok Penjualan</b>';
  asgLabaRugi.Floats[colValue4, row]:= vSalesCostOf;
  asgLabaRugi.Cells[colBorder,  row]:= csBottom; }

  //end here ... cost of goods sales builder

  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the header caption for sales brutto ...
  row:= getRowCount;
  vSalesBrutto:= abs(vSalesNet) - abs(vPurchaseCostOf);
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Laba Kotor Penjualan</b>';
  asgLabaRugi.Floats[colValue4, row]:= vSalesBrutto;//IfThen(vSalesBrutto<0,giveKurung(vSalesBrutto),FloatToStrFmt2(vSalesBrutto));// ANTI N.A.T.O vSalesCostOf;


  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the header caption for sales brutto ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  asgLabaRugi.Cells[colMstrDesc,row]:= '<b>Biaya-biaya</b>';

  //set the operating values ...
  //vAccount.Filter.Reset;
 // vAccount.Filter.AccType := ACC_TYPE_BIAYA;
 // vAccount.getAccountValue(EndOfTheMonth(dtpPeriode.Date));
  vAccount.FindOnDb;
  vCharges:= 0;

  GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.DateTime);
  for i:= 0 to vAccount.Count-1 do begin
    row:= getRowCount;
    asgLabaRugi.Cells[colMstrDesc, row]:= '     '+vAccount[i].AccName;
    vTempValue := TAccount.getAmountBiaya(vAccount[i].AccId,GlobalPeriode);
    asgLabaRugi.Floats[colValue3,  row]:= vTempValue;
    vCharges:= vCharges + vTempValue;
    if i = vAccount.Count-1 then
       asgLabaRugi.Cells[colBorder,  row]:= csBottom;
  end;

  //set the total expense ...
  row:= getRowCount;
  asgLabaRugi.Cells[colMstrDesc,row]:= '     Jumlah Biaya </b>';
  asgLabaRugi.Floats[colValue4, row]:= vCharges;
  asgLabaRugi.Cells[colBorder,  row]:= csBottom;

  //set the dummy row for looking good ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,6,1);
  asgLabaRugi.RowHeights[row]:= 10;

  //set the total laba bersih ...
  row:= getRowCount;
  asgLabaRugi.MergeCells(colMstrDesc,row,2,1);
  vLaba := vSalesBrutto  - vCharges;//+ abs(vServis)
  asgLabaRugi.Cells[colMstrDesc,row]:= IfThen(vLaba <0,'<b>Rugi</b>', '<b>Laba Bersih</b>');

  asgLabaRugi.Floats[colValue4, row]:= vLaba;//IfThen(vLaba<0,giveKurung(vLaba),FloatToStrFmt2(vLaba));
  asgLabaRugi.Cells[colBorder,  row]:= csBottom;


  finally
    Screen.Cursor := crDefault;
    vAccount.Free;
    arrangeColSize;
  end;

end;

end.
