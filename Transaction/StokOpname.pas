unit StokOpname;
 {DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit;

type
  TfrmStokOpname = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    asgTerima: TAdvStringGrid;
    btnSave: TButton;
    btnBatal: TButton;
    l: TLabel;
    sttInfo: TStaticText;
    Bevel2: TBevel;
    StaticText2: TStaticText;
    Bevel1: TBevel;
    btnDelete: TButton;
    btnNew: TButton;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    txtFilterKode: TAdvEdit;
    txtFilterNama: TAdvEdit;
    txtKendaraan: TAdvEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    btnRefreshPart: TButton;
    btnReset: TButton;
    mmNotes: TMemo;
    Label1: TLabel;
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
    procedure btnNewClick(Sender: TObject);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbGudangKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    BrowseMode : boolean;
    MasterSeq : integer;
    //vItemArr : TItems_Arr;
    vItem : TItems;
    MasterType : string;
    procedure ArrangeColSize;
    procedure getItem(AGrid:TAdvStringGrid;AItemId,ARow:integer);
    procedure InitForm;
    procedure InitGrid;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure NewNumber;
    procedure SetAmount(ARow:integer);
    procedure PrintData;
  public
    { Public declarations }
    function Execute(AMutasiId:integer):boolean;
  end;

var
  frmStokOpname: TfrmStokOpname;

const
  colNo = 0;
  colCode = 1;
  colName = 2;
  colQty = 3;//stok fisik
  colStok = 4; //stok system
  colSelisih =5;
  colPrice = 6;
  colAmount = 7;

  colSeq = 8;

implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVFlat, MutasiPrint, StokOpnamePrint;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmStokOpname.ArrangeColSize;
begin
  asgTerima.AutoSizeColumns(True,3);
  asgTerima.AutoNumberCol(colNo);
  asgTerima.ColWidths[colPrice]:=0;
  asgTerima.ColWidths[colAmount]:=0;
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  asgTerima.ColWidths[colSeq]:=0;
  asgTerima.ColWidths[colCode]  := 140;

end;

function TfrmStokOpname.Execute(AMutasiId: integer): boolean;
begin
  vItem := TItems.Create;
  Result := False;
  BrowseMode := AMutasiId>0;
  MasterSeq := AMutasiId;
  MasterType := SHIP_TYPE_OPNAME;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vItem.Free;
end;

procedure TfrmStokOpname.InitForm;
begin
  btnSave.Caption := IfThen(BrowseMode,'Print','Save');
  dtpTrans.Enabled := not BrowseMode;
  mmNotes.ReadOnly := BrowseMode;
  btnDelete.Enabled := not BrowseMode;
  btnNew.Enabled := not BrowseMode;
 // sttInfo.Caption := IfThen(MasterType=SHIP_TYPE_MUTASI_MASUK,'Dokumen Mutasi Barang Masuk','Dokumen Mutasi Barang Keluar');
  Self.Caption := IfThen(BrowseMode,'View Stok Opname','New Stok Opname');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;
  mmNotes.Clear;
  InitGrid;
end;

procedure TfrmStokOpname.InitGrid;
begin
  ResetGrid(asgTerima,3,10,1,1);
  asgTerima.FloatingFooter.Visible := True;
  with asgTerima do begin
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Nama Part';
    Cells[colQty,0] := 'Qty.Fisik';
    Cells[colStok,0] := 'Qty.System';
    Cells[colSelisih,0] := 'Selisih';
    Cells[colPrice,0] := 'Harga Beli';
    Cells[colAmount,0] := 'Subtotal';
    Cells[colSeq,0] := 'Sequence';
        ColWidths[colCode]  := 140;
  end;
  ArrangeColSize;
end;

function TfrmStokOpname.isSaved: boolean;
var vShipment : TShipment;
    vDetail   : TItemDetail_Arr;
    i,idx:integer;
    vConversion,qty : real;
begin
   vShipment := TShipment.Create;
   vDetail   := TItemDetail_Arr.Create;
   vShipment.ShipNum := TShipment.getNewNumber(MasterType,dtpTrans.Date);//sttNum.Caption;
   vShipment.ShipType:= MasterType;
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   for i:= 1 to asgTerima.RowCount-2 do
     if not IsClear(asgTerima,i,colSeq) then begin
        vConversion := 1;//TItems.getConversion(asgTerima.Ints[colSeq,i]);
        qty := asgTerima.Floats[colQty,i]- asgTerima.Floats[colStok,i];//*vConversion;
        idx:= vDetail.Add(0,0,abs(qty),asgTerima.Floats[colPrice,i],vConversion,
         asgTerima.Floats[colAmount,i],IfThen(qty>0,DB_CR_TYPE_DEBIT,DB_CR_TYPE_CREDIT),0,0,0,0,'',0,False);
         vDetail[idx].ItemBalance.Items.ItemId := asgTerima.Ints[colSeq,i];
         vDetail[idx].Stok := asgTerima.Floats[colStok,i];
     end;
   Result := vShipment.InsertOpname(vDetail);
   if not Result  then
     Alert(MSG_UNSUCCESS_SAVING)
   else
     PrintData;
   vShipment.Free;
   vDetail.Free;
end;

function TfrmStokOpname.isValid: boolean;
VAR i:integer;vValue:string;vValid:Boolean;
begin
  Result := False;
    case MasterType[1] of
      SHIP_TYPE_OPNAME : begin
        for i:= 1 to asgTerima.RowCount-2 do begin
          if IsClear(asgTerima,i,colSeq) then Continue;
          vValue := asgTerima.Cells[colQty,i];
          asgTerimaCellValidate(Self,colQty,i,vValue,vValid);
          Result := vValid;
          if not Result then begin
            asgTerima.Col := colQty;
            asgTerima.Row := i;
            Break;
            Exit;
          end;
        end;//end for
      end;// end mutasi keluar
      else
        Result := True;
    end;//END CASE
    //Result := True;
end;

procedure TfrmStokOpname.LoadData;
var vShipment : TShipment;
    i:integer;
begin
   vShipment := TShipment.Create;
   InitGrid;

   if not vShipment.SelectInDB(MasterSeq) then begin
     Alert(MSG_NO_DATA_FOUND);
     exit;
     vShipment.Free;
   end;
   sttNum.Caption   := ' '+vShipment.ShipNum;
   dtpTrans.DateTime:= vShipment.ShipDate;
   mmNotes.Lines.Text := vShipment.Notes ;
   vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
   for i:= 0 to vShipment.ItemDetailArr.Count-1 do
    with asgTerima do begin
      Cells[colCode,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
      Cells[colName,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;

      Floats[colPrice,i+1]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
      Floats[colAmount,i+1] := vShipment.ItemDetailArr[i].Amount;
      Floats[colStok,i+1] := vShipment.ItemDetailArr[i].Stok;
      Floats[colSelisih,i+1] := IfThen(vShipment.ItemDetailArr[i].DbCrType=DB_CR_TYPE_CREDIT,-1,1) * vShipment.ItemDetailArr[i].Quantity;
      Floats[colQty,i+1] := Floats[colSelisih,i+1] + vShipment.ItemDetailArr[i].stok;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion)\;
      AddRow;
   end;

   DeleteRowTerakhir(asgTerima,3,1);
   asgTerima.FloatingFooter.ColumnCalc[colAmount] := acSUM;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmStokOpname.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumber(MasterType,dtpTrans.DateTime);
end;

procedure TfrmStokOpname.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice]) and (not BrowseMode);
//  if CanEdit and (ACol = colPrice) and (MasterType=SHIP_TYPE_MUTASI_MASUK) then
    //if asgTerima.Floats[colPrice,ARow] >0 then
      //CanEdit := False;
