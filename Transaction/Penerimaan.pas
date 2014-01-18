unit Penerimaan;
{DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit;

type
  TfrmPenerimaan = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    asgTerima: TAdvStringGrid;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    l: TLabel;
    Label1: TLabel;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    StaticText2: TStaticText;
    Bevel1: TBevel;
    btnDelete: TButton;
    btnNew: TButton;
    txtNoPol: TAdvEdit;
    btnCust: TButton;
    pgcSupplier: TPageControl;
    tbsCust: TTabSheet;
    Label8: TLabel;
    lblAddress: TLabel;
    lblNamaCust: TLabel;
    lblTlp: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    txtSubtotal: TAdvEdit;
    txtDisc: TAdvEdit;
    txtTotal: TAdvEdit;
    Label11: TLabel;
    btnNewCust: TButton;
    dtpKirim: TDateTimePicker;
    dtpSampai: TDateTimePicker;
    Label5: TLabel;
    txtDelivery: TAdvEdit;
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
    procedure txtDiscChange(Sender: TObject);
    procedure btnCustClick(Sender: TObject);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtDiscKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNewCustClick(Sender: TObject);
    procedure dtpKirimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpSampaiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgTerimaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    BrowseMode,EditMode : boolean;
    MasterSeq : integer;
    //vItemArr : TItems_Arr;
    vItem : TItems;
//    MasterType : string;
    procedure ArrangeColSize;
    procedure InitForm;
    procedure InitGrid;
    procedure getItem(AGrid:TAdvStringGrid;AItemId,ARow:integer);
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure NewNumber;
    procedure SetAmount(ARow:integer;ACol:integer=0);
    procedure CountSubtotal(ARow,ACol : integer);
    procedure SetFooter;
    procedure LoadSupplier(ACode:string);
    procedure PrintData;
  public
    { Public declarations }
    function Execute(ATerimaSeq:integer;AEditMode:boolean=False):boolean;
  end;

var
  frmPenerimaan: TfrmPenerimaan;

const
  colNo = 0;
  colCode = 1;
  colName = 2;
  colKendaraan = 3;

  colQty = 4;
  colSatuan = 5;
  colPrice = 6;
  colAmount = 7;

  colDiscPct = 8;
  colDisc = 9;
  colNett = 10;

  colSeq = 11;

implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVRekap, LOVFlat, PersonAdd,
  PenerimaanPrint;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmPenerimaan.ArrangeColSize;
begin
  asgTerima.AutoSizeColumns(True,3);
  asgTerima.AutoNumberCol(colNo);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  asgTerima.ColWidths[colSeq]:=0;
  asgTerima.ColWidths[colCode]  := 140;
end;

function TfrmPenerimaan.Execute(ATerimaSeq: integer;AEditMode:boolean=False): boolean;
begin
  vItem := TItems.Create;
  Result := False;
  BrowseMode := ATerimaSeq>0;
  EditMode := AEditMode;
  MasterSeq := ATerimaSeq;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vItem.Free;
end;

procedure TfrmPenerimaan.InitForm;
begin
  sttNum.Tag := 0;
  btnNewCust.Enabled := (not BrowseMode)  or EditMode;
  //btnSave.Enabled   := not BrowseMode;
  dtpTrans.Enabled  := (not BrowseMode)  or EditMode;
  dtpKirim.Enabled  := (not BrowseMode) or EditMode;
  dtpSampai.Enabled  := (not BrowseMode) or EditMode;
  mmNotes.ReadOnly  := BrowseMode and (not EditMode);
  btnDelete.Enabled := (not BrowseMode) or EditMode;
  btnNew.Enabled    := (not BrowseMode) or EditMode;
  btnCust.Enabled   := (not BrowseMode) or EditMode;
  btnSave.Caption := IfThen(BrowseMode,IfThen(EditMode,'Save', 'Print'),'Save');
  lblAddress.Caption  := '';
  lblNamaCust.Caption := '';
  lblTlp.Caption      := '';
  txtNoPol.Clear;
  txtDelivery.Clear;
  txtSubtotal.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  txtDisc.ReadOnly := BrowseMode and (not EditMode);
  txtDelivery.ReadOnly := BrowseMode and (not EditMode);
  Self.Caption := IfThen(BrowseMode,IfThen(EditMode,'Edit', 'View')+' Terima Barang','New Terima Barang');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  dtpKirim.Format:= 'dddd, dd MMMM yyyy';
  dtpKirim.Date  := ServerNow;
  dtpSampai.Format:= 'dddd, dd MMMM yyyy';
  dtpSampai.Date  := ServerNow;
  NewNumber;
  mmNotes.Clear;
  Self.ActiveControl := txtNoPol;
  InitGrid;
end;

procedure TfrmPenerimaan.InitGrid;
begin
  ResetGrid(asgTerima,3,13,1,1);
  with asgTerima do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Nama Part';
    Cells[colKendaraan,0]:= 'Kendaraan';
    Cells[colQty,0] := 'Quantity';
    Cells[colSatuan,0] := 'Satuan';
    Cells[colPrice,0] := 'Harga Beli';
    Cells[colAmount,0] := 'Subtotal';
    
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp)';
    Cells[colNett,0] := 'Netto';

    Cells[colSeq,0] := 'Sequence';
        ColWidths[colCode]  := 140;
  end;
  ArrangeColSize;
