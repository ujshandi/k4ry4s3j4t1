unit MotorKelola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, asgprev, StdCtrls, AdvEdit, ComCtrls, Grids, BaseGrid, AdvGrid, Math, strUtils,
  Buttons, ExtCtrls, WinXP,  UMaster, Menus;

type
  TfrmMotorKelola = class(TForm)
    WinXP1: TWinXP;
    MainPanel: TPanel;
    apd1: TAdvPreviewDialog;
    PopupMenu1: TPopupMenu;
    HapusData1: TMenuItem;
    pgcMain: TPageControl;
    tbsMotor: TTabSheet;
    tbsGudang: TTabSheet;
    Panel1: TPanel;
    asgRekap: TAdvStringGrid;
    btnPrint: TButton;
    btnEdit: TButton;
    btnAdd: TButton;
    btnOk: TButton;
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
    Panel2: TPanel;
    asgGudang: TAdvStringGrid;
    btnPrintGudang: TButton;
    btnEditGudang: TButton;
    btnNewGudang: TButton;
    btnRefreshGudang: TButton;
    pnlFilterGudang: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Button5: TButton;
    Button6: TButton;
    AdvEdit1: TAdvEdit;
    AdvEdit2: TAdvEdit;
    StaticText1: TStaticText;
    CheckBox1: TCheckBox;
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
    procedure btnRefreshGudangClick(Sender: TObject);
    procedure btnNewGudangClick(Sender: TObject);
    procedure btnEditGudangClick(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure asgGudangGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
  private
    MasterPurpose : string;
    procedure InitPanel;
    procedure InitForm;
    procedure InitGrid;
//    procedure SetFilter;
    procedure ArrangeColSize;
    procedure ReloadGrid;
    procedure ReloadGudang;
  public
    function Execute(APurpose:string):boolean;
  end;

var
  frmMotorKelola: TfrmMotorKelola;

implementation

uses un_ryu, UConst, Subroutines, SQLServerConnections, AutoBengkel,
  MainMenu, ServicePrint, MotorAdd, GudangAdd, MotorPrint;

const
  colNo    = 0;
  colCode  = 1;
  colName  = 2;
  colYear  = 3;
  colSeq   = 4;

  colgNo = 0;
  colgCode = 1;
  colgName = 2;
  colgStatus = 3;
  colgId = 4;
  
  TAB_MOTOR = 0;
  TAB_GUDANG = 1;

{$R *.dfm}

procedure TfrmMotorKelola.ArrangeColSize;
begin
  CAse pgcMain.ActivePageIndex of
  TAB_MOTOR : begin
    asgRekap.AutoSizeColumns(True,5);
    asgRekap.AutoNumberCol(colNo);
    if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
        asgRekap.ColWidths[colSeq]:= 0;
  end;
  TAB_GUDANG : begin
    asgGudang.AutoSizeColumns(True,5);
    asgGudang.AutoNumberCol(colgNo);
    if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
        asgGudang.ColWidths[colgId]:= 0;
  end;
  end;
end;


function TfrmMotorKelola.Execute(APurpose:string): boolean;
begin
  MasterPurpose := APurpose;
  Result := True;
  if not Can_Access(Self) then begin
   Alert(MSG_UNAUTHORISED_ACCESS);
   exit;
  end;
  pgcMain.ActivePageIndex := TAB_MOTOR;
  Result := True;
  pnlFilter.Height := 0;
  pnlFilterGudang.Height := 0;
  InitForm;
  pgcMainChange(Self);
//  ReloadGrid;
  Run(Self);
end;

procedure TfrmMotorKelola.InitForm;
begin
  tbsGudang.TabVisible := False;
  InitGrid;
  ReloadGrid;
  InitPanel;
end;

procedure TfrmMotorKelola.InitGrid;
begin
  case pgcMain.ActivePageIndex of
  TAB_MOTOR : begin
    ResetGrid(asgRekap,2,6,1,1);
    with asgRekap do begin
      Cells[colNo,    0] := 'No.';
      Cells[colCode,  0] := 'Kode Kendaraan';
      Cells[colName,  0] := 'Nama Kendaraan';
      Cells[colYear, 0] := 'Tahun';
      Cells[colSeq,   0] := 'Sequence';
    end;
  end;
  TAB_GUDANG : begin
    ResetGrid(asgGudang,2,6,1,1);
    with asgGudang do begin
      Cells[colgNo,    0] := 'No.';
      Cells[colgCode,  0] := 'Kode Gudang';
      Cells[colgName,  0] := 'Nama Gudang';
      Cells[colgStatus, 0] := 'Status';
      Cells[colgId,   0] := 'Sequence';
    end;
  end;
  end;
    ArrangeColSize;
end;

procedure TfrmMotorKelola.InitPanel;
begin

//media input

//media Filter
  txtFilterKode.Clear;
  txtFilterNama.Clear;
  cmbFilterType.ItemIndex:= 0;

  cmbFilterType.Text:= '';


end;


procedure TfrmMotorKelola.ReloadGrid;
var i: integer;
   MotorAr: TMotor_Arr;
begin
  InitGrid;
  //SetFilter;

  MotorAr := TMotor_Arr.Create;
  //MotorAr.Filter.ServiceType := MasterPurpose;
  MotorAr.FindOnDB;
  frmMainMenu.Gauge.Show;
  for i:= 0 to MotorAr.Count-1 do begin
    frmMainMenu.Gauge.Progress := round((i+1)/(MotorAr.Count)*100);
    asgRekap.Cells[colCode,   i+1]:= MotorAr[i].MotorCode;
    asgRekap.Cells[colName,   i+1]:= MotorAr[i].MotorName;
    asgRekap.Floats[colYear, i+1]:= MotorAr[i].MotorYear;
    asgRekap.Ints[colSeq,     i+1]:= MotorAr[i].MotorId;
    asgRekap.AddRow
  end;
  frmMainMenu.Gauge.Hide;
  DeleteRowTerakhir(asgRekap,2,1);
  asgRekap.AutoSizeColumns(True, 5);
  MotorAr.Free;
  ArrangeColSize;
end;


procedure TfrmMotorKelola.asgRekapGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign := taCenter
//  else if ACol in[ colYear] then HAlign:= taRightJustify;
end;

procedure TfrmMotorKelola.asgRekapDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow <> 0 then
    btnEdit.Click
end;

procedure TfrmMotorKelola.btnResetClick(Sender: TObject);
begin
  InitPanel
end;

procedure TfrmMotorKelola.btnLoadClick(Sender: TObject);
begin
  ReloadGrid
end;

procedure TfrmMotorKelola.btnPrintClick(Sender: TObject);
begin
  Application.CreateForm(TqrpMotor,qrpMotor);
  qrpMotor.ExecuteGrid(MOTOR_TYPE,asgRekap);
  qrpMotor.Free;
 { asgRekap.PrintSettings.TitleLines.Clear;
  apd1.Grid := asgRekap;
  asgRekap.PrintSettings.TitleLines.Add('Daftar Service');
  apd1.Grid := asgRekap;
  apd1.Execute;}
{  Application.CreateForm(TqrpService,qrpService);
  qrpService.Executes(MasterPurpose);
  qrpService.Free;}
end;

procedure TfrmMotorKelola.asgRekapPrintSetColumnWidth(Sender: TObject;
  ACol: Integer; var Width: Integer);
begin
    if ACol in [colSeq,colSeq+1] then width := -20;
end;

procedure TfrmMotorKelola.asgRekapPrintPage(Sender: TObject;
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

procedure TfrmMotorKelola.asgRekapGetCellPrintBorder(Sender: TObject;
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

procedure TfrmMotorKelola.asgRekapGetCellPrintColor(Sender: TObject;
  ARow, ACol: Integer; AState: TGridDrawState; ABrush: TBrush;
  AFont: TFont);
begin
   if Arow in [0,asgRekap.RowCount-1] then AFont.Style := [fsBold];
  if Arow = 0 then begin
    AFont.Style := [fsBold];
    ABrush.Color := clSilver;
  end;
end;

procedure TfrmMotorKelola.HapusData1Click(Sender: TObject);
begin
  if Confirmed('Apakah Data Service '+asgRekap.Cells[colname,asgRekap.Row]+' akan dihapus') then
    if not TServices.Hapus(asgRekap.Ints[colSeq,asgRekap.row]) then
      Inform('Data service ini sudah ada pada transaksi, sehingga tidak bisa dihapus');
end;

procedure TfrmMotorKelola.asgRekapRightClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if (ARow  = 0) or (ACol=0) then exit;
  if GlobalSystemUser.AccessLevel < LEVEL_ADMIN then exit;
  PopupMenu1.Popup(Mouse.CursorPos.x,Mouse.CursorPos.Y);
end;

procedure TfrmMotorKelola.btnAddClick(Sender: TObject);
begin
   frmMotorAdd.Execute(MasterPurpose,0);
end;

procedure TfrmMotorKelola.btnEditClick(Sender: TObject);
begin
  frmMotorAdd.Execute(MasterPurpose,asgRekap.Ints[colSeq,asgRekap.Row]);
end;

procedure TfrmMotorKelola.btnOkClick(Sender: TObject);
begin
   ReloadGrid;
end;

procedure TfrmMotorKelola.ReloadGudang;
var vGudangArr : TWarehouse_Arr;
   i:integer;
begin
  vGudangArr := TWarehouse_Arr.Create;
  InitGrid;
  vGudangArr.FindOnDb;
  for i:= 0 to vGudangArr.Count-1 do
    with asgGudang do begin
      Cells[colgCOde,i+1] := vGudangArr[i].WhCode;
      Cells[colgName,i+1] := vGudangArr[i].WhName;
      AddCheckBox(colgStatus,i+1,False,False);
      SetCheckBoxState(colgStatus,i+1,vGudangArr[i].IsActive);
      Ints[colgId,i+1] := vGudangArr[i].WhId;
      AddRow;
    end;
  DeleteRowTerakhir(asgGudang,2,1);
  ArrangeColSize;  
  vGudangArr.Free;
end;

procedure TfrmMotorKelola.btnRefreshGudangClick(Sender: TObject);
begin
   ReloadGudang;
end;

procedure TfrmMotorKelola.btnNewGudangClick(Sender: TObject);
begin
  frmGudangAdd.Execute(0);
  ReloadGudang;
end;

procedure TfrmMotorKelola.btnEditGudangClick(Sender: TObject);
begin
  If asgGudang.row = 0 then exit;
  if asgGudang.Ints[colgId,asgGudang.Row] = 0 then exit;
  frmGudangAdd.Execute(asgGudang.Ints[colgId,asgGudang.Row]);
  ReloadGudang;
end;

procedure TfrmMotorKelola.pgcMainChange(Sender: TObject);
begin
  case pgcMain.ActivePageIndex of
   TAB_MOTOR : begin
     ReloadGrid;
     frmMainMenu.lblJudul.Caption := 'Data Kendaraan';
   end;

   TAB_GUDANG: begin
     ReloadGudang;
     frmMainMenu.lblJudul.Caption := 'Data Gudang';
   end;
  end;
end;

procedure TfrmMotorKelola.asgGudangGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
 if ARow = 0 then
   HAlign := taCenter
 else if ACol in [colgStatus] then
   HAlign := taCenter;
end;

end.
