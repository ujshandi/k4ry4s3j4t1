unit Subroutines;

interface

uses
  UConst,SqlServerConnections,
  SysUtils, Controls, ADODB, Forms, ComCtrls, StdCtrls, Dialogs, Classes, Graphics,Messages,StrUtils,
  Variants, Series, Chart, AdvGrid, AdvEdit, DateUtils, RawPrinter, Math, IniFiles, RTLConsts, Types;
  {asprev, EpsonSeq, RAWPrinter, DialogRawPrintPreview, }

  function CurrToIndonesianSpeech(nl : string):string;
{new macro routines}
  function GetResultDef(sql: string; defnull, defnotfound, defmultiplefound: integer): integer; overload;
  function GetResultDef(sql: string; defnull, defnotfound, defmultiplefound: real): real; overload;
  function GetResultDef(sql: string; defnull, defnotfound, defmultiplefound: string): string; overload;

  function generateRandomPassword:string;
  function GetMonthYear(aMonth: Integer; aYear: TDate): string;
  procedure getMonths(var target:TStringList);
  procedure getDayOfWeekList(var target:TStringList);

  function CurrToStrFmt(Input: currency): string;
  function StrToCurrFmt(Input: string):currency;
  function IntToStrFixed(MinLen: integer; Input: integer): string;
  function IsInteger(AString: string): boolean;
  function IsFloat(AString: string): boolean;
  function allColSelected(var grid:TAdvStringGrid):boolean;

  procedure CopyBitmap(const Source: TBitmap; ColWidth, RowWidth, ColIndex, RowIndex: integer; const Dest: TBitmap);
  procedure StringListToStrings(AValueList: TStringList; AList: TStrings);
  procedure NameValueListToNameList(AValueList: TStringList; AList: TStrings);
  procedure NameValueListToValueList(AValueList: TStringList; AList: TStrings);

  procedure SQLToStringList(var AStringList: TStringList; ASQL: string);
  procedure SQLToNameValueList(var AStringList: TStringList; ASQL: string);
  procedure SQLToNameValueList2(var AStringList: TStringList; ASQL: string);

{unsorted macro routines}
  procedure PrintRawDocument(const DocTitle, TextToPrint: String);
  procedure WriteLog(AFileName: string; ALog: string);
  function IntToStrFmt(Input: integer): string;
  function FormatDuit(Value: Currency): string;
  function DuitStrToIntStr(Value: string): string;

  function TrimAll(Input: string): string;
  procedure InitAllTextBox(var Form: TForm);
  procedure LoadBufferToAdvGrid(buffer: _RecordSet; var Grid: TAdvStringGrid; StartCol,StartRow: integer);
  function EkstrakString(Input: string; Limiter: char; Count: integer): string;
  function CekTanggal(Input: string): boolean;
  function ReformatFloat(newsep: char; input: string):string;
  function ReplaceSubStr(Input, Find, ReplaceWith: string): string;
  function ReverseFormatDate(Tanggal:string): TDate;
  function SetStrLen(Input: string; Len: integer; FillChar: char; FillPos: TAlignment): string;
  function HitungChar(Input: string; Karakter: Char): integer;

{global macro routines}
  function GetAppPath : string;

{check macro routines}
  function CekInteger(Input: string): boolean; overload;
  function CekInteger(Input: string; LBound,UBound: integer): boolean; overload;
  function CekFloat(Input: string): boolean; overload;
  function CekFloat(Input: string; LBound, UBound: integer): boolean; overload;

{format macro routines}
  function qoute(s: string): string;
  function f2s(f : Extended) : string; overload;
  function f2s(f : Extended; decimal: Byte) : string; overload;
  function s2f(s : string) : Extended;
  function fixfs(s : string) : string;
  function FormatMoney(f : Extended) : string;
  function b2s(b: Boolean): string;
  function d2s(d : TDate) : string;
  function s2d(s : string) : TDate;
  function converttanggal( Value: TDate): string; {format tanggal}
  function FormatLCD(input: string): string;

{dialog macro routines}
  function Confirmed(prompt: string): Boolean;
  procedure Alert(AlertMsg : string);
  procedure Inform(Information : string);

{form macro suport}
  procedure ClearForm(frm: tform);
  function cekkosong(frm: tform): boolean;
  procedure TextToEdit(frm: tform; editbox: string; Value: string);

{wincontrol macro routines}
  procedure SetEditReadOnly(TextBox: TAdvEdit; IsReadOnly: Boolean); overload;
  procedure SetEditReadOnly(DateTimePicker: TDateTimePicker; IsReadOnly: Boolean); overload;
  procedure SetComboReadOnly(ComboBox: TComboBox; IsReadOnly: Boolean);
  function SetComboListValue(Combo: TComboBox; NewValue: string) : Integer;

{stringgrid macro routines}
  procedure EditToGrid(adv: TAdvStringGrid; kolom: integer; baris: integer; editbox: tadvedit);
  procedure TextToGrid(adv: TAdvStringGrid; kolom: integer; baris: integer; Text: string);
  procedure DateToGrid(adv: TAdvStringGrid; kolom: integer; baris: integer; InputDate: TDateTimePicker);
  procedure deleterow(grid: TAdvStringGrid; row: integer; idcol: integer;CekColumn:boolean=True);
  function cekkosonggrid(adv: TAdvStringGrid; row: integer): boolean;
  function AtLeastOneData(Grid: TadvStringGrid): boolean;

{chart macro routines}
  procedure GetDataIntoChart(var InputChart: Tchart; var InputSeries: TLineSeries; Query: string; adc: TADOConnection);

{stringlist macro routines}
  function existOTS(T: Tstringlist; search: string): boolean;
  function maxstringlist(b: tstringlist): real;

(*
{lcdscreen macro routines}
  procedure HitungColsToLcd(Var lcd: TLcdScreen; adv: TAdvStringGrid; col: integer; with_koma: boolean);
  procedure FillLCD(LCD: TLCDScreen; Value: int64);

{print macro routines}
  procedure RawPrint(DocTitle, TextToPrint: string); overload;
  procedure RawPrint(const DocTitle, Header, Footer: string; StringGrid: TAdvStringGrid; const Widths: Array of shortint); overload;
  procedure RawPrint(const DocTitle, Header, Footer: string; StringGrid: TAdvStringGrid); overload;
  Procedure PrintGraph(adv: TAdvStringGrid);
*)

 function IndexofValue(aList:TStringList;aValue:string):integer;
 function getCurrentSequence(aSequenceName:string):integer;
 function getNextSequence(aSequenceName:string):integer;
 function getPeriode(aDate:TDate):string;
 function getPeriode2(aDate:TDate; YearType: integer=1):string;
 // add by chan 19/07/04
 function getStringFromSQL(aSql:string):string;
 function getFloatFromSQL(aSql:string):double;
 function getIntegerFromSQL(aSql:string):integer;
 function getBooleanFromSQL(aSql:string):boolean;
 function getTDateFromSQL(aSql:string):TDate;
 function ExecuteSQL(aSql:string):boolean;

 function setAccountView(accNum :integer):string;
 function getAccountView(accNum : string):integer;

type
  _SystemConstant_Arr = class;
  _SystemConstant = class;
  //Table Name: System_Constant
  //Fields:
  //  0. Seksi* (string[30])
  //  1. Nama* (string[50])
  //  2. Nilai (string[0])
  //Properties:
  //  0. Seksi* (string)
  //  1. Nama* (string)
  //  2. Nilai (string)

  _SystemUser_Arr = class;
  _SystemUser = class;
  TSystemUser_Arr = class;
  TSystemUser = class;
  //Table Name: System_User
  //Fields:
  //  0. User_Id* (string[20])
  //  1. User_Name (string[50])
  //  2. Passwd (string[20])
  //  3. Access_Level (integer)
  //  4. Disabled_Date (TDate)
  //Properties:
  //  0. UserId* (string)
  //  1. UserName (string)
  //  2. Passwd (string)
  //  3. AccessLevel (integer)
  //  4. DisableDate (TDate)

  _SystemReversal_Arr = class;
  _SystemReversal = class;
  //Table Name: System_Reversal
  //Fields:
  //  0. Revers_Seq* (integer<sequence)
  //  1. Revers_Date (TDate)
  //  2. Notes (string[0])
  //  3. User_Id (string[20]) Reference to: System_User\User_Id
  //Properties:
  //  0. ReversSeq* (integer)
  //  1. ReversDate (TDate)
  //  2. Notes (string)
  //  3. SystemUser (_SystemUser)

  _SystemMenu_Arr = class;
  _SystemMenu = class;
  TSystemMenu_Arr = class;
  TSystemMenu = class;
  //Table Name: System_Menu
  //Fields:
  //  0. Menu_Id* (integer)
  //  1. Menu_Group (string[20])
  //  2. Menu_Name (string[40])
  //  3. Image_Index (integer)
  //  4. Form_Name (string[40])
  //  5. Form_Type (string[1])
  //Properties:
  //  0. MenuId* (integer)
  //  1. MenuGroup (string)
  //  2. MenuName (string)
  //  3. ImageIndex (integer)
  //  4. FormName (string)
  //  5. FormType (string)

  _SystemAccess_Arr = class;
  _SystemAccess = class;
  TSystemAccess_Arr = class;
  TSystemAccess = class;
  //Table Name: System_Access
  //Fields:
  //  0. User_Id* (string[20]) Reference to: System_User\User_Id
  //  1. Menu_Id* (integer) Reference to: System_Menu\Menu_Id
  //  2. Access_List (integer)
  //  3. Shortcut (integer)
  //  4. Outlook_Panel (string[20])
  //  5. Outlook_Button (string[40])
  //  6. Usage_Count (integer)
  //Properties:
  //  0. SystemUser* (_SystemUser)
  //  1. SystemMenu* (_SystemMenu)
  //  2. AccessList (integer)
  //  3. Shortcut (integer)
  //  4. OutlookPanel (string)
  //  5. OutlookButton (string)
  //  6. UsageCount (integer)

  _SystemConstant_Arr = class(TObject) {Strong-Container SystemConstant}
  protected
    FSystemConstant_Arr: array of _SystemConstant;
    function Get(Index: integer): _SystemConstant; virtual;
    function New: _SystemConstant; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property SystemConstant_Arr[Index: integer]: _SystemConstant read Get; default;

    function Add(ASeksi: string; ANama: string; ANilai: string): integer; virtual;
    function IndexOf(ASeksi: string; ANama: string): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _SystemConstant = class(TObject) {Strong-Basic SystemConstant}
  protected
    FSeq: integer;
    FSeksi: string; //[30]
    FNama: string; //[50]
    FNilai: string; //[0]
    FParentSeq: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property Seksi: string  read FSeksi write FSeksi;
    property Nama: string  read FNama write FNama;
    property Nilai: string  read FNilai write FNilai;
    property Seq: integer read FSeq write FSeq;
    property ParentSeq: integer read FParentSeq write FParentSeq;
    function SelectInDB(ASeksi: String='';ANama: String='';ANilai:String=''; ASeq:integer=0; AParentSeq:integer=0): boolean; virtual;
    class function ExistInDB( AItemCategory: string; AItemType: String=''): integer;
    class function ExistCatInDB( AItemCategory: string): integer;
  end;

  _SystemUser_Arr = class(TObject) {Strong-Container SystemUser}
  protected
    FSystemUser_Arr: array of _SystemUser;
    function Get(Index: integer): _SystemUser; virtual;
    function New: _SystemUser; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property SystemUser_Arr[Index: integer]: _SystemUser read Get; default;

    function Add(AUserId: string; AUserName: string; APasswd: string; AAccessLevel: integer; ADisableDate: TDate): integer; virtual;
    function IndexOf(AUserId: string): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _SystemUser = class(TObject) {Strong-Basic SystemUser}
  protected
    FUserId: string; //[20]
    FUserName: string; //[50]
    FPasswd: string; //[20]
    FAccessLevel: integer; //
    FDisableDate: TDate; //
 //   FDeptID : string;
  public
    constructor Create;
    destructor Destroy;override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property UserId: string  read FUserId write FUserId;
    property UserName: string  read FUserName write FUserName;
    property Passwd: string  read FPasswd write FPasswd;
    property AccessLevel: integer  read FAccessLevel write FAccessLevel;
    property DisableDate: TDate  read FDisableDate write FDisableDate;
