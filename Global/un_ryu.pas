unit un_ryu;

{Edit by chan 23/08/04}
interface
uses
  Windows, Messages,ComCtrls, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,StrUtils,
  Dialogs, StdCtrls, AdvEdit, AdvGrid, DateUtils, UConst,SQLServerConnections, ExtCtrls,Buttons,
  Grids, asgprev;
type
  //--chan---Anti N.A.T.O--
  TCellValidation = (cvStringEmpty,cvSameString,cvQtyZero,cvQtyOverStock);
  TrLOV = record
    Sequence : integer;
    Code : string;
    Name : string;
  end;

  arLOV = array of TrLOV;
  {cvStringEmpty    --> utk validasi cells string yg belum diisi,
   cvSameString     --> utk validasi cells string yg sama pada grid,
   cvQtyZero        --> utk validasi cells Numeric yg nilainya nol,
   cvQtyOverStock   --> utk validasi cells Numeric yg nilainya melebihi stok}

//--chan---Anti N.A.T.O--
  procedure CellValidation(validateType:TCellValidation);
  function CounterQualified(Counter:integer):boolean;
  function IsTextExistInGrid(grid : TAdvStringGrid;col:integer;Text:string):boolean;
  function IsIDExistInGrid(grid : TAdvStringGrid;col,row:integer;ID:integer):boolean;
  function ValidMessage(txtEdit: TAdvEdit; EditCaption: string): boolean; overload;
  function ValidMessage(ComboBox: TComboBox; ComboCaption: string): boolean; overload;
  function GetValidComboBox(Sender: TCombobox): boolean;
  function GetIndexComboBox(Sender: TCombobox; AStringList: TStringList): integer;
  procedure SetItemComboBox(Sender: TCombobox; AStringList: TStringList);
  procedure SetItemComboBox2(Sender: TCombobox; AStringList: TStringList);
  procedure DateFormat(ADate: TDateTimePicker);


  function CheckControls(Sender: TWinControl): Boolean;
  function CorrectRound(x:Extended):Longint;
  function CekInteger(AString: string): boolean;
  function CekFloat(AString: string): boolean;
  function ReplaceSubStr(Input, Find, ReplaceWith: string): string;
  function CekIntegerFmt(AString: string): boolean;
  function StrFmtToIntDef(AString: string; ADefault: integer): integer;
  function StrFmtToInt(AString: string): integer;
  function StrFmtToFloatDef(AString: string; ADefault: real): real;
  function StrFmtToFloat(AString: string): real;
  function CekFloatFmt(AString: string): boolean;
  function IntToStrFmt(AInteger: integer): string;
  function FloatToStrFmt(AFloat: real): string;
  function FloatToStrFmt1(AFloat: real): string;
  function FloatToStrFmt2(AFloat: real): string;
  function FloatToStrFmt3(AFloat: real): string;
  function IntToStrCurrency(AInteger: integer): string;
  function FormatMoney(Value: Currency): String;
  function MoneyToIndonesianText(input: String): String;
  function EkstrakString(Input: string; pemisah: char; partisi: integer): string;
  function Confirmed(prompt: string): Boolean;
  function SaveConfirmed: Boolean;
  function CaptionPeriode(op1:TSQLOperator;Date1:TDate;Date2:TDate):string;
  procedure SetPeriodeObject(APeriode : TPeriode; AItemIndex:integer;ADateTimePickerFrom,ADateTimePickerTo:TDateTimePicker);
  procedure SetPeriodeObject2(APeriode : TPeriode; AItemIndex:integer;ADateTimePickerFrom,ADateTimePickerTo:TDateTimePicker);
  { for Stallion project }
  function GetKwartal(Tanggal: TDate): String;
  function Kuadrat(n: real; Counter: integer): real;

  procedure Alert(AlertMsg: string);
  procedure Inform(Information: string);
  procedure FailSave;
  procedure SuccessSave;
  procedure FailUpdate;
  procedure SuccessUpdate;
  procedure AccessDenied;
  procedure ResetControls(Sender: TWinControl);
  procedure ResetGrid(Sender: TAdvStringGrid; DefaultRowCount,DefaultColCount,
                      DefaultFixedRows, DefaultFixedCols: integer);
  procedure Delay(Milisecond: Word);

  function UnQuotedStr(const S: string): string;
  function IsClear(AGrid: TAdvStringGrid; ARow, ACol: integer): boolean;

  procedure RemoveNameFromStringList(var Target:TStringList;NameToRemove:string);
  procedure RemoveValueFromStringList(var Target:TStringList;ValueToRemove:string);
  function SudahAdaDiGrid(grid:TAdvStringGrid;aCol,FromRow:integer;aNoDokumen:string):boolean;

  procedure setTitlePeople(aItems : TStrings);
  function getNamaBulan(aBulan:integer):string;
  function NewIfThen(AValue: Boolean; const ATrue: TBooleanOperator; const AFalse: TBooleanOperator = boNone): TBooleanOperator;
  //menentukan tanggal(dd/mm/yyyy) dengan memasukan bulan yang diinginkan
  function SetTDateByMonth(ADate: TDate; MonthOf: word): TDate;
  //utk menghapus row terakhir;
  procedure DeleteRowTerakhir(sender : TAdvStringGrid;LimitRow,RowDelete:integer);
  procedure DeleteRowKosong(sender : TAdvStringGrid;FixedRow,KolKriteria:integer;IsNumber,isFloatingFooter:boolean);
  procedure SetCellFontColor(aGrid : TAdvStringGrid;FontColor:TColor;InitCol,Row:integer);
  procedure SetCellColor(aGrid : TAdvStringGrid;FontColor:TColor;InitCol,Row:integer;LimitCol:integer=0);
  //Melakukan penyimpanan ke dalam database
  function SaveToDB(SQL: string; InsertMode: boolean=true):boolean;

  function ExportToExcel(AGrid : TAdvStringGrid;ADefaultFileName:string=''):boolean;
  //mengambil baris yang aktif atau yang akan digunakan
  //digunakan dalam forms Rekapitulasi/Kelola sewaktu edit insert data
  function GetRow(AGrid: TAdvStringGrid; InsertMode: boolean=true): integer;
  function ExecTransaction(SQL: string; InsertMode: boolean=true): boolean;
  function ExecTransaction2(SQL: string; InsertMode: boolean=true): boolean;
  function ExecTransaction3(SQL: string): boolean;
  function ExecTransaction4(SQL: string): boolean;

  //add by dhanie 23/02/05
  {menghasilkan tanggal satu bulan sebelumnya}
  function LastMonth(adate: TDate): Tdate;

  procedure SetComboboxSize(Sender: TComboBox; NewWidth:integer);
  procedure SetFilterSize(Sender: TPanel; AButton: TButton; AShowSize:integer);overload;
  procedure SetFilterSizeIndo(Sender: TPanel; AButton: TButton; AShowSize:integer);overload;
  procedure SetFilterSize(Sender: TPanel; ASpeedButton: TSpeedButton; AShowSize:integer);overload;
  procedure SetFilterSizeLeft(Sender: TPanel; ASpeedButtonDown: Boolean; AShowSize:integer);overload;
  procedure SetFilterSizeLeft(Sender: TPanel; AButton: TButton; AShowSize:integer);overload;
  procedure SetFilterSizeLeft(Sender: TPageControl; ASpeedButtonDown: Boolean; AShowSize:integer);overload;

  function NewFormatDate(ADate : TDate;isSort:boolean=True):string;
  function NewFormatTime(ADateTime : TDateTime;isSort:boolean=True):string;

  function DeleteRows(AGrid: TAdvStringGrid; DefaultRowCount: Integer):boolean;
  procedure DeleteRowGrid(AGrid: TAdvStringGrid; ARow,ACOL: integer;CekKolom:Boolean=True);
  procedure OpenCashDrawer(Sender:TObject);

  //Grid Events
  procedure GetCellColorGrid(Sender: TObject; ARow, ACol: Integer;
    AState: TGridDrawState; ABrush: TBrush; AFont: TFont);

  procedure GetCellPrintBorderGrid(Sender: TObject; ARow, ACol: Integer;
    APen: TPen; var Borders: TCellBorders);

  procedure GetCellPrintColorGrid(Sender: TObject; ARow, ACol: Integer;
    AState: TGridDrawState; ABrush: TBrush; AFont: TFont);

  procedure ShortCutF8(AGrid:TAdvStringGrid;AKey:Word;AColumn:integer);
  procedure PrintClick(Sender: TObject; AdvPrevDlg: TAdvPreviewDialog; ACaption: string);
  procedure PrintPageGrid(Sender: TObject; Canvas: TCanvas; PageNr, PageXSize, PageYSize: Integer;
    ACaption: string);

  function Backup_database(AFileName:string):boolean;
  function getServerName:string;
  function getNewKeyDown(AOldKey:word):word;

