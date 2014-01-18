unit Estimasi;
{DEFINE BARCODE}  //UNTUK BARCODE
{$DEFINE NORMAL}   //TANPA BARCODE
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,AutoBengkel,UMaster,strUtils,
  ExtCtrls, AdvEdit, Menus;

type
  TfrmEstimasi = class(TForm)
    sttNum: TStaticText;
    dtpTrans: TDateTimePicker;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    lblNo: TLabel;
    Label1: TLabel;
    lblDok: TStaticText;
    Bevel2: TBevel;
    Bevel1: TBevel;
    pgcCust: TPageControl;
    tbsCust: TTabSheet;
    tbsMotor: TTabSheet;
    txtNoPol: TAdvEdit;
    btnCust: TButton;
    sttOperator: TStaticText;
    lblAddress: TLabel;
    lblNamaCust: TLabel;
    lblTlp: TLabel;
    lblTipeMotor: TLabel;
    lblTahun: TLabel;
    lblRangka: TLabel;
    lblNoMesin: TLabel;
    txtSubtotal: TAdvEdit;
    txtDisc: TAdvEdit;
    txtTotal: TAdvEdit;
    txtBayar: TAdvEdit;
    txtkembali: TAdvEdit;
    pnlFooter: TPanel;
    pgcDetail: TPageControl;
    tbsReguler: TTabSheet;
    tbsKsg: TTabSheet;
    tbsCompany: TTabSheet;
    popReguler: TPopupMenu;
    DeleteRow1: TMenuItem;
    btnCustNew: TButton;
    chkPost: TCheckBox;
    btnPosting: TButton;
    txtDP: TAdvEdit;
    pnlRegService: TPanel;
    asgRegService: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel2: TPanel;
    asgRegPart: TAdvStringGrid;
    Panel3: TPanel;
    asgKSGService: TAdvStringGrid;
    Splitter2: TSplitter;
    Panel4: TPanel;
    asgKSGPart: TAdvStringGrid;
    Panel5: TPanel;
    asgCompanyService: TAdvStringGrid;
    Splitter3: TSplitter;
    Panel6: TPanel;
    asgCompanyPart: TAdvStringGrid;
    cmbNoPol: TComboBox;
    btnAddKendaraan: TButton;
    lblDetailService: TStaticText;
    lblDetailPart: TStaticText;
    rgbPrint: TRadioGroup;
    procedure asgRegPartCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgRegPartCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgRegPartGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRegPartGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure dtpTransChange(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure txtDiscChange(Sender: TObject);
    procedure btnCustClick(Sender: TObject);
    procedure txtBayarChange(Sender: TObject);
    procedure asgCompanyPartCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgCompanyPartCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgCompanyPartGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure pgcDetailChange(Sender: TObject);
    procedure DeleteRow1Click(Sender: TObject);
    procedure asgRegPartRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure asgCompanyPartRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure asgKSGPartCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgKSGPartCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgKSGPartGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
    procedure asgKSGPartRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure asgRegServiceCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure asgRegServiceCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgRegServiceGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRegServiceGetEditorType(Sender: TObject; ACol,
      ARow: Integer; var AEditor: TEditorType);
    procedure asgRegServiceRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure btnCustNewClick(Sender: TObject);
    procedure asgRegServiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgRegPartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgKSGServiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgCompanyServiceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgKSGPartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgCompanyPartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpTransKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkPostKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPostingClick(Sender: TObject);
    procedure asgKSGServiceCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure asgCompanyServiceCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure asgKSGServiceCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgCompanyServiceCellValidate(Sender: TObject; Col,
      Row: Integer; var Value: String; var Valid: Boolean);
    procedure txtBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNoPolKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgRegServiceSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure asgRegServiceEnter(Sender: TObject);
    procedure asgCompanyServiceExit(Sender: TObject);
    procedure txtDPChange(Sender: TObject);
    procedure dtpBayarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgKSGPartGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgKSGServiceGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgKSGServiceCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure asgKSGPartCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure asgMekanikCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure cmbNoPolSelect(Sender: TObject);
    procedure btnAddKendaraanClick(Sender: TObject);

  private
    { Private declarations }

    BrowseMode,EditMode : boolean;
    MasterSeq : integer;
    ListMekanik,listNoPol : TStringList;
    //vItemArr : TItems_Arr;
    vItem : TItems;
    vService : TServices;
    MasterPurpose,MasterShipService : string;
    //vServiceArr : TServices_Arr;
    procedure ArrangeColSize;
    procedure getItem(AGrid:TAdvStringGrid;AItemId,ARow:integer;isItem:boolean=True;AGridChild:TAdvStringGrid=nil);
    procedure InitForm;

    procedure InitGrid;
    procedure InitGridMekanik;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure LoadCustomer(ANoPol:string);
    procedure LoadCar(ANoPol:string);
    procedure loadMekanik;
    procedure NewNumber;
    procedure SetAmount(AGrid:TAdvStringGrid;ARow:integer;aCol:integer=0);
    procedure SetFooter;
    procedure setGridSelection(AGrid:TAdvStringGrid);
    procedure PrintData;
    procedure DeleteRowGrid(AGrid:TAdvStringGrid;ARow,ACOL : integer);
    procedure CountSubtotal(ARow,ACol : integer;AGrid:TAdvStringGrid);
  public
    { Public declarations }
    function Execute(aPurpose:string;ATerimaSeq:integer;AEditMode:boolean=False):boolean;
  end;

var
  frmEstimasi: TfrmEstimasi;


implementation

uses Subroutines, MainMenu, un_ryu, UConst, UTransaction,
  SQLServerConnections, ItemAdd, LOVNew,  LOVRekap,
  PersonAdd, NotaServiceObjectPrint, LOVFlat, PersonCarAdd, EstimasiPrint;

const
  colNo = 0;
  colKsg = 1;
  colCode = 2;
  colType = 3;
  colName = 4;
  colQty = 5;
  colPrice = 6;
  colBruto = 7;
  colDiscPct = 8;
  colDisc = 9;
  colNett =10;
  colID = 11;
  colParttype = 12;
  colParent = 13;
  colQtyOld = 14;

  TAB_REG = 0;
  TAB_KSG = 1;
  TAB_COMP = 2;

{$R *.dfm}

{ TfrmPenerimaan }

procedure TfrmEstimasi.ArrangeColSize;
begin
  with asgRegPart do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);

  end;
  with asgRegService do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);

  end;

  with asgKSGPart do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
  end;
  with asgKSGService do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);

  end;
  with asgCompanyPart do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
  end;
  with asgCompanyService do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);

  end;
  
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;

  with asgRegPart do begin
    ColWidths[colID]:=0;
    ColWidths[colKsg] :=0;
    ColWidths[colPartType]:=0;
    ColWidths[colParent] := 0;
    ColWidths[colQtyOld] := 0;
    ColWidths[colCode]  := 140;
  end;
  with asgKSGPart do begin
    ColWidths[colID]:=0;
    ColWidths[colPartType]:=0;
    ColWidths[colParent] := 0;
    ColWidths[colQtyOld] := 0;
    ColWidths[colCode]  := 140;
  end;
  with asgCompanyPart do begin
    ColWidths[colID]:=0;
    ColWidths[colKsg] :=0;
    ColWidths[colPartType]:=0;
    ColWidths[colParent] := 0;
    ColWidths[colQtyOld] := 0;
    ColWidths[colCode]  := 140;
  end;

  with asgRegService do begin
    ColWidths[colID]:=0;
    ColWidths[colKsg] :=0;
    ColWidths[colPartType]:=0;
    ColWidths[colParent] := 0;
  end;
  with asgKSGService do begin
    ColWidths[colID]:=0;
    ColWidths[colPartType]:=0;
    ColWidths[colParent] := 0;
  end;
  with asgCompanyService do begin
    ColWidths[colID]:=0;
    ColWidths[colKsg] :=0;
    ColWidths[colPartType]:=0;
    ColWidths[colParent] := 0;
  end;
end;

function TfrmEstimasi.Execute(aPurpose:string;ATerimaSeq: integer;AEditMode:boolean): boolean;
begin
  MasterPurpose := aPurpose;
  ListMekanik := TStringList.Create;
  listNoPol := TStringList.Create;
  BrowseMode := ATerimaSeq>0;
  MasterSeq := ATerimaSeq;
  EditMode := AEditMode;
  vItem := TItems.Create;
  vService :=TServices.Create;
  Result := False;

  setGridSelection(nil);
  pgcDetail.ActivePageIndex := TAB_REG;
  pgcDetailChange(Self);
  InitForm;
  if BrowseMode then LoadData;
  Run(Self);

  if ModalResult= mrOK then
    Result := True;
  vItem.Free;
  vService.Free;
  ListMekanik.Free;
  listNoPol.Free;