//    property DeptID : string read FDeptID write FDeptID;
    function SelectInDB(AUserId: string;ADeptId:string=''): boolean; virtual;
    class function ExistInDB(AUserId: string): integer; virtual;
  end;

  _SystemReversal_Arr = class(TObject) {Strong-Container SystemReversal}
  protected
    FSystemReversal_Arr: array of _SystemReversal;
    function Get(Index: integer): _SystemReversal; virtual;
    function New: _SystemReversal; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property SystemReversal_Arr[Index: integer]: _SystemReversal read Get; default;

    function Add(AReversSeq: integer; AReversDate: TDate; ANotes: string; AUserId: string): integer; virtual;
    function IndexOf(AReversSeq: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _SystemReversal = class(TObject) {Strong-Basic SystemReversal}
  protected
    FReversSeq: integer; //<sequence
    FReversDate: TDate; //
    FNotes: string; //[0]
    FSystemUser: _SystemUser; //UserId: string
  public
    constructor Create;
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ReversSeq: integer  read FReversSeq write FReversSeq;
    property ReversDate: TDate  read FReversDate write FReversDate;
    property Notes: string  read FNotes write FNotes;
    property SystemUser: _SystemUser  read FSystemUser;

    function SelectInDB(AReversSeq: integer): boolean; virtual;
    class function ExistInDB(AReversSeq: integer): integer; virtual;
  end;

  _SystemMenu_Arr = class(TObject) {Strong-Container SystemMenu}
  protected
    FSystemMenu_Arr: array of _SystemMenu;
    function Get(Index: integer): _SystemMenu; virtual;
    function New: _SystemMenu; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property SystemMenu_Arr[Index: integer]: _SystemMenu read Get; default;

    function FindOnDB(AMenuId: integer = 0; AMenuGroup: string = ''; AMenuName: string = ''; AImageIndex: integer = 0; AFormName: string = ''; AFormType: integer = 0; AShortcut: integer = 0;aDeptID:string=''): integer; virtual;
    function Add(AMenuId: integer; AMenuGroup: string; AMenuName: string; AImageIndex: integer; AFormName: string; AFormType: integer; AShortcut: integer;ASubmenuName:string): integer; virtual;
    function IndexOf(AMenuId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _SystemMenu = class(TObject) {Strong-Basic SystemMenu}
  protected
    FMenuId: integer; //
    FMenuGroup: string; //[20]
    FMenuName: string; //[40]
    FImageIndex: integer; //
    FFormName: string; //[40]
    FFormType: integer; //[1]
    FShortcut: integer; //
    FSubMenuName : string;
    FDeptID : string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property MenuId: integer  read FMenuId write FMenuId;
    property MenuGroup: string  read FMenuGroup write FMenuGroup;
    property MenuName: string  read FMenuName write FMenuName;
    property ImageIndex: integer  read FImageIndex write FImageIndex;
    property FormName: string  read FFormName write FFormName;
    property FormType: integer  read FFormType write FFormType;
    property Shortcut: integer  read FShortcut write FShortcut;
    property SubMenuName : string read FSubMenuName write FSubMenuName;
    property DeptID : string read FDeptID write FDeptID;
    function SelectInDB(AMenuId: integer): boolean; virtual;
    class function ExistInDB(AMenuId: integer): integer; virtual;
  end;

  _SystemAccess_Arr = class(TObject) {Weak-Container SystemAccess}
  protected
    FSystemAccess_Arr: array of _SystemAccess;
    function Get(Index: integer): _SystemAccess; virtual;
    function New: _SystemAccess; virtual;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;virtual;
    property SystemAccess_Arr[Index: integer]: _SystemAccess read Get; default;

    function Add(AUserId: string; AMenuId: integer; AAccessList: integer; AShortcut: integer; AOutlookPanel: string; AOutlookButton: string; AUsageCount: integer): integer; virtual;
    function IndexOf(AUserId: string; AMenuId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _SystemAccess = class(TObject) {Weak-Basic SystemAccess}
  protected
    FSystemUser: _SystemUser; //UserId: string
    FSystemMenu: _SystemMenu; //MenuId: integer
    FAccessList: integer; //
    FOutlookPanel: string; //[20]
    FOutlookButton: string; //[40]
    FUsageCount: integer; //
    FCanAcces : integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property SystemUser: _SystemUser  read FSystemUser;
    property SystemMenu: _SystemMenu  read FSystemMenu;
    property AccessList: integer  read FAccessList write FAccessList;
    property OutlookPanel: string  read FOutlookPanel write FOutlookPanel;
    property OutlookButton: string  read FOutlookButton write FOutlookButton;
    property UsageCount: integer  read FUsageCount write FUsageCount;
    property CanAccess: integer  read FCanAcces write FCanAcces;
  end;

  TSystemConstant = class(TCustomIniFile)
  public
    destructor Destroy; override;
    function ReadChar(const Section, Name: string; const Default: char): char;
    procedure WriteChar(const Section, Name: string; const Content: char);
    function ReadString(const Section, Name, Default: string): string; override;
    procedure WriteString(const Section, Name, Content: String); override;
    procedure ReadSection(const Section: string; Strings: TStrings); override;
    procedure ReadSections(Strings: TStrings); override;
    procedure ReadSectionValues(const Section: string; Strings: TStrings); override;
    procedure EraseSection(const Section: string); override;
    procedure DeleteKey(const Section, Name: String); override;
    procedure UpdateFile; override;
  end;

  TSystemUser_Arr = class(_SystemUser_Arr)
  protected
    function Get(Index: integer): TSystemUser; reintroduce;overload;
    function New: _SystemUser; override;
  public
    procedure FindOnDB(LoginID:string='';LoginName:string='';AccessLevel:integer=-1;status:boolean=true;Dept:string='');
    property SystemUser_Arr[Index: integer]: TSystemUser read Get; default;
  end;

  TSystemUser = class(_SystemUser)
  protected
    FSystemAccess_Arr: TSystemAccess_Arr;
    function getDisable: boolean;
    procedure setDisable(const Value: boolean);
  public
    property SystemAccess_Arr: TSystemAccess_Arr read FSystemAccess_Arr write FSystemAccess_Arr;
    procedure UpdatePasswordOnDB;
    property is_disabled:boolean read getDisable write setDisable;
    procedure InsertOnDB; override;
    procedure UpdateOnDB; override;
    class procedure AccessLevelList(var ATarget:TStringList);
    class function IsExistInDB(userID:string): boolean;
    class function UserIDAlreadyRegistered(UserID: String): boolean;
  end;

  TSystemReversal = class(_SystemReversal);
  TSystemReversal_Arr = class(_SystemReversal_Arr);

  TFormType = (ftDetail,ftLookup,ftReview,ftBrowse,ftReport,ftSetting);
  TReportType = (rtMaster,rtDetail,rtMasterDetail,rtGlobal);
  TSystemMenu = class(_SystemMenu)
  protected
    function GetFormType: TFormType;
    procedure SetFormType(const Value: TFormType);
    function GetShortcut: TShortcut;
    procedure SetShortcut(const Value: TShortcut);
    
  public
    property FormType: TFormType read GetFormType write SetFormType;
    property Shortcut: TShortcut read GetShortcut write SetShortcut;
  end;

  TSystemMenu_Arr = class(_SystemMenu_Arr)
  protected
    function Get(Index: integer): TSystemMenu; reintroduce;
    function New: _SystemMenu; override;
  public
    function GetByMenuID(AMenuID: integer): TSystemMenu;
    property SystemMenu_Arr[Index: integer]: TSystemMenu read Get; default;
    procedure LoadFromDB(AShowHidden:TBooleanOperator=boNone);
    procedure getMenuGroup(var menuArr:TSystemMenu_Arr;menu_group:string);
    procedure getMenuGroupList(var aList:TStringList);
    function FindInDB(menu_id:integer=0;menu_group:string='';menu_name:string='';image_index:integer=-1;form_name:string='';form_type:integer=0;shortcut:integer=0):boolean;
    function FindInDB2: boolean;

  end;

  TAccessList = (alInsert,alUpdate,alView,alPrint,alRevers);
  TAccessListSet = set of TAccessList;
  TSystemAccess = class(_SystemAccess)
  protected
    FOwner: TObject; //pointer;
    function GetAccessList: TAccessListSet;
    procedure SetAccessList(const Value: TAccessListSet);
    function GetSystemMenu: TSystemMenu;
    function GetSystemUser: TSystemUser;
  public
    constructor Create(AOwner: TObject);
    destructor Destroy; override;
    procedure Reset; override;
    function SelectInDB(AUserID: string; AMenuID: integer): boolean; overload;
    function SelectInDB: boolean; overload;

    procedure IncUsageCount;
    procedure UpdateUsageCountOnDB;
    procedure UpdateOutlookOnDB;
    property SystemUser: TSystemUser read GetSystemUser;
    property SystemMenu: TSystemMenu read GetSystemMenu;
    property AccessList: TAccessListSet read GetAccessList write SetAccessList;
    property UsageCount: integer read FUsageCount;

    class function IsExisInDB(AUserID: string; AMenuID: integer): boolean;
    class function Can_Access(Sender : TForm;AMenuID:integer=0):boolean;
  end;

  TSystemAccess_Arr = class(_SystemAccess_Arr)
  protected
    FOwner: TObject; //pointer
    FIndexUsage_Arr  : array of integer;
    function Get(Index: integer): TSystemAccess; reintroduce;
    function New: _SystemAccess; override;
    function GetTopUsage(Position: integer): TSystemAccess;
  public
    constructor Create(AOwner: TObject);
    function LoadFromDB(AUserID: string; AMenuID: integer): integer; overload;
    function LoadFromDB: integer; overload;
    procedure SaveUsageCountOnDB;
    procedure SaveOutlookOnDB;

    function GetByFormName(AFormName: string): TSystemAccess;
    function GetByMenuID(AMenuID: integer): TSystemAccess;
    property SystemAccess_Arr[Index: integer]: TSystemAccess read Get; default;
    function Add(AUserId: string; AMenuId: integer; AAccessList: TAccessListSet; AShortcut: TShortcut; AOutlookPanel: string; AOutlookButton: string; AUsageCount: integer): integer; reintroduce; overload;
    function Add(AUserId: string; AAccessList: TAccessListSet; AShortcut: TShortcut; AOutlookPanel: string; AOutlookButton: string; AUsageCount: integer): integer; reintroduce; overload;
    function Add(AMenuId: integer; AAccessList: TAccessListSet; AShortcut: TShortcut; AOutlookPanel: string; AOutlookButton: string; AUsageCount: integer): integer; reintroduce; overload;
    function IndexOf(AUserId: string; AMenuId: integer): integer; reintroduce; overload;
    function IndexOf(AUserId: string): integer; reintroduce; overload;
    function IndexOf(AMenuId: integer): integer; reintroduce; overload;

    procedure InsertOnDB;
    procedure DeleteUpdateOnDB;//delete and then re-insert
    procedure RecalculateUsage;
    property TopUsage[Position: integer]: TSystemAccess read GetTopUsage;
    function LoadFromDB2(AUserID: string): integer;
  end;

var
  GlobalSystemUser: TSystemUser;
  GlobalPeriode : TPeriode;
  GlobalSystemMenu_Arr: TSystemMenu_Arr;
  Global_Date: TDate;
  Global_Prog_Pkg_Number: String;

  function getNextIDNum(fieldName:string;tableName:string;condition:String;prefix:string;reversedOrderNum:string='';minlength:integer=5):string;
  function getNextIDNumPeriode(fieldName:string;tableName:string;condition:String;prefix,suffix:string;reversedOrderNum:string='';minlength:integer=5):string;

  //reversedOrderNum = nomor order yang akan direversal, kalau bukan mencari number untuk
  //transaksi reversal, just ignore the reversedOrderNum
  //condition is in the form of ' AND [condition]'

implementation



function getStringFromSQL(aSql:string):string;
  var buffer :_Recordset;
 {} begin
    buffer := myConnection.OpenSQL(aSql);
    Result := '';
    if buffer.RecordCount > 0 then
      Result := BufferToString(buffer.Fields[0].Value);
    buffer.Close;
  end;

function getFloatFromSQL(aSql:string):double;
 var buffer :_Recordset;
  begin
    buffer := myConnection.OpenSQL(aSql);
    Result := 0;
   if buffer.RecordCount > 0 then
     Result := BufferToFloat(buffer.Fields[0].Value);
   buffer.Close;
  end;

  function getIntegerFromSQL(aSql:string):integer;
  var buffer :_Recordset;
  begin
    buffer := myConnection.OpenSQL(aSql);
    Result := 0;
    if buffer.RecordCount > 0 then
      Result := BufferToInteger(buffer.Fields[0].Value);
    buffer.Close;
  end;

 function ExecuteSQL(aSql:string):boolean;
 begin
    try myConnection.BeginSQL;
      myConnection.ExecSQL(aSql);
      myConnection.EndSQL;
      Result := True;
    except
      myConnection.UndoSQL;
      Result := False;
    end;
 end;

 function getBooleanFromSQL(aSql:string):boolean;
 var buffer :_Recordset;
  begin
    buffer := myConnection.OpenSQL(aSql);
    Result := False;
   if buffer.RecordCount > 0 then
     Result := BufferToInteger(buffer.Fields[0].Value)>0;
   buffer.Close;
  end;

  function getTDateFromSQL(aSql:string):TDate;
  var buffer :_Recordset;
  begin
    buffer := myConnection.OpenSQL(aSql);
    Result := 0;
    if buffer.RecordCount > 0 then
      Result := BufferToDateTime(buffer.Fields[0].Value);
    buffer.Close;
  end;

function getNextIDNumPeriode(fieldName:string;tableName:string;condition:String;prefix,suffix:string;reversedOrderNum:string='';minlength:integer=5):string;
var sql:string;buffer:_RecordSet;code:string; codeNum:integer;codeChar:Char; cond: string;
begin
  if reversedOrderNum <> '' then begin
    //get the last character in the number if it is non-number
    codeChar := (copy(reversedOrderNum,length(reversedOrderNum)-1,1))[1];
    if StrToIntDef(codeChar,0) = 0 then begin//if not-number then
      inc(codeChar);
      result := reversedOrderNum + codeChar;
    end else //if number than append 'a'
      result := reversedOrderNum + 'a';
  end else begin
    sql := 'SELECT MAX('+fieldName+') FROM '+tableName;
    cond := '';
    if condition <> '' then
      cond := cond + ' AND ' + copy(condition,5,length(condition));
    if prefix <> '' then
      cond := cond + ' AND ' + fieldname + ' LIKE ' + FormatSQLString(prefix+'%'+suffix);
    if cond <> '' then begin
      delete(cond,1,5);
      sql := sql + ' WHERE ' + cond;
    end;
    buffer := myConnection.OpenSQL(sql);
    if buffer.RecordCount > 0 then begin
    //'STL/MFG/PPC/POI00001/V/2004'
      code := BufferToString(buffer.Fields[0].Value);
      //cut off the prefix the last digit if it is a character
      code := copy(code,length(prefix)+1,length(code)-length(prefix));
      code := EkstrakString(code,'/',1);
      codeNum := StrToIntDef(code,0);
      inc(codeNum);
      result := prefix+IntToStrFixed(minlength,codeNum);
    end else
      result := prefix+IntToStrFixed(minlength,1);
    buffer.Close;
  end;
end;

function getPeriode(aDate:TDate):string;
var tmp : string;
begin
   case MonthOf(aDate) of
     1    : tmp:= 'I/';
     2    : tmp:= 'II/';
     3    : tmp:= 'III/';
     4    : tmp:= 'IV/';
     5    : tmp:= 'V/';
     6    : tmp:= 'VI/';
     7    : tmp:= 'VII/';
     8    : tmp:= 'VIII/';
     9    : tmp:= 'IX/';
     10   : tmp:= 'X/';
     11   : tmp:= 'XI/';
     12   : tmp:= 'XII/';
   end;
   Result := '/'+tmp + IntToStr(YearOf(aDate));
end;

function getPeriode2(aDate:TDate; YearType: integer):string;
var tmp : string;
begin
   case MonthOf(aDate) of
     1    : tmp:= '01/';
     2    : tmp:= '02/';
     3    : tmp:= '03/';
     4    : tmp:= '04/';
     5    : tmp:= '05/';
     6    : tmp:= '06/';
     7    : tmp:= '07/';
     8    : tmp:= '08/';
     9    : tmp:= '09/';
     10   : tmp:= '10/';
     11   : tmp:= '11/';
     12   : tmp:= '12/';
   end;
   if YearType= 1then
     Result := '/'+tmp + FormatDateTime('yy',aDate)
   else if YearType= 2 then
     Result := '/'+tmp + IntToStr(YearOf(aDate));
end;


function getCurrentSequence(aSequenceName:string):integer;
var sql:string;buffer:_Recordset;
begin
  sql := 'SELECT '+aSequenceName+'.Currval From Dual ';
  try
    buffer := myConnection.OpenSQL(sql);
    Result := BufferToInteger(buffer.Fields[0].Value);
  except
    //Result := -1;
    Raise;
  end;
  buffer.Close;
end;

function getNextSequence(aSequenceName:string):integer;
var sql:string;buffer:_Recordset;
begin
  sql := 'SELECT '+aSequenceName+'.Nextval From Dual ';
  try
    buffer := myConnection.OpenSQL(sql);
    Result := BufferToInteger(buffer.Fields[0].Value);
  except
    Raise;
  end;
  buffer.Close;
end;

function CurrToIndonesianSpeech(nl : string):string;
const vlstep : array [0..4] of string = (' ','ribu ','juta ','milyar ','trilyun ');
var i, j, k, panjang, m  : integer;
    stemp, stemp2, addstr : string;
    nl2, nltemp, qtemp : string;
    good, belas : boolean;
begin
  good := false;
  for i:=1 to Length(nl) do
  begin
    if (nl[i] <> '0') then
       good := true;
    if (good) then
       nl2 := nl2 + nl[i];
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


{ new macro routines }

  function GetResultDef(sql: string; defnull, defnotfound, defmultiplefound: integer): integer; overload;
  var buffer: _RecordSet;
  begin
    buffer := myConnection.OpenSQL(sql);
    if (buffer.RecordCount=0) then
      Result := defnotfound
    else if (buffer.RecordCount>1) then
      Result := defmultiplefound
    else
      Result := BufferToIntegerDef(buffer.Fields[0].Value, defnull);
    buffer.Close;
  end;

  function GetResultDef(sql: string; defnull, defnotfound, defmultiplefound: real): real; overload;
  var buffer: _RecordSet;
  begin
    buffer := myConnection.OpenSQL(sql);
    if (buffer.RecordCount=0) then Result := defnotfound
    else if (buffer.RecordCount>1) then Result := defmultiplefound
    else Result := BufferToFloatDef(buffer.Fields[0].Value, defnull);
    buffer.Close;
  end;

  function GetResultDef(sql: string; defnull, defnotfound, defmultiplefound: string): string; overload;
  var buffer: _RecordSet;
  begin
    buffer := myConnection.OpenSQL(sql);
    if (buffer.RecordCount=0) then Result := defnotfound
    else if (buffer.RecordCount>1) then Result := defmultiplefound
    else Result := BufferToStringDef(buffer.Fields[0].Value, defnull);
    buffer.Close;
  end;

  function generateRandomPassword:string;
  var i,j:integer;pwd:string;MyArray:string[26];
  begin
    MyArray := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    Randomize;
    j:=RandomRange(2,4);
    for i := 1 to j do begin
      pwd := pwd + MyArray[RandomRange(0,25)+1];
    end;
    for i:= 1 to 2 do begin
      pwd := pwd + IntToStr(RandomRange(0,9));
    end;
    j:=RandomRange(1,2);
    for i := 1 to j do begin
      pwd := pwd + MyArray[RandomRange(0,25)+1];
    end;
    result := pwd;
  end;

  function GetMonthYear(aMonth: Integer; aYear: TDate): string;
  var Month: string;
  begin
    if aMonth < 10 then
      Month := '0' + IntToStr(aMonth)
    else Month := IntToStr(aMonth);
    Result:= Month + '/' + Copy(EkstrakString(DateToStr(aYear),'/',3),3,2);
  end;

  procedure getMonths(var target:TStringList);
  begin
    target.Clear;
    target.Add('1=January');
    target.Add('2=February');
    target.Add('3=Maret');
    target.Add('4=April');
    target.Add('5=Mei');
    target.Add('6=Juni');
    target.Add('7=Juli');
    target.Add('8=Agustus');
    target.Add('9=September');
    target.Add('10=Oktober');
    target.Add('11=November');
    target.Add('12=December');
  end;

  procedure getDayOfWeekList(var target:TStringList);
  begin
    target.Clear;
    target.Add('1=Senin');
    target.Add('2=Selasa');
    target.Add('3=Rabu');
    target.Add('4=Kamis');
    target.Add('5=Jumat');
    target.Add('6=Sabtu');
    target.Add('7=Minggu');
  end;

  function IntToStrFixed(MinLen: integer; Input: integer): string;
  var tmpStr: string;
    i: integer;
  begin
    tmpStr := IntToStr(Input);
    for i := 1 to MinLen-length(tmpStr) do
      tmpStr := '0'+tmpStr;
    result := tmpStr;
  end;

  function CurrToStrFmt(Input: currency): string;
  begin
    Result := Format('%m',[Input]);
  end;

  function StrToCurrFmt(Input: string):currency;
  var tempStr:string; index:integer;
  begin
    tempStr := copy(input,pos('p',input)+1,length(input));
    while true do begin
      index := pos('.',tempStr);
      if index <= 0 then
        break;
      delete(tempStr,pos('.',tempStr),1);
    end;
    result := StrToCurr(tempStr);
  end;

  function IsInteger(AString: string): boolean;
  begin
    try
      StrToInt(AString);
      Result :=true
    except
      on EConvertError do
        Result :=false;
    end;
  end;

  function allColSelected(var grid:TAdvStringGrid):boolean;
  var isRowSelected:boolean;i:integer;
  begin
    isRowSelected := true;
    for i := 1 to grid.ColCount-1 do begin
      if Not grid.IsSelected(i,grid.Row) then begin
        isRowSelected := false;
        break;
      end;
    end;
    result:= isRowSelected;
  end;

  function IsFloat(AString: string): boolean;
  begin
    try
      StrToFloat(AString);
      Result :=true
    except
      on EConvertError do
        Result :=false;
    end;
  end;

  procedure StringListToStrings(AValueList: TStringList; AList: TStrings);
  var i: integer;
  begin
    AList.Clear;
    for i :=0 to AValueList.Count-1 do
      AList.Add(AValueList.Strings[i]);
  end;

  procedure NameValueListToNameList(AValueList: TStringList; AList: TStrings);
  var i: integer;
  begin
    AList.Clear;
    for i :=0 to AValueList.Count-1 do
      AList.Add(AValueList.Names[i]);
  end;

  procedure NameValueListToValueList(AValueList: TStringList; AList: TStrings);
  var i: integer;
  begin
    AList.Clear;
    for i :=0 to AValueList.Count-1 do
      AList.Add(AValueList.Values[AValueList.Names[i]]);
  end;

  procedure SQLToStringList(var AStringList: TStringList; ASQL: string);
  var buffer: _Recordset;
    i: integer;
  begin
    AStringList.Clear;
    buffer := myConnection.OpenSQL(ASQL);
    for i :=1 to buffer.RecordCount do begin
      AStringList.Add(VarToStr(buffer.Fields[0].Value));
      buffer.MoveNext;
    end;
    buffer.Close;
  end;

  procedure SQLToNameValueList(var AStringList: TStringList; ASQL: string);
  var buffer: _Recordset;
    i: integer;
  begin
    AStringList.Clear;
    buffer := myConnection.OpenSQL(ASQL);
    for i :=1 to buffer.RecordCount do begin
      AStringList.Add(BufferToString(buffer.Fields[0].Value)+'='+BufferToString(buffer.Fields[1].Value));
      buffer.MoveNext;
    end;
    buffer.Close;
  end;

  procedure SQLToNameValueList2(var AStringList: TStringList; ASQL: string);
  var buffer: _Recordset;
    i: integer;
  begin
    AStringList.Clear;
    buffer := myConnection.OpenSQL(ASQL);
    for i :=1 to buffer.RecordCount do begin
      AStringList.Add(VarToStr(buffer.Fields[0].Value)+'='+VarToStr(buffer.Fields[1].Value));
      buffer.MoveNext;
    end;
    AStringList.Insert(0,'0'+'='+'Semua');
    buffer.Close;
  end;
{unsorted macro routines}

  procedure CopyBitmap(const Source: TBitmap; ColWidth, RowWidth, ColIndex, RowIndex: integer; const Dest: TBitmap);
  begin
    Dest.TransparentColor := Source.TransparentColor;
    Dest.Width := ColWidth;
    Dest.Height := RowWidth;
    Dest.Canvas.CopyRect(Rect(0,0,ColWidth,RowWidth),Source.Canvas,
      Rect(ColIndex*ColWidth,RowIndex*RowWidth,(ColIndex+1)*ColWidth,(RowIndex+1)*RowWidth));
  end;

  procedure PrintRawDocument(const DocTitle, TextToPrint: String);
  var
    RP: TRawPrinter;
  begin
    RP := TRawPrinter.Create(nil);
    try
      RP.DocumentTitle := DocTitle;
      RP.BeginDoc;
      RP.WriteStr(TextToPrint);
      RP.EndDoc;
    finally
      RP.Free;
    end;
  end;

  function IntToStrFmt(Input: integer): string;
  begin
    Result := FormatCurr('#,##0',Input);
  end;

  function FormatDuit(Value: Currency): string;
  begin
    Result := CurrencyString+' '+FormatCurr('#,##0',Value);
  end;

  procedure WriteLog(AFileName: string; ALog: string);
  var FP: Text;
  begin
    AssignFile(FP,AFileName);
    {$I-} Append(FP); {$I+}
    if (IOResult <> 0) then Rewrite(FP);
    Writeln(FP, ALog);
    CloseFile(FP);
  end;

  function DuitStrToIntStr(Value: string): string;
  begin
    while (Pos(ThousandSeparator,Value)<>0) do
      Delete(Value,Pos(ThousandSeparator,Value),1);
    Result := Value;
  end;

  function TrimAll(Input: string): string;
  { I.S. : Input terdefinisi
    F.S. : menghasilkan string dengan spasi awal dan akhir dihilangkan
           dan spasi antar kata sebanyak satu spasi }
  var i: integer;
      TmpStr: string;
  begin
    Input:=Trim(Input);
    TmpStr:='';
    for i:=1 to Length(Input) do
      if (Input[i]<>' ') or ((Input[i]=' ') and (TmpStr[Length(TmpStr)]<>' ')) then
        TmpStr:=TmpStr+Input[i];

    Result:=TmpStr;
  end;

  procedure InitAllTextBox(var Form: TForm);
  { I.S. : Form terdefinisi, pada pemanggilan harus menggunakan typecasting
           mis: ClearAllTextBox(TForm(frmCoba));
    F.S. : Semua textbox (TEdit atau TAdvEdit) pada form akan diinisialisasi dengan string
           kosong, enabled=true, readonly=false }
  var i: integer;
  begin
    for i:=0 to Form.ComponentCount-1 do
      if (Form.Components[i] is TEdit) then begin
        (Form.Components[i] as TEdit).Text:='';
        (Form.Components[i] as TEdit).Enabled:=true;
        (Form.Components[i] as TEdit).ReadOnly:=false;
      end else if (Form.Components[i] is TAdvEdit) then begin
        (Form.Components[i] as TAdvEdit).Text:='';
        (Form.Components[i] as TAdvEdit).Enabled:=true;
        (Form.Components[i] as TAdvEdit).ReadOnly:=false;
      end;
  end;

  procedure LoadBufferToAdvGrid(buffer: _RecordSet; var Grid: TAdvStringGrid; StartCol,StartRow: integer);
  { I.S. : buffer terdefinisi (hasil query), Grid sembarang, StartCol
           adalah kolom paling kiri untuk diisi, StartRow adalah baris paling
           atas untuk diisi
    F.S. : grid terisi data dari buffer sesuai dengan urutan buffer }
  var i, j: integer;
  begin
    Grid.ClearNormalCells;
    Grid.RowCount:=StartRow+buffer.RecordCount;

    for i:=0 to buffer.RecordCount-1 do begin
      for j:=0 to buffer.Fields.Count-1 do begin
        case VarType(buffer.Fields[j].Value) of
          varNull: Grid.Cells[StartCol+j,StartRow+i]:='';
          varDate: Grid.Dates[StartCol+j,StartRow+i]:=buffer.Fields[j].Value;
          varSmallint, varInteger, varShortInt, varByte, varWord, varLongword, varInt64: Grid.Ints[StartCol+j,StartRow+i]:=buffer.Fields[j].Value;
          varSingle, varDouble, varCurrency: Grid.Floats[StartCol+j,StartRow+i]:=buffer.Fields[j].Value;
          else Grid.Cells[StartCol+j,StartRow+i]:=buffer.Fields[j].Value;
        end;
      end;
      buffer.MoveNext;
    end;
  end;

  function EkstrakString(Input: string; Limiter: char; Count: integer): string;
  { I.S. : Input = string yang akan di-extract, Limiter = karakter yang
           dipakai sebagai tanda pemisah, Count = bagian ke berapa yang
           akan diambil, paling kiri adalah bagian ke-1
    F.S. : menghasilkan substring ke-Count dari Input dengan batas Limiter }
  var Ctr, Posisi: integer;
      TmpString: string;
  begin
    TmpString:='';
    Ctr:=0;
    while (Ctr<Count) do
    begin
      Posisi:=Pos(Limiter,Input);
      if (Posisi=0) then
        Posisi:=Length(Input)+1;
      TmpString:=Copy(Input,1,Posisi-1);
      Delete(Input,1,Posisi);
      Ctr:=Ctr+1;
    end;

    Result:=TmpString;
  end;


  function CekTanggal(Input: string): boolean;
  { I.S. : Input terdefinisi
    F.S. : menghasilkan true jika Input merupakan format tanggal yang benar
           sesuai dengan ShortDateFormat }
  var TmpString, Tgl, Bln, Thn : string;
      Valid: boolean;
      i: integer;
  begin
    for i:=1 to 3 do begin
      TmpString:=EkstrakString(ShortDateFormat,DateSeparator,i);
      if (Pos('D',UpperCase(TmpString))<>0) then
        Tgl:=EkstrakString(Input,DateSeparator,2)
      else if (Pos('M',UpperCase(TmpString))<>0) then
        Bln:=EkstrakString(Input,DateSeparator,i)
      else if (Pos('Y',UpperCase(TmpString))<>0) then
        Thn:=EkstrakString(Input,DateSeparator,3);
    end;

    if (not CekInteger(Trim(Tgl))) or (not CekInteger(Trim(Bln))) or (not CekInteger(Trim(Thn))) then
      Valid:=false
    else
      Valid:=IsValidDate(StrToInt(Thn),StrToInt(Bln),StrToInt(Tgl));

    Result:=Valid;
  end;

  function ReformatFloat(newsep: char; input: string):string;
  { I.S. : newsep, input terdefinisi, newsep diisi dengan tanda '.' atau ','
    F.S. : menghasilkan string input yang diubah tanda '.' pertama jadi ',' dan
           sebaliknya }
  var oldsep: char;
  begin
    if (newsep=',') then
      oldsep:='.'
    else if (newsep='.') then
      oldsep:=','
    else
      oldsep:=#0;

    if (pos(oldsep,input)>0) then
      input[pos(oldsep,input)]:=newsep;
    result:=input;
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

  function ReverseFormatDate(Tanggal:string): TDate;
  { I.S. : Tanggal terdefinisi dengan format "d mmm yyyy"
    F.S. : menghasilkan TDate sesuai dengan Tanggal }
  var Hasil: TDate;
      i: integer;
  begin
    Tanggal:=TrimAll(UpperCase(Tanggal));
    for i:=1 to 12 do
    begin
      Hasil:=EncodeDate(1,i,1);
      Tanggal:=ReplaceSubStr(Tanggal,UpperCase(FormatDateTime('mmm',Hasil)),IntToStr(i));
    end;
    Hasil:=EncodeDate(StrToInt(EkstrakString(Tanggal,' ',3)),StrToInt(EkstrakString(Tanggal,' ',2)),StrToInt(EkstrakString(Tanggal,' ',1)));

    Result:=Hasil;
  end;

  function SetStrLen(Input: string; Len: integer; FillChar: char; FillPos: TAlignment): string;
  { I.S. : Input, Len, FillChar, dan FillPos terdefinisi.
           FillPos diisi dengan tpKiri atau tpKanan
    F.S. : jika panjang Input lebih kecil dari Len maka akan menghasilkan
           string Input yang ditambahkan dengan karakter FillChar pada posisi
           kiri atau kanan string (sesuai FillPos) hingga Input memiliki
           panjang=Len, jika panjang Input>=Len maka akan menghasilkan string
           Input tanpa perubahan }
  begin
    if (FillPos=taRightJustify) or (FillPos=taLeftJustify) then
      while (Length(Input)<Len) do begin
        if (FillPos=taRightJustify) then
          Input:=FillChar+Input
        else if (FillPos=taLeftJustify) then
          Input:=Input+FillChar;
      end;

    Result:=Input;
  end;

  function HitungChar(Input: string; Karakter: Char): integer;
  { I.S. : Input dan Karakter terdefinisi
    F.S. : menghasilkan jumlah Karakter yang terdapat pada input }
  var i, Count: integer;
  begin
    Count:=0;
    for i:=1 to Length(Input) do begin
      if (Input[i]=Karakter) then
        Inc(Count);
    end;

    Result:=Count;
  end;

  

{global macro routines}

  function GetAppPath: string;
  begin
    Result := ExtractFilePath(ParamStr(0));
    if Result[Length(Result)] <> '\' then Result := Result + '\';
  end;


{check macro routines}

  function CekInteger(Input: string): boolean;
  { I.S. : Input terdefinisi
    F.S. : menghasilkan true jika Input adalah bilangan integer }
  begin
    try
      StrToInt(Input);
      Result:=true
    except
      on EConvertError do
        Result:=false;
    end;
  end;

  function CekInteger(Input: string; LBound,UBound: integer): boolean; overload;
  { I.S. : Input, LBound, UBound terdefinisi
    F.S. : menghasilkan true jika Input merupakan bilangan integer
           yang terletak antara LBound dan UBound (LBound<=Input<=UBound)
           Jika LBound>UBound maka batas tidak akan diperiksa (hanya memeriksa
           integer atau bukan) }
  var TmpInt: integer;
      Status: boolean;
  begin
    TmpInt:=0;
    Status:=true;
    try
      TmpInt:=StrToInt(Input);
    except
      on EConvertError do
        Status:=false;
    end;
    if (Status) and (LBound<UBound) then
      if ((TmpInt<LBound) or (TmpInt>UBound)) then
        Status:=false;

    Result:=Status;
  end;

  function CekFloat(Input: string): boolean; overload;
  { I.S. : Input terdefinisi
    F.S. : menghasilkan true jika Input merupakan bilangan real }
  var Status: boolean;
  begin
    Status:=true;
    try
      StrToFloat(Input);
    except
      on EConvertError do
        Status:=false;
    end;

    Result:=Status;
  end;

  function CekFloat(Input: string; LBound, UBound: integer): boolean; overload;
  { I.S. : Input, LBound, UBound terdefinisi
    F.S. : menghasilkan true jika Input merupakan bilangan real
           yang terletak antara LBound dan UBound (LBound<=Input<=UBound)
           Jika LBound>UBound maka batas tidak akan diperiksa (hanya memeriksa
           real atau bukan) }
  var TmpReal: real;
      Status: boolean;
  begin
    TmpReal:=0;
    Status:=true;
    try
      TmpReal:=StrToFloat(Input);
    except
      on EConvertError do
        Status:=false;
    end;

    if (Status) and (LBound<UBound) then
      if ((TmpReal<LBound) or (TmpReal>UBound)) then
        Status:=false;

    Result:=Status;
  end;


{format macro routines}

  function qoute(s: string): string;
  begin
    Result := '"'+s+'"';
  end;

  function f2s(f: Extended): string;
  begin
    Result := FormatFloat('#, ##0.##', f);
  end;

  function f2s(f: Extended; decimal: Byte): string;
  begin
    Result := FormatFloat('#, ##0.'+Copy('00000000', 1, decimal), f);
  end;

  function s2f(s: string): Extended;
  var
    p : Integer;
    sorg : string;
  begin
    s := Trim(s);
    sorg := s;
    p := 1;
    while p <= Length(s) do
      if s[p] in ['0'..'9', '.'] then
        inc(p)
      else
        Delete(s, p, 1);
    if s = '' then
      Result := 0
    else begin
      Result := StrToFloat(s);
      if (sorg[1] = '-') or ((sorg[1] = '(') and (sorg[Length(sorg)] = ')')) then
        Result := -Result; //Negate
    end;
  end;

  function fixfs(s: string): string;
  begin
    Result := FloatToStr(s2f(s));
  end;

  function FormatMoney(f: Extended): string;
  begin
    if f >= 0 then
      Result := FormatFloat('Rp #, ##0.00', f)
    else
      Result := FormatFloat('(Rp #, ##0.00)', -f);
  end;

  function b2s(b: Boolean): string;
  begin
    if b then
      Result := '1'
    else
      Result := '0';
  end;

  function d2s(d: TDate): string;
  begin
    Result := FormatDateTime('dd mmm yyyy', d);
  end;

  function s2d(s: string): TDate;
  var
    dt: TDateTime;
    i, j: integer;
    bulan, tahun, tgl: string;
  begin
    if s = '' then begin
      Result := now;
      Exit;
    end;
    //Replace month name
    s:=ReplaceSubStr(s, 'Jan', '01');
    s:=ReplaceSubStr(s, 'Feb', '02');
    s:=ReplaceSubStr(s, 'Mar', '03');
    s:=ReplaceSubStr(s, 'Apr', '04');
    s:=ReplaceSubStr(s, 'May', '05');
    s:=ReplaceSubStr(s, 'Jun', '06');
    s:=ReplaceSubStr(s, 'Jul', '07');
    s:=ReplaceSubStr(s, 'Aug', '08');
    s:=ReplaceSubStr(s, 'Sep', '09');
    s:=ReplaceSubStr(s, 'Oct', '10');
    s:=ReplaceSubStr(s, 'Nov', '11');
    s:=ReplaceSubStr(s, 'Dec', '12');
    s:=ReplaceSubStr(s, ' ', '/');
    tgl := copy(S, 1, 2);
    for i := 1 to 2 do begin
      j := Pos('/', S);
      if i=1 then begin
        //ambil bulan
        bulan := copy(S, j+1, 2);
        delete(S, j, 1);
      end else
        //ambil Tahun
        Tahun := copy(S, j+3, 2);
    end;
    //Discard time information, if any...
    s := bulan+'/'+tgl+'/'+tahun;
    //Showmessage('Data yang mau diformat: '+s);
    if Pos(': ', s) > 0 then begin
      dt := StrToDateTime(s);
      Result := Trunc(dt);
    end else
      Result := StrToDate(s);
  end;

  function converttanggal(Value: TDate): string;
  var a: string;
  begin
    a := DateToStr(Value);
    Result := a;
  end;

  function FormatLCD(input: string): string;
  var s: string;
  begin
    s := input;
    s := '              '+s;
    s := Copy(s, Length(s)-10, 11);
    Result := s;
  end;


{dialog macro routines}

  function Confirmed(prompt: string): Boolean;
  begin
    Result := ( MessageDlg(prompt, mtConfirmation, [mbYes, mbNo], 0) = mrYes );
  end;

  procedure Alert(AlertMsg: string);
  begin
    MessageDlg(AlertMsg, mtWarning, [mbOK], 0);
  end;

  procedure Inform(Information: string);
  begin
    MessageDlg(Information, mtInformation, [mbOK], 0);
  end;


{form macro suport}

  procedure ClearForm(frm: tform);
  var i: integer;
  begin
    for i := 0 to frm.ComponentCount-1  do begin
      if ((frm.components[i] is tadvedit) or (frm.components[i] is tedit)) then begin
        if (frm.components[i] is tadvedit) then begin
          if (frm.components[i] as tadvedit).visible then
            (frm.components[i] as  tadvedit).text := '';
        end else if (frm.components[i] as tedit).visible then
          (frm.components[i] as tedit).text := '';
      end else if (frm.Components[i] is TAdvStringGrid) then
        (frm.Components[i] as TAdvStringGrid).ClearNormalCells
    end;
  end;

  function cekkosong(frm: tform): boolean;
  var i: integer; t: tcomponent; k: TCaption;
  begin
    for i := 0 to (frm.ComponentCount-1) do begin
      t := frm.Components[i];
      if ((t is tadvedit) and ((t as tadvedit).visible)) then begin
        k := (t as tadvedit).text;
        //showmessage('Teks sekarang: '+k);
        if  (trim(k)='') then begin
          Result := true;
          Alert('Input '+(t as tadvedit).Hint+'   tidak boleh kosong!');
          exit;
        end;
        if ((t as tadvedit).tag=1) then begin
          if (not (CekFloat(k))) then begin
            Result := true;
            Alert('Input   '+(t as tadvedit).hint+'  hanya  boleh  angka!');
            exit;
          end;
        end;
      end;
    end;
    Result := false;
  end;

  procedure TextToEdit(frm: tform; editbox: string;
    Value: string);
  var i: integer;
  begin
    for i := 0 to frm.ComponentCount-1 do begin
      if (frm.Components[i] is tadvedit) then
        if (uppercase((frm.Components[i] as tadvedit).name)=uppercase(editbox)) then
          (frm.Components[i] as tadvedit).text := Value;
    end;
  end;


{wincontrol macro routines}

  procedure SetEditReadOnly(TextBox: TAdvEdit;
    IsReadOnly: Boolean);
  begin
    with TextBox do
      if IsReadOnly then begin
        Color := $00AFD2FA;
        Enabled := False;
        TabStop := False;
      end else begin
        Color := clWhite;
        Enabled := True;
        TabStop := True;
      end;
  end;

  procedure SetComboReadOnly(ComboBox: TComboBox;
    IsReadOnly: Boolean);
  begin
    with ComboBox do
      if IsReadOnly then begin
        Color := $00AFD2FA;
        Enabled := False;
        TabStop := False;
      end else begin
        Color := clWhite;
        Enabled := True;
        TabStop := True;
      end;
  end;

  procedure SetEditReadOnly(DateTimePicker: TDateTimePicker;
    IsReadOnly: Boolean);
  begin
    with DateTimePicker do
      if IsReadOnly then begin
        Color := $00AFD2FA;
        Enabled := False;
        TabStop := False;
      end else begin
        Color := clWhite;
        Enabled := True;
        TabStop := True;
      end;
  end;

  function SetComboListValue(Combo: TComboBox;
    NewValue: string): Integer;
  begin
    Result := Combo.Items.IndexOf(NewValue);
    Combo.ItemIndex := Result;
  end;


{stringgrid macro routines}

  procedure TextToGrid(adv: TAdvStringGrid; kolom, baris: integer;
    Text: string);
  begin
    adv.Cells[kolom, baris] := Text;
  end;

  procedure edittogrid(adv: TAdvStringGrid; kolom, baris: integer;
    editbox: tadvedit);
  begin
    adv.Cells[kolom, baris] := editbox.Text;
  end;

  procedure DateToGrid(adv: TAdvStringGrid; kolom, baris: integer;
    InputDate: TDateTimePicker);
  begin
    adv.Cells[kolom, baris] := d2s(InputDate.date);
  end;

  function cekkosonggrid(adv: TAdvStringGrid; row: integer): boolean;
  var i: integer;
  begin
    for i := 0 to adv.ColCount-1 do
      if (trim(adv.cells[i, row])='') then begin
        Result := true;
        exit;
      end;
    Result := false;
  end;

  procedure deleterow(grid: TAdvStringGrid; row: integer; idcol: integer;CekColumn:boolean);
  begin
    if CekColumn then begin
      if (grid.Cells[idcol, row]<>'') then begin
        grid.Clearrows(row, 1);
        if (grid.RowCount<>2) then
          grid.RemoveRows(row, 1);
      end;
    end
    else begin
      if grid.RowCount <> 2 then
        grid.RemoveRows(row, 1)
      else
        grid.Clearrows(row, 1);
    end;
    grid.Update;
  end;

  function AtLeastOneData(Grid: TadvStringGrid): boolean;
  var i:integer;
  begin
    result:=false;
    for i:=1 to Grid.RowCount-1 do begin
      if (not CekKosongGrid(Grid,i)) then begin
        result:=true;
        break;
      end;
    end;
  end;


{chart macro routines}

  procedure GetDataIntoChart(var InputChart: Tchart; var InputSeries: TLineSeries;
    Query: string; adc: TADOConnection);
  var hasil: _RecordSet;
    nilaix: string;
    i: integer;
    nilaiy: double;
  begin
    //FFields no: 0 untuk nilai x dan FFields no: 1 untuk nilai y
    //nilaix := converttanggal(hasil.FFields[0].Value); //tanggal
    hasil := adc.Execute(Query);
    if hasil.RecordCount<>0 then begin
      InputChart.Width := hasil.recordcount*100;
      for i := 0 to hasil.RecordCount-1 do begin
        if vartype(hasil.Fields[0].Value)=vardate then
          nilaix := d2s(hasil.Fields[0].Value)
        else
          nilaix := hasil.Fields[0].Value;
        nilaiy := hasil.Fields[1].Value;
        InputSeries.Add(nilaiy, nilaix);
        hasil.MoveNext;
      end;
    end;
  end;


{stringlist macro routines}

  function maxstringlist(b: tstringlist): real;
  var max: real;
      i: integer;
  begin
    max := 0;
    for i := 0 to b.Count-1 do begin
      if i=0 then
        max := strtofloat(b.strings[i])
      else begin
        if (max<strtofloat(b.strings[i])) then
          max := strtofloat(b.strings[i]);
      end;
    end;
    Result := max;
  end;

  function existOTS(T: Tstringlist; search: string): boolean;
  begin
    if t.IndexOf(search)<>-1 then
      Result := true
    else
      Result := false;
  end;

  function IndexofValue(aList:TStringList;aValue:string):integer;
  var i:integer;
  begin
    Result := -1;
    for i:= 0 to aList.Count -1 do begin
      if aValue = aList.Values[aList.Names[i]] then
        Result := i;
    end;
  end;
(*
{lcdscreen macro routines}

  procedure HitungColsToLcd(var lcd: TLcdScreen;
    adv: TAdvStringGrid; col: integer; with_koma: boolean);
  var temp: ^int64;
      i: integer;
      s: string;
  begin
    new(temp);
    temp^ := 0;
    for i := 1 to adv.rowcount-1 do begin
      temp^ := temp^+StrToInt64Def(adv.cells[col, i], 0);
    end;
    if with_koma then
      FillLCD(lcd, temp^)
    else begin
      s := '              '+inttostr(temp^);
      s := Copy(s, Length(s)-10, 11);
      Lcd.Lines[0] := s;
    end;
    dispose(temp);
  end;

  procedure FillLCD(LCD: TLCDScreen; Value: int64);
  var
    s, k : string;
    neg : Boolean;
  begin
    neg := (Value < 0);
    if neg then Value := -Value;
    s := '';
    while Value > 0 do begin
      k := '00'+IntToStr(Value mod 1000);
      if s > '' then s := ', '+s;
      s := Copy(k, Length(k)-2, 3) + s;
      Value := Value div 1000;
    end;
    if s = '' then
      s := '0'
    else
      while (s[1] = '0') do Delete(s, 1, 1);
    if neg then s := '-'+s;
    s := '            '+s;
    s := Copy(s, Length(s)-10, 11);
    LCD.Lines[0] := s;
  end;
*)
(*
{print macro routines}

  procedure RawPrint(DocTitle, TextToPrint: string);
  var
    RP: TRawPrinter;
  begin
    RP := TRawPrinter.Create(nil);
    try
      RP.DocumentTitle := DocTitle;
      RP.BeginDoc;
      RP.WriteStr(TextToPrint);
      RP.EndDoc;
    finally
      RP.Free;
    end;
  end;

  procedure RawPrint(const DocTitle, Header, Footer: string;
    StringGrid: TAdvStringGrid; const Widths: array of shortint);
  var
    s : string;
    ESC: TEpsonSequence;
    y, x : Integer;
    AAlignment : TAlignment;
  begin
    //Length of Widths array must match StringGrid.ColCount
    if Length(Widths) <> StringGrid.ColCount then
       raise Exception.Create('RawPrint error: Length of widths array not match column count of '+StringGrid.Name);
    //Copy header
    s := Header+CRLF;
    //Create sequence
    ESC := TEpsonSequence.Create;
    try
      with StringGrid do
        for y := 0 to StringGrid.RowCount-1 do
          if stringgrid.IsHiddenRow(y) = False then
            with Rows[y] do begin
              //Make fixed and node row(s) bold
              if (y < FixedRows) or IsNode(y)
                 or (y >= RowCount-FixedFooters) then
                s := s + escBold;
              //Underline first and last row
              if y in [0, RowCount-1] then s := s + escUnderline;
              //Process all columns except for node
              if IsNode(y) then
                s := s + escItalic + Strings[GroupColumn] + escUnItalic
              else
                for x := 0 to ColCount-1 do
                  if IsHiddenColumn(x) = False then begin
                    //Default alignment: Left justify
                    AAlignment := taLeftJustify;
                    //Get alignment FROM string grid if OnGetAlignment is assigned
                    {if Assigned(StringGrid.OnGetAlignment) then
                      StringGrid.OnGetAlignment(nil, y, x, AAlignment, vtaTop);
                    }
                    //Inter-column spacing
                    if x > 0 then s := s + #32;
                    //Format cell based on alignment
                    case AAlignment of
                      taLeftJustify: s := s + ESC.FixWidth(Strings[x], Abs(Widths[x]), teaLeft);
                      taRightJustify: s := s + ESC.FixWidth(Strings[x], Abs(Widths[x]), teaRight);
                      taCenter: s := s + ESC.FixWidth(Strings[x], Abs(Widths[x]), teaCenter);
                    end;
                    //If width < 0 --> Add CRLF
                    if Widths[x] < 0 then
                      s := s + CRLF;
                  end;
              //Unbold, disable underline, new line
              s := s+escNoUnderline+escUnBold+CRLF;
            end;
      //Add footer
      s := s + Footer;
      //Send to printer
      dlgRawPrintPreview.Execute(DocTitle, s);
    finally
      ESC.Free;
    end;
  end;

  procedure RawPrint(const DocTitle, Header, Footer: string;
    StringGrid: TAdvStringGrid);
  var
    Widths: Array of shortint;
    x, y, w, mx: Integer;
  begin
    with StringGrid do begin
      //Resize array
      SetLength(Widths, ColCount);
      //Process all columns...
      for x := 0 to ColCount-1 do
        with Cols[x] do begin
          //Min Width = Fixed cell width
          mx := Length(Strings[0]);
          //Process all rows except nodes...
          for y := 1 to RowCount-1 do
            if StringGrid.IsNode(y) = False then begin
              w := Length(Strings[y]); //Get width of the cell
              if w > mx then mx := w; //Update column max width
            end;
          //Record calculated width
          Widths[x] := mx+1;
        end;
    end;
    //Call overload version of RawPrint with Widths specifier
    RawPrint(DocTitle, Header, Footer, StringGrid, Widths);
  end;

  procedure PrintGraph(adv: TAdvStringGrid);
  var p: TpagePreview;
  begin
    P := TPagePreview.Create(nil);
    p := tpagepreview.CreatePreview(nil, adv);
    p.showmodal;
    p.Destroy;
  end;
*)

{ Global Project Class Implementation }
{ _SystemConstant_Arr }

constructor _SystemConstant_Arr.Create;
begin
  inherited Create;
  setLength(FSystemConstant_Arr,0);
end;

destructor _SystemConstant_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _SystemConstant_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FSystemConstant_Arr) do FSystemConstant_Arr[i].Destroy;
  setLength(FSystemConstant_Arr,0);
end;

function _SystemConstant_Arr.New: _SystemConstant;
begin
  Result := _SystemConstant.Create;
end;

function _SystemConstant_Arr.Add(ASeksi: string; ANama: string; ANilai: string): integer;
begin
  setLength(FSystemConstant_Arr, length(FSystemConstant_Arr)+1);
  Result := high(FSystemConstant_Arr);
  FSystemConstant_Arr[Result] := New;
  FSystemConstant_Arr[Result].Seksi := ASeksi;
  FSystemConstant_Arr[Result].Nama := ANama;
  FSystemConstant_Arr[Result].Nilai := ANilai;
end;

function _SystemConstant_Arr.IndexOf(ASeksi: string; ANama: string): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FSystemConstant_Arr)) and (not found) do
    if (FSystemConstant_Arr[i].FSeksi=ASeksi) and
       (FSystemConstant_Arr[i].FNama=ANama) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _SystemConstant_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FSystemConstant_Arr)) then Exit;
  FSystemConstant_Arr[Index].Destroy;
  for i:=Index to high(FSystemConstant_Arr)-1 do
    FSystemConstant_Arr[Index] := FSystemConstant_Arr[Index-1];
  setLength(FSystemConstant_Arr,length(FSystemConstant_Arr)-1);