implementation

uses Subroutines;

  procedure OpenCashDrawer(Sender:TObject);
  var port  : file;
  read : integer;
  buffer : string;
  begin
    AssignFile(port,'COM1');
    Rewrite(port,1);
    buffer:='>COM1';
    BlockWrite(port,buffer,1,read);
    CloseFile(port);
  end;

  procedure SetFilterSize(Sender: TPanel; ASpeedButton: TSpeedButton; AShowSize:integer);
  begin
    Sender.Height:= IfThen(Sender.Height <> 0, 0, AShowSize);
    ASpeedButton.Caption:= IfThen(Sender.Height <> 0, 'Hide &Filter', 'Show &Filter');
  end;

  procedure SetFilterSizeLeft(Sender: TPanel; ASpeedButtonDown: Boolean; AShowSize:integer);overload;
  begin
    Sender.Width:= IfThen(ASpeedButtonDown,AShowSize,0);
    //ASpeedButton.Caption := IfThen(Sender.Height <> 0, 'Hide &Filter', 'Show &Filter');
  end;

  procedure SetFilterSizeLeft(Sender: TPanel; AButton: TButton; AShowSize:integer);overload;
  begin
//    Sender.Width:= IfThen(ASpeedButtonDown,AShowSize,0);
    Sender.Width := IfThen(AButton.Caption <> 'Sembunyikan &Filter', AShowSize,0);
    AButton.Caption := IfThen(Sender.Width <> 0, 'Sembunyikan &Filter', 'Perlihatkan &Filter');
  end;

  procedure SetFilterSizeLeft(Sender: TPageControl; ASpeedButtonDown: Boolean; AShowSize:integer);overload;
  begin
    Sender.Width:= IfThen(ASpeedButtonDown,AShowSize,0);
    //ASpeedButton.Caption := IfThen(Sender.Height <> 0, 'Hide &Filter', 'Show &Filter');
  end;

  function NewFormatDate(ADate : TDate;isSort:boolean=True):string;
  begin
    if ADate = 0 then
      Result := ''
    else if isSort then
      Result := FormatDateTime(ShortDateFormat,ADate)
    else
      Result := FormatDateTime(LongDateFormat,ADate);
  end;

  function NewFormatTime(ADateTime : TDateTime;isSort:boolean=True):string;
  begin
    if ADateTime = 0 then
      Result := ''
    else if isSort then
      Result := FormatDateTime(ShortTimeFormat,ADateTime)
    else
      Result := FormatDateTime(LongTimeFormat,ADateTime);
  end;

  function ValidMessage(txtEdit: TAdvEdit; EditCaption: string): boolean; overload;
  begin
      Result := false;
      if (txtEdit.EditType in[etString,etUppercase,etMixedCase,etLowerCase,etPassword]) and (txtEdit.Text='') then begin
        alert(EditCaption+' belum diisi.');
        txtEdit.SetFocus;
      end
      else if (txtEdit.EditType in[etMoney,etFloat,etNumeric]) and (txtEdit.FloatValue=0) then begin
        ShowMessage(EditCaption+' belum diisi ... !');
        txtEdit.SetFocus;
      end else Result := true;
  end;

  function ValidMessage(ComboBox: TComboBox; ComboCaption: string): boolean; overload;
  begin
      Result := false;
      if (ComboBox.ItemIndex =-1) then begin
        Inform(ComboCaption+' belum diisi ... !');
        ComboBox.SetFocus;
      end else Result := true;
  end;


  function GetValidComboBox(Sender: TCombobox): boolean;
  begin
    Result:= (Sender.ItemIndex <> -1) and (Sender.ItemIndex <> Sender.Items.Count-1);
  end;

  function GetIndexComboBox(Sender: TCombobox; AStringList: TStringList): integer;
  begin
      Result:= StrToInt(AStringList.Names[Sender.ItemIndex]);
  end;

  procedure SetItemComboBox(Sender: TCombobox; AStringList: TStringList);
  begin
      NameValueListToValueList(AStringList,Sender.Items);
      Sender.Items.Append('--- all --- ');
      Sender.ItemIndex:= Sender.Items.Count-1;
  end;

  procedure SetItemComboBox2(Sender: TCombobox; AStringList: TStringList);
  begin
      NameValueListToNameList(AStringList,Sender.Items);
      Sender.Items.Append('--- all --- ');
      Sender.ItemIndex:= Sender.Items.Count-1;
  end;

  procedure DateFormat(ADate: TDateTimePicker);
  begin
      ADate.Format:= 'dddd, dd MMMM yyyy';
  end;

  procedure setTitlePeople(aItems : TStrings);
  begin
    aItems.Clear;
    aItems.Add('Mr');
    aItems.Add('Mrs');
    aItems.Add('Miss');
  end;

  function getNamaBulan(aBulan:integer):string;
  var listBulan : TStringList;
  begin
    listBulan := TStringList.Create;
    getMonths(listBulan);
    Result := listBulan.Values[IntToStr(aBulan)];
    listBulan.Free;
  end;

  function SudahAdaDiGrid(grid:TAdvStringGrid;aCol,FromRow:integer;aNoDokumen:string):boolean;
  var i:integer;
  begin
    Result := False;
    for i:= FromRow to grid.RowCount-1 do begin
      if grid.Cells[aCol,i] = aNoDokumen then begin
        Result := True;
        break;
      end;
    end;
    if Result then Inform('Data sudah ada di Grid');
  end;

  
  function CorrectRound(x:Extended):Longint;
  {untuk menghasilkan nilai round akurat tanpa mendekati nilai genap terdekat dari pembulatan}
  begin
    Result := trunc(x);
    if (Frac(x) >= 0.5) then
      Result := Result + 1;
  end;

  procedure RemoveNameFromStringList(var Target:TStringList;NameToRemove:string);
  var i:integer;
  begin
    for i:= 0 to Target.Count-1 do begin
      if UpperCase(Target.Names[i]) = UpperCase(NameToRemove) then begin
        Target.Delete(i);
        break;
      end;
    end;
  end;

  procedure RemoveValueFromStringList(var Target:TStringList;ValueToRemove:string);
  var i:integer;
  begin
    for i:= 0 to Target.Count-1 do begin
      if UpperCase(Target.Values[Target.Names[i]]) = UpperCase(valueToRemove) then begin
        Target.Delete(i);
        break;
      end;
    end;
  end;

  procedure CellValidation(validateType:TCellValidation);
  //I.S  : standarisasi message application on Grid.CellValidate;
  //F.S  ; exit --> utk tidak melanjutkan baris program selanjutnya
  begin
     case validateType of
       cvStringEmpty : Alert('Nilai belu diisi!');
       cvSameString  : Alert('Nilai sudah ada pada grid!');
       cvQtyZero     : Alert('Nilai tidak Boleh nol (0)!');
       cvQtyOverStock: Alert('Nilai melebihi stok yang ada!');
     end;
     exit;
  end;

  function CounterQualified(Counter:integer):boolean;
  //I.S  : Inputan Counter array detail transaksi
  //F.S  ; exit --> apabila nilai counter = nol
  begin
    Result := (Counter >0);
    if not Result then
      Alert('Detail Transaksi belum ada');
  end;


  function CheckControls(Sender: TWinControl): Boolean;
  var i: integer;
  begin
    result:= True;
    for i:= 0 to Sender.ControlCount-1 do begin
      if Sender.Controls[i] is TAdvEdit then
        case TAdvEdit(Sender.Controls[i]).Tag of
          0:  if TAdvEdit(Sender.Controls[i]).Text = '' then begin
                result:= False;
                TAdvEdit(Sender.Controls[i]).SetFocus;
                ShowMessage('"'+TAdvEdit(Sender.Controls[i]).LabelCaption+'" belum diisi...');
                break;
              end;
        end;
      if Sender.Controls[i] is TComboBox then
        case TComboBox(Sender.Controls[i]).Tag of
          0:  if (TComboBox(Sender.Controls[i]).ItemIndex = -1) and
                 (TComboBox(Sender.Controls[i]).Visible) then begin
                result:= False;
                TComboBox(Sender.Controls[i]).SetFocus;
                ShowMessage('Harus dipilih salah satu...');
                break;
              end;
        end;
    end;
  end;

  procedure ResetControls(Sender: TWinControl);
  var i: integer;
  begin
    for i:= 0 to Sender.ControlCount-1 do begin
      if Sender.Controls[i] is TAdvEdit then begin
        if (TAdvEdit(Sender.Controls[i]).EditType = etString) or
           (TAdvEdit(Sender.Controls[i]).EditType = etMixedCase) or
           (TAdvEdit(Sender.Controls[i]).EditType = etLowerCase) or
           (TAdvEdit(Sender.Controls[i]).EditType = etUppercase) then
          if TAdvEdit(Sender.Controls[i]).Tag in [0,1] then
            TAdvEdit(Sender.Controls[i]).Text:= '';
        if (TAdvEdit(Sender.Controls[i]).EditType = etMoney) or
           (TAdvEdit(Sender.Controls[i]).EditType = etNumeric) or
           (TAdvEdit(Sender.Controls[i]).EditType = etFloat) then
          if TAdvEdit(Sender.Controls[i]).Tag in [0] then
            TAdvEdit(Sender.Controls[i]).Text:= '0'
