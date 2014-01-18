unit SQLServerConnections;
{DEFINE DEBUG}
{$IFDEF DEBUG}
  {$DEFINE SQL_DEBUG}
{$ENDIF}

interface

uses
  SysUtils, Classes, DB, ADODB,Forms,variants,Controls,windows,Messages,Math,strUtils,
  ActiveX, ADOConst, ComObj, ADOInt, Graphics, Dialogs, DBTables, ImgList,
  AsgFindDialog, OleServer, Excel2000;//, ExcelXP;
type
  TSQLOperator = (soGreaterThan, soGreaterThanEqualsTo,soEquals,soLessThan, soLessThanEqualsTo);
  TBooleanOperator = (boTrue,boFalse,boNone);

  TMyConnection = class(TDataModule)
    ADOConnection: TADOConnection;
    ADODataSet1: TADODataSet;
    ADOCommand: TADOCommand;
    ImageList: TImageList;
    AdvGridFindDialog: TAdvGridFindDialog;
    FXA: TExcelApplication;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SendToExcel(vdto : TDataSet; vTitle : String; AFType : Word );
  private
    { Private declarations }
    Level :integer;
    Log : array of Tstringlist;
    procedure CreateList;
    procedure DestroyList;
  public
    { Public declarations }
     function StoredProc(AName: string): TParameters;
    procedure ExecStoredProc;
    function AddParamString(AName: string; AString: string; ADirection: TParameterDirection = pdInput;ALength:integer=0): TParameter;
    function AddParamNull(AName: string): TParameter;
    function AddParamInteger(AName: string; AInteger: integer; ADirection: TParameterDirection = pdInput): TParameter;
    function AddParamFloat(AName: string; AFloat: real; ADirection: TParameterDirection = pdInput): TParameter;
    function AddParamDateTime(AName: string; ADateTime: TDateTime; ADirection: TParameterDirection = pdInput): TParameter;
    function AddParamDate(AName: string; ADate: TDate; ADirection: TParameterDirection = pdInput): TParameter;
    function AddParamBoolean(AName: string; ABoolean: boolean; ADirection: TParameterDirection = pdInput): TParameter;
    function GetParamOutput(AName: string): variant;

    procedure DumpSQL(ASQL: string);
    function ExecSQL(ASQL: string): integer;
    function OpenSQL(ASQL: string): _RecordSet;

    function BeginSQL: integer;
    procedure EndSQL;
    procedure UndoSQL;
  end;

  {TPeriode}
  TPeriode = class
  protected
    FOpPeriodeAwal1 : TSQLOperator;
    FOpPeriodeAwal2 : TSQLOperator;
    FOpPeriodeAkhir1: TSQLOperator;
    FOpPeriodeAkhir2: TSQLOperator;
    FPeriodeAwal1   : TDate;
    FPeriodeAwal2   : TDate;
    FPeriodeAkhir1  : TDate;
    FPeriodeAkhir2  : TDate;
  public
    constructor Create;
    destructor Destroy; override;

    property OpPeriodeAwal1  : TSQLOperator read FOpPeriodeAwal1 write FOpPeriodeAwal1;
    property OpPeriodeAkhir1 : TSQLOperator read FOpPeriodeAkhir1 write FOpPeriodeAkhir1;
    property PeriodeAwal1    : TDate read FPeriodeAwal1 write FPeriodeAwal1;
    property PeriodeAkhir1   : TDate read FPeriodeAkhir1 write FPeriodeAkhir1;
    property OpPeriodeAwal2  : TSQLOperator read FOpPeriodeAwal2 write FOpPeriodeAwal2;
    property OpPeriodeAkhir2 : TSQLOperator read FOpPeriodeAkhir2 write FOpPeriodeAkhir2;
    property PeriodeAwal2    : TDate read FPeriodeAwal2 write FPeriodeAwal2;
    property PeriodeAkhir2   : TDate read FPeriodeAkhir2 write FPeriodeAkhir2;
    procedure Reset;
    procedure setPeriode(AItemIndex:integer;ADate1,ADate2:TDate;FirstPeriode:boolean=True);
  end;