end;

function _SystemConstant_Arr.Count: integer;
begin
  Result := length(FSystemConstant_Arr);
end;

function _SystemConstant_Arr.Get(Index: integer): _SystemConstant;
begin
  if (Index<0) or (Index>high(FSystemConstant_Arr)) then Result := nil
  else Result := FSystemConstant_Arr[Index];
end;


{ _SystemConstant }

constructor _SystemConstant.Create;
begin
  inherited Create;
end;

destructor _SystemConstant.Destroy;
begin
  inherited;
end;

procedure _SystemConstant.Reset;
begin
  FSeksi := '';
  FNama := '';
  FNilai := '';
  FSeq:= 0;
  FParentSeq:= 0;
end;

procedure _SystemConstant.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO System_Constant (Seksi,Nama,Nilai)'+
    ' VALUES ('+
      FormatSQLString(FSeksi)+','+
      FormatSQLString(FNama)+','+
      FormatSQLString(FNilai)+')'
  ); except raise; end;
end;

procedure _SystemConstant.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Constant SET'+
          ' Nilai='+FormatSQLString(FNilai)+
    ' WHERE Seksi='+FormatSQLString(FSeksi)+
      ' AND Nama='+FormatSQLString(FNama)
  ); except raise; end;
end;

procedure _SystemConstant.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM System_Constant'+
    ' WHERE Seksi='+FormatSQLString(FSeksi)+
      ' AND Nama='+FormatSQLString(FNama)
  ); except raise; end;