end;

procedure TfrmStokOpname.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vTmpQty : Double;
  vMsg:string;vId:Integer;
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
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg := 'Data masukan salah!';
      if MasterType = SHIP_TYPE_MUTASI_KELUAR then begin
         vTmpQty := StrToFloatDef(Value,0);
         Valid := (vTmpQty <= TItems.getStokTotal(asgTerima.Ints[colSeq,Row],True));
         vMsg  := 'Stok '+asgTerima.Cells[colName,row]+' tidak mencukupi';
         SetAmount(Row);
      end;

      if Valid then begin
        //asgTerima.AddRow;
        SetAmount(Row);
      end;
      if not Valid then begin
        Alert(vMsg);
        asgTerima.Col := Col;
        Value := '';
      end;
      SetAmount(Row);
    end;
  end;
  ArrangeColSize;
end;

procedure TfrmStokOpname.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colAmount,colStok,colSelisih] then
    HAlign := taRightJustify;
end;

procedure TfrmStokOpname.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty,colPrice : AEditor := edFloat;
 
  end;
end;

procedure TfrmStokOpname.btnSaveClick(Sender: TObject);
begin
  if BrowseMode  then
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

procedure TfrmStokOpname.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmStokOpname.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmStokOpname.btnDeleteClick(Sender: TObject);
begin
  if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode,False);
  //SetFooter;
