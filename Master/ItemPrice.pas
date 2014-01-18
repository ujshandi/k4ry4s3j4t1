unit ItemPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons,
  ImgList, ComCtrls, ToolWin, WinXP, AdvEdit, FthBtns, asgprev, strUtils,
  UMaster, Menus;

type
  TfrmItemPrice = class(TForm)
    MainPanel: TPanel;
    WinXP1: TWinXP;
    apd1: TAdvPreviewDialog;
    PopupMenu1: TPopupMenu;
    HapusData1: TMenuItem;
    pgcMain: TPageControl;
    tbsPart: TTabSheet;
    tbsOli: TTabSheet;
    tbsService: TTabSheet;
    Panel1: TPanel;
    pnlFilter: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    btnReset: TButton;
    txtFilterNama: TAdvEdit;
    txtFilterKode: TAdvEdit;
    Panel2: TPanel;
    asgPart: TAdvStringGrid;
    btnPrintPart: TButton;
    btnAddPart: TButton;
    btnEditPart: TButton;
    Panel3: TPanel;
    Panel4: TPanel;
    asgOli: TAdvStringGrid;
    btnPrintOil: TButton;
    btnAddOil: TButton;
    btnEditOil: TButton;
    pnlFilterOil: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    asgService: TAdvStringGrid;
    btnPrintService: TButton;
    btnAddService: TButton;
    btnEditService: TButton;
    pnlFilterService: TPanel;
    rbActive: TRadioButton;
    rbHistory: TRadioButton;
    rbActiveOil: TRadioButton;
    rbHistoryOil: TRadioButton;
    rbActiveService: TRadioButton;
    rbHistoryService: TRadioButton;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    AdvStringGrid1: TAdvStringGrid;
    btnFilterPart: TButton;
    btnRefreshPart: TButton;
    GroupBox4: TGroupBox;
    rbPercent: TRadioButton;
    rbValue: TRadioButton;
    txtPricePart: TAdvEdit;
    rbGenerate: TButton;
    Label7: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    txtOilCode: TAdvEdit;
    Button4: TButton;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    rbOilPercent: TRadioButton;
    rbOilValue: TRadioButton;
    txtOilPrice: TAdvEdit;
    rbOilPrice: TButton;
    Label5: TLabel;
    Label8: TLabel;
    txtServiceCode: TAdvEdit;
    Button7: TButton;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    rbServicePercent: TRadioButton;
    rbServiceValue: TRadioButton;
    txtServicePrice: TAdvEdit;
    btnServiceProses: TButton;
    txtOilName: TAdvEdit;
    txtServiceName: TAdvEdit;
    btnRefreshService: TButton;
    btnRefreshOil: TButton;
    btnOilFilter: TButton;
    btnServiceFilter: TButton;
    Button3: TButton;
    Button5: TButton;
    rbHistoryBeli: TRadioButton;
    rbHistoryBeliOil: TRadioButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Label10: TLabel;
    txtKendaraan: TAdvEdit;
    procedure asgPartGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnPrintPartClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure asgPartDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure asgPartRightClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure HapusData1Click(Sender: TObject);
    procedure btnAddPartClick(Sender: TObject);
    procedure btnEditPartClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnPrintServiceClick(Sender: TObject);
    procedure btnAddServiceClick(Sender: TObject);
    procedure btnEditServiceClick(Sender: TObject);
    procedure btnRefreshServiceClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure asgServiceGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnRefreshOilClick(Sender: TObject);
    procedure btnAddOilClick(Sender: TObject);
    procedure btnEditOilClick(Sender: TObject);
    procedure asgOliGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnPrintOilClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnFilterPartClick(Sender: TObject);
    procedure txtPricePartKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbGenerateClick(Sender: TObject);
    procedure btnOilFilterClick(Sender: TObject);
    procedure btnServiceFilterClick(Sender: TObject);
    procedure txtOilPriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtServicePriceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure txtFilterKodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtFilterNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtOilNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtOilCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

    //EditMode:Boolean;
    procedure InitFilter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;
    procedure ReloadGrid;
    procedure ReloadService;
    procedure ReloadOil;
    procedure Generate;
  public

    function Execute():boolean;
  end;

var
  frmItemPrice: TfrmItemPrice;

CONST
  {Part}
  colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colUnit  = 3;
  colLimit = 4;
  colKendaraan = 5;
  colPurchase = 6;
  colPrice = 7;
  colSeq   = 8;
  colPriceId = 9;

  {Service}
  colSNo = 0;
  colSCode = 1;
  colSName = 2;
  colSPrice = 3;
  colSType = 4;
  colSId = 5;
  colsPriceId = 6;

  {OLI}
  colONo    = 0;
  colOCode  = 1;
  colOName  = 2;
  colOUnit  = 3;
  colOLimit  = 4;
  colOPurchase = 5;
  colOPrice = 6;
  colOID   = 7;
  colOPriceId = 8;

  {Detail}
  coldPrice = 2;
  coldDisable = 1;

  TAB_PART = 0;
  TAB_OIL = 1;
  TAB_SERVICE = 2;