var
  MyConnection: TMyConnection;
 // G_PERIODE : TPeriode;
  DQLFile: string = {$IFDEF SQL_DEBUG}'dql.sql'{$ELSE}''{$ENDIF}; {.sql}
  DMLFile: string = {$IFDEF SQL_DEBUG}'dml.sql'{$ELSE}''{$ENDIF}; {.sql}
  ErrorFile: string = 'error.sql';  {.log}
  DumpFile: string = 'dump.sql';  {.sql}


const
  TRUE_STRING = 'T';
  FALSE_STRING = 'F';
  TRUE_VALUE = -1;
  FALSE_VALUE = 0;

  function FormatSQLBoolean(ABoolean: boolean): string;
  function FormatSQLDateTime(ADateTime: TDateTime): string;
  function FormatSQLDate(ADate: TDate): string;
  function FormatSQLTime(ATime: TTime): string;
  function FormatSQLString(AString: string): string; overload;
  function FormatSQLString(AChar: char): string; overload;
  function FormatSQLWildCard(AString: string): string;
  function FormatSQLNumber(AInteger: integer): string; overload;
  function FormatSQLNumber(AFloat: real): string; overload;
  function FormatSQLNULL: string;
  function FormatSQLYearNow:string;
  function FormatSQLOperator(operator:TSQLOperator):string;
  function ServerNow:TDateTime;

  function BufferToBooleanDef(ABuffer: variant; ADefault: boolean): boolean;
  function BufferToBoolean(ABuffer: variant): boolean;
  function BufferToString(ABuffer: variant): string;
  function BufferToStringDef(ABuffer: variant; ADefault: string): string;
  function BufferToIntegerDef(ABuffer: variant; ADefault: integer): integer;
  function BufferToInteger(ABuffer: variant): integer;
  function BufferToFloatDef(ABuffer: variant; ADefault: real): real;
  function BufferToFloat(ABuffer: variant): real;
  function BufferToDateTimeDef(ABuffer: variant; ADefault: TDateTime): TDateTime;
  function BufferToDateTime(ABuffer: variant): TDateTime;
implementation

uses Subroutines, UConst;

{$R *.dfm}

  procedure WriteLog(AFilename, AString: string);
  var FP: Text;
  begin
    if (AFileName='') then Exit;

    AssignFile(FP, AFilename);
    {$I-} Append(FP); {$I+}
    if (IOResult<>0) then Rewrite(FP);
    Writeln(FP, AString);
    CloseFile(FP);
  end;

{ TMyConnection }

procedure TMyConnection.DataModuleCreate(Sender: TObject);
var path:widestring;
begin
  try
    path := 'FILE NAME='+GLOBAL_PATH+'\Connection.udl';
   // ShowMessage(path);

    ADOConnection.ConnectionString :=  path; //'FILE NAME=D:\!SI-EQUINOX\Main\Connection.udl';
    ADOConnection.Open;
    repeat Application.ProcessMessages; until ADOConnection.Connected;
    CreateList;
//    G_PERIODE := TPeriode.Create;
  except
    Application.Terminate;
    repeat Application.ProcessMessages; until Application.Terminated;
    raise;
  end;

  if (DMLFile<>'') then begin
    Level := 0;
    setLength(Log,0);
  end;

  writelog(DQLFile,sLineBreak+'-- Started on '+DateTimeToStr(Now));
  writelog(DMLFile,sLineBreak+'-- Started on '+DateTimeToStr(Now));
end;

procedure TMyConnection.DataModuleDestroy(Sender: TObject);
var i:integer;
begin
  writelog(DQLFile,'-- Stopped on '+DateTimeToStr(Now));
  writelog(DMLFile,'-- Stopped on '+DateTimeToStr(Now));

  DestroyList;
  //G_PERIODE.Free;
  if (DMLFile<>'') then
    for i:=0 to high(Log) do Log[i].Destroy;

  if (ADOConnection.Connected) then begin
    ADOConnection.Close;
    repeat Application.ProcessMessages; until not ADOConnection.Connected;
  end;
end;

