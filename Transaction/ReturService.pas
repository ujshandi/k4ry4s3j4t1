unit ReturService;
{$DEFINE BARCODE}  //UNTUK BARCODE
{DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit;

type
  TfrmReturService = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    asgTerima: TAdvStringGrid;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    l: TLabel;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    Bevel1: TBevel;
    btnDelete: TButton;
    pgcCust: TPageControl;
    tbsCust: TTabSheet;
    tbsMotor: TTabSheet;
    txtNoPol: TAdvEdit;
    btnCust: TButton;
    sttOperator: TStaticText;
    Label8: TLabel;
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
    asgRegService: TAdvStringGrid;
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
    procedure asgRegServiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgRegServiceCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure asgRegServiceCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
  private
    { Private declarations }
    BrowseMode : boolean;
    MasterSeq : integer;
    //ListMekanik : TStringList;
    vItem : TItems;
    vService : TServices;
    //vItemArr : TItems_Arr;
    procedure ArrangeColSize;
    procedure getItem(AGrid:TAdvStringGrid;AItemId,ARow:integer;isItem:boolean=True;AGridChild:TAdvStringGrid=nil);
    procedure InitForm;
    procedure InitGrid;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure LoadCustomer(ANoPol:string);
    procedure NewNumber;
    procedure SetAmount(AGrid:TAdvStringGrid;ARow:integer);
    procedure SetFooter;
    procedure PrintData;
  public
    { Public declarations }
    function Execute(ATerimaSeq:integer):boolean;
  end;

var
  frmReturService: TfrmReturService;

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
  colParent = 14;

implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVNew, LOVRekap, LOVFlat,
  NotaReturServicePrint;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmReturService.ArrangeColSize;
begin
  asgTerima.AutoSizeColumns(True,3);
  asgTerima.AutoNumberCol(colNo);
  asgRegService.AutoSizeColumns(True,3);
  asgRegService.AutoNumberCol(colNo);
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
  asgTerima.ColWidths[colID]:=0;
  asgTerima.ColWidths[colPartType]:=0;
  asgTerima.ColWidths[colParent] := 0;
  asgRegService.ColWidths[colID]:=0;
  asgRegService.ColWidths[colPartType]:=0;
  asgRegService.ColWidths[colParent] := 0;
   asgTerima.ColWidths[colCode]  := 140;
    asgRegService.ColWidths[colCode]  := 140;
end;

function TfrmReturService.Execute(ATerimaSeq: integer): boolean;
begin
//  ListMekanik := TStringList.Create;
 // vItemArr := TItems_Arr.Create;
  vItem := TItems.Create;
  vService := TServices.Create;
  Result := False;
  BrowseMode := ATerimaSeq>0;
  MasterSeq := ATerimaSeq;
  //vItemArr.FindFlatWithService;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vItem.Free;
  vService.Free;
  //ListMekanik.Free;
end;

procedure TfrmReturService.InitForm;
begin
 // btnSave.Enabled   := not BrowseMode;
  dtpTrans.Enabled  := not BrowseMode;
  mmNotes.ReadOnly  := BrowseMode;
  btnDelete.Enabled := not BrowseMode;
  txtDisc.ReadOnly  := BrowseMode;
  btnCust.Enabled   := False;// not BrowseMode;
//  cmbMekanik.Enabled := not BrowseMode;
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

//  cmbMekanik.ItemIndex := -1;
  sttOperator.Caption := GlobalSystemUser.UserId;

 // TPersons_Arr.GetList(ListMekanik,FormatSQLString(PS_TYPE_MECHANIC));
 // NameValueListToValueList(ListMekanik,cmbMekanik.Items);
  Self.Caption := IfThen(BrowseMode,'View Retur Service','New Retur Service');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;
  Self.ActiveControl := txtServiceNum;
  InitGrid;
end;

procedure TfrmReturService.InitGrid;
begin
  ResetGrid(asgTerima,2,16,1,1);
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
    Cells[colParent,0] := 'Parent';
        ColWidths[colCode]  := 140;
  end;
  ResetGrid(asgRegService,2,16,1,1);
  with asgRegService do begin
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Jasa';
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
    Cells[colParent,0] := 'Parent';
  end;
  ArrangeColSize;
end;

function TfrmReturService.isSaved: boolean;
var vShipment : TShipment;
    i,idx:integer;
    vConversion : real;
begin
   vShipment := TShipment.Create;

   vShipment.ShipNum := TShipment.getNewNumber(SHIP_TYPE_RETUR_SERVICE,dtpTrans.Date);//sttNum.Caption;
   vShipment.ShipType:= SHIP_TYPE_RETUR_SERVICE;
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.IsPost := True;
   vShipment.ShipIdUsed := TShipment.getIdFromNum(txtServiceNum.Text);
   for i:= 1 to asgTerima.RowCount-1 do
     if not IsClear(asgTerima,i,colID) then begin
          vConversion := TItems.getConversion(asgTerima.Ints[colId,i]);
          idx:= vShipment.ItemDetailArr.Add(0,0,asgTerima.Floats[colQty2,i]*vConversion,asgTerima.Floats[colPrice2,i],vConversion,
           asgTerima.Floats[colNett2,i],DB_CR_TYPE_DEBIT,0,{asgTerima.Floats[colDisc,i]}0,0,0,'',0,False);
           vShipment.ItemDetailArr[idx].ItemBalance.Items.ItemId := asgTerima.Ints[colID,i];
     end;

   for i:= 1 to asgRegService.RowCount-1 do
     if not IsClear(asgRegService,i,colID) then begin
           vShipment.ServiceDetailArr.Add(0,0,asgRegService.Ints[colId,i],asgRegService.Floats[colQty2,i],
                  asgRegService.Floats[colPrice2,i],asgRegService.Floats[colNett2,i],'',0,{asgRegService.Floats[colDisc,i]}0,0,False);
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

function TfrmReturService.isValid: boolean;
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

procedure TfrmReturService.LoadData;
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
      Cells[colCode,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
      Cells[colName,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
      Cells[colType,vRow] := TItems.getDesc(vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType);
      if not BrowseMode then begin
        Floats[colQty,vRow] := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colDisc,vRow] := vShipment.ItemDetailArr[i].Discount;
        Floats[colBruto,vRow] := vShipment.ItemDetailArr[i].Amount;

        //
        Floats[colQty2,vRow] := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice2,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colNett2,vRow] := vShipment.ItemDetailArr[i].Amount;
      end
      else begin
        Floats[colQty2,vRow] := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice2,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colNett2,vRow] := vShipment.ItemDetailArr[i].Amount;
      end;  
      Ints[colId,vRow]  := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemId;
      Cells[colPartType,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType;
      SetAmount(asgTerima,vRow);
      AddRow;
   end;
   vShipment.ServiceDetailArr.FindOnDb(vShipment.ShipId);
   for i:= 0 to vShipment.ServiceDetailArr.Count-1 do
     with asgRegService do begin
        vRow := asgRegService.RowCount-1;
        Cells[colCode,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceCode;
        Cells[colName,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceName;
        Cells[colType,vRow]  := TItems.getDesc(vShipment.ServiceDetailArr[i].Services.ServiceType);
        if not BrowseMode then begin
          Floats[colQty,vRow] := vShipment.ServiceDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colPrice,vRow]:= vShipment.ServiceDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colDisc,vRow] := vShipment.ServiceDetailArr[i].Discount;
          Floats[colBruto,vRow] := vShipment.ServiceDetailArr[i].Amount;
          //
          Floats[colQty2,vRow] := vShipment.ServiceDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colPrice2,vRow]:= vShipment.ServiceDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colNett2,vRow] := vShipment.ServiceDetailArr[i].Amount;
        end
        else begin
          Floats[colQty2,vRow] := vShipment.ServiceDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colPrice2,vRow]:= vShipment.ServiceDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colNett2,vRow] := vShipment.ServiceDetailArr[i].Amount;
        end;
        Ints[colId,vRow]  := vShipment.ServiceDetailArr[i].Services.ServiceId;
        Cells[colPartType,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceType;
        SetAmount(asgRegService,vRow);
        AddRow;
     end;
   DeleteRowTerakhir(asgTerima,2,1);
   DeleteRowTerakhir(asgRegService,2,1);
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmReturService.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumber(SHIP_TYPE_RETUR_SERVICE,dtpTrans.DateTime);
end;

procedure TfrmReturService.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty2,colCode,colName,colPrice2{,colDisc}]) and (not BrowseMode);
end;