//          else
//            TAdvEdit(Sender.Controls[i]).Text:= TAdvEdit(Sender.Controls[i]).EmptyText;
      end;
      if Sender.Controls[i] is TAdvMaskEdit then
        TAdvMaskEdit(Sender.Controls[i]).Clear;
      if Sender.Controls[i] is TComboBox then
        TComboBox(Sender.Controls[i]).ItemIndex:= 0;
      if Sender.Controls[i] is TMemo then
        TMemo(Sender.Controls[i]).Lines.Clear;
      if Sender.Controls[i] is TCheckBox then
        case TCheckBox(Sender.Controls[i]).Tag of
          0 : TCheckBox(Sender.Controls[i]).Checked:= False;
        end;
      if Sender.Controls[i] is TLabel then
        case TLabel(Sender.Controls[i]).Tag of
          1: TLabel(Sender.Controls[i]).Caption:= '';
        end;
    end;
  end;

  procedure ResetGrid(Sender: TAdvStringGrid; DefaultRowCount,DefaultColCount,
                      DefaultFixedRows, DefaultFixedCols: integer);
  begin
    Sender.ClearNormalCells;
    Sender.AutoSize                 := False;
    Sender.ColumnSize.Stretch       := False;
    Sender.RowCount                 := DefaultRowCount;
    Sender.ColCount                 := DefaultColCount;
    Sender.FixedRows                := DefaultFixedRows;
    Sender.FixedFont.Style          := [fsBold]; // add by chan
    Sender.FixedCols                := DefaultFixedCols;
    Sender.ColumnSize.StretchColumn := DefaultColCount-1;
    Sender.ColumnSize.Stretch       := True;
  end;

  procedure Delay(Milisecond: Word);
  var WaktuSekarang,WaktuBeres:cardinal;
  begin
    WaktuSekarang:=GetTickCount;
    WaktuBeres:=WaktuSekarang+milisecond;
      while WaktuBeres>GetTickCount do
        application.ProcessMessages;
  end;

  function GetKwartal(Tanggal: TDate): String;
  begin
    case MonthOf(Tanggal) of
      1 : result:= 'I/';
      2 : result:= 'II/';
      3 : result:= 'III/';
      4 : result:= 'IV/';
      5 : result:= 'V/';
      6 : result:= 'VI/';
      7 : result:= 'VII/';
      8 : result:= 'VIII/';
      9 : result:= 'IX/';
      10: result:= 'X/';
      11: result:= 'XI/';
      12: result:= 'XII/';
    end;
    result:= result + IntToStr(YearOf(Tanggal))
  end;

