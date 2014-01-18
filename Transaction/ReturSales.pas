unit ReturSales;
{DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit;

type
  TfrmReturSales = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    asgTerima: TAdvStringGrid;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    l: TLabel;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    StaticText2: TStaticText;
    Bevel1: TBevel;
    btnDelete: TButton;
    pgcCust: TPageControl;
    tbsCust: TTabSheet;
    tbsMotor: TTabSheet;
    txtNoPol: TAdvEdit;
    btnCust: TButton;
    sttOperator: TStaticText;
    Label7: TLabel;
    lblAddress: TLabel;
    lblNamaCust: TLabel;
    lblTlp: TLabel;
    lblTipeMotor: TLabel;
    lblTahun: TLabel;
    lblRangka: TLabel;
    lblNoMesin: TLabel;
    txtServiceNum: TAdvEdit;
    btnService: TButton;
    pnl: TPanel;
    txtSubtotal: TAdvEdit;
    txtDisc: TAdvEdit;
    txtTotal: TAdvEdit;
    txtBayar: TAdvEdit;
    txtkembali: TAdvEdit;
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
    procedure btnCustClick(Sender: TObject);
    procedure txtBayarChange(Sender: TObject);
    procedure btnServiceClick(Sender: TObject);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtBayarKeyDown(Sender: TObject; var Key: Word;
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
    procedure LoadCustomer(ANoPol:string);
    procedure NewNumber;
    procedure SetAmount(ARow:integer);
    procedure SetFooter;
    procedure PrintData;
  public
    { Public declarations }
    function Execute(ATerimaSeq:integer):boolean;
  end;

var
  frmReturSales: TfrmReturSales;

const
  colNo = 0;
  colCode = 1;
  colType = 2;
  colName = 3;
  colQty = 4;
  colPrice = 5;
  colBruto = 6;
  colDisc = 7;
  colNett = 8;

  colQty2 = 9;
  colPrice2 = 10;
  colNett2 = 11;

  colID = 12;
  colParttype = 13;

implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVNew,  LOVRekap, LOVFlat,
  NotaReturSalesPrint;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmReturSales.ArrangeColSize;
begin
  asgTerima.AutoSizeColumns(True,3);
  asgTerima.AutoNumberCol(colNo);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  asgTerima.ColWidths[colID]:=0;
  asgTerima.ColWidths[colPartType]:=0;
   asgTerima.ColWidths[colCode]  := 140;
end;

function TfrmReturSales.Execute(ATerimaSeq: integer): boolean;
begin
  //vItemArr := TItems_Arr.Create;
  vItem := TItems.Create;
  Result := False;
  BrowseMode := ATerimaSeq>0;
  MasterSeq := ATerimaSeq;
//  vItemArr.FindFlat;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vItem.Free;
end;

procedure TfrmReturSales.InitForm;
begin
  dtpTrans.Enabled  := not BrowseMode;
  mmNotes.ReadOnly  := BrowseMode;
  btnDelete.Enabled := not BrowseMode;
  txtDisc.ReadOnly  := BrowseMode;
  btnCust.Enabled   := False;// not BrowseMode;
  btnSave.Caption   := IfThen(BrowseMode,'&Print','&Save');
  txtSubtotal.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  txtBayar.Clear;
  txtkembali.Clear;
  txtNoPol.Clear;
  mmNotes.Clear;
  txtServiceNum.Clear;
  lblAddress.Caption  := '';
  lblNamaCust.Caption := '';
  lblTlp.Caption      := '';
  lblTipeMotor.Caption:= '';
  lblTahun.Caption    := '';
  lblRangka.Caption   := '';
  lblNoMesin.Caption  := '';

  sttOperator.Caption := GlobalSystemUser.UserId;

  Self.Caption := IfThen(BrowseMode,'View Retur Sales','New Retur Sales');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;
  InitGrid;
end;

procedure TfrmReturSales.InitGrid;
begin
  ResetGrid(asgTerima,2,15,1,1);
  with asgTerima do begin
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDisc,0] := 'Disc';
    Cells[colNett,0] := 'Netto';

    Cells[colQty2,0] := 'Qty Retur';
    Cells[colPrice2,0] := 'Harga Retur';
    Cells[colNett2,0] := 'Subtotal Retur';
    Cells[colID,0] := 'ID';
    Cells[colParttype,0] := 'PartType';
        ColWidths[colCode]  := 140;
  end;
  ArrangeColSize;
end;

function TfrmReturSales.isSaved: boolean;
var vShipment : TShipment;
    i,idx:integer;
    vConversion : real;
begin
   vShipment := TShipment.Create;

   vShipment.ShipNum := TShipment.getNewNumber(SHIP_TYPE_RETUR_SALES,dtpTrans.Date);//sttNum.Caption;
   vShipment.ShipType:= SHIP_TYPE_RETUR_SALES;
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.ShipIdUsed := TShipment.getIdFromNum(txtServiceNum.Text);
   vShipment.IsPost := True;
   for i:= 1 to asgTerima.RowCount-1 do
     if not IsClear(asgTerima,i,colID) then begin
          vConversion := TItems.getConversion(asgTerima.Ints[colId,i]);
          idx:= vShipment.ItemDetailArr.Add(0,0,asgTerima.Floats[colQty2,i]*vConversion,asgTerima.Floats[colPrice2,i],vConversion,
           asgTerima.Floats[colNett2,i],DB_CR_TYPE_DEBIT,0,0,0,0,'',0,False);{asgTerima.Floats[colDisc,i]}
           vShipment.ItemDetailArr[idx].ItemBalance.Items.ItemId := asgTerima.Ints[colID,i];
     end;
   Result := vShipment.InsertService;
   if not Result  then
     Alert(MSG_UNSUCCESS_SAVING)
   else begin
     sttNum.Caption := vShipment.ShipNum;
     PrintData;
   end;
   vShipment.Free;
end;

function TfrmReturSales.isValid: boolean;
begin
  Result := False;
  if txtServiceNum.Text = '' then begin
    Alert('Nomor Referensi Service belum diisi');
    btnService.SetFocus;
  end
  else if txtNoPol.Text = '' then begin
    Alert('Data Pelanggan belum diisi');
    txtNoPol.SetFocus;
  end
  else if not TPersons.ExistInDB(txtNoPol.Text) then begin
    Alert('ID Pelanggan belum terdaftar');
    txtNoPol.SetFocus;
  end
  else
    Result := True;
end;

procedure TfrmReturSales.LoadData;
var vShipment : TShipment;
    i,vRow:integer;
begin
   vShipment := TShipment.Create;
   InitGrid;

   if not vShipment.SelectInDB(MasterSeq) then begin
     Alert(MSG_NO_DATA_FOUND);
     vShipment.Free;
     exit;
   end;

   txtSubtotal.FloatValue := vShipment.Subtotal;
   txtDisc.FloatValue     := vShipment.Discount;
   txtTotal.FloatValue    := vShipment.Total;
   txtNoPol.Text          := TPersons.getCodeFromID(vShipment.Persons.PersonId);
   LoadCustomer(txtNoPol.Text);
   txtServiceNum.Text   := vShipment.ShipNum;
   if BrowseMode then begin
     dtpTrans.DateTime:= vShipment.ShipDate;
     sttNum.Caption := vShipment.ShipNum;
     txtServiceNum.Text := TShipment.getNumFromID(vShipment.ShipIdUsed);
   end;
   mmNotes.Lines.Text := vShipment.Notes ;
   vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
   for i:= 0 to vShipment.ItemDetailArr.Count-1 do
    with asgTerima do begin
      vRow := asgTerima.RowCount-1;
      Cells[colCode,vRow]  := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
      Cells[colName,vRow]  := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
      Cells[colType,vRow]  := TItems.getDesc(vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType);
      if not BrowseMode then begin
        Floats[colQty,vRow]  := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colDisc,vRow] := vShipment.ItemDetailArr[i].Discount;
        Floats[colBruto,vRow]:= vShipment.ItemDetailArr[i].Amount;
        //
        Floats[colQty2,vRow]  := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice2,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colNett2,vRow] := vShipment.ItemDetailArr[i].Amount;
      end
      else begin
        Floats[colQty2,vRow]  := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice2,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colNett2,vRow] := vShipment.ItemDetailArr[i].Amount;
      end;
      Ints[colId,vRow]     := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemId;
      Cells[colPartType,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType;
      SetAmount(vRow);
      AddRow;
   end;
   DeleteRowTerakhir(asgTerima,2,1);
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmReturSales.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumber(SHIP_TYPE_RETUR_SALES,dtpTrans.DateTime);
end;

procedure TfrmReturSales.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin                                                   {,colDisc}
  CanEdit := (ACol in [colQty2,colCode,colName,colPrice2]) and (not BrowseMode);
end;

procedure TfrmReturSales.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;vId:Integer;
begin
  case Col of
   {$IFDEF BARCODE}
    colCode : begin
     // Alert(Value);
      if vItem.isExistCode(Value) then begin
         vId := vItem.getIdFromCode(Value);
      end
      else
         vId := frmLovFlat.Execute(IfThen(Col=colName,'NAME','CODE'),Value,'ITEM','',true);
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
      vMsg  := 'Data masukan salah!';
      if Valid then begin
        Valid := (StrToFloat(Value) <= TItems.getStokTotal(asgTerima.Ints[colID,Row]));
        vMsg  := 'Stok tidak mencukupi';

      end;
      if not Valid then begin
        Alert(vMsg);
        asgTerima.Col := Col;
        Value := '';
      end;
      SetAmount(Row);
    end;
    colDisc :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgTerima.AddRow;
         SetAmount(Row);
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

procedure TfrmReturSales.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colQty2,colPRice2,colNett2] then
    HAlign := taRightJustify;
