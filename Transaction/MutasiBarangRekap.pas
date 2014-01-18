unit MutasiBarangRekap;
  //utk restoran dan purchase rekap
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,Math,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit, ExtCtrls, ComCtrls;

type
  TfrmMutasiBarangRekap = class(TForm)
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
    sttGudang: TStaticText;
    Bevel1: TBevel;
    cmbGudang: TComboBox;
    btnDelete: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnDetailClick(Sender: TObject);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRekapDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cmbOpr1Change(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    { Private declarations }
    MasterPurpose : string;
    procedure InitFIlter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadMutasi;
  public

    function Execute(aPurpose:string;AMenuId:integer):boolean;
  end;

var
  frmMutasiBarangRekap: TfrmMutasiBarangRekap;

const colNo =0;
      colNum = 1;
      colDate = 2;
      colNotes = 3;
      colOperator = 4;
      colSeq = 5;

      {utk Mutasi}
      colrNo = 0;
      colrNum = 1;
      colrDate = 2;
      colrGudang = 3;
      colrNotes = 4;
      colrUser = 5;
      colrId = 6;

      {utk Service/sales}
      colsNo = 0;
      colsNum = 1;
      colsDate = 2;
      colsCust = 3;
      colsNoPol = 4;
      colsNote = 5;
      colsUser = 6;
      colsId = 7;

implementation

uses MainMenu, Subroutines, un_ryu, UTransaction, Penerimaan, UConst,
  AutoBengkel,  SQLServerConnections, UMaster, MutasiBarang, Services,
  Sales, ReturBeli, ReturSales, ReturService, MutasiRekapPrint;

{$R *.dfm}

{ TfrmPenerimaanRekap }

procedure TfrmMutasiBarangRekap.ArrangeColSize;
begin
  case MasterPurpose[1] of
    SHIP_TYPE_TERIMA_BARANG,SHIP_TYPE_SALES,SHIP_TYPE_RETUR_BELI,SHIP_TYPE_RETUR_SALES : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colSeq]:= 0;
    end;
    SHIP_TYPE_MUTASI_MASUK,SHIP_TYPE_MUTASI_KELUAR : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colrNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colrId]:= 0;
    end;
    SHIP_TYPE_RETUR_SERVICE,SHIP_TYPE_SERVICE : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colsNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colsId]:= 0;
    end;
  end;
end;

function TfrmMutasiBarangRekap.Execute(aPurpose:string;AMenuId:integer): boolean;
begin
 Result := True;
 if not Can_Access(Self,AMenuId) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  MasterPurpose := aPurpose;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter,90);
  InitForm;
  btnOk.Click;
  btnAdd.Click;
  Run(Self);
  if ModalResult= mrOK then
    Result := True;
end;

procedure TfrmMutasiBarangRekap.InitForm;
begin
  StaticText1.Font.Color := clBlack;
  sttGudang.Caption := IfThen(MasterPurpose=SHIP_TYPE_MUTASI_MASUK,'Gudang Asal','Gudang Tujuan');
  InitFIlter;
  InitGrid;
  MainPanel.Update;
end;