end;


class function _SystemConstant.ExistInDB(AItemCategory, AItemType: string): integer;
var buffer: _RecordSet;
   // temp: integer;
begin
  buffer := myConnection.OpenSQL(
            'SELECT Seq FROM System_Constant '+
            'WHERE Seksi= '+FormatSQLString(AItemCategory)+
            'AND UPPER(Nama)='+uppercase(FormatSQLString(AItemType))
            );
   Result := buffer.RecordCount;

  {temp:= BufferToInteger(buffer.Fields[0].Value);
  result:= buffer.RecordCount;
  buffer.Close;
  if AItemType<>'' then begin
    buffer := myConnection.OpenSQL(
      'SELECT COUNT(*) FROM System_Constant'+
      ' WHERE Seq_Parent='+formatSQLNumber(temp)+
      ' AND Nilai='+FormatSQLString(AItemType)
    );
    Result := BufferToInteger(buffer.Fields[0].Value);
  end;}
  buffer.Close;
end;

function _SystemConstant.SelectInDB(ASeksi: String='';ANama: String='';ANilai:String=''; ASeq: integer=0; AParentSeq: integer=0): boolean;
var sql,filter: String;
    buffer: _RecordSet;
begin
  sql:= 'SELECT Seksi,Nama,Nilai,Seq,Seq_Parent '+
        'FROM System_Constant ';
  filter:= '';
  if ASeksi<>'' then
    filter := filter+' AND upper(Seksi)='+FormatSQLString(uppercase(ASeksi));
  if ANama<>'' then
    filter := filter+' AND upper(Nama)='+FormatSQLString(uppercase(ANama));
  if ANilai<>'' then
    filter := filter+' AND upper(Nilai)='+FormatSQLString(uppercase(ANilai));
  if ASeq<>0 then
    filter := filter+' AND Seq='+FormatSQLNumber(ASeq);
  if AParentSeq<>0 then
    filter := filter+' AND Seq_Parent='+FormatSQLNumber(AParentSeq);

  sql:= sql+ ' WHERE '+Copy(filter,5,length(filter));
  buffer := myConnection.OpenSQL(sql);
  if (buffer.RecordCount<>0) then begin
    FSeksi:= BufferToString(buffer.Fields[0].Value);
    FNama := BufferToString(buffer.Fields[1].Value);
    FNilai:= BufferToString(buffer.Fields[2].Value);
    FSeq  := BufferToInteger(Buffer.Fields[3].Value);
    FParentSeq:= BufferToInteger(Buffer.Fields[4].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _SystemConstant.ExistCatInDB(AItemCategory: string): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
            'SELECT Count(*) FROM System_Constant '+
            'WHERE upper(Seksi)=''ITEM CATEGORY'' '+
            'AND Nilai='+FormatSQLString(AItemCategory)
            );
  result:= BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _SystemUser_Arr }