end;

procedure TfrmEstimasi.InitForm;
begin
 // btnSave.Enabled   := not BrowseMode;
  lblDok.Caption := 'Dokumen '+IfThen(MasterPurpose=ESTIMASI_TYPE_1,'Estimasi','Order Bengkel');
  lblDetailService.Caption := 'Detail '+IfThen(MasterPurpose=ESTIMASI_TYPE_1,'Estimasi','Order Bengkel')+ ' Service';
  lblDetailPart.Caption := 'Detail '+IfThen(MasterPurpose=ESTIMASI_TYPE_1,'Estimasi','Order Bengkel')+' Part';
  lblNo.Caption := 'No.'+IfThen(MasterPurpose=ESTIMASI_TYPE_1,'Estimasi','Order');
  tbsReguler.Caption := 'Detail '+IfThen(MasterPurpose=ESTIMASI_TYPE_1,'Estimasi','Order Bengkel');
  tbsReguler.TabVisible := True;
  tbsKsg.TabVisible := True;
  tbsCompany.TabVisible := True;
  pnlFooter.Visible := MasterPurpose = ESTIMASI_TYPE_1;
   tbsReguler.TabVisible := MasterShipService = SHIP_SERVICE_TYPE_REG;
   tbsKsg.TabVisible     := false;//MasterShipService = SHIP_SERVICE_TYPE_KSG;
   tbsCompany.TabVisible := false;//MasterShipService = SHIP_SERVICE_TYPE_COMP;

  pnlRegService.Height := IfThen (MasterPurpose = ESTIMASI_TYPE_1,110,0);

  btnPosting.Visible := false;//(not BrowseMode) or EditMode;
  chkPost.Checked := False;
  chkPost.Enabled   := (not BrowseMode) or EditMode;
  dtpTrans.Enabled  := (not BrowseMode);// or EditMode;
  mmNotes.ReadOnly  := BrowseMode and (not EditMode);
  txtDisc.ReadOnly  := BrowseMode and (not EditMode);
  txtDP.ReadOnly  := BrowseMode and (not EditMode);
  btnCust.Enabled   := (not BrowseMode) or EditMode;
  btnCustNew.Enabled := (not BrowseMode) or EditMode;
  btnSave.Caption    := '&Save';//IfThen(BrowseMode and (not EditMode) ,'&Print','&Save');
  pgcCust.ActivePageIndex := 0;
  txtSubtotal.Clear;
  txtDP.Clear;
  txtDisc.Clear;
  txtTotal.Clear;
  txtBayar.Clear;
  txtkembali.Clear;
  txtNoPol.Clear;
  mmNotes.Clear;

  lblAddress.Caption  := '';
  lblNamaCust.Caption := '';
  lblTlp.Caption      := '';
  lblTipeMotor.Caption:= '';
  lblTahun.Caption    := '';
  lblRangka.Caption   := '';
  lblNoMesin.Caption  := '';

  sttOperator.Caption := GlobalSystemUser.UserId;

  TPersons_Arr.GetList(ListMekanik,FormatSQLString(PS_TYPE_MECHANIC));
  if (MasterPurpose = ESTIMASI_TYPE_1) then
    Self.Caption := IfThen(BrowseMode,'View Estimasi','New Estimasi')
  else
    Self.Caption := IfThen(BrowseMode,'View Order','New Order');
  dtpTrans.Format:= 'dddd, dd MMMM yyyy';
  dtpTrans.Date  := ServerNow;
  NewNumber;
  Self.ActiveControl := txtNoPol;
  InitGrid;
  loadMekanik;
end;

procedure TfrmEstimasi.InitGrid;
begin
  
  ResetGrid(asgRegPart,3,16,1,1);
  with asgRegPart do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp.)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParent,0] := 'Parent';
    Cells[colParttype,0] := 'PartType';
    Cells[colQtyOld,0] := 'QtyOld';
        ColWidths[colCode]  := 140;
  end;
  asgKSGPart.Clear;
  ResetGrid(asgKSGPart,3,16,1,1);
  with asgKSGPart do begin
    FloatingFooter.Visible := True;
    AddCheckBox(colKsg,1,False,False);
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colKsg,0] := 'KSG';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp.)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParent,0] := 'Parent';
    Cells[colParttype,0] := 'PartType';
    Cells[colQtyOld,0] := 'QtyOld';
        ColWidths[colCode]  := 140;
  end;
  ResetGrid(asgCompanyPart,3,16,1,1);
  with asgCompanyPart do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Part';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp.)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParent,0] := 'Parent';
    Cells[colParttype,0] := 'PartType';
    Cells[colQtyOld,0] := 'QtyOld';
        ColWidths[colCode]  := 140;
  end;

  ResetGrid(asgRegService,3,15,1,1);

  with asgRegService do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Service';
    Cells[colName,0]:= 'Deskripsi';

    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp.)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParent,0] := 'Parent';
    Cells[colParttype,0] := 'PartType';
  end;
  ResetGrid(asgKSGService,3,15,1,1);
  asgKSGService.Clear;
  with asgKSGService do begin
    FloatingFooter.Visible := True;
    AddCheckBox(colKsg,1,False,False);
    Cells[colNo,0]  := 'No.';
    Cells[colKsg,0] := 'KSG';
    Cells[colCode,0]:= 'Kode Service';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp.)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParent,0] := 'Parent';
    Cells[colParttype,0] := 'PartType';
  end;
  ResetGrid(asgCompanyService,3,15,1,1);
  with asgCompanyService do begin
    FloatingFooter.Visible := True;
    Cells[colNo,0]  := 'No.';
    Cells[colCode,0]:= 'Kode Service';
    Cells[colName,0]:= 'Deskripsi';
    Cells[colType,0]:= 'Jenis';
    Cells[colQty,0] := 'Qty';
    Cells[colPrice,0] := 'Harga';
    Cells[colBruto,0] := 'Subtotal';
    Cells[colDiscPct,0] := 'Disc(%)';
    Cells[colDisc,0] := 'Disc(Rp.)';
    Cells[colNett,0] := 'Netto';
    Cells[colID,0] := 'ID';
    Cells[colParent,0] := 'Parent';
    Cells[colParttype,0] := 'PartType';
  end;
  ArrangeColSize;
end;

function TfrmEstimasi.isSaved: boolean;
var vShipment : TShipment;
    //vDetail   : TItemDetail_Arr;
    i,idx:integer;
    vConversion : real;
    AGridPart,AGridService : TAdvStringGrid;
    vKsg,vCheck:Boolean;