{-----------------------------------------------------------------------}
  function CekInteger(AString: string): boolean;
  begin
    try
      StrToInt(AString);
      Result:=true
    except
      on EConvertError do
        Result:=false;
    end;
  end;

  function CekFloat(AString: string): boolean;
  begin
    try
      StrToFloat(AString);
      Result:=true
    except
      on EConvertError do
        Result:=false;
    end;
  end;

  function ReplaceSubStr(Input, Find, ReplaceWith: string): string;
  { I.S. : Input, Find, dan ReplaceWith terdefinisi
    F.S. : menghasilkan string Input di mana substring Find diganti dengan
           substring ReplaceWith }
  var i: integer;
      Tmp: string;
  begin
    while (Pos(Find,Input)>0) do begin
      i:=Pos(Find,Input);
      Delete(Input,i,Length(Find));
      Tmp:=Copy(Input,i,Length(Input)-i+2);
      Delete(Input,i,Length(Input)-i+2);
      Input:=Input+ReplaceWith+Tmp;
    end;

    Result:=Input;
  end;

  function IsTextExistInGrid(grid : TAdvStringGrid;col:integer;Text:string):boolean;
  var i:integer;
  begin
    Result := False;
    for i:= 1 to grid.RowCount-1 do
      if UpperCase(grid.Cells[col,i]) = UpperCase(Text) then begin
        Result := True;
        Alert('Nilai sudah ada pada grid!');
        Break;
      end;
  end;

  function IsIDExistInGrid(grid : TAdvStringGrid;col,row:integer;ID:integer):boolean;
  var i:integer;
  begin
    Result := False;
    for i:= 1 to grid.RowCount-1 do begin
      if i =row then Continue;
      if grid.Ints[col,i] = ID then begin
        Result := True;
        Alert('Data sudah ada pada grid!');
        Break;
      end;
    end;  
  end;

  function CekIntegerFmt(AString: string): boolean;
  begin
    Result := CekInteger(ReplaceSubStr(AString,ThousandSeparator,''));
  end;

  function CekFloatFmt(AString: string): boolean;
  begin
    Result := CekFloat(ReplaceSubStr(AString,ThousandSeparator,''));
  end;

  function StrFmtToIntDef(AString: string; ADefault: integer): integer;
  begin
    if (CekIntegerFmt(AString)) then
      Result := StrToInt(ReplaceSubStr(AString,ThousandSeparator,''))
    else
      Result := ADefault;
  end;

  function StrFmtToInt(AString: string): integer;
  begin
    Result := StrFmtToIntDef(AString, 0);
  end;

  function StrFmtToFloatDef(AString: string; ADefault: real): real;
  begin
    if (AString<>'') and (CekFloatFmt(AString)) then
      Result := StrToFloat(ReplaceSubStr(AString,ThousandSeparator,''))
    else
      Result := ADefault;
  end;

  function StrFmtToFloat(AString: string): real;
  begin
    Result := StrFmtToFloatDef(AString,0.00);
  end;

  function IntToStrFmt(AInteger: integer): string;
  begin
    Result := FormatFloat('#,##0',AInteger);
  end;

  function FloatToStrFmt(AFloat: real): string;
  begin
    Result := FormatFloat('#,##0',AFloat);
  end;

  function FloatToStrFmt1(AFloat: real): string;
  begin
    Result := FormatFloat('#,##0.0',AFloat);
  end;

  function FloatToStrFmt2(AFloat: real): string;
  begin
    Result := FormatFloat('#,##0.00',AFloat);
  end;

  function FloatToStrFmt3(AFloat: real): string;
  begin
    Result := FormatFloat('#,##0.000',AFloat);
  end;

  function IntToStrCurrency(AInteger: integer): string;
  begin
    Result := CurrencyString+' '+FormatFloat('#,##0.00',AInteger);
  end;

  function FormatMoney(Value: Currency): String;
  begin
    Result := CurrencyString+' '+FormatCurr('#,##0.00',Value);
  end;

  function MoneyToIndonesianText(input: String): String;
  const vlstep : array [0..4] of string = (' ','ribu ','juta ','milyar ','trilyun ');
  var i,j,k,panjang,m : integer;
      stemp,stemp2,addstr : string;
      nl2,nltemp,qtemp : string;
      good,belas : boolean;
  begin
    good := false;
    for i:=1 to Length(input) do
    begin
      if (input[i] <> '0') then
         good := true;
      if (good) then
         nl2 := nl2 + input[i];
    end;
    if (length(nl2) > 15) then
       nltemp:=Copy(nl2,Length(nl2)-15+1,15)
    else nltemp := nl2;
    stemp2 := '';
    for i:=0 to 4 do
    begin
      k := Length(nltemp);
      if (k = 0) then
         break;
      if (k >= 3) then
         qtemp := Copy(nltemp,Length(nltemp)-2,3)
      else qtemp := nltemp;
      nltemp := Copy(nltemp,1,Length(nltemp)-3);
      stemp := '';
      belas := false;
      if (k >= 3) then
         panjang := 3
      else panjang:=k;
      m := 4-panjang;
      for j:=1 to panjang do
      begin
        addstr := '';
        if (qtemp[j] = '9') then
           addstr := 'sembilan ';
        if (qtemp[j] = '8') then
           addstr := 'delapan ';
        if (qtemp[j] = '7') then
           addstr := 'tujuh ';
        if (qtemp[j] = '6') then
           addstr := 'enam ';
        if (qtemp[j] = '5') then
           addstr := 'lima ';
        if (qtemp[j] = '4') then
           addstr := 'empat ';
        if (qtemp[j] = '3') then
           addstr := 'tiga ';
        if (qtemp[j] = '2') then
           addstr := 'dua ';
        if (qtemp[j] = '1') then
        begin
          case m of
          1,2: case m of
                1:addstr := 'se';
                2:belas := true;
               end;
          3: if (not belas) then
             begin
                if (i = 1) then
                begin
                  if (stemp = '') then
                     addstr := 'se'
                  else addstr := 'satu ' ;
                end else addstr := 'satu ';
             end else addstr := 'se';
          end;
        end;
        if (qtemp[j] = '0') then
           if (belas) then
           begin
             addstr := 'sepuluh ';
             belas := false;
           end;
        if ((addstr <> '') or (belas)) then
        begin
          case m of
          1: addstr := addstr + 'ratus ';
          2: if (not belas) then
                addstr := addstr+ 'puluh ';
          3: if (belas) then
                addstr := addstr+ 'belas ';
          end;
        end;
        stemp := stemp + addstr;
        inc(m);
      end;
      if (stemp <> '') then
         stemp2 := stemp + vlstep[i] + stemp2;
    end;
    result := stemp2+'rupiah';
    if (result <> '') then
       result[1] := upcase(result[1]);
  end;

  function EkstrakString(Input: string; pemisah: char; partisi: integer): string;
  { I.S. : Input = string yang akan di-extract, pemisah = karakter yang
           dipakai sebagai tanda pemisah, partisi = bagian ke berapa yang
           akan diambil, paling kiri adalah bagian ke-1
    F.S. : menghasilkan substring ke-partisi dari Input dengan batas pemisah }
  var Ctr, Posisi: integer;
      TmpString: string;
  begin
    TmpString:='';
    Ctr:=0;
    while (Ctr<partisi) do
    begin
      Posisi:=Pos(pemisah,Input);
      if (Posisi=0) then
        Posisi:=Length(Input)+1;
      TmpString:=Copy(Input,1,Posisi-1);
      Delete(Input,1,Posisi);
      Ctr:=Ctr+1;
    end;

    Result:=TmpString;
  end;

  function Confirmed(prompt: string): Boolean;
  begin
    Result := ( MessageDlg(prompt, mtConfirmation, [mbYes, mbNo], 0) = mrYes );
  end;

  function SaveConfirmed: Boolean;
  begin
    Result := Confirmed(MSG_SAVE_CONFIRMATION);
  end;

  procedure Alert(AlertMsg: string);
  begin
    MessageDlg(AlertMsg, mtWarning, [mbOK], 0);
  end;

  procedure Inform(Information: string);
  begin
    MessageDlg(Information, mtInformation, [mbOK], 0);
  end;

  procedure FailSave;
  begin
    ShowMessage(MSG_UNSUCCESS_SAVING);
  end;

  procedure SuccessSave;
  begin
    ShowMessage(MSG_SUCCESS_SAVING);
  end;

  procedure FailUpdate;
  begin
    ShowMessage(MSG_UNSUCCESS_UPDATE);
  end;

  procedure SuccessUpdate;
  begin
    ShowMessage(MSG_SUCCESS_UPDATE);
  end;

  procedure AccessDenied;
  begin
    ShowMessage(MSG_UNAUTHORISED_ACCESS);
  end;

  function CaptionPeriode(op1:TSQLOperator;Date1:TDate;Date2:TDate):string;
  var hasil : string;
  begin
     hasil := 'Periode Global';
     if (Date1 <> 0) and (Date2 <> 0) then
        hasil := 'Periode '+FormatDateTime(ShortDateFormat,Date1) + ' s/d '+FormatDateTime(ShortDateFormat,Date2)
     else if Date1<> 0 then begin
       {soGreaterThan,
       soGreaterThanEqualsTo,soEquals,soLessThan, soLessThanEqualsTo);}
        if op1 = soEquals then
          hasil := 'Per Tanggal '+ FormatDateTime(ShortDateFormat,Date1)
        else if (op1 = soGreaterThanEqualsTo) or (op1 = soGreaterThan) then
          hasil := 'Periode Dari '+ FormatDateTime(ShortDateFormat,Date1)+' Sampai Sekarang'
        else if (op1 = soLessThanEqualsTo) or (op1=soLessThan) then
          hasil := 'Periode Awal s/d '+ FormatDateTime(ShortDateFormat,Date1);
     end;
     Result := hasil;
  end;

  procedure SetPeriodeObject(APeriode : TPeriode; AItemIndex:integer;ADateTimePickerFrom,ADateTimePickerTo:TDateTimePicker);
  begin
     case AItemIndex of
      0:begin
          APeriode.OpPeriodeAwal1 := soEquals;
          APeriode.PeriodeAwal1   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir1:= soEquals;
          APeriode.PeriodeAkhir1  := 0;
        end;
      1:begin
          APeriode.OpPeriodeAwal1 := soGreaterThanEqualsTo;
          APeriode.PeriodeAwal1   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir1:= soEquals;
          APeriode.PeriodeAkhir1  := 0;
        end;

      2:begin
          APeriode.OpPeriodeAwal1 := soLessThanEqualsTo;
          APeriode.PeriodeAwal1   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir1:= soEquals;
          APeriode.PeriodeAkhir1  := 0;
        end;
      3:begin
          APeriode.OpPeriodeAwal1 := soGreaterThanEqualsTo;
          APeriode.PeriodeAwal1   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir1:= soLessThanEqualsTo;
          APeriode.PeriodeAkhir1  := ADateTimePickerTo.Date;
       end;
      end;
  end;

  procedure SetPeriodeObject2(APeriode : TPeriode; AItemIndex:integer;ADateTimePickerFrom,ADateTimePickerTo:TDateTimePicker);
  begin
     case AItemIndex of
      0:begin
          APeriode.OpPeriodeAwal2 := soEquals;
          APeriode.PeriodeAwal2   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir2:= soEquals;
          APeriode.PeriodeAkhir2  := 0;
        end;
      1:begin
          APeriode.OpPeriodeAwal2 := soGreaterThanEqualsTo;
          APeriode.PeriodeAwal2   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir2:= soEquals;
          APeriode.PeriodeAkhir2  := 0;
        end;

      2:begin
          APeriode.OpPeriodeAwal2 := soLessThanEqualsTo;
          APeriode.PeriodeAwal2   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir2:= soEquals;
          APeriode.PeriodeAkhir2  := 0;
        end;
      3:begin
          APeriode.OpPeriodeAwal2 := soGreaterThanEqualsTo;
          APeriode.PeriodeAwal2   := ADateTimePickerFrom.Date;
          APeriode.OpPeriodeAkhir2:= soLessThanEqualsTo;
          APeriode.PeriodeAkhir2  := ADateTimePickerTo.Date;
       end;
      end;
  end;

  function Kuadrat(n: real; Counter: integer): real;
  var tmp: real; i: integer;
  begin
    tmp:= n;
    for i := 1  to Counter-1 do
      tmp:= tmp * n;
    Result:= tmp;
  end;

  function UnQuotedStr(const S: string): string;
  var
   // I: Integer;
    hasil: string;
  begin
    hasil:= s;
    Delete(hasil, 1,1);
    Delete(hasil, length(hasil),1);
    Result := hasil;
  end;

  function IsClear(AGrid: TAdvStringGrid; ARow, ACol: integer): boolean;
  begin
    result := False;
    if (AGrid.Cells[ACol,ARow] = '') then
      result := True;
  end;

  function NewIfThen(AValue: Boolean; const ATrue: TBooleanOperator; const AFalse: TBooleanOperator):  TBooleanOperator;
  begin
    if AValue then Result := ATrue
    else Result := AFalse;
  end;

  function SetTDateByMonth(ADate: TDate; MonthOf: word): TDate;
  var AYear, AMonth, ADay: word;
  begin
    DecodeDate(ADate,AYear,AMonth,ADay);
    Result:= EncodeDate(AYear,AMonth,ADay);
  end;
{-----------------------------------------------------------------------}