implementation

uses un_ryu, Subroutines, AutoBengkel,UConst, MainMenu, ItemEditPrice, ItemPrint,
  ServicePrint, ServiceAdd, SQLServerConnections, LoadPrice,
  ItemPriceAktifPrint, ItemPriceHistoryPrint, LOVFlat;


{$R *.dfm}

{ TfrmItemKelola }

function TfrmItemPrice.Execute: boolean;
begin
  Result := True;
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  pgcMain.ActivePageIndex := TAB_OIL;
  InitGrid;
  pgcMain.ActivePageIndex := TAB_SERVICE;
  InitGrid;
//  pgcMain.ActivePageIndex := TAB_OTHERS;
  //InitGrid;

  pgcMain.ActivePageIndex := TAB_PART;

  pnlFilter.Height := 0;
  pnlFilterOil.Height := 0;
  pnlFilterService.Height := 0;
  SetFilterSize(pnlFilter,btnFilterPart,120);
  SetFilterSize(pnlFilterOil,btnOilFilter,95);
  SetFilterSize(pnlFilterService,btnServiceFilter,95);
  pgcMainChange(Self);


  Result := True;
  InitForm;
  Run(Self);
end;

procedure TfrmItemPrice.InitForm;
begin
  //cek dulu ah ... apa udah di-create apa blom ya ...
  txtFilterNama.Clear;
  txtFilterKode.Clear;
  txtPricePart.Clear;
  
  txtServiceCode.Clear;
  txtServiceName.Clear;
  txtServicePrice.Clear;

  txtOilCode.Clear;
  txtOilName.Clear;
  txtOilPrice.Clear;

  rbActive.Checked := True;
  rbActiveOil.Checked := True;
  rbActiveService.Checked := True;
  InitGrid;
  InitFilter;
  //ReloadGrid;
end;

procedure TfrmItemPrice.InitGrid;
begin
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
      asgPart.ExpandAll;
      asgPart.Clear;
      asgPart.SortSettings.Show := rbActive.Checked;
      ResetGrid(asgPart,2,11,1,1);
      with asgPart do begin
//        if rbHistory.Checked then
  //        MergeCells(colCode,0,2,1);
        Cells[colNo,   0] := 'No.';
        Cells[colCode, 0] := 'No.Part';//'Kode Item';
        Cells[colName, 0] := 'Nama Part';//'Nama Item';
        Cells[colUnit, 0] := 'Satuan';//'Satuan Pakai';
        Cells[colLimit,0] := 'Limit Stok';
        Cells[colKendaraan,0] := 'Kendaraan';
        Cells[colPurchase,0] := 'H.Beli';
        Cells[colPrice,0] := 'H.Jual';
        Cells[colSeq,  0] := 'PartID';
      end;
     end;
    TAB_OIL : begin
        asgOli.ExpandAll;
        asgOli.Clear;
        ResetGrid(asgOli,2,10,1,1);
        with asgOli do begin
//          if rbHistoryOil.Checked then
  ///          MergeCells(colOCode,0,2,1);
          Cells[colONo,   0] := 'No.';
          Cells[colOCode, 0] := 'Kode Oli';//'Kode Item';
          Cells[colOName, 0] := 'Merk Oli';//'Nama Item';
          Cells[colOUnit, 0] := 'Satuan';//'Satuan Pakai';
          Cells[colOLimit,0] := 'Limit Stok';
          Cells[colOPurchase,0] := 'H.Beli';
          Cells[colOPrice,0] := 'H.Jual';
          Cells[colPurchase,0] := 'H.Beli';
          Cells[colOId,  0] := 'OliID';
        end;
     end;
    TAB_SERVICE : begin
      asgService.ExpandAll;
      asgService.Clear;
      ResetGrid(asgService,2,8,1,1);
      with asgService do begin
//        if rbHistoryService.Checked then
  //      MergeCells(colSCode,0,2,1);
        Cells[colSNo,    0] := 'No.';
        Cells[colSCode,  0] := 'Kode Jasa';
        Cells[colSName,  0] := 'Nama Jasa';
        Cells[colSPrice, 0] := 'Harga';
        Cells[colsType,  0] := 'Tipe';
        Cells[colSId,   0] := 'ID';
      end;
    end;
  end;

  ArrangeColSize;
end;



