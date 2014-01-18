unit ItemKelola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons,Math,
  ImgList, ComCtrls, ToolWin, WinXP, AdvEdit, FthBtns, asgprev, strUtils,
  UMaster, Menus, SUIButton;

type
  TfrmItemKelola = class(TForm)
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
    Label2: TLabel;
    Label3: TLabel;
    Button5: TButton;
    txtNamaOil: TAdvEdit;
    txtKodeOil: TAdvEdit;
    Panel6: TPanel;
    Panel7: TPanel;
    asgService: TAdvStringGrid;
    btnPrintService: TButton;
    btnAddService: TButton;
    btnEditService: TButton;
    pnlFilterService: TPanel;
    Label10: TLabel;
    Label11: TLabel;
    Button10: TButton;
    txtNamaService: TAdvEdit;
    txtKodeService: TAdvEdit;
    tbsOthers: TTabSheet;
    Panel5: TPanel;
    Panel8: TPanel;
    asgOthers: TAdvStringGrid;
    btnPrintOthers: TButton;
    btnNewOthers: TButton;
    btnEditOthers: TButton;
    pnlFilterOther: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Button6: TButton;
    txtNamaOther: TAdvEdit;
    txtKodeOthers: TAdvEdit;
    btnRefreshPart: TButton;
    btnFilterPart: TButton;
    btnRefreshOil: TButton;
    btnFilterOil: TButton;
    btnRefreshService: TButton;
    btnRefreshOther: TButton;
    btnFilterService: TButton;
    btnFilterOther: TButton;
    PopupMenu2: TPopupMenu;
    EditTipe1: TMenuItem;
    HapusData2: TMenuItem;
    txtLimit: TAdvEdit;
    spdFirst: TsuiButton;
    spdNext: TsuiButton;
    spdPrev: TsuiButton;
    spdLast: TsuiButton;
    lblHal: TLabel;
    txtLimitOli: TAdvEdit;
    spdFirstOli: TsuiButton;
    spdPrevOli: TsuiButton;
    spdNextOli: TsuiButton;
    spdLastOli: TsuiButton;
    lblHalOli: TLabel;
    txtLimitService: TAdvEdit;
    spdFirstService: TsuiButton;
    spdPrevService: TsuiButton;
    spdNextService: TsuiButton;
    spdLastService: TsuiButton;
    lblHalService: TLabel;
    txtLimitOther: TAdvEdit;
    spdFirstOther: TsuiButton;
    spdPrevOther: TsuiButton;
    spdNextOther: TsuiButton;
    spdLastOther: TsuiButton;
    lblHalOther: TLabel;
    txtKendaraan: TAdvEdit;
    Label1: TLabel;
    Label5: TLabel;
    txtKendaraanOil: TAdvEdit;
    procedure asgPartGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnPrintPartClick(Sender: TObject);
    procedure asgPartPrintPage(Sender: TObject; Canvas: TCanvas; PageNr,
      PageXSize, PageYSize: Integer);
    procedure asgPartPrintSetColumnWidth(Sender: TObject; ACol: Integer;
      var Width: Integer);
    procedure asgPartGetCellPrintColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure btnResetClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure asgPartDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnFilterClick(Sender: TObject);
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
    procedure btnPrintOthersClick(Sender: TObject);
    procedure btnNewOthersClick(Sender: TObject);
    procedure btnRefreshOtherClick(Sender: TObject);
    procedure btnEditOthersClick(Sender: TObject);
    procedure btnFilterPartClick(Sender: TObject);
    procedure btnFilterOilClick(Sender: TObject);
    procedure btnFilterOtherClick(Sender: TObject);
    procedure btnFilterServiceClick(Sender: TObject);
    procedure HapusData2Click(Sender: TObject);
    procedure asgServiceRightClickCell(Sender: TObject; ARow,
      ACol: Integer);
    procedure EditTipe1Click(Sender: TObject);
    procedure spdFirstClick(Sender: TObject);
    procedure spdPrevClick(Sender: TObject);
    procedure spdNextClick(Sender: TObject);
    procedure spdLastClick(Sender: TObject);
  private
    halamanPart,totalHalamanPart : integer;
    halamanOli,totalHalamanOli : integer;
    halamanService,totalHalamanService : integer;
    halamanOther,totalHalamanOther : integer;
    procedure InitFilter;
    procedure InitForm;
    procedure InitGrid;
    procedure ArrangeColSize;


  public
    procedure ReloadGrid(Arow,AItemId:integer;isAdd:boolean);
    procedure ReloadService(Arow,AServId:integer;isAdd:boolean);
    procedure ReloadOther(Arow,AServId:integer;isAdd:boolean);
    procedure ReloadOil(Arow,AItemId:integer;isAdd:boolean);
    function Execute():boolean;
  end;

var
  frmItemKelola: TfrmItemKelola;

CONST
  {Part}
  colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colUnit  = 3;
  colLimit = 4;
  colKendaraan = 5;
  colNotes = 6;
  colSeq   = 7;

  {Service}
  colSNo = 0;
  colSCode = 1;
  colSName = 2;
  colSType = 3;
  colSPrice = 4;
  colSId = 5;

  {OLI}
  colONo    = 0;
  colOCode  = 1;
  colOName  = 2;
  colOUnit  = 3;
  colOLimit  = 4;
  colOKendaraan = 5;
  colONotes = 6;
  colOID   = 7;

  TAB_PART = 0;
  TAB_OIL = 1;
  TAB_SERVICE = 2;
  TAB_OTHERS = 3;

implementation

uses un_ryu, Subroutines, AutoBengkel,UConst, MainMenu, ItemAdd, ItemPrint,
  ServicePrint, ServiceAdd, ServicePkgAdd;