function TMyConnection.OpenSQL(ASQL: string): _Recordset;
begin
  try
    Result := ADOConnection.Execute(ASQL);
    {if ADODataSet.Active then ADODataSet.Close;
    ADODataSet.CommandType := cmdText;
    ADODataSet.CommandText := ASQL;
    ADODataSet.Open;
    Result := ADODataSet.Recordset;}

    writelog(DQLFile,ASQL);
  except
    on E: Exception do begin
      WriteLog(ErrorFile,sLineBreak+FormatDateTime('yy/mm/dd hh:nn:ss',Now)+' - '+Application.Title+sLineBreak+'>Message: '+E.Message+sLineBreak+'>Dump: '+ASQL);
      raise;
    end;
  end;
end;

function TMyConnection.BeginSQL: integer;
begin
  Level := ADOConnection.BeginTrans;
  Result := Level;

  if (DMLFile<>'') then begin
    writeLog(DMLFile,'-- Begin on level '+IntToStr(Level));
    setLength(Log,Level);
    Log[high(Log)] := TStringList.Create;
  end;
end;

procedure TMyConnection.DumpSQL(ASQL: string);
begin
   WriteLog(DumpFile,sLineBreak+FormatDateTime('yy/mm/dd hh:nn:ss',Now)+ ' - '+ASQL);
end;

procedure TMyConnection.EndSQL;
begin
   if (Level=0) then Exit;
  dec(Level); ADOConnection.CommitTrans;

  if (DMLFile<>'') then begin
    {if (Level=0) then }writeLog(DMLFile,Log[high(Log)].Text);
    //else Log[Level].AddStrings(Log[high(Log)]);
    writeLog(DMLFile,'-- Commit on level '+IntToStr(Level+1));
    Log[high(Log)].Destroy;
    setLength(Log,Level);
  end;
end;

function TMyConnection.ExecSQL(ASQL: string): integer;
begin
   try
    ADOConnection.Execute(ASQL,Result);
    if (DMLFile<>'') then begin
      if (Level = 0) then
        writeLog(DMLFile,ASQL+';')
      else
        Log[high(Log)].Append(ASQL+';');
    end;
  except
    on E: Exception do begin
      WriteLog(ErrorFile,sLineBreak+FormatDateTime('yy/mm/dd hh:nn:ss',Now)+' - '+Application.Title+sLineBreak+'>Message: '+E.Message+sLineBreak+'>Dump: '+ASQL);
      raise;
    end;
  end;
end;

procedure TMyConnection.UndoSQL;
begin
  if (Level=0) then Exit;
  dec(Level); ADOConnection.RollbackTrans;

  if (DMLFile<>'') then begin
    writeLog(ErrorFile,'RollBack data dump:'+sLineBreak+Log[high(Log)].Text);
    writeLog(DMLFile,'-- Rollback on level '+IntToStr(Level+1));
    Log[high(Log)].Destroy;
    setLength(Log,Level);
  end;
end;