begin
   vShipment := TShipment.Create;

   vShipment.ShipNum := IfThen(EditMode,Trim(sttNum.Caption),TShipment.getNewNumberEstimasi(MasterPurpose,MasterShipService,dtpTrans.Date));//sttNum.Caption;
   vShipment.ShipType:= MasterPurpose;
   vShipment.ShipDate:= dtpTrans.Date;
   vShipment.Persons.PersonId := TPersons.getSeqFromCode(txtNoPol.Text);
   //vShipment.PersonsMekanik_Id.PersonId := StrToInt(ListMekanik.Names[cmbMekanik.itemIndex]);
   vShipment.Notes   := mmNotes.Lines.Text;
   vShipment.UserInsert := GlobalSystemUser.UserId;
   vShipment.Subtotal := txtSubtotal.FloatValue;
   vShipment.Discount := txtDisc.FloatValue;
   vShipment.Total    := txtTotal.FloatValue;
   vShipment.IsPost := chkPost.Checked;

   vShipment.ShipServiceType := MasterShipService;
   vShipment.DownPayment := txtDP.FloatValue;
   if (cmbNoPol.ItemIndex<>-1) then
     vShipment.NoPol := listNoPol.Names[cmbNoPol.itemIndex];
     
   case MasterShipService[1] of
     SHIP_SERVICE_TYPE_KSG : begin
      AGridPart := asgKSGPart;
      AGridService := asgKSGService;
    end;
    SHIP_SERVICE_TYPE_COMP : begin
      AGridPart := asgCompanyPart;
      AGridService := asgCompanyService;
    end;
    else begin
      AGridPart := asgRegPart;
      AGridService := asgRegService;
    end
   end;
   vKsg := False;
   if EditMode then begin
     vShipment.ShipId := MasterSeq;
     vShipment.UserEdit := GlobalSystemUser.UserId;
     vShipment.DateEdit := ServerNow;
   end;

   //mekanik start here    >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
 {   for i:= 1 to asgMekanik.RowCount-1 do begin
        asgMekanik.GetCheckBoxState(0,i,vCheck);
        if vCheck then
           vShipment.Mechanics.Add(-1,asgMekanik.Ints[3,i]);
    end;}
   //end mekanik  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<


   for i:= 1 to AGridPart.RowCount-2 do
     if not IsClear(AGridPart,i,colID) then begin
     //   if asgRegPart.Cells[colPartType,i] <> SERVICE_TYPE_SINGLE then begin
          if MasterShipService = SHIP_SERVICE_TYPE_KSG then
             AGridPart.GetCheckBoxState(colKsg,i,vKsg);
          vConversion := 1;//TItems.getConversion(AGridPart.Ints[colId,i]);
          idx:= vShipment.ItemDetailArr.Add(0,0,AGridPart.Floats[colQty,i]*vConversion,AGridPart.Floats[colPrice,i],vConversion,
           AGridPart.Floats[colNett,i],DB_CR_TYPE_CREDIT,0,AGridPart.Floats[colDisc,i],AGridPart.Ints[colParent,i],0,'',0,
           vKsg);
           vShipment.ItemDetailArr[idx].ItemBalance.Items.ItemId := AGridPart.Ints[colID,i];
     end;

   for i:= 1 to AGridService.RowCount-2 do
     if not IsClear(AGridService,i,colID) then begin
        if MasterShipService = SHIP_SERVICE_TYPE_KSG then
             AGridService.GetCheckBoxState(colKsg,i,vKsg);
        vShipment.ServiceDetailArr.Add(0,0,AGridService.Ints[colId,i],AGridService.Floats[colQty,i],
               AGridService.Floats[colPrice,i],AGridService.Floats[colNett,i],'',0,
               AGridService.Floats[colDisc,i],AGridService.Ints[colParent,i],vKsg);
     end;
   if (vShipment.ServiceDetailArr.Count = 0) and (vShipment.ItemDetailArr.Count=0) then begin
     Alert('Detail Transaksi service atau part belum diisi sama sekali!'+#13+'Transaksi tidak bisa disimpan!');
     mmNotes.SetFocus;
     Result := False;
   end
   else begin
     Result := vShipment.InsertEstimasi(EditMode);
     if not Result  then
       Alert(MSG_UNSUCCESS_SAVING)
     else begin
       sttNum.Caption := vShipment.ShipNum;
      // if chkPost.Checked then
        if (MasterPurpose = ESTIMASI_TYPE_1) then
         PrintData;
     end;
   end;
   vShipment.Free;
end;

function TfrmEstimasi.isValid: boolean;
var i:integer; vValue:string;vValid:Boolean;

 { function isCheckMekanik():boolean;
  var x :integer;vState:boolean;
  begin
     Result := false;
     for x:= 1 to asgMekanik.RowCount-1 do begin
        asgMekanik.GetCheckBoxState(0,x,vState);
        if ( vState) then begin
           Result := vState;
           Exit;
        end;
     end;
  end;}
begin
  Result := False;
  {if cmbMekanik.ItemIndex = -1 then begin
    Alert('Mekanik belum dipilih!');
    cmbMekanik.SetFocus;
  end
  else
  if (not isCheckMekanik()) then begin
    Alert('Mekanik belum dipilih!');
    pgcCust.ActivePageIndex := 2;
    asgMekanik.SetFocus;
  end
  else}
  if (MasterPurpose = ESTIMASI_TYPE_1) then begin
    if txtNoPol.Text = '' then begin
      Alert('Data Pelanggan belum diisi');
      txtNoPol.SetFocus;
    end
    else if not TPersons.ExistInDB(txtNoPol.Text) then begin
      Alert('ID Pelanggan belum terdaftar');
      txtNoPol.SetFocus;
    end
    else begin
      Result := True;
      case MasterShipService[1] of
        SHIP_SERVICE_TYPE_KSG : begin
          for i:= 1 to asgKSGPart.RowCount-2 do begin
            if IsClear(asgKSGPart,i,colID) then Continue;
            vValue := asgKSGPart.Cells[colQty,i];
            asgKSGPartCellValidate(Self,colQty,i,vValue,vValid);
            Result := vValid;
            if not Result then begin
              asgKSGPart.Col := colQty;
              asgKSGPart.Row := i;
              Break;
              Exit;
            end;
          end;
        end;
        SHIP_SERVICE_TYPE_COMP : begin
          for i:= 1 to asgCompanyPart.RowCount-2 do begin
            if IsClear(asgCompanyPart,i,colID) then Continue;
            vValue := asgCompanyPart.Cells[colQty,i];
            asgCompanyPartCellValidate(Self,colQty,i,vValue,vValid);
            Result := vValid;
            if not Result then begin
              asgCompanyPart.Col := colQty;
              asgCompanyPart.Row := i;
              Break;
              Exit;
            end;
          end;
        end;
        else begin //TAB REGULER
           for i:= 1 to asgRegPart.RowCount-2 do begin
            if IsClear(asgRegPart,i,colID) then Continue;
            vValue := asgRegPart.Cells[colQty,i];
            asgRegPartCellValidate(Self,colQty,i,vValue,vValid);
            Result := vValid;
            if not Result then begin
              asgRegPart.Col := colQty;
              asgRegPart.Row := i;
              Break;
              Exit;
            end;
          end;
        end;//END REGULER
      end;//END CASE
      //Result := True;
    end;
  end // end tipe estimasi
  else begin// start tipe order bengkel
    Result := true;
  end;
end;

procedure TfrmEstimasi.LoadData;
var vShipment : TShipment;
   // vDetail   : TItemDetail_Arr;
    i,vRow:integer;
    AGrid,AGridService : TAdvStringGrid;
    vState : Boolean;
begin
   vShipment := TShipment.Create;
   InitGrid;

   if not vShipment.SelectInDbEstimasi(MasterSeq) then begin
     Alert(MSG_NO_DATA_FOUND);
     vShipment.Free;
     exit;
   end;

   if vShipment.ShipServiceType = '' then
     vShipment.ShipServiceType := SHIP_SERVICE_TYPE_REG;

   MasterShipService := vShipment.ShipServiceType;

   case vShipment.ShipServiceType[1] of
    SHIP_SERVICE_TYPE_KSG : begin
      AGrid := asgKSGPart;
      AGridService := asgKSGService;
      pgcDetail.ActivePageIndex := TAB_KSG;

    end;
    SHIP_SERVICE_TYPE_COMP : begin
      AGrid := asgCompanyPart;
      AGridService := asgCompanyService;
      pgcDetail.ActivePageIndex := TAB_COMP;
    end;
    else begin
      AGrid := asgRegPart;
      AGridService := asgRegService;
      pgcDetail.ActivePageIndex := TAB_REG;
    end
   end;
   tbsReguler.TabVisible := MasterShipService = SHIP_SERVICE_TYPE_REG;
   tbsKsg.TabVisible     := MasterShipService = SHIP_SERVICE_TYPE_KSG;
   tbsCompany.TabVisible := MasterShipService = SHIP_SERVICE_TYPE_COMP;


   btnPosting.Visible     := false;//not vShipment.IsPost;
   txtSubtotal.FloatValue := vShipment.Subtotal;

   txtDP.FloatValue       := vShipment.DownPayment;
   txtDisc.FloatValue     := vShipment.Discount;
   txtTotal.FloatValue    := vShipment.Total;
   txtNoPol.Text          := TPersons.getCodeFromID(vShipment.Persons.PersonId);
   LoadCustomer(txtNoPol.Text);
   cmbNoPol.ItemIndex := ListMekanik.IndexOfName(vShipment.NoPol);
   LoadCar(vShipment.NoPol);
   sttNum.Caption   := ' '+vShipment.ShipNum;
   sttOperator.caption := vShipment.UserInsert;
   dtpTrans.Date := vShipment.ShipDate;
   mmNotes.Lines.Text := vShipment.Notes ;
  // if vShipment.IsPost then begin

     vShipment.ItemDetailArr.FindOnDBEstimasi(vShipment.ShipId);
     for i:= 0 to vShipment.ItemDetailArr.Count-1 do
      with AGrid do begin
        vRow := AGrid.RowCount-2;
        if MasterShipService = SHIP_SERVICE_TYPE_KSG then begin
           AddCheckBox(colKsg,vRow,False,False);
           SetCheckBoxState(colKsg,vRow,vShipment.ItemDetailArr[i].IsKsg);
         end;
        Cells[colCode,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemCode;
        Cells[colName,vRow] := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemName;
        Cells[colType,vRow] := TItems.getDesc(vShipment.ItemDetailArr[i].ItemBalance.Items.ItemType);
        Floats[colQty,vRow] := vShipment.ItemDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colPrice,vRow]:= vShipment.ItemDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
        Floats[colDisc,vRow] := vShipment.ItemDetailArr[i].Discount;
        Floats[colBruto,vRow] := vShipment.ItemDetailArr[i].Amount;
        Ints[colId,vRow]  := vShipment.ItemDetailArr[i].ItemBalance.Items.ItemId;
        Ints[colParent,vRow] := vShipment.ItemDetailArr[i].ServiceParent;
        SetAmount(AGrid,vRow,colDisc);
        AddRow;
     end;
     vShipment.ServiceDetailArr.FindOnDbEstimasi(vShipment.ShipId);
     for i:= 0 to vShipment.ServiceDetailArr.Count-1 do
       with AGridService do begin
          vRow := AGridService.RowCount-2;
          if MasterShipService = SHIP_SERVICE_TYPE_KSG then begin
             AddCheckBox(colKsg,vRow,False,False);
             SetCheckBoxState(colKsg,vRow,vShipment.ServiceDetailArr[i].IsKsg);
          end;
          Cells[colCode,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceCode;
          Cells[colName,vRow] := vShipment.ServiceDetailArr[i].Services.ServiceName;
          Cells[colType,vRow]  := TItems.getDesc(vShipment.ServiceDetailArr[i].Services.ServiceType);
          Floats[colQty,vRow] := vShipment.ServiceDetailArr[i].Quantity;// / IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colPrice,vRow]:= vShipment.ServiceDetailArr[i].Price;// * IfThen(vDetail[i].Conversion=0,1,vDetail[i].Conversion);
          Floats[colDisc,vRow] := vShipment.ServiceDetailArr[i].Discount;
          Floats[colBruto,vRow] := vShipment.ServiceDetailArr[i].Amount;
          Ints[colId,vRow]   := vShipment.ServiceDetailArr[i].Services.ServiceId;
          Ints[colParent,vRow] := vShipment.ServiceDetailArr[i].ServiceParent;
          SetAmount(AGridService,vRow,colDisc);
          AddRow;
       end;

//   end;
{   else begin  //load duuumy;
     vShipment.DummyArr.FindOnDB(vShipment.ShipId);
     for i:= 0 to vShipment.DummyArr.Count-1 do begin
       with AGrid do begin
         if vShipment.DummyArr[i].Items.ItemId > 0 then begin
           vRow := RowCount-2;
           vShipment.DummyArr[i].Items.SelectInDB(vShipment.DummyArr[i].Items.ItemId);
           with vShipment.DummyArr[i] do begin   //masukan data item
             if MasterShipService = SHIP_SERVICE_TYPE_KSG then begin
               AddCheckBox(colKsg,vRow,False,False);
               SetCheckBoxState(colKsg,vRow,IsKsg);
             end;
             Cells[colCode,vRow] := Items.ItemCode;
             Cells[colName,vRow] := Items.ItemName;
             Cells[colType,vRow] := TItems.getDesc(Items.ItemType);
             Floats[colQty,vRow] := Quantity;
             Floats[colQtyOld,vRow] := Quantity;
             Floats[colPrice,vRow]:= Price;
             Floats[colDisc,vRow] := Discount;
             Floats[colBruto,vRow]:= Amount;
             Ints[colId,vRow]     := Items.ItemId;
             Ints[colParent,vRow] := ServiceParent;
           end;
           SetAmount(AGrid,vRow,colDisc);
           AddRow;
          end;//end if
        end;//end with

       with AGridService do begin
         if vShipment.DummyArr[i].Services.ServiceId > 0 then begin
           vRow := RowCount-2;
           vShipment.DummyArr[i].Services.SelectInDB(vShipment.DummyArr[i].Services.ServiceId);
           with vShipment.DummyArr[i] do begin  //masukkan data sevice
             if MasterShipService = SHIP_SERVICE_TYPE_KSG then begin
               AddCheckBox(colKsg,vRow,False,False);
               SetCheckBoxState(colKsg,vRow,IsKsg);
             end;
             Cells[colCode,vRow] := Services.ServiceCode;
             Cells[colName,vRow] := Services.ServiceName;
             Cells[colType,vRow] := TItems.getDesc(Services.ServiceType);
             Floats[colQty,vRow] := Quantity;
             Floats[colPrice,vRow]:= Price;
             Floats[colDisc,vRow] := Discount;
             Floats[colBruto,vRow]:= Amount;
             Ints[colId,vRow]     := Services.ServiceId;
             Ints[colParent,vRow] := ServiceParent;
           end;
           SetAmount(AGridService,vRow,colDisc);
           AddRow;
         end;//end if
       end; //end with
     end;//end for
   end; //end else   dummy}
   DeleteRowTerakhir(AGrid,3,1);
   DeleteRowTerakhir(AGridService,3,1);
   ////
   if (AGrid.Name = 'asgKSGService') or (AGrid.Name = 'asgKSGPart') then begin
    AGrid.Floats[colNett,AGrid.RowCount-1] := 0;
    AGrid.Floats[colBruto,AGrid.RowCount-1] := 0;
    AGrid.Floats[colDisc,AGrid.RowCount-1] := 0;
    for i:= 1 to AGrid.RowCount-2 do begin
      AGrid.GetCheckBoxState(colKsg,i,vState);
      if vState then
        Continue;
      AGrid.Floats[colNett,AGrid.RowCount-1]   := AGrid.Floats[colNett,AGrid.RowCount-1]+AGrid.Floats[colNett,i];
      AGrid.Floats[colBruto,AGrid.RowCount-1]  := AGrid.Floats[colBruto,AGrid.RowCount-1]+AGrid.Floats[colBruto,i];
      AGrid.Floats[colDisc,AGrid.RowCount-1]   := AGrid.Floats[colDisc,AGrid.RowCount-1]+AGrid.Floats[colDisc,i];
    end;
  end
  else begin
    AGrid.FloatingFooter.ColumnCalc[colNett] := acSUM;
    AGrid.FloatingFooter.ColumnCalc[colBruto] := acSUM;
    AGrid.FloatingFooter.ColumnCalc[colDisc] := acSUM;
  end;

  if (AGridService.Name = 'asgKSGService') or (AGridService.Name = 'asgKSGPart') then begin
    AGridService.Floats[colNett,AGridService.RowCount-1] := 0;
    AGridService.Floats[colBruto,AGridService.RowCount-1] := 0;
    AGridService.Floats[colDisc,AGridService.RowCount-1] := 0;
    for i:= 1 to AGridService.RowCount-2 do begin
      AGridService.GetCheckBoxState(colKsg,i,vState);
      if vState then
        Continue;
      AGridService.Floats[colNett,AGridService.RowCount-1]   := AGridService.Floats[colNett,AGridService.RowCount-1]+AGridService.Floats[colNett,i];
      AGridService.Floats[colBruto,AGridService.RowCount-1]  := AGridService.Floats[colBruto,AGridService.RowCount-1]+AGridService.Floats[colBruto,i];
      AGridService.Floats[colDisc,AGridService.RowCount-1]   := AGridService.Floats[colDisc,AGridService.RowCount-1]+AGridService.Floats[colDisc,i];
    end;
  end
  else begin
    AGridService.FloatingFooter.ColumnCalc[colNett] := acSUM;
    AGridService.FloatingFooter.ColumnCalc[colBruto] := acSUM;
    AGridService.FloatingFooter.ColumnCalc[colDisc] := acSUM;
  end;
   ////
   SetFooter;
   ArrangeColSize;
   vShipment.Free;
end;

procedure TfrmEstimasi.NewNumber;
begin
  if not BrowseMode then
    sttNum.Caption := ' '+TShipment.getNewNumberEstimasi(MasterPurpose,MasterShipService,dtpTrans.DateTime);
end;

procedure TfrmEstimasi.asgRegPartCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colDisc,colPrice,colDiscPct]) and
    ((not BrowseMode) or EditMode)and (MasterShipService=SHIP_SERVICE_TYPE_REG);
  {if CanEdit and (ACol = colPrice) then
    if asgRegPart.Floats[colPrice,ARow] >0 then
      CanEdit := False;}
end;

procedure TfrmEstimasi.asgRegPartCellValidate(Sender: TObject; Col,
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
         vId := frmLovFlat.Execute(IfThen(Col=colName,'NAME','CODE'),Value,'ITEM','',true);
      Valid := vId >0;
      if Valid then begin
         getItem(asgRegPart,vId,Row);
         Value := vItem.ItemCode;
         asgRegPart.Col := colQty;
      end;
    end;
    //end     // ADD for barcode reader --  03.02.08

    {$ENDIF}
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgRegPart,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgRegPart.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
     { if Valid then begin
        Valid := (StrToFloat(Value) <= (TItems.getStokTotal(asgRegPart.Ints[colID,Row],True)+
         asgRegPart.Floats[colQtyOld,Row]));
        vMsg  := 'Stok '+asgRegPart.Cells[colName,row]+' tidak mencukupi';
        if not Valid then
           Valid := Confirmed(vMsg+#13+'Apakah tetap akan melakukan transaksi?');
        //SetAmount(asgRegPart,Row);
      end;}
      if not Valid then begin
        Alert(vMsg);
        asgRegPart.Col := Col;
        Value := '';
      end;
      SetAmount(asgRegPart,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
        //asgRegPart.AddRow;
        SetAmount(asgRegPart,Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgRegPart.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmEstimasi.asgRegPartGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if (ARow = 0) then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colDiscPct] then
    HAlign := taRightJustify;
end;

procedure TfrmEstimasi.asgRegPartGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
  case ACol of
    colPrice,colDisc : AEditor := edPositiveNumeric;
     colQty,colDiscPct : AEditor := edFloat;
     colKsg : AEditor := edCheckBox;
  end;
end;

procedure TfrmEstimasi.btnSaveClick(Sender: TObject);
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

procedure TfrmEstimasi.btnBatalClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TfrmEstimasi.dtpTransChange(Sender: TObject);
begin
  NewNumber;
  InitGrid;
end;

procedure TfrmEstimasi.btnNewClick(Sender: TObject);
var vEditor : TEditorType;
begin
   vEditor := edComboList;
   frmItemAdd.NewExecute;
   asgRegPartGetEditorType(Self,colCode,asgRegPart.Row,vEditor);
   asgRegPartGetEditorType(Self,colName,asgRegPart.Row,vEditor);
end;

procedure TfrmEstimasi.SetAmount(AGrid:TAdvStringGrid;ARow: integer;aCol:integer);
var i:integer;
    vState:boolean;
begin
  if aCol in [colDisc,colDiscPct] then
    CountSubtotal(ARow,aCol,AGrid)
  else
    CountSubtotal(ARow,IfThen(AGrid.Floats[colDiscPct,ARow]=0,colDisc,colDiscPct),AGrid);

  AGrid.Floats[colBruto,ARow] := AGrid.Floats[colPrice,ARow] * AGrid.Floats[colQty,ARow];
  AGrid.Floats[colNett,ARow] := AGrid.Floats[colBruto,ARow] - (AGrid.Floats[colDisc,ARow]);//*AGrid.Floats[colQty,ARow]
  if (AGrid.Name = 'asgKSGService') or (AGrid.Name = 'asgKSGPart') then begin
    AGrid.Floats[colNett,AGrid.RowCount-1] := 0;
    AGrid.Floats[colBruto,AGrid.RowCount-1] := 0;
    AGrid.Floats[colDisc,AGrid.RowCount-1] := 0;
    for i:= 1 to AGrid.RowCount-2 do begin
      AGrid.GetCheckBoxState(colKsg,i,vState);
      if vState then
        Continue;
      AGrid.Floats[colNett,AGrid.RowCount-1]   := AGrid.Floats[colNett,AGrid.RowCount-1]+AGrid.Floats[colNett,i];
      AGrid.Floats[colBruto,AGrid.RowCount-1]  := AGrid.Floats[colBruto,AGrid.RowCount-1]+AGrid.Floats[colBruto,i];
      AGrid.Floats[colDisc,AGrid.RowCount-1]   := AGrid.Floats[colDisc,AGrid.RowCount-1]+AGrid.Floats[colDisc,i];
    end;
  end
  else begin
    AGrid.FloatingFooter.ColumnCalc[colNett] := acSUM;
    AGrid.FloatingFooter.ColumnCalc[colBruto] := acSUM;
    AGrid.FloatingFooter.ColumnCalc[colDisc] := acSUM;
  end;
//  txtDisc.FloatValue := AGrid.ColumnSum(colDisc,1,AGrid.RowCount-1);
  SetFooter;
end;

procedure TfrmEstimasi.SetFooter;
begin
  //26.06 colbruto diganti ku netto agar nilai subtotal adalah
  //nilai yg sudah dikurangai dengan diskon yg ada di dtetail transaksi
  txtSubtotal.FloatValue := asgRegPart.ColumnSum(colNett,1,asgRegPart.RowCount-2)+
                            asgKSGPart.ColumnSum(colNett,1,asgKSGPart.RowCount-2)+
                            asgCompanyPart.ColumnSum(colNett,1,asgCompanyPart.RowCount-2)+
                            asgRegService.ColumnSum(colNett,1,asgRegService.RowCount-2)+
                            asgKSGService.ColumnSum(colNett,1,asgKSGService.RowCount-2)+
                            asgCompanyService.ColumnSum(colNett,1,asgCompanyService.RowCount-2);
 //nilai diskon bukan berdasarkan total dari diskon per item
 // tapi ada juga nilai diskon per faktur
 { txtDisc.FloatValue     := asgRegPart.ColumnSum(colDisc,1,asgRegPart.RowCount-1)+
                            asgKSGPart.ColumnSum(colDisc,1,asgKSGPart.RowCount-1)+
                            asgCompanyPart.ColumnSum(colDisc,1,asgCompanyPart.RowCount-1)+
                            asgRegService.ColumnSum(colDisc,1,asgRegService.RowCount-1)+
                            asgKSGService.ColumnSum(colDisc,1,asgKSGService.RowCount-1)+
                            asgCompanyService.ColumnSum(colDisc,1,asgCompanyService.RowCount-1);
  }
  txtTotal.FloatValue    := txtSubtotal.FloatValue - txtDisc.FloatValue - txtDP.FloatValue;
end;

procedure TfrmEstimasi.txtDiscChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmEstimasi.LoadCustomer(ANoPol: string);
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
    cmbNoPol.Items.Clear;
    listNoPol.Clear;
    txtNoPol.Clear;
    Alert(MSG_NO_DATA_FOUND);
    vCust.Free;
    exit;
  end;
  TPersonsCar_Arr.GetList(listNoPol,vCust.PersonId);
  NameValueListToValueList(listNoPol,cmbNoPol.Items);
  txtNoPol.Text       := vCust.PersonCode;
  lblNamaCust.Caption := vCust.PersonName;
  lblAddress.Caption  := vCust.Address;
  lblTlp.Caption      := vCust.Phone1;
  //lblTahun.Caption    := IntToStr(vCust.MtrYear);
  //lblRangka.Caption   := vCust.MtrRangka;
 //lblNoMesin.Caption  := vCust.MtrMesin;
  //lblTipeMotor.Caption:= TMotor.getName(vCust.Motor.MotorId);
  vCust.Free;
end;

procedure TfrmEstimasi.btnCustClick(Sender: TObject);
var vTmp : integer;
begin
   vTmp := frmLovFlat.Execute('CODE',txtNoPol.Text,'CUSTOMER',' AND person_type ='+FormatSQLString(PS_TYPE_CUSTOMER));
   // frmLOVRekap.ExecutePerson(FormatSQLString(PS_TYPE_CUSTOMER));
   if vTmp = 0 then exit;
   txtNoPol.Text := TPersons.getCodeFromID(vTmp);
   LoadCustomer(txtNoPol.Text);
   
   //cmbMekanik.SetFocus;
end;

procedure TfrmEstimasi.txtBayarChange(Sender: TObject);
begin
   txtkembali.FloatValue :=  txtBayar.FloatValue - txtTotal.FloatValue;
end;

procedure TfrmEstimasi.PrintData;
var tmpId : integer;
begin
  tmpId := TShipment.getIdEstimasiFromNum(Trim(sttNum.Caption));
 // if TShipment.isPosted(tmpId) then
   Try
    Application.CreateForm(TqrpEstimasi,qrpEstimasi);
    qrpEstimasi.Executes(tmpId,true);
    qrpEstimasi.Destroy;
   except
   end;
 // else
 //   Alert('Transaksi belum bisa dicetak karena statusnya masih pending!');
end;


procedure TfrmEstimasi.asgCompanyPartCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colDisc,colPrice,colDiscPct])
            and ((not BrowseMode) or EditMode) and (MasterShipService=SHIP_SERVICE_TYPE_COMP);

  {if CanEdit and (ACol = colPrice) then
    if asgCompanyPart.Floats[colPrice,ARow] >0 then
      CanEdit := False;}
end;

procedure TfrmEstimasi.asgCompanyPartCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
   var vMsg:string;vId:integer;
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
         getItem(asgCompanyPart,vId,Row);
         Value := vItem.ItemCode;
         asgCompanyPart.Col := colQty;
      end;
    end;
    //end     // ADD for barcode reader --  03.02.08

    {$ENDIF}
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgCompanyPart,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgCompanyPart.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      {if Valid then begin
        Valid := (StrToFloat(Value) <= (TItems.getStokTotal(asgCompanyPart.Ints[colID,Row],True)+
        asgCompanyPart.Floats[colQtyOld,Row]));
        vMsg  := 'Stok '+asgCompanyPart.Cells[colName,row]+' tidak mencukupi';
        if not Valid then
           Valid := Confirmed(vMsg+#13+'Apakah akan tetap melakukan transaksi?');
       // SetAmount(asgCompanyPart,Row);
      end;}
      if not Valid then begin
        Alert(vMsg);
        asgCompanyPart.Col := Col;
        Value := '';
      end;
      SetAmount(asgCompanyPart,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
       // asgCompanyPart.AddRow;
        SetAmount(asgCompanyPart,Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgCompanyPart.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmEstimasi.asgCompanyPartGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
    case ACol of
    colQty,colPrice,colDisc : AEditor := edPositiveNumeric;
     colDiscPct : AEditor := edFloat;
 end;
end;

procedure TfrmEstimasi.pgcDetailChange(Sender: TObject);
begin
  if BrowseMode or EditMode then exit;
  case pgcDetail.ActivePageIndex of
    TAB_REG : MasterShipService := SHIP_SERVICE_TYPE_REG; //sttDetailInfo.Caption := 'Detail Service Reguler';
    TAB_KSG : MasterShipService := SHIP_SERVICE_TYPE_KSG; //sttDetailInfo.Caption := 'Detail Service KSG';
    TAB_COMP : MasterShipService := SHIP_SERVICE_TYPE_COMP; //sttDetailInfo.Caption := 'Detail Service Company';
  end;
  InitGrid;
  NewNumber;
end;

procedure TfrmEstimasi.DeleteRow1Click(Sender: TObject);
var aGrid : TAdvStringGrid;
  i:integer;
begin
  for i:= 0 to Self.ComponentCount-1 do begin
     if Self.Components[i] is TAdvStringGrid then begin
        aGrid := Self.components[i] as TAdvStringGrid;
        if Self.ActiveControl <> aGrid then
          Continue
        else begin
          DeleteRowGrid(aGrid,aGrid.Row,colCode);
          Break;
        end;
     end;
  end;
end;

procedure TfrmEstimasi.asgRegPartRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
 // if ARow = 0 then exit;
  //popReguler.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmEstimasi.asgCompanyPartRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
//  if ARow = 0 then exit;
  //popReguler.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmEstimasi.asgKSGPartCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colDisc,colPrice,colDiscPct,colKsg]) and
    ((not BrowseMode) or EditMode) and (MasterShipService = SHIP_SERVICE_TYPE_KSG) ;

  {if CanEdit and (ACol = colPrice) then
    if asgKSGPart.Floats[colPrice,ARow] >0 then
      CanEdit := False;}
end;

procedure TfrmEstimasi.asgKSGPartCellValidate(Sender: TObject; Col,
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
         vId := frmLovFlat.Execute(IfThen(Col=colName,'NAME','CODE'),Value,'ITEM','',true);
      Valid := vId >0;
      if Valid then begin
         getItem(asgKSGPart,vId,Row);
         Value := vItem.ItemCode;
         asgKSGPart.Col := colQty;
      end;
    end;
    //end     // ADD for barcode reader --  03.02.08

    {$ENDIF}
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgKSGPart,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgKSGPart.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      {if Valid then begin
        Valid := (StrToFloat(Value) <= (TItems.getStokTotal(asgKSGPart.Ints[colID,Row],True)+
        asgKSGPart.Floats[colQtyOld,Row]));
        vMsg  := 'Stok '+asgKSGPart.Cells[colName,row]+' tidak mencukupi';
        if not Valid then
           Valid := Confirmed(vMsg+#13+'Apakah akan tetap melakukan transaksi?');
        //SetAmount(asgKSGPart,Row);
      end;}
      if not Valid then begin
        Alert(vMsg);
        asgKSGPart.Col := Col;
        Value := '';
      end;
      SetAmount(asgKSGPart,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
        //asgKSGPart.AddRow;
        SetAmount(asgKSGPart,Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgKSGPart.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmEstimasi.asgKSGPartGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
   case ACol of
    colQty,colPrice,colDisc : AEditor := edPositiveNumeric;
     colDiscPct : AEditor := edFloat;
     colKsg : AEditor := edCheckBox;
  end;
end;

procedure TfrmEstimasi.asgKSGPartRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
//  if ARow = 0 then exit;
  //popReguler.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmEstimasi.asgRegServiceCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDisc,colDiscPct])
            and ((not BrowseMode) or EditMode) and (MasterShipService=SHIP_SERVICE_TYPE_REG);

 // if CanEdit then
  //  asgRegService.Colors[ACol,ARow] := clYellow;
  {if CanEdit and (ACol = colPrice) then
    if asgRegService.Floats[colPrice,ARow] >0 then
      CanEdit := False;}
end;

procedure TfrmEstimasi.asgRegServiceCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg:string;
begin
  case Col of
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgRegService,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgRegService.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
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
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgRegService.AddRow;
        SetAmount(asgRegService,Row,Col);
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

procedure TfrmEstimasi.asgRegServiceGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
   if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colDiscPct] then
    HAlign := taRightJustify;
end;

procedure TfrmEstimasi.asgRegServiceGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);

begin
  case ACol of
    colPrice,colDisc : AEditor := edPositiveNumeric;
     colQty,colDiscPct : AEditor := edFloat;
 end;

end;

procedure TfrmEstimasi.DeleteRowGrid(AGrid: TAdvStringGrid; ARow,
  ACOL: integer);
begin
  if ARow = 0 then exit;
  if Confirmed('Data pada baris ke-'+IntToStr(AGrid.Row)+ 'akan dihapus?') then begin
    if AGrid.RowCount=3 then
      AGrid.ClearRows(ARow,1)
    else
      deleterow(AGrid,AGrid.Row,colCode,False);
    SetFooter;
  end;
end;

procedure TfrmEstimasi.asgRegServiceRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
 // if ARow = 0 then exit;
 // popReguler.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;

procedure TfrmEstimasi.btnCustNewClick(Sender: TObject);
var tmp : integer;
begin
  tmp := frmPersonCarAdd.ExecuteCustomer(0);
  LoadCustomer(TPersons.getCodeFromID(tmp));
end;

procedure TfrmEstimasi.asgRegServiceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;vFilter,vSearch : string;
begin
   if BrowseMode and (not EditMode) then exit;

   case Key of
     VK_F8 : ShortCutF8(asgRegService,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
     end;
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

procedure TfrmEstimasi.asgRegPartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer; vSearch:string;
begin
   if BrowseMode and (not EditMode) then exit;
   case Key of
     VK_F8 :  ShortCutF8(asgRegPart,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
     end;
     {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
     case asgRegPart.Col of
       colCode,colName : begin
         vSearch :=LowerCase(chr(getNewKeyDown(Key)));
         vId := frmLovFlat.Execute(IfThen(asgRegPart.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
         if vId > 0 then
           getItem(asgRegPart,vId,asgRegPart.Row);
       end;
     end;
     end;
     {$ENDIF}
   end;
end;


procedure TfrmEstimasi.getItem(AGrid: TAdvStringGrid; AItemId,
  ARow: integer;isItem:boolean;AGridChild:TAdvStringGrid);
var i,vRow : integer;
   vPkgArr : TServicePackage_Arr;
begin
  if isItem then begin
    vItem.Reset;
    if vItem.SelectInDB(AItemId) then begin
       with AGrid do begin
         Cells[colCode,ARow] := vItem.ItemCode;
         Cells[colName,ARow] := vItem.ItemName;
         Floats[colQty,ARow] := 1;
         Ints[colId,ARow]:= vItem.ItemId;
         Cells[colType,ARow] := TItems.getDesc(vItem.ItemType);
         Floats[colPrice,ARow] := vItem.Price;
         IF MasterShipService = SHIP_SERVICE_TYPE_KSG THEN begin
           AddCheckBox(colKsg,arow,False,False);
           SetCheckBoxState(colKsg,arow,False);
         end;
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
           Floats[colQty,ARow] := 1;
           Ints[colId,ARow]:= vService.ServiceId;
           Cells[colType,ARow] := TItems.getDesc(vService.ServiceType);
           Floats[colPrice,ARow] := vService.Price;
           IF MasterShipService = SHIP_SERVICE_TYPE_KSG THEN begin
             AddCheckBox(colKsg,arow,False,False);
             SetCheckBoxState(colKsg,arow,False);
           end;
           Cells[colPartType,ARow] := vService.ServiceType;

         end;
       end //end tipe bukan paket
       else  if (vService.ServiceType = SERVICE_TYPE_PACKAGE) and (AGridChild <> nil) then begin
          vPkgArr := TServicePackage_Arr.Create;
          vPkgArr.FindOnDb(vService.ServiceId);
          for i:= 0 to vPkgArr.Count-1 do begin
            //insert detail service from package
            if vPkgArr[i].Services.ServiceId>0 then begin
              vRow := AGrid.RowCount-2;
              with AGrid do begin
                Cells[colCode,vRow] := vPkgArr[i].Services.ServiceCode;
                Cells[colName,vRow] := vPkgArr[i].Services.ServiceName;
                Cells[colType,vRow] := TItems.getDesc(vPkgArr[i].Services.ServiceType);
                Floats[colqty,vRow] := vPkgArr[i].Quantity;
                Floats[colPrice,vRow] := vPkgArr[i].Price;
                Ints[colId,vRow] := vPkgArr[i].Services.ServiceId;
                Ints[colParent,vRow] := vPkgArr[i].ServiceParent;
                AddCheckBox(colKsg,vRow,False,False);
                SetCheckBoxState(colKsg,vRow,True);
                SetAmount(AGrid,vRow);
                AddRow;
              end;
            end // end package service
            else if vPkgArr[i].Items.ItemId > 0 then begin
              //insert detail part from package
              vRow := AGridChild.RowCount-2;
              if (not IsClear(AGridChild,vRow,colID)) then
                  AGridChild.AddRow;
              with AGridChild do begin
                vRow := RowCount-2;
                Cells[colCode,vRow] := vPkgArr[i].Items.ItemCode;
                Cells[colName,vRow] := vPkgArr[i].Items.ItemName;
                Cells[colType,vRow]:= TItems.getDesc(vPkgArr[i].Items.ItemType);
                Floats[colqty,vRow] := vPkgArr[i].Quantity;
                Floats[colPrice,vRow] := vPkgArr[i].Price;
                Ints[colId,vRow] := vPkgArr[i].Items.ItemId;
                AddCheckBox(colKsg,vRow,False,False);
                SetCheckBoxState(colKsg,vRow,True);
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
  AGrid.Update;
end;

procedure TfrmEstimasi.asgKSGServiceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;vFilter,vSearch : string;
begin
  if BrowseMode and (not EditMode) then exit;
  case Key of
     VK_F8 :  begin ShortCutF8(asgKSGService,Key,colCode);
                 asgKSGService.AddCheckBox(colKsg,asgKSGService.RowCount-2,False,False);
     end;
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
     end;
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgKSGService.Col of
         colCode,colName : begin
           vFilter := '';//' AND s.service_type <> '+FormatSQLString(SERVICE_TYPE_PACKAGE);
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgKSGService.Col=colName,'NAME','CODE'),vSearch,'SERVICE',vFilter);
           if vId > 0 then
             getItem(asgKSGService,vId,asgKSGService.Row,False,asgKSGPart);
         end;
       end;
     end;
  end;
end;

procedure TfrmEstimasi.asgCompanyServiceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;vFilter,vSearch : string;
begin
  if BrowseMode and (not EditMode) then exit;
  case Key of
    VK_F8 : ShortCutF8(asgCompanyService,Key,colCode);
    VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
    end;
    ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
         case asgCompanyService.Col of
           colCode,colName : begin
             vFilter := '';//' AND s.service_type <> '+FormatSQLString(SERVICE_TYPE_PACKAGE);
             vSearch := LowerCase(chr(getNewKeyDown(Key)));
             vId := frmLovFlat.Execute(IfThen(asgCompanyService.Col=colName,'NAME','CODE'),vSearch,'SERVICE',vFilter);
             if vId > 0 then
               getItem(asgCompanyService,vId,asgCompanyService.Row,False,asgCompanyPart);
           end;
         end;
     end;
  end;
end;

procedure TfrmEstimasi.asgKSGPartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer; vSearch:string;
begin
  if BrowseMode and (not EditMode) then exit;
  case Key of
    VK_F8 :  begin
      ShortCutF8(asgKSGPart,Key,colCode);
         asgKSGPart.AddCheckBox(colKsg,asgKSGPart.RowCount-2,False,False);
     end;
    VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
    end;
         {$IFDEF NORMAL}
    ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgKSGPart.Col of
         colCode,colName : begin
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgKSGPart.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
           if vId > 0 then
             getItem(asgKSGPart,vId,asgKSGPart.Row);
         end;
       end;
    end;
    {$ENDIF}
  end;

end;

procedure TfrmEstimasi.asgCompanyPartKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer; vSearch:string;
begin
   if BrowseMode and (not EditMode) then exit;
   case Key of
     VK_F8 : ShortCutF8(asgCompanyPart,Key,colCode);
     VK_DELETE : begin
      if (Shift = [ssCtrl]) then
        DeleteRow1Click(Self);
     end;
          {$IFDEF NORMAL}
     ord('A')..ord('Z'),ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
       case asgCompanyPart.Col of
         colCode,colName : begin
           vSearch :=LowerCase(chr(getNewKeyDown(Key)));
           vId := frmLovFlat.Execute(IfThen(asgCompanyPart.Col=colName,'NAME','CODE'),vSearch,'ITEM','');
           if vId > 0 then
             getItem(asgCompanyPart,vId,asgCompanyPart.Row);
         end;
       end;
     end;
     {$ENDIF}
   end;
end;

procedure TfrmEstimasi.dtpTransKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnCust.SetFocus;
end;

procedure TfrmEstimasi.chkPostKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnSave.SetFocus;
end;

procedure TfrmEstimasi.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    pgcDetail.SetFocus;
end;

procedure TfrmEstimasi.btnPostingClick(Sender: TObject);
begin
  chkPost.Checked := True;
  if BrowseMode and (not EditMode) then
    EditMode := True;

  btnSave.Click;
end;

procedure TfrmEstimasi.asgKSGServiceCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDisc,colDiscPct,colKsg])
            and ((not BrowseMode) or EditMode) and (MasterShipService=SHIP_SERVICE_TYPE_KSG);
  {if CanEdit and (ACol = colPrice) then
    if asgKSGService.Floats[colPrice,ARow] >0 then
      CanEdit := False;}
end;

procedure TfrmEstimasi.asgCompanyServiceCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol in [colQty,colCode,colName,colPrice,colDisc,colDiscPct])
            and ((not BrowseMode) or EditMode) and (MasterShipService=SHIP_SERVICE_TYPE_COMP);

  {if CanEdit and (ACol = colPrice) then
    if asgCompanyService.Floats[colPrice,ARow] >0 then
      CanEdit := False;}
end;

procedure TfrmEstimasi.asgKSGServiceCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg : string;
begin
case Col of
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgKSGService,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgKSGService.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      if Valid then begin
          Valid := StrToFloatDef(Value,0)>0;
        vMsg  := 'Nilai tidak boleh sama dengan nol (0)';
       //SetAmount(asgKSGService,Row);
      end;
      if not Valid then begin
        Alert(vMsg);
        asgKSGService.Col := Col;
        Value := '';
      end;
      SetAmount(asgKSGService,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgKSGService.AddRow;
        SetAmount(asgKSGService,Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgKSGService.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;

end;

procedure TfrmEstimasi.asgCompanyServiceCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
var vMsg : string;
begin
case Col of
    colPrice : begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      if Valid then
        SetAmount(asgCompanyService,Row);
      if not Valid then begin
        Alert('Data masukan salah!');
        asgCompanyService.Col := Col;
        Value := '';
      end;
    end;
    colQty :begin
      Valid := (StrToFloat(Value)>0) and (Value<>'');
      vMsg  := 'Data masukan salah!';
      if Valid then begin
          Valid := StrToFloatDef(Value,0)>0;
        vMsg  := 'Nilai tidak boleh sama dengan nol (0)';
       // SetAmount(asgCompanyService,Row);
      end;
      if not Valid then begin
        Alert(vMsg);
        asgCompanyService.Col := Col;
        Value := '';
      end;
      SetAmount(asgCompanyService,Row);
    end;
    colDisc,colDiscPct :begin
      Valid := True;//(StrToFloat(Value)>0) and (Value<>'');
      if Valid then begin
//        asgCompanyService.AddRow;
        SetAmount(asgCompanyService,Row,Col);
      end;
      if not Valid then begin
        Alert('Data masukan salah!');
        asgCompanyService.Col := Col;
        Value := '';
      end;
    end;
  end;
  SetFooter;
  ArrangeColSize;
end;

procedure TfrmEstimasi.txtBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    btnSave.SetFocus;
end;

procedure TfrmEstimasi.txtNoPolKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key in [VK_RETURN,VK_tAB]) then begin
    if TPersons.ExistInDB(txtNoPol.Text) then begin
      LoadCustomer(txtNoPol.Text);
      cmbNoPol.SetFocus;
    end
    else
      btnCust.SetFocus;
  end;
end;

procedure TfrmEstimasi.asgRegServiceSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  CanSelect := (Self.ActiveControl = asgRegService);
  asgRegService.ShowSelection := CanSelect;
end;

procedure TfrmEstimasi.setGridSelection(AGrid:TAdvStringGrid);
begin
  if AGrid <> nil then begin
    asgRegPart.ShowSelection    := (asgRegPart.Name = AGrid.Name);
    asgRegService.ShowSelection := (asgRegService.Name = AGrid.Name);
    asgKSGPart.ShowSelection    := (asgKSGPart.Name = AGrid.Name);
    asgKSGService.ShowSelection := (asgKSGService.Name = AGrid.Name);
    asgCompanyPart.ShowSelection    := (asgCompanyPart.Name = AGrid.Name);
    asgCompanyService.ShowSelection := (asgCompanyService.Name = AGrid.Name);
 end
 else begin
    asgRegPart.ShowSelection    := False;
    asgRegService.ShowSelection := False;
    asgKSGPart.ShowSelection    := False;
    asgKSGService.ShowSelection := False;
    asgCompanyPart.ShowSelection    := False;
    asgCompanyService.ShowSelection := False;
 end;
end;

procedure TfrmEstimasi.asgRegServiceEnter(Sender: TObject);
begin
  setGridSelection(sender as TAdvStringGrid);
end;

procedure TfrmEstimasi.asgCompanyServiceExit(Sender: TObject);
begin
  setGridSelection(nil);
end;

procedure TfrmEstimasi.CountSubtotal(ARow, ACol: integer;AGrid:TAdvStringGrid);
var  vPct,vDisc,vPrice,vQty : Double;
begin
    vPrice := AGrid.Floats[colPrice,Arow];
    vQty   := AGrid.Floats[colQty,Arow];
    vPct   := AGrid.Floats[colDiscPct,Arow];
    vDisc  := AGrid.Floats[colDisc,ARow];
   // vSales := AGrid.Floats[colSalesP,Arow];
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
   // vSubtotal := vSales * vQty;
    AGrid.Floats[colDiscPct,Arow] := vPct;
    AGrid.Floats[colDisc,Arow] := vDisc;
 //   asgOffer.Floats[colSubtotal,Arow]:= vSubtotal;
  //  asgOffer.Floats[colSelisih,Arow] := vSubtotal - (vQty*vPrice);
//    txtTotalItem.FloatValue   := asgOffer.ColumnSum(colSubtotal,1,asgOffer.RowCount-2);

end;

procedure TfrmEstimasi.txtDPChange(Sender: TObject);
begin
  SetFooter;
end;

procedure TfrmEstimasi.dtpBayarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
    mmNotes.SetFocus;
end;

procedure TfrmEstimasi.asgKSGPartGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
if (ARow = 0) or (ACol= colKsg) then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colDiscPct] then
    HAlign := taRightJustify;
end;

procedure TfrmEstimasi.asgKSGServiceGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
 if (ARow = 0) or (ACol = colKSg) then
    HAlign := taCenter
  else if ACol in [colQty,colPRice,colBruto,colDIsc,colNett,colDiscPct] then
    HAlign := taRightJustify;
end;

procedure TfrmEstimasi.asgKSGServiceCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  SetAmount(asgKSGService,ARow);
end;

procedure TfrmEstimasi.asgKSGPartCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
SetAmount(asgKSGPart,ARow);
end;

procedure TfrmEstimasi.loadMekanik;
var i,vRow,vColId: integer;
  RelationArr: TPersons_Arr;
begin
   RelationArr := TPersons_Arr.Create;
{  InitGridMekanik;

  frmMainMenu.Gauge.Show;
  RelationArr.FindMechanic(IfThen(EditMode,-1,MasterSeq));
  for i:= 0 to RelationArr.Count-1 do begin
   frmMainMenu.Gauge.Progress := round((i+1)/(RelationArr.Count)*100);
    asgMekanik.Cells[1,   i+1]:= RelationArr[i].PersonCode;
    asgMekanik.Cells[2,   i+1]:= RelationArr[i].PersonName;
    asgMekanik.Ints[3,i+1] := RelationArr[i].PersonId;
    asgMekanik.AddCheckBox(0,i+1,true,true);
    //titipe dari mtr_year padahal isinya ship_id
    asgMekanik.SetCheckBoxState(0,i+1,(EditMode or BrowseMode) and (MasterSeq=RelationArr[i].MtrYear));
    asgMekanik.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  asgMekanik.AutoSizeColumns(True,1);
  asgMekanik.ColWidths[3]:=0;
  DeleteRowTerakhir(asgMekanik,2,1);}
  RelationArr.Free;
end;

procedure TfrmEstimasi.InitGridMekanik;
begin
{ResetGrid(asgMekanik,2,5,1,0);
  with asgMekanik do begin
    Cells[0,0] := 'x';
    Cells[1,0] := 'Kode';
    Cells[2,0] := 'Nama';
    AddCheckBox(0,1,False,False);
    StretchRightColumn;
  end;
 }
end;

procedure TfrmEstimasi.asgMekanikCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := (ACol = 0) and (ARow>0) and ((not BrowseMode) or EditMode);
end;

procedure TfrmEstimasi.LoadCar(ANoPol: string);
var vCar : TPersonsCar; i:integer;
begin
    vCar := TPersonsCar.Create;
    lblTahun.Caption    := '';;
    lblRangka.Caption   := '';
    lblNoMesin.Caption  := '';
    lblTipeMotor.Caption:= '';
    i:= TPersons.getSeqFromCode(txtNoPol.Text);
    if vCar.SelectInDB(i,ANoPol) then begin
      cmbNoPol.ItemIndex := listNoPol.IndexOfName(ANoPol);
      lblTahun.Caption    := IntToStr(vCar.MtrYear);
      lblRangka.Caption   := vCar.MtrRangka;
      lblNoMesin.Caption  := vCar.MtrMesin;
      lblTipeMotor.Caption:= TMotor.getName(vCar.Motor.MotorId);
    end;
    vCar.Free;
end;

procedure TfrmEstimasi.cmbNoPolSelect(Sender: TObject);
begin
//alert(listNoPol.Names[cmbNoPol.itemIndex]);
  loadCar(listNoPol.Names[cmbNoPol.itemIndex]);
end;

procedure TfrmEstimasi.btnAddKendaraanClick(Sender: TObject);
var id:integer;
begin
   id :=TPersons.getSeqFromCode(txtNoPol.Text) ;
   if id= 0 then begin
     Alert('Pilih customer terlebih dahulu');
     exit;
   end;

    frmPersonCarAdd.ExecuteCustomer(id);
      TPersonsCar_Arr.GetList(listNoPol,id);
      NameValueListToValueList(listNoPol,cmbNoPol.Items);

end;

end.
