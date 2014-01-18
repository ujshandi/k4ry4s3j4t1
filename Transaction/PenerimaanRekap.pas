unit PenerimaanRekap;
  //utk restoran dan purchase rekap
  {******************************************}
{                                          }
{    Copyright(C) work@home                }
{                                          }
{           All rights reserved            }
{ 26.09.07 tambah laporan rekapitulasi utk sales/service retur                                        

{                                          }
{                                          }
{******************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,math,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit, ExtCtrls, ComCtrls;

type
  TfrmPenerimaanRekap = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    btnReset: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    asgRekap: TAdvStringGrid;
    btnPrint: TButton;
    btnFilter: TButton;
    btnAdd: TButton;
    btnDetail: TButton;
    cmbOpr1: TComboBox;
    dtpDari1: TDateTimePicker;
    l: TLabel;
    dtpSampai1: TDateTimePicker;
    d: TBevel;
    btnOk: TButton;
    StaticText1: TStaticText;
    pnlCust: TPanel;
    StaticText2: TStaticText;
    txtNoPol: TAdvEdit;
    btnDelete: TButton;
    pnlPart: TPanel;
    Label15: TLabel;
    Label14: TLabel;
    StaticText5: TStaticText;
    txtKode: TAdvEdit;
    txtNama: TAdvEdit;
    pnlTipe: TPanel;
    Bevel2: TBevel;
    cmbTipeLaporan: TComboBox;
    StaticText3: TStaticText;
    Label1: TLabel;
    txtKendaraan: TAdvEdit;
    btnEdit: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRekapDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cmbOpr1Change(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure txtNoPolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    MasterPurpose : string;
    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadGrid;
    procedure ReloadMutasi;
    procedure ReloadReturService;
    procedure ReloadService;
    procedure ReloadSales;
    procedure ReloadClaim;
    procedure ReloadRekapitulasi;
    procedure setComboTipeLap;
  public

    function Execute(aPurpose:string;AMenuId:integer):boolean;
  end;

var
  frmPenerimaanRekap: TfrmPenerimaanRekap;

const {terima barang& retur beli}             { utk Rekapitulasi}
      colNo =0;                               colpNo = 1;
      colNum = 1;                             colpCode = 2;
      colDate = 2;                            colpName = 3;
      colSupplier = 3;                        colpPrice= 4;
      colRef = 4;                             colpQty = 5;
                                              colpBruto = 6;
      colKirim = 5;                           colpDisc = 7;
      colSampai = 6;                          colpPiutang = 8;
      colDelivery = 7;                        colpPiutang2 = 9;
                                              colpPiutang3 = 10;
      colNotes = 8;                           colpNetto = 11;
      colOperator = 9;                        colpTrans =12;
      colSeq = 10;

       {utk sales+retur_sales}
      colrNo = 0;
      colrNum = 1;
      colrDate = 2;
      colrCust = 3;
      colrRef = 4;
      colrNotes = 5;
      colrUser = 6;
      colrId = 7;

      {utk Service/sales}
      colsNo = 0;
      colsNum = 1;
      colsDate = 2;
      colsCust = 3;
      colsNoPol = 4;
      colsMekanik = 5;
      colsNote = 6;
      colsUser = 7;
      colsId = 8;

      {utk claim tipe laporan}
      colcNo = 0;
      colcTgl = 1;
      colcKet = 2;
      colcNoPart = 3;
      colcNama=4;
      colcCair = 5;
      colcPriceList = 6;
      colcHpp = 7;
      colcQty = 8;
      colcPPG = 9;

      IDX_REKAP = 0;
      IDX_PITULASI = 1;
      IDX_CLAIM = 1;

implementation

uses MainMenu, Subroutines, un_ryu, UTransaction, Penerimaan, UConst,
  AutoBengkel,  SQLServerConnections, UMaster, MutasiBarang, Services,
  Sales, ReturBeli, ReturSales, ReturService, Claim, PenerimaanRekapPrint,
  ServiceRekapPrint, ReturBeliPrint, SalesRekapPrint, LOVFlat, ADOInt,
  LaporanClaim, RekapitulasiPrint, RekapitulasiSalesPrint;

{$R *.dfm}

{ TfrmPenerimaanRekap }

procedure TfrmPenerimaanRekap.ArrangeColSize;
begin
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG,SHIP_TYPE_RETUR_BELI : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colSeq]:= 0;
      if MasterPurpose[1] = SHIP_TYPE_TERIMA_BARANG then begin
          asgRekap.ColWidths[colRef]:= 0;
      end else begin
        asgRekap.ColWidths[colKirim]:= 0;
        asgRekap.ColWidths[colSampai]:= 0;
        asgRekap.ColWidths[colDelivery]:= 0;
      end;

    end;
    SHIP_TYPE_SALES,SHIP_TYPE_RETUR_SALES : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
        asgRekap.ColWidths[colrId]:= 0;
      if MasterPurpose[1] = SHIP_TYPE_SALES then
          asgRekap.ColWidths[colrRef]:= 0;
    end;
    SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_SERVICE : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colsNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colsId]:= 0;
    end;
    SHIP_TYPE_CLAIM : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colsNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      if cmbTipeLaporan.ItemIndex = IDX_REKAP then
        asgRekap.ColWidths[colsId]:= 0;
//      else
  //      asgRekap.ColWidths
    end;
  end;
end;

function TfrmPenerimaanRekap.Execute(aPurpose:string;AMenuId:integer): boolean;
begin
 Result := True;
 if not Can_Access(Self,AMenuId) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  MasterPurpose := aPurpose;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter,120);
  //if G_ITEM_LIST.Count = 0 then
   // TItems.getListName(G_ITEM_LIST);
  Result := True;
  InitForm;
  //btnOk.Click;
  btnAdd.Click;
  Run(Self);