{$R *.dfm}

{ TfrmItemKelola }

function TfrmItemKelola.Execute: boolean;
begin
  Result := True;
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;

  halamanPart := 1; totalHalamanPart := 0;
  halamanOli := 1; totalHalamanOli := 0;
  halamanService := 1; totalHalamanService := 0;
  halamanOther := 1; totalHalamanOther := 0;

  pgcMain.ActivePageIndex := TAB_OIL;
  InitGrid;
  pgcMain.ActivePageIndex := TAB_SERVICE;
  InitGrid;
  pgcMain.ActivePageIndex := TAB_OTHERS;
  InitGrid;
  
  pgcMain.ActivePageIndex := TAB_PART;

  pnlFilter.Height := 0;
  pnlFilterOil.Height := 0;
  pnlFilterOther.Height := 0;
  pnlFilterService.Height := 0;
  pgcMainChange(Self);
  SetFilterSize(pnlFilter,btnFilterPart,75);
  SetFilterSize(pnlFilterOil,btnFilterOil,75);
  SetFilterSize(pnlFilterService,btnFilterService,75);
  SetFilterSize(pnlFilterOther,btnFilterOther,75);
  Result := True;
  InitForm;
  Run(Self);
end;

procedure TfrmItemKelola.InitForm;
begin
  //cek dulu ah ... apa udah di-create apa blom ya ...
  lblHal.Caption := ''; txtLimit.Tag := 0;
  lblHalOli.Caption := ''; txtLimitOli.Tag := 0;
  lblHalService.Caption := ''; txtLimitService.Tag := 0;
  lblHalOther.Caption := ''; txtLimitOther.Tag := 0;

  InitGrid;
  InitFilter;
 // ReloadGrid(0,0,False);
end;

procedure TfrmItemKelola.InitGrid;
begin
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
    
      ResetGrid(asgPart,2,9,1,1);
      with asgPart do begin
        Cells[colNo,   0] := 'No.';
        Cells[colCode, 0] := 'No.Part';//'Kode Item';
        Cells[colName, 0] := 'Nama Part';//'Nama Item';
        Cells[colUnit, 0] := 'Satuan';//'Satuan Pakai';
//        Cells[colPurchase, 0] := 'Sat.Beli';//'Satuan Beli';
  //      Cells[colConversion, 0] := 'Konversi';
        Cells[colLimit,0] := 'Limit Stok';
        Cells[colKendaraan,0] := 'Kendaraan';
        Cells[colNotes,0] := 'Keterangan';
        Cells[colSeq,  0] := 'PartID';
      end;
     end;
    TAB_OIL : begin
        ResetGrid(asgOli,2,9,1,1);
        with asgOli do begin
          Cells[colONo,   0] := 'No.';
          Cells[colOCode, 0] := 'Kode Oli';//'Kode Item';
          Cells[colOName, 0] := 'Merk Oli';//'Nama Item';
          Cells[colOUnit, 0] := 'Satuan';//'Satuan Pakai';
//          Cells[colOPurchase, 0] := 'Sat.Beli';//'Satuan Beli';
  //        Cells[colOConversion, 0] := 'Konversi';
          Cells[colOLimit,0] := 'Limit Stok';
          Cells[colOKendaraan,0] := 'Kendaraan';
          Cells[colONotes,0] := 'Keterangan';
          Cells[colOId,  0] := 'OliID';
        end;
     end;
    TAB_SERVICE : begin
      ResetGrid(asgService,2,7,1,1);
      with asgService do begin
        Cells[colSNo,    0] := 'No.';
        Cells[colSCode,  0] := 'Kode Jasa';
        Cells[colSName,  0] := 'Nama Jasa';
        Cells[colSType,  0] := 'Tipe Jasa';
        Cells[colSPrice, 0] := 'Harga';
    //    Cells[colUnit,  0] := 'Unit';
        Cells[colSId,   0] := 'ID';
      end;
    end;
    TAB_OTHERS : begin
      ResetGrid(asgOthers,2,7,1,1);
      with asgOthers do begin
        Cells[colSNo,    0] := 'No.';
        Cells[colSCode,  0] := 'Kode Jasa';
        Cells[colSName,  0] := 'Nama Jasa';
        Cells[colSType,  0] := 'Tipe Jasa';
        Cells[colSPrice, 0] := 'Harga';
    //    Cells[colUnit,  0] := 'Unit';
        Cells[colSId,   0] := 'ID';
      end;
    end;
  end;

  ArrangeColSize;
end;



procedure TfrmItemKelola.ArrangeColSize;
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
    //  asgPart.AutoNumberCol(colNo);
       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPart.ColWidths[colSeq]:= 0;
    end;
    TAB_OIL : begin
      asgOli.AutoSizeColumns(True,5);
      //asgOli.AutoNumberCol(colONo);
       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgOli.ColWidths[colOId]:= 0;
    end;
    TAB_SERVICE : begin
      asgService.AutoSizeColumns(True,5);
      //asgService.AutoNumberCol(colSNo);
       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgService.ColWidths[colSId]:= 0;
    end;
    TAB_OTHERS : begin
      asgOthers.AutoSizeColumns(True,5);
      //asgOthers.AutoNumberCol(colSNo);
       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgOthers.ColWidths[colSId]:= 0;
    end;
  end;
end;

procedure TfrmItemKelola.asgPartGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
  else if ACol in [colLimit] then
    HAlign := taRightJustify;
end;