constructor _SystemUser_Arr.Create;
begin
  inherited Create;
  setLength(FSystemUser_Arr,0);
end;

destructor _SystemUser_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _SystemUser_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FSystemUser_Arr) do FSystemUser_Arr[i].Destroy;
  setLength(FSystemUser_Arr,0);
end;

function _SystemUser_Arr.New: _SystemUser;
begin
  Result := _SystemUser.Create;
end;

function _SystemUser_Arr.Add(AUserId: string; AUserName: string; APasswd: string; AAccessLevel: integer; ADisableDate: TDate): integer;
begin
  setLength(FSystemUser_Arr, length(FSystemUser_Arr)+1);
  Result := high(FSystemUser_Arr);
  FSystemUser_Arr[Result] := New;
  FSystemUser_Arr[Result].UserId := AUserId;
  FSystemUser_Arr[Result].UserName := AUserName;
  FSystemUser_Arr[Result].Passwd := APasswd;
  FSystemUser_Arr[Result].AccessLevel := AAccessLevel;
  FSystemUser_Arr[Result].DisableDate := ADisableDate;
//  FSystemUser_Arr[Result].DeptID  := aDeptID;
end;

function _SystemUser_Arr.IndexOf(AUserId: string): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FSystemUser_Arr)) and (not found) do
    if (FSystemUser_Arr[i].FUserId=AUserId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _SystemUser_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FSystemUser_Arr)) then Exit;
  FSystemUser_Arr[Index].Destroy;
  for i:=Index to high(FSystemUser_Arr)-1 do
    FSystemUser_Arr[Index] := FSystemUser_Arr[Index-1];
  setLength(FSystemUser_Arr,length(FSystemUser_Arr)-1);
end;

function _SystemUser_Arr.Count: integer;
begin
  Result := length(FSystemUser_Arr);
end;

function _SystemUser_Arr.Get(Index: integer): _SystemUser;
begin
  if (Index<0) or (Index>high(FSystemUser_Arr)) then Result := nil
  else Result := FSystemUser_Arr[Index];
end;


{ _SystemUser }

constructor _SystemUser.Create;
begin
  inherited Create;
end;

destructor _SystemUser.Destroy;
begin
  inherited;
end;

procedure _SystemUser.Reset;
begin
  FUserId := '';
  FUserName := '';
  FPasswd := '';
  FAccessLevel := 0;
  FDisableDate := 0;
end;

procedure _SystemUser.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO System_Users (User_Id,User_Name,Passwd,Access_Level,Disabled_Date)'+
    ' VALUES ('+
      FormatSQLString(FUserId)+','+
      FormatSQLString(FUserName)+','+
      FormatSQLString(FPasswd)+','+
      FormatSQLNumber(FAccessLevel)+','+
      FormatSQLDate(FDisableDate)+')'
  ); except raise; end;
end;

procedure _SystemUser.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Users SET'+
          ' User_Name='+FormatSQLString(FUserName)+','+
          ' Passwd='+FormatSQLString(FPasswd)+','+
          ' Access_Level='+FormatSQLNumber(FAccessLevel)+','+
          ' Disabled_Date='+FormatSQLDate(FDisableDate)+
    ' WHERE User_Id='+FormatSQLString(FUserId)
  ); except raise; end;
end;

procedure _SystemUser.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM System_Users'+
    ' WHERE User_Id='+FormatSQLString(FUserId)
  ); except raise; end;
end;

function _SystemUser.SelectInDB(AUserId,ADeptId: string): boolean;
var buffer: _RecordSet;
sql : string;
begin
  sql := 'SELECT SU.User_Id, SU.User_Name, SU.Passwd, SU.Access_Level, SU.Disabled_Date '+
     ' FROM System_Users SU'+
    ' WHERE SU.User_Id='+FormatSQLString(AUserId);

  buffer := myConnection.OpenSQL(sql);
  if (buffer.RecordCount<>0) then begin
    FUserId := BufferToString(buffer.Fields[0].Value);
    FUserName := BufferToString(buffer.Fields[1].Value);
    FPasswd := BufferToString(buffer.Fields[2].Value);
    FAccessLevel := BufferToInteger(buffer.Fields[3].Value);
    FDisableDate := BufferToDateTime(buffer.Fields[4].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _SystemUser.ExistInDB(AUserId: string): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM System_Users'+
    ' WHERE User_Id='+FormatSQLString(AUserId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _SystemReversal_Arr }

constructor _SystemReversal_Arr.Create;
begin
  inherited Create;
  setLength(FSystemReversal_Arr,0);
end;

destructor _SystemReversal_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _SystemReversal_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FSystemReversal_Arr) do FSystemReversal_Arr[i].Destroy;
  setLength(FSystemReversal_Arr,0);
end;

function _SystemReversal_Arr.New: _SystemReversal;
begin
  Result := _SystemReversal.Create;
end;

function _SystemReversal_Arr.Add(AReversSeq: integer; AReversDate: TDate; ANotes: string; AUserId: string): integer;
begin
  setLength(FSystemReversal_Arr, length(FSystemReversal_Arr)+1);
  Result := high(FSystemReversal_Arr);
  FSystemReversal_Arr[Result] := New;
  FSystemReversal_Arr[Result].ReversSeq := AReversSeq;
  FSystemReversal_Arr[Result].ReversDate := AReversDate;
  FSystemReversal_Arr[Result].Notes := ANotes;
  FSystemReversal_Arr[Result].SystemUser.UserId := AUserId;
end;

function _SystemReversal_Arr.IndexOf(AReversSeq: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FSystemReversal_Arr)) and (not found) do
    if (FSystemReversal_Arr[i].FReversSeq=AReversSeq) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _SystemReversal_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FSystemReversal_Arr)) then Exit;
  FSystemReversal_Arr[Index].Destroy;
  for i:=Index to high(FSystemReversal_Arr)-1 do
    FSystemReversal_Arr[Index] := FSystemReversal_Arr[Index-1];
  setLength(FSystemReversal_Arr,length(FSystemReversal_Arr)-1);
end;

function _SystemReversal_Arr.Count: integer;
begin
  Result := length(FSystemReversal_Arr);
end;

function _SystemReversal_Arr.Get(Index: integer): _SystemReversal;
begin
  if (Index<0) or (Index>high(FSystemReversal_Arr)) then Result := nil
  else Result := FSystemReversal_Arr[Index];
end;


{ _SystemReversal }

constructor _SystemReversal.Create;
begin
  inherited Create;
  FSystemUser := _SystemUser.Create;
  //FItemDetail_Arr := _ItemDetail_Arr.Create;
  //FCashierInvoice_Arr := _CashierInvoice_Arr.Create;
  //FSaleDetail_Arr := _SaleDetail_Arr.Create;
  //FDebt_Arr := _Debt_Arr.Create;
  //FIncomeExpense_Arr := _IncomeExpense_Arr.Create;
end;

destructor _SystemReversal.Destroy;
begin
  FSystemUser.Destroy;
  //FItemDetail_Arr.Destroy;
  //FCashierInvoice_Arr.Destroy;
  //FSaleDetail_Arr.Destroy;
  //FDebt_Arr.Destroy;
  //FIncomeExpense_Arr.Destroy;
  inherited;
end;

procedure _SystemReversal.Reset;
begin
  FReversSeq := 0;
  FReversDate := 0;
  FNotes := '';
  FSystemUser.Reset;
  //FItemDetail_Arr.Clear;
  //FCashierInvoice_Arr.Clear;
  //FSaleDetail_Arr.Clear;
  //FDebt_Arr.Clear;
  //FIncomeExpense_Arr.Clear;
end;

procedure _SystemReversal.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO System_Reversal (Revers_Date,Notes,User_Id)'+
    ' VALUES ('+
      FormatSQLDate(FReversDate)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FSystemUser.UserId)+')'
  ); except raise; end;
end;

procedure _SystemReversal.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Reversal SET'+
          ' Revers_Date='+FormatSQLDate(FReversDate)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Id='+FormatSQLString(FSystemUser.UserId)+
    ' WHERE Revers_Seq='+FormatSQLNumber(FReversSeq)
  ); except raise; end;
end;

procedure _SystemReversal.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM System_Reversal'+
    ' WHERE Revers_Seq='+FormatSQLNumber(FReversSeq)
  ); except raise; end;
end;