procedure TfrmMutasiBarangRekap.InitGrid;
begin
  case MasterPurpose[1] of
     SHIP_TYPE_TERIMA_BARANG,SHIP_TYPE_RETUR_BELI : begin
        asgRekap.Clear;
        ResetGrid(asgRekap,2,7,1,1);
        with asgRekap do begin
           Cells[colNo,0]   := 'No.';
           Cells[colNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_TERIMA_BARANG,'Terima','Retur');
           Cells[colDate,0] := 'Tanggal';
           Cells[colNotes,0]:= 'Keterangan';
           Cells[colOperator,0]:= 'Operator';
           Cells[colSeq,0]  := 'Sequence';
        end;
      end;
     SHIP_TYPE_MUTASI_MASUK,SHIP_TYPE_MUTASI_KELUAR : begin
        asgRekap.Clear;
        ResetGrid(asgRekap,2,8,1,1);
        with asgRekap do begin
           Cells[colrNo,0]   := 'No.';
           Cells[colrNum,0]  := 'No.Mutasi';
           Cells[colrDate,0] := 'Tanggal';
           Cells[colrGudang,0]:= 'Gudang '+IfThen(MasterPurpose=SHIP_TYPE_MUTASI_MASUK,'Asal','Tujuan');
           Cells[colrNotes,0]:= 'Keterangan';
           Cells[colrUser,0] := 'Operator';
           Cells[colrId,0]  := 'ShipId';
        end;
     end;
     SHIP_TYPE_RETUR_SALES,SHIP_TYPE_SALES : begin
        asgRekap.Clear;
        ResetGrid(asgRekap,2,7,1,1);
        with asgRekap do begin
           Cells[colrNo,0]   := 'No.';
           Cells[colrNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SALES,'Retur',
              IfThen(MasterPurpose=SHIP_TYPE_SALES,'Sales','Service'));

           Cells[colrDate,0] := 'Tanggal';
           Cells[colrNotes,0]:= 'Keterangan';
           Cells[colrUser,0] := 'Operator';
           Cells[colrId,0]  := 'ShipId';
        end;
     end;
     SHIP_TYPE_SERVICE,SHIP_TYPE_RETUR_SERVICE : begin
       asgRekap.Clear;
       ResetGrid(asgRekap,2,9,1,1);
        with asgRekap do begin
           Cells[colsNo,0]   := 'No.';
           Cells[colsNum,0]  := 'No. '+IfThen(MasterPurpose=SHIP_TYPE_RETUR_SERVICE,'Retur','Service');
           Cells[colsDate,0] := 'Tanggal';
           Cells[colsCust,0] := 'Pelanggan';
           Cells[colsNoPol,0]:= 'No.Polisi';
           Cells[colsNote,0]:= 'Keterangan';
           Cells[colsUser,0] := 'Operator';
           Cells[colsId,0]  := 'ShipId';
        end;
     end;
  end;
  ArrangeColSize;
end;

