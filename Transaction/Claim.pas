unit Claim;
 {DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit;

type
  TfrmClaim = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    Bevel2: TBevel;
    sttDetailInfo: TStaticText;
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
    pnl: TPanel;
    txtSubtotal: TAdvEdit;
    txtDisc: TAdvEdit;
    txtTotal: TAdvEdit;
    txtBayar: TAdvEdit;
    txtkembali: TAdvEdit;
    btnReference: TButton;
    txtReference: TAdvEdit;
    btnDeleteClaim: TButton;
    asgClaim: TAdvStringGrid;
    chkRef: TCheckBox;
    Label11: TLabel;
    txtPPG: TAdvEdit;
    procedure asgTerimaCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgTerimaGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure dtpTransChange(Sender: TObject);
    procedure txtDiscChange(Sender: TObject);
    procedure btnCustClick(Sender: TObject);
    procedure txtBayarChange(Sender: TObject);
    procedure btnDeleteClaimClick(Sender: TObject);
    procedure asgClaimCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgClaimCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgClaimGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgClaimGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgCreditCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgCreditGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure pgcDetailChange(Sender: TObject);
    procedure btnReferenceClick(Sender: TObject);
    procedure chkRefClick(Sender: TObject);
    procedure asgClaimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    BrowseMode : boolean;
    MasterSeq : integer;
    ListMekanik : TStringList;
//    vItemArr : TItems_Arr;
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
    procedure SetAmount(AGrid:TAdvStringGrid;ARow:integer);
    procedure SetFooter;
    procedure PrintData;
  public
    { Public declarations }
    function Execute(ATerimaSeq:integer):boolean;
  end;

var
  frmClaim: TfrmClaim;

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
  colID = 9;
  colParttype = 10;


  TAB_REG = 1;
  TAB_CLAIM = 0;
  TAB_CREDIT = 2;

implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVNew, LOVRekap, LOVFlat;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmClaim.ArrangeColSize;
begin
  with asgClaim do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
  end;
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;

  with asgClaim do begin
    ColWidths[colID]:=0;
    ColWidths[colPartType]:=0;
     ColWidths[colCode]  := 140;
  end;
end;

function TfrmClaim.Execute(ATerimaSeq: integer): boolean;
begin
  vItem := TItems.Create;
  ListMekanik := TStringList.Create;
//  vItemArr := TItems_Arr.Create;
  Result := False;
  BrowseMode := ATerimaSeq>0;
  MasterSeq := ATerimaSeq;
  //vItemArr.FindFlatWithService;
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
//  vItemArr.Free;
  ListMekanik.Free;
  vItem.Free;
end;

procedure TfrmClaim.InitForm;
begin
  chkRef.Checked := True;
  chkRefClick(Self);
  btnSave.Enabled   := not BrowseMode;
  btnReference.Enabled := not BrowseMode;
  dtpTrans.Enabled  := not BrowseMode;
  mmNotes.ReadOnly  := BrowseMode;
  txtDisc.ReadOnly  := BrowseMode;
  btnCust.Enabled   := not BrowseMode;
//  cmbMekanik.Enabled := not BrowseMode;
  btnSave.Caption   := IfThen(BrowseMode,'&Print','&Save');
  txtNoPol.Enabled  := False;
  txtPPG.Enabled    := not BrowseMode;

  txtReference.Clear;
  txtSubtotal.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  txtBayar.Clear;
  txtkembali.Clear;
  txtNoPol.Clear;
  mmNotes.Clear;
  txtPPG.Clear;
//  pgcDetail.ActivePageIndex  := TAB_CLAIM;
 // pgcDetailChange(Self);

  lblAddress.Caption  := '';
  lblNamaCust.Caption := '';
  lblTlp.Caption      := '';
  lblTipeMotor.Caption:= '';
  lblTahun.Caption    := '';
  lblRangka.Caption   := '';
  lblNoMesin.Caption  := '';

//  cmbMekanik.ItemIndex := -1;
  sttOperator.Caption := GlobalSystemUser.UserId;

  TPersons_Arr.GetList(ListMekanik,FormatSQLString(PS_TYPE_MECHANIC));
//  NameValueListToValueList(ListMekanik,cmbMekanik.Items);
  Self.Caption := IfThen(BrowseMode,'View Claim','New Claim');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;

  InitGrid;
end;

procedure TfrmClaim.InitGrid;
begin

  ResetGrid(asgClaim,2,12,1,1);
  with asgClaim do begin
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDisc,0] := 'Disc';
    Cells[colNett,0] := 'Total Cair';
    Cells[colID,0] := 'ID';
    Cells[colParttype,0] := 'PartType';
        ColWidths[colCode]  := 140;
  end;

  ArrangeColSize;
