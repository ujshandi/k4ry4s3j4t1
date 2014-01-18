unit EstimasiRekap;
{******************************************}
{                                          }
{    Copyright(C) work@home                }
{                                          }
{           All rights reserved            }
{ 30.06.07 tambah laporan global per part (History)                                        

{                                          }
{                                          }
{******************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,Math,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit, ExtCtrls, ComCtrls;

type
  TfrmEstimasiRekap = class(TForm)
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
    btnOk: TButton;
    pnlCust: TPanel;
    StaticText2: TStaticText;
    txtNoPol: TAdvEdit;
    btnDelete: TButton;
    StaticText3: TStaticText;
    Bevel2: TBevel;
    btnEdit: TButton;
    btnPost: TButton;
    cmbTipeLaporan: TComboBox;
    Bevel1: TBevel;
    chkTglTrans: TCheckBox;
    pnlExpr: TPanel;
    Label1: TLabel;
    cmbOpr2: TComboBox;
    dtpDari2: TDateTimePicker;
    dtpSampai2: TDateTimePicker;
    pnlPart: TPanel;
    StaticText5: TStaticText;
    Label15: TLabel;
    txtKode: TAdvEdit;
    Label14: TLabel;
    txtNama: TAdvEdit;
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRekapDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnFilterClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cmbTipeLaporanDropDown(Sender: TObject);
    procedure cmbTipeLaporanCloseUp(Sender: TObject);
    procedure txtNoPolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbOpr2Change(Sender: TObject);
    procedure chkTglTransClick(Sender: TObject);
    procedure txtKodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    MasterPurpose : string;
    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadEstimasi;
    procedure ReloadOrderBengkel;
    procedure ReloadService;
    procedure ReloadServiceSalesGlobal;
    procedure ReloadReturService;

    procedure ReloadUnitMotor;
    procedure ReloadRekapitulasi;
    procedure ReloadKhusus;//node berdasarkan customer permintaan juragan heri 10.01.07 diubah
    procedure ReloadKhusus2;//node berdasarkan tanngal
    procedure ReloadGlobalPart;
    procedure setComboTipeLap;

  public

    function Execute(aPurpose:string;AMenuId:integer):boolean;
  end;

var
  frmEstimasiRekap: TfrmEstimasiRekap;

const

      {utk sales+retur_sales}
      colrNo = 0;
      colrNum = 1;
      colrDate = 2;
      colrExpr = 3; //tgl bayar
      colrCust = 4;
      colrRef = 5;

      colrNotes = 6;
      colrUser = 7;
      colrStatus = 8;
      colrTipe = 9;
      colrId =10;

      {utk Service/sales}
      colsNo = 0;
      colsNum = 1;
      colsDate = 2;
      colsExpr = 3; //tgl bayar
      colsCust = 4;
      colsNoPol = 5;
      colsMekanik = 6;

      colsNote = 7;
      colsUser = 8;
      colsStatus = 9;
      colsTipe =10;
      colsId = 11;

      {utk service global}
      colgJenis = 1;
      colgBruto = 2;
      colgDisc = 3;
      colgPiutang = 4;
      colgPiutang2 = 5;//tipe KSG-Service / Credit-Sales
      colgPiutang3 = 6;// tipe company-Service / hide-Sales
      colgNett = 7;
      //colgNett = 5;

      {utk unitMotor}
      coluCode = 1;
      coluMotor = 2;
      coluTahun = 3;
      coluQty  = 4;
      coluTotal = 5;
      coluId = 6;

      { utk Rekapitulasi}
      colpNo = 1;
      colpCode = 2;
      colpName = 3;
      colpPrice= 4;
      colpQty = 5;
      colpBruto = 6;
      colpDisc = 7;
      colpPiutang = 8;
      colpPiutang2 = 9;
      colpPiutang3 = 10;
      colpNetto = 11;
      colpTrans =12;

      {UTK tipe khusus}
      colKNo = 0;
      //colKDate = 2; kahayang juragan heri 10.01.07
      //colKCust = 1;
      colKDate =1;
      colKCust = 2;
      colKPartCode = 3;
      colKPartName = 4;
      colKPriceSales = 5;
      colKPriceHpp = 6;
      colKQty = 7;
      colKDisc = 8;
      colKTotal = 9;
      colKId = 10;

      colGPNo = 0;
      colGPKode = 1;
      colGPNama = 2;
      colGPQty = 3;
      colGPPrice = 4;
      colGPDisc = 5;
      colGPTotal = 6;


      IDX_REKAP = 0;
      IDX_GLOBAL = 1;
      IDX_PITULASI = 2;
      IDX_KHUSUS = 3;
      IDX_GLOBAL_PART = 4;
      IDX_GLOBAL_HISTORY = 5; //30.06.07
      IDX_MOTOR = 6;

implementation

uses MainMenu, Subroutines, un_ryu, UTransaction, Penerimaan, UConst,
  AutoBengkel,  SQLServerConnections, UMaster, MutasiBarang, Services,
  Sales, ReturBeli, ReturSales, ReturService, Claim, PenerimaanRekapPrint,
  ServiceRekapPrint, ReturBeliPrint, SalesRekapPrint,
  SalesServiceGlobalPrint, ServiceMotorPrint, RekapitulasiPrint,
  RekapitulasiSalesPrint, LOVFlat, ServiceGlobalPrint, ADOInt,
  RekapKhususPrint, GlobalPartPrint, Estimasi;


{$R *.dfm}

{ TfrmPenerimaanRekap }

procedure TfrmEstimasiRekap.ArrangeColSize;
begin
  case MasterPurpose[1] of
    ESTIMASI_TYPE_1,ESTIMASI_TYPE_ORDER,SHIP_TYPE_SALES,SHIP_TYPE_RETUR_SALES : begin
      asgRekap.AutoSizeColumns(True,5);
      if cmbTipeLaporan.ItemIndex = IDX_REKAP then
        asgRekap.AutoNumberCol(colNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;


      if MasterPurpose[1] = ESTIMASI_TYPE_1 then begin
          asgRekap.ColWidths[colsMekanik]:= 0;
          asgRekap.ColWidths[colsExpr]:= 0;
          asgRekap.ColWidths[colsTipe]:= 0;
          asgRekap.ColWidths[colsId]:= 0;
          asgRekap.ColWidths[colsStatus]:= 0;
//          asgRekap.ColWidths[colsExpr]:= 0;
      end;

      if MasterPurpose[1] = ESTIMASI_TYPE_ORDER then begin
          asgRekap.ColWidths[colsMekanik]:= 0;
          asgRekap.ColWidths[colsExpr]:= 0;
          asgRekap.ColWidths[colsTipe]:= 0;
          asgRekap.ColWidths[colsId]:= 0;
//          asgRekap.ColWidths[colsExpr]:= 0;
      end;


      if MasterPurpose[1] = SHIP_TYPE_SALES then
      case cmbTipeLaporan.ItemIndex of
         IDX_REKAP : begin
            asgRekap.ColWidths[colrRef]:= 0;
            asgRekap.ColWidths[colrId]:= 0;
         end;
         IDX_PITULASI : begin
            asgRekap.ColWidths[colpPiutang3] := 0;
         end;
         IDX_GLOBAL : begin
            asgRekap.ColWidths[colgPiutang3] := 0;
         end;
         IDX_KHUSUS : begin
            asgRekap.ColWidths[colKId] := 0;
        //    asgRekap.AutoNumberCol(colKNo);
         end;
         IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY : begin
           // asgRekap.ColWidths[colKId] := 0;
            asgRekap.AutoNumberCol(colGPNo);
         end;
      end;
    end;
    SHIP_TYPE_CLAIM,SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_SERVICE : begin
      asgRekap.AutoSizeColumns(True,5);
      if (cmbTipeLaporan.ItemIndex in [IDX_REKAP,IDX_MOTOR]) then
        asgRekap.AutoNumberCol(colsNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      case cmbTipeLaporan.ItemIndex of
        IDX_REKAP : begin
          asgRekap.ColWidths[colsId]:= 0;
        end;
        IDX_MOTOR : begin
          asgRekap.ColWidths[coluId]:= 0
        end;
        IDX_PITULASI : begin
        end;
        IDX_KHUSUS : begin
            asgRekap.ColWidths[colKId] := 0;
            //asgRekap.AutoNumberCol(colKNo);
        end;
        IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY : begin
           // asgRekap.ColWidths[colKId] := 0;
            asgRekap.AutoNumberCol(colGPNo);
         end;
      end;
    end;
  end;
end;

function TfrmEstimasiRekap.Execute(aPurpose:string;AMenuId:integer): boolean;
begin
 Result := True;
 if not Can_Access(Self,AMenuId) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  MasterPurpose := aPurpose;
  pnlFilter.Height := 0;
  cmbTipeLaporan.ItemIndex := IDX_REKAP;
  SetFilterSize(pnlFilter,btnFilter,150);
//  if G_ITEM_LIST.Count = 0 then
 //   TItems.getListName(G_ITEM_LIST);
  Result := True;
  InitForm;
  btnOk.Click;
  btnAdd.Click;
  Run(Self);
end;

procedure TfrmEstimasiRekap.InitForm;
begin


  btnEdit.Visible     := MasterPurpose[1] in[ESTIMASI_TYPE_1];
  //rbUnitMotor.Visible := MasterPurpose[1] in[SHIP_TYPE_SERVICE];
//  StaticText1.Font.Color := clBlack;
  pnlCust.Visible := (MasterPurpose[1] in[ESTIMASI_TYPE_1]);
  InitFIlter;
  //rbRekap.Checked := True;
  setComboTipeLap;
  cmbTipeLaporan.ItemIndex := IDX_REKAP;

  InitGrid;
  MainPanel.Update;
end;

procedure TfrmEstimasiRekap.InitGrid;
begin
  asgRekap.ExpandAll;
  asgRekap.Clear;
  asgRekap.FloatingFooter.Visible := False;




  case MasterPurpose[1] of
    ESTIMASI_TYPE_1 : begin

      ResetGrid(asgRekap,2,13,1,1);
          with asgRekap do begin
             Cells[colsNo,0]   := 'No.';
             Cells[colsNum,0]  := 'No. Estimasi';
             Cells[colsDate,0] := 'Tgl.Estimasi';
             Cells[colsCust,0] := 'Pelanggan';
             Cells[colsNoPol,0]:= 'No.Polisi';
             Cells[colsMekanik,0] := IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Referensi','Mekanik');
             Cells[colsExpr,0] := 'Tgl.Bayar';
             Cells[colsNote,0]:= 'Keterangan';
             Cells[colsUser,0] := 'Operator';
             Cells[colsStatus,0] := 'Status';
             Cells[colsTipe,0] := 'Tipe';
             Cells[colsId,0]  := 'ShipId';
          end;
          
    end;
    ESTIMASI_TYPE_ORDER : begin

      ResetGrid(asgRekap,2,13,1,1);
          with asgRekap do begin
             Cells[colsNo,0]   := 'No.';
             Cells[colsNum,0]  := 'No. Order';
             Cells[colsDate,0] := 'Tgl.Order';
             Cells[colsCust,0] := 'Pelanggan';
             Cells[colsNoPol,0]:= 'No.Polisi';
             Cells[colsMekanik,0] := IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Referensi','Mekanik');
             Cells[colsExpr,0] := 'Tgl.Bayar';
             Cells[colsNote,0]:= 'Keterangan';
             Cells[colsUser,0] := 'Operator';
             Cells[colsStatus,0] := 'Status';
             Cells[colsTipe,0] := 'Tipe';
             Cells[colsId,0]  := 'ShipId';
          end;
          
    end;
     SHIP_TYPE_RETUR_SALES,SHIP_TYPE_SALES : begin
       case cmbTipeLaporan.ItemIndex of
         IDX_REKAP :  begin
          ResetGrid(asgRekap,2,12,1,1);
          with asgRekap do begin
             Cells[colrNo,0]   := 'No.';
             Cells[colrNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SALES,'Retur','Sales');
             Cells[colrDate,0] := 'Tgl.Trans';
             Cells[colrCust,0] := 'Pembeli';
             Cells[colrRef,0]  := 'Referensi';
             Cells[colrExpr,0] := 'Tgl.Bayar';
             Cells[colrNotes,0]:= 'Keterangan';
             Cells[colrUser,0] := 'Operator';
             Cells[colrStatus,0] := 'Status';
             Cells[colrTipe,0] := 'Tipe';
             Cells[colrId,0]  := 'ShipId';
          end;
          end;
         IDX_GLOBAL : begin
          ResetGrid(asgRekap,3,10,1,1);
          asgRekap.FloatingFooter.Visible := True;
          with asgRekap do begin
             Cells[colgJenis,0] := 'Jenis';
             Cells[colgBruto,0] := 'Bruto';
//             Cells[colgDp,0]    := 'Uang Muka';
             Cells[colgDisc,0]  := 'Diskon';
             Cells[colgPiutang,0]:= 'Piutang';
             Cells[colgPiutang2,0] := 'Piutang Credit';
             Cells[colgPiutang3,0] := 'hide';
             Cells[colgNett,0]  := 'Netto';
          end;
         end;
         IDX_KHUSUS : begin

          ResetGrid(asgRekap,3,12,1,1);
          asgRekap.FloatingFooter.Visible := True;
          with asgRekap do begin
             Cells[colKNo,0] := 'No.';
             Cells[colKDate,0] := 'Tanggal.';
             Cells[colKCust,0]    := 'Pelanggan/SubDealer';
             Cells[colKPartCode,0]  := 'Part Number';
             Cells[colKPartName,0]:= 'Part Name';
             Cells[colKPriceSales,0] := 'Price List';
             Cells[colKPriceHpp,0] := 'Harga HPP Satuan';
             Cells[colKQty,0]  := 'Quantity';
             Cells[colKDisc,0] := 'Discount';
             Cells[colKTotal,0]:='Total';
             Cells[colKId,0] := 'ID';
          end;
         end;
         IDX_PITULASI : begin
          ResetGrid(asgRekap,2,14,1,1);
          asgRekap.MergeCells(colpNo,0,9,1);
         end;
         IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY : begin
            ResetGrid(asgRekap,3,8,1,1);
            asgRekap.FloatingFooter.Visible := True;
            with asgRekap do begin
              cells[colGPNo,0] := 'No.';
              cells[colGPKode,0] := 'Kode Part';
              cells[colGPNama,0] := 'Nama Part';
              Cells[colGPQty,0]  := 'Jumlah';
              Cells[colGPPrice,0] := 'Harga Satuan';
              Cells[colGPDIsc,0]:= 'Jumlah Disc';
              Cells[colGPTotal,0] := 'Total';
            end;
         end;
        end;
     end;
     SHIP_TYPE_SERVICE,SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_CLAIM : begin
       asgRekap.Clear;
       case cmbTipeLaporan.ItemIndex of
       IDX_REKAP : begin
         ResetGrid(asgRekap,2,13,1,1);
          with asgRekap do begin
             Cells[colsNo,0]   := 'No.';
             Cells[colsNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Retur','Service');
             Cells[colsDate,0] := 'Tgl.Trans';
             Cells[colsCust,0] := 'Pelanggan';
             Cells[colsNoPol,0]:= 'No.Polisi';
             Cells[colsMekanik,0] := IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Referensi','Mekanik');
             Cells[colsExpr,0] := 'Tgl.Bayar';
             Cells[colsNote,0]:= 'Keterangan';
             Cells[colsUser,0] := 'Operator';
             Cells[colsStatus,0] := 'Status';
             Cells[colsTipe,0] := 'Tipe';
             Cells[colsId,0]  := 'ShipId';
          end;
       end;
       IDX_GLOBAL : begin
          ResetGrid(asgRekap,3,10,1,1);
          asgRekap.FloatingFooter.Visible := True;
          with asgRekap do begin
             Cells[colgJenis,0] := 'Jenis';
             Cells[colgBruto,0] := 'Bruto';
//             Cells[colgDp,0]    := 'Uang Muka';
             Cells[colgDisc,0]  := 'Diskon';
             Cells[colgPiutang,0]:= 'Piutang';
             Cells[colgPiutang2,0] := 'Piutang KSG';
             Cells[colgPiutang3,0] := 'Piutang Company';
             Cells[colgNett,0]  := 'Netto';
          end;
       end;
       //utk tipe iunit motor
       IDX_MOTOR : begin
          ResetGrid(asgRekap,3,8,1,1);
          asgRekap.FloatingFooter.Visible := True;
          with asgRekap do begin
             Cells[coluCode,0]  := 'Kode';
             Cells[coluMotor,0] := 'Motor';
             Cells[coluTahun,0] := 'Tahun';
             Cells[coluQty,0]   := 'Jumlah';
             Cells[coluTotal,0] := 'Total';
             Cells[coluId,0]    := 'Id';
          end;
       end;
       IDX_KHUSUS : begin
          ResetGrid(asgRekap,3,12,1,1);
          asgRekap.FloatingFooter.Visible := True;
          with asgRekap do begin
             Cells[colKNo,0] := 'No.';
             Cells[colKDate,0] := 'Tanggal.';
             Cells[colKCust,0]    := 'Pelanggan/SubDealer';
             Cells[colKPartCode,0]  := 'Part Number';
             Cells[colKPartName,0]:= 'Part Name';
             Cells[colKPriceSales,0] := 'Price List';
             Cells[colKPriceHpp,0] := 'Harga HPP Satuan';
             Cells[colKQty,0]  := 'Quantity';
             Cells[colKDisc,0] := 'Discount';
             Cells[colKTotal,0]:='Total';
             Cells[colKId,0] := 'ID';
          end;
       end;

       IDX_PITULASI : begin
         ResetGrid(asgRekap,2,14,1,1);
         asgRekap.MergeCells(colpNo,0,14,1);
       end;
       IDX_GLOBAL_PART, IDX_GLOBAL_HISTORY : begin
            ResetGrid(asgRekap,3,8,1,1);
            asgRekap.FloatingFooter.Visible := True;
            with asgRekap do begin
              cells[colGPNo,0] := 'No.';
              cells[colGPKode,0] := 'Kode Part';
              cells[colGPNama,0] := 'Nama Part';
              Cells[colGPQty,0]  := 'Jumlah';
              Cells[colGPPrice,0] := 'Harga Satuan';
              Cells[colGPDIsc,0]:= 'Jumlah Disc';
              Cells[colGPTotal,0] := 'Total';
            end;
         end;
       
      end;
     end;
  end;
  ArrangeColSize;
end;


procedure TfrmEstimasiRekap.btnAddClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    ESTIMASI_TYPE_1,ESTIMASI_TYPE_ORDER : begin
      //if rbRekap.Checked then
        if frmEstimasi.Execute(MasterPurpose,0) then
          btnOk.Click;
    end;
  end;
end;

procedure TfrmEstimasiRekap.btnOkClick(Sender: TObject);
begin

  
  case MasterPurpose[1] of
    ESTIMASI_TYPE_1 : begin
      ReloadEstimasi;
    end;
    ESTIMASI_TYPE_ORDER : begin
      ReloadOrderBengkel;
    end;
    SHIP_TYPE_SERVICE : begin
      case cmbTipeLaporan.ItemIndex of
      IDX_REKAP   : ReloadService;
      IDX_GLOBAL  : ReloadServiceSalesGlobal;
      IDX_PITULASI: ReloadRekapitulasi;
      IDX_KHUSUS  : ReloadKhusus2;
      IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY : ReloadGlobalPart;
      else
        ReloadUnitMotor;
      end;
    end;
    SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_CLAIM : ReloadReturService;
    SHIP_TYPE_SALES,SHIP_TYPE_RETUR_SALES : begin
      if MasterPurpose[1] = SHIP_TYPE_SALES then begin
        case cmbTipeLaporan.ItemIndex of
        IDX_GLOBAL  : ReloadServiceSalesGlobal;
        IDX_PITULASI: ReloadRekapitulasi;
        IDX_KHUSUS  : ReloadKhusus2;
        IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY : ReloadGlobalPart;
        end;
      end
    end;
  end;
end;

procedure TfrmEstimasiRekap.btnDetailClick(Sender: TObject);
begin
  if asgRekap.Row = 0 then exit;

  case MasterPurpose[1] of
    ESTIMASI_TYPE_1,ESTIMASI_TYPE_ORDER : begin
      if cmbTipeLaporan.ItemIndex <> IDX_REKAP then exit;
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      if frmEstimasi.Execute(MasterPurpose,asgRekap.Ints[colsId,asgRekap.Row]) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmEstimasiRekap.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else begin
    case MasterPurpose[1] of
      SHIP_TYPE_SERVICE,SHIP_TYPE_SALES : begin
        case cmbTipeLaporan.ItemIndex of
         IDX_GLOBAL : begin
          if ACol in [colgBruto,colgDisc,colgPiutang,colgPiutang2,colgPiutang3,colgNett] then
            HAlign := taRightJustify;
         end;
         IDX_MOTOR : begin
          If ACol in [coluTotal,coluQty] then
            HAlign := taRightJustify;
         end;
         IDX_KHUSUS : begin
          if ARow = 0  then
            HAlign := taCenter
          else If ACol in [colKPriceSales,colKPriceHpp,colKQty,colKDisc,colKTotal] then
            HAlign := taRightJustify;
         end;
         IDX_PITULASI : begin
          if asgRekap.Cells[colpNo,ARow] = 'Item' then
            HAlign := taCenter
          else If ACol in [colpQty,colpPrice,colpBruto,colpDisc,colpPiutang,colpPiutang2,colpPiutang3,colpNetto] then
            HAlign := taRightJustify;
         end;
         IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY : begin
          if ARow = 0  then
            HAlign := taCenter
          else If ACol in [colGPPrice,colGpQty,colGpDisc,colGPTotal] then
            HAlign := taRightJustify;
         end;
       end;  
      end;
    end;
  end;
end;

procedure TfrmEstimasiRekap.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then exit;
  btnDetail.Click;
end;

procedure TfrmEstimasiRekap.InitFIlter;
begin

  pnlPart.Enabled := true;
  txtKode.Clear;
  txtNama.Clear;

  chkTglTrans.Checked := False;
  pnlExpr.Enabled      := chkTglTrans.Checked;
  cmbOpr2.ItemIndex    := cmbOpr2.Items.Count-1;
  dtpSampai2.Enabled:= (cmbOpr2.ItemIndex = 3) and (cmbOpr2.ItemIndex <> 0);
  dtpDari2.Date     := ServerNow-3;
  dtpSampai2.Date   := ServerNow;
  txtNoPol.Clear;
end;

procedure TfrmEstimasiRekap.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,150);
end;

procedure TfrmEstimasiRekap.btnResetClick(Sender: TObject);
begin
    InitFIlter;
end;

procedure TfrmEstimasiRekap.ReloadService;
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
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

        if chkTglTrans.Checked then
           GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

begin
   try
     Screen.Cursor := crSQLWait;
     frmMainMenu.Gauge.Show;
     vShipment := TShipment_Arr.Create;
     SetFilter;
     vShipment.FindOnDb('',true);
     InitGrid;
     for i:= 0 to vShipment.Count-1 do
       with asgRekap do begin
         Update;
         vRow := asgRekap.RowCount-1;
         frmMainMenu.Gauge.Progress := round((i+1)/(vShipment.Count)*100);
         Cells[colsNum,vRow] := vShipment[i].ShipNum;
         Cells[colsDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
         Cells[colsExpr,vRow]:= NewFormatDate(vShipment[i].ExprDate);
         TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
         Cells[colsCust,vRow] := vShipment[i].Persons.PersonName;
         Cells[colsNoPol,vRow]:= vShipment[i].NoPol;// Persons.PersonCode;
         Cells[colsMekanik,vRow] := TShipmentMechanic_Arr.getMechanic(vShipment[i].ShipId); //TPersons.getInfo(vShipment[i].PersonsMekanik_Id.PersonId);
         Cells[colsnote,vRow]:= vShipment[i].Notes;
         Cells[colsTipe,vRow] :=TShipment.getDescTransType(vShipment[i].ShipType,vShipment[i].ShipServiceType);
         Cells[colsUser,vRow]:= vShipment[i].UserInsert;
         Cells[colsStatus,vRow] := IfThen(vShipment[i].IsPost,'Posted','Pending');
         Ints[colsId,vRow]   := vShipment[i].ShipId;
         AddRow;
       end;
     DeleteRowTerakhir(asgRekap,2,1);
   finally
     Screen.Cursor := crDefault;
     frmMainMenu.Gauge.Hide;
     vShipment.Free;

     ArrangeColSize;
   end;
end;

procedure TfrmEstimasiRekap.ReloadReturService;
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
//        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
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
       Cells[colsNote,vRow]:= vShipment[i].Notes;
       Cells[colsUser,vRow]:= vShipment[i].UserInsert;
       Ints[colsId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

procedure TfrmEstimasiRekap.btnPrintClick(Sender: TObject);
var vFilter : TShipment;
   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vFilter do begin
        Reset;
        ShipType := MasterPurpose;

        Persons.PersonCode := txtNoPol.Text;
//        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
      end;
   end;

begin
  vFilter := TShipment.Create;
  SetFilter;
  case MasterPurpose[1] of
    SHIP_TYPE_RETUR_BELI,SHIP_TYPE_RETUR_SALES,SHIP_TYPE_RETUR_SERVICE : begin
      Application.CreateForm(TqrpReturBeliRekap,qrpReturBeliRekap);
      qrpReturBeliRekap.ExecutQuery(MasterPurpose);
      qrpReturBeliRekap.Free;
    end;
    SHIP_TYPE_SERVICE : begin
      if cmbTipeLaporan.ItemIndex = IDX_REKAP then begin
        Application.CreateForm(TqrpServiceRekap,qrpServiceRekap);
        qrpServiceRekap.ExecutQuery(vFilter,true,SHIP_TYPE_SERVICE);
        qrpServiceRekap.Free;
      end;
      if cmbTipeLaporan.ItemIndex = IDX_GLOBAL then begin
        Application.CreateForm(TqrpServiceGlobal,qrpServiceGlobal);
        qrpServiceGlobal.Executes(asgRekap,MasterPurpose);
        qrpServiceGlobal.Free;
      end;
      if cmbTipeLaporan.ItemIndex = IDX_MOTOR then begin
        Application.CreateForm(TqrpServiceMotor,qrpServiceMotor);
        qrpServiceMotor.Executes(asgRekap,MasterPurpose);
        qrpServiceMotor.Free;
      end;
      if cmbTipeLaporan.ItemIndex = IDX_PITULASI then begin
        Application.CreateForm(TqrpRekapitulasi,qrpRekapitulasi);
        qrpRekapitulasi.Executes(asgRekap,MasterPurpose);
        qrpRekapitulasi.Free;
//        Alert(MSG_UNDERCONSTRUCTION);
      end;
      if cmbTipeLaporan.ItemIndex = IDX_KHUSUS then begin
        Application.CreateForm(TqrpRekapKhusus,qrpRekapKhusus);
        qrpRekapKhusus.Executes(asgRekap,MasterPurpose);
        qrpRekapKhusus.Free;
      end;
      if cmbTipeLaporan.ItemIndex in [IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY] then begin
        Application.CreateForm(TqrpGlobalPart,qrpGlobalPart);
        qrpGlobalPart.Executes(asgRekap,MasterPurpose,cmbTipeLaporan.ItemIndex=IDX_GLOBAL_HISTORY);
        qrpGlobalPart.Free;
      end;
    end;
    SHIP_TYPE_SALES : begin
      if cmbTipeLaporan.ItemIndex = IDX_REKAP then begin
        Application.CreateForm(TqrpSalesRekap,qrpSalesRekap);
        qrpSalesRekap.ExecutQuery(vFilter,true);
        qrpSalesRekap.Free;
      end;
      if cmbTipeLaporan.ItemIndex = IDX_GLOBAL then begin
        Application.CreateForm(TqrpSalesServiceGlobal,qrpSalesServiceGlobal);
        qrpSalesServiceGlobal.Executes(asgRekap,MasterPurpose);
        qrpSalesServiceGlobal.Free;
      end;
      if cmbTipeLaporan.ItemIndex = IDX_PITULASI then begin
        Application.CreateForm(TqrpRekapitulasiSales,qrpRekapitulasiSales);
        qrpRekapitulasiSales.Executes(asgRekap,MasterPurpose);
        qrpRekapitulasiSales.Free;
        //Alert(MSG_UNDERCONSTRUCTION);
      end;
      if cmbTipeLaporan.ItemIndex = IDX_KHUSUS then begin
        Application.CreateForm(TqrpRekapKhusus,qrpRekapKhusus);
        qrpRekapKhusus.Executes(asgRekap,MasterPurpose);
        qrpRekapKhusus.Free;
      end;
      if cmbTipeLaporan.ItemIndex in [IDX_GLOBAL_PART,IDX_GLOBAL_HISTORY] then begin
        Application.CreateForm(TqrpGlobalPart,qrpGlobalPart);
        qrpGlobalPart.Executes(asgRekap,MasterPurpose,cmbTipeLaporan.ItemIndex=IDX_GLOBAL_HISTORY);
        qrpGlobalPart.Free;
      end;
    end;
  end;
  vFilter.Free;
end;

procedure TfrmEstimasiRekap.btnDeleteClick(Sender: TObject);
begin
   if cmbTipeLaporan.ItemIndex <> IDX_REKAP then exit;
  if GlobalSystemUser.AccessLevel < LEVEL_ADMIN then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;

  if asgRekap.Row = 0 then exit;

  if not Confirmed('Apakah data transaksi '+asgRekap.Cells[colsNum,asgRekap.Row]+
        ' akan dihapus?') then
    exit;

  case MasterPurpose[1] of
    SHIP_TYPE_SERVICE : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colsId,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SERVICE : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      frmReturService.Execute(asgRekap.Ints[colsId,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colrId,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_RETUR_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colrId,asgRekap.Row]);
        btnOk.Click;
    end;
    SHIP_TYPE_CLAIM : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
        btnOk.Click;
    end;
    ESTIMASI_TYPE_1 : begin
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
      TShipment.DeleteEstimasi(asgRekap.Ints[colsId,asgRekap.Row]);
        btnOk.Click;
    end;
  end;
end;


procedure TfrmEstimasiRekap.ReloadServiceSalesGlobal;
var vRow:integer;
  vBruto, vDiskon, vPiutang,vPiutang2,vPiutang3, vNetto,vDp : Double;
  vBrutoGrand, vDiskonGrand, vPiutangGrand,vPiutangGrand2, vPiutangGrand3,  vNettoGrand : Double;
  vShowItem,vShowService:Boolean;
  procedure SetFilter;
   begin
//      GlobalPeriode.Reset;
//      GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date,False);
      //GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
   end;

  procedure setValue(pRow:integer;AType:string);
  var vPostCriteria : TBooleanOperator;

  begin
    with asgRekap do  begin
      case AType[1] of
        SERVICE_TYPE_OTHERS : Cells[colgJenis,vRow ]:= 'Lain';
        SERVICE_TYPE_SINGLE : Cells[colgJenis,vRow ]:= 'Jasa';
        ITEM_TYPE_OIL  : Cells[colgJenis,vRow ]:= 'Oli';
        ITEM_TYPE_PART : Cells[colgJenis,vRow ]:= 'Part';
      end;
      vPostCriteria := boNone;
      vBruto  := TShipment.getValueItemType('d.price*d.quantity',GlobalPeriode,MasterPurpose,AType,0,'',boNone);
{diganti
                                   28.09.06     vPostCriteria}
      vDiskon := TShipment.getValueItemType('d.discount',GlobalPeriode,MasterPurpose,AType,0,'',boTrue);
      //vPiutang:= TShipment.getValueItemType2('d.amount',GlobalPeriode,MasterPurpose,AType,0,vPostCriteria,True,False); //boNone,True); //boFalse,True);
      //digentos kunu aya ship_service_type-ans
      vPiutang := 0; vPiutang2 := 0; vPiutang3 := 0;

      IF MasterPurpose = SHIP_TYPE_SALES then begin //(d.price * d.quantity)-d.discount
        vPiutang := TShipment.getValueItemType3('d.amount',GlobalPeriode,MasterPurpose,AType,SHIP_SALES_TYPE_REG,0,boFalse,True,False); //boNone,True); //boFalse,True);
        //diganti coz kredit kasusnya jiga ksg 18.12.06--vPiutang2 := TShipment.getValueItemType3('d.amount',GlobalPeriode,MasterPurpose,AType,SHIP_SALES_TYPE_CREDIT,0,boFalse,True,False); //boNone,True); //boFalse,True);
        vPiutang2 := TShipment.getValueItemType3('d.amount',GlobalPeriode,MasterPurpose,AType,SHIP_SALES_TYPE_CREDIT,0,vPostCriteria,True,False); 
      end
      else if MasterPurpose = SHIP_TYPE_SERVICE then begin
        vPiutang := TShipment.getValueItemType3('d.amount',GlobalPeriode,MasterPurpose,AType,SHIP_SERVICE_TYPE_REG,0,boFalse,True,False); //boNone,True); //boFalse,True);
        vPiutang2 := TShipment.getValueItemTypE3('d.amount',GlobalPeriode,MasterPurpose,AType,SHIP_SERVICE_TYPE_KSG,0,vPostCriteria,True,False); //boNone,True); //boFalse,True);
        vPiutang3 := TShipment.getValueItemType3('d.amount',GlobalPeriode,MasterPurpose,AType,SHIP_SERVICE_TYPE_COMP,0,boFalse,True,False); //boNone,True); //boFalse,True);
      end;

{diganti
                                   28.09.06     vPostCriteria}
      vNetto  := TShipment.getValueItemType2('d.amount',GlobalPeriode,MasterPurpose,AType,0,boNone,False,False); //boTrue,False);
      Floats[colgBruto,vRow]  := vBruto;
    //  Floats[colgDp,vRow]     := vDp;
      Floats[colgDisc,vRow]   := vDiskon;
      Floats[colgPiutang,vRow]:= vPiutang;
      Floats[colgPiutang2,vRow]:= vPiutang2;
      Floats[colgPiutang3,vRow]:= vPiutang3;
      Floats[colgNett,vRow]   := vNetto;
//      Ints[coldTransId,vRow]  := 1;//buat nandaan alignment
      vBrutoGrand   := vBrutoGrand + vBruto;
      vDiskonGrand  := vDiskonGrand + vDiskon;
      vPiutangGrand := vPiutangGrand + vPiutang;
      vPiutangGrand2 := vPiutangGrand2 + vPiutang2;
      vPiutangGrand3 := vPiutangGrand3 + vPiutang3;
      vNettoGrand   := vNettoGrand + vNetto;
//      vDpGrand      := vDpGrand + vDp;
    end;
  end;

begin
   InitGrid;
   SetFilter;
   vShowItem := True;
   vShowService := True;

   vBruto := 0; vDiskon:= 0; vPiutang:= 0;vPiutang2:= 0; vPiutang3 := 0; vNetto:= 0; vDp := 0;
   vBrutoGrand:= 0; vDiskonGrand:= 0; vPiutangGrand:= 0;vPiutangGrand2:= 0;vPiutangGrand3:= 0; vNettoGrand:= 0;
   with asgRekap do begin
      if MasterPurpose = SHIP_TYPE_SERVICE then begin
    //jasa
        if vShowService then begin
          vRow := RowCount-2;
          setValue(vRow,SERVICE_TYPE_SINGLE);
      //other
          AddRow;
          vRow := RowCount-2;
          setValue(vRow,SERVICE_TYPE_OTHERS);
          AddRow;
         end;
      end;
  //oli
      if vShowItem then begin
        vRow := RowCount-2;
        setValue(vRow,ITEM_TYPE_OIL);
    //part
        AddRow;
        vRow := RowCount-2;
        setValue(vRow,ITEM_TYPE_PART);
        AddRow
      end;
   end;

   with asgRekap do begin
    //AddRow;
    vRow := RowCount-2;
    SetCellColor(asgRekap,clSkyBlue,colgJenis,vRow,colgNett);
    Cells[colgJenis,vRow] := '<p><b>Grand Total</b></p>';
    Floats[colgBruto,vRow]  := vBrutoGrand;
   // Floats[colgDp,vRow]     := vDpGrand;
    Floats[colgDisc,vRow]   := vDiskonGrand;
    Floats[colgPiutang,vRow]:= vPiutangGrand;
    Floats[colgPiutang2,vRow]:= vPiutangGrand2;
    Floats[colgPiutang3,vRow]:= vPiutangGrand3;
    Floats[colgNett,vRow]   := vNettoGrand;
    AddRow;
    vDp     := TShipment.getValueShipField('s.down_payment',GlobalPeriode,MasterPurpose,True,boNone);
    vRow := RowCount-2;
    SetCellColor(asgRekap,clSkyBlue,colgJenis,vRow,colgNett);
    Cells[colgJenis,vRow] := '<p><b>Uang Muka</b></p>';
    Floats[colgNett,vRow] := vDp;
    AddRow;
    //blok discount
    vDp     := TShipment.getValueShipField('s.discount',GlobalPeriode,MasterPurpose,True,boTrue);
    vRow := RowCount-2;
    SetCellColor(asgRekap,clSkyBlue,colgJenis,vRow,colgNett);
    Cells[colgJenis,vRow] := '<p><b>Discount</b></p>';
    Floats[colgNett,vRow] := vDp;
    AddRow;
    //blok  netto
    vRow := RowCount-2;
    SetCellColor(asgRekap,clSkyBlue,colgJenis,vRow,colgNett);
    MergeCells(colgJenis,vRow,3,1);
    Cells[colgJenis,vRow] := '<p><b>Nilai Netto Akhir</b></p>';
    Floats[colgNett,vRow] := vNettoGrand - vDp;
    AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  DeleteRowTerakhir(asgRekap,3,1);
//  asgPerson.AutoNumberCol(colNo);
  ArrangeColSize;
end;


procedure TfrmEstimasiRekap.btnEditClick(Sender: TObject);
begin
   if cmbTipeLaporan.ItemIndex <> IDX_REKAP then exit;
  if asgRekap.Row = 0 then exit;

  case MasterPurpose[1] of
    ESTIMASI_TYPE_1,ESTIMASI_TYPE_ORDER : begin
      if cmbTipeLaporan.ItemIndex <> IDX_REKAP then exit;
      if asgRekap.Ints[colsId,asgRekap.Row] = 0 then exit;
     { if TShipment.isPosted(asgRekap.Ints[colsId,asgRekap.Row]) then begin
        Alert('Data tidak bisa diedit');
        exit;
      end;}
      if frmEstimasi.Execute(MasterPurpose,asgRekap.Ints[colsId,asgRekap.Row],True) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmEstimasiRekap.ReloadUnitMotor;
var vMotor : TMotor_Arr;
    i:integer;

    procedure setGrid;
    var j,arow : integer;
    begin
       vMotor.FindOnDb(True,'');
       for j:= 0 to vMotor.Count-1 do
         with asgRekap do begin
           arow := RowCount-2;
           Cells[coluCode,arow]  := vMotor[j].MotorCode;
           Cells[coluMotor,arow] := vMotor[j].MotorName;
           Ints[coluTahun,arow]  := vMotor[j].MotorYear;
           Ints[coluId,arow]     := vMotor[j].MotorId;
           AddRow;
         end;
       DeleteRowTerakhir(asgRekap,3,1);
       ArrangeColSize;
    end;
begin
   vMotor := TMotor_Arr.Create;
   InitGrid;
   GlobalPeriode.Reset;
//   GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.DateTime,dtpSampai1.DateTime,False);
//   SetPeriodeObject(GlobalPeriode,cmbOpr1.ItemIndex,dtpDari1,dtpSampai1);
   setGrid;
   for i:= 1 to asgRekap.RowCount-2 do
     with asgRekap do begin
       Ints[coluQty,i]     := TShipment.getUnitMotor(Ints[coluId,i],'');
       Floats[coluTotal,i] := TShipment.getTotalMotor(Ints[coluId,i],'');
     end;
   asgRekap.FloatingFooter.ColumnCalc[coluQty] := acSUM;
   asgRekap.FloatingFooter.ColumnCalc[coluTotal] := acSUM;
   ArrangeColSize;
   vMotor.Free;
end;

procedure TfrmEstimasiRekap.setComboTipeLap;
begin
  cmbTipeLaporan.Items.Clear;
  cmbTipeLaporan.Items.Add('Rekap Transaksi');
{  cmbTipeLaporan.Items.Add('Global');
  cmbTipeLaporan.Items.Add('Rekapitulasi');
  cmbTipeLaporan.Items.Add('Penjualan Khusus');
  cmbTipeLaporan.Items.Add('Global Per Part');
  cmbTipeLaporan.Items.Add('Global Per Part (History)');}
  case MasterPurpose[1] of
    SHIP_TYPE_SERVICE : begin
      cmbTipeLaporan.Items.Add('Per Unit Motor');
    end;
  end;
end;


procedure TfrmEstimasiRekap.ReloadRekapitulasi;
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
//      GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date,False);
      with vItemDetail.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

      end;
      with vService.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
      end;
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
      Cells[colpPiutang2,vRow_x] := IfThen(MasterPurpose=SHIP_TYPE_SALES,'Piutang Cr.','Piutang KSG');
      Cells[colpPiutang3,vRow_x] := 'Piutang Comp.';
      Cells[colpNetto,vRow_x] := 'Netto';
      Cells[colpTrans,vRow_x] := 'ID '+IfThen(MasterPurpose=SHIP_TYPE_SERVICE,'Service','Sales');
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
            if MasterPurpose = SHIP_TYPE_SALES then begin
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
   //vBruto := 0; vDiskon:= 0; vPiutang:= 0; vNetto:= 0;
   vBrutoGrand:= 0; vDiskonGrand:= 0; vPiutangGrand:= 0;vPiutangGrand2:= 0;vPiutangGrand3:= 0; vNettoGrand:= 0;
   with asgRekap do begin
      if MasterPurpose = SHIP_TYPE_SERVICE then begin
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

procedure TfrmEstimasiRekap.cmbTipeLaporanDropDown(Sender: TObject);
begin
   SetComboboxSize(cmbTipeLaporan,150);
end;

procedure TfrmEstimasiRekap.cmbTipeLaporanCloseUp(Sender: TObject);
begin
  SetComboboxSize(cmbTipeLaporan,105);
end;

procedure TfrmEstimasiRekap.txtNoPolKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId:integer;
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtNoPol.Text,'CUSTOMER',' AND person_type IN('+FormatSQLString(PS_TYPE_CUSTOMER)+
          ','+FormatSQLString(PS_TYPE_SUBDEALER)+')');
    txtNoPol.Text := TPersons.getCodeFromID(vId);
  end;

end;

procedure TfrmEstimasiRekap.cmbOpr2Change(Sender: TObject);
begin
   dtpSampai2.Enabled := (cmbOpr2.ItemIndex = 3) and (cmbOpr2.ItemIndex <> 0);
end;

procedure TfrmEstimasiRekap.chkTglTransClick(Sender: TObject);
begin
  pnlExpr.Enabled := chkTglTrans.Checked;
end;

procedure TfrmEstimasiRekap.txtKodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId:integer;
begin
  if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtKode.Text,'ITEM','');
    txtKode.Text := TItems.getFieldValue(vId,'item_code');
  end;


end;

procedure TfrmEstimasiRekap.txtNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId:integer;
begin
  if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('NAME',txtNama.Text,'ITEM','');
    txtNama.Text := TItems.getFieldValue(vId,'item_name');
  end;


end;

procedure TfrmEstimasiRekap.ReloadKhusus;
var vShipment : TShipment_Arr;
  i,j,vRow,vRow2,vDetailNo:integer;
  vListCust : TStringList;
  vOldCust:string;
  procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;

        //Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
        Shipment.Persons.PersonCode := txtNoPol.Text;
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

//        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date,False);
        if chkTglTrans.Checked then
           GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

   procedure getDistinctCust;
   var x:integer;
   begin
     vOldCust := '';
     vListCust.Clear;
     for x:= 0 to vShipment.GBuffer.RecordCount-1 do begin
       if vOldCust <> BufferToString(vShipment.GBuffer.Fields[1].Value) then begin
          vListCust.Add(BufferToString(vShipment.GBuffer.Fields[1].Value));
          vOldCust := BufferToString(vShipment.GBuffer.Fields[1].Value);
       end;
       vShipment.GBuffer.MoveNext;
     end;
   end;
begin
  vShipment := TShipment_Arr.Create;
  vListCust := TStringList.Create;
  InitGrid;
  SetFilter;
  vShipment.FindKhusus;
  getDistinctCust;
  vOldCust := '';

  for j:= 0 to vListCust.Count-1 do begin
    vRow := asgRekap.RowCount-2;
    asgRekap.Cells[colKCust,vRow] := vListCust.Strings[j];
    vOldCust := vListCust.Strings[j];
    asgRekap.AddRow;
    vShipment.GBuffer.MoveFirst;
    vDetailNo := 1;
    vRow2 := vRow;
    for i:= 0 to vShipment.GBuffer.RecordCount - 1 do begin
      with vShipment.GBuffer do begin
        if vOldCust <> BufferToString(Fields[1].Value) then begin
          MoveNext;
          Continue;
        end;
        with asgRekap do begin
           vRow2 := RowCount-2;
           Ints[colKNo,vRow2] := vDetailNo;
           Inc(vDetailNo);
           Cells[colKDate,vRow2] := NewFormatDate(BufferToDateTime(Fields[0].Value));
           //Cells[colKCust,vRow2]    := BufferToString(Fields[1].Value);
           Cells[colKPartCode,vRow2]  := BufferToString(Fields[2].Value);
           Cells[colKPartName,vRow2]:= BufferToString(Fields[3].Value);
           Floats[colKPriceSales,vRow2] := BufferToFloat(Fields[5].Value);
           Floats[colKPriceHpp,vRow2] := BufferToFloat(Fields[4].Value);
           Floats[colKQty,vRow2]  := BufferToFloat(Fields[6].Value);
           Floats[colKDisc,vRow2] := BufferToFloat(Fields[7].Value);
           Floats[colKTotal,vRow2]:= Floats[colKQty,vRow2] * Floats[colKPriceSales,vRow2] - Floats[colKDisc,vRow2];
           Ints[colKId,vRow2] := BufferToInteger(Fields[8].Value);
           AddRow;
        end;
        MoveNext;
      end;
      asgRekap.AddNode(vRow,vRow2-vRow+1);
      //asgRekap.AddRow;
     end;
   end;

   DeleteRowTerakhir(asgRekap,3,1);
   asgRekap.FloatingFooter.ColumnCalc[colKTotal] := acSUM;
   asgRekap.FloatingFooter.ColumnCalc[colKQty] := acSUM;
   ArrangeColSize;
   vShipment.Free;
   vListCust.Free;
end;

procedure TfrmEstimasiRekap.ReloadGlobalPart;
var vShipment : TShipment_Arr;
    i,vRow:integer;
  procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;

        //Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
       // Shipment.Persons.PersonCode := txtNoPol.Text;
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

//        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date,False);
        if chkTglTrans.Checked then
           GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

begin
  InitGrid;
  vShipment := TShipment_Arr.Create;
  SetFilter;
  if cmbTipeLaporan.ItemIndex = IDX_GLOBAL_PART then
    vShipment.FindGlobalPart
  else if cmbTipeLaporan.ItemIndex = IDX_GLOBAL_HISTORY   then
    vShipment.FindGlobalPartHistory;

  for i:= 0 to vShipment.GBuffer.RecordCount-1 do
    with vShipment.GBuffer do begin
      with asgRekap do begin
         vRow := RowCount-2;
//         cells[colGPNo,vRow] := 'No.';
         cells[colGPKode,vRow] := BufferToString(Fields[0].Value);
         cells[colGPNama,vRow] := BufferToString(Fields[1].Value);
         Floats[colGPQty,vRow]  := BufferToFloat(Fields[2].Value);
         Floats[colGPPrice,vRow] := BufferToFloat(Fields[3].Value);
         Floats[colGPDIsc,vRow]:= BufferToFloat(Fields[4].Value);
         Floats[colGPTotal,vRow] := (BufferToFloat(Fields[2].Value)*BufferToFloat(Fields[3].Value))-BufferToFloat(Fields[4].Value);//BufferToFloat(Fields[5].Value);
         AddRow;
      end;
      MoveNext;
    end;
  vShipment.Free;
  asgRekap.AutoNumberCol(0);
  DeleteRowTerakhir(asgRekap,3,1);
  asgRekap.FloatingFooter.ColumnCalc[colGPTotal] := acSUM;
  asgRekap.FloatingFooter.ColumnCalc[colGPQty] := acSUM;
  ArrangeColSize;
end;

procedure TfrmEstimasiRekap.ReloadKhusus2;
var vShipment : TShipment_Arr;
  i,j,vRow,vRow2,vDetailNo:integer;
  vListDate: TStringList;
  vOldDate:Tdate;
  vOldCust:string;
  procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;

        //Shipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
        Shipment.Persons.PersonCode := txtNoPol.Text;
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

//        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date,False);
        if chkTglTrans.Checked then
           GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

   procedure getDistinctDate;
   var x:integer;
   begin
     vOldDate := 0;
     vListDate.Clear;
     for x:= 0 to vShipment.GBuffer.RecordCount-1 do begin
       if Trunc(vOldDate) <> trunc(BufferToDateTime(vShipment.GBuffer.Fields[0].Value)) then begin
          vListDate.Add(NewFormatDate(BufferToDateTime(vShipment.GBuffer.Fields[0].Value)));
          vOldDate := BufferToDateTime(vShipment.GBuffer.Fields[0].Value);
       end;
       vShipment.GBuffer.MoveNext;
     end;
   end;
begin
  vShipment := TShipment_Arr.Create;
  vListDate := TStringList.Create;
  InitGrid;
  SetFilter;
  vShipment.FindKhusus;
  getDistinctDate;
  vOldDate := 0;

  for j:= 0 to vListDate.Count-1 do begin
    vRow := asgRekap.RowCount-2;
    asgRekap.Cells[colKDate,vRow] := vListDate.Strings[j];
    vOldDate := StrToDateDef(vListDate.Strings[j],0);
    asgRekap.AddRow;
    vShipment.GBuffer.MoveFirst;
    vDetailNo := 1;
    vOldCust := '';
    vRow2 := vRow;
    for i:= 0 to vShipment.GBuffer.RecordCount - 1 do begin
      with vShipment.GBuffer do begin
        if Trunc(vOldDate) <> trunc(BufferToDateTime(Fields[0].Value)) then begin
          MoveNext;
          Continue;
        end;
        with asgRekap do begin
           vRow2 := RowCount-2;
           Ints[colKNo,vRow2] := vDetailNo;
           Inc(vDetailNo);
           //Cells[colKDate,vRow2] := NewFormatDate(BufferToDateTime(Fields[0].Value));
           if vOldCust <> BufferToString(Fields[1].Value) then begin
              Cells[colKCust,vRow2]    := BufferToString(Fields[1].Value);
              vOldCust := BufferToString(Fields[1].Value);
           end;
           Cells[colKPartCode,vRow2]  := BufferToString(Fields[2].Value);
           Cells[colKPartName,vRow2]:= BufferToString(Fields[3].Value);
           Floats[colKPriceSales,vRow2] := BufferToFloat(Fields[5].Value);
           Floats[colKPriceHpp,vRow2] := BufferToFloat(Fields[4].Value);
           Floats[colKQty,vRow2]  := BufferToFloat(Fields[6].Value);
           Floats[colKDisc,vRow2] := BufferToFloat(Fields[7].Value);
           Floats[colKTotal,vRow2]:= Floats[colKQty,vRow2] * Floats[colKPriceSales,vRow2] - Floats[colKDisc,vRow2];
           Ints[colKId,vRow2] := BufferToInteger(Fields[8].Value);
           AddRow;
        end;
        MoveNext;
      end;
      asgRekap.AddNode(vRow,vRow2-vRow+1);
      //asgRekap.AddRow;
     end;
   end;

   DeleteRowTerakhir(asgRekap,3,1);
   asgRekap.FloatingFooter.ColumnCalc[colKTotal] := acSUM;
   asgRekap.FloatingFooter.ColumnCalc[colKQty] := acSUM;
   ArrangeColSize;
   vShipment.Free;
   vListDate.Free;


end;

procedure TfrmEstimasiRekap.ReloadEstimasi;
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
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

        if chkTglTrans.Checked then
           GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

begin
   try
     Screen.Cursor := crSQLWait;
     frmMainMenu.Gauge.Show;
     vShipment := TShipment_Arr.Create;
     SetFilter;
     vShipment.FindOnDbEstimasi('',true);
     InitGrid;
     for i:= 0 to vShipment.Count-1 do
       with asgRekap do begin
         Update;
         vRow := asgRekap.RowCount-1;
         frmMainMenu.Gauge.Progress := round((i+1)/(vShipment.Count)*100);
         Cells[colsNum,vRow] := vShipment[i].ShipNum;
         Cells[colsDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
         Cells[colsExpr,vRow]:= NewFormatDate(vShipment[i].ExprDate);
         TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
         Cells[colsCust,vRow] := vShipment[i].Persons.PersonName;
         Cells[colsNoPol,vRow]:= vShipment[i].NoPol;// Persons.PersonCode;
         Cells[colsMekanik,vRow] := TShipmentMechanic_Arr.getMechanic(vShipment[i].ShipId); //TPersons.getInfo(vShipment[i].PersonsMekanik_Id.PersonId);
         Cells[colsnote,vRow]:= vShipment[i].Notes;
         Cells[colsTipe,vRow] :=TShipment.getDescTransType(vShipment[i].ShipType,vShipment[i].ShipServiceType);
         Cells[colsUser,vRow]:= vShipment[i].UserInsert;
         Cells[colsStatus,vRow] := IfThen(vShipment[i].IsPost,'Posted','Pending');
         Ints[colsId,vRow]   := vShipment[i].ShipId;
         AddRow;
       end;
     DeleteRowTerakhir(asgRekap,2,1);
   finally
     Screen.Cursor := crDefault;
     frmMainMenu.Gauge.Hide;
     vShipment.Free;

     ArrangeColSize;
   end;


end;

procedure TfrmEstimasiRekap.ReloadOrderBengkel;
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
        ItemBalance.Items.ItemCode  := UpperCase(txtKode.Text);
        ItemBalance.Items.ItemName  := UpperCase(txtNama.Text);

        if chkTglTrans.Checked then
           GlobalPeriode.setPeriode(cmbOpr2.ItemIndex,dtpDari2.Date,dtpSampai2.Date);

      end;
   end;

begin
   try
     Screen.Cursor := crSQLWait;
     frmMainMenu.Gauge.Show;
     vShipment := TShipment_Arr.Create;
     SetFilter;
     vShipment.FindOnDbEstimasi('',true);
     InitGrid;
     for i:= 0 to vShipment.Count-1 do
       with asgRekap do begin
         Update;
         vRow := asgRekap.RowCount-1;
         frmMainMenu.Gauge.Progress := round((i+1)/(vShipment.Count)*100);
         Cells[colsNum,vRow] := vShipment[i].ShipNum;
         Cells[colsDate,vRow]:= NewFormatDate(vShipment[i].ShipDate);
         Cells[colsExpr,vRow]:= NewFormatDate(vShipment[i].ExprDate);
         TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
         Cells[colsCust,vRow] := vShipment[i].Persons.PersonName;
         Cells[colsNoPol,vRow]:= vShipment[i].NoPol;// Persons.PersonCode;
         Cells[colsMekanik,vRow] := TShipmentMechanic_Arr.getMechanic(vShipment[i].ShipId); //TPersons.getInfo(vShipment[i].PersonsMekanik_Id.PersonId);
         Cells[colsnote,vRow]:= vShipment[i].Notes;
         Cells[colsTipe,vRow] :=TShipment.getDescTransType(vShipment[i].ShipType,vShipment[i].ShipServiceType);
         Cells[colsUser,vRow]:= vShipment[i].UserInsert;
         Cells[colsStatus,vRow] := IfThen(vShipment[i].IsPost,'Posted','Pending');
         Ints[colsId,vRow]   := vShipment[i].ShipId;
         AddRow;
       end;
     DeleteRowTerakhir(asgRekap,2,1);
   finally
     Screen.Cursor := crDefault;
     frmMainMenu.Gauge.Hide;
     vShipment.Free;

     ArrangeColSize;
   end;


end;

end.

