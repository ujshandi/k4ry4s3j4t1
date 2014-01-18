unit ReturBeli;
 {DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit;

type
  TfrmReturBeli = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    asgTerima: TAdvStringGrid;
    btnSave: TButton;
    btnBatal: TButton;
    Bevel2: TBevel;
    btnDelete: TButton;
    txtTerimaNum: TAdvEdit;
    btnTerima: TButton;
    pgcSupplier: TPageControl;
    tbsCust: TTabSheet;
    lblAddress: TLabel;
    lblNamaCust: TLabel;
    lblTlp: TLabel;
    Panel1: TPanel;
    txtSubtotal: TAdvEdit;
    txtDisc: TAdvEdit;
    txtTotal: TAdvEdit;
    mmNotes: TMemo;
    lblKode: TLabel;
    Label11: TLabel;
    procedure asgTerimaCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgTerimaCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgTerimaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgTerimaGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure dtpTransChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure txtDiscChange(Sender: TObject);
    procedure btnTerimaClick(Sender: TObject);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    BrowseMode : boolean;
    MasterSeq : integer;
    //vItemArr : TItems_Arr;
    vItem : TItems;
    procedure ArrangeColSize;
    procedure getItem(AGrid:TAdvStringGrid;AItemId,ARow:integer);
    procedure InitForm;
    procedure InitGrid;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure NewNumber;
    procedure SetAmount(ARow:integer);
    procedure SetFooter;
    procedure PrintData;
  public
    { Public declarations }
    function Execute(ATerimaSeq:integer):boolean;
  end;

var
  frmReturBeli: TfrmReturBeli;

const
  colNo = 0;
  colCode = 1;
  colName = 2;
  colQty = 3;
  colPrice = 4;
  colAmount = 5;

  colQty2 = 6;
  colPrice2 = 7;
  colAmount2 = 8;
  
  colSeq = 9;

implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVRekap, LOVFlat, PenerimaanPrint,
  NotaReturBeli;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmReturBeli.ArrangeColSize;
begin
  asgTerima.AutoSizeColumns(True,3);
  asgTerima.AutoNumberCol(colNo);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  asgTerima.ColWidths[colSeq]:=0;
   asgTerima.ColWidths[colCode]  := 140;
end;

function TfrmReturBeli.Execute(ATerimaSeq: integer): boolean;
begin
 // vItemArr := TItems_Arr.Create;
  vItem := TItems.Create;
  Result := False;
  BrowseMode := ATerimaSeq>0;
  MasterSeq := ATerimaSeq;
 // vItemArr.FindFlat;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vItem.Free;
end;

procedure TfrmReturBeli.InitForm;
begin
  btnSave.Caption := IfThen(BrowseMode,'Print','Save');
  dtpTrans.Enabled := not BrowseMode;
  mmNotes.ReadOnly := BrowseMode;
  btnDelete.Enabled := not BrowseMode;
  btnTerima.Enabled := not BrowseMode;

  //btnNew.Enabled := not BrowseMode;
  lblAddress.Caption := '';
  lblNamaCust.Caption:= '';
  lblTlp.Caption     := '';
  lblKode.Caption    := '';
  txtSubtotal.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  txtTerimaNum.Clear;
  txtDisc.ReadOnly := BrowseMode;
  Self.Caption := IfThen(BrowseMode,'View Retur Beli','New Retur Beli');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;
  mmNotes.Clear;
  Self.ActiveControl := txtTerimaNum;
  InitGrid;
end;

procedure TfrmReturBeli.InitGrid;
begin
  ResetGrid(asgTerima,2,11,1,1);
  with asgTerima do begin
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Nama Item';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colAmount,0] := 'Subtotal';
    Cells[colQty2,0] := 'Qty Retur';
    Cells[colPrice2,0] := 'Harga Retur';
    Cells[colAmount2,0] := 'Subtotal Retur';
    Cells[colSeq,0] := 'Sequence';
        ColWidths[colCode]  := 140;
  end;
  ArrangeColSize;
end;

function TfrmReturBeli.isSaved: boolean;
var vShipment : TShipment;
    vDetail   : TItemDetail_Arr;
    i,idx:integer;
    vConversion : real;
begin
   vShipment := TShipment.Create;
   vDetail   := TItemDetail_Arr.Create;

   vShipment.ShipNum := TShipment.getNewNumber(SHIP_TYPE_RETUR_BELI,dtpTrans.Date);//sttNum.Caption;
   vShipment.ShipType:= SHIP_TYPE_RETUR_BELI;
   vShipment.Persons.PersonId := TPersons.getSeqFromCode(lblKode.Caption);
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.ShipIdUsed  := TShipment.getIdFromNum(txtTerimaNum.Text);
   for i:= 1 to asgTerima.RowCount-1 do
     if not IsClear(asgTerima,i,colSeq) then begin
        vConversion := TItems.getConversion(asgTerima.Ints[colSeq,i]);
        idx:= vDetail.Add(0,0,asgTerima.Floats[colQty2,i]*vConversion,asgTerima.Floats[colPrice2,i],vConversion,
         asgTerima.Floats[colAmount2,i],DB_CR_TYPE_CREDIT,0,0,0,0,'',0,False);
         vDetail[idx].ItemBalance.Items.ItemId := asgTerima.Ints[colSeq,i];
     end;
   Result := vShipment.InsertTerima(vDetail);
   if not Result  then
     Alert(MSG_UNSUCCESS_SAVING)
   else
     PrintData;
   vShipment.Free;
   vDetail.Free;
end;

function TfrmReturBeli.isValid: boolean;
begin
  Result := False;
  if txtTerimaNum.Text = '' then begin
    Alert('Nomor terima sebagai referensi retur belum terisi');
    btnTerima.SetFocus;
  end
  else if TShipment.getIdFromNum(txtTerimaNum.Text) = 0 then begin
    Alert('Nomor terima barang ini tidak terdaftar dalam sistem!'+#13+
          'Pastikan nomor dokumen terima telah terdaftar dalam sistem.');
    txtTerimaNum.Clear;
    txtTerimaNum.SetFocus;
  end
  else
    Result := True;
end;

procedure TfrmReturBeli.LoadData;
var vShipment : TShipment;
    i:integer;
begin
   vShipment := TShipment.Create;
   InitGrid;

   if not vShipment.SelectInDB(MasterSeq) then begin
     Alert(MSG_NO_DATA_FOUND);
     vShipment.Free;
     exit;
   end;
   if (vShipment.ShipIdUsed > 0) and (not BrowseMode) then begin
     Alert('Dokumen ini sudah diretur');
     vShipment.Free;
     exit;
   end;
   txtSubtotal.FloatValue := vShipment.Subtotal;
   txtDisc.FloatValue     := vShipment.Discount;
   txtTotal.FloatValue    := vShipment.Total;

   TPersons(vShipment.Persons).SelectInDB(vShipment.Persons.PersonId);
   lblAddress.Caption := vShipment.Persons.Address;
   lblNamaCust.Caption:= vShipment.Persons.PersonName;
   lblTlp.Caption     := vShipment.Persons.Phone1;
   lblKode.Caption    := vShipment.Persons.PersonCode;
   txtTerimaNum. Text := vShipment.ShipNum;
   if BrowseMode then begin
     sttNum.Caption   := ' '+vShipment.ShipNum;
     dtpTrans.DateTime:= vShipment.ShipDate;
     txtTerimaNum.Text:= TShipment.getNumFromID(vShipment.ShipIdUsed);
   end;
   mmNotes.Lines.Text := vShipment.Notes ;
   vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
   for i:= 0 to vShipment.ItemDetailArr.Count-1 do
    with asgTerima do begin
      Cells[colCode,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
      Cells[colName,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
      if BrowseMode then begin
        Floats[colQty2,i+1] := vShipment.ItemDetailArr[i].Quantity;// IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice2,i+1]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colAmount2,i+1] := vShipment.ItemDetailArr[i].Amount;

      end
      else begin
        Floats[colQty,i+1] := vShipment.ItemDetailArr[i].Quantity;// IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice,i+1]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colAmount,i+1] := vShipment.ItemDetailArr[i].Amount;

      end;
      Ints[colSeq,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemId;
      AddRow;
   end;
   DeleteRowTerakhir(asgTerima,2,1);
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmReturBeli.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumber(SHIP_TYPE_RETUR_BELI,dtpTrans.DateTime);
end;

procedure TfrmReturBeli.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty2,colCode,colName,colPrice2]) and (not BrowseMode);
end;

procedure TfrmReturBeli.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vId:Integer;  
begin
  case Col of
    {$IFDEF BARCODE}
    colCode : begin
     // Alert(Value);
      if vItem.isExistCode(Value) then begin
         vId := vItem.getIdFromCode(Value);
      end
      else
         vId := frmLovFlat.Execute(IfThen(Col=colName,'NAME','CODE'),Value,'ITEM','',false);
      Valid := vId >0;
      if Valid then begin
         getItem(asgTerima,vId,Row);
         Value := vItem.ItemCode;
         asgTerima.Col := colQty;
      end;
    end;
    //end     // ADD for barcode reader --  03.02.08

    {$ENDIF}
    colPrice2 : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
    colQty2 :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgTerima.AddRow;
        //SetAmount(Row);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
      SetAmount(Row);
    end;
  end;
  ArrangeColSize;
end;

procedure TfrmReturBeli.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colAmount,colQty2,colPRice2,colAmount2] then
    HAlign := taRightJustify;
end;

procedure TfrmReturBeli.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty2,colPrice2 : AEditor := edFloat;
  end;
end;

procedure TfrmReturBeli.btnSaveClick(Sender: TObject);
begin
   if BrowseMode then
     PrintData
  else begin
     if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
      if isSaved then
        if not BrowseMode then begin
          if Confirmed(MSG_ADD_DATA) then
            InitForm
          else
            ModalResult := mrOk;
        end
        else
          ModalResult := mrOk;
  end;        
end;

procedure TfrmReturBeli.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmReturBeli.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmReturBeli.btnDeleteClick(Sender: TObject);
begin
  if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode,False);
  SetFooter;