end;

function TfrmPenerimaan.isSaved: boolean;
var vShipment : TShipment;
    vDetail   : TItemDetail_Arr;
    i,idx:integer;
    vConversion : real;
begin
   vShipment := TShipment.Create;
   vDetail   := TItemDetail_Arr.Create;

   vShipment.ShipNum := TShipment.getNewNumber(SHIP_TYPE_TERIMA_BARANG,dtpTrans.Date);//sttNum.Caption;
   vShipment.ShipType:= SHIP_TYPE_TERIMA_BARANG;
   vShipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.TglKirim := dtpKirim.Date;
   vShipment.TglSampai := dtpSampai.Date;
   vShipment.DeliveryNum := txtDelivery.Text;
   vShipment.ShipId :=sttNum.Tag;
   for i:= 1 to asgTerima.RowCount-1 do
     if not IsClear(asgTerima,i,colSeq) then begin
        vConversion := TItems.getConversion(asgTerima.Ints[colSeq,i]);
        idx:= vDetail.Add(0,0,asgTerima.Floats[colQty,i]*vConversion,asgTerima.Floats[colPrice,i],vConversion,
         asgTerima.Floats[colNett,i],DB_CR_TYPE_DEBIT,0,asgTerima.Floats[colDisc,i],0,0,'',0,False);
         //idx:= vDetail.Add(0,0,asgTerima.Floats[colQty,i]*vConversion,asgTerima.Floats[colPrice,i],vConversion,
//         asgTerima.Floats[colAmount,i],DB_CR_TYPE_DEBIT,0,0,0,0,'',0,False);
         vDetail[idx].ItemBalance.Items.ItemId := asgTerima.Ints[colSeq,i];
     end;

   if EditMode then begin
      vShipment.ShipId :=  sttNum.Tag;
      Result := vShipment.UpdateTerima(vDetail);
   end
   else
   Result := vShipment.InsertTerima(vDetail);
   if not Result  then
     Alert(MSG_UNSUCCESS_SAVING)
   else 
     PrintData;
   vShipment.Free;
   vDetail.Free;
end;

function TfrmPenerimaan.isValid: boolean;
begin
  Result := False;
  if txtNoPol.Text = '' then begin
    Alert('Data Relasi belum diisi');
    txtNoPol.SetFocus;
  end
  else if not TPersons.ExistInDB(txtNoPol.Text) then begin
    Alert('ID Relasi belum terdaftar');
    txtNoPol.SetFocus;
  end
  else
    Result := True;
end;

procedure TfrmPenerimaan.LoadData;
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
   txtNoPol.Text          := TPersons.getCodeFromID(vShipment.Persons.PersonId);
   LoadSupplier(txtNoPol.Text);
   sttNum.Tag := vShipment.ShipId;
   txtDelivery.Text := vShipment.DeliveryNum;
   dtpKirim.Date := vShipment.TglKirim;
   dtpSampai.Date:= vShipment.TglSampai;
   txtSubtotal.FloatValue := vShipment.Subtotal;
   txtDisc.FloatValue     := vShipment.Discount;
   txtTotal.FloatValue    := vShipment.Total;
   sttNum.Caption   := ' '+vShipment.ShipNum;
   dtpTrans.DateTime:= vShipment.ShipDate;
   mmNotes.Lines.Text := vShipment.Notes ;
   vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
   for i:= 0 to vShipment.ItemDetailArr.Count-1 do
    with asgTerima do begin
      Cells[colCode,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
      Cells[colName,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
      Cells[colSatuan,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.UsedUnit;
      Floats[colQty,i+1] := vShipment.ItemDetailArr[i].Quantity / IfThen(vShipment.ItemDetailArr[i].Conversion=0,1,vShipment.ItemDetailArr[i].Conversion);
      Floats[colPrice,i+1]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vShipment.ItemDetailArr[i].Conversion=0,1,vShipment.ItemDetailArr[i].Conversion);
      Floats[colDisc,i+1] := vShipment.ItemDetailArr[i].Discount;
      Floats[colAmount,i+1] := vShipment.ItemDetailArr[i].Amount;
      Ints[colSeq,i+1] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemId;
      SetAmount(i+1,colNett);
      AddRow;
   end;
   DeleteRowTerakhir(asgTerima,2,1);
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmPenerimaan.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumber(SHIP_TYPE_TERIMA_BARANG,dtpTrans.DateTime);
end;

procedure TfrmPenerimaan.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDiscPct,colDisc]) and ((not BrowseMode) or EditMode) ;
  //if CanEdit and (ACol = colPrice) then
    //if asgTerima.Floats[colPrice,ARow] >0 then
      //CanEdit := False;
