unit StokOpnameRekap;
  //utk restoran dan purchase rekap
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,Math,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, AdvEdit, ExtCtrls, ComCtrls;

type
  TfrmOpnameRekap = class(TForm)
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
    procedure ReloadData;
  public

    function Execute(aPurpose:string;AMenuId:integer):boolean;
  end;

var
  frmOpnameRekap: TfrmOpnameRekap;

const colNo =0;
      colNum = 1;
      colDate = 2;
      colNotes = 3;
      colOperator = 4;
      colSeq = 5;

      

implementation

uses MainMenu, Subroutines, un_ryu, UTransaction,  UConst,
  AutoBengkel,  SQLServerConnections, UMaster, MutasiRekapPrint, StokOpname;

{$R *.dfm}

{ TfrmPenerimaanRekap }

procedure TfrmOpnameRekap.ArrangeColSize;
begin
  case MasterPurpose[1] of
    SHIP_TYPE_OPNAME : begin
      asgRekap.AutoSizeColumns(True,5);
      asgRekap.AutoNumberCol(colNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colSeq]:= 0;
    end;
  end;
end;

function TfrmOpnameRekap.Execute(aPurpose:string;AMenuId:integer): boolean;
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

procedure TfrmOpnameRekap.InitForm;
begin
  StaticText1.Font.Color := clBlack;
  sttGudang.Caption := IfThen(MasterPurpose=SHIP_TYPE_MUTASI_MASUK,'Gudang Asal','Gudang Tujuan');
  InitFIlter;
  InitGrid;
  MainPanel.Update;
end;

procedure TfrmOpnameRekap.InitGrid;
begin
  case MasterPurpose[1] of
     SHIP_TYPE_OPNAME : begin
        asgRekap.Clear;
        ResetGrid(asgRekap,2,7,1,1);
        with asgRekap do begin
           Cells[colNo,0]   := 'No.';
           Cells[colNum,0]  := 'No. StokOpname';
           Cells[colDate,0] := 'Tanggal';
           Cells[colNotes,0]:= 'Keterangan';
           Cells[colOperator,0]:= 'Operator';
           Cells[colSeq,0]  := 'Sequence';
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

procedure TfrmOpnameRekap.btnAddClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    
    SHIP_TYPE_OPNAME : begin
      if frmStokOpname.Execute(0) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmOpnameRekap.btnOkClick(Sender: TObject);
begin
  case MasterPurpose[1] of
//    SHIP_TYPE_TERIMA_BARANG :  ReloadGrid;
    SHIP_TYPE_OPNAME : ReloadData;
 //   SHIP_TYPE_SERVICE : ReloadService;
   // SHIP_TYPE_RETUR_SERVICE : ReloadReturService;
  end;
end;

procedure TfrmOpnameRekap.btnDetailClick(Sender: TObject);
begin
  if asgRekap.Row = 0 then exit;

  case MasterPurpose[1] of

    SHIP_TYPE_OPNAME : begin
      if asgRekap.Ints[colSeq,asgRekap.Row] = 0 then exit;
      if frmStokOpname.Execute(asgRekap.Ints[colSeq,asgRekap.Row]) then
        btnOk.Click;
    end;
  end;
end;

procedure TfrmOpnameRekap.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter;
end;

procedure TfrmOpnameRekap.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then exit;
  btnDetail.Click;
end;

procedure TfrmOpnameRekap.cmbOpr1Change(Sender: TObject);
begin
    dtpSampai1.Enabled := (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
end;

procedure TfrmOpnameRekap.InitFIlter;
begin
  TWarehouse_Arr.getListGudang(G_WAREHOUSE,cmbGudang.Items,False,True);
  cmbGudang.ItemIndex := 0;
  cmbOpr1.ItemIndex    := cmbOpr1.Items.Count-1;
  dtpSampai1.Enabled:= (cmbOpr1.ItemIndex = 3) and (cmbOpr1.ItemIndex <> 0);
  dtpDari1.Date     := ServerNow-3;
  dtpSampai1.Date   := ServerNow;
end;

procedure TfrmOpnameRekap.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,90);
end;

procedure TfrmOpnameRekap.btnResetClick(Sender: TObject);
begin
    InitFIlter;
end;

procedure TfrmOpnameRekap.ReloadData;
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
       Cells[colNum,vRow] := vShipment[i].ShipNum;
       Cells[colDate,vRow]:= FormatDateTime(ShortDateFormat,vShipment[i].ShipDate);
       Cells[colnotes,vRow]:= vShipment[i].Notes;
//       Cells[colGudang,vRow]:= TWarehouse.getName(IfThen(vShipment[i].ShipType=SHIP_TYPE_MUTASI_MASUK,vShipment[i].Warehouse.WhId,vShipment[i].WhIdOut));
       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[colSeq,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;

end;


procedure TfrmOpnameRekap.btnDeleteClick(Sender: TObject);
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
   SHIP_TYPE_OPNAME : begin
      if asgRekap.Ints[colSeq,asgRekap.Row] = 0 then exit;
        TShipment.DeleteShipment(asgRekap.Ints[colSeq,asgRekap.Row]);
    end;
  end;
end;

procedure TfrmOpnameRekap.btnPrintClick(Sender: TObject);
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