end;

procedure TfrmReturSales.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);

begin
  case ACol of
    colQty2,colPrice2{,colDisc} : AEditor := edPositiveNumeric;
  end;
end;

procedure TfrmReturSales.btnSaveClick(Sender: TObject);
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

procedure TfrmReturSales.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmReturSales.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmReturSales.btnDeleteClick(Sender: TObject);
begin
  if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode,False);
    SetFooter
end;

procedure TfrmReturSales.SetAmount(ARow: integer);
begin
  if not BrowseMode then begin
    asgTerima.Floats[colBruto,ARow] := asgTerima.Floats[colPrice,ARow] * asgTerima.Floats[colQty,ARow];
    asgTerima.Floats[colNett,ARow] := asgTerima.Floats[colBruto,ARow] - asgTerima.Floats[colDisc,ARow];
  end;
 // else begin
    asgTerima.Floats[colNett2,ARow] := asgTerima.Floats[colQty2,ARow] * asgTerima.Floats[colPrice2,ARow];
 //  end;
  SetFooter;
end;

procedure TfrmReturSales.SetFooter;
begin
  
  txtSubtotal.FloatValue := asgTerima.ColumnSum(colNett2,1,asgTerima.RowCount-1);
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;
end;

procedure TfrmReturSales.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmReturSales.LoadCustomer(ANoPol: string);
var vCust : TPersons;
begin
  vCust := TPersons.Create;
  if not vCust.SelectInDB(0,ANoPol) then begin
    lblAddress.Caption  := '';
    lblNamaCust.Caption := '';
    lblTlp.Caption      := '';
    lblTipeMotor.Caption:= '';
    lblTahun.Caption    := '';
    lblRangka.Caption   := '';
    lblNoMesin.Caption  := '';
    txtNoPol.Clear;
    Alert(MSG_NO_DATA_FOUND);
    vCust.Free;
    exit;
  end;
  lblNamaCust.Caption := vCust.PersonName;
  lblAddress.Caption  := vCust.Address;
  lblTlp.Caption      := vCust.Phone1;
  lblTahun.Caption    := IntToStr(vCust.MtrYear);
  lblRangka.Caption   := vCust.MtrRangka;
  lblNoMesin.Caption  := vCust.MtrMesin;
  lblTipeMotor.Caption:= TMotor.getName(vCust.Motor.MotorId);
  vCust.Free;
