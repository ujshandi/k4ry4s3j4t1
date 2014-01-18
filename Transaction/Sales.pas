unit Sales;
{DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit, Menus;

type
  TfrmSales = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    l: TLabel;
    Label1: TLabel;
    Bevel2: TBevel;
    sttDetailInfo: TStaticText;
    Bevel1: TBevel;
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
    pgcDetail: TPageControl;
    tbsRegular: TTabSheet;
    tbsCredit: TTabSheet;
    asgTerima: TAdvStringGrid;
    asgCredit: TAdvStringGrid;
    btnCustNew: TButton;
    PopupMenu1: TPopupMenu;
    Pelanggan1: TMenuItem;
    SubDealer1: TMenuItem;
    chkPost: TCheckBox;
    Label11: TLabel;
    Label8: TLabel;
    popReguler: TPopupMenu;
    DeleteRow1: TMenuItem;
    btnPosting: TButton;
    txtDP: TAdvEdit;
    dtpBayar: TDateTimePicker;
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
    procedure asgCreditCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgCreditCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgCreditGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgCreditGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure pgcDetailChange(Sender: TObject);
    procedure btnCustNewClick(Sender: TObject);
    procedure Pelanggan1Click(Sender: TObject);
    procedure SubDealer1Click(Sender: TObject);
    procedure asgTerimaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgCreditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DeleteRow1Click(Sender: TObject);
    procedure dtpTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkPostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPostingClick(Sender: TObject);
    procedure txtBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNoPolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgTerimaEnter(Sender: TObject);
    procedure txtDPChange(Sender: TObject);
    procedure dtpBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    BrowseMode : boolean;
    MasterSeq : integer;
//    ListMekanik : TStringList;
  //  vItemArr : TItems_Arr;
    MasterSalesType : string;
    vItem : TItems;
    EditMode : Boolean;
    procedure ArrangeColSize;
    procedure CountSubtotal(ARow,ACol : integer;AGrid:TAdvStringGrid);
    procedure getItem(AGrid:TAdvStringGrid;AItemId,ARow:integer);
    procedure InitForm;
    procedure InitGrid;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure LoadCustomer(ANoPol:string;APersonId:integer);
    procedure NewNumber;
    procedure SetAmount(AGrid:TAdvStringGrid;ARow:integer;aCol:integer=0);
    procedure SetFooter;
    procedure setGridSelection(AGrid:TAdvStringGrid);
    procedure PrintData;

  public
    { Public declarations }
    function Execute(ATerimaSeq:integer;aEditMode:Boolean=False):boolean;
  end;

var
  frmSales: TfrmSales;


implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVNew,  LOVRekap,
  PersonAdd, NotaSalesPrint, LOVFlat, PersonCarAdd;

const
  colNo = 0;
  colCode = 1;
  colType = 2;
  colName = 3;
  colQty = 4;
  colPrice = 5;
  colBruto = 6;
  colDiscPct = 7;
  colDisc = 8;
  colNett = 9;
  colID =10;
  colParttype = 11;
  colDetailId = 12;
  colQtyOld = 13;

  TAB_REG = 0;
  TAB_CREDIT = 1;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmSales.ArrangeColSize;
begin
  with asgTerima do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);

  end;
  with asgCredit do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
  end;

  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;

  with asgTerima do begin
    ColWidths[colID]:=0;
    ColWidths[colPartType]:= 0;
    ColWidths[colDetailID]:= 0;
    ColWidths[colQtyOld]:= 0;
    ColWidths[colCode]  := 140;
  end;
  with asgCredit do begin
    ColWidths[colID]:=0;
    ColWidths[colPartType]:= 0;
    ColWidths[colDetailID]:= 0;
    ColWidths[colQtyOld]:= 0;
    ColWidths[colCode]  := 140;
  end;
end;

function TfrmSales.Execute(ATerimaSeq: integer;aEditMode:Boolean): boolean;
begin
//  vItemArr := TItems_Arr.Create;
  VItem := TItems.Create;
  EditMode := aEditMode;
  Result := False;
  BrowseMode := ATerimaSeq>0;
  MasterSeq := ATerimaSeq;