procedure TfrmItemPrice.ArrangeColSize;
begin
  {  case pgcMain.ActivePageIndex of
      TAB_PART : begin
      end;
      TAB_OIL : begin
      end;
      TAB_SERVICE : begin
      end;
      end;}
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
      asgPart.AutoSizeColumns(True,5);
//      if rbActive.Checked then
  //      asgPart.ColWidths[coldPrice] := 0;
       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPart.ColWidths[colSeq]:= 0;
      asgPart.ColWidths[colPriceID]:= 0;
    end;
    TAB_OIL : begin
      asgOli.AutoSizeColumns(True,5);
//      if rbActiveOil.Checked then
  //      asgOli.ColWidths[coldPrice] := 0;

       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgOli.ColWidths[colOId]:= 0;
      asgOli.ColWidths[colOPriceID]:= 0;
    end;
    TAB_SERVICE : begin
      asgService.AutoSizeColumns(True,5);
    //  if rbActiveService.Checked then
      //  asgService.ColWidths[coldPrice] := 0;

       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgService.ColWidths[colSId]:= 0;
      asgService.ColWidths[colSPriceID]:= 0;
    end;
  end;
end;

procedure TfrmItemPrice.asgPartGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
  else if ACol in [colLimit,colPrice,colPurchase] then
    HAlign := taRightJustify
  else if (asgPart.Ints[colSeq,ARow] = 0) and (asgPart.Ints[colPriceId,ARow] = 0) then
    HAlign := taCenter
  else if (asgPart.Ints[colPriceId,ARow] > 0) and (ACol in [coldPrice]) then
    HAlign := taRightJustify;
end;

procedure TfrmItemPrice.btnPrintPartClick(Sender: TObject);
begin
  if rbActive.Checked then begin
    Application.CreateForm(TqrpItemPRiceAktif,qrpItemPRiceAktif);
    qrpItemPRiceAktif.ExecuteGrid(ITEM_TYPE_PART, asgPart);
    qrpItemPRiceAktif.Free;
  end
  else begin
    Application.CreateForm(TqrpItemPriceHistory,qrpItemPriceHistory);
    qrpItemPriceHistory.Executes(asgPart);
    qrpItemPriceHistory.Free;
  end;
end;

procedure TfrmItemPrice.ReloadGrid;
var vRow,vRow2,i,j: integer;
  ItemAr  : TItems_Arr;
  PriceArr : TItemPrice_Arr;
  BeliArr : TItemPricePurchase_Arr;
  procedure SetFilter;
  begin
    ItemAr.Filter.Reset;
    ItemAr.Filter.ItemType := ITEM_TYPE_PART;
    ItemAr.Filter.ItemCode := txtFilterKode.Text;
    ItemAr.Filter.ItemName := txtFilterNama.Text;
    ItemAr.Filter.UserInsert := txtKendaraan.Text;
  end;

  procedure SetHeader(ARow:integer);
  begin
    SetCellColor(asgPart,clSkyBlue,coldDisable,ARow,coldPrice);
    with asgPart do begin
      //Cells[coldNo,ARow] := 'No.';
      Cells[coldPrice,ARow]:= IfThen(rbHistory.Checked,'H.Jual','H.Beli');
      Cells[coldDisable,ARow] := 'Tgl. Aktif';
    end;
  end;