end;

procedure TfrmReturSales.btnCustClick(Sender: TObject);
var vTmp : string;
begin
   vTmp := frmLOVNew.Execute(LOV_CUSTOMER);
   if vTmp = '' then exit;
   txtNoPol.Text := TPersons.getCodeFromID(StrToIntDef(vTmp,0));
   LoadCustomer(txtNoPol.Text);
end;

procedure TfrmReturSales.txtBayarChange(Sender: TObject);
begin
   txtkembali.FloatValue :=  txtBayar.FloatValue - txtTotal.FloatValue;
end;

procedure TfrmReturSales.PrintData;
begin
  Application.CreateForm(TqrpNotaReturSales,qrpNotaReturSales);
  qrpNotaReturSales.Executes(IfThen(BrowseMode,MasterSeq,TShipment.getIdFromNum(Trim(sttNum.Caption))));
  qrpNotaReturSales.Free;
//  qrpNotaService.Executes(TShipment.getIdFromNum(Trim(sttNum.Caption)),SHIP_TYPE_RETUR_SERVICE);
end;

procedure TfrmReturSales.btnServiceClick(Sender: TObject);
begin
  MasterSeq := frmLOVRekap.ExecuteSales;
  LoadData;
  mmNotes.SetFocus;
end;

procedure TfrmReturSales.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    asgTerima.SetFocus;
end;

procedure TfrmReturSales.asgTerimaKeyDown(Sender: TObject; var Key: Word;
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

procedure TfrmReturSales.getItem(AGrid: TAdvStringGrid; AItemId,
  ARow: integer);
begin
   vItem.Reset;
  if vItem.SelectInDB(AItemId) then begin
     with AGrid do begin
       Cells[colCode,ARow] := vItem.ItemCode;
       Cells[colName,ARow] := vItem.ItemName;
       Cells[colType,ARow] := TItems.getDesc(vItem.ItemType);
       Floats[colQty2,ARow] := 1;
       Ints[colId,ARow]:= vItem.ItemId;
       Floats[colPrice2,ARow] := vItem.Price;
     end;
  end;
  SetAmount(ARow);
  ArrangeColSize;
end;

procedure TfrmReturSales.txtBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    btnSave.SetFocus;
end;

end.
