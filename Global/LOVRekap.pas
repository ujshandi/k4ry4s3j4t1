unit LOVRekap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,strUtils,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid, AdvEdit;

type
  TfrmLOVRekap = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    asgRekap: TAdvStringGrid;
    btnOk: TButton;
    btnFilter: TButton;
    btnDetail: TButton;
    btnRefresh: TButton;
    pnlFilter: TPanel;
    d: TBevel;
    l: TLabel;
    btnReset: TButton;
    cmbOpr1: TComboBox;
    dtpDari1: TDateTimePicker;
    dtpSampai1: TDateTimePicker;
    StaticText2: TStaticText;
    gbrPerson: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    txtKode: TAdvEdit;
    txtNama: TAdvEdit;
    StaticText1: TStaticText;
    Label3: TLabel;
    txtFaktur: TAdvEdit;
    Bevel1: TBevel;
    procedure btnOkClick(Sender: TObject);
    procedure asgRekapDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnFilterClick(Sender: TObject);
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRekapKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
    MasterPurpose,PersonType : string;
    procedure InitFilter;
    procedure ArrangeColSize;
    procedure InitForm;
    procedure InitGrid;
    procedure LoadService;
    procedure LoadSales;
    procedure LoadOrder;
    procedure LoadSalesService;
    procedure LoadTerima;
    procedure LoadPerson(APsTypes:string);
  public
    { Public declarations }
    function ExecuteService:integer;
    function ExecuteSales:integer;
    function ExecutePerson(APsTypes:string):integer;
    function ExecuteTerima:integer;
    function ExecuteSalesService:integer;

    function ExecuteOrder:integer;
  end;

var
  frmLOVRekap: TfrmLOVRekap;


implementation

uses UConst, un_ryu, Subroutines,  SQLServerConnections,
  AutoBengkel, UTransaction, UMaster;
CONST
  LOV_SERVICE = 'S';
  LOV_SALES = 'L';
  LOV_PERSON = 'P';
  LOV_TERIMA = 'T';
  LOV_SALES_SERVICE = 'V';
  LOV_ORDER = 'O'; //order bengkel
  
  colNo =0;
  colNum = 1;
  colDate = 2;
  colGuest = 3;
  colType = 4;
  colChekIn = 5;
  colChekOut =6;
  colId = 7;
{$R *.dfm}

{ TfrmLOVRekap }

procedure TfrmLOVRekap.ArrangeColSize;
begin
  case MasterPurpose[1] of
    LOV_SERVICE,LOV_SALES,LOV_SALES_SERVICE : begin
      asgRekap.AutoSizeColumns(True,2);
      asgRekap.AutoNumberCol(colNo);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[4] := 0;
    end;
    LOV_PERSON : begin
      asgRekap.AutoSizeColumns(True,2);
      asgRekap.AutoNumberCol(0);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[7] := 0;
    end;
    LOV_TERIMA : begin
      asgRekap.AutoSizeColumns(True,2);
      asgRekap.AutoNumberCol(0);
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[6] := 0;
    end;
  end;
end;


procedure TfrmLOVRekap.InitForm;
begin
  InitGrid;
  InitFilter;
end;

procedure TfrmLOVRekap.InitGrid;
begin
  case MasterPurpose[1] of
    LOV_SERVICE,LOV_SALES,LOV_SALES_SERVICE : begin
      asgRekap.Clear;
      ResetGrid(asgRekap,2,6,1,1);
      with asgRekap do begin
        Cells[0,0]    := 'No.';
        Cells[1,0]   := 'No.Faktur';
        Cells[2,0]  := 'Tanggal';
        Cells[3,0]  := 'Pelanggan';
       // Cells[colGuest,0] := 'Guest';
       // Cells[colChekIn,0]:= 'Check In';
       // Cells[colChekOut,0]:= 'Check Out';
        Cells[4,0]:= 'ID';
      end;
    end;
    LOV_PERSON : begin
       asgRekap.Clear;
        ResetGrid(asgRekap,2,9,1,1);
        with asgRekap do begin
          Cells[0,0]  := 'No.';
          Cells[1,0]  := 'ID Pelanggan';
          Cells[2,0]  := 'Nama Pelanggan';
          Cells[3,0]  := 'Alamat';
          Cells[4,0]  := 'Tlp';
          Cells[5,0]  := 'Kota';
          Cells[6,0]  :='Tlp2';
          Cells[7,0]  := 'guestid';
        end;
    end;
    LOV_TERIMA : begin
      asgRekap.Clear;
      ResetGrid(asgRekap,2,8,1,1);
      with asgRekap do begin
        Cells[0,0]  := 'No.';
        Cells[1,0]  := 'Tanggal';
        Cells[2,0]  := 'No.Terima';
        Cells[3,0]  := 'Supplier';
        Cells[4,0]  := 'Keterangan';
        Cells[5,0]  := 'Operator';
        Cells[6,0]  := 'ID';
      end;
    end;
    LOV_ORDER : begin
      asgRekap.Clear;
      ResetGrid(asgRekap,2,8,1,1);
      with asgRekap do begin
        Cells[0,0]  := 'No.';
        Cells[1,0]  := 'Tanggal';
        Cells[2,0]  := 'No.Order';
        Cells[3,0]  := 'Customer';
        Cells[4,0]  := 'Keterangan';
        Cells[5,0]  := 'Operator';
        Cells[6,0]  := 'ID';
      end;
    end;
  end;
  ArrangeColSize;