procedure DeleteRowTerakhir(sender : TAdvStringGrid;LimitRow,RowDelete:integer);
begin
  if sender.RowCount > LimitRow then
    sender.RowCount := sender.RowCount - RowDelete;
end;

procedure DeleteRowKosong(sender : TAdvStringGrid;FixedRow,KolKriteria:integer;IsNumber,isFloatingFooter:boolean);
var i,row:integer;Kriteria : string;
begin
  row := IfThen(isFloatingFooter,sender.RowCount-2,sender.RowCount-1);
  for i:= FixedRow to row do begin
    Kriteria := IfThen(IsNumber,IntToStr(0),'');
    If sender.Cells[KolKriteria,i] = Kriteria then begin
       sender.RemoveRows(i,1);
       sender.Update;

    end;
  end;
end;

procedure SetCellFontColor(aGrid : TAdvStringGrid;FontColor:TColor;InitCol,Row:integer);
var i:integer;
begin
  for i := InitCol to aGrid.ColCount - 1 do
    aGrid.FontColors[i,Row] := FontColor;
end;

procedure SetCellColor(aGrid : TAdvStringGrid;FontColor:TColor;InitCol,Row:integer;LimitCol:integer);
var i:integer;
begin
  if LimitCol = 0 then begin
    for i := InitCol to aGrid.ColCount - 1 do
      aGrid.Colors[i,Row] := FontColor;
  end
  else begin
    for i := InitCol to LimitCol do
      aGrid.Colors[i,Row] := FontColor;
  end;