//  vItemArr.FindFlat;
  InitForm;
  tbsCredit.TabVisible  := false;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  VItem.Free
 // vItemArr.Free;
end;

procedure TfrmSales.InitForm;
begin
  tbsRegular.TabVisible := True;
//  tbsCredit.TabVisible  := TRUE;
//   tbsCredit.TabVisible  := false;//True;
 // btnSave.Enabled   := not BrowseMode;
//  Alert(IntToStr( pgcDetail.tab));
  btnPosting.Visible := (not BrowseMode) or EditMode;
  chkPost.Checked   := False;
  chkPost.Enabled   := (not BrowseMode) or EditMode;
  dtpTrans.Enabled  := (not BrowseMode);// or (EditMode);
  dtpBayar.Enabled  := (not BrowseMode) or (EditMode);
  mmNotes.ReadOnly  := (BrowseMode) and (not EditMode);
  txtDisc.ReadOnly  := (BrowseMode)  and (not EditMode);
  txtDP.ReadOnly  := BrowseMode and (not EditMode);
  btnCust.Enabled   := (not BrowseMode) or EditMode;
  btnSave.Caption   := IfThen(BrowseMode and(not EditMode),'&Print','&Save');
  txtSubtotal.Clear;
  txtDP.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  txtBayar.Clear;
  txtkembali.Clear;
  txtNoPol.Clear;
  mmNotes.Clear;

  pgcDetail.ActivePageIndex  := TAB_REG;
  pgcDetailChange(Self);

  lblAddress.Caption  := '';
  lblNamaCust.Caption := '';
  lblTlp.Caption      := '';
  lblTipeMotor.Caption:= '';
  lblTahun.Caption    := '';
  lblRangka.Caption   := '';
  lblNoMesin.Caption  := '';

  sttOperator.Caption := GlobalSystemUser.UserId;

  Self.Caption := IfThen(BrowseMode,'View Sales','New Sales');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  dtpBayar.Format:= 'dddd, dd MMMM yyyy';
  dtpBayar.Date  := ServerNow;
  NewNumber;
  Self.ActiveControl := txtNoPol;
  InitGrid;
end;

procedure TfrmSales.InitGrid;
begin
  ResetGrid(asgTerima,3,15,1,1);
  with asgTerima do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParttype,0] := 'PartType';
    Cells[colDetailId,0] := 'DetailID';
    Cells[colQtyOld,0] := 'QtyOld';
    ColWidths[colCode]  := 140;
  end;

  ResetGrid(asgCredit,3,15,1,1);
  with asgCredit do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParttype,0] := 'PartType';
    Cells[colDetailId,0] := 'DetailID';
    Cells[colQtyOld,0] := 'QtyOld';
    ColWidths[colCode]  := 140;
  end;
  ArrangeColSize;
end;

function TfrmSales.isSaved: boolean;
var vShipment : TShipment;
    i,idx:integer;
    vConversion : real;
    AGrid : TAdvStringGrid;
begin
   vShipment := TShipment.Create;

   vShipment.ShipNum := IfThen(EditMode,Trim(sttNum.Caption),TShipment.getNewNumberService(SHIP_TYPE_SALES,MasterSalesType,dtpTrans.Date));//sttNum.Caption;
   vShipment.ShipType:= SHIP_TYPE_SALES;
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.IsPost   := chkPost.Checked;
   vShipment.DownPayment := txtDP.FloatValue;
   vShipment.ShipServiceType := MasterSalesType;
   vShipment.ExprDate := dtpBayar.Date;
   case MasterSalesType[1] of
     SHIP_SALES_TYPE_CREDIT : begin
       AGrid := asgCredit;
     end;
     else begin
       AGrid := asgTerima;
     end;
   end;
   if EditMode then begin
     vShipment.ShipId := MasterSeq;
     vShipment.UserEdit := GlobalSystemUser.UserId;
     vShipment.DateEdit := ServerNow;
   end;
   for i:= 1 to AGrid.RowCount-2 do
     if not IsClear(AGrid,i,colID) then begin
        vConversion := 1;//TItems.getConversion(AGrid.Ints[colId,i]);
        idx:= vShipment.ItemDetailArr.Add(0,0,AGrid.Floats[colQty,i]*vConversion,AGrid.Floats[colPrice,i],vConversion,
        AGrid.Floats[colNett,i],DB_CR_TYPE_CREDIT,0,AGrid.Floats[colDisc,i],0,0,'',0,False);
        vShipment.ItemDetailArr[idx].ItemBalance.Items.ItemId := AGrid.Ints[colID,i];
     end;
   Result := vShipment.InsertService(EditMode);
   if not Result  then
     Alert(MSG_UNSUCCESS_SAVING)
   else begin
     sttNum.Caption := vShipment.ShipNum;
     if vShipment.IsPost then
       PrintData;
   end;
   vShipment.Free;
