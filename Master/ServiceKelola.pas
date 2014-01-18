unit ServiceKelola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, asgprev, StdCtrls, AdvEdit, ComCtrls, Grids, BaseGrid, AdvGrid, Math, strUtils,
  Buttons, ExtCtrls, WinXP,  UMaster, Menus;

type
  TfrmServiceKelola = class(TForm)
    WinXP1: TWinXP;
    MainPanel: TPanel;
    Panel1: TPanel;
    apd1: TAdvPreviewDialog;
    PopupMenu1: TPopupMenu;
    HapusData1: TMenuItem;
    pnlFilter: TPanel;
    Label11: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    cmbFilterType: TComboBox;
    btnReset: TButton;
    btnLoad: TButton;
    txtFilterNama: TAdvEdit;
    txtFilterKode: TAdvEdit;
    StaticText4: TStaticText;
    asgRekap: TAdvStringGrid;
    btnPrint: TButton;
    btnEdit: TButton;
    btnAdd: TButton;
    btnOk: TButton;
    procedure asgRekapGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgRekapDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnResetClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure asgRekapPrintSetColumnWidth(Sender: TObject; ACol: Integer;
      var Width: Integer);
    procedure asgRekapPrintPage(Sender: TObject; Canvas: TCanvas; PageNr,
      PageXSize, PageYSize: Integer);
    procedure asgRekapGetCellPrintBorder(Sender: TObject; ARow,
      ACol: Integer; APen: TPen; var Borders: TCellBorders);
    procedure asgRekapGetCellPrintColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure HapusData1Click(Sender: TObject);
    procedure asgRekapRightClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    MasterPurpose : string;
    procedure ChangeSetting;
    procedure InitPanel;
    procedure InitForm;
    procedure InitGrid;
//    procedure SetFilter;
    procedure ArrangeColSize;
    procedure ReloadGrid;
  public
    function Execute(APurpose:string):boolean;
  end;

var
  frmServiceKelola: TfrmServiceKelola;

implementation

uses un_ryu, UConst, Subroutines, SQLServerConnections, AutoHotel,
  MainMenu, ServicePrint, ServiceAdd;

const
  colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colPrice  = 3;
//  colUnit  = 4;
  colSeq   = 4;

{$R *.dfm}

procedure TfrmServiceKelola.ArrangeColSize;
begin
  asgRekap.AutoSizeColumns(True,5);
  asgRekap.AutoNumberCol(colNo);
{  if MasterPurpose = SERVICE_TYPE_BIAYA then begin
    asgRekap.ColWidths[colUnit] :=0;
    asgRekap.ColWidths[colItem] :=0;
  end;}
  if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgRekap.ColWidths[colSeq]:= 0;

end;


function TfrmServiceKelola.Execute(APurpose:string): boolean;
begin
  MasterPurpose := APurpose;
  Result := True;
//   if not Can_Access(Self) then begin
 //   Alert(MSG_UNAUTHORISED_ACCESS);
 //   exit;
 // end;
  Result := True;
  pnlFilter.Height := 0;
  InitForm;
  ReloadGrid;
  Run(Self);
end;

procedure TfrmServiceKelola.InitForm;
begin
  InitGrid;
  ReloadGrid;
  InitPanel;
end;

procedure TfrmServiceKelola.InitGrid;
var vPurpose : string;
begin
  vPurpose := IfThen(MasterPurpose=SERVICE_TYPE_SINGLE,'Jasa','Biaya');
  ResetGrid(asgRekap,2,7,1,1);
  with asgRekap do begin
    Cells[colNo,    0] := 'No.';
    Cells[colCode,  0] := 'Kode '+vPurpose;
    Cells[colName,  0] := 'Nama '+vPurpose;
    Cells[colPrice, 0] := 'Harga';
//    Cells[colUnit,  0] := 'Unit';
    Cells[colSeq,   0] := 'Sequence';
  end;
  ArrangeColSize;
end;

procedure TfrmServiceKelola.InitPanel;
begin

//media input

//media Filter
  txtFilterKode.Clear;
  txtFilterNama.Clear;
  cmbFilterType.ItemIndex:= 0;

  cmbFilterType.Text:= '';


  ChangeSetting;
end;


procedure TfrmServiceKelola.ReloadGrid;
var i: integer;
   ServiceAr: TServices_Arr;
begin
  InitGrid;
  //SetFilter;

  ServiceAr := TServices_Arr.Create;
  ServiceAr.Filter.ServiceType := MasterPurpose;
  ServiceAr.FindOnDB;
  frmMainMenu.Gauge.Show;
  for i:= 0 to ServiceAr.Count-1 do begin
    frmMainMenu.Gauge.Progress := round((i+1)/(ServiceAr.Count)*100);
    asgRekap.Cells[colCode,   i+1]:= ServiceAr[i].ServiceCode;
    asgRekap.Cells[colName,   i+1]:= ServiceAr[i].ServiceName;
    asgRekap.Floats[colPrice, i+1]:= ServiceAr[i].Price;
    asgRekap.Ints[colSeq,     i+1]:= ServiceAr[i].ServiceId;
    asgRekap.AddRow
  end;
  frmMainMenu.Gauge.Hide;
  DeleteRowTerakhir(asgRekap,2,1);
  asgRekap.AutoSizeColumns(True, 5);
  ServiceAr.Free;
  ArrangeColSize;