end;


function SaveToDB(SQL: string; InsertMode: boolean):boolean;
begin
  try
    myConnection.BeginSQL;
    myConnection.ExecSQL(SQL);
    myConnection.EndSQL;
    Inform(IfThen(InsertMode, MSG_SUCCESS_SAVING, MSG_SUCCESS_UPDATE));
    Result:= True;
    except
      myConnection.UndoSQL;
      Result:= False;
      Inform(IfThen(InsertMode, MSG_UNSUCCESS_SAVING, MSG_UNSUCCESS_UPDATE));
  end;
end;


function ExportToExcel(AGrid : TAdvStringGrid;ADefaultFileName:string=''):boolean;
{Create By   : Yusup
 Parameter   : - AGrid-- source data dari grid yg mo dieksport
               - ADefaultFileName -->default nama file yg muncul dalam save dialogs
 Description : resutl = true jika eksport ke excel berhasil, False= gagal}
var vSaveDialogs : TSaveDialog;
begin
  vSaveDialogs := TSaveDialog.Create(AGrid.Parent);
  vSaveDialogs.FileName := ADefaultFileName;
  try
    if vSaveDialogs.Execute then
      AGrid.SaveToXLS(vSaveDialogs.FileName);
    Result := True
  except
    Result := False;
  end;
    vSaveDialogs.Free;