end;

function TfrmSales.isValid: boolean;
VAR i:integer;vValue:string;vValid:Boolean;
begin
  Result := False;
  if txtNoPol.Text = '' then begin
    Alert('Data Pelanggan belum diisi');
    txtNoPol.SetFocus;
  end
  else if not TPersons.ExistInDB(txtNoPol.Text) then begin
    Alert('ID Pelanggan belum terdaftar');
    txtNoPol.SetFocus;
  end
  else begin
    case MasterSalesType[1] of
      SHIP_SALES_TYPE_CREDIT : begin
        for i:= 1 to asgCredit.RowCount-2 do begin
          if IsClear(asgCredit,i,colID) then Continue;
          vValue := asgCredit.Cells[colQty,i];
          asgCreditCellValidate(Self,colQty,i,vValue,vValid);
          Result := vValid;
          if not Result then begin
            asgCredit.Col := colQty;
            asgCredit.Row := i;
            Break;
            Exit;
          end;
        end;
      end;
      else begin //TAB REGULER
        for i:= 1 to asgTerima.RowCount-2 do begin
          if IsClear(asgTerima,i,colID) then Continue;
          vValue := asgTerima.Cells[colQty,i];
          asgTerimaCellValidate(Self,colQty,i,vValue,vValid);
          Result := vValid;
          if not Result then begin
            asgTerima.Col := colQty;
            asgTerima.Row := i;
            Break;
            Exit;
          end;
        end;
      end;//END REGULER
    end;//END CASE
    //Result := True;
  end;
end;

procedure TfrmSales.LoadData;
var vShipment : TShipment;
    i,vRow:integer;
    AGrid : TAdvStringGrid;