{------------------------------------------------}
  function ServerNow:TDateTime;
  begin
    Result := getTDateFromSQL('SELECT getDate()')
  end;
  function FormatSQLOperator(operator:TSQLOperator):string;
  begin
    case operator of
      soGreaterThan : result := '> ';
      soGreaterThanEqualsTo : result:= '>= ';
      soEquals : result := '= ';
      soLessThan : result:= '< ';
      soLessThanEqualsTo : result:= '<=';
      else result := '= ';
    end;
  end;

  function FormatSQLBoolean(ABoolean: boolean): string;
  begin
    if (ABoolean) then Result := FormatSQLNumber(TRUE_VALUE) else Result := FormatSQLNumber(FALSE_VALUE);
  end;

  function FormatSQLDateTime(ADateTime: TDateTime): string;
  begin
    //Result := FormatDateTime('dd/mm/yyyy hh:nn:ss',ADateTime);
   // Result := FormatDateTime('cast(''yyyy-mm-dd hh:nn:ss'' as datetime)',ADateTime);
   Result := 'cast('+QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss',ADateTime))+'as datetime)';
  end;

  function FormatSQLDate(ADate: TDate): string;
  begin
    Result := 'cast('+QuotedStr(FormatDateTime('yyyy-mm-dd ',ADate))+'as datetime)';
     //Result := FormatDateTime(ShortDateFormat,ADate);
  end;

  function FormatSQLTime(ATime: TTime): string;
  begin
    Result := FormatDateTime(ShortTimeFormat,ATime);
  end;

  function FormatSQLString(AString: string): string;
  begin
     Result := QuotedStr(AString);
  end;

  function FormatSQLWildCard(AString: string): string;
  begin
     Result := QuotedStr(ReplaceSubStr(AString,'*','_'));// AString);
  end;

  function FormatSQLString(AChar: char): string;
  begin
    Result := QuotedStr(AChar);
  end;

  function FormatSQLNumber(AInteger: integer): string;
  begin
     Result := IntToStr(AInteger);
  end;

  function FormatSQLNumber(AFloat: real): string;
  begin
    Result := ReplaceSubStr(FloatToStr(AFloat),DecimalSeparator,'.');
  end;

  function FormatSQLNULL: string;
  begin
    Result := 'NULL';
  end;

  function FormatSQLYearNow:string;
  begin
    Result := FormatDateTime('yyyy',ServerNow);
  end;
  {-------------------------------------------}
   function BufferToBoolean(ABuffer: variant): boolean;
  begin
    Result := BufferToBooleanDef(ABuffer,False);
  end;

  function BufferToBooleanDef(ABuffer: variant; ADefault: boolean): boolean;
  begin
     //if (VarType(ABuffer)=14) or (not VarIsNull(ABuffer)) then
     if VarIsNull(ABuffer) then
         Result := ADefault else Result := ABuffer;
  end;

   function BufferToString(ABuffer: variant): string;
  begin
    Result := BufferToStringDef(ABuffer,'')
  end;

  function BufferToStringDef(ABuffer: variant; ADefault: string): string;
  begin
     //if (VarType(ABuffer)=14) or (not VarIsNull(ABuffer)) then
     if VarIsNull(ABuffer) then
        Result := ADefault else Result := Trim(ABuffer);
  end;

  function BufferToInteger(ABuffer: variant): integer;
  begin
    Result := BufferToIntegerDef(ABuffer,0);
  end;

  function BufferToIntegerDef(ABuffer: variant; ADefault: integer): integer;
  begin
      //if (VarType(ABuffer)=14) or (not VarIsNull(ABuffer)) then
     if VarIsNull(ABuffer) then
         Result := ADefault else Result := ABuffer
  end;

  function BufferToFloat(ABuffer: variant): real;
  begin
   Result := BufferToFloatDef(ABuffer,0)
  end;

  function BufferToFloatDef(ABuffer: variant; ADefault: real): real;
  begin
    // if (VarType(ABuffer)=14) or (not VarIsNull(ABuffer)) then
    if VarIsNull(ABuffer) then
         Result := ADefault else Result := ABuffer;
  end;

  function BufferToDateTime(ABuffer: variant): TDateTime;
  begin
    Result := BufferToDateTimeDef(ABuffer,0)
  end;

  function BufferToDateTimeDef(ABuffer: variant; ADefault: TDateTime): TDateTime;
  begin
   //  if (VarType(ABuffer)=14) or (not VarIsNull(ABuffer)) then
   if VarIsNull(ABuffer) then
         Result := ADefault else Result := ABuffer;
  end;


function TMyConnection.AddParamBoolean(AName: string; ABoolean: boolean;
  ADirection: TParameterDirection): TParameter;
begin
  if (ABoolean) then
    Result := AddParamInteger(AName,TRUE_VALUE,ADirection)
  else
    Result := AddParamInteger(AName,FALSE_VALUE,ADirection);
end;

function TMyConnection.AddParamDateTime(AName: string;
  ADateTime: TDateTime; ADirection: TParameterDirection): TParameter;
begin
   Result := ADOCommand.Parameters.CreateParameter(AName, ftDateTime, ADirection, 0, ADateTime);
end;

function TMyConnection.AddParamFloat(AName: string; AFloat: real;
  ADirection: TParameterDirection): TParameter;
begin
    Result := ADOCommand.Parameters.CreateParameter(AName, ftFloat, ADirection, 0, AFloat);
end;