end;

procedure TfrmReturBeli.SetAmount(ARow: integer);
begin
  asgTerima.Floats[colAmount2,ARow] := asgTerima.Floats[colPrice2,ARow] * asgTerima.Floats[colQty2,ARow];
  SetFooter;
end;

procedure TfrmReturBeli.SetFooter;
begin
  txtSubtotal.FloatValue := asgTerima.ColumnSum(colAmount2,1,asgTerima.RowCount-1);
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;
end;

procedure TfrmReturBeli.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmReturBeli.btnTerimaClick(Sender: TObject);
begin
  InitForm;
  MasterSeq := frmLOVRekap.ExecuteTerima;
  LoadData;
  asgTerima.SetFocus;
end;

procedure TfrmReturBeli.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    txtDisc.SetFocus;
end;

procedure TfrmReturBeli.txtDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmReturBeli.asgTerimaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
  vSearch : string;
begin
   if BrowseMode then exit;
   case Key of
     VK_F8 : ShortCutF8(asgTerima,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
       btnDelete.Click;
     end;
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgTerima.Col of
         colCode,colName : begin
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgTerima.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
           if vId > 0 then
             getItem(asgTerima,vId,asgTerima.Row);
         end;
       end;
     end;
     {$ENDIF}
   end;

end;

procedure TfrmReturBeli.getItem(AGrid: TAdvStringGrid; AItemId,
  ARow: integer);
begin
  vItem.Reset;
  if vItem.SelectInDB(AItemId) then begin
     with AGrid do begin
       Cells[colCode,ARow] := vItem.ItemCode;
       Cells[colName,ARow] := vItem.ItemName;
       Floats[colQty2,ARow] := 1;
       Ints[colSeq,ARow]:= vItem.ItemId;
       Floats[colPrice2,ARow] := vItem.Price;
     end;
  end;
  SetAmount(ARow);
  ArrangeColSize;
end;

procedure TfrmReturBeli.PrintData;
 var tmpId : integer;
begin
  tmpId := TShipment.getIdFromNum(Trim(sttNum.Caption));
 // if TShipment.isPosted(tmpId) then
    qrpNotaReturBeli.Executes(tmpId)
  
end;

end.