procedure TfrmReturService.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string; vId:integer;
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
        SetAmount(asgTerima,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
    colQty2:begin
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
      SetAmount(asgTerima,Row);
    end;
{    colDisc :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgTerima.AddRow;
        SetAmount(asgTerima,Row);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;  }
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmReturService.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colQty2,colPRice2,colNett2] then
    HAlign := taRightJustify;
end;

procedure TfrmReturService.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty2,colPrice2{,colDisc} : AEditor := edPositiveNumeric;

  end;
end;

procedure TfrmReturService.btnSaveClick(Sender: TObject);
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

procedure TfrmReturService.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmReturService.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmReturService.btnDeleteClick(Sender: TObject);
begin
  if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode,False);
  SetFooter;
end;

procedure TfrmReturService.SetAmount(AGrid:TAdvStringGrid;ARow: integer);
begin
  if not BrowseMode then begin
    AGrid.Floats[colBruto,ARow] := AGrid.Floats[colPrice,ARow] * AGrid.Floats[colQty,ARow];
    AGrid.Floats[colNett,ARow] := AGrid.Floats[colBruto,ARow] - AGrid.Floats[colDisc,ARow];
  end;
  //else begin
    AGrid.Floats[colNett2,ARow] := AGrid.Floats[colQty2,ARow] * AGrid.Floats[colPrice2,ARow];
  //end;
  SetFooter;