function TMyConnection.AddParamInteger(AName: string; AInteger: integer;
  ADirection: TParameterDirection): TParameter;
begin
  Result := ADOCommand.Parameters.CreateParameter(AName, ftInteger, ADirection, 0, AInteger);
end;

function TMyConnection.AddParamNull(AName: string): TParameter;
begin
  Result := ADOCommand.Parameters.CreateParameter(AName, ftUnknown, pdInput, 0, varNull);
end;

function TMyConnection.AddParamString(AName, AString: string;
  ADirection: TParameterDirection;ALength:integer): TParameter;
begin
   Result := ADOCommand.Parameters.CreateParameter(AName, ftString, ADirection,IfThen(ALength = 0, length(AString)+1,ALength), AString);
end;

procedure TMyConnection.ExecStoredProc;
var i: integer; ASQL, DirectionStr, ValueStr: string;
begin
  ASQL := '';
  for i:=0 to ADOCommand.Parameters.Count-1 do
    with ADOCommand.Parameters[i] do begin
      {case Direction of
        pdInput: DirectionStr:='<=';
        pdOutput: DirectionStr:='=>';
        pdInputOutput: DirectionStr:='<=>';
        pdReturnValue: DirectionStr:='=';
      end;}
      DirectionStr:=' => ';
      if (Direction in [pdInput,pdInputOutput]) then begin
        case DataType of
          ftDateTime: ValueStr := FormatSQLDate(Value);
          ftFloat, ftInteger: ValueStr := FormatSQLNumber(Value);
          ftString: ValueStr := FormatSQLString(Value);
        end;
        ASQL := ASQL + ', '+Name+DirectionStr+ValueStr+' '
      end{ else
        ASQL := ASQL + ', '+Name+DirectionStr+' '};
    end;
  if (length(ASQL)>0) then delete(ASQL,1,1);
  ASQL := 'EXEC '+ADOCommand.CommandText+'('+ASQL+')';

  try
    ADOCommand.Execute;
    if (DMLFile<>'') then begin
      if (Level = 0) then
        writeLog(DMLFile,ASQL+';')
      else
        Log[high(Log)].Append(ASQL+';');
    end;
  except
    on E: Exception do begin
      WriteLog(ErrorFile,sLineBreak+FormatDateTime('yy/mm/dd hh:nn:ss',Now)+' - '+Application.Title+sLineBreak+'>Message: '+E.Message+sLineBreak+'>Dump: '+ASQL);
      raise;
    end;
  end;


end;

function TMyConnection.GetParamOutput(AName: string): variant;
begin
   Result := ADOCommand.Parameters.ParamValues[AName];
end;

function TMyConnection.StoredProc(AName: string): TParameters;
begin
  ADOCommand.CommandType := cmdStoredProc;
  ADOCommand.CommandText := AName;
  ADOCommand.Parameters.Clear;
  Result := ADOCommand.Parameters;
end;

procedure TMyConnection.SendToExcel(vdto: TDataSet; vTitle: String;
  AFType: Word);
var
  RangeE: Excel2000.Range;
  I, Row: Integer;
  Bookmark: TBookmarkStr;
begin
  FXA.Visible [0] := True;
  FXA.Workbooks.Add(Null,0);

  RangeE := FXA.ActiveCell;
  RangeE.Value := vTitle;
  RangeE := FXA.Range ['A2','A2'];
  for I := 0 to vdto.Fields.Count - 1 do
    begin
      RangeE.Value := vdto.Fields [I].DisplayLabel;
      RangeE := RangeE.Next;
    end;

  vdto.DisableControls;
  try
    Bookmark := vdto.Bookmark;
    try
      vdto.First;
      Row := 3;
      while not vdto.EOF do
        begin
          RangeE := FXA.Range ['A' + IntToStr (Row),
            'A' + IntToStr (Row)];
          for I := 0 to vdto.Fields.Count - 1 do
            begin
              RangeE.Value := vdto.Fields [I].AsString;
              RangeE := RangeE.Next;
            end;
          vdto.Next;
          Inc (Row);
        end;
    finally
      vdto.Bookmark := Bookmark;
    end;
  finally
    vdto.EnableControls;
  end;

  RangeE := FXA.Range ['A2', chr( 64 + vdto.Fields.Count ) + IntToStr (Row - 1)];
  RangeE.AutoFormat (AFType, NULL, NULL, NULL, NULL, NULL, NULL);
  FXA.Disconnect;