function _SystemReversal.SelectInDB(AReversSeq: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT SR.Revers_Seq, SR.Revers_Date, SR.Notes'+
     ' FROM System_Reversal SR, System_Users SU'+
    ' WHERE SR.Revers_Seq='+FormatSQLNumber(AReversSeq)
  );
  if (buffer.RecordCount<>0) then begin
    FReversSeq := BufferToInteger(buffer.Fields[0].Value);
    FReversDate := BufferToDateTime(buffer.Fields[1].Value);
    FNotes := BufferToString(buffer.Fields[2].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _SystemReversal.ExistInDB(AReversSeq: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM System_Reversal'+
    ' WHERE Revers_Seq='+FormatSQLNumber(AReversSeq)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;


{ _SystemMenu_Arr }

constructor _SystemMenu_Arr.Create;
begin
  inherited Create;
  setLength(FSystemMenu_Arr,0);
end;

destructor _SystemMenu_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _SystemMenu_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FSystemMenu_Arr) do FSystemMenu_Arr[i].Destroy;
  setLength(FSystemMenu_Arr,0);
end;

function _SystemMenu_Arr.New: _SystemMenu;
begin
  Result := _SystemMenu.Create;
end;

function _SystemMenu_Arr.Add(AMenuId: integer; AMenuGroup: string; AMenuName: string; AImageIndex: integer; AFormName: string; AFormType: integer; AShortcut: integer;ASubmenuName:string): integer;
begin
  setLength(FSystemMenu_Arr, length(FSystemMenu_Arr)+1);
  Result := high(FSystemMenu_Arr);
  FSystemMenu_Arr[Result] := New;
  FSystemMenu_Arr[Result].MenuId := AMenuId;
  FSystemMenu_Arr[Result].MenuGroup := AMenuGroup;
  FSystemMenu_Arr[Result].MenuName := AMenuName;
  FSystemMenu_Arr[Result].ImageIndex := AImageIndex;
  FSystemMenu_Arr[Result].FormName := AFormName;
  FSystemMenu_Arr[Result].FormType := AFormType;
  FSystemMenu_Arr[Result].Shortcut := AShortcut;
  FSystemMenu_Arr[Result].SubMenuName := ASubmenuName;
end;

function _SystemMenu_Arr.IndexOf(AMenuId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FSystemMenu_Arr)) and (not found) do
    if (FSystemMenu_Arr[i].FMenuId=AMenuId)
    then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _SystemMenu_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FSystemMenu_Arr)) then Exit;
  FSystemMenu_Arr[Index].Destroy;
  for i:=Index to high(FSystemMenu_Arr)-1 do
    FSystemMenu_Arr[Index] := FSystemMenu_Arr[Index-1];
  setLength(FSystemMenu_Arr,length(FSystemMenu_Arr)-1);
end;

function _SystemMenu_Arr.Count: integer;
begin
  Result := length(FSystemMenu_Arr);
end;

function _SystemMenu_Arr.Get(Index: integer): _SystemMenu;
begin
  if (Index<0) or (Index>high(FSystemMenu_Arr)) then Result := nil
  else Result := FSystemMenu_Arr[Index];
end;

function _SystemMenu_Arr.FindOnDB(AMenuId: integer = 0; AMenuGroup: string = ''; AMenuName: string = ''; AImageIndex: integer = 0; AFormName: string = ''; AFormType: integer = 0; AShortcut: integer = 0;aDeptID:string=''): integer;
var sql, filter: string; buffer: _RecordSet; i: integer;
begin
  Self.Clear;
  sql := 'SELECT ... FROM ... ';
  filter := '';
  if (AMenuId<>0) then filter := filter + ' AND SM.MenuId='+FormatSQLNumber(AMenuId);
  if (AMenuGroup<>'') then filter := filter + ' AND SM.MenuGroup='+FormatSQLString(AMenuGroup);
  if (AMenuName<>'') then filter := filter + ' AND SM.MenuName='+FormatSQLString(AMenuName);
  if (AImageIndex<>0) then filter := filter + ' AND SM.ImageIndex='+FormatSQLNumber(AImageIndex);
  if (AFormName<>'') then filter := filter + ' AND SM.FormName='+FormatSQLString(AFormName);
  if (AFormType<>0) then filter := filter + ' AND SM.FormType='+FormatSQLNumber(AFormType);
  if (AShortcut<>0) then filter := filter + ' AND SM.Shortcut='+FormatSQLNumber(AShortcut);
  if (filter<>'') then filter := copy(filter,6,length(filter)-5) + ' WHERE ';
  buffer := myConnection.OpenSQL(sql+filter);
  setLength(FSystemMenu_Arr, buffer.RecordCount);
  for i:=0 to buffer.RecordCount-1 do begin
    FSystemMenu_Arr[i] := _SystemMenu.Create;
    Self.Add(BufferToInteger(buffer.Fields[0].Value),BufferToString(buffer.Fields[1].Value),
        BufferToString(buffer.Fields[2].Value),BufferToInteger(buffer.Fields[3].Value),
        BufferToString(buffer.Fields[4].Value),BufferToInteger(buffer.Fields[5].Value),
        BufferToInteger(buffer.Fields[6].Value),BufferToString(buffer.Fields[7].Value));
    buffer.MoveNext;
  end;
  Result := buffer.RecordCount;
  buffer.Close;
end;


{ _SystemMenu }

constructor _SystemMenu.Create;
begin
  inherited Create;
end;

destructor _SystemMenu.Destroy;
begin
  inherited;
end;

procedure _SystemMenu.Reset;
begin
  FMenuId := 0;
  FMenuGroup := '';
  FMenuName := '';
  FImageIndex := 0;
  FFormName := '';
  FFormType := 0;
  FShortcut := 0;
  FSubMenuName := '';
  FDeptID := '';
end;

procedure _SystemMenu.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO System_Menu (Menu_Id,Menu_Group,Menu_Name,Image_Index,Form_Name,Form_Type,Shortcut)'+
    ' VALUES ('+
      FormatSQLNumber(FMenuId)+','+
      FormatSQLString(FMenuGroup)+','+
      FormatSQLString(FMenuName)+','+
      FormatSQLNumber(FImageIndex)+','+
      FormatSQLString(FFormName)+','+
      FormatSQLNumber(FFormType)+','+
      FormatSQLNumber(FShortcut)+')'
  ); except raise; end;
end;

procedure _SystemMenu.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Menu SET'+
          ' Menu_Group='+FormatSQLString(FMenuGroup)+','+
          ' Menu_Name='+FormatSQLString(FMenuName)+','+
          ' Image_Index='+FormatSQLNumber(FImageIndex)+','+
          ' Form_Name='+FormatSQLString(FFormName)+','+
          ' Form_Type='+FormatSQLNumber(FFormType)+','+
          ' Shortcut='+FormatSQLNumber(FShortcut)+
    ' WHERE Menu_Id='+FormatSQLNumber(FMenuId)
  ); except raise; end;
end;

procedure _SystemMenu.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM System_Menu'+
    ' WHERE Menu_Id='+FormatSQLNumber(FMenuId)
  ); except raise; end;
end;

function _SystemMenu.SelectInDB(AMenuId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT SM.Menu_Id, SM.Menu_Group, SM.Menu_Name, SM.Image_Index, SM.Form_Name, SM.Form_Type, SM.Shortcut,SM.Submenu_Name'+
     ' FROM System_Menu SM'+
    ' WHERE SM.Menu_Id='+FormatSQLNumber(AMenuId)
  );
  if (buffer.RecordCount<>0) then begin
    FMenuId := BufferToInteger(buffer.Fields[0].Value);
    FMenuGroup := BufferToString(buffer.Fields[1].Value);
    FMenuName := BufferToString(buffer.Fields[2].Value);
    FImageIndex := BufferToInteger(buffer.Fields[3].Value);
    FFormName := BufferToString(buffer.Fields[4].Value);
    FFormType := BufferToInteger(buffer.Fields[5].Value);
    FShortcut := BufferToInteger(buffer.Fields[6].Value);
    FSubMenuName := BufferToString(buffer.Fields[7].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _SystemMenu.ExistInDB(AMenuId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM System_Menu'+
    ' WHERE Menu_Id='+FormatSQLNumber(AMenuId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _SystemAccess_Arr }

constructor _SystemAccess_Arr.Create;
begin
  inherited;
  SetLength(FSystemAccess_Arr,0);
end;

destructor _SystemAccess_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _SystemAccess_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FSystemAccess_Arr) do FSystemAccess_Arr[i].Destroy;
  setLength(FSystemAccess_Arr,0);
end;

function _SystemAccess_Arr.New: _SystemAccess;
begin
  Result := _SystemAccess.Create;
end;

function _SystemAccess_Arr.Add(AUserId: string; AMenuId, AAccessList, AShortcut: integer; AOutlookPanel, AOutlookButton: string; AUsageCount: integer): integer;
begin
  setLength(FSystemAccess_Arr, length(FSystemAccess_Arr)+1);
  Result := high(FSystemAccess_Arr);
  FSystemAccess_Arr[Result] := New;
  FSystemAccess_Arr[Result].SystemUser.UserId := AUserId;
  FSystemAccess_Arr[Result].SystemMenu.MenuId := AMenuId;
  FSystemAccess_Arr[Result].AccessList := AAccessList;
  FSystemAccess_Arr[Result].OutlookPanel := AOutlookPanel;
  FSystemAccess_Arr[Result].OutlookButton := AOutlookButton;
  FSystemAccess_Arr[Result].UsageCount := AUsageCount;
end;

function _SystemAccess_Arr.IndexOf(AUserId: string; AMenuId: integer): integer;
var i: integer;
begin
  i := 0; Result := -1;
  while (i<=high(FSystemAccess_Arr)) and (Result=-1) do
    if (FSystemAccess_Arr[i].SystemUser.UserId=AUserId) and
      (FSystemAccess_Arr[i].SystemMenu.MenuId=AMenuId) then
      Result := i
    else inc(i);
end;

procedure _SystemAccess_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FSystemAccess_Arr)) then Exit;
  FSystemAccess_Arr[Index].Destroy;
  for i:=Index to high(FSystemAccess_Arr)-1 do
    FSystemAccess_Arr[Index] := FSystemAccess_Arr[Index-1];
  setLength(FSystemAccess_Arr,length(FSystemAccess_Arr)-1);
end;

function _SystemAccess_Arr.Count: integer;
begin
  Result := length(FSystemAccess_Arr);
end;

function _SystemAccess_Arr.Get(Index: integer): _SystemAccess;
begin
  if (Index<0) or (Index>high(FSystemAccess_Arr)) then Result := nil
  else Result := FSystemAccess_Arr[Index];
end;


{ _SystemAccess }

constructor _SystemAccess.Create;
begin
  inherited Create;
  FSystemUser := _SystemUser.Create;
  FSystemMenu := _SystemMenu.Create;
end;

destructor _SystemAccess.Destroy;
begin
  FSystemUser.Destroy;
  FSystemMenu.Destroy;
  inherited;
end;

procedure _SystemAccess.Reset;
begin
  FSystemUser.Reset;
  FSystemMenu.Reset;
  FAccessList := 0;
  FOutlookPanel := '';
  FOutlookButton := '';
  FUsageCount := 0;
  FCanAcces  := 0;
end;

procedure _SystemAccess.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO System_Access (User_Id,Menu_Id,Access_List,Outlook_Panel,Outlook_Button,'+
    'Usage_Count, can_acces)'+
    ' VALUES ('+
      FormatSQLString(FSystemUser.UserId)+','+
      FormatSQLNumber(FSystemMenu.MenuId)+','+
      FormatSQLNumber(FAccessList)+','+
      FormatSQLString(FOutlookPanel)+','+
      FormatSQLString(FOutlookButton)+','+
      FormatSQLNumber(FUsageCount)+','+
      FormatSQLNumber(FCanAcces)+')'
  ); except raise; end;
end;

procedure _SystemAccess.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Access SET'+
          ' Access_List='+FormatSQLNumber(FAccessList)+','+
          ' Outlook_Panel='+FormatSQLString(FOutlookPanel)+','+
          ' Outlook_Button='+FormatSQLString(FOutlookButton)+','+
          ' Usage_Count='+FormatSQLNumber(FUsageCount)+','+
          ' Can_Acces ='+FormatSQLNumber(FCanAcces)+
    ' WHERE User_Id='+FormatSQLString(FSystemUser.UserId)+
      ' AND Menu_Id='+FormatSQLNumber(FSystemMenu.MenuId)
  ); except raise; end;
end;

procedure _SystemAccess.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM System_Access'+
    ' WHERE User_Id='+FormatSQLString(FSystemUser.UserId)+
      ' AND Menu_Id='+FormatSQLNumber(FSystemMenu.MenuId)
  ); except raise; end;
end;


{ TSystemConstant }
type stringArr = array of string;

function GetPrivateProfileStringFromDB(const Section, Name, Default: PChar; var BufOut: stringArr; TableName: string): integer;
var buffer: _RecordSet; i: integer;
begin
  if (Section<>nil) then begin
    if (Name<>nil) then begin
      if (Default<>nil) then begin
        //Read String
        buffer := myConnection.OpenSQL(
          'SELECT Nilai FROM '+TableName+
          ' WHERE Seksi='+FormatSQLString(Section)+' AND Nama='+FormatSQLString(Name)
        );
        setLength(BufOut,1);
        if (buffer.RecordCount=0) then BufOut[0] := Default
        else BufOut[0] := BufferToString(buffer.Fields[0].Value);
        Result := Length(BufOut[0]);
        buffer.Close;
      end else begin
        //Read Section
        buffer := myConnection.OpenSQL(
          'SELECT Nama, Nilai FROM '+TableName+
          ' WHERE Seksi='+FormatSQLString(string(Section))
        );
        setLength(BufOut,buffer.RecordCount);
        for i:=1 to buffer.RecordCount do begin
          BufOut[i-1] := BufferToString(buffer.Fields[0].Value)+'='+BufferToString(buffer.Fields[1].Value);
          buffer.MoveNext;
        end;
        Result := buffer.RecordCount;
        buffer.Close;
      end;
    end else begin
      //Read Section
      buffer := myConnection.OpenSQL(
        'SELECT Nama FROM '+TableName+
        ' WHERE Seksi='+FormatSQLString(string(Section))
      );
      setLength(BufOut,buffer.RecordCount);
      for i:=1 to buffer.RecordCount do begin
        BufOut[i-1] := BufferToString(buffer.Fields[0].Value);
        buffer.MoveNext;
      end;
      Result := buffer.RecordCount;
      buffer.Close;
    end;
  end else begin
    //Read Sections
    buffer := myConnection.OpenSQL(
      'SELECT DISTINCT(Seksi) FROM '+TableName
    );
    setLength(BufOut,buffer.RecordCount);
    for i:=1 to buffer.RecordCount do begin
      BufOut[i-1] := BufferToString(buffer.Fields[0].Value);
      buffer.MoveNext;
    end;
    Result := buffer.RecordCount;
    buffer.Close;
  end;
end;

function WritePrivateProfileStringToDB(const Section, Name, Default: PChar; TableName: string): boolean;
var sql: string; buffer: _RecordSet;
begin
  if (Section<>nil) then begin
    if (Name<>nil) then begin
      if (Default<>nil) then begin
        buffer := myConnection.OpenSQL(
          'SELECT Nilai FROM '+TableName+
          ' WHERE Seksi='+FormatSQLString(string(Section))+' AND Nama='+FormatSQLString(string(Name)));
        if (buffer.RecordCount<>0) then
          if (BufferToString(buffer.Fields[0].Value)=Default) then begin
            Result := true;
            Exit;
          end else sql := // WriteString
          'UPDATE '+TableName+' SET Nilai='+FormatSQLString(string(Default))+
          ' WHERE Seksi='+FormatSQLString(string(Section))+' AND Nama='+FormatSQLString(string(Name))
        else sql := // WriteString
          'INSERT INTO '+TableName+' (Seksi,Nama,Nilai) VALUES ('+
          FormatSQLString(string(Section))+','+FormatSQLString(string(Name))+','+FormatSQLString(string(Default))+')'
      end else sql := // DeleteKey
        'DELETE FROM '+TableName+
        ' WHERE Seksi='+FormatSQLString(string(Section))+' AND Nama='+FormatSQLString(string(Name));
    end else sql := // EraseSection
      'DELETE FROM '+TableName+
      ' WHERE Seksi='+FormatSQLString(string(Section));
  end else begin //flush
    Result := true;
    Exit;
  end;

  Result := (myConnection.ExecSQL(sql)>0);
end;

destructor TSystemConstant.Destroy;
begin
  UpdateFile;         // flush changes to disk
  inherited Destroy;
end;

function TSystemConstant.ReadString(const Section, Name, Default: string): string;
var Buffer: stringArr;
begin
  GetPrivateProfileStringFromDB(PChar(Section), PChar(Name), PChar(Default), Buffer, FileName);
  Result := Buffer[0];
  setLength(Buffer,0);
end;