end;

procedure TfrmStokOpname.btnNewClick(Sender: TObject);
var vEditor : TEditorType;
begin
   vEditor := edComboList;
   frmItemAdd.NewExecute;
   asgTerimaGetEditorType(Self,colCode,asgTerima.Row,vEditor);
   asgTerimaGetEditorType(Self,colName,asgTerima.Row,vEditor);
end;

procedure TfrmStokOpname.SetAmount(ARow: integer);
begin
  asgTerima.Floats[colAmount,ARow] := asgTerima.Floats[colPrice,ARow] * asgTerima.Floats[colQty,ARow];
  asgTerima.FloatingFooter.ColumnCalc[colAmount] := acSUM;
end;

procedure TfrmStokOpname.asgTerimaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;vFilter,vSearch : string;
begin
   if BrowseMode then exit;
   case Key of
     VK_F8 : ShortCutF8(asgTerima,Key,colCode);
     VK_DELETE : begin
       if (Shift = [ssCtrl]) then
         btnDelete.Click;
     END;
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 :begin
      case asgTerima.Col of
       colCode,colName : begin
         vSearch :=LowerCase(chr(getNewKeyDown(Key)));
         vFilter := '';//' AND s.service_type <> '+FormatSQLString(SERVICE_TYPE_PACKAGE);
         vId := frmLovFlat.Execute(IfThen(asgTerima.Col=colName,'NAME','CODE'),vSearch,'ITEM',vFilter,False);
         if vId > 0 then
           getItem(asgTerima,vId,asgTerima.Row);
       end;
      end;
     end;
     {$ENDIF}
   end;

end;

procedure TfrmStokOpname.getItem(AGrid: TAdvStringGrid; AItemId,
  ARow: integer);
begin
  vItem.Reset;
  if vItem.SelectInDB(AItemId) then begin
     with AGrid do begin
       Cells[colCode,ARow] := vItem.ItemCode;
       Cells[colName,ARow] := vItem.ItemName;
       Floats[colQty,ARow] := 1;
       Ints[colSeq,ARow]:= vItem.ItemId;
       Floats[colPrice,ARow] := vItem.PricePurchase;
       Floats[colStok,ARow] := TItems.getStokTotalPeriodeNew(vItem.ItemId,Now,false);
     end;
  end;
  SetAmount(ARow);
  ArrangeColSize;
end;

procedure TfrmStokOpname.cmbGudangKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    asgTerima.SetFocus;
end;

procedure TfrmStokOpname.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmStokOpname.PrintData;
   var tmpId : integer;
   qrp : TqrpOpname;
begin
  tmpId := TShipment.getIdFromNum(Trim(sttNum.Caption));
    qrp := TqrpOpname.Create(self);
    qrp.Executes(tmpId,MasterType);
    qrp.Free;


end;

end.