procedure TfrmItemKelola.btnPrintPartClick(Sender: TObject);
//var temp,tmpPrimer : string;
begin
//  Inform(MSG_UNDERCONSTRUCTION);
//  asgPart.ColWidths[colSeq]:=0;
 // asgPart.HideColumn(colSeq+1);
 // apd1.Grid := asgPart;
 { asgPart.PrintSettings.TitleLines.Add('Daftar Item');
  asgPart.PrintSettings.TitleLines.Clear;
  apd1.Grid := asgPart;
  apd1.Execute;
  //asgPart.UnHideColumn(colSeq);
  asgPart.UnHideColumn(colSeq+1);}
  Application.CreateForm(TqrpItem,qrpItem);
  qrpItem.ExecuteGrid(ITEM_TYPE_PART, asgPart);
  qrpItem.Free;
end;

procedure TfrmItemKelola.asgPartPrintPage(Sender: TObject;
  Canvas: TCanvas; PageNr, PageXSize, PageYSize: Integer);
var
  SaveFont: TFont;
  SaveBrush : TBrush;
  ts, tw: Integer;
  reporttitle : string;

const
  myowntitle: string = 'Clean N'''' Dry';

begin
  reporttitle := trim('Daftar Item');
  if asgPart.PrintColStart <> 0 then
    Exit;
  with canvas do
  begin
    Savefont := TFont.create;
    SaveFont.Assign(Font);
    SaveBrush := TBrush.Create;
    SaveBrush.Assign(Brush);
    Font.Name := 'Tahoma';
    Font.Style := [fsBold];
    // Maps font height into current used logical units
    Font.Height := asgPart.MapFontHeight(8);
    Font.Color := clWhite;

    ts := asgPart.PrintColOffset[0];
    tw := asgPart.PrintPagewidth;

    MoveTo(ts,-5);
    Brush.Color := clWhite;
    Rectangle(ts,-10,ts+tw,-asgPart.printsettings.headersize+10);
    Brush.Color := clSilver;
    FillRect(Rect(ts,-10,ts+textwidth(myowntitle)+25,-asgPart.printsettings.headersize+10));
    TextRect(Rect(ts,-10,ts+textwidth(myowntitle)+25,-asgPart.printsettings.headersize+10),
             ts+10,-19,myowntitle);
    Brush.Assign(SaveBrush);
    Font.Color := clBlack;
    Font.Height := self.asgPart.MapFontHeight(6);
    Font.Style := [fsItalic];
    TextOut(ts+textwidth(myowntitle)+120,-30,formatdatetime('MMM d, yyyy"-"HH:mm:ss',now));
    Font.Height := asgPart.MapFontHeight(11);
    Font.Style := [fsBold,fsItalic];
    TextOut(ts+tw-textwidth(reporttitle)-10,-17,reporttitle);
    Font.Assign(SaveFont);
    SaveBrush.Free;
    SaveFont.Free;
  end;

end;

procedure TfrmItemKelola.asgPartPrintSetColumnWidth(Sender: TObject;
  ACol: Integer; var Width: Integer);
begin
//  if ACol = colSeq+1 then Width :=-20;
  {colSeq,colSeq+1}
   case ACol of
   //  colNo : Width := asgPart.ColWidths[ACol];
     colSeq,colSeq+1: Width := -20;
   end;
end;

procedure TfrmItemKelola.asgPartGetCellPrintColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if Arow in [0] then AFont.Style := [fsBold];
  if Arow = 0 then begin
    AFont.Style := [fsBold];
    ABrush.Color := clSilver;
  end;
  if ACol = colSeq then
    AFont.Color := clWhite;
end;

procedure TfrmItemKelola.ReloadGrid(Arow,AItemId:integer;isAdd:boolean);
var i,vRow: integer;
  ItemAr  : TItems_Arr;
  procedure SetFilter;
  begin
    ItemAr.Filter.Reset;
    ItemAr.Filter.ItemId := AItemId;
    ItemAr.Filter.ItemType := ITEM_TYPE_PART;

    if txtFilterKode.Text <> '' then
      ItemAr.Filter.ItemCode := txtFilterKode.Text;
    if txtFilterNama.Text <> '' then
      ItemAr.Filter.ItemName := txtFilterNama.Text;
    if txtKendaraan.Text <> '' then
      ItemAr.Filter.UserInsert := txtKendaraan.Text;//dipake buat filter kendaraan
  end;

begin
  ItemAr:= TItems_Arr.Create;
  if (Arow = 0) and (not isAdd) then
    InitGrid;
  if isAdd then begin
    asgPart.AddRow;
    Arow := asgPart.RowCount-1;
  end;


  SetFilter;
  totalHalamanPart := ItemAr.countOnDb(isAdd) div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halamanPart)+' dari '+FloatToStr(totalHalamanPart);
  ItemAr.FindOnDB((isAdd) or (AItemId>0),txtLimit.IntValue,((halamanPart-1)*txtLimit.IntValue));

  frmMainMenu.Gauge.Show;
  for i:= 0 to ItemAr.Count-1 do begin
    frmMainMenu.Gauge.Progress := round((i+1)/(ItemAr.Count)*100);
    vRow := IfThen(Arow=0,asgPart.RowCount-1,Arow);
    asgPart.Ints[colNo,vRow] := (i+1)+((halamanPart-1)*txtLimit.IntValue);
    asgPart.Cells[colCode, vRow]:= ItemAr[i].ItemCode;
    asgPart.Cells[colName, vRow]:= ItemAr[i].ItemName;
    asgPart.Cells[colUNit, vRow]:= ItemAr[i].UsedUnit;
    asgPart.Cells[colNotes,vRow]:= ItemAr[i].Notes;
    asgPart.Cells[colKendaraan,vRow]:= TMotor.getName(ItemAr[i].CarId);
    asgPart.Floats[colLimit, vRow]:= ItemAr[i].StokLimit;
    asgPart.Ints[colSeq,   vRow]:= ItemAr[i].ItemId;
    if Arow = 0 then
      asgPart.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  if Arow = 0 then
    DeleteRowTerakhir(asgPart,2,1);
  ArrangeColSize;
  ItemAr.Free;
end;

procedure TfrmItemKelola.InitFilter;
begin
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
      halamanPart := 1;totalHalamanPart :=0;
      txtFilterKode.Clear;
      txtFilterNama.Clear;
      txtKendaraan.Clear;

    end;
    TAB_OIL : begin
      halamanOli := 1;totalHalamanOli :=0;
      txtKodeOil.Clear;
      txtNamaOil.Clear;
      txtKendaraanOil.Clear;
    end;
    TAB_SERVICE : begin
      halamanService := 1;totalHalamanService :=0;
      txtKodeService.Clear;
      txtNamaService.Clear;
    end;
    TAB_OTHERS : begin
      halamanOther := 1;totalHalamanOther :=0;
      txtKodeOthers.Clear;
      txtNamaOther.Clear;
    end;
  end;
  txtLimit.IntValue := 25;
  txtLimitOli.IntValue := 25;
  txtLimitService.IntValue := 25;
  txtLimitOther.IntValue := 25;
end;

procedure TfrmItemKelola.btnResetClick(Sender: TObject);
begin
  InitFilter;
end;

procedure TfrmItemKelola.btnLoadClick(Sender: TObject);
begin
   if (txtFilterKode.Text = '') and (txtFilterNama.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;
  spdFirst.Enabled:= False;
  spdPrev.Enabled:= False;
  halamanPart := 1;
  totalHalamanPart :=0;
  ReloadGrid(0,0,False);
  spdNext.Enabled:= (halamanPart< totalHalamanPart);
    spdLast.Enabled:= (halamanPart< totalHalamanPart);
end;

procedure TfrmItemKelola.asgPartDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow <> 0 then
    btnEditPart.Click;
end;

procedure TfrmItemKelola.btnFilterClick(Sender: TObject);
begin
{ if btnFilter.Caption = 'Perlihatkan &Filter' then begin
     btnFilter.Caption := 'Sembunyikan &Filter';
  end
  else
  begin
    btnFilter.Caption := 'Perlihatkan &Filter';
  end;}
end;

procedure TfrmItemKelola.asgPartRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (ARow  = 0) or (ACol=0) then exit;
  if GlobalSystemUser.AccessLevel < LEVEL_OWNER then exit;
  if pgcMain.ActivePageIndex = TAB_PART then
    EditTipe1.Caption := 'Edit Tipe Part Jadi Oli'
  else
    EditTipe1.Caption := 'Edit Tipe Oli Jadi Part';
  PopupMenu2.Popup(Mouse.CursorPos.x,Mouse.CursorPos.Y);
end;

procedure TfrmItemKelola.HapusData1Click(Sender: TObject);
var vResult : boolean;
begin
  vResult := True;
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
     if Confirmed('Apakah Data Item '+asgPart.Cells[colname,asgPart.Row]+' akan dihapus') then
      vResult := TItems.Hapus(asgPart.Ints[colSeq,asgPart.row]);
      if vResult then
        deleterow(asgPart,asgPart.Row,colCode);
    end;
    TAB_OIL : begin
     if Confirmed('Apakah Data Oli '+asgOli.Cells[colname,asgOli.Row]+' akan dihapus') then
      vResult := TItems.Hapus(asgOli.Ints[colOId,asgOli.row]);
      if vResult then
        deleterow(asgOli,asgOli.Row,colCode);

    end;
    TAB_SERVICE : begin
     if Confirmed('Apakah Data Service '+asgService.Cells[colSname,asgService.Row]+' akan dihapus') then
      vResult := TServices.Hapus(asgService.Ints[colSId,asgService.row]);
      if vResult then
        deleterow(asgService,asgService.Row,colCode);
      if not vResult then
         Alert('Data Item ini sudah ada pada transaksi, sehingga tidak bisa dihapus')
    end;
    TAB_OTHERS : begin
     if Confirmed('Apakah Data Service Lain-lain '+asgOthers.Cells[colSname,asgPart.Row]+' akan dihapus') then
      vResult := TServices.Hapus(asgOthers.Ints[colSId,asgOthers.row]);
      if vResult then
        deleterow(asgOthers,asgOthers.Row,colCode);
      if not vResult then
     Alert('Data Item ini sudah ada pada transaksi, sehingga tidak bisa dihapus')
    end;
  end;
  //if not vResult then
//     Alert('Data Item ini sudah ada pada transaksi, sehingga tidak bisa dihapus')
  //else
    ArrangeColSize;
end;

procedure TfrmItemKelola.btnAddPartClick(Sender: TObject);
begin
   if frmItemAdd.Execute(ITEM_TYPE_PART,0) then  begin
//     asgPart.AddRow;asgPart.RowCount-1
     ReloadGrid(0,TItems.getMaxId,True);
  end;
end;

procedure TfrmItemKelola.btnEditPartClick(Sender: TObject);
begin
  if asgPart.Row = 0 then exit;
   if frmItemAdd.Execute(ITEM_TYPE_PART, asgPart.Ints[colSeq,asgPart.Row]) then
     ReloadGrid(asgPart.Row,asgPart.Ints[colSeq,asgPart.Row],False);

end;

procedure TfrmItemKelola.btnOkClick(Sender: TObject);
begin
   ReloadGrid(0,0,False);
end;

procedure TfrmItemKelola.ReloadService(Arow,AServId:integer;isAdd:boolean);
var i,vRow: integer;
   ServiceAr: TServices_Arr;

   procedure SetFilter;
   begin
     with ServiceAr.Filter do begin
       ServiceType := SERVICE_TYPE_SINGLE;
       ServiceId  := AServId;
       ServiceCode := txtKodeService.Text;
       ServiceName := txtNamaService.Text;
     end;
   end;

begin
  ServiceAr := TServices_Arr.Create;

  SetFilter;

  if (Arow = 0) and (not isAdd) then
    InitGrid;
  if isAdd then begin
    asgService.AddRow;
    Arow := asgService.RowCount-1;
  end;
  totalHalamanService := ServiceAr.countOnDb(SERVICE_TYPE_PACKAGE,isAdd) div  txtLimitService.IntValue + 1;
  lblHalService.Caption := 'Halaman : '+FloatToStr(halamanService)+' dari '+FloatToStr(totalHalamanService);
  ServiceAr.FindOnDB(SERVICE_TYPE_PACKAGE,(isAdd) or (AServId>0),txtLimitService.IntValue,((halamanService-1)*txtLimitService.IntValue));
  //SetFilter;
  frmMainMenu.Gauge.Show;
  for i:= 0 to ServiceAr.Count-1 do begin
    vRow := IfThen(Arow=0,asgService.RowCount-1,Arow);

    frmMainMenu.Gauge.Progress := round((i+1)/(ServiceAr.Count)*100);
    asgService.Ints[colNo,vRow] := (i+1)+((halamanService-1)*txtLimitService.IntValue);
    asgService.Cells[colSCode,   vRow]:= ServiceAr[i].ServiceCode;
    asgService.Cells[colSName,   vRow]:= ServiceAr[i].ServiceName;
    asgService.Cells[colSType,   vRow]:= IfThen(ServiceAr[i].ServiceType=SERVICE_TYPE_SINGLE,'Reguler','Paket');
    asgService.Floats[colSPrice, vRow]:= ServiceAr[i].Price;
    asgService.Ints[colSId,     vRow] := ServiceAr[i].ServiceId;
    if Arow = 0 then
      asgService.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  if Arow = 0 then
    DeleteRowTerakhir(asgService,2,1);

  ServiceAr.Free;
  ArrangeColSize;
end;

procedure TfrmItemKelola.btnPrintServiceClick(Sender: TObject);
begin
  Application.CreateForm(TqrpService,qrpService);
  qrpService.ExecuteGrid(asgService,SERVICE_TYPE_SINGLE);
  qrpService.Free;
end;

procedure TfrmItemKelola.btnAddServiceClick(Sender: TObject);
begin
  if frmServicePkgAdd.Execute(SERVICE_TYPE_SINGLE,0) then begin
//    asgService.AddRow;
    ReloadService(0,TServices.getMaxID,True);
  end;
end;

procedure TfrmItemKelola.btnEditServiceClick(Sender: TObject);
begin
  if asgService.Row = 0 then exit;
  if frmServicePkgAdd.Execute(SERVICE_TYPE_SINGLE,asgService.Ints[colSID,asgService.Row]) then
    ReloadService(asgService.Row,asgService.Ints[colSID,asgService.Row],False);
end;

procedure TfrmItemKelola.btnRefreshServiceClick(Sender: TObject);
begin
   spdFirstService.Enabled:= False;
  spdPrevService.Enabled:= False;
  halamanService := 1;
  totalHalamanService :=0;
   ReloadService(0,0,False);
   spdNextService.Enabled:= (halamanService< totalHalamanService);
    spdLastService.Enabled:= (halamanService< totalHalamanService);
end;

procedure TfrmItemKelola.pgcMainChange(Sender: TObject);
begin
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
      frmMainMenu.lblJudul.Caption := 'Data Part';
      txtFilterKode.SetFocus;
      //ReloadGrid(0,0,False);
    end;
    TAB_SERVICE : begin
      frmMainMenu.lblJudul.Caption := 'Data Service';
      txtKodeService.SetFocus;
      //ReloadService(0,0,False);
    end;
    TAB_OIL : begin
      frmMainMenu.lblJudul.Caption := 'Data Oli';
      txtKodeOil.SetFocus;
      //ReloadOil(0,0,False);
    end;
    TAB_OTHERS : begin
      frmMainMenu.lblJudul.Caption := 'Data Service Lain-lain';
      txtKodeOthers.SetFocus;
      //ReloadOther(0,0,False);
    end;
  end;
  InitFilter;
end;

procedure TfrmItemKelola.asgServiceGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
  else if ACol in [colSPrice] then
    HAlign := taRightJustify;
end;

procedure TfrmItemKelola.ReloadOil(Arow,AItemId:integer;isAdd:boolean);
var i,vRow: integer;
  ItemAr  : TItems_Arr;
  procedure SetFilter;
  begin
    ItemAr.Filter.Reset;
    ItemAr.Filter.ItemId := AItemId;

    if txtKodeOil.Text <> '' then
      ItemAr.Filter.ItemCode := txtKodeOil.Text;
    if txtNamaOil.Text <> '' then
      ItemAr.Filter.ItemName := txtNamaOil.Text;
    if txtKendaraanOil.Text <> '' then
      ItemAr.Filter.UserInsert := txtKendaraanOil.Text;//dipake buat filter kendaraan
  end;

begin
  ItemAr:= TItems_Arr.Create;
  if (Arow = 0) and (not isAdd) then
    InitGrid;

  if isAdd then begin
    asgOli.AddRow;
    Arow := asgOli.RowCount-1;
  end;

  SetFilter;

  ItemAr.Filter.ItemType := ITEM_TYPE_OIL;
  totalHalamanOli := ItemAr.countOnDb(isAdd) div  txtLimitOli.IntValue + 1;
  lblHalOli.Caption := 'Halaman : '+FloatToStr(halamanOli)+' dari '+FloatToStr(totalHalamanOli);
  ItemAr.FindOnDB((isAdd) or (AItemId>0),txtLimitOli.IntValue,((halamanOli-1)*txtLimitOli.IntValue));
//  ItemAr.FindOnDB(isAdd);
  frmMainMenu.Gauge.Show;
  for i:= 0 to ItemAr.Count-1 do begin
    frmMainMenu.Gauge.Progress := round((i+1)/(ItemAr.Count)*100);
    vRow := IfThen(Arow=0,asgOli.RowCount-1,Arow);
    asgOli.Cells[colOCode, vRow]:= ItemAr[i].ItemCode;
    asgOli.Cells[colOName, vRow]:= ItemAr[i].ItemName;
    asgOli.Cells[colOUNit, vRow]:= ItemAr[i].UsedUnit;
    asgOli.Cells[colONotes,vRow]:= ItemAr[i].Notes;
    asgPart.Cells[colOKendaraan,vRow]:= TMotor.getName(ItemAr[i].CarId);
    asgOli.Floats[colOLimit, vRow]:= ItemAr[i].StokLimit;
    asgOli.Ints[colOId,   vRow]:= ItemAr[i].ItemId;
    if Arow = 0 then
      asgOli.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  if Arow = 0 then
    DeleteRowTerakhir(asgOli,2,1);
  ArrangeColSize;
  ItemAr.Free;

end;

procedure TfrmItemKelola.btnRefreshOilClick(Sender: TObject);
begin
  if (txtNamaOil.Text = '') and (txtKodeOil.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;
  spdFirstOli.Enabled:= False;
  spdPrevOli.Enabled:= False;
  halamanOli := 1;
  totalHalamanOli :=0;
  ReloadOil(0,0,False);
  spdNextOli.Enabled:= (halamanOli< totalHalamanOli);
  spdLastOli.Enabled:= (halamanOli< totalHalamanOli);
end;

procedure TfrmItemKelola.btnAddOilClick(Sender: TObject);
begin
   if frmItemAdd.Execute(ITEM_TYPE_OIL,0) then begin
//     asgOli.AddRow;
     ReloadOil(0,TItems.getMaxId,True);
   end;
end;

procedure TfrmItemKelola.btnEditOilClick(Sender: TObject);
begin
   if asgOli.Row = 0 then exit;
   if frmItemAdd.Execute(ITEM_TYPE_OIL, asgOli.Ints[colOId,asgOli.Row]) then
     ReloadOil(asgOli.Row,asgOli.Ints[colOId,asgOli.Row],False);
end;

procedure TfrmItemKelola.asgOliGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colOLimit] then
    HAlign := taRightJustify;
end;

procedure TfrmItemKelola.btnPrintOilClick(Sender: TObject);
begin
  Application.CreateForm(TqrpItem,qrpItem);
  qrpItem.ExecuteGrid(ITEM_TYPE_OIL, asgOli);
  qrpItem.Free;
end;

procedure TfrmItemKelola.ReloadOther(Arow,AServId:integer;isAdd:boolean);
var i,vRow: integer;
   ServiceAr: TServices_Arr;

   procedure SetFilter;
   begin
     with ServiceAr.Filter do begin
       ServiceType := SERVICE_TYPE_OTHERS;
       ServiceId  := AServId;
       ServiceCode := txtKodeService.Text;
       ServiceName := txtNamaService.Text;
     end;
   end;
begin
  if (Arow = 0) and (not isAdd) then
    InitGrid;
  if isAdd then begin
    asgOthers.AddRow;
    Arow := asgOthers.RowCount-1;
  end;

  ServiceAr := TServices_Arr.Create;
  SetFilter;
  ServiceAr.FindOnDB('',(isAdd) or (AServId>0));
  frmMainMenu.Gauge.Show;
  for i:= 0 to ServiceAr.Count-1 do begin
    frmMainMenu.Gauge.Progress := round((i+1)/(ServiceAr.Count)*100);
    vRow := IfThen(Arow=0,asgOthers.RowCount-1,Arow);
    asgOthers.Cells[colSCode,   vRow]:= ServiceAr[i].ServiceCode;
    asgOthers.Cells[colSName,   vRow]:= ServiceAr[i].ServiceName;
    asgOthers.Cells[colSType,   vRow]:= 'Lain-lain';
    asgOthers.Floats[colSPrice, vRow]:= ServiceAr[i].Price;
    asgOthers.Ints[colSId,     vRow]:= ServiceAr[i].ServiceId;
    if Arow = 0 then
      asgOthers.AddRow
  end;
  frmMainMenu.Gauge.Hide;
  if Arow = 0 then
    DeleteRowTerakhir(asgOthers,2,1);
  ServiceAr.Free;
  ArrangeColSize;

end;

procedure TfrmItemKelola.btnPrintOthersClick(Sender: TObject);
begin
   Application.CreateForm(TqrpService,qrpService);
  qrpService.ExecuteGrid(asgOthers,SERVICE_TYPE_OTHERS);
  qrpService.Free;
end;

procedure TfrmItemKelola.btnNewOthersClick(Sender: TObject);
begin
  if frmServiceAdd.Execute(SERVICE_TYPE_OTHERS,0) then begin
  //  asgOthers.AddRow;
    ReloadOther(0,TServices.getMaxID,True);
  end;
end;

procedure TfrmItemKelola.btnRefreshOtherClick(Sender: TObject);
begin
  spdFirstOther.Enabled:= False;
  spdPrevOther.Enabled:= False;
  halamanOther := 1;
  totalHalamanOther :=0;
  ReloadOther(0,0,False);
  spdNextOther.Enabled:= (halamanOther< totalHalamanOther);
    spdLastOther.Enabled:= (halamanOther< totalHalamanOther);
end;

procedure TfrmItemKelola.btnEditOthersClick(Sender: TObject);
begin
  if asgOthers.Row = 0 then exit;
  if frmServiceAdd.Execute(SERVICE_TYPE_OTHERS,asgOthers.Ints[colSID,asgOthers.Row]) then
    ReloadOther(asgOthers.Row,asgOthers.Ints[colSID,asgOthers.Row],False);
End;

procedure TfrmItemKelola.btnFilterPartClick(Sender: TObject);
begin
   SetFilterSize(pnlFilter,btnFilterPart,75);
end;

procedure TfrmItemKelola.btnFilterOilClick(Sender: TObject);
begin
  SetFilterSize(pnlFilterOil,btnFilterOil,75);
end;

procedure TfrmItemKelola.btnFilterOtherClick(Sender: TObject);
begin
  SetFilterSize(pnlFilterOther,btnFilterOther,75);
end;

procedure TfrmItemKelola.btnFilterServiceClick(Sender: TObject);
begin
    SetFilterSize(pnlFilterService,btnFilterService,75);
end;

procedure TfrmItemKelola.HapusData2Click(Sender: TObject);
begin
  HapusData1.Click;
end;

procedure TfrmItemKelola.asgServiceRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (ARow  = 0) or (ACol=0) then exit;
  //DITUTUP chan 20.10.11
 // if GlobalSystemUser.AccessLevel < LEVEL_OWNER then exit;
  PopupMenu1.Popup(Mouse.CursorPos.x,Mouse.CursorPos.Y);
end;

procedure TfrmItemKelola.EditTipe1Click(Sender: TObject);
var vItem : TItems;
begin
  vItem := TItems.Create;
  case pgcMain.ActivePageIndex of
    TAB_PART : begin
       vItem.ItemType := ITEM_TYPE_OIL;
       vItem.ItemId   := asgPart.Ints[colSeq,asgPart.Row];
       if vItem.UpdateTipe then begin
         asgPart.RemoveRows(asgPart.Row,1);
         ArrangeColSize;
       end;
    end;
    TAB_OIL : begin
       vItem.ItemType := ITEM_TYPE_PART;
       vItem.ItemId   := asgOli.Ints[colOID,asgOli.Row];
       if vItem.UpdateTipe then begin
         asgOli.RemoveRows(asgOli.Row,1);
         ArrangeColSize;
       end;
    end;
  end;
  vItem.Free;
end;

procedure TfrmItemKelola.spdFirstClick(Sender: TObject);
begin
  case pgcMain.ActivePageIndex of
  TAB_PART : begin
    txtLimit.Tag:= 0;
    spdFirst.Enabled:= False;
    spdPrev.Enabled:= False;
    spdNext.Enabled:= True;
    spdLast.Enabled:= True;
    halamanPart := 1;
   lblHal.Caption:= 'Halaman: ' + IntToStr(halamanPart)+ ' dari '+IntToStr(totalHalamanPart);
  //  lblHal.Caption:= 'Halaman: 1';
    ReloadGrid(0,0,False);
  end;
  TAB_OIL : begin
    txtLimitOli.Tag:= 0;
    spdFirstOli.Enabled:= False;
    spdPrevOli.Enabled:= False;
    spdNextOli.Enabled:= True;
    spdLastOli.Enabled:= True;
    halamanOli := 1;
   lblHalOli.Caption:= 'Halaman: ' + IntToStr(halamanOli)+ ' dari '+IntToStr(totalHalamanOli);
  //  lblHal.Caption:= 'Halaman: 1';
    ReloadOil(0,0,False);
  end;
  TAB_SERVICE : begin
    txtLimitService.Tag:= 0;
    spdFirstService.Enabled:= False;
    spdPrevService.Enabled:= False;
    spdNextService.Enabled:= True;
    spdLastService.Enabled:= True;
    halamanService := 1;
   lblHalService.Caption:= 'Halaman: ' + IntToStr(halamanService)+ ' dari '+IntToStr(totalHalamanService);
  //  lblHal.Caption:= 'Halaman: 1';
    ReloadService(0,0,False);
  end;
  TAB_OTHERS : begin
    txtLimitOther.Tag:= 0;
    spdFirstOther.Enabled:= False;
    spdPrevOther.Enabled:= False;
    spdNextOther.Enabled:= True;
    spdLastOther.Enabled:= True;
    halamanOther := 1;
   lblHalOther.Caption:= 'Halaman: ' + IntToStr(halamanOther)+ ' dari '+IntToStr(totalHalamanOther);
  //  lblHal.Caption:= 'Halaman: 1';
    ReloadOther(0,0,False);
  end;
  end;

end;

procedure TfrmItemKelola.spdPrevClick(Sender: TObject);
begin
//txtLimit.Tag:= txtLimit.Tag - txtLimit.IntValue;
  case pgcMain.ActivePageIndex of
  TAB_PART : begin
    dec(halamanPart);
    spdFirst.Enabled:= halamanPart > 1;
    spdPrev.Enabled:= halamanPart > 1;
    spdNext.Enabled:= True;
    spdLast.Enabled:= True;
   // lblHal.Caption:= 'Halaman: ' + IntToStr((txtLimit.Tag + txtLimit.IntValue) div txtLimit.IntValue);
     lblHal.Caption:= 'Halaman: ' + IntToStr(halamanPart)+ ' dari '+IntToStr(totalHalamanPart);
    ReloadGrid(0,0,False);
  end;
  TAB_OIL : begin
    dec(halamanOli);
    spdFirstOli.Enabled:= halamanOli > 1;
    spdPrevOli.Enabled:= halamanOli > 1;
    spdNextOli.Enabled:= True;
    spdLastOli.Enabled:= True;
   // lblHal.Caption:= 'Halaman: ' + IntToStr((txtLimit.Tag + txtLimit.IntValue) div txtLimit.IntValue);
     lblHalOli.Caption:= 'Halaman: ' + IntToStr(halamanOli)+ ' dari '+IntToStr(totalHalamanOli);
    ReloadOil(0,0,False);
  end;
  TAB_SERVICE : begin
    dec(halamanService);
    spdFirstService.Enabled:= halamanService > 1;
    spdPrevService.Enabled:= halamanService > 1;
    spdNextService.Enabled:= True;
    spdLastService.Enabled:= True;
   // lblHal.Caption:= 'Halaman: ' + IntToStr((txtLimit.Tag + txtLimit.IntValue) div txtLimit.IntValue);
     lblHalService.Caption:= 'Halaman: ' + IntToStr(halamanService)+ ' dari '+IntToStr(totalHalamanService);
    ReloadService(0,0,False);
  end;
  TAB_OTHERS : begin
    dec(halamanOther);
    spdFirstOther.Enabled:= halamanOther > 1;
    spdPrevOther.Enabled:= halamanOther > 1;
    spdNextOther.Enabled:= True;
    spdLastOther.Enabled:= True;
   // lblHal.Caption:= 'Halaman: ' + IntToStr((txtLimit.Tag + txtLimit.IntValue) div txtLimit.IntValue);
     lblHalOther.Caption:= 'Halaman: ' + IntToStr(halamanOther)+ ' dari '+IntToStr(totalHalamanOther);
    ReloadOther(0,0,False);
  end;
  end;//end case
end;

procedure TfrmItemKelola.spdNextClick(Sender: TObject);
begin
  case pgcMain.ActivePageIndex of
  TAB_PART : begin
    inc(halamanPart);
    spdFirst.Enabled:= True;
    spdPrev.Enabled:= True;
    lblHal.Caption:= 'Halaman: ' + IntToStr(halamanPart)+ ' dari '+IntToStr(totalHalamanPart);
    spdNext.Enabled:= (halamanPart< totalHalamanPart);
    spdLast.Enabled:= (halamanPart< totalHalamanPart);
    ReloadGrid(0,0,false);
  end;
  TAB_OIL : begin
    inc(halamanOli);
    spdFirstOli.Enabled:= True;
    spdPrevOli.Enabled:= True;
    lblHalOli.Caption:= 'Halaman: ' + IntToStr(halamanOli)+ ' dari '+IntToStr(totalHalamanOli);
    spdNextOli.Enabled:= (halamanOli< totalHalamanOli);
    spdLastOli.Enabled:= (halamanOli< totalHalamanOli);
    ReloadOil(0,0,false);
  end;
  TAB_SERVICE : begin
    inc(halamanService);
    spdFirstService.Enabled:= True;
    spdPrevService.Enabled:= True;
    lblHalService.Caption:= 'Halaman: ' + IntToStr(halamanService)+ ' dari '+IntToStr(totalHalamanService);
    spdNextService.Enabled:= (halamanService< totalHalamanService);
    spdLastService.Enabled:= (halamanService< totalHalamanService);
    ReloadService(0,0,false);
  end;
  TAB_OTHERS : begin
    inc(halamanOther);
    spdFirstOther.Enabled:= True;
    spdPrevOther.Enabled:= True;
    lblHalOther.Caption:= 'Halaman: ' + IntToStr(halamanOther)+ ' dari '+IntToStr(totalHalamanOther);
    spdNextOther.Enabled:= (halamanOther< totalHalamanOther);
    spdLastOther.Enabled:= (halamanOther< totalHalamanOther);
    ReloadOther(0,0,false);
  end;
  end;//end part  

end;

procedure TfrmItemKelola.spdLastClick(Sender: TObject);
begin
  case pgcMain.ActivePageIndex of
  TAB_PART : begin
    spdFirst.Enabled:= True;
    spdPrev.Enabled:= True;
    spdNext.Enabled:= False;
    spdLast.Enabled:= False;
    halamanPart := totalHalamanPart;
    lblHal.Caption:= 'Halaman: ' + IntToStr(halamanPart)+ ' dari '+IntToStr(totalHalamanPart);
    ReloadGrid(0,0,False);
  end;
  TAB_OIL : begin
    spdFirstOli.Enabled:= True;
    spdPrevOli.Enabled:= True;
    spdNextOli.Enabled:= False;
    spdLastOli.Enabled:= False;
    halamanOli := totalHalamanOli;
    lblHalOli.Caption:= 'Halaman: ' + IntToStr(halamanOli)+ ' dari '+IntToStr(totalHalamanOli);
    ReloadOil(0,0,False);
  end;
  TAB_SERVICE : begin
    spdFirstService.Enabled:= True;
    spdPrevService.Enabled:= True;
    spdNextService.Enabled:= False;
    spdLastService.Enabled:= False;
    halamanService := totalHalamanService;
    lblHalService.Caption:= 'Halaman: ' + IntToStr(halamanService)+ ' dari '+IntToStr(totalHalamanService);
    ReloadService(0,0,False);
  end;
  TAB_OTHERS : begin
    spdFirstOther.Enabled:= True;
    spdPrevOther.Enabled:= True;
    spdNextOther.Enabled:= False;
    spdLastOther.Enabled:= False;
    halamanOther := totalHalamanOther;
    lblHalOther.Caption:= 'Halaman: ' + IntToStr(halamanOther)+ ' dari '+IntToStr(totalHalamanOther);
    ReloadOther(0,0,False);
  end;

  end;//end case

end;

end.