procedure TSystemConstant.WriteString(const Section, Name, Content: string);
begin
  if not WritePrivateProfileStringToDB(PChar(Section), PChar(Name), PChar(Content), FileName) then
    raise EIniFileException.CreateResFmt(@SIniFileWriteError, [FileName]);
end;

procedure TSystemConstant.ReadSections(Strings: TStrings);
var Buffer: stringArr; i: integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    if GetPrivateProfileStringFromDB(nil, nil, nil, Buffer, FileName) <> 0 then
    begin
      for i:=0 to high(Buffer) do
        Strings.Append(Buffer[i]);
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TSystemConstant.ReadSection(const Section: string; Strings: TStrings);
var Buffer: stringArr; i: integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    if GetPrivateProfileStringFromDB(PChar(Section), nil, nil, Buffer, FileName) <> 0 then
    begin
      for i:=0 to high(Buffer) do
        Strings.Append(Buffer[i]);
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TSystemConstant.ReadSectionValues(const Section: string; Strings: TStrings);
var Buffer: stringArr; i: integer;
begin
  Strings.BeginUpdate;
  try
    Strings.Clear;
    if GetPrivateProfileStringFromDB(PChar(Section), PChar('Name'), nil, Buffer, FileName) <> 0 then
    begin
      for i:=0 to high(Buffer) do
        Strings.Append(Buffer[i]);
    end;
  finally
    Strings.EndUpdate;
  end;
end;

procedure TSystemConstant.EraseSection(const Section: string);
begin
  if not WritePrivateProfileStringToDB(PChar(Section), nil, nil, FileName) then
    raise EIniFileException.CreateResFmt(@SIniFileWriteError, [FileName]);
end;

procedure TSystemConstant.DeleteKey(const Section, Name: String);
begin
  WritePrivateProfileStringToDB(PChar(Section), PChar(Name), nil, FileName);
end;

procedure TSystemConstant.UpdateFile;
begin
  WritePrivateProfileStringToDB(nil, nil, nil, FileName);
end;

function TSystemConstant.ReadChar(const Section, Name: string; const Default: char): char;
var CharStr: string;
begin
  CharStr := ReadString(Section, Name, '');
  Result := Default;
  if CharStr <> '' then
    Result := CharStr[1]
end;

procedure TSystemConstant.WriteChar(const Section, Name: string; const Content: char);
begin
  WriteString(Section, Name, Content);
end;

function getNextIDNum(fieldName:string;tableName:string;condition:String;prefix:string;reversedOrderNum:string='';minlength:integer=5):string;
var sql:string;buffer:_RecordSet;code:string; codeNum:integer;codeChar:Char; cond: string;
begin
  if reversedOrderNum <> '' then begin
    //get the last character in the number if it is non-number
    codeChar := (copy(reversedOrderNum,length(reversedOrderNum)-1,1))[1];
    if StrToIntDef(codeChar,0) = 0 then begin//if not-number then
      inc(codeChar);
      result := reversedOrderNum + codeChar;
    end else //if number than append 'a'
      result := reversedOrderNum + 'a';
  end else begin
    sql := 'SELECT MAX('+fieldName+') FROM '+tableName;
    cond := '';
    if condition <> '' then
      cond := cond + ' AND ' + copy(condition,5,length(condition));
    if prefix <> '' then
      cond := cond + ' AND ' + fieldname + ' LIKE ' + FormatSQLString(prefix+'%');
    if cond <> '' then begin
      delete(cond,1,5);
      sql := sql + ' WHERE ' + cond;
    end;
    buffer := myConnection.OpenSQL(sql);
    if buffer.RecordCount > 0 then begin
      code := BufferToString(buffer.Fields[0].Value);
      //cut off the prefix the last digit if it is a character
      code := copy(code,length(prefix)+1,length(code)-length(prefix));
      code := EkstrakString(code,'/',1);
      codeNum := StrToIntDef(code,0);
      inc(codeNum);
      result := prefix+IntToStrFixed(minlength,codeNum);
    end else
      result := prefix+IntToStrFixed(minlength,1);
    buffer.Close;
  end;
end;


{ TSystemUser }

class procedure TSystemUser.AccessLevelList(var ATarget: TStringList);
begin
  ATarget.Clear;
  ATarget.Add(IntToStr(LEVEL_OPERATOR) + '=Operator' );
  //ATarget.Add(IntToStr(LEVEL_SUPERVISOR) + '=Supervisor' );
 // ATarget.Add(IntToStr(LEVEL_MANAGER) + '=Manager');
  ATarget.Add(IntToStr(LEVEL_ADMIN) + '=Admin');
  ATarget.Add(IntToStr(LEVEL_OWNER) + '=Owner');
  ATarget.Add(IntToStr(LEVEL_DEVELOPER) + '=Developer');
end;

class function TSystemUser.IsExistInDB(userID: string): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM System_Users'+
    ' WHERE User_ID = ' + FormatSQLString(userID)
  );
  Result := (BufferToInteger(buffer.Fields[0].Value)<>0);
  buffer.Close;
end;

class function TSystemUser.UserIDAlreadyRegistered(UserID: String): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM System_Users WHERE User_ID=' + FormatSQLString(UserID)
  );
  Result := (BufferToInteger(buffer.Fields[0].Value)<>0);
  buffer.Close;
end;

procedure TSystemUser.UpdatePasswordOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Users'+
      ' SET Passwd='+FormatSQLString(FPasswd)+
    ' WHERE User_Id='+FormatSQLString(FUserId)
  ); except raise; end;
end;

function TSystemUser.getDisable: boolean;
begin
  result := DisableDate <> 0;
end;

procedure TSystemUser.setDisable(const Value: boolean);
var sql: string;
begin
  sql:= 'UPDATE System_Users Set Disabled_Date = '+IfThen(value,FormatSQLDate(0),FormatSQLDate(ServerNow))+
                       ' WHERE User_ID='+FormatSQLString(FUserId);
  myConnection.ExecSQL(sql);
//  myConnection.ExecSQL('UPDATE System_User Set Disabled_Date = '+IfThen(value,FormatSQLDate(now),FormatSQLDate(0))+
  //                     ' WHERE User_ID='+FormatSQLString(FUserId));
end;

procedure TSystemUser.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO System_Users (User_Id,User_Name,Passwd,Access_Level) '+//
    ' VALUES ('+
      FormatSQLString(FUserId)+','+
      FormatSQLString(FUserName)+','+
      FormatSQLString(FPasswd)+','+
      FormatSQLNumber(FAccessLevel)+')'
  ); except raise; end;
end;

procedure TSystemUser.UpdateOnDB;
var sql : string;
begin
  sql := 'UPDATE System_Users SET'+
          ' User_Name='+FormatSQLString(FUserName)+','+
          ' Passwd='+FormatSQLString(FPasswd)+','+
          ' Access_Level='+FormatSQLNumber(FAccessLevel)+
    ' WHERE User_Id='+FormatSQLString(FUserId);
  try myConnection.ExecSQL(sql);
  except raise;
  end;
end;

{ TSystemUser_Arr }

procedure TSystemUser_Arr.FindOnDB(LoginID, LoginName: string;
  AccessLevel: integer;status:boolean;Dept:string);
var sqlstring,filter:string;buffer:_RecordSet;i:integer;
begin
  sqlString := 'SELECT User_ID,User_Name,Passwd,Access_Level, Disabled_Date' +
                ' FROM System_Users ';

  filter := '';
  filter := IfThen(status,' AND Disabled_Date IS NULL ','');
  if LoginID <> '' then
    filter := filter + ' AND User_ID = ' + FormatSQLString(LoginID);
  if LoginName <> '' then
    filter := filter + ' AND User_Name LIKE ' + FormatSQLString('%' + LoginName + '%');
  if AccessLevel >= 0 then
    filter := filter + ' AND Access_Level < ' + FormatSQLNumber(AccessLevel);
  if filter <> '' then
    sqlstring := sqlstring +' WHERE '+ copy(filter,5,length(filter));

  buffer := myConnection.OpenSQL(sqlString);
  if buffer.RecordCount > 0 then begin
    for i := 0 to buffer.RecordCount-1 do begin
      add(bufferToString(buffer.Fields[0].value),bufferToString(buffer.Fields[1].value),
                        bufferToString(buffer.Fields[2].value),
                        bufferToInteger(buffer.Fields[3].value),
                        BufferToDateTime(buffer.Fields[4].value));
      buffer.MoveNext;
    end;
  end
end;

function TSystemUser_Arr.Get(Index: integer): TSystemUser;
begin
  result := TSystemUser(inherited get(Index));
end;

function TSystemUser_Arr.New: _SystemUser;
begin
  result := TSystemUser.Create;
end;

{ TSystemMenu }

function TSystemMenu.GetFormType: TFormType;
begin
  Result := TFormType(FFormType);
end;

procedure TSystemMenu.SetFormType(const Value: TFormType);
begin
  FFormType := integer(Value);
end;

function TSystemMenu.GetShortcut: TShortcut;
begin
  Result := TShortcut(FShortcut);
end;

procedure TSystemMenu.SetShortcut(const Value: TShortcut);
begin
  FShortcut := Integer(Value);
end;

{ TSystemMenu_Arr }

function TSystemMenu_Arr.New: _SystemMenu;
begin
  Result := TSystemMenu.Create;
end;

function TSystemMenu_Arr.Get(Index: integer): TSystemMenu;
begin
  Result := TSystemMenu(inherited Get(Index));
end;

procedure TSystemMenu_Arr.LoadFromDB(AShowHidden:TBooleanOperator=boNone);
var buffer: _RecordSet; i: integer;order,sql:string;
begin
//  if (not myConnection.ADOConnection.Connected) or (not vConnectionOK) then
 //   exit;
  Self.Clear;
  sql := 'SELECT Menu_Id, Menu_Group, Menu_Name, Image_Index, Form_Name, Form_Type, Shortcut,SubMenu_Name'+
     ' FROM System_Menu ';
  if AShowHidden <> boNone then
    sql := sql + IfThen(AShowHidden=boFalse,' WHERE (hide <> -1) or (Hide IS NULL) ');
    order := ' ORDER BY Menu_Id';
    buffer := myConnection.OpenSQL(sql+order);
  for i:=0 to buffer.RecordCount-1 do begin
    Self.Add(
      BufferToInteger(buffer.Fields[0].Value),
      BufferToString(buffer.Fields[1].Value),
      BufferToString(buffer.Fields[2].Value),
      BufferToInteger(buffer.Fields[3].Value),
      BufferToString(buffer.Fields[4].Value),
      BufferToInteger(buffer.Fields[5].Value),
      BufferToInteger(buffer.Fields[6].Value),
      BufferToString(buffer.Fields[7].Value));
    buffer.MoveNext;
  end;
  buffer.Close;
end;

function TSystemMenu_Arr.GetByMenuID(AMenuID: integer): TSystemMenu;
var i: integer;
begin
  Result := nil;  i:=0;
  while (i<=high(FSystemMenu_Arr)) and (Result=nil) do begin
    if (FSystemMenu_Arr[i].MenuId=AMenuID) then
      Result := TSystemMenu(FSystemMenu_Arr[i]);
    inc(i); 
  end;
end;

function TSystemMenu_Arr.FindInDB(menu_id: integer; menu_group,
  menu_name: string; image_index: integer; form_name: string;
  form_type, shortcut: integer): boolean;
var sql,filter:string;buffer:_RecordSet;i:integer;
begin
  result := false;
  sql := 'SELECT menu_id,menu_group,menu_name,image_index,form_name,form_type,shortcut,Submenu_name'+
          ' FROM System_Menu';
  filter := '';
  if menu_id > 0 then
    filter := filter + ' AND menu_id = '+FormatSQLNumber(menu_id);
  if menu_group <> '' then
    filter := filter + ' AND menu_group LIKE ' + FormatSQLString('%'+menu_group+'%');
  if menu_name <> '' then
    filter := filter + ' AND menu_name LIKE ' + FormatSQLString('%'+menu_name+'%');
  if image_index <> -1 then
    filter := filter + ' AND image_index = ' + FormatSQLNumber(image_index);
  if form_name <> '' then
    filter := filter + ' AND form_name LIKE ' + FormatSQLString('%'+form_name+'%');
  if form_type > 0 then
    filter := filter + ' AND form_type = ' + FormatSQLNumber(form_type);
  if shortcut > 0 then
    filter := filter + ' AND shortcut = ' + FormatSQLNumber(shortcut);
  if filter <> '' then
    filter := ' WHERE ' + copy(filter,5,length(filter));
  buffer := myConnection.OpenSQL(sql + filter);
  if buffer.RecordCount > 0 then begin
    for i:=0 to buffer.RecordCount-1 do begin
      Add(BufferToInteger(buffer.fields[0].value),
          BufferToString(buffer.fields[1].value),
          BufferToString(buffer.fields[2].value),
          BufferToInteger(buffer.fields[3].value),
          BufferToString(buffer.fields[4].value),
          BufferToInteger(buffer.fields[5].value),
          BufferToInteger(buffer.fields[6].value),
          BufferToString(buffer.Fields[7].Value));
      buffer.MoveNext;
    end;
  end;
  buffer.close;
end;

procedure TSystemMenu_Arr.getMenuGroup(var menuArr: TSystemMenu_Arr;
  menu_group: string);
var i:integer;
begin
  menuArr.clear;
  for i:=0 to count-1 do begin
    if FSystemMenu_Arr[i].MenuGroup = menu_group then
      menuArr.Add(FSystemMenu_Arr[i].FMenuId,
                  FSystemMenu_Arr[i].FMenuGroup,
                  FSystemMenu_Arr[i].FMenuName,
                  FSystemMenu_Arr[i].FImageIndex,
                  FSystemMenu_Arr[i].FFormName,
                  FSystemMenu_Arr[i].FFormType,
                  FSystemMenu_Arr[i].FShortcut,
                  FSystemMenu_Arr[i].FSubMenuName);
  end;
end;

procedure TSystemMenu_Arr.getMenuGroupList(var aList: TStringList);
var buffer:_RecordSet;i:integer; X:TSystemMenu_Arr;
begin
  aList.Clear;
  buffer := myConnection.OpenSQL('SELECT Distinct Menu_Group FROM System_Menu');
  if buffer.RecordCount > 0 then begin
    for i:=0 to buffer.RecordCount-1 do begin
      X := TSystemMenu_Arr.Create;
      aList.Objects[aList.Add(BufferToString(Buffer.Fields[0].Value))] := X;
      Buffer.MoveNext;
    end;
  end;
  buffer.Close;
end;

function TSystemMenu_Arr.FindInDB2: boolean;
var sqL: string; buffer:_RecordSet; i: integer;
begin
  result := false;
  sqL := 'SELECT menu_id, menu_name FROM System_Menu';
  buffer := myConnection.OpenSQL(sqL);
  if buffer.RecordCount > 0 then begin
    for i:=0 to buffer.RecordCount-1 do begin
      Add(BufferToInteger(buffer.fields[0].value),
          '',
          BufferToString(buffer.fields[1].value),
          0,'', 0, 0, '');
      buffer.MoveNext;
    end;
  end;
  buffer.close;
end;

{ TSystemAccess }

constructor TSystemAccess.Create(AOwner: TObject);
begin
  inherited Create;
  FSystemUser.Destroy;
  FSystemUser := TSystemUser.Create;
  FSystemMenu.Destroy;
  FSystemMenu := TSystemMenu.Create;

  FOwner := AOwner;
  if (FOwner is TSystemUser) then begin
    FSystemUser.Destroy;
    FSystemUser := (FOwner as TSystemUser);
  end else if (FOwner is TSystemMenu) then begin
    FSystemMenu.Destroy;
    FSystemMenu := (FOwner as TSystemMenu);
  end;
end;

destructor TSystemAccess.Destroy;
begin
  if (FOwner is TSystemUser) then
    FSystemUser := TSystemUser.Create
  else if (FOwner is TSystemMenu) then
    FSystemMenu := TSystemMenu.Create;
  inherited;