end;

procedure TMyConnection.CreateList;
begin
   G_CUSTOMER_LIST  := TStringList.Create;
   G_WAREHOUSE      := TStringList.Create;
//   TService_Arr.GetList(G_SERVICE_LIST);
   //TPerson_Arr.GetList(G_CUSTOMER_LIST,FormatSQLString(PS_TYPE_CUSTOMER),True);
end;

procedure TMyConnection.DestroyList;
begin
   G_CUSTOMER_LIST.Free;
   G_WAREHOUSE.Free;
end;

function TMyConnection.AddParamDate(AName: string; ADate: TDate;
  ADirection: TParameterDirection): TParameter;
begin
  Result := ADOCommand.Parameters.CreateParameter(AName, ftDate, ADirection, 0, ADate);
end;

{ TPeriode }

constructor TPeriode.Create;
begin

end;

destructor TPeriode.Destroy;
begin

  inherited;
end;

procedure TPeriode.Reset;
begin
  FOpPeriodeAwal1 := soEquals;
  FOpPeriodeAkhir1:= soEquals;
  FOpPeriodeAwal2 := soEquals;
  FOpPeriodeAkhir2:= soEquals;
  FPeriodeAwal1   := 0;
  FPeriodeAkhir1  := 0;
  FPeriodeAwal2   := 0;
  FPeriodeAkhir2  := 0;
end;

procedure TPeriode.setPeriode(AItemIndex: integer;ADate1,ADate2:TDate;FirstPeriode:boolean=True);
begin
  if FirstPeriode then begin
    case AItemIndex of
          0:begin
              Self.FOpPeriodeAwal1 := soEquals;
              Self.FPeriodeAwal1   := ADate1;
              Self.FOpPeriodeAkhir1:= soEquals;
              Self.FPeriodeAkhir1  := 0;
            end;
          1:begin
              Self.FOpPeriodeAwal1 := soGreaterThanEqualsTo;
              Self.FPeriodeAwal1   := ADate1;
              Self.FOpPeriodeAkhir1:= soEquals;
              Self.FPeriodeAkhir1  := 0;
            end;

          2:begin
              Self.FOpPeriodeAwal1 := soLessThanEqualsTo;
              Self.FPeriodeAwal1   := ADate1;
              Self.FOpPeriodeAkhir1:= soEquals;
              Self.FPeriodeAkhir1  := 0;
            end;
          3:begin
              Self.FOpPeriodeAwal1 := soGreaterThanEqualsTo;
              Self.FPeriodeAwal1   := ADate1;
              Self.FOpPeriodeAkhir1:= soLessThanEqualsTo;
              Self.FPeriodeAkhir1  := ADate2;
           end;
          end;
  end
  else begin  //periode 2
       case AItemIndex of
          0:begin
              Self.FOpPeriodeAwal2 := soEquals;
              Self.FPeriodeAwal2   := ADate1;
              Self.FOpPeriodeAkhir2:= soEquals;
              Self.FPeriodeAkhir2  := 0;
            end;
          1:begin
              Self.FOpPeriodeAwal2 := soGreaterThanEqualsTo;
              Self.FPeriodeAwal2   := ADate1;
              Self.FOpPeriodeAkhir2:= soEquals;
              Self.FPeriodeAkhir2  := 0;
            end;

          2:begin
              Self.FOpPeriodeAwal2 := soLessThanEqualsTo;
              Self.FPeriodeAwal2   := ADate1;
              Self.FOpPeriodeAkhir2:= soEquals;
              Self.FPeriodeAkhir2  := 0;
            end;
          3:begin
              Self.FOpPeriodeAwal2 := soGreaterThanEqualsTo;
              Self.FPeriodeAwal2   := ADate1;
              Self.FOpPeriodeAkhir2:= soLessThanEqualsTo;
              Self.FPeriodeAkhir2  := ADate2;
           end;
          end;
  end;
end;

end.