end;

procedure TfrmPenerimaan.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
 var vId : integer; 
begin
  case Col of
    // ADD for barcode reader --  03.02.08
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
      Valid := (StrFmtToFloatDef(Value,0)>0) and (Value<>'');
      if Valid then begin
        SetAmount(Row,Col);
        //asgTerima.AddRow;
      end;

      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrFmtToFloatDef(Value,0)>0) and (Value<>'');
      if Valid then begin


      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
       SetAmount(Row,Col);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
       // asgTerima.AddRow;
        SetAmount(Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmPenerimaan.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colAmount,colDisc,colDiscPct,colNett] then
    HAlign := taRightJustify;
end;

procedure TfrmPenerimaan.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);

begin
  case ACol of
    colPrice,colDisc : AEditor := edPositiveNumeric;
         colQty,colDiscPct : AEditor := edFloat;
  end;
end;

procedure TfrmPenerimaan.btnSaveClick(Sender: TObject);
begin
  if (BrowseMode  and (not EditMode))  then
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

procedure TfrmPenerimaan.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmPenerimaan.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmPenerimaan.btnDeleteClick(Sender: TObject);
begin
  if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode,False);
 SetFooter;
end;

procedure TfrmPenerimaan.btnNewClick(Sender: TObject);
var vEditor : TEditorType;
begin
   vEditor := edComboList;
   frmItemAdd.NewExecute;
//   vItemArr.FindFlat;
   asgTerimaGetEditorType(Self,colCode,asgTerima.Row,vEditor);
   asgTerimaGetEditorType(Self,colName,asgTerima.Row,vEditor);
end;

procedure TfrmPenerimaan.SetAmount(ARow,ACol: integer);
begin
    if aCol in [colDisc,colDiscPct] then
    CountSubtotal(ARow,aCol)
  else
    CountSubtotal(ARow,IfThen(asgTerima.Floats[colDiscPct,ARow]=0,colDisc,colDiscPct));

 // asgTerima.Floats[colAmount,ARow] := asgTerima.Floats[colPrice,ARow] * asgTerima.Floats[colQty,ARow];
   asgTerima.Floats[colAmount,ARow] := asgTerima.Floats[colPrice,ARow] * asgTerima.Floats[colQty,ARow];
  asgTerima.Floats[colNett,ARow] := asgTerima.Floats[colAmount,ARow] - (asgTerima.Floats[colDisc,ARow]);//*AGrid.Floats[colQty,ARow]
  asgTerima.FloatingFooter.ColumnCalc[colAmount]:= acSUM;
  asgTerima.FloatingFooter.ColumnCalc[colNett]:= acSUM;
  asgTerima.FloatingFooter.ColumnCalc[colDisc]:= acSUM;
  SetFooter;
end;

procedure TfrmPenerimaan.SetFooter;
begin
//gara" nambah diskon jadi disamain dengan menu sales 03.11.11
  txtSubtotal.FloatValue := asgTerima.ColumnSum(colNett,1,asgTerima.RowCount-2);
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;// - txtDP.FloatValue;

//  txtSubtotal.FloatValue := asgTerima.ColumnSum(colAmount,1,asgTerima.RowCount-1);
 // txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;
end;

procedure TfrmPenerimaan.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmPenerimaan.btnCustClick(Sender: TObject);
var vTmp : integer;
begin
   vTmp := frmLovFlat.Execute('CODE',txtNoPol.Text,'SUPPLIER',' AND person_type = '+FormatSQLString(PS_TYPE_SUPPLIER),False);
   if vTmp = 0 then exit;
   txtNoPol.Text := TPersons.getCodeFromID(vTmp);
   LoadSupplier(txtNoPol.Text);
   mmNotes.SetFocus;
end;

procedure TfrmPenerimaan.LoadSupplier(ACode: string);
var vCust : TPersons;
begin
  vCust := TPersons.Create;
  if not vCust.SelectInDB(0,ACode) then begin
    lblAddress.Caption  := '';
    lblNamaCust.Caption := '';
    lblTlp.Caption      := '';
    txtNoPol.Clear;
    Alert(MSG_NO_DATA_FOUND);
    vCust.Free;
    exit;
  end;
  lblNamaCust.Caption := vCust.PersonName;
  lblAddress.Caption  := vCust.Address;
  lblTlp.Caption      := vCust.Phone1;