end;


procedure TfrmLOVRekap.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfrmLOVRekap.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
 if ARow = 0 then exit;
 ModalResult := mrOk;
end;

procedure TfrmLOVRekap.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter,90);
end;

procedure TfrmLOVRekap.InitFilter;
begin
  cmbOpr1.ItemIndex := cmbOpr1.Items.Count-1;
  dtpDari1.Date     := ServerNow-3;
  dtpSampai1.Date   := ServerNow;
  txtKode.Clear;
  txtNama.Clear;
  txtFaktur.Clear;
end;


function TfrmLOVRekap.ExecuteService: integer;
begin
  Self.Caption := 'Rekap Service';
  Result :=0;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  MasterPurpose := LOV_SERVICE;
  InitForm;
  LoadService;
  ShowModal;
  if ModalResult = mrOK then begin
    Result := asgRekap.Ints[4,asgRekap.Row];
    Close;
  end;
end;

procedure TfrmLOVRekap.LoadService;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := SHIP_TYPE_SERVICE;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        Shipment.ShipNum := UpperCase(txtFaktur.Text);
        Shipment.Persons.PersonCode := UpperCase(txtKode.Text);
        Shipment.Persons.PersonName := UpperCase(txtNama.Text);
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
       Cells[1,vRow] := vShipment[i].ShipNum;
       Cells[2,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[3,vRow] := vShipment[i].Persons.PersonName;
//       Cells[colnotes,vRow]:= vShipment[i].Notes;
//       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[4,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

function TfrmLOVRekap.ExecuteSales: integer;
begin
  Self.Caption := 'Rekap Sales';
  Result :=0;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  MasterPurpose := LOV_SALES;
  InitForm;
  LoadSales;
  ShowModal;
  if ModalResult = mrOK then begin
    Result := asgRekap.Ints[4,asgRekap.Row];
    Close;
  end;
end;

procedure TfrmLOVRekap.LoadSales;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := SHIP_TYPE_SALES;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        Shipment.ShipNum := UpperCase(txtFaktur.Text);
        Shipment.Persons.PersonCode := UpperCase(txtKode.Text);
        Shipment.Persons.PersonName := UpperCase(txtNama.Text);
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
       Cells[1,vRow] := vShipment[i].ShipNum;
       Cells[2,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[3,vRow] := vShipment[i].Persons.PersonName;
//       Cells[colnotes,vRow]:= vShipment[i].Notes;
//       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[4,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

function TfrmLOVRekap.ExecutePerson(APsTypes: string): integer;
begin
  Self.Caption := 'Rekap Relasi';
  Result :=0;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  MasterPurpose := LOV_PERSON;
  InitForm;
  LoadPerson(APsTypes);
  ShowModal;
  if ModalResult = mrOK then begin
    Result := asgRekap.Ints[7,asgRekap.Row];
    Close;
  end;

end;

procedure TfrmLOVRekap.LoadPerson(APsTypes: string);
var i: integer;
  RelationArr: TPersons_Arr;

  procedure SetFilter;
  begin
     RelationArr.Clear;
     RelationArr.Filter.Reset;
     RelationArr.Filter.PersonType :=  APsTypes;
     RelationArr.Filter.PersonCode :=  txtKode.Text;
     RelationArr.Filter.PersonName :=  txtNama.Text;

  end;
begin
  RelationArr := TPersons_Arr.Create;
  InitGrid;
  SetFilter;
  RelationArr.FindOnDB(False,True);
  for i:= 0 to RelationArr.Count-1 do begin
    asgRekap.Cells[1,   i+1]:= RelationArr[i].PersonCode;
    asgRekap.Cells[2,   i+1]:= RelationArr[i].PersonName;
    asgRekap.Cells[3,i+1]:= RelationArr[i].Address;
    asgRekap.Cells[4,   i+1]:= RelationArr[i].City;
    asgRekap.Cells[5,  i+1]:= RelationArr[i].Phone1;
    asgRekap.Cells[6, i+1]:= RelationArr[i].Phone2;
    asgRekap.Ints[7,     i+1]:= RelationArr[i].PersonId;
    asgRekap.AddRow;
  end;
  DeleteRowTerakhir(asgRekap,2,1);
  asgRekap.AutoNumberCol(0);
  ArrangeColSize;
  RelationArr.Free;

end;

function TfrmLOVRekap.ExecuteTerima: integer;
begin
  Self.Caption := 'Rekap Purchase';
  Result :=0;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  MasterPurpose := LOV_TERIMA;
  InitForm;
  LoadTerima;
  ShowModal;
  if ModalResult = mrOK then begin
    Result := asgRekap.Ints[6,asgRekap.Row];
    Close;
  end;
end;

procedure TfrmLOVRekap.LoadTerima;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := SHIP_TYPE_TERIMA_BARANG;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        Shipment.ShipNum := UpperCase(txtFaktur.Text);
        Shipment.Persons.PersonCode := UpperCase(txtKode.Text);
        Shipment.Persons.PersonName := UpperCase(txtNama.Text);
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
       Cells[1,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       Cells[2,vRow]:= vShipment[i].ShipNum;
       Cells[3,vRow]:= TPersons.getInfo(vShipment[i].Persons.PersonId);
       Cells[4,vRow]:= vShipment[i].Notes;
       Cells[5,vRow]:= vShipment[i].UserInsert;
       Ints[6,vRow] := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

function TfrmLOVRekap.ExecuteSalesService: integer;
begin
  Self.Caption := 'Rekap Sales & Service';
  Result :=0;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  MasterPurpose := LOV_SALES_SERVICE;
  InitForm;
  LoadSalesService;
  ShowModal;
  if ModalResult = mrOK then begin
    Result := asgRekap.Ints[4,asgRekap.Row];
    Close;
  end;
end;

procedure TfrmLOVRekap.LoadSalesService;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := SHIP_TYPE_SALES;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        Shipment.ShipNum := UpperCase(txtFaktur.Text);
        Shipment.Persons.PersonCode := UpperCase(txtKode.Text);
        Shipment.Persons.PersonName := UpperCase(txtNama.Text);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDb(FormatSQLString(SHIP_TYPE_SERVICE));
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[1,vRow] := vShipment[i].ShipNum;
       Cells[2,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[3,vRow] := vShipment[i].Persons.PersonName;
//       Cells[colnotes,vRow]:= vShipment[i].Notes;
//       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[4,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

procedure TfrmLOVRekap.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter;
end;

procedure TfrmLOVRekap.asgRekapKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnOk.Click;
end;

procedure TfrmLOVRekap.btnRefreshClick(Sender: TObject);
begin
    case MasterPurpose[1] of
    LOV_SALES_SERVICE : LoadSalesService;
    LOV_SALES  : LoadSales;
    LOV_TERIMA : LoadTerima;
    LOV_PERSON : LoadPerson(PersonType);
    LOV_SERVICE : LoadService;
  end;
end;

procedure TfrmLOVRekap.btnResetClick(Sender: TObject);
begin
  InitFilter;
end;

function TfrmLOVRekap.ExecuteOrder: integer;
begin
  Self.Caption := 'Rekap Order Bengkel';
  Result :=0;
  pnlFilter.Height := 90;
  SetFilterSize(pnlFilter,btnFilter,90);
  MasterPurpose := LOV_ORDER;
  InitForm;
  LoadOrder;
  ShowModal;
  if ModalResult = mrOK then begin
    Result := asgRekap.Ints[4,asgRekap.Row];
    Close;
  end;
end;

procedure TfrmLOVRekap.LoadOrder;
var vShipment : TShipment_Arr;
   i,vRow:integer;

   procedure SetFilter;
   begin
      GlobalPeriode.Reset;
      with vShipment.Filter do begin
        Reset;
        Shipment.ShipType := ESTIMASI_TYPE_ORDER;
        GlobalPeriode.setPeriode(cmbOpr1.ItemIndex,dtpDari1.Date,dtpSampai1.Date);
        Shipment.ShipNum := UpperCase(txtFaktur.Text);
        Shipment.Persons.PersonCode := UpperCase(txtKode.Text);
        Shipment.Persons.PersonName := UpperCase(txtNama.Text);
      end;
   end;

begin
   vShipment := TShipment_Arr.Create;
   SetFilter;
   vShipment.FindOnDbEstimasi();
   InitGrid;
   for i:= 0 to vShipment.Count-1 do
     with asgRekap do begin
       Update;
       vRow := asgRekap.RowCount-1;
       Cells[1,vRow] := vShipment[i].ShipNum;
       Cells[2,vRow]:= NewFormatDate(vShipment[i].ShipDate);
       TPersons(vShipment[i].Persons).SelectInDB(vShipment[i].Persons.PersonId);
       Cells[3,vRow] := vShipment[i].Persons.PersonName;
//       Cells[colnotes,vRow]:= vShipment[i].Notes;
//       Cells[colOperator,vRow]:= vShipment[i].UserInsert;
       Ints[4,vRow]   := vShipment[i].ShipId;
       AddRow;
     end;
   vShipment.Free;
   DeleteRowTerakhir(asgRekap,2,1);
   ArrangeColSize;


end;

end.