end;

function GetRow(AGrid: TAdvStringGrid; InsertMode: boolean=true): integer;
begin
  if InsertMode then begin
    AGrid.AddRow;
    Result:= AGrid.RowCount-1;
  end else Result:= AGrid.Row;
end;

function ExecTransaction(SQL: string; InsertMode: boolean=true): boolean;
begin
  try
    myConnection.BeginSQL;
    myConnection.ExecSQL(SQL);
    myConnection.EndSQL;
    Inform(IfThen(InsertMode,MSG_SUCCESS_SAVING,MSG_SUCCESS_UPDATE));
    Result:= true;
    except
      myConnection.UndoSQL;
      Inform(IfThen(InsertMode,MSG_UNSUCCESS_SAVING,MSG_UNSUCCESS_UPDATE));
      Result:= false;
  end;
end;

function ExecTransaction2(SQL: string; InsertMode: boolean=true): boolean;
begin
  try
    myConnection.BeginSQL;
    myConnection.ExecSQL(SQL);
    myConnection.EndSQL;
    Result:= true;
    except
      myConnection.UndoSQL;
      Result:= false;
  end;
end;

function ExecTransaction3(SQL: string): boolean;
begin
    try
      myConnection.ExecSQL(SQL);
      Result:= true;
    except raise;
      Result:= false;
 end;
end;

function ExecTransaction4(SQL: string): boolean;
begin
  try
    myConnection.BeginSQL;
    myConnection.ExecSQL(SQL);
    myConnection.EndSQL;
    Inform(MSG_SUCCESS_DELETING);
    Result:= true;
    except
      myConnection.UndoSQL;
      Inform(MSG_UNSUCCESS_DELETING);
      Result:= false;
  end;
end;

function LastMonth(adate: TDate): Tdate;
var d,m,y:Word;
    val : tdate;
begin
  DecodeDate(adate,y,m,d);
  if m>1 then
    m := m-1
  else begin
    m := 12;
    y := y-1;
  end;
  If m=2 then begin
    If (d=29) or (d=30) Or (d=31) then
      If y Mod 4 = 0 then
        d:=29
      else
        d:=28;
  end
  else
    If m<6 then begin
      If m mod 2 = 0 then
        d:=31
      else
        d:=30;
    end
    else begin
      If m mod 2 <> 0 then
        d:=31
      else
        d:=30;
    end;
  val := EncodeDate(y,m,d);
  if not IsValidDate(y,m,d) then begin
    Val := Endofthemonth(EncodeDate(y,m,1))
  end;
  Result:=val;
end;

procedure SetComboboxSize(Sender: TComboBox; NewWidth:integer);
begin
  Sender.Width:= NewWidth;
end;

procedure SetFilterSize(Sender: TPanel; AButton: TButton; AShowSize:integer);
begin
  Sender.Height:= IfThen(Sender.Height <> 0, 0, AShowSize);
  AButton.Caption:= IfThen(Sender.Height <> 0, 'Hide &Filter', 'Show &Filter');
end;

procedure SetFilterSizeIndo(Sender: TPanel; AButton: TButton; AShowSize:integer);
begin
  Sender.Height:= IfThen(Sender.Height <> 0, 0, AShowSize);
  AButton.Caption:= IfThen(Sender.Height <> 0, 'Sembunyikan &Filter', 'Perlihatkan &Filter');
end;

function DeleteRows(AGrid: TAdvStringGrid; DefaultRowCount: Integer):boolean;
begin
  Result := False;
  if Confirmed('Hapus baris ke '+IntToStr(AGrid.Row)+' ?') then begin
    Result := True;
    if(AGrid.RowCount > DefaultRowCount)then begin
      AGrid.ClearRows(AGrid.Row,1);
      AGrid.RemoveRows(AGrid.Row,1);
    end else if (AGrid.RowCount = DefaultRowCount)then
      AGrid.ClearRows(AGrid.Row,1);

    AGrid.AutoNumberCol(0);
  end;
end;

procedure DeleteRowGrid(AGrid: TAdvStringGrid; ARow,
  ACOL: integer;CekKolom:Boolean);