begin
  ItemAr    := TItems_Arr.Create;
  PriceArr  := TItemPrice_Arr.Create;
  BeliArr   := TItemPricePurchase_Arr.Create;
  try
    Screen.Cursor := crSQLWait;
    
    InitGrid;
    SetFilter;
    ItemAr.FindOnDB;
    frmMainMenu.Gauge.Show;
    for i:= 0 to ItemAr.Count-1 do begin
      frmMainMenu.Gauge.Progress := round((i+1)/(ItemAr.Count)*100);
      vRow := asgPart.RowCount-1;
      asgPart.Update;
      asgPart.Ints[colNo,vRow] := i+1;
   //   if rbHistory.Checked then
     //   asgPart.MergeCells(colCode,vRow,2,1);
      asgPart.Cells[colCode, vRow]:= ItemAr[i].ItemCode;
      asgPart.Cells[colName, vRow]:= ItemAr[i].ItemName;
      asgPart.Cells[colUNit, vRow]:= ItemAr[i].UsedUnit;
      asgPart.Cells[colKendaraan, vRow]:= TMotor.getName(ItemAr[i].CarId);
      asgPart.Floats[colPrice,vRow]:= ItemAr[i].Price; //TItemPrice.getPriceActive(ItemAr[i].ItemId,0);
      asgPart.Floats[colPurchase,vRow]:= ItemAr[i].PricePurchase; //ItemPricePurchase.getPriceActive(ItemAr[i].ItemId);
      asgPart.Floats[colLimit, vRow]:= ItemAr[i].StokLimit;
      asgPart.Ints[colSeq,   vRow]:= ItemAr[i].ItemId;
      asgPart.AddRow;
      if rbHistory.Checked then begin //history H.Jual
          vRow2 := asgPart.RowCount-1;
          SetHeader(vRow2);

          PriceArr.Clear;
          PriceArr.FindOnDb(ItemAr[i].ItemId);
          for j:= 0 to PriceArr.Count-1 do begin
            asgPart.AddRow;
            vRow2 := asgPart.RowCount-1;
  //          asgPart.Ints[coldNo,vRow2] := j+1;
            asgPart.Floats[coldPrice,vRow2] := PriceArr[j].Price;
            asgPart.Cells[coldDisable,vRow2]:= NewFormatDate(PriceArr[j].DateInsert);
            asgPart.Ints[colPriceId,vRow2]  := PriceArr[j].PriceId;
          end;
          //asgPart.AddRow;
          asgPart.AddNode(vRow,vRow2-vRow+1);
          asgPart.AddRow;
       end;//end history

       if rbHistoryBeli.Checked then begin //history H.Beli
          vRow2 := asgPart.RowCount-1;
          SetHeader(vRow2);

          BeliArr.Clear;
          BeliArr.FindOnDb(ItemAr[i].ItemId);
          for j:= 0 to BeliArr.Count-1 do begin
            asgPart.AddRow;
            vRow2 := asgPart.RowCount-1;
  //          asgPart.Ints[coldNo,vRow2] := j+1;
            asgPart.Floats[coldPrice,vRow2] := BeliArr[j].Price;
            asgPart.Cells[coldDisable,vRow2]:= NewFormatDate(BeliArr[j].DateInsert);
            asgPart.Ints[colPriceId,vRow2]  := BeliArr[j].PricePurchaseId;
          end;
          //asgPart.AddRow;
          asgPart.AddNode(vRow,vRow2-vRow+1);
          asgPart.AddRow;
       end;//end history
    end;
    frmMainMenu.Gauge.Hide;
    DeleteRowTerakhir(asgPart,2,1);
  finally
    ArrangeColSize;
    ItemAr.Free;
    PriceArr.Free;
    BeliArr.Free;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmItemPrice.InitFilter;
begin
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
      txtFilterKode.Clear;
      txtFilterNama.Clear;
      txtPricePart.Clear;
      txtKendaraan.Clear;
    end;
    TAB_OIL : begin
      txtOilCode.Clear;
      txtOilName.Clear;
      txtOilPrice.Clear;
    end;
    TAB_SERVICE : begin
      txtServiceCode.Clear;
      txtServiceName.Clear;
      txtServicePrice.Clear;
    end;
  end;
end;

procedure TfrmItemPrice.btnResetClick(Sender: TObject);
begin
  InitFilter;
end;