end;

procedure TfrmPenerimaanRekap.InitForm;
begin
  setComboTipeLap;
  StaticText1.Font.Color := clBlack;
//  btnAdd.Caption := IfThen(MasterPurpose=SHIP_TYPE_TERIMA_BARANG,'&New..','&New Order');
  pnlCust.Visible := (MasterPurpose[1] in[SHIP_TYPE_TERIMA_BARANG,SHIP_TYPE_RETUR_SALES,SHIP_TYPE_RETUR_SERVICE,
            SHIP_TYPE_CLAIM]);

  pnlTipe.Visible := (MasterPurpose[1] in [SHIP_TYPE_RETUR_SALES,SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_CLAIM]);
  InitFIlter;
  InitGrid;
  btnEdit.Visible := MasterPurpose[1] in [SHIP_TYPE_TERIMA_BARANG];
  MainPanel.Update;
end;

procedure TfrmPenerimaanRekap.InitGrid;
begin
  asgRekap.FloatingFooter.Visible := False;
  case MasterPurpose[1] of
     SHIP_TYPE_TERIMA_BARANG,SHIP_TYPE_RETUR_BELI : begin
        asgRekap.Clear;
          ResetGrid(asgRekap,2,12,1,1);
          with asgRekap do begin
             Cells[colNo,0]   := 'No.';
             Cells[colNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_TERIMA_BARANG,'Terima','Retur');
             Cells[colSupplier,0] := 'Supplier';
             Cells[colRef,0]  := 'Referensi';
             Cells[colDate,0] := 'Tanggal';
             Cells[colNotes,0]:= 'Keterangan';

             Cells[colKirim,0]  := 'Tgl.Kirim';
             Cells[colSampai,0] := 'Tgl.Sampai';
             Cells[colDelivery,0]:= 'No.Delivery';

             Cells[colOperator,0]:= 'Operator';
             Cells[colSeq,0]  := 'Sequence';
          end;
      end;

     SHIP_TYPE_RETUR_SALES,SHIP_TYPE_SALES : begin
        asgRekap.Clear;
         if ((MasterPurpose[1] = SHIP_TYPE_RETUR_SALES) and (cmbTipeLaporan.ItemIndex=IDX_PITULASI)) then begin
          ResetGrid(asgRekap,2,14,1,1);
          asgRekap.MergeCells(colpNo,0,9,1);
        end
        else begin
          ResetGrid(asgRekap,2,9,1,1);
          with asgRekap do begin
             Cells[colrNo,0]   := 'No.';
             Cells[colrNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SALES,'Retur','Sales');
             Cells[colrDate,0] := 'Tanggal';
             Cells[colrCust,0] := 'Pembeli';
             Cells[colrRef,0]  := 'Referensi';
             Cells[colrNotes,0]:= 'Keterangan';
             Cells[colrUser,0] := 'Operator';
             Cells[colrId,0]  := 'ShipId';
          end;
        END;  
     end;
     SHIP_TYPE_SERVICE,SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_CLAIM : begin
       asgRekap.Clear;
       if  (MasterPurpose = SHIP_TYPE_CLAIM) and (cmbTipeLaporan.ItemIndex = IDX_CLAIM) then begin //tipe lap claim & pelunasan rubbing
          ResetGrid(asgRekap,3,11,1,1);
          asgRekap.FloatingFooter.Visible := True;
          with asgRekap do begin
             Cells[colcNo,0]   := 'No.';
             Cells[colcTgl,0]   := 'Tanggal';
             Cells[colcKet,0]  := 'Keterangan';
             Cells[colcNoPart,0] := 'No.Part';
             Cells[colcNama,0] := 'Nama Part';
             Cells[colcCair,0]:= 'Total Nilai Cair';
             Cells[colcPriceList,0] := 'Price List';
             Cells[colcHpp,0]:= 'HPP';
             Cells[colcQty,0] := 'Quantity';
             Cells[colcPPG,0]  := 'Nomor PPG';
          end;
       end
       else begin
          if ((MasterPurpose[1] = SHIP_TYPE_RETUR_SERVICE) and (cmbTipeLaporan.ItemIndex=IDX_PITULASI)) then begin
            ResetGrid(asgRekap,2,14,1,1);
            asgRekap.MergeCells(colpNo,0,9,1);
          end
          else begin
             ResetGrid(asgRekap,2,10,1,1);
              with asgRekap do begin
                 Cells[colsNo,0]   := 'No.';
                 Cells[colsNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Retur','Service');
                 Cells[colsDate,0] := 'Tanggal';
                 Cells[colsCust,0] := 'Pelanggan';
                 Cells[colsNoPol,0]:= 'No.Polisi';
                 Cells[colsMekanik,0] := IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Referensi','Mekanik');
                 Cells[colsNote,0]:= 'Keterangan';
                 Cells[colsUser,0] := 'Operator';
                 Cells[colsId,0]  := 'ShipId';
              end;
          end;
       end;
     end;
  end;
  ArrangeColSize;
end;

procedure TfrmPenerimaanRekap.ReloadGrid;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        Shipment.Persons.PersonName :=  txtNoPol.Text;
        Shipment.Persons.PersonCode :=  txtNoPol.Text;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);
        if txtKendaraan.Text <> '' then
              ItemBalance.Items.UserInsert := txtKendaraan.Text;//dipake buat filter kendaraan
             // if cmbBahan.ItemIndex <> -1 then
       //   ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb;
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[colNum,vRow] := vShipment[i].ShipNum;
       Cells[colDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);

       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[colSupplier,vRow] := vShipment[i].Persons.PersonName;
       Cells[colRef,vRow] := TShipment.getNumFromID(vShipment[i].ShipIdUsed);
       Cells[colnotes,vRow]:= vShipment[i].Notes;
       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[colSeq,vRow]   := vShipment[i].ShipId;
       
       Cells[colKirim,vRow]:= NewFormatDate(vShipment[i].TglKirim);
       Cells[colSampai,vRow]:= NewFormatDate(vShipment[i].TglSampai);
       Cells[colDelivery,vRow] := vShipment[i].DeliveryNum;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;