begin
  if ARow = 0 then exit;
  if Confirmed('Data pada baris ke-'+IntToStr(AGrid.Row)+ 'akan dihapus?') then
       deleterow(AGrid,AGrid.Row,ACOL,CekKolom);
end;


procedure GetCellColorGrid(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if Arow in [0, (Sender as TAdvStringGrid).RowCount-1] then AFont.Style := [fsBold];
  if (Sender as TAdvStringGrid).Cells[1,arow] = 'TOTAL :' then begin
    AFont.Color := clBlue;
    AFont.Style := [fsBold];
  end;
end;


procedure GetCellPrintBorderGrid(Sender: TObject; ARow,
  ACol: Integer; APen: TPen; var Borders: TCellBorders);
  var i : integer;
begin
  if Arow <> 0 then begin
    Borders := [cbLeft,cbRight];
    if ARow = (Sender as TAdvStringGrid).RowCount-1 then begin
      for i := 0 to (Sender as TAdvStringGrid).ColCount-1 do begin
        APen.Width := 2;
        Borders := [cbBottom,cbTop];
      end;
    end;
  end else begin
    for i := 0 to (Sender as TAdvStringGrid).ColCount-1 do begin
      APen.Width := 2;
      Borders := [cbBottom,cbTop];
    end;
  end;
end;

procedure GetCellPrintColorGrid(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
  if Arow in [0, (Sender as TAdvStringGrid).RowCount-1] then AFont.Style := [fsBold];
  if Arow = 0 then begin
    AFont.Style := [fsBold];
    ABrush.Color := clSilver;
  end;
end;

procedure ShortCutF8(AGrid:TAdvStringGrid;AKey:Word;AColumn:integer);
var oldRow : integer;
begin
  if AGrid.Row = 0 then exit;
  oldRow := AGrid.Row;
  if (AGrid.Cells[AColumn,AGrid.Row] = '') or (AGrid.Cells[AColumn,AGrid.Row] = '') then exit;
  if AKey = vk_F8 then begin
    AGrid.AddRow;
    AGrid.Col := AColumn;
    AGrid.Row := oldRow+1;
    AGrid.SetFocus;
  end;
end;

procedure PrintClick(Sender: TObject; AdvPrevDlg: TAdvPreviewDialog; ACaption: string);
//var tmpPrimer : string;
begin
  (Sender as TAdvStringGrid).PrintSettings.TitleLines.Clear;
  AdvPrevDlg.Grid := (Sender as TAdvStringGrid);
  (Sender as TAdvStringGrid).PrintSettings.TitleLines.Add('Daftar Item');
  AdvPrevDlg.Grid := (Sender as TAdvStringGrid);
  AdvPrevDlg.Execute;
end;

procedure PrintPageGrid(Sender: TObject;
  Canvas: TCanvas; PageNr, PageXSize, PageYSize: Integer; ACaption: string);
var
  SaveFont: TFont;
  SaveBrush : TBrush;
  ts, tw: Integer;
  ReportTitle : string;

const
  myowntitle: string = 'Clean N'''' Dry';

begin
  reporttitle := trim(ACaption);
  if (Sender as TAdvStringGrid).PrintColStart <> 0 then
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
    Font.Height := (Sender as TAdvStringGrid).MapFontHeight(8);
    Font.Color := clWhite;

    ts := (Sender as TAdvStringGrid).PrintColOffset[0];
    tw := (Sender as TAdvStringGrid).PrintPagewidth;

    MoveTo(ts,-5);
    Brush.Color := clWhite;
    Rectangle(ts,-10,ts+tw,- (Sender as TAdvStringGrid).printsettings.headersize+10);
    Brush.Color := clSilver;
    FillRect(Rect(ts,-10,ts+textwidth(myowntitle)+25,-(Sender as TAdvStringGrid).printsettings.headersize+10));
    TextRect(Rect(ts,-10,ts+textwidth(myowntitle)+25,-(Sender as TAdvStringGrid).printsettings.headersize+10),
             ts+10,-19,myowntitle);
    Brush.Assign(SaveBrush);
    Font.Color := clBlack;
    Font.Height := (Sender as TAdvStringGrid).MapFontHeight(6);
    Font.Style := [fsItalic];
    TextOut(ts+textwidth(myowntitle)+120,-30,formatdatetime('MMM d, yyyy"-"HH:mm:ss',now));
    Font.Height := (Sender as TAdvStringGrid).MapFontHeight(11);
    Font.Style := [fsBold,fsItalic];
    TextOut(ts+tw-textwidth(reporttitle)-10,-17,reporttitle);
    Font.Assign(SaveFont);
    SaveBrush.Free;
    SaveFont.Free;
  end;

end;

   function Backup_database(AFileName:string):boolean;
  begin
    try
      Screen.Cursor := crSQLWait;
      with MyConnection do begin
      BeginSQL;
      StoredProc('backup_data');
      AddParamString('@p_file_nama',aFileName);
      ExecStoredProc;
      EndSQL;
      Result := true;
      Delay(5000);
      end;
      Screen.Cursor := crDefault;
    except
      Screen.Cursor := crDefault;
      MyConnection.UndoSQL;
      Result := False;
    end;
  end;


  function getServerName:string;
  begin
    Result := getStringFromSQL('select srvname from master.dbo.sysservers');
  end;

  function getNewKeyDown(AOldKey:word):word;
  begin
    case AOldKey of
    VK_NUMPAD0 : Result := ord('0');
    VK_NUMPAD1 : Result := ord('1');
    VK_NUMPAD2 : Result := ord('2');
    VK_NUMPAD3 : Result := ord('3');
    VK_NUMPAD4 : Result := ord('4');
    VK_NUMPAD5 : Result := ord('5');
    VK_NUMPAD6 : Result := ord('6');
    VK_NUMPAD7 : Result := ord('7');
    VK_NUMPAD8 : Result := ord('8');
    VK_NUMPAD9 : Result := ord('9');
    else
      Result := AOldKey;
    end;
  end;
end.