end;


procedure TfrmServiceKelola.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
//  else if ACol in[ colPrice] then HAlign:= taRightJustify;
end;

procedure TfrmServiceKelola.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow <> 0 then
    btnEdit.Click
end;

procedure TfrmServiceKelola.ChangeSetting;
begin
end;

procedure TfrmServiceKelola.btnResetClick(Sender: TObject);
begin
  InitPanel
end;

procedure TfrmServiceKelola.btnLoadClick(Sender: TObject);
begin
  ReloadGrid
end;

procedure TfrmServiceKelola.btnPrintClick(Sender: TObject);
begin
 { asgRekap.PrintSettings.TitleLines.Clear;
  apd1.Grid := asgRekap;
  asgRekap.PrintSettings.TitleLines.Add('Daftar Service');
  apd1.Grid := asgRekap;
  apd1.Execute;}
  Application.CreateForm(TqrpService,qrpService);
  qrpService.Executes(MasterPurpose);
  qrpService.Free;
end;

procedure TfrmServiceKelola.asgRekapPrintSetColumnWidth(Sender: TObject;
  ACol: Integer; var Width: Integer);
begin
    if ACol in [colSeq,colSeq+1] then width := -20;
end;

procedure TfrmServiceKelola.asgRekapPrintPage(Sender: TObject;
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
  if asgRekap.PrintColStart <> 0 then
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
    Font.Height := asgRekap.MapFontHeight(8);
    Font.Color := clWhite;

    ts := asgRekap.PrintColOffset[0];
    tw := asgRekap.PrintPagewidth;

    MoveTo(ts,-5);
    Brush.Color := clWhite;
    Rectangle(ts,-10,ts+tw,-asgRekap.printsettings.headersize+10);
    Brush.Color := clSilver;
    FillRect(Rect(ts,-10,ts+textwidth(myowntitle)+25,-asgRekap.printsettings.headersize+10));
    TextRect(Rect(ts,-10,ts+textwidth(myowntitle)+25,-asgRekap.printsettings.headersize+10),
             ts+10,-19,myowntitle);
    Brush.Assign(SaveBrush);
    Font.Color := clBlack;
    Font.Height := self.asgRekap.MapFontHeight(6);
    Font.Style := [fsItalic];
    TextOut(ts+textwidth(myowntitle)+120,-30,formatdatetime('MMM d, yyyy"-"HH:mm:ss',now));
    Font.Height := asgRekap.MapFontHeight(11);
    Font.Style := [fsBold,fsItalic];
    TextOut(ts+tw-textwidth(reporttitle)-10,-17,reporttitle);
    Font.Assign(SaveFont);
    SaveBrush.Free;
    SaveFont.Free;
  end;

end;

procedure TfrmServiceKelola.asgRekapGetCellPrintBorder(Sender: TObject;
  ARow, ACol: Integer; APen: TPen; var Borders: TCellBorders);
var i : integer;
begin
  if Arow <> 0 then begin
    Borders := [cbLeft,cbRight];
    if ARow = asgRekap.RowCount-1 then begin
      for i := 0 to asgRekap.ColCount-1 do begin
        APen.Width := 2;
        Borders := [cbBottom,cbTop];
      end;
    end;
  end else begin
    for i := 0 to asgRekap.ColCount-1 do begin
      APen.Width := 2;
      Borders := [cbBottom,cbTop];
    end;
  end;

end;

procedure TfrmServiceKelola.asgRekapGetCellPrintColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
   if Arow in [0,asgRekap.RowCount-1] then AFont.Style := [fsBold];
  if Arow = 0 then begin
    AFont.Style := [fsBold];
    ABrush.Color := clSilver;
  end;
end;

procedure TfrmServiceKelola.HapusData1Click(Sender: TObject);
begin
  if Confirmed('Apakah Data Service '+asgRekap.Cells[colname,asgRekap.Row]+' akan dihapus') then
    if not TServices.Hapus(asgRekap.Ints[colSeq,asgRekap.row]) then
      Inform('Data service ini sudah ada pada transaksi, sehingga tidak bisa dihapus');
end;

procedure TfrmServiceKelola.asgRekapRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (ARow  = 0) or (ACol=0) then exit;
  if GlobalSystemUser.AccessLevel < LEVEL_ADMIN then exit;
  PopupMenu1.Popup(Mouse.CursorPos.x,Mouse.CursorPos.Y);
end;

procedure TfrmServiceKelola.btnAddClick(Sender: TObject);
begin
   frmServiceAdd.Execute(MasterPurpose,0);
end;

procedure TfrmServiceKelola.btnEditClick(Sender: TObject);
begin
  frmServiceAdd.Execute(MasterPurpose,asgRekap.Ints[colSeq,asgRekap.Row]);
end;

procedure TfrmServiceKelola.btnOkClick(Sender: TObject);
begin
   ReloadGrid;
end;

end.