procedure TfrmItemPrice.btnLoadClick(Sender: TObject);
begin
   if (txtFilterKode.Text = '') and (txtFilterNama.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;
  ReloadGrid
end;

procedure TfrmItemPrice.asgPartDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (ARow <> 0) and (asgPart.Ints[colSeq,ARow]>0) then
    btnEditPart.Click;
end;

procedure TfrmItemPrice.asgPartRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
   if (ARow  = 0) or (ACol=0) then exit;
  if GlobalSystemUser.AccessLevel < LEVEL_ADMIN then exit;
  PopupMenu1.Popup(Mouse.CursorPos.x,Mouse.CursorPos.Y);
end;

procedure TfrmItemPrice.HapusData1Click(Sender: TObject);
begin
   if Confirmed('Apakah Data Item '+asgPart.Cells[colname,asgPart.Row]+' akan dihapus') then
    if not TItems.Hapus(asgPart.Ints[colSeq,asgPart.row]) then
      Inform('Data Item ini sudah ada pada transaksi, sehingga tidak bisa dihapus');
end;

procedure TfrmItemPrice.btnAddPartClick(Sender: TObject);
begin
   if frmItemEditPrice.Execute(ITEM_TYPE_PART,0) then
     btnRefreshPart.Click;
end;

procedure TfrmItemPrice.btnEditPartClick(Sender: TObject);
begin
   if frmItemEditPrice.Execute(ITEM_TYPE_PART, asgPart.Ints[colSeq,asgPart.Row]) then
     btnRefreshPart.Click
end;

procedure TfrmItemPrice.btnOkClick(Sender: TObject);
begin
   ReloadGrid;
end;

procedure TfrmItemPrice.ReloadService;
var i,j,vRow,vRow2: integer;
   ServiceAr: TServices_Arr;
   PriceArr : TItemPrice_Arr;

  procedure SetHeader(ARow:integer);
  begin
    SetCellColor(asgService,clSkyBlue,coldDisable,ARow,coldPrice);
    with asgService do begin
//      Cells[coldNo,ARow] := 'No.';
      Cells[coldPrice,ARow]:= 'Harga';
      Cells[coldDisable,ARow] := 'Non Aktif';
    end;
  end;

  procedure setFilter;
  begin
    with ServiceAr.Filter do begin
      Reset;
      ServiceCode := txtServiceCode.Text;
      ServiceName := txtServiceName.Text;
    end;
  end;
begin
  ServiceAr := TServices_Arr.Create;
  PriceArr  := TItemPrice_Arr.Create;
  try
    Screen.Cursor := crSQLWait;
    InitGrid;
    SetFilter;


    ServiceAr.FindOnDB;
    frmMainMenu.Gauge.Show;
    for i:= 0 to ServiceAr.Count-1 do begin
      vRow := asgService.RowCount-1;
      frmMainMenu.Gauge.Progress := round((i+1)/(ServiceAr.Count)*100);
      asgService.Ints[colSNo,vRow]  := i+1;
     // if rbHistoryService.Checked then
       // asgService.MergeCells(colSCode,vRow,2,1);
      asgService.Cells[colSCode,   vRow]:= ServiceAr[i].ServiceCode;
      asgService.Cells[colSName,   vRow]:= ServiceAr[i].ServiceName;
      asgService.Floats[colSPrice, vRow]:= ServiceAr[i].Price;
      asgService.Cells[colSType, vRow]  := TServices.getDesc(ServiceAr[i].ServiceType);
      asgService.Ints[colSId,     vRow] := ServiceAr[i].ServiceId;
      asgService.AddRow;
      if rbHistoryService.Checked then begin //history
          vRow2 := asgService.RowCount-1;
          SetHeader(vRow2);

          PriceArr.Clear;
          PriceArr.FindOnDb(0,ServiceAr[i].ServiceId);
          for j:= 0 to PriceArr.Count-1 do begin
            asgService.AddRow;
            vRow2 := asgService.RowCount-1;
  //          asgService.Ints[coldNo,vRow2] := j+1;
            asgService.Floats[coldPrice,vRow2] := PriceArr[j].Price;
            asgService.Cells[coldDisable,vRow2]:= NewFormatDate(PriceArr[j].DisableDate);
            asgService.Ints[colPriceId,vRow2]  := PriceArr[j].PriceId;
          end;
          asgService.AddRow;
          asgService.AddNode(vRow,vRow2-vRow+1);
          asgService.AddRow;
       end;//end history
    end;
    frmMainMenu.Gauge.Hide;
    DeleteRowTerakhir(asgService,2,1);
  finally
    Screen.Cursor := crDefault;
    ServiceAr.Free;
    ArrangeColSize;
  end;  
end;

procedure TfrmItemPrice.btnPrintServiceClick(Sender: TObject);
begin
  if rbActiveService.Checked then begin
    Application.CreateForm(TqrpService,qrpService);
    qrpService.ExecuteGrid(asgService,SERVICE_TYPE_SINGLE);
    qrpService.Free;
  end
  else
    Inform(MSG_UNDERCONSTRUCTION);  
end;

procedure TfrmItemPrice.btnAddServiceClick(Sender: TObject);
begin
  if frmServiceAdd.Execute(SERVICE_TYPE_SINGLE,0) then
    btnRefreshService.Click;
end;

procedure TfrmItemPrice.btnEditServiceClick(Sender: TObject);
begin
  if asgService.Row = 0 then exit;
  if frmServiceAdd.Execute(SERVICE_TYPE_SINGLE,asgService.Ints[colSeq,asgService.Row]) then
    btnRefreshService.Click;
end;

procedure TfrmItemPrice.btnRefreshServiceClick(Sender: TObject);
begin
    if (txtServiceCode.Text = '') and (txtServiceName.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;
   ReloadService;
end;

procedure TfrmItemPrice.pgcMainChange(Sender: TObject);
begin
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
      frmMainMenu.lblJudul.Caption := 'Part Price History';
      txtFilterKode.SetFocus;
     // ReloadGrid;
    end;
    TAB_SERVICE : begin
      frmMainMenu.lblJudul.Caption := 'Service Price History';
      //ReloadService;
    end;
    TAB_OIL : begin
      frmMainMenu.lblJudul.Caption := 'Oil Price History';
      //ReloadOil;
    end;
  end;
end;

procedure TfrmItemPrice.asgServiceGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
  else if ACol in [colSPrice] then
    HAlign := taRightJustify;
end;

procedure TfrmItemPrice.ReloadOil;
var i,j,vRow,vRow2: integer;
  ItemAr  : TItems_Arr;
  PriceArr :  TItemPrice_Arr;
  BeliArr : TItemPricePurchase_Arr;
  procedure SetFilter;
  begin
    ItemAr.Filter.Reset;
      ItemAr.Filter.ItemCode := txtOilCode.Text;
      ItemAr.Filter.ItemName := txtOilName.Text;
  end;

  procedure SetHeader(ARow:integer);
  begin
    SetCellColor(asgOli,clSkyBlue,coldDisable,ARow,coldPrice);
    with asgOli do begin
      Cells[coldPrice,ARow]:= IfThen(rbHistoryOil.Checked,'H.Jual','H.Beli');
      Cells[coldDisable,ARow] := 'Tgl.Aktif';
    end;
  end;

begin
  ItemAr:= TItems_Arr.Create;
  PriceArr := TItemPrice_Arr.Create;
  BeliArr := TItemPricePurchase_Arr.Create;
  try
    Screen.Cursor := crSQLWait;
    InitGrid;
    SetFilter;
    ItemAr.Filter.ItemType := ITEM_TYPE_OIL;
    ItemAr.FindOnDB;
    frmMainMenu.Gauge.Show;
    for i:= 0 to ItemAr.Count-1 do begin
      vRow := asgOli.RowCount-1;
      asgOli.Ints[colONo,vRow] := i+1;
      frmMainMenu.Gauge.Progress := round((i+1)/(ItemAr.Count)*100);
  //    if rbHistoryOil.Checked then
    //    asgOli.MergeCells(colOCode,vRow,2,1);
      asgOli.Cells[colOCode, vRow]:= ItemAr[i].ItemCode;
      asgOli.Cells[colOName, vRow]:= ItemAr[i].ItemName;
      asgOli.Cells[colOUNit, vRow]:= ItemAr[i].UsedUnit;
      asgOli.Floats[colOLimit, vRow]:= ItemAr[i].StokLimit;
      asgOli.Floats[colOPrice,vRow] := ItemAr[i].Price;
      asgOli.Floats[colOPurchase,vRow] := ItemAr[i].PricePurchase; //TItemPricePurchase.getPriceActive(ItemAr[i].ItemId);
      asgOli.Ints[colOId,   vRow]:= ItemAr[i].ItemId;
      asgOli.AddRow;

      if rbHistoryOil.Checked then begin //history H.Jual;
          vRow2 := asgOli.RowCount-1;
          SetHeader(vRow2);

          PriceArr.Clear;
          PriceArr.FindOnDb(ItemAr[i].ItemId);
          for j:= 0 to PriceArr.Count-1 do begin
            asgOli.AddRow;
            vRow2 := asgOli.RowCount-1;
            asgOli.Floats[coldPrice,vRow2] := PriceArr[j].Price;
            asgOli.Cells[coldDisable,vRow2]:= NewFormatDate(PriceArr[j].DateInsert);
            asgOli.Ints[colPriceId,vRow2]  := PriceArr[j].PriceId;
          end;
         // asgOli.AddRow;
          asgOli.AddNode(vRow,vRow2-vRow+1);
          asgOli.AddRow;
       end;//end history

       if rbHistoryBeliOil.Checked then begin //history H.Beli;
          vRow2 := asgOli.RowCount-1;
          SetHeader(vRow2);

          BeliArr.Clear;
          BeliArr.FindOnDb(ItemAr[i].ItemId);
          for j:= 0 to BeliArr.Count-1 do begin
            asgOli.AddRow;
            vRow2 := asgOli.RowCount-1;
            asgOli.Floats[coldPrice,vRow2] := BeliArr[j].Price;
            asgOli.Cells[coldDisable,vRow2]:= NewFormatDate(BeliArr[j].DisableDate);
            asgOli.Ints[colPriceId,vRow2]  := BeliArr[j].PricePurchaseId;
          end;
          asgOli.AddRow;
          asgOli.AddNode(vRow,vRow2-vRow+1);
          asgOli.AddRow;
       end;//end history
    end;
    frmMainMenu.Gauge.Hide;
    DeleteRowTerakhir(asgOli,2,1);
  finally
    Screen.Cursor := crDefault;
    ArrangeColSize;
    ItemAr.Free;
    BeliArr.Free;
    PriceArr.Free;
  end;  
end;

procedure TfrmItemPrice.btnRefreshOilClick(Sender: TObject);
begin
   if (txtOilCode.Text = '') and (txtOilName.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;
  ReloadOil;
end;

procedure TfrmItemPrice.btnAddOilClick(Sender: TObject);
begin
   if frmItemEditPrice.Execute(ITEM_TYPE_OIL,0) then
     btnRefreshOil.Click;
end;

procedure TfrmItemPrice.btnEditOilClick(Sender: TObject);
begin
   if frmItemEditPrice.Execute(ITEM_TYPE_OIL, asgOli.Ints[colOId,asgOli.Row]) then
     btnRefreshOil.Click ;
end;

procedure TfrmItemPrice.asgOliGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
  else if ACol in [colOLimit,colOPrice,colOPurchase] then
    HAlign := taRightJustify
  else if (asgOli.Ints[colOId,ARow] = 0) and (asgOli.Ints[colOPriceId,ARow] = 0) then
    HAlign := taCenter
  else if (asgOli.Ints[colOPriceId,ARow] > 0) and (ACol in [coldPrice]) then
    HAlign := taRightJustify;
end;

procedure TfrmItemPrice.btnPrintOilClick(Sender: TObject);
begin
  if rbActiveOil.Checked then begin
    Application.CreateForm(TqrpItemPRiceAktif,qrpItemPRiceAktif);
    qrpItemPRiceAktif.ExecuteGrid(ITEM_TYPE_OIL, asgOli);
    qrpItemPRiceAktif.Free;
  end
   else begin
    Application.CreateForm(TqrpItemPriceHistory,qrpItemPriceHistory);
    qrpItemPriceHistory.Executes(asgOli);
    qrpItemPriceHistory.Free;
  end; 
end;

procedure TfrmItemPrice.Button1Click(Sender: TObject);
var vFileName : String;
begin
  if SaveDialog1.Execute then begin
    vFileName := SaveDialog1.FileName;
    if vFileName = '' then exit;
    asgPart.SaveToFile(vFileName);//+'.xls');
  end;
end;

procedure TfrmItemPrice.Button2Click(Sender: TObject);
var vFileName : String;
begin
  AdvStringGrid1.Visible := True;
  if OpenDialog1.Execute then begin
    vFileName := OpenDialog1.FileName;
    if vFileName = '' then exit;
    AdvStringGrid1.LoadFromFile(vFileName);
  end;

end;

procedure TfrmItemPrice.btnFilterPartClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilterPart,120);
end;

procedure TfrmItemPrice.txtPricePartKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    ord('0')..ord('9'),VK_DECIMAL,VK_NUMPAD0..VK_NUMPAD9,
    VK_BACK,VK_RETURN,VK_TAB,VK_DELETE,ord(','): txtPricePart.Text := txtPricePart.Text;
    else begin
       Alert('Data Masukan salah');
       txtPricePart.Clear;
    end
  end;

end;

procedure TfrmItemPrice.rbGenerateClick(Sender: TObject);
begin
  Generate;
  case pgcMain.ActivePageIndex of
    TAB_PART : btnRefreshPart.Click;
    TAB_OIL  : btnRefreshOil.Click;
    TAB_SERVICE : btnRefreshService.Click;
  end;
end;

procedure TfrmItemPrice.Generate;
var i,vColId,vColPrice:integer;
    aGrid : TAdvStringGrid;
    vEditPrice : TAdvEdit;
    vNewPrice : Double;
    vItem : TItems;
    vService : TServices;
    vTipe : string;
    vRbPercent,vRbValue : TRadioButton;

    function isValid:boolean;
    begin
      Result := False;
      if vTipe = '' then begin
        Alert('Kriteria edit harga belum ditentukan!');

      end
      else if vEditPrice.Text = '' then begin
        Alert('Nilai acuan perubahan harga belum diisi!');
        vEditPrice.SetFocus;
      end
      else if not CekFloat(vEditPrice.Text) then begin
        Alert('Data acuan yang diinput salah!');
        vEditPrice.Clear;
        vEditPrice.SetFocus;
      end
      else
        Result := True;
    end;

begin
  vItem := TItems.Create;
  vService := TServices.Create;
  vTipe := '';
  //vColId := colSeq;

  case pgcMain.ActivePageIndex of
      TAB_OIL : begin
        aGrid := asgOli;
        vColId := colOID;
        vColPrice := colOPurchase; //colOPrice;
        vEditPrice := txtOilPrice;
        vTipe := IfThen(rbOilPercent.Checked,'P',IfThen(rbOilValue.Checked,'V',''));
        vRbPercent := rbOilPercent;
        vRbValue   := rbOilValue;
      end;
      TAB_SERVICE : begin
        aGrid := asgService;
        vColId := colSId;
        vColPrice := colSPrice;
        vEditPrice := txtServicePrice;
        vTipe := IfThen(rbServicePercent.Checked,'P',IfThen(rbServiceValue.Checked,'V',''));
        vRbPercent := rbServicePercent;
        vRbValue   := rbServiceValue;
      end;
      else  begin
        aGrid := asgPart;
        vColId := colSeq;
        vColPrice := colPurchase; //colPrice;
        vEditPrice := txtPricePart;
        vTipe := IfThen(rbPercent.Checked,'P',IfThen(rbValue.Checked,'V',''));
        vRbPercent := rbPercent;
        vRbValue   := rbValue;
      end;
  end;
  //validasi
   if not isValid then begin
     vItem.Free;
     vService.Free;
     exit;
   end;

  try

    Screen.Cursor := crSQLWait;
    //periksa grid,col

    try

      MyConnection.BeginSQL;
      if pgcMain.ActivePageIndex in [TAB_PART,TAB_OIL] then begin
        for i:= 1 to aGrid.RowCount-1 do begin
          vItem.Reset;
          vItem.ItemId := aGrid.Ints[vColId,i];
          vNewPrice := aGrid.Floats[vColPrice,i];
          {if vRbValue.Checked then
            vNewPrice := vNewPrice + StrToFloat(vEditPrice.Text);
          if vRbPercent.Checked then
            vNewPrice := vNewPrice + (vNewPrice * (StrToFloat(vEditPrice.Text)/100));}
          if vRbValue.Checked then
            vNewPrice := vNewPrice + StrToFloat(vEditPrice.Text);
          if vRbPercent.Checked then
            vNewPrice := vNewPrice + (vNewPrice * (StrToFloat(vEditPrice.Text)/100));
          vItem.Price  := vNewPrice;
          vItem.UpdatePrice;
        end;
      end
      else begin  //tipe service
         for i:= 1 to aGrid.RowCount-1 do begin
          vService.Reset;
          vService.ServiceId := aGrid.Ints[vColId,i];
          vNewPrice := aGrid.Floats[vColPrice,i];
          if vRbValue.Checked then
            vNewPrice := StrToFloat(vEditPrice.Text);
          if vRbPercent.Checked then
            vNewPrice := vNewPrice + (vNewPrice * (StrToFloat(vEditPrice.Text)/100));
          vService.Price  := vNewPrice;
          vService.UpdatePrice;
        end;
      end;
     MyConnection.EndSQL;

     Inform('Proses update harga telah selesai');
    except
      MyConnection.UndoSQL;
      Alert('Proses edit harga gagal!');
      Screen.Cursor := crDefault;
    end;
  finally
    vItem.Free;
    vService.Free;
    Screen.Cursor := crDefault;     
  end;

end;

procedure TfrmItemPrice.btnOilFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilterOil,btnOilFilter,95);
end;

procedure TfrmItemPrice.btnServiceFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilterService,btnServiceFilter,95);
end;