end;

procedure TfrmPenerimaanRekap.btnAddClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG : begin
      if frmPenerimaan.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_MUTASI_KELUAR : begin
      if frmMutasiBarang.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_MUTASI_MASUK : begin
      if frmMutasiBarang.ExecuteMutasiIn(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_SERVICE : begin
      if frmServices.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SERVICE : begin
      if frmReturService.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_SALES : begin
      if frmSales.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_BELI : begin
      if frmReturBeli.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SALES : begin
      if frmReturSales.Execute(0) then
        btnOk.Click;
    end;
    SHIP_TYPE_CLAIM : begin
      if frmClaim.Execute(0) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmPenerimaanRekap.btnOkClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG,SHIP_TYPE_RETUR_BELI :  ReloadGrid;
    SHIP_TYPE_MUTASI_MASUK,SHIP_TYPE_MUTASI_KELUAR : ReloadMutasi;
    SHIP_TYPE_SERVICE : ReloadService;
    SHIP_TYPE_RETUR_SERVICE : begin
       if cmbTipeLaporan.ItemIndex = IDX_PITULASI then
          ReloadRekapitulasi
       else
         ReloadReturService;
    end;
    SHIP_TYPE_CLAIM : begin
      If cmbTipeLaporan.ItemIndex = IDX_REKAP then
        ReloadReturService
      else
        ReloadClaim;
         
    end;
    SHIP_TYPE_SALES,SHIP_TYPE_RETUR_SALES :
        if cmbTipeLaporan.ItemIndex = IDX_PITULASI then
          ReloadRekapitulasi
       else
        ReloadSales;
  end;
end;

procedure TfrmPenerimaanRekap.btnDetailClick(Sender: TObject);
begin

  if asgRekap.Row = 0 then exit;
  
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG : begin
      if asgRekap.Ints[colseq,asgRekap.Row] = 0 then exit;
      frmPenerimaan.Execute(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
    SHIP_TYPE_MUTASI_KELUAR : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        frmMutasiBarang.Execute(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
    SHIP_TYPE_MUTASI_MASUK : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        frmMutasiBarang.ExecuteMutasiIn(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
    SHIP_TYPE_SERVICE : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      if frmServices.Execute(asgRekap.Ints[colsId,asgRekap.Row]) then
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SERVICE : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      if frmReturService.Execute(asgRekap.Ints[colsID,asgRekap.Row]) then
        btnOk.Click;
    end;
    SHIP_TYPE_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      if frmSales.Execute(asgRekap.Ints[colrId,asgRekap.Row]) then
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_BELI : begin
      if asgRekap.Ints[colseq,asgRekap.Row] = 0 then exit;
      if frmReturBeli.Execute(asgRekap.Ints[colSeq,asgRekap.Row]) then
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      if frmReturSales.Execute(asgRekap.Ints[colRId,asgRekap.Row]) then
        btnOk.Click;
    end;
    SHIP_TYPE_CLAIM : begin
      if cmbTipeLaporan.ItemIndex = IDX_CLAIM then exit;
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;

      if frmClaim.Execute(asgRekap.Ints[colsId,asgRekap.Row]) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmPenerimaanRekap.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (MasterPurpose = SHIP_TYPE_CLAIM) and (cmbTipeLaporan.ItemIndex = IDX_CLAIM) then begin
    if ARow = 0 then
      HAlign := taCenter
    else if ACol in [colcCair,colCQty,colCPriceList,colCHpp] then
      HAlign := taRightJustify;
  end
  else begin
    case cmbTipeLaporan.ItemIndex of
    IDX_PITULASI : begin
          if asgRekap.Cells[colpNo,ARow] = 'Item' then
            HAlign := taCenter
          else If ACol in [colpQty,colpPrice,colpBruto,colpDisc,colpPiutang,colpPiutang2,colpPiutang3,colpNetto] then
            HAlign := taRightJustify;
         end;
    else begin
       if ARow = 0 then
      HAlign := taCenter;
    end;
    end;
  end;
end;

procedure TfrmPenerimaanRekap.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then exit;
  btnDetail.Click;
end;

procedure TfrmPenerimaanRekap.cmbOpr1Change(Sender: TObject);
begin
    dtpSampai1.Enabled := (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
end;

procedure TfrmPenerimaanRekap.InitFIlter;
begin
  //rgClaim.Visible := MasterPurpose = SHIP_TYPE_CLAIM;

  cmbOpr1.ItemIndex    := cmbOpr1.Items.Count-1;
  dtpSampai1.Enabled:= (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
  dtpDari1.Date     := ServerNow-3;
  dtpSampai1.Date   := ServerNow;
  txtKode.Clear;
  txtNama.Clear;
  txtKendaraan.Clear;
  cmbTipeLaporan.ItemIndex := IDX_REKAP;
  txtNoPol.Clear;
end;

procedure TfrmPenerimaanRekap.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,120);
end;

procedure TfrmPenerimaanRekap.btnResetClick(Sender: TObject);
begin
    InitFIlter;
end;

procedure TfrmPenerimaanRekap.ReloadMutasi;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
//        if cmbBahan.ItemIndex <> -1 then
  //        ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb;
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[colNum,vRow] := vShipment[i].ShipNum;
       Cells[colDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       Cells[colnotes,vRow]:= vShipment[i].Notes;
       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[colSeq,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;

end;

procedure TfrmPenerimaanRekap.ReloadService;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        //Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
        Shipment.Persons.PersonCode := txtNoPol.Text;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
//        if cmbBahan.ItemIndex <> -1 then
  //        ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb;
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[colsNum,vRow] := vShipment[i].ShipNum;
       Cells[colsDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[colsCust,vRow] := vShipment[i].Persons.PersonName;
       Cells[colsNoPol,vRow]:= vShipment[i].Persons.PersonCode;
       Cells[colsMekanik,vRow] := TPersons.getInfo(vShipment[i].PersonsMekanik_Id.PersonId);
       Cells[colsnote,vRow]:= vShipment[i].Notes;
       Cells[colsUser,vRow]:= vShipment[i].UserInsert;
       Ints[colsId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;
end;

procedure TfrmPenerimaanRekap.ReloadReturService;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        Shipment.Persons.PersonCode := txtNoPol.Text;
 //       Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
//        if cmbBahan.ItemIndex <> -1 then
  //        ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb;
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[colsNum,vRow] := vShipment[i].ShipNum;
       Cells[colsDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[colsNoPol,vRow]:= vShipment[i].Persons.PersonCode;
       Cells[colsCust,vRow] := vShipment[i].Persons.PersonName;
       if vShipment[i].ShipType = SHIP_TYPE_RETUR_SERVICE then
         Cells[colsMekanik,vRow] := TShipment.getNumFromID(vShipment[i].ShipIdUsed);
       Cells[colsNote,vRow]:= IfThen(MasterPurpose=SHIP_TYPE_CLAIM,EkstrakString(vShipment[i].Notes,'|',1), vShipment[i].Notes);
       Cells[colsUser,vRow]:= vShipment[i].UserInsert;
       Ints[colsId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

procedure TfrmPenerimaanRekap.btnPrintClick(Sender: TObject);
var vFilter : TShipment;
   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vFilter do begin
        Reset;
        ShipType := MasterPurpose;
        Persons.PersonCode := txtNoPol.Text;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
      end;
   end;

begin
  vFilter := TShipment.Create;
  SetFilter;
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG : begin
      Application.CreateForm(TqrpPenerimaanRekap,qrpPenerimaanRekap);
      qrpPenerimaanRekap.ExecutQuery(vFilter);
      qrpPenerimaanRekap.Free;
    end;
    SHIP_TYPE_RETUR_BELI,SHIP_TYPE_RETUR_SALES: begin
      if (cmbTipeLaporan.ItemIndex = IDX_PITULASI) and (MasterPurpose[1]=SHIP_TYPE_RETUR_SALES) then begin
        Application.CreateForm(TqrpRekapitulasiSales,qrpRekapitulasiSales);
        qrpRekapitulasiSales.Executes(asgRekap,MasterPurpose);
        qrpRekapitulasiSales.Free;
        //Alert(MSG_UNDERCONSTRUCTION);
      end
      else begin
        Application.CreateForm(TqrpReturBeliRekap,qrpReturBeliRekap);
        qrpReturBeliRekap.ExecutQuery(MasterPurpose);
        qrpReturBeliRekap.Free;
      end;
    end;
    SHIP_TYPE_RETUR_SERVICE : begin
      if cmbTipeLaporan.ItemIndex = IDX_PITULASI then begin
        Application.CreateForm(TqrpRekapitulasi,qrpRekapitulasi);
        qrpRekapitulasi.Executes(asgRekap,MasterPurpose);
        qrpRekapitulasi.Free;
//        Alert(MSG_UNDERCONSTRUCTION);
      end
      else begin
        Application.CreateForm(TqrpServiceRekap,qrpServiceRekap);
        qrpServiceRekap.ExecutQuery(vFilter,False,SHIP_TYPE_RETUR_SERVICE);
        qrpServiceRekap.Free;
      end;
    end;
    SHIP_TYPE_CLAIM : begin
      if cmbTipeLaporan.ItemIndex = IDX_REKAP then begin
         Application.CreateForm(TqrpReturBeliRekap,qrpReturBeliRekap);
        qrpReturBeliRekap.ExecutQuery(MasterPurpose);
        qrpReturBeliRekap.Free;
      end
      else begin
        Application.CreateForm(TqrpLapClaim,qrpLapClaim);
        qrpLapClaim.Executes(asgRekap,MasterPurpose);
        qrpLapClaim.Free;
      end;
    end;
  end;
  vFilter.Free;
end;

procedure TfrmPenerimaanRekap.btnDeleteClick(Sender: TObject);
begin

  if GlobalSystemUser.AccessLevel < LEVEL_MANAGER then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  if asgRekap.Row = 0 then exit;

  if not Confirmed('Apakah data transaksi '+asgRekap.Cells[colNum,asgRekap.Row]+
        ' akan dihapus?') then
    exit;
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG : begin
      if asgRekap.Ints[colseq,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
    SHIP_TYPE_MUTASI_KELUAR : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
    SHIP_TYPE_MUTASI_MASUK : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
    SHIP_TYPE_SERVICE : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colsId,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SERVICE : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      frmReturService.Execute(asgRekap.Ints[colsID,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_BELI : begin
      if asgRekap.Ints[colseq,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_CLAIM : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
        btnOk.Click;
    end;
  end;
end;

procedure TfrmPenerimaanRekap.ReloadSales;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        //Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
        Shipment.Persons.PersonCode := txtNoPol.Text;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
//        if cmbBahan.ItemIndex <> -1 then
  //        ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb;
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[colrNum,vRow] := vShipment[i].ShipNum;
       Cells[colrDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[colrCust,vRow] := vShipment[i].Persons.PersonName;
       Cells[colrRef,vRow] := TShipment.getNumFromID(vShipment[i].ShipIdUsed);
//     Cells[coltNoPol,vRow]:= vShipment[i].Persons.PersonCode;
       //Cells[colsMekanik,vRow] := TPersons.getInfo(vShipment[i].PersonsMekanik_Id.PersonId);
       Cells[colrnotes,vRow]:= vShipment[i].Notes;
       Cells[colrUser,vRow]:= vShipment[i].UserInsert;
       Ints[colrId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;
end;

procedure TfrmPenerimaanRekap.txtNoPolKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtNoPol.Text,'CUSTOMER','');
    txtNoPol.Text := TPersons.getCodeFromID(vId);
  end;

end;

procedure TfrmPenerimaanRekap.ReloadClaim;
var vShipment:TShipment_Arr;
   i,vRow:integer;
   //vDetailNo : integer;
   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        //Shipment.IsPost   := rgStatus.ItemIndex=1;

        //Shipment.ShipServiceType := getTransType;
        //Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
        Shipment.Persons.PersonCode := txtNoPol.Text;
//        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
  //      ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        //if chkTglTrans.Checked then
          // GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

begin
  InitGrid;
  vShipment := TShipment_Arr.Create;
  SetFilter;
  vShipment.FindLapClaim;
  for i:= 0 to vShipment.GBuffer.RecordCount-1 do begin
     with vShipment.GBuffer do begin
       with asgRekap do begin
         vRow := asgRekap.RowCount-2;
         Ints[colcNo,vRow]   := vRow;
         Cells[colcTgl,vRow]   := NewFormatDate(BufferToDateTime(Fields[0].Value));
         Cells[colcKet,vRow]  := EkstrakString(BufferToString(Fields[1].Value),'|',1);
         Cells[colcNoPart,vRow] := BufferToString(Fields[2].Value);
         Cells[colcNama,vRow] := BufferToString(Fields[3].Value);
         Floats[colcCair,vRow]:= BufferToFloat(Fields[9].Value)-BufferToFloat(Fields[7].Value); //BufferToFloat(Fields[6].Value) * BufferToFloat(Fields[5].Value);;
         Floats[colcPriceList,vRow] := BufferToFloat(Fields[5].Value);
         Floats[colcHpp,vRow]:= BufferToFloat(Fields[4].Value);
         Floats[colcQty,vRow] := BufferToFloat(Fields[6].Value);
         Cells[colcPPG,vRow]  := EkstrakString(BufferToString(Fields[1].Value),'|',2);
         AddRow;
       end;
       MoveNext;
     end;
  end;
  DeleteRowTerakhir(asgRekap,2,1);
  asgRekap.FloatingFooter.ColumnCalc[colcCair]:= acSUM;
  asgRekap.FloatingFooter.ColumnCalc[colcHpp]:= acSUM;
  ArrangeColSize;
  vShipment.Free;
end;

procedure TfrmPenerimaanRekap.setComboTipeLap;
begin
  cmbTipeLaporan.Items.Clear;
  cmbTipeLaporan.Items.Add('Rekap Transaksi');

  case MasterPurpose[1] of
    SHIP_TYPE_CLAIM : begin
      cmbTipeLaporan.Items.Add('Lap. Claim');
    end;
    else
      cmbTipeLaporan.Items.Add('Rekapitulasi');
  end;
end;

procedure TfrmPenerimaanRekap.ReloadRekapitulasi;
var vRow,vRow1:integer;
 // vBruto, vDiskon, vPiutang, vNetto : Double;
  vBrutoGrand, vDiskonGrand, vPiutangGrand,vPiutangGrand3, vPiutangGrand2,  vNettoGrand,vDIsc : Double;
  vItemDetail : TItemDetail_Arr;
  vService : TServiceDetail_Arr;
  vPostCriteria : TBooleanOperator;
  vShowItem, vShowService:boolean;
  procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      //GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
      GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
      with vItemDetail.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
//        Shipment.ShipServiceType := getTransType;
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

      end;
      with vService.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
       // Shipment.ShipServiceType := getTransType;
      end;

{       if chkPending.Checked then begin
        if rgStatus.ItemIndex = 0 then
          vPostCriteria := boFalse
        else
           vPostCriteria := boTrue;
      end
      else
        vPostCriteria := boNone;}
   end;

  procedure setHeader(aType:string;pRow:integer);
  var vRow_x : integer;
  begin
    with asgRekap do begin
      MergeCells(colpNo,pRow,IfThen(MasterPurpose=SHIP_TYPE_SALES,9,13),1);

      case AType[1] of
        SERVICE_TYPE_OTHERS : Cells[colpNo,pRow ]:= '<p><b>Lain</b></p>';
        SERVICE_TYPE_SINGLE : Cells[colpNo,pRow ]:= '<p><b>Jasa</b></p>';
        ITEM_TYPE_OIL  : Cells[colpNo,pRow ]:= '<p><b>Oli</b></p>';
        ITEM_TYPE_PART : Cells[colpNo,pRow ]:= '<p><b>Part</b></p>';
      end;
      AddRow;
      vRow_x := RowCount-1;
      SetCellColor(asgRekap,clSkyBlue,colpNo,vRow_x,colpTrans);
      Cells[colpNo,vRow_x] := 'Item';
      Cells[colpCode,vRow_x] := 'ID';
      Cells[colpName,vRow_x] := 'Uraian';
      Cells[colpPrice,vRow_x] := 'H.Satuan';
      Cells[colpQty,vRow_x] := 'Qty';
      Cells[colpBruto,vRow_x] := 'Bruto';
      Cells[colpDisc,vRow_x] := 'Diskon';
      Cells[colpPiutang,vRow_x] := 'Piutang Reg.';
      Cells[colpPiutang2,vRow_x] := IfThen(MasterPurpose=SHIP_TYPE_RETUR_SALES,'Piutang Cr.','Piutang KSG');
      Cells[colpPiutang3,vRow_x] := 'Piutang Comp.';
      Cells[colpNetto,vRow_x] := 'Netto';
      Cells[colpTrans,vRow_x] := 'ID '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Retur Service','Retur Sales');
    end;
  end;

  procedure setValue(pRow:integer;AType:string;isService:boolean);
  var k,aRow:integer;
      //vPiutang, vPiutang2, vPiutang3 : Double;
  begin
    //aRow  := pRow;
    //vPiutang := 0; vPiutang2 := 0; vPiutang3 := 0;
    with asgRekap do  begin
      if not isService then begin
        vItemDetail.Clear;
        SetFilter;
        vItemDetail.Filter.ItemBalance.Items.ItemType := AType;
        vItemDetail.FindRekapitulasi(vPostCriteria);
        for k:= 0 to vItemDetail.Count-1 do begin
          aRow := RowCount-1;
          Ints[colpno,aRow]    := k+1;
          Cells[colpCode,aRow] := vItemDetail[k].ItemBalance.Items.ItemCode;
          Cells[colpName,aRow] := vItemDetail[k].ItemBalance.Items.ItemName;
          Floats[colpPrice,aRow] := vItemDetail[k].Price;
          Floats[colpQty,aRow] := vItemDetail[k].Quantity;
          Floats[colpBruto,aRow] := vItemDetail[k].Price * vItemDetail[k].Quantity;
          Floats[colpDisc,aRow] := vItemDetail[k].Discount;
          Floats[colpPiutang,aRow] := 0;
          Floats[colpPiutang2,aRow] := 0;
          Floats[colpPiutang3,aRow] := 0;
   //ditutup, ditambah is_ksg       if (vItemDetail[k].Shipment.IsPost)  and (vItemDetail[k].ServiceParent=0) then begin
   //ditutup 18.12.06 coz jual kredit jiga ksg       if (vItemDetail[k].Shipment.IsPost)  and ((vItemDetail[k].ServiceParent=0) and (not vItemDetail[k].IsKsg)) then begin
          // nu lila(vItemDetail[k].Shipment.ShipServiceType <> SHIP_SERVICE_TYPE_KSG) then begin
          if (vItemDetail[k].Shipment.IsPost)  and ((vItemDetail[k].ServiceParent=0) and
          (not vItemDetail[k].IsKsg)) and (vItemDetail[k].Shipment.ShipServiceType <> SHIP_SALES_TYPE_CREDIT) then begin
            Floats[colpNetto,aRow] := vItemDetail[k].Amount;
            vNettoGrand := vNettoGrand + vItemDetail[k].Amount;
          end
          else begin
            if MasterPurpose = SHIP_TYPE_RETUR_SALES then begin
               case vItemDetail[k].Shipment.ShipServiceType[1] of
                 SHIP_SALES_TYPE_REG : begin
                   Floats[colpPiutang,aRow] := vItemDetail[k].Amount;
                   vPiutangGrand := vPiutangGrand + vItemDetail[k].Amount;
                 end;
                 SHIP_SALES_TYPE_CREDIT : begin
                   Floats[colpPiutang2,aRow] := vItemDetail[k].Amount;
                   vPiutangGrand2 := vPiutangGrand2 + vItemDetail[k].Amount;
                 end;
               end;
            end
            else
               case vItemDetail[k].Shipment.ShipServiceType[1] of
                 SHIP_SERVICE_TYPE_REG : begin
                    Floats[colpPiutang,aRow] := vItemDetail[k].Amount;
                    vPiutangGrand := vPiutangGrand + vItemDetail[k].Amount;
                 end;
                 SHIP_SERVICE_TYPE_KSG : begin
                   Floats[colpPiutang2,aRow] := vItemDetail[k].Amount;
                   vPiutangGrand2 := vPiutangGrand2 + vItemDetail[k].Amount;
                 end;
                 SHIP_SERVICE_TYPE_COMP : begin
                    Floats[colpPiutang3,aRow] := vItemDetail[k].Amount;
                    vPiutangGrand3 := vPiutangGrand3 + vItemDetail[k].Amount;
                 end;
               end;

            Floats[colpNetto,aRow] := 0;

          end;
          Cells[colpTrans,aRow] := vItemDetail[k].Shipment.ShipNum;
          vBrutoGrand := vBrutoGrand + vItemDetail[k].Price * vItemDetail[k].Quantity;
          vDiskonGrand := vDiskonGrand + vItemDetail[k].Discount;


          AddRow;
        end;
        aRow := RowCount-1;
        SetCellColor(asgRekap,clSkyBlue,colpNo,aRow,colpTrans);
        MergeCells(colpPrice,aRow,2,1);
        Cells[colpPRice,aRow] := 'Sub Total';
        Floats[colpBruto,aRow] := ColumnSum(colpBruto,pRow,aRow-1);
        Floats[colpDisc,aRow] := ColumnSum(colpDisc,pRow,aRow-1);
        Floats[colpNetto,aRow] := ColumnSum(colpNetto,pRow,aRow-1);
        Floats[colpPiutang,aRow] := ColumnSum(colpPiutang,pRow,aRow-1);
        Floats[colpPiutang2,aRow] := ColumnSum(colpPiutang2,pRow,aRow-1);
        Floats[colpPiutang3,aRow] := ColumnSum(colpPiutang3,pRow,aRow-1);
     end;
     //utk service
     if isService then begin
        vService.Clear;
        SetFilter;
        vService.Filter.Services.ServiceType := AType;
        vService.FindRekapitulasi(vPostCriteria);
        for k:= 0 to vService.Count-1 do begin
          aRow := RowCount-1;
          Ints[colpno,aRow]    := k+1;
          Cells[colpCode,aRow] := vService[k].Services.ServiceCode;
          Cells[colpName,aRow] := vService[k].Services.ServiceName;
          Floats[colpPrice,aRow] := vService[k].Price;
          Floats[colpQty,aRow] := vService[k].Quantity;
          Floats[colpBruto,aRow] := vService[k].Price * vService[k].Quantity;
          Floats[colpDisc,aRow] := vService[k].Discount;
          Floats[colpPiutang,aRow] := 0;
          Floats[colpPiutang2,aRow] := 0;
          Floats[colpPiutang3,aRow] := 0;
       //DITUTUP, ditambah is_ksg   if (vService[k].Shipment.IsPost) and (vService[k].ServiceParent =0) then begin
          if (vService[k].Shipment.IsPost) and ((vService[k].ServiceParent =0) and (not vService[k].IsKsg)) then begin
          //(vService[k].Shipment.ShipServiceType <> SHIP_SERVICE_TYPE_KSG) then begin

//            Floats[colpPiutang,aRow]:= vPiutangGrand;
  //          Floats[colpPiutang2,aRow]:= vPiutangGrand2;
    //        Floats[colpPiutang3,aRow]:= vPiutangGrand3;
            Floats[colpNetto,aRow] := vService[k].Amount;
            vNettoGrand := vNettoGrand + vService[k].Amount;
          end
          else begin
            case vService[k].Shipment.ShipServiceType[1] of
                 SHIP_SERVICE_TYPE_REG : begin
                    Floats[colpPiutang,aRow] := vService[k].Amount;
                    vPiutangGrand := vPiutangGrand + vService[k].Amount;
                 end;
                 SHIP_SERVICE_TYPE_KSG : begin
                   Floats[colpPiutang2,aRow] := vService[k].Amount;
                   vPiutangGrand2 := vPiutangGrand2 + vService[k].Amount;
                 end;
                 SHIP_SERVICE_TYPE_COMP : begin
                    Floats[colpPiutang3,aRow] := vService[k].Amount;
                    vPiutangGrand3 := vPiutangGrand3 + vItemDetail[k].Amount;
                 end;
               end;

            Floats[colpNetto,aRow] := 0;
           // vPiutangGrand := vPiutangGrand + vService[k].Amount;
          end;
          Cells[colpTrans,aRow] := vService[k].Shipment.ShipNum;
          vBrutoGrand := vBrutoGrand + vService[k].Price * vService[k].Quantity;
          vDiskonGrand := vDiskonGrand + vService[k].Discount;
          //vNettoGrand := vNettoGrand + vService[k].Amount;
          //vPiutangGrand := vPiutangGrand + 0;
          AddRow;
        end;
        aRow := RowCount-1;
        SetCellColor(asgRekap,clSkyBlue,colpNo,aRow,colpTrans);
        MergeCells(colpPrice,aRow,2,1);
        Cells[colpPrice,aRow] := 'Sub Total';
        Floats[colpBruto,aRow] := ColumnSum(colpBruto,pRow,aRow-1);
        Floats[colpDisc,aRow] := ColumnSum(colpDisc,pRow,aRow-1);
        Floats[colpNetto,aRow] := ColumnSum(colpNetto,pRow,aRow-1);
        Floats[colpPiutang,aRow] := ColumnSum(colpPiutang,pRow,aRow-1);
        Floats[colpPiutang2,aRow] := ColumnSum(colpPiutang2,pRow,aRow-1);
        Floats[colpPiutang3,aRow] := ColumnSum(colpPiutang3,pRow,aRow-1);
     end;
    end;
  end;

begin
   vItemDetail := TItemDetail_Arr.Create;
   vService := TServiceDetail_Arr.Create;

   InitGrid;
   SetFilter;
   vShowItem := True;
   vShowService := True;
   {if chkPart.Checked then begin
     vShowItem := (rgPart.ItemIndex = 1);
     vShowService := (rgPart.ItemIndex =0);
   end;                                    }
   //vBruto := 0; vDiskon:= 0; vPiutang:= 0; vNetto:= 0;
   vBrutoGrand:= 0; vDiskonGrand:= 0; vPiutangGrand:= 0;vPiutangGrand2:= 0;vPiutangGrand3:= 0; vNettoGrand:= 0;
   with asgRekap do begin
      if MasterPurpose = SHIP_TYPE_RETUR_SERVICE then begin
    //jasa
        if vShowService then begin
          vRow := RowCount-1;
          setHeader(SERVICE_TYPE_SINGLE,vRow);
          AddRow;
          vRow1 := RowCount-1;
          setValue(vRow1,SERVICE_TYPE_SINGLE,True);
          vRow1 := RowCount-1;
          AddNode(vRow,vRow1-vRow+1);
      //other
          AddRow;
          vRow := RowCount-1;
          setHeader(SERVICE_TYPE_OTHERS,vRow);
          AddRow;
          vRow1 := RowCount-1;
          setValue(vRow1,SERVICE_TYPE_OTHERS,True);
          vRow1 := RowCount-1;
          AddNode(vRow,vRow1-vRow+1);
          AddRow;
        end;
      end;
  //oli
      if vShowItem then begin
        vRow := RowCount-1;
        setHeader(ITEM_TYPE_OIL,vRow);
        AddRow;
        vRow1 := RowCount-1;
        setValue(vRow1,ITEM_TYPE_OIL,False);
        vRow1 := RowCount-1;
        AddNode(vRow,vRow1-vRow+1);
    //part
        AddRow;
        vRow := RowCount-1;
        setHeader(ITEM_TYPE_PART,vRow);
        AddRow;
        vRow1 := RowCount-1;
        setValue(vRow1,ITEM_TYPE_PART,False);
        vRow1 := RowCount-1;
        AddNode(vRow,vRow1-vRow+1);
        AddRow;
      end;
   end;

   with asgRekap do begin
    vRow := RowCount-1;
    SetCellColor(asgRekap,clLime,colpNo,vRow,colpTrans);
    MergeCells(colpPrice,vRow,2,1);
    Cells[colpPrice,vRow] := '<p align="right"><b>Grand Total  </b></p>';
    Floats[colpBruto,vRow]  := vBrutoGrand;
    Floats[colpDisc,vRow]   := vDiskonGrand;
    Floats[colpPiutang,vRow]:= vPiutangGrand;
    Floats[colpPiutang2,vRow]:= vPiutangGrand2;
    Floats[colpPiutang3,vRow]:= vPiutangGrand3;
    Floats[colpNetto,vRow]   := vNettoGrand;
    AddRow;

    vDIsc := TShipment.getValueShipField('s.discount',GlobalPeriode,MasterPurpose,True,boTrue);
    vRow := RowCount-1;
    SetCellColor(asgRekap,clLime,colpNo,vRow,colpTrans);
    MergeCells(colpPrice,vRow,2,1);
    Cells[colpPrice,vRow] := '<p align="right"><b>Discount Faktur </b></p>';
    Floats[colpNetto,vRow] := vDIsc;
    AddRow;

    vRow := RowCount-1;
    SetCellColor(asgRekap,clLime,colpNo,vRow,colpTrans);
    MergeCells(colpPrice,vRow,2,1);
    Cells[colpPrice,vRow] := '<p align="right"><b>Nett Sales </b></p>';
    Floats[colpNetto,vRow]  := vNettoGrand - vDIsc;

    AddRow;

  end;
  frmMainMenu.Gauge.Hide;
  DeleteRowTerakhir(asgRekap,2,1);
//  asgPerson.AutoNumberCol(colNo);
  vItemDetail.Free;
  vService.Free;
  ArrangeColSize;

end;

procedure TfrmPenerimaanRekap.btnEditClick(Sender: TObject);
begin
  if MasterPurpose[1] in [SHIP_TYPE_TERIMA_BARANG] then begin
    if asgRekap.Ints[colSeq,asgRekap.Row] = 0 then exit;
        if frmPenerimaan.Execute(asgRekap.Ints[colSeq,asgRekap.Row],True) then
  end;
end;

end.