end;

procedure TSystemAccess.Reset;
begin
  if (FOwner is TSystemUser) then
    FSystemUser := TSystemUser.Create
  else if (FOwner is TSystemMenu) then
    FSystemMenu := TSystemMenu.Create;

  inherited;

  if (FOwner is TSystemUser) then begin
    FSystemUser.Destroy;
    FSystemUser := (FOwner as TSystemUser);
  end else if (FOwner is TSystemMenu) then begin
    FSystemMenu.Destroy;
    FSystemMenu := (FOwner as TSystemMenu);
  end;
end;

procedure TSystemAccess.IncUsageCount;
begin
  inc(FUsageCount);
end;

procedure TSystemAccess.UpdateUsageCountOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Access'+
      ' SET Usage_Count='+FormatSQLNumber(FUsageCount)+
    ' WHERE User_ID='+FormatSQLString(SystemUser.UserID)+
      ' AND Menu_ID='+FormatSQLNumber(SystemMenu.MenuID)
  ); except raise; end;
end;

procedure TSystemAccess.UpdateOutlookOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE System_Access'+
      ' SET Outlook_Panel='+FormatSQLString(FOutlookPanel)+
         ', Outlook_Button='+FormatSQLString(FOutlookButton)+
    ' WHERE User_ID='+FormatSQLString(SystemUser.UserID)+
      ' AND Menu_ID='+FormatSQLNumber(SystemMenu.MenuID)
  ); except raise; end;
end;

function TSystemAccess.SelectInDB(AUserID: string; AMenuID: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT User_Id,Menu_Id,Access_List,Outlook_Panel,Outlook_Button,Usage_Count'+
     ' FROM System_Access'+
    ' WHERE User_Id='+FormatSQLString(AUserID)+
      ' AND Menu_Id='+FormatSQLNumber(AMenuID));
  Result := (buffer.RecordCount>0);
  if (Result) then begin
    if not (FOwner is TSystemUser) then
      FSystemUser.FUserId := BufferToString(buffer.Fields[0].Value);
    if not (FOwner is TSystemMenu) then
      FSystemMenu.FMenuId := BufferToInteger(buffer.Fields[1].Value);
    FAccessList := BufferToInteger(buffer.Fields[2].Value);
    FOutlookPanel := BufferToString(buffer.Fields[3].Value);
    FOutlookButton := BufferToString(buffer.Fields[4].Value);
    FUsageCount := BufferToInteger(buffer.Fields[5].Value);
  end;
  buffer.Close;
end;

function TSystemAccess.SelectInDB: boolean;
begin
  Result := Self.SelectInDB(FSystemUser.UserId,FSystemMenu.MenuId)
end;

function TSystemAccess.GetAccessList: TAccessListSet;
begin
  Result := [];
  if (FAccessList and  1 =  1) then Include(Result,alInsert);
  if (FAccessList and  2 =  2) then Include(Result,alUpdate);
  if (FAccessList and  4 =  4) then Include(Result,alView);
  if (FAccessList and  8 =  8) then Include(Result,alPrint);
  if (FAccessList and 16 = 16) then Include(Result,alRevers);
//  Result := TAccessListSet(FAccessList);
end;

procedure TSystemAccess.SetAccessList(const Value: TAccessListSet);
begin
  FAccessList := 0;
  if (alInsert in Value) then FAccessList := FAccessList or  1;
  if (alUpdate in Value) then FAccessList := FAccessList or  2;
  if (alView   in Value) then FAccessList := FAccessList or  4;
  if (alPrint  in Value) then FAccessList := FAccessList or  8;
  if (alRevers in Value) then FAccessList := FAccessList or 16;
//  FAccessList := Integer(Value);
end;

function TSystemAccess.GetSystemMenu: TSystemMenu;
begin
  Result := TSystemMenu(FSystemMenu);
end;

function TSystemAccess.GetSystemUser: TSystemUser;
begin
  Result := TSystemUser(FSystemUser);
end;

class function TSystemAccess.IsExisInDB(AUserID: string;
  AMenuID: integer): boolean;
begin
  Result:= getIntegerFromSQL(
  'select count(*) from system_access where menu_id ='+FormatSQLNumber(AMenuID)+
  ' and user_id = '+FormatSQLString(AUserID)) > 0;
end;

class function TSystemAccess.Can_Access(Sender : TForm;AMenuID: integer): boolean;
var sql :string;
begin

  if AMenuID > 0 then
    sql := 'SELECT ISNULL(can_acces,0) FROM system_access WHERE menu_id ='+FormatSQLNumber(AMenuID)+
              ' and user_id ='+FormatSQLString(GlobalSystemUser.UserId)
  else
    sql := 'SELECT ISNULL(can_acces,0) FROM system_access sa INNER JOIN System_Menu sm '+
          ' ON sa.menu_id = sm.menu_id WHERE form_name ='+FormatSQLString(Sender.Name)+
              ' and user_id ='+FormatSQLString(GlobalSystemUser.UserId);
  Result := getIntegerFromSQL(sql)=-1;
  if not Result then
    Result := GlobalSystemUser.AccessLevel > LEVEL_OWNER;
end;

{ TSystemAccess_Arr }

constructor TSystemAccess_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setlength(FIndexUsage_Arr,0);
end;

function TSystemAccess_Arr.New: _SystemAccess;
begin
  Result := TSystemAccess.Create(FOwner);
end;

function TSystemAccess_Arr.Get(Index: integer): TSystemAccess;
begin
  Result := TSystemAccess(inherited Get(Index));
end;

function TSystemAccess_Arr.Add(AUserId: string; AAccessList: TAccessListSet;
  AShortcut: TShortcut; AOutlookPanel, AOutlookButton: string; AUsageCount: integer): integer;
begin
  if not (FOwner is TSystemMenu) then
    raise EAbort.Create('Owner is not _SystemMenu')
  else
    Result := Self.Add(AUserId,(FOwner as _SystemMenu).FMenuId,AAccessList,AShortcut,AOutlookPanel,AOutlookButton,AUsageCount);
end;

function TSystemAccess_Arr.Add(AMenuId: integer; AAccessList: TAccessListSet;
  AShortcut: TShortcut; AOutlookPanel, AOutlookButton: string; AUsageCount: integer): integer;
begin
  if not (FOwner is TSystemUser) then
    raise EAbort.Create('Owner is not _SystemUser')
  else
    Result := Self.Add((FOwner as _SystemUser).FUserId,AMenuId,AAccessList,AShortcut,AOutlookPanel,AOutlookButton,AUsageCount);
end;

function TSystemAccess_Arr.Add(AUserId: string; AMenuId: integer; AAccessList: TAccessListSet;
  AShortcut: TShortcut; AOutlookPanel, AOutlookButton: string; AUsageCount: integer): integer;
begin
  setLength(FSystemAccess_Arr, length(FSystemAccess_Arr)+1);
  Result := high(FSystemAccess_Arr);
  FSystemAccess_Arr[Result] := TSystemAccess(Self.New);
  SystemAccess_Arr[Result].SystemUser.UserId := AUserId;
  SystemAccess_Arr[Result].SystemMenu.MenuId := AMenuId;
  SystemAccess_Arr[Result].AccessList := AAccessList;
  SystemAccess_Arr[Result].OutlookPanel := AOutlookPanel;
  SystemAccess_Arr[Result].OutlookButton := AOutlookButton;
  SystemAccess_Arr[Result].FUsageCount := AUsageCount;
end;

function TSystemAccess_Arr.IndexOf(AUserId: string; AMenuId: integer): integer;
begin
  if (FOwner is TSystemUser) then
    Result := Self.IndexOf(AMenuId)
  else if (FOwner is TSystemMenu) then
    Result := Self.IndexOf(AUserId)
  else
    Result := inherited IndexOf(AUserId,(FOwner as _SystemMenu).FMenuId);
end;

function TSystemAccess_Arr.IndexOf(AMenuId: integer): integer;
begin
  if not (FOwner is TSystemUser) then
    raise EAbort.Create('Owner is not _SystemUser')
  else
    Result := inherited IndexOf((FOwner as _SystemUser).FUserId,AMenuId);
end;

function TSystemAccess_Arr.IndexOf(AUserId: string): integer;
begin
  if not (FOwner is TSystemMenu) then
    raise EAbort.Create('Owner is not _SystemMenu')
  else
    Result := inherited IndexOf(AUserId,(FOwner as _SystemMenu).FMenuId);
end;

function TSystemAccess_Arr.LoadFromDB(AUserID: string; AMenuID: integer): integer;
var buffer: _RecordSet; i, idx: integer;sql, cond: string;
begin
  Self.Clear;

  cond := '';
  if (AUserID<>'') then
    cond := cond + ' WHERE SA.Menu_Id=SM.Menu_Id AND SA.User_Id='+FormatSQLString(AUserID);
  if (AMenuID<>0) then
    cond := cond + ' WHERE SA.User_Id=SM.User_Id AND SA.Menu_Id='+FormatSQLNumber(AMenuID);
 sql := 'SELECT SA.User_Id, SA.Menu_Id, Access_List, Shortcut, Outlook_Panel, Outlook_Button, Usage_Count'+
         ', Menu_Group, Menu_Name, Image_Index, Form_Name, Form_Type'+
     ' FROM System_Access SA, System_Menu SM'+ cond;
  buffer := myConnection.OpenSQL(sql);
  Result := buffer.RecordCount;
  for i:=0 to buffer.RecordCount-1 do begin
    idx := Self.Add(
      BufferToString(buffer.Fields[0].Value),
      BufferToInteger(buffer.Fields[1].Value),
      BufferToInteger(buffer.Fields[2].Value),
      BufferToInteger(buffer.Fields[3].Value),
      BufferToString(buffer.Fields[4].Value),
      BufferToString(buffer.Fields[5].Value),
      BufferToInteger(buffer.Fields[6].Value));

    if (FOwner is TSystemUser) and Assigned(SystemAccess_Arr[idx].SystemMenu) then begin
      SystemAccess_Arr[idx].SystemMenu.FMenuGroup := BufferToString(buffer.Fields[7].Value);
      SystemAccess_Arr[idx].SystemMenu.FMenuName := BufferToString(buffer.Fields[8].Value);
      SystemAccess_Arr[idx].SystemMenu.FImageIndex := BufferToInteger(buffer.Fields[9].Value);
      SystemAccess_Arr[idx].SystemMenu.FFormName := BufferToString(buffer.Fields[10].Value);
      SystemAccess_Arr[idx].SystemMenu.FFormType := BufferToInteger(buffer.Fields[11].Value);
    end;

    buffer.MoveNext;
  end;
  buffer.Close;
end;

function TSystemAccess_Arr.LoadFromDB: integer;
begin
  if (FOwner is TSystemUser) then
    Result := Self.LoadFromDB((FOwner as TSystemUser).FUserID,0)
  else if (FOwner is TSystemMenu) then
    Result := Self.LoadFromDB('',(FOwner as TSystemMenu).FMenuId)
  else
    raise EAbort.Create('Container has no parent. Use FindOnDB instead of LoadFromDB');
end;

procedure TSystemAccess_Arr.RecalculateUsage;
var i, j, IndexMax, temp : integer;
begin
  setlength(FIndexUsage_Arr,Self.Count);
  for i := 0 to high(FIndexUsage_Arr) do FIndexUsage_Arr[i] := i;

  for i := 0 to high(FIndexUsage_Arr)-1 do begin
    IndexMax := i;
    for j := i + 1 to high(FIndexUsage_Arr) do begin
      if (SystemAccess_Arr[FIndexUsage_Arr[j]].UsageCount > SystemAccess_Arr[FIndexUsage_Arr[IndexMax]].UsageCount) then
        IndexMax := j;
    end;
    if not (IndexMax = i) then begin
      temp                       := FIndexUsage_Arr[i];
      FIndexUsage_Arr[i]         := FIndexUsage_Arr[IndexMax];
      FIndexUsage_Arr[IndexMax]  := temp;
    end;
  end;
end;

function TSystemAccess_Arr.GetTopUsage(Position: integer): TSystemAccess;
begin
  if (Position<0) or (Position>high(FIndexUsage_Arr)) then Result := nil
  else Result := SystemAccess_Arr[FIndexUsage_Arr[Position]];
end;

procedure TSystemAccess_Arr.SaveUsageCountOnDB;
var i: integer;
begin
  for i:=0 to high(FSystemAccess_Arr) do SystemAccess_Arr[i].UpdateUsageCountOnDB;
end;

procedure TSystemAccess_Arr.SaveOutlookOnDB;
var i: integer;
begin
  for i:=0 to high(FSystemAccess_Arr) do SystemAccess_Arr[i].UpdateOutlookOnDB;
end;

function TSystemAccess_Arr.GetByMenuID(AMenuID: integer): TSystemAccess;
var i: integer;
begin
  Result := nil;
  for i:=0 to Self.Count-1 do begin
    if (SystemAccess_Arr[i].SystemMenu.MenuId=AMenuId) then
      Result := SystemAccess_Arr[i];
  end;
end;

function TSystemAccess_Arr.GetByFormName(AFormName: string): TSystemAccess;
var i: integer;
begin
  Result := nil;
  for i:=0 to Self.Count-1 do begin
    if (UpperCase(SystemAccess_Arr[i].SystemMenu.FormName)=UpperCase(AFormName)) then
      Result := SystemAccess_Arr[i];
  end;
end;

procedure TSystemAccess_Arr.InsertOnDB;
var i:integer;
begin
  for i:=0 to Count-1 do FSystemAccess_Arr[i].InsertOnDB;
end;

procedure TSystemAccess_Arr.DeleteUpdateOnDB;
begin
  if (FOwner is TSystemUser) then begin
    myConnection.ExecSQL(
      'DELETE FROM System_access'+
      ' where user_id='+FormatSQLString(TSystemUser(FOwner).UserId));
    InsertOnDB;
  end;
end;

function setAccountView(accNum :integer):string;
var vtmp : string;
begin
  vtmp := IntToStr(accNum);
  Result := copy(vtmp,1,3)+'.'+copy(vtmp,4,3);
end;

function getAccountView(accNum : string):integer;
var tmp : string;
begin
  tmp := EkstrakString(accNum,'.',1)+EkstrakString(accNum,'.',2);
  Result := StrToInt(tmp);
end;


function TSystemAccess_Arr.LoadFromDB2(AUserID: string): integer;
var buffer: _RecordSet; i, idx: integer;sql, cond: string;
begin
  Self.Clear;

  cond := '';
  if (AUserID<>'') then
    cond := cond + ' WHERE  SA.user_id IS NULL OR SA.User_Id='+FormatSQLString(AUserID);
   sql := 'SELECT SM.Menu_Id, Menu_Name, Can_Acces '+
        ' FROM System_Menu SM LEFT OUTER JOIN  System_Access SA'+
        ' ON SA.Menu_Id=SM.Menu_Id '+ cond;
  buffer := myConnection.OpenSQL(sql);
  Result := buffer.RecordCount;
  for i:=0 to buffer.RecordCount-1 do begin
    idx := Self.Add('',
      BufferToInteger(buffer.Fields[0].Value),
      0, 0, '', '', 0);
      SystemAccess_Arr[idx].SystemMenu.FMenuName := BufferToString(buffer.Fields[1].Value);
      SystemAccess_Arr[idx].CanAccess := BufferToInteger(buffer.Fields[2].Value);
    buffer.MoveNext;
  end;
  buffer.Close;

end;

initialization
  GlobalSystemMenu_Arr := TSystemMenu_Arr.Create;
  GlobalSystemUser := TSystemUser.Create;
  GlobalPeriode  := TPeriode.Create;
  GlobalSystemUser.SystemAccess_Arr := TSystemAccess_Arr.Create(GlobalSystemUser);
finalization
  GlobalSystemUser.SystemAccess_Arr.Destroy;
  GlobalPeriode.Free;
  GlobalSystemUser.Destroy;
  GlobalSystemMenu_Arr.Destroy;
end.