end;

function TfrmClaim.isSaved: boolean;
var vShipment : TShipment;
    //vDetail   : TItemDetail_Arr;
    i,idx:integer;
    vConversion : real;
begin
   vShipment := TShipment.Create;

   vShipment.ShipNum := TShipment.getNewNumber(SHIP_TYPE_CLAIM,dtpTrans.Date);//sttNum.Caption;
   vShipment.ShipType:= SHIP_TYPE_CLAIM;
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Persons.PersonId := IfThen(chkRef.Checked, TPersons.getSeqFromCode(txtNoPol.Text),0);
//   vShipment.PersonsMekanik_Id.PersonId := StrToInt(ListMekanik.Names[cmbMekanik.itemIndex]);
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.ShipIdUsed := IfThen(not chkRef.Checked,0,TShipment.getIdFromNum(txtReference.Text));
   vShipment.IsPost := True;
   vShipment.Notes  := vShipment.Notes + '|'+txtPPG.Text; ///ppg numpang di notes dg pembatas |
   //for i:= 1 to asgClaim.RowCount-1 do
    { if not IsClear(asgClaim,i,colID) then begin
        if asgClaim.Cells[colPartType,i] <> SERVICE_TYPE_SINGLE then begin
          vConversion := TItems.getConversion(asgClaim.Ints[colId,i]);
          idx:= vShipment.ItemDetailArr.Add(0,0,asgClaim.Floats[colQty,i]*vConversion,asgClaim.Floats[colPrice,i],vConversion,
           asgClaim.Floats[colBruto,i],DB_CR_TYPE_CREDIT,0,asgClaim.Floats[colDisc,i],0,0,'',0,False);
           vShipment.ItemDetailArr[idx].ItemBalance.Items.ItemId := asgClaim.Ints[colID,i];
        end
        else begin
           vShipment.ServiceDetailArr.Add(0,0,asgClaim.Ints[colId,i],asgClaim.Floats[colQty,i],
                  asgClaim.Floats[colPrice,i],asgClaim.Floats[colNett,i],'',0,asgClaim.Floats[colDisc,i],0,False);
        end;
     end;   }
     for i:= 1 to asgClaim.RowCount-1 do
       if not IsClear(asgClaim,i,colId) then begin
          vConversion := TItems.getConversion(asgClaim.Ints[colId,i]);
          idx:= vShipment.ItemDetailArr.Add(0,0,asgClaim.Floats[colQty,i]*vConversion,asgClaim.Floats[colPrice,i],vConversion,
           asgClaim.Floats[colBruto,i],DB_CR_TYPE_DEBIT,0,asgClaim.Floats[colDisc,i],0,0,'',0,False);
           vShipment.ItemDetailArr[idx].ItemBalance.Items.ItemId := asgClaim.Ints[colId,i];
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

function TfrmClaim.isValid: boolean;
begin
  Result := False;
{  if cmbMekanik.ItemIndex = -1 then begin
    Alert('Mekanik belum dipilih!');
    cmbMekanik.SetFocus;
  end
  else} if (txtNoPol.Text = '') and (chkRef.Checked) then begin
    Alert('Data Pelanggan belum diisi');
    txtNoPol.SetFocus;
  end
  else if (chkRef.Checked) and (not TPersons.ExistInDB(txtNoPol.Text)) then begin
    Alert('ID Pelanggan belum terdaftar');
    txtNoPol.SetFocus;
  end
  else
    Result := True;
end;

procedure TfrmClaim.LoadData;
var vShipment : TShipment;
   // vDetail   : TItemDetail_Arr;
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
   txtReference.Text := vShipment.ShipNum;

   if BrowseMode then begin
     sttNum.Caption   := ' '+vShipment.ShipNum;
     dtpTrans.DateTime:= vShipment.ShipDate;
     chkRef.Checked := vShipment.ShipIdUsed >0 ;
     txtReference.Text := TShipment.getNumFromID(vShipment.ShipIdUsed);
   end;
   if txtNoPol.Text <> '' then
        LoadCustomer(txtNoPol.Text);

   mmNotes.Lines.Text := EkstrakString(vShipment.Notes,'|',1) ;
   txtPPG.Text := EkstrakString(vShipment.Notes,'|',2);
   vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