begin
   vShipment := TShipment.Create;
   InitGrid;

   if not vShipment.SelectInDB(MasterSeq) then begin
     Alert(MSG_NO_DATA_FOUND);
     vShipment.Free;
     exit;
   end;
   btnPosting.Visible     := not vShipment.IsPost;
   txtSubtotal.FloatValue := vShipment.Subtotal;
   txtDP.FloatValue       := vShipment.DownPayment;
   txtDisc.FloatValue     := vShipment.Discount;
   txtTotal.FloatValue    := vShipment.Total;
   txtNoPol.Text          := TPersons.getCodeFromID(vShipment.Persons.PersonId);
   LoadCustomer(txtNoPol.Text,vShipment.Persons.PersonId);
   chkPost.Checked        := vShipment.IsPost;
   sttNum.Caption   := ' '+vShipment.ShipNum;
   dtpTrans.DateTime:= vShipment.ShipDate;
   dtpBayar.Date := vShipment.ExprDate;
   mmNotes.Lines.Text := vShipment.Notes ;
   if vShipment.ShipServiceType = '' then
     vShipment.ShipServiceType := SHIP_SALES_TYPE_REG;
   MasterSalesType := vShipment.ShipServiceType;
   case vShipment.ShipServiceType[1] of
     SHIP_SALES_TYPE_CREDIT : AGrid := asgCredit;
   else
     AGrid := asgTerima
   end;

   tbsRegular.TabVisible := MasterSalesType = SHIP_SALES_TYPE_REG;
   tbsCredit.TabVisible  := MasterSalesType = SHIP_SALES_TYPE_CREDIT;

   if vShipment.IsPost then begin

     vShipment.ItemDetailArr.FindOnDB(vShipment.ShipId);
     for i:= 0 to vShipment.ItemDetailArr.Count-1 do
      with AGrid do begin
        vRow := AGrid.RowCount-2;
        Cells[colCode,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
        Cells[colName,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
        Cells[colType,vRow] := TItems.getDesc(vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType);
        Floats[colQty,vRow] := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colDisc,vRow] := vShipment.ItemDetailArr[i].Discount;
        Floats[colBruto,vRow] := vShipment.ItemDetailArr[i].Amount;
        SetAmount(AGrid,vRow,colDisc);
        Ints[colId,vRow]  := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemId;
        Ints[colDetailId,vRow] := vShipment.ItemDetailArr[i].ItemDetailId;
        AddRow;
     end;
   end
   else begin  //jika belum diposting
     if EditMode then
       dtpBayar.Date := ServerNow;
     vShipment.DummyArr.FindOnDB(vShipment.ShipId);
     for i:= 0 to vShipment.DummyArr.Count-1 do begin
       with AGrid do begin
         if vShipment.DummyArr[i].Items.ItemId > 0 then begin
           vRow := RowCount-2;
           vShipment.DummyArr[i].Items.SelectInDB(vShipment.DummyArr[i].Items.ItemId);
           with vShipment.DummyArr[i] do begin   //masukan data item
             Cells[colCode,vRow] := Items.ItemCode;
             Cells[colName,vRow] := Items.ItemName;
             Floats[colQty,vRow] := Quantity;
             Floats[colQtyOld,vRow] := Quantity;
             Floats[colPrice,vRow]:= Price;
             Floats[colDisc,vRow] := Discount;
             Floats[colBruto,vRow]:= Amount;
             Ints[colId,vRow]     := Items.ItemId;
             Ints[colDetailId,vRow] := DumpId;
           end;
           SetAmount(AGrid,vRow,colDisc);
           AddRow;
          end;//end if
        end;//end with
     end;//end for
   end;

   DeleteRowTerakhir(AGrid,3,1);
   AGrid.FloatingFooter.ColumnCalc[colBruto]:= acSUM;
   AGrid.FloatingFooter.ColumnCalc[colNett ]:= acSUM;
   AGrid.FloatingFooter.ColumnCalc[colDisc ]:= acSUM;
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmSales.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumberService(SHIP_TYPE_SALES,MasterSalesType,dtpTrans.DateTime);
end;

procedure TfrmSales.asgTerimaCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  //keputusan tgl 12.10.06 3.Transaksi Pending tidak bisa edit atau hapus part, tp nambah part atau jasa bisa.
  CanEdit := (ACol in [colQty,colCode,colName,colDisc,colPrice,colDiscPct]) and
    ((not BrowseMode)) and (MasterSalesType = SHIP_SALES_TYPE_REG);
  //CanEdit := (ACol in [colQty,colCode,colName,colDisc,colPrice,colDiscPct]) and
    //((not BrowseMode) or EditMode) and (MasterSalesType = SHIP_SALES_TYPE_REG);
end;

procedure TfrmSales.asgTerimaCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;vId : integer;
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
    
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgTerima,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgTerima.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      if Valid then begin
        Valid := (StrToFloat(Value) <= (TItems.getStokTotal(asgTerima.Ints[colID,Row],True)+
        asgTerima.Floats[colQtyOld,Row]));
        vMsg  := 'Stok '+asgTerima.Cells[colName,row]+' tidak mencukupi';
        if not Valid then
           Valid := Confirmed(vMsg+#13+'Apakah akan tetap melakukan transaksi?');

      end;
      if not Valid then begin
        Alert(vMsg);
        asgTerima.Col := Col;
        Value := '';
      end;
       SetAmount(asgTerima,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
       // asgTerima.AddRow;
        SetAmount(asgTerima,Row,Col);
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

procedure TfrmSales.asgTerimaGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colDiscPct] then
    HAlign := taRightJustify;
end;

procedure TfrmSales.asgTerimaGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty,colPrice,colDisc : AEditor := edPositiveNumeric;
     colDiscPct : AEditor := edFloat;
  end;
end;

procedure TfrmSales.btnSaveClick(Sender: TObject);
begin
  if BrowseMode and (not EditMode) then
     PrintData
  else begin
   if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then
      if (not BrowseMode) and (not EditMode) then begin
        if Confirmed(MSG_ADD_DATA) then
          InitForm
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
   end;
end;

procedure TfrmSales.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmSales.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmSales.btnDeleteClick(Sender: TObject);
begin
 if Confirmed('Data pada baris ke-'+IntToStr(asgTerima.Row)+ 'akan dihapus?') then
    deleterow(asgTerima,asgTerima.Row,colCode);

end;

procedure TfrmSales.SetAmount(AGrid:TAdvStringGrid;ARow: integer;aCol:integer);
begin
  if aCol in [colDisc,colDiscPct] then
    CountSubtotal(ARow,aCol,AGrid)
  else
    CountSubtotal(ARow,IfThen(AGrid.Floats[colDiscPct,ARow]=0,colDisc,colDiscPct),AGrid);

  AGrid.Floats[colBruto,ARow] := AGrid.Floats[colPrice,ARow] * AGrid.Floats[colQty,ARow];
  AGrid.Floats[colNett,ARow] := AGrid.Floats[colBruto,ARow] - (AGrid.Floats[colDisc,ARow]);//*AGrid.Floats[colQty,ARow]
  AGrid.FloatingFooter.ColumnCalc[colBruto]:= acSUM;
  AGrid.FloatingFooter.ColumnCalc[colNett]:= acSUM;
  AGrid.FloatingFooter.ColumnCalc[colDisc]:= acSUM;
  SetFooter;
end;

procedure TfrmSales.SetFooter;
begin
  //26.06 colbruto diganti ku netto agar nilai subtotal adalah
  //nilai yg sudah dikurangai dengan diskon yg ada di dtetail transaksi
  txtSubtotal.FloatValue := asgTerima.ColumnSum(colNett,1,asgTerima.RowCount-2)+
                            asgCredit.ColumnSum(colNett,1,asgCredit.RowCount-2);
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue - txtDP.FloatValue;
end;

procedure TfrmSales.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmSales.LoadCustomer(ANoPol: string;APersonId:integer);
var vCust : TPersons;
begin
  vCust := TPersons.Create;
  if not vCust.SelectInDB(APersonId) then begin
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
  txtNoPol.Text       := vCust.PersonCode;
  lblNamaCust.Caption := vCust.PersonName;
  lblAddress.Caption  := vCust.Address;
  lblTlp.Caption      := vCust.Phone1;
  lblTahun.Caption    := IntToStr(vCust.MtrYear);
  lblRangka.Caption   := vCust.MtrRangka;
  lblNoMesin.Caption  := vCust.MtrMesin;
  lblTipeMotor.Caption:= TMotor.getName(vCust.Motor.MotorId);
  vCust.Free;
end;

procedure TfrmSales.btnCustClick(Sender: TObject);
var vTmp : integer;
begin
   vTmp := frmLovFlat.Execute('CODE',txtNoPol.Text,'CUSTOMER',' AND person_type IN ('+FormatSQLString(PS_TYPE_CUSTOMER)+
          ','+FormatSQLString(PS_TYPE_SUBDEALER)+')');
   //frmLOVRekap.ExecutePerson(FormatSQLString(PS_TYPE_CUSTOMER)+','+FormatSQLString(PS_TYPE_SUBDEALER));
   if vTmp = 0 then exit;
   txtNoPol.Text := TPersons.getCodeFromID(vTmp);
   LoadCustomer(txtNoPol.Text,vTmp);
   dtpBayar.SetFocus;
end;

procedure TfrmSales.txtBayarChange(Sender: TObject);
begin
   txtkembali.FloatValue :=  txtBayar.FloatValue - txtTotal.FloatValue;
end;

procedure TfrmSales.PrintData;
var tmpId : integer;
begin
  tmpId := TShipment.getIdFromNum(Trim(sttNum.Caption));
//  if TShipment.isPosted(tmpId) then
    qrpNotaSales.Executes(tmpId)
  //else
  //  Alert('Transaksi belum bisa dicetak karena statusnya masih pending!');

end;

procedure TfrmSales.asgCreditCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colDisc,colPrice,colDiscPct]) and
    ((not BrowseMode) or EditMode) and (MasterSalesType = SHIP_SALES_TYPE_CREDIT);