end;

procedure TfrmReturService.SetFooter;
begin
  txtSubtotal.FloatValue := asgTerima.ColumnSum(colNett2,1,asgTerima.RowCount-1) + asgRegService.ColumnSum(colNett2,1,asgRegService.RowCount-1) ;
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;
end;

procedure TfrmReturService.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmReturService.LoadCustomer(ANoPol: string);
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

procedure TfrmReturService.btnCustClick(Sender: TObject);
var vTmp : string;
begin
   vTmp := frmLOVNew.Execute(LOV_CUSTOMER);
   if vTmp = '' then exit;
   txtNoPol.Text := TPersons.getCodeFromID(StrToIntDef(vTmp,0));
   LoadCustomer(txtNoPol.Text);
end;

procedure TfrmReturService.txtBayarChange(Sender: TObject);
begin
   txtkembali.FloatValue :=  txtBayar.FloatValue - txtTotal.FloatValue;
end;

procedure TfrmReturService.PrintData;
begin
   Application.CreateForm(TqrpNotaReturService,qrpNotaReturService);
   qrpNotaReturService.Executes(IfThen(BrowseMode,MasterSeq,TShipment.getIdFromNum(Trim(sttNum.Caption))));
   qrpNotaReturService.Free;
//  qrpNotaService.Executes(TShipment.getIdFromNum(Trim(sttNum.Caption)),SHIP_TYPE_RETUR_SERVICE);
end;

procedure TfrmReturService.btnServiceClick(Sender: TObject);

begin
  MasterSeq := frmLOVRekap.ExecuteService;
  LoadData;
  mmNotes.SetFocus;
end;

procedure TfrmReturService.getItem(AGrid: TAdvStringGrid; AItemId,
  ARow: integer; isItem: boolean; AGridChild: TAdvStringGrid);
var i,vRow : integer;
   vPkgArr : TServicePackage_Arr;