//   vShipment. vDetail.FindOnDB(vShipment.ShipId);
   for i:= 0 to vShipment.ItemDetailArr.Count-1 do
    with asgClaim do begin
      vRow := asgClaim.RowCount-1;
      Cells[colCode,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
      Cells[colName,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
      Cells[colType,vRow] := TItems.getDesc(vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType);
     // Cells[colType,i+1]  := vDetail[i].ItemBalance.Items.PurchaseUnit;
      Floats[colQty,vRow] := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
      Floats[colPrice,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
      Floats[colDisc,vRow] := vShipment.ItemDetailArr[i].Discount;
      Floats[colBruto,vRow] := vShipment.ItemDetailArr[i].Amount;
      SetAmount(asgClaim,vRow);
      AddRow;
   end;
   vShipment.ServiceDetailArr.FindOnDb(vShipment.ShipId);
   for i:= 0 to vShipment.ServiceDetailArr.Count-1 do
     with asgClaim do begin
        vRow := asgClaim.RowCount-1;
        Cells[colCode,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceCode;
        Cells[colName,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceName;
        Cells[colType,vRow]  := TItems.getDesc(vShipment.ServiceDetailArr[i].Services.ServiceType);
        Floats[colQty,vRow] := vShipment.ServiceDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice,vRow]:= vShipment.ServiceDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colDisc,vRow] := vShipment.ServiceDetailArr[i].Discount;
        Floats[colBruto,vRow] := vShipment.ServiceDetailArr[i].Amount;
        SetAmount(asgClaim,vRow);
        AddRow;
     end;
   DeleteRowTerakhir(asgClaim,2,1);
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmClaim.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumber(SHIP_TYPE_CLAIM,dtpTrans.DateTime);
end;

procedure TfrmClaim.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDisc]) and (not BrowseMode);
end;

procedure TfrmClaim.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett] then
    HAlign := taRightJustify;
end;

procedure TfrmClaim.btnSaveClick(Sender: TObject);
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

procedure TfrmClaim.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmClaim.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmClaim.SetAmount(AGrid:TAdvStringGrid;ARow: integer);
begin
  AGrid.Floats[colBruto,ARow] := AGrid.Floats[colPrice,ARow] * AGrid.Floats[colQty,ARow];
  AGrid.Floats[colNett,ARow] := AGrid.Floats[colBruto,ARow] - AGrid.Floats[colDisc,ARow];
  SetFooter;
end;

procedure TfrmClaim.SetFooter;
begin
  txtSubtotal.FloatValue := asgClaim.ColumnSum(colNett,1,asgClaim.RowCount-1);

  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue;
end;

procedure TfrmClaim.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmClaim.LoadCustomer(ANoPol: string);
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

procedure TfrmClaim.btnCustClick(Sender: TObject);
var vTmp : integer;
begin
   vTmp := frmLOVRekap.ExecutePerson(FormatSQLString(PS_TYPE_CUSTOMER)+','+FormatSQLString(PS_TYPE_SUBDEALER));
   if vTmp = 0 then exit;
   txtNoPol.Text := TPersons.getCodeFromID(vTmp);
   LoadCustomer(txtNoPol.Text);
end;

procedure TfrmClaim.txtBayarChange(Sender: TObject);
begin
   txtkembali.FloatValue :=  txtBayar.FloatValue - txtTotal.FloatValue;
end;

procedure TfrmClaim.PrintData;
begin
//  qrpNotaService.Executes(TShipment.getIdFromNum(Trim(sttNum.Caption)),SHIP_TYPE_SERVICE);
end;

procedure TfrmClaim.btnDeleteClaimClick(Sender: TObject);
begin
    if Confirmed('Data pada baris ke-'+IntToStr(asgClaim.Row)+ 'akan dihapus?') then
    deleterow(asgClaim,asgClaim.Row,colCode,False);
    SetFooter;
    ArrangeColSize;
end;

procedure TfrmClaim.asgClaimCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDisc]) and (not BrowseMode)and (not chkRef.Checked);
end;

