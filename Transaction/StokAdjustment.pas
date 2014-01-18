unit StokAdjustment;

interface

uses
  OracleConnection, AutoOptic, Subroutines, UConst, StrUtils,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls, ExtCtrls;

type
  TfrmStokAdjustment = class(TForm)
    Label1: TLabel;
    dtpTanggal: TDateTimePicker;
    mmoKeterangan: TMemo;
    btnSave: TButton;
    btnClose: TButton;
    asgItem: TAdvStringGrid;
    cmbBranch: TComboBox;
    sttNum: TStaticText;
    Bevel1: TBevel;
    btnDelete: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure asgItemAutoAddRow(Sender: TObject; ARow: Integer);
    procedure asgItemCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgItemCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgItemGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgItemGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnDeleteClick(Sender: TObject);
    procedure dtpTanggalChange(Sender: TObject);
  private
    BrowseMode,EditMode:Boolean;
    MasterSeq,MasterBranchSeq:integer;
    vlistSeq,listBranch:TStringList;
    procedure ClearForm;
    procedure InitGrid;
    function IsValid : boolean;
    function isSave:boolean;
    procedure PrintData;
    procedure LoadData;
    procedure ArrangeColSize;
    procedure NewNumber;
    procedure LoadManyItem;
    function isValidItem(const Arow:integer;const AValue:string):boolean;
    procedure CalculateItem(ARow:integer);
    function isUpdate:boolean;
  public
    { Public declarations }
    procedure Execute(ATransSeq:integer;AEditPrice:boolean=False);
  end;

var
  frmStokAdjustment: TfrmStokAdjustment;

implementation

uses un_ryu, MainMenu, UTransaction, LOVNew, UMaster;

{$R *.dfm}
const  colNo = 0;
       colCode = 1;
       colName = 2;
       colUnit = 3;
       colPrice = 4;
       colStok = 5;
       colQty  = 6;
       colSelisih = 7;
       colNotes = 8;
       colSeq = 9;
       colDetailSeq = 10;

{ TfrmStokAdjustment }

procedure TfrmStokAdjustment.ClearForm;
begin
  dtpTanggal.Date := ServerNow;
  dtpTanggal.Enabled := not BrowseMode;
  btnDelete.Enabled  := not BrowseMode;
  btnSave.Caption    := IfThen(not BrowseMode,'&Save',IfThen(EditMode,'&Update','&Print'));
  InitGrid;
  mmoKeterangan.Clear;
  NewNumber;
end;

procedure TfrmStokAdjustment.btnCloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

function TfrmStokAdjustment.IsValid: boolean;
var i:integer; vValue:string; vValid:boolean;
begin
  Result := False;
  if (asgItem.Cells[ColCode,1] = '') then begin
    ShowMessage('Tidak ada data pada tabel.');
    asgItem.SetFocus;
  end
  else begin
     for i:= 1 to asgItem.RowCount-1 do begin
       vValue := FloatToStrFmt(asgItem.Floats[colQty,i]);
       asgItemCellValidate(Self,colQty,i,vValue,vValid);
       if not vValid then begin
         Result := False;
         Break;
       end
       else
         Result := True;
     end;
  end;
end;

procedure TfrmStokAdjustment.btnSaveClick(Sender: TObject);
begin
 if not BrowseMode then begin
     if isValid and SaveConfirmed then
       if isSave then
         if Confirmed(MSG_ADD_DATA) then
           ClearForm
         else
           ModalResult := mrOk;
  end
  else begin
    if EditMode then
      isUpdate
    else
      PrintData;
  end
end;