procedure TfrmItemPrice.txtOilPriceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
    ord('0')..ord('9'),VK_DECIMAL,VK_NUMPAD0..VK_NUMPAD9,
    VK_BACK,VK_RETURN,VK_TAB,VK_DELETE,ord(','): txtOilPrice.Text := txtOilPrice.Text;
    else begin
       Alert('Data Masukan salah');
       txtOilPrice.Clear;
    end
  end;
end;

procedure TfrmItemPrice.txtServicePriceKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    ord('0')..ord('9'),VK_DECIMAL,VK_NUMPAD0..VK_NUMPAD9,
    VK_BACK,VK_RETURN,VK_TAB,VK_DELETE,ord(','),ord('-'),ord('_'),VK_SUBTRACT: txtServicePrice.Text := txtServicePrice.Text;
    else begin
       if Chr(key) <> '-' then begin
         Alert('Data Masukan salah');
         txtServicePrice.Clear;
       end;
    end
  end;
end;

procedure TfrmItemPrice.Button3Click(Sender: TObject);
//var vFileName : String;
begin
 // AdvStringGrid1.Visible := True;
 // OpenDialog1.Filter := '*.xls';
 // if OpenDialog1.Execute then begin
   // vFileName := OpenDialog1.FileName;
    //if vFileName = '' then exit;
    frmLoadPrice.Execute;
  //end;
end;

procedure TfrmItemPrice.txtFilterKodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;  
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtFilterKode.Text,'ITEM','');
    txtFilterKode.Text := TItems.getFieldValue(vId,'item_code');
   end;

end;

procedure TfrmItemPrice.txtFilterNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('NAME',txtFilterNama.Text,'ITEM','');
    txtFilterNama.Text := TItems.getFieldValue(vId,'item_name');
  end;

end;

procedure TfrmItemPrice.txtOilNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('NAME',txtOilName.Text,'ITEM','');
    txtOilName.Text := TItems.getFieldValue(vId,'item_name');
  end;

end;

procedure TfrmItemPrice.txtOilCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;  
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtOilCode.Text,'ITEM','');
    txtOilCode.Text := TItems.getFieldValue(vId,'item_code');
   end;
end;

end.