end;

procedure TfrmSales.asgCreditCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;vId : integer;
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
         getItem(asgCredit,vId,Row);
         Value := vItem.ItemCode;
         asgCredit.Col := colQty;
      end;
    end;
    //end     // ADD for barcode reader --  03.02.08

    {$ENDIF}
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgCredit,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgCredit.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      if Valid then begin
        Valid := (StrToFloat(Value) <= (TItems.getStokTotal(asgCredit.Ints[colID,Row],True) +
          asgCredit.Floats[colQtyOld,Row]));
        vMsg  := 'Stok '+asgCredit.Cells[colName,row]+' tidak mencukupi';
         if not Valid then
           Valid := Confirmed(vMsg+#13+'Apakah akan tetap melakukan transaksi?');

      end;
      if not Valid then begin
        Alert(vMsg);
        asgCredit.Col := Col;
        Value := '';
      end;
      SetAmount(asgCredit,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
        //asgCredit.AddRow;
        SetAmount(asgCredit,Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgCredit.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmSales.asgCreditGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
   if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colDiscPct] then
    HAlign := taRightJustify;
end;

procedure TfrmSales.asgCreditGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colQty,colPrice,colDisc : AEditor := edPositiveNumeric;
     colDiscPct : AEditor := edFloat;
  end;

end;

procedure TfrmSales.pgcDetailChange(Sender: TObject);
begin
  if BrowseMode or EditMode then exit;
  case pgcDetail.ActivePageIndex of
   TAB_REG : begin
     sttDetailInfo.Caption := 'Detail Sales Regular';
     MasterSalesType := SHIP_SALES_TYPE_REG;
   end;
   TAB_CREDIT : begin
     sttDetailInfo.Caption := 'Detail Sales Credit';
     MasterSalesType := SHIP_SALES_TYPE_CREDIT;
   end;
  end;
  InitGrid;
  NewNumber;
end;

procedure TfrmSales.btnCustNewClick(Sender: TObject);
var tmp : integer;
begin
  tmp := frmPersonCarAdd.ExecuteCustomer(0);
  LoadCustomer(TPersons.getCodeFromID(tmp),tmp);
  mmNotes.SetFocus;
//  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmSales.Pelanggan1Click(Sender: TObject);
var tmp : integer;
begin
  tmp := frmPersonAdd.ExecuteCustomer(0);
  LoadCustomer(TPersons.getCodeFromID(tmp),tmp);
  mmNotes.SetFocus;
end;

procedure TfrmSales.SubDealer1Click(Sender: TObject);
var tmp : integer;
begin
  tmp := frmPersonAdd.ExecuteSubdealer(0);
  LoadCustomer(TPersons.getCodeFromID(tmp),tmp);
  mmNotes.SetFocus;
end;

procedure TfrmSales.asgTerimaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
  vSearch : string;
begin
  if BrowseMode and (not EditMode) then exit;
  case Key of
    VK_F8 : ShortCutF8(asgTerima,Key,colCode);
     VK_DELETE : begin
//keputusan tgl 12.10.06 3.Transaksi Pending tidak bisa edit atau hapus part, tp nambah part atau jasa bisa.

       //if (Shift = [ssCtrl]) then
       if (Shift = [ssCtrl]) and (asgTerima.Ints[colDetailId,asgTerima.Row]=0) then
        DeleteRow1Click(Self);
     end;
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgTerima.Col of
         colCode,colName : begin
             
         ///ShowMessage(pChar(chr(Key)));
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgTerima.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
           if vId > 0 then
             getItem(asgTerima,vId,asgTerima.Row);
         end;
       end;
     end;
     {$ENDIF}
  end; //end case
end;

procedure TfrmSales.getItem(AGrid:TAdvStringGrid;AItemId, ARow: integer);
begin
  vItem.Reset;
  if vItem.SelectInDB(AItemId) then begin
     with AGrid do begin
       Cells[colCode,ARow] := vItem.ItemCode;
       Cells[colName,ARow] := vItem.ItemName;
       Floats[colQty,ARow] := 1;
       Ints[colId,ARow]:= vItem.ItemId;
       Cells[colType,ARow] := TItems.getDesc(vItem.ItemType);
       Floats[colPrice,ARow] := vItem.Price;
       Cells[colPartType,ARow] := vItem.ItemType;
     end;
  end;
  SetAmount(AGrid,ARow);
  ArrangeColSize;
end;

procedure TfrmSales.asgCreditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
  vSearch : string;
begin
  if BrowseMode and (not EditMode) then exit;
  case Key of
     VK_F8 : ShortCutF8(asgCredit,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
     end;
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgCredit.Col of
         colCode,colName : begin
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgCredit.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
           if vId > 0 then
             getItem(asgCredit,vId,asgCredit.Row);
         end;
       end;
     end;
     {$ENDIF}
   end; //end case jkey
end;

procedure TfrmSales.DeleteRow1Click(Sender: TObject);
 var aGrid : TAdvStringGrid;
  i:integer;
begin
  for i:= 0 to Self.ComponentCount-1 do begin
     if Self.Components[i] is TAdvStringGrid then begin
        aGrid := Self.components[i] as TAdvStringGrid;
        if Self.ActiveControl <> aGrid then
          Continue
        else begin
          if AGrid.RowCount=3 then
            AGrid.ClearRows(aGrid.Row,1)
          else
            DeleteRowGrid(aGrid,aGrid.Row,colCode,False);
          SetFooter;
          Break;
        end;
     end;
  end;
end;

procedure TfrmSales.dtpTransKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnCust.SetFocus;
end;

procedure TfrmSales.chkPostKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmSales.btnPostingClick(Sender: TObject);
begin
  chkPost.Checked := True;
  if BrowseMode and (not EditMode) then
    EditMode := True;
  btnSave.Click;
end;

procedure TfrmSales.txtBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmSales.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    pgcDetail.SetFocus;
end;

procedure TfrmSales.txtNoPolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_RETURN,VK_tAB]) then begin
    if TPersons.ExistInDB(txtNoPol.Text) then begin
      LoadCustomer(txtNoPol.Text,0);
      mmNotes.SetFocus;
    end
    else
      btnCust.SetFocus;
  end;
end;

procedure TfrmSales.setGridSelection(AGrid: TAdvStringGrid);
begin
  asgTerima.ShowSelection := (asgTerima.Name = AGrid.Name);
  asgCredit.ShowSelection := (asgCredit.Name = AGrid.Name);
end;

procedure TfrmSales.asgTerimaEnter(Sender: TObject);
begin
  setGridSelection(sender as TAdvStringGrid);
end;

procedure TfrmSales.CountSubtotal(ARow, ACol: integer;
  AGrid: TAdvStringGrid);
var  vPct,vDisc,vPrice,vQty : Double;
begin
//utk perhitungan kolom disc/discpct
    vPrice := AGrid.Floats[colPrice,Arow];
    vPct   := AGrid.Floats[colDiscPct,Arow];
    vQty   := AGrid.Floats[colQty,ARow];
    vDisc  := AGrid.Floats[colDisc,ARow];
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
    AGrid.Floats[colDiscPct,Arow] := vPct;
    AGrid.Floats[colDisc,Arow] := vDisc;

end;

procedure TfrmSales.txtDPChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmSales.dtpBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    mmNotes.SetFocus;
end;

end.