procedure TfrmStokAdjustment.Execute(ATransSeq: integer;AEditPrice:boolean);
begin
  if not CanAdd(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  EditMode := AEditPrice;
  listBranch := TStringList.Create;
  vlistSeq   := TStringList.Create;
  TBranch.getListBranch(listBranch, False,True);
  NameValueListToValueList(listBranch, cmbBranch.Items);
  cmbBranch.ItemIndex := 0;
  BrowseMode := ATransSeq > 0;
  MasterSeq  := ATransSeq;
  MasterBranchSeq := TBranch.getActivee;
  ClearForm;
  if BrowseMode then
     LoadData;
  Run(Self);
  listBranch.Free;
  vlistSeq.Free;
end;

function TfrmStokAdjustment.isSave: boolean;
var  vSA : TStokAdjustment; vItem :TItemDetail_Arr;
    i: integer;
     vDbCrType:string;
begin
  vSA := TStokAdjustment.Create;
  vItem  := TItemDetail_Arr.Create;
 // vService := TServiceDetail_Arr.Create;
 try
    vSA.ShipNum  := vSA.getNewNumber(dtpTanggal.DateTime);
    vSA.ShipDate := dtpTanggal.DateTime;
    vSA.UserId   := GlobalSystemUser.UserId;
    vSA.ShipType := SHIP_TYPE_ADJUSTMENT;
    vSA.Notes    := mmoKeterangan.Lines.Text;
    if cmbBranch.ItemIndex <> -1 then
      vSA.Branch.BranchSeq := StrToInt(listBranch.Names[cmbBranch.itemIndex]);
    //inpput detail item
    for i := 1 to asgItem.RowCount-1 do begin
      vDbCrType := IfThen(asgItem.Floats[colSelisih,i]>=0,DB_CR_TYPE_CREDIT,DB_CR_TYPE_DEBIT);
      if not IsClear(asgItem,i,colSeq) then
        vItem.AddDetail( asgItem.Ints[colSeq,i],abs(asgItem.Floats[colSelisih,i]),asgItem.Floats[colPrice,i],
                1,vDbCrType,asgItem.cells[colNotes,i],False,0);
    end;
    Result := vSA.InsertOnDb(vItem);
  finally
    vSA.Free;
  end;
end;

procedure TfrmStokAdjustment.LoadData;
var vSA : TStokAdjustment;
    vItemDetail : TItemDetail_Arr;
    i,vRow:integer;
begin
  vSA := TStokAdjustment.Create;
  vItemDetail := TItemDetail_Arr.Create;
  try
    if not vSA.SelectInDB(MasterSeq) then begin
      Alert(MSG_NO_DATA_FOUND);
      exit;
    end;
    sttNum.Caption := vSA.ShipNum;
    dtpTanggal.Date   := vSA.ShipDate;
    mmoKeterangan.Lines.Text := vSA.Notes;
    vItemDetail.Filter.Shipment.ShipSeq := MasterSeq;
    vItemDetail.findOnDb;
    For i := 0 to vItemDetail.Count-1 do
      with asgItem do begin
         vRow := RowCount-1;
         Cells[colCode,vRow]  := vItemDetail[i].ItemBalance.Item.ItemCode;
         Cells[colName,vRow]  := vItemDetail[i].ItemBalance.Item.ItemName+TItem.getMoreDesc(vItemDetail[i].ItemBalance.Item);
         Cells[colUnit,vRow]  := vItemDetail[i].ItemBalance.Item.UsedUnit;
         Floats[colQty,vRow]  := vItemDetail[i].Quantity;
         Floats[colPrice,vRow]:= vItemDetail[i].Price;
         Cells[colNotes,vRow]   := vItemDetail[i].Notes;
         Ints[colSeq,vRow] := vItemDetail[i].ItemBalance.Item.ItemSeq;
         Ints[colDetailSeq,vRow]:= vItemDetail[i].ItemDetailSeq;
         AddRow;
      end;
  DeleteRowTerakhir(asgItem,3,1);
  asgItem.AutoNumberCol(colNo);
  ArrangeColSize;
  finally
    vSA.Free;
    vItemDetail.Free;
  end;

end;

procedure TfrmStokAdjustment.PrintData;
begin

end;

procedure TfrmStokAdjustment.InitGrid;
begin
  ResetGrid(asgItem,2,12,1,1);
  with asgItem do begin
    Cells[colNo,0] := 'No';
    Cells[colCode,0] := 'Kode';
    Cells[colName,0] := 'Nama';
    Cells[colUnit,0]  := 'Unit';
    Cells[colPrice,0] := 'Harga Pokok';
    Cells[colStok,0] := 'Stok';
    Cells[colQty,0]  := 'Jml Opname';
    Cells[colSelisih,0] := 'Selisih';
    Cells[colNotes,0] := 'Keterangan';
    Cells[colSeq,0] :='itemSeq';
    Cells[colDetailSeq,0] :='DetailSeq';
  end;
  ArrangeColSize;
end;

procedure TfrmStokAdjustment.ArrangeColSize;
begin
  asgItem.AutoSizeColumns(True,2);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER Then exit;
  asgItem.ColWidths[colSeq] :=0;
  asgItem.ColWidths[colDetailSeq] :=0;
end;

procedure TfrmStokAdjustment.NewNumber;
begin
  if not BrowseMode then
   sttNum.Caption  := TStokAdjustment.getNewNumber(dtpTanggal.DateTime);
end;

procedure TfrmStokAdjustment.asgItemAutoAddRow(Sender: TObject;
  ARow: Integer);
begin
  if ARow>1 then
   asgItem.AutoNumberCol(colNo);
end;

procedure TfrmStokAdjustment.asgItemCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colCode,colName,colQty,colNotes,colPrice]) and (not BrowseMode) ;
  if EditMode then
    CanEdit := ACol in [colPrice];
end;