end;

procedure TfrmPenerimaan.getItem(AGrid: TAdvStringGrid; AItemId,
  ARow: integer);
begin
  vItem.Reset;
  if vItem.SelectInDB(AItemId) then begin
     with AGrid do begin
       Cells[colCode,ARow] := vItem.ItemCode;
       Cells[colName,ARow] := vItem.ItemName;
       Cells[colSatuan,ARow] := vItem.UsedUnit;
       Floats[colQty,ARow] := 1;
       Ints[colSeq,ARow]:= vItem.ItemId;
       Floats[colPrice,ARow] := vItem.PricePurchase;
       Cells[colKendaraan,ARow] := TMotor.getName(vItem.CarId);
     end;
  end;
  SetAmount(ARow,);
  ArrangeColSize;
end;

procedure TfrmPenerimaan.asgTerimaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
  vSearch : string;
begin
  if (BrowseMode) and (Not EditMode)  then exit;
   case Key of
     VK_F8 : ShortCutF8(asgTerima,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        btnDelete.Click;                
     end;
     VK_F2 : begin
        vId := frmLovFlat.Execute(IfThen(asgTerima.Col=colName,'NAME','CODE'),vSearch,'ITEM','',false);
           if vId > 0 then
             getItem(asgTerima,vId,asgTerima.Row);

     end;
     //close   becoz  ADD for barcode reader --  03.02.08
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgTerima.Col of
         colCode,colName : begin

           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
          { if vItem.isExistCode(vSearch) then begin
              vId := vItem.getIdFromCode(vSearch);
           end
           else}
             vId := frmLovFlat.Execute(IfThen(asgTerima.Col=colName,'NAME','CODE'),vSearch,'ITEM','',false);
           if vId > 0 then
             getItem(asgTerima,vId,asgTerima.Row);
         end;
       end;
     end; //end ord
        {$ENDIF}

     //end close becoz  ADD for barcode reader --  03.02.08

   end;//end case

end;

procedure TfrmPenerimaan.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmPenerimaan.txtDiscKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_RETURN then
     btnSave.SetFocus;
end;

procedure TfrmPenerimaan.btnNewCustClick(Sender: TObject);
var tmp : integer;
begin
  tmp := frmPersonAdd.ExecuteSupplier(0);
  LoadSupplier(TPersons.getCodeFromID(tmp));
  mmNotes.SetFocus;

end;

procedure TfrmPenerimaan.dtpKirimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
    dtpSampai.SetFocus;
end;

procedure TfrmPenerimaan.dtpSampaiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    txtDelivery.SetFocus;
end;

procedure TfrmPenerimaan.PrintData;
   var tmpId : integer;
begin
  tmpId := TShipment.getIdFromNum(Trim(sttNum.Caption));
 // if TShipment.isPosted(tmpId) then
    qrpPenerimaan.Executes(tmpId)
end;

procedure TfrmPenerimaan.CountSubtotal(ARow, ACol: integer);
var  vPct,vDisc,vPrice,vQty : Double;
begin
//utk perhitungan kolom disc/discpct
    vPrice := asgTerima.Floats[colPrice,Arow];
    vPct   := asgTerima.Floats[colDiscPct,Arow];
    vQty   := asgTerima.Floats[colQty,ARow];
    vDisc  := asgTerima.Floats[colDisc,ARow];
    case Acol of
      colDiscPct : begin
        if vPct = 0 then
          vDisc := 0
        else
          vDisc := ((vPct / 100)) *  vPrice * vQty;
          //vDisc := ((vPct / 100)+1) *  vPrice;


        {vSales := ((x / 100)+1) *  vPrice;
         vSales := ((x/100)* vprice) + vprice;
         vsales - vprice := x.vPrice /100
         (vsales - vPrice) * 100 := x.vPrice
         ((vsales - vPrice) * 100) / vPrice := x;
          }
      end;
      colDisc : begin
       {1000 := (10/100) * 10000
        10/100 := 1000/10000
        10 := (1000/10000) * 100)}
        {x := ((vsales - vPrice) * 100) / vPrice}
        if vDisc = 0 then
          vPct := 0
        else
          vPct := (vDisc / vPrice) * 100 / vQty;
          //vPct :=  ((vDisc - vPrice)* 100) / vPrice;
      end;
    end;
    asgTerima.Floats[colDiscPct,Arow] := vPct;
    asgTerima.Floats[colDisc,Arow] := vDisc;


end;

procedure TfrmPenerimaan.asgTerimaKeyPress(Sender: TObject; var Key: Char);
begin
case (Sender as TAdvStringGrid).Col of
    colQty, colDisc: if key = #46 then key := #44;
  end;
end;

end.