{procedure TfrmMutasiBarangRekap.ReloadGrid;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
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
       Cells[colDate,vRow]:= FormatDateTime(ShortDateFormat,vShipment[i].ShipDate);
       Cells[colnotes,vRow]:= vShipment[i].Notes;
       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[colSeq,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;
end;}

procedure TfrmMutasiBarangRekap.btnAddClick(Sender: TObject);
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
  end;
end;

procedure TfrmMutasiBarangRekap.btnOkClick(Sender: TObject);
begin
  case MasterPurpose[1] of
//    SHIP_TYPE_TERIMA_BARANG :  ReloadGrid;
    SHIP_TYPE_MUTASI_MASUK,SHIP_TYPE_MUTASI_KELUAR : ReloadMutasi;
 //   SHIP_TYPE_SERVICE : ReloadService;
   // SHIP_TYPE_RETUR_SERVICE : ReloadReturService;
  end;
end;

procedure TfrmMutasiBarangRekap.btnDetailClick(Sender: TObject);
begin
  if asgRekap.Row = 0 then exit;

  case MasterPurpose[1] of

    SHIP_TYPE_MUTASI_KELUAR : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        frmMutasiBarang.Execute(asgRekap.Ints[colrId,asgRekap.Row]);
    end;
    SHIP_TYPE_MUTASI_MASUK : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        frmMutasiBarang.ExecuteMutasiIn(asgRekap.Ints[colrId,asgRekap.Row]);
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
      if frmSales.Execute(asgRekap.Ints[colSeq,asgRekap.Row]) then
        btnOk.Click;
    end;

    SHIP_TYPE_RETUR_SALES : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
      if frmReturSales.Execute(asgRekap.Ints[colSeq,asgRekap.Row]) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmMutasiBarangRekap.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter;
end;

procedure TfrmMutasiBarangRekap.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then exit;
  btnDetail.Click;
end;

procedure TfrmMutasiBarangRekap.cmbOpr1Change(Sender: TObject);
begin
    dtpSampai1.Enabled := (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
end;

procedure TfrmMutasiBarangRekap.InitFIlter;
begin
  TWarehouse_Arr.getListGudang(G_WAREHOUSE,cmbGudang.Items,False,True);
  cmbGudang.ItemIndex := 0;
  cmbOpr1.ItemIndex    := cmbOpr1.Items.Count-1;
  dtpSampai1.Enabled:= (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
  dtpDari1.Date     := ServerNow-3;
  dtpSampai1.Date   := ServerNow;
end;

procedure TfrmMutasiBarangRekap.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,90);
end;

procedure TfrmMutasiBarangRekap.btnResetClick(Sender: TObject);
begin
    InitFIlter;
end;

procedure TfrmMutasiBarangRekap.ReloadMutasi;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        if cmbGudang.ItemIndex<>-1 then begin
          if MasterPurpose = SHIP_TYPE_MUTASI_KELUAR then
            Shipment.WhIdOut := StrToInt(G_WAREHOUSE.Names[cmbGudang.itemIndex])
          else if MasterPurpose = SHIP_TYPE_MUTASI_MASUK then
            Shipment.Warehouse.WhId := StrToInt(G_WAREHOUSE.Names[cmbGudang.itemIndex])
        end;

        {MasterPurpose = SHIP_TYPE_MUTASI_MASUK
        MasterPurpose = SHIP_TYPE_MUTASI_KELUAR}
//        if cmbBahan.ItemIndex <> -1 then
  //        ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
//   TWarehouse_Arr.getListGudang(G_WAREHOUSE,cmbGudang.Items,False,True);
   
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb;
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[colrNum,vRow] := vShipment[i].ShipNum;
       Cells[colrDate,vRow]:= FormatDateTime(ShortDateFormat,vShipment[i].ShipDate);
       Cells[colrnotes,vRow]:= vShipment[i].Notes;
       Cells[colrGudang,vRow]:= TWarehouse.getName(IfThen(vShipment[i].ShipType=SHIP_TYPE_MUTASI_MASUK,vShipment[i].Warehouse.WhId,vShipment[i].WhIdOut));
       Cells[colrUser,vRow]:= vShipment[i].UserInsert;
       Ints[colrId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;

end;

{procedure TfrmMutasiBarangRekap.ReloadService;
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
       Cells[colsnote,vRow]:= vShipment[i].Notes;
       Cells[colsUser,vRow]:= vShipment[i].UserInsert;
       Ints[colsId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

procedure TfrmMutasiBarangRekap.ReloadReturService;
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
       Cells[colsNote,vRow]:= vShipment[i].Notes;
       Cells[colsUser,vRow]:= vShipment[i].UserInsert;
       Ints[colsId,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;}

procedure TfrmMutasiBarangRekap.btnDeleteClick(Sender: TObject);
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
   SHIP_TYPE_MUTASI_KELUAR : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        TShipment.DeleteShipment(asgRekap.Ints[colrId,asgRekap.Row]);
    end;
    SHIP_TYPE_MUTASI_MASUK : begin
      if asgRekap.Ints[colrId,asgRekap.Row] = 0 then exit;
        TShipment.DeleteShipment(asgRekap.Ints[colrId,asgRekap.Row]);
    end;
  end;    
end;

procedure TfrmMutasiBarangRekap.btnPrintClick(Sender: TObject);
var  vShipment : TShipment_Arr;
  procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := MasterPurpose;

        if cmbGudang.ItemIndex<>-1 then begin
          if MasterPurpose = SHIP_TYPE_MUTASI_KELUAR then
            Shipment.WhIdOut := StrToInt(G_WAREHOUSE.Names[cmbGudang.itemIndex])
          else if MasterPurpose = SHIP_TYPE_MUTASI_MASUK then
            Shipment.Warehouse.WhId := StrToInt(G_WAREHOUSE.Names[cmbGudang.itemIndex])
        end;

//        if cmbBahan.ItemIndex <> -1 then
  //        ItemBalance.Items.ItemId := StrToInt(G_ITEM_LIST.Names[cmbBahan.itemIndex]);
      end;
   end;

begin
  vShipment := TShipment_Arr.Create;
  SetFilter;
  Application.CreateForm(TqrpMutasiRekap,qrpMutasiRekap);
  qrpMutasiRekap.ExecutQuery(MasterPurpose,vShipment.Filter.Shipment.WhIdOut,vShipment.Filter.Shipment.Warehouse.WhId);
  qrpMutasiRekap.Free;
  vShipment.Free;
end;

end.