begin
  if isItem then begin
    vItem.Reset;
    if vItem.SelectInDB(AItemId) then begin
       with AGrid do begin
         Cells[colCode,ARow] := vItem.ItemCode;
         Cells[colName,ARow] := vItem.ItemName;
         Floats[colQty2,ARow] := 1;
         Ints[colId,ARow]:= vItem.ItemId;
         Cells[colType,ARow] := TItems.getDesc(vItem.ItemType);
         Floats[colPrice2,ARow] := vItem.Price;
         Cells[colPartType,ARow] := vItem.ItemType;
       end;
    end;
  end //end item
  else begin    //jika tipe service
    vService.Reset;
    if vService.SelectInDB(AItemId) then begin
       if vService.ServiceType <>  SERVICE_TYPE_PACKAGE then begin
         with AGrid do begin
           Cells[colCode,ARow] := vService.ServiceCode;
           Cells[colName,ARow] := vService.ServiceName;
           Floats[colQty2,ARow] := 1;
           Ints[colId,ARow]:= vService.ServiceId;
           Cells[colType,ARow] := TItems.getDesc(vService.ServiceType);
           Floats[colPrice2,ARow] := vService.Price;
           Cells[colPartType,ARow] := vService.ServiceType;

         end;
       end //end tipe bukan paket
       else  if (vService.ServiceType = SERVICE_TYPE_PACKAGE) and (AGridChild <> nil) then begin
          vPkgArr := TServicePackage_Arr.Create;
          vPkgArr.FindOnDb(vService.ServiceId);
          for i:= 0 to vPkgArr.Count-1 do begin
            //insert detail service from package
            if vPkgArr[i].Services.ServiceId>0 then begin
              vRow := AGrid.RowCount-1;
              with AGrid do begin
                Cells[colCode,vRow] := vPkgArr[i].Services.ServiceCode;
                Cells[colName,vRow] := vPkgArr[i].Services.ServiceName;
                Floats[colqty2,vRow] := vPkgArr[i].Quantity;
                Floats[colPrice2,vRow] := vPkgArr[i].Price;
                Ints[colId,vRow] := vPkgArr[i].Services.ServiceId;
                Ints[colParent,vRow] := vPkgArr[i].ServiceParent;
                SetAmount(AGrid,vRow);
                AddRow;
              end;
            end // end package service
            else if vPkgArr[i].Items.ItemId > 0 then begin
              //insert detail part from package
              vRow := AGridChild.RowCount-1;
              if (not IsClear(AGridChild,vRow,colID)) then
                  AGridChild.AddRow;
              with AGridChild do begin
                vRow := RowCount-1;
                Cells[colCode,vRow] := vPkgArr[i].Items.ItemCode;
                Cells[colName,vRow] := vPkgArr[i].Items.ItemName;
                Floats[colqty2,vRow] := vPkgArr[i].Quantity;
                Floats[colPrice2,vRow] := vPkgArr[i].Price;
                Ints[colId,vRow] := vPkgArr[i].Items.ItemId;
                Ints[colParent,vRow] := vPkgArr[i].ServiceParent;
                SetAmount(AGridChild,vRow);
                AddRow;
              end;//end with
            end;//end package item
          end;//end for
       end;//end tipe paket
    end;  //end select indb
  end;//end jika service
  SetAmount(AGrid,ARow);
  ArrangeColSize;

end;

procedure TfrmReturService.asgRegServiceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;vFilter,vSearch : string;
begin
   case Key of
     VK_F8 : ShortCutF8(asgRegService,Key,colCode);
     //VK_DELETE : DeleteRow1Click(Self);
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 :begin
      case asgRegService.Col of
       colCode,colName : begin
         vSearch :=LowerCase(chr(getNewKeyDown(Key)));
         vFilter := ' AND s.service_type <> '+FormatSQLString(SERVICE_TYPE_PACKAGE);
         vId := frmLovFlat.Execute(IfThen(asgRegService.Col=colName,'NAME','CODE'),vSearch,'SERVICE',vFilter);
         if vId > 0 then
           getItem(asgRegService,vId,asgRegService.Row,False);
       end;
      end;
     end;
   end;

end;

procedure TfrmReturService.asgTerimaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer; vSearch:string;
begin
   case Key of
     VK_F8 :  ShortCutF8(asgTerima,Key,colCode);
     //VK_DELETE : DeleteRow1Click(Self);
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

procedure TfrmReturService.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    asgRegService.SetFocus;
end;

procedure TfrmReturService.asgRegServiceCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
CanEdit := (ACol in [colQty2,colCode,colName,colPrice2{,colDisc}]) and (not BrowseMode);
end;

procedure TfrmReturService.asgRegServiceCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;
begin
  case Col of
    colPrice2 : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgRegService,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgRegService.Col := Col;
        Value := '';
      end;
    end;
    colQty2 :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      if Valid then begin
          Valid := StrToFloatDef(Value,0)>0;
        vMsg  := 'Nilai tidak boleh sama dengan nol (0)';
       // SetAmount(asgRegService,Row);  08.05.07 -- pindah ke bawah
      end;
      if not Valid then begin
        Alert(vMsg);
        asgRegService.Col := Col;
        Value := '';
      end;
      SetAmount(asgRegService,Row)
    end;
    colDisc :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgRegService.AddRow;
        SetAmount(asgRegService,Row);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgRegService.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;

end;

end.