procedure TfrmStokAdjustment.asgItemCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;
begin
  if Row in [0] then exit;
  case Col of
    colCode : begin
      Valid := isValidItem(Row,Value);
      vMsg := 'Kode item tidak terdaftar';

      if not Valid then begin
        Alert(vMsg);
        asgItem.Col := Col;
      end;
    end;//end col code
    colQty : begin
      Valid := (Value <> '') ;//and (StrToIntDef(Value,0)>0);
      vMsg := 'Jumlah belum diisi atau masih nol';
    //  if Valid then begin
      //  Valid := asgItem.Floats[colQty,Row] <= asgItem.Floats[colStok,Row];
      //  vMsg := 'Jumlah penjualan melebihi stok yang ada!';
        if Valid then CalculateItem(Row);
//      end;

      if not Valid then begin
        Alert(vMsg);
        asgItem.Col := Col;
        Value := '';
      end;
    end;
  end;//end case

end;

procedure TfrmStokAdjustment.asgItemGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow in [0] then HAlign := taCenter
  else if ACol in [colQty,colStok,colQty,colSelisih,colPrice] then
    HAlign := taRightJustify;
end;

procedure TfrmStokAdjustment.asgItemGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    ColCode : AEditor := edUpperCase;

    colQty,colPrice  : AEditor := edFloat;
  end;
end;

procedure TfrmStokAdjustment.asgItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = vk_return then
    if (asgItem.Col = colName) and (asgItem.Cells[colCode,asgItem.Row] = '') then
      if frmLOVNew.Execute(vlistSeq,LOV_ITEM,True,asgItem.Cells[colName,asgItem.Row],0,dtpTanggal.Date,MasterBranchSeq) then
         LoadManyItem;
end;

function TfrmStokAdjustment.isValidItem(const Arow: integer;
  const AValue: string): boolean;
var vItem : TItem; // vJasa : TService;
   vBranchSeq :integer;
begin
    if cmbBranch.ItemIndex <> -1 then
      vBranchSeq := StrToInt(listBranch.Names[cmbBranch.ItemIndex])
    else
      vBranchSeq := 0;
    vItem := TItem.Create;
    try
      Result := vItem.SelectID(0,AValue);
      if Result then begin
        asgItem.Cells[colCode,Arow] := vItem.ItemCode;
        asgItem.Cells[colName,Arow] := vItem.ItemName + TItem.getMoreDesc(vItem);
        asgItem.Ints[colSeq,Arow]   := vItem.ItemSeq;
        asgItem.Cells[colUnit,Arow] := vItem.UsedUnit;
        asgItem.Floats[colPrice,Arow] := vItem.CostPrice;
        asgItem.Floats[colStok,Arow]     := TItem.getQtyOnHand(vItem.ItemSeq,vBranchSeq,dtpTanggal.Date);
        //TItemBalance_Arr.GetSaldo(vItem.ItemSeq,dtpTanggal.Date,False,vBranchSeq);
        ArrangeColSize;
      end;
    finally
      vItem.Free;
    end;
end;

procedure TfrmStokAdjustment.LoadManyItem;
var i,vRow:integer;
begin
    for i:= 0 to vListSeq.Count-1 do begin
       vRow := asgItem.RowCount-1;
       if isValidItem(vRow,vListSeq.Values[vListSeq.Names[i]]) then
         asgItem.AddRow;
    end;
    DeleteRowTerakhir(asgItem,2,1);
    asgItem.AutoNumberCol(colNo);
end;

procedure TfrmStokAdjustment.btnDeleteClick(Sender: TObject);
begin
  DeleteRows(asgItem,2);
end;

procedure TfrmStokAdjustment.dtpTanggalChange(Sender: TObject);
begin
  NewNumber;
  if not BrowseMode then
    InitGrid;
end;

procedure TfrmStokAdjustment.CalculateItem(ARow: integer);
begin
    if ARow > 0 then
      asgItem.Floats[colSelisih,ARow] := asgItem.Floats[colStok,ARow] - asgItem.Floats[colQty,ARow];
end;

function TfrmStokAdjustment.isUpdate: boolean;
var vDetail : TItemDetail_Arr;
    i,idx:integer;
begin
  vDetail := TItemDetail_Arr.Create;
  for i:= 1 to asgItem.RowCount-1 do begin
    idx := vDetail.AddDetail( asgItem.Ints[colSeq,i],abs(asgItem.Floats[colSelisih,i]),asgItem.Floats[colPrice,i],
                1,'',asgItem.cells[colNotes,i],False,0);
    vDetail[idx].ItemDetailSeq := asgItem.Ints[colDetailSeq,i];            
  end;
  Result := vDetail.UpdatePrice;
  if Result then begin
    Inform('Data telah diupdate');
    ModalResult := mrOk;
  end
  else
    Alert('Update data tidak berhasil');
  vDetail.Free;
end;

end.