procedure TfrmClaim.asgClaimCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;vId:Integer;
begin
 { case Col of
    colCode,colName : begin
      Valid:= asgClaim.Combobox.ItemIndex <> -1;


    end;
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgClaim,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgClaim.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      if Valid then begin
      //  asgTerima.AddRow;
        if (asgClaim.Cells[colPartType,Row] = SERVICE_TYPE_SINGLE) then
          Valid := True
        else
          Valid := (StrToFloat(Value) <= TItems.getStokTotal(asgClaim.Ints[colID,Row]));
        vMsg  := 'Stok tidak mencukupi';
        SetAmount(asgClaim,Row);
      end;
      if not Valid then begin
        Alert(vMsg);
        asgClaim.Col := Col;
        Value := '';
      end;
    end;
    colDisc :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
        asgClaim.AddRow;
        SetAmount(asgClaim,Row);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgClaim.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
  }
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
         getItem(asgClaim,vId,Row);
         Value := vItem.ItemCode;
         asgClaim.Col := colQty;
      end;
    end;
    //end     // ADD for barcode reader --  03.02.08

    {$ENDIF}
    colPrice : begin
      Valid := (StrToFloatDef(Value,0)>0) and (Value<>'');
      if Valid then begin
        SetAmount(asgClaim,Row);
        //asgTerima.AddRow;
      end;

      if not Valid then begin
        Alert('Data masukan salah!');
        asgClaim.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloatDef(Value,0)>0) and (Value<>'');
      if Valid then begin


      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgClaim.Col := Col;
        Value := '';
      end;
      SetAmount(asgClaim,Row);
    end;
    colDisc :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
       // asgTerima.AddRow;
        SetAmount(asgClaim,Row);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgClaim.Col := Col;
        Value := '';
      end;
    end;
  end;
  ArrangeColSize;
end;

procedure TfrmClaim.asgClaimGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett] then
    HAlign := taRightJustify;
end;

procedure TfrmClaim.asgClaimGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);

begin
  case ACol of
    colQty,colPrice,colDisc : AEditor := edPositiveNumeric;
   
  end;

end;

procedure TfrmClaim.asgCreditCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDisc]) and (not BrowseMode);
end;

procedure TfrmClaim.asgCreditGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
   if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett] then
    HAlign := taRightJustify;
end;

procedure TfrmClaim.pgcDetailChange(Sender: TObject);
begin
  {case pgcDetail.ActivePageIndex of
   TAB_REG : begin
     sttDetailInfo.Caption := 'Detail Sales Regular';
   end;
   TAB_CLAIM : begin
     sttDetailInfo.Caption := 'Detail Sales Claim To Indomobil';
   end;
   TAB_CREDIT : begin
     sttDetailInfo.Caption := 'Detail Sales Credit';
   end;
  end;}
end;

procedure TfrmClaim.btnReferenceClick(Sender: TObject);
begin
  MasterSeq := frmLOVRekap.ExecuteSalesService;
  LoadData;
end;

procedure TfrmClaim.chkRefClick(Sender: TObject);
begin
  btnReference.Enabled := chkRef.Checked;
  btnCust.Visible := not chkRef.Checked;
  txtNoPol.Enabled := not chkRef.Checked;
  txtReference.Enabled := chkRef.Checked;
  if not chkRef.Checked then
    txtReference.Clear;
end;

procedure TfrmClaim.asgClaimKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
  vSearch : string;
begin
  if BrowseMode or (chkRef.Checked) then exit;
  case Key of
    VK_F8 : ShortCutF8(asgClaim,Key,colCode);
     VK_DELETE : begin
//keputusan tgl 12.10.06 3.Transaksi Pending tidak bisa edit atau hapus part, tp nambah part atau jasa bisa.

       //if (Shift = [ssCtrl]) then
       if (Shift = [ssCtrl])then
         btnDeleteClaim.Click;
     end;
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgClaim.Col of
         colCode,colName : begin

         ///ShowMessage(pChar(chr(Key)));
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgClaim.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
           if vId > 0 then
             getItem(asgClaim,vId,asgClaim.Row);
         end;
       end;
     end;
     {$ENDIF}
  end;


end;

procedure TfrmClaim.getItem(AGrid: TAdvStringGrid; AItemId, ARow: integer);
begin
    vItem.Reset;
  if vItem.SelectInDB(AItemId) then begin
     with AGrid do begin
       Cells[colCode,ARow] := vItem.ItemCode;
       Cells[colName,ARow] := vItem.ItemName;
       Cells[colType,ARow] :=  TItems.getDesc(vItem.ItemType);
       Floats[colQty,ARow] := 1;
       Ints[colId,ARow]:= vItem.ItemId;
       Floats[colPrice,ARow] := vItem.Price;
     end;
  end;
  SetAmount(AGrid,ARow);
  ArrangeColSize;

end;

procedure TfrmClaim.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = vk_return then
  txtPPG.SetFocus;
end;

end.
