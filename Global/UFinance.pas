unit UFinance;

interface
uses
  Classes, Controls, SysUtils, ADODB, Math, strUtils,
  AutoBengkel, SqlServerConnections, Subroutines,UMaster;

type
  TPayment_Arr = class;
  TPayment = class;
  TMoneyAccount_Arr = class;
  TMoneyAccount = class;
  TMoneyBalance_Arr = class;
  TMoneyBalance = class;
  TMoneyTransaction_Arr = class;
  TMoneyTransaction = class;

  TPayment_Arr = class(_Payment_Arr)
  public
    function FindOnDB():boolean;
  end;

  TPayment = class(_Payment)
  protected
    FMoneyTrans_Arr : TMoneyTransaction_Arr;
  public
    constructor Create;
    destructor Destroy;override;
    function InsertOnDb:boolean;reintroduce;
    property  MoneyTrans_Arr : TMoneyTransaction_Arr read FMoneyTrans_Arr write FMoneyTrans_Arr;
    class function PrefixOf(AType:string):string;
    class function getNewNumber(APaymentType:string;ADate:TDate):string;
  end;

  TMoneyAccount_Arr = class(_MoneyAccount_Arr)
  private
    FFilter : _MoneyAccount;
  public
    constructor Create;
    destructor Destroy;override;
    property Filter : _MoneyAccount read FFilter write FFilter;
    function FindOnDB(AIsNegative:TBooleanOperator=boNone):boolean;
  end;

  TMoneyAccount = class(_MoneyAccount)
  public
    constructor Create;
    destructor Destroy;override;
    function InsertOnDB:boolean;reintroduce;
    function UpdateOnDB:boolean;reintroduce;
    function SelectInDb(AMoneyID:integer):boolean;reintroduce;
    class procedure getListMoneyAccount(ATarget:TStringList;AMoneyType:string;AWithAll:boolean=False);overload;
    class function getNewCode(AMoneyType:string):string;
    class procedure getListAccountType(ATarget: TStringList;AWithAll:boolean=False);
    class function isExistMoneyCode(AMoneyCode: String): Boolean;
    class function getName(AMoneyCode:string):string;
    class function getSaldoOnHand(AMoneyCode : string):Double;
    class function getMoneyType(AMoneyCode: string): string;
    class function getBankName(AMoneyCode: string): string;
//    class procedure GetListBank(ATarget: TStringList;AType: String);
  end;

  TMoneyBalance_Arr = class(_MoneyBalance_Arr)
  end;

  TMoneyBalance = class(_MoneyBalance)
  end;

  TMoneyTransaction_Arr = class(_MoneyTransaction_Arr)
  protected
    function get(Index:integer):TMoneyTransaction;reintroduce;virtual;
    function New:TMoneyTransaction;
  public
    constructor Create;
    destructor Destroy;override;
    function FindOnDb(APaymentID:integer):boolean;
    property MoneyTransaction_Arr[index:integer] : TMoneyTransaction read get;default;
  end;

  TMoneyTransaction = class(_MoneyTransaction)
  public
    function InsertOnDb:boolean;reintroduce;
  end;

implementation

uses UConst, un_ryu, ADOInt;

constructor TMoneyAccount.Create;
begin
  inherited Create;
end;

destructor TMoneyAccount.Destroy;
begin

  inherited;
end;

class function TMoneyAccount.getBankName(AMoneyCode: string): string;
begin
 Result:= getStringFromSQL('select bank_name from money_account where money_code = '+FormatSQLString(AMoneyCode))
end;

class procedure TMoneyAccount.getListAccountType(ATarget: TStringList;AWithAll:boolean);
begin
  ATarget.Clear;
  if AWithAll then
    ATarget.Add(''+'='+'Semua');
  ATarget.Add(MONEY_TYPE_CASH+'='+TEXT_MONEY_TYPE_CASH);
  ATarget.Add(MONEY_TYPE_BANK+'='+TEXT_MONEY_TYPE_BANK);
//  ATarget.Add(MONEY_TYPE_DP+'='+TEXT_MONEY_TYPE_DP)
end;

class procedure TMoneyAccount.getListMoneyAccount(ATarget: TStringList;
  AMoneyType: string;AWithAll:boolean);
var sql:string;
begin
  ATarget.Clear;
  if AMoneyType = MONEY_TYPE_BANK then
    sql := 'SELECT money_code, money_name + '' - '' + account_number FROM money_account '+
        IfThen(AMoneyType<>'', ' WHERE money_type ='+FormatSQLString(AMoneyType))
  else
    sql := 'SELECT money_code, money_name +'' - ''+ Money_code FROM money_account '+
        IfThen(AMoneyType<>'', ' WHERE money_type ='+FormatSQLString(AMoneyType));
  if AWithAll then
    SQLToNameValueList2(ATarget,sql)
  else
    SQLToNameValueList(ATarget,sql);
end;

{class procedure TMoneyAccount.GetListBank(ATarget: TStringList;
  AType: String);
var sql: string;
begin
 ATarget.Clear;
 sql := 'SELECT Money_Code , Nvl2(m.ps_seq, money_name+'+FormatSQLString('-')+'+ps_name,money_name) FROM Money_Account m, Person p '+
    ' where p.ps_Seq(+)=m.ps_seq  '+
  IfThen(AType<>'',' and money_type='+FormatSQLString(AType),'')+
  ' order by money_name';
  SQLToNameValueList(ATarget, sql);
end;
 }

class function TMoneyAccount.getMoneyType(AMoneyCode: string): string;
begin
 Result:= getStringFromSQL('select money_type from money_account where money_code = '+FormatSQLString(AMoneyCode))
end;

class function TMoneyAccount.getName(AMoneyCode: string): string;
begin
  Result := getStringFromSQL('SELECT money_name FROM money_account WHERE money_code ='+FormatSQLString(AMoneyCode));
  if Result <> '' then
    Result := EkstrakString(Result,';',1);
end;

class function TMoneyAccount.getNewCode(AMoneyType: string): string;
begin
  Result := getNextIDNum('money_code','money_account',' AND money_type ='+FormatSQLString(AMoneyType) ,AMoneyType,'',4);
end;

class function TMoneyAccount.getSaldoOnHand(AMoneyCode: string): Double;
var sql:string;
begin
  sql := 'SELECT balance FROM money_balance '+
          ' WHERE money_code = '+FormatSQLString(AMoneyCode)+
          ' AND TRUNC(balance_date) = (SELECT TRUNC(MAX(balance_date) ) FROM money_balance '+
            ' WHERE money_code = '+FormatSQLString(AMoneyCode)+')';
  Result := getFloatFromSQL(sql);

end;

function TMoneyAccount.InsertOnDB: boolean;
var sql:String;
begin
  sql  := 'INSERT INTO Money_Account (Money_Code,Money_Name,Money_Type, Bank_Name, Account_number )'+
    ' VALUES ('+
      FormatSQLString(FMoneyCode)+','+
      FormatSQLString(FMoneyName)+','+
//      FormatSQLString(FAccountNumber)+','+
//      FormatSQLString(FCashierCode)+','+
      FormatSQLString(FMoneyType)+','+
//      IfThen(FPSSeq <> 0, FormatSQLNumber(FPSSeq),FormatSQLNULL2)+','+
  //    FormatSQLString(FCashType)+','+
  //    FormatSQLBoolean(FCanNegative)+','+
      FormatSQLString(FBankName)+','+
      FormatSQLString(FAccNum)+')';
//      IfThen(FMoneyType =MONEY_TYPE_DP,FormatSQLBoolean(FIsIn),FormatSQLNULL2)+')';
  Result := ExecTransaction(sql);
end;


class function TMoneyAccount.isExistMoneyCode(AMoneyCode: String): Boolean;
begin
  Result := getBooleanFromSQL('SELECT COUNT(*) FROM Money_account '+
        ' WHERE Money_code ='+FormatSQLString(AMoneyCode));
end;

function TMoneyAccount.SelectInDb(AMoneyID: integer): boolean;
var buffer: _RecordSet;
   Sql : string;
begin
  Sql := 'SELECT MA.Money_Code, MA.Money_Name,MA.Money_Type, MA.Bank_Name '+
  ' ,MA.account_number, MA.Money_Id '+
     ' FROM Money_Account MA'+
    ' WHERE MA.Money_Id ='+FormatSQLNumber(AMoneyID);
  buffer := myConnection.OpenSQL(Sql);
  if (buffer.RecordCount<>0) then begin
    FMoneyCode := BufferToString(buffer.Fields[0].Value);
    FMoneyName := BufferToString(buffer.Fields[1].Value);
//    FDisabledDate := BufferToDateTime(buffer.Fields[2].Value);
 //   FNotes := BufferToString(buffer.Fields[3].Value);
 //   FOwnerName := BufferToString(buffer.Fields[4].Value);
//    FCashierCode := BufferToString(buffer.Fields[5].Value);
    FMoneyType := BufferToString(buffer.Fields[2].Value);
 //   FPSSeq := BufferToInteger(buffer.Fields[7].Value);
//    FCashType := BufferToString(buffer.Fields[8].Value);
//    FCanNegative := BufferToBoolean(buffer.Fields[9].Value);
    FBankName := BufferToString(buffer.Fields[3].Value);
    FAccNum := BufferToString(buffer.Fields[4].Value);
    FMoneyId := BufferToInteger(buffer.Fields[5].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

function TMoneyAccount.UpdateOnDB: boolean;
var sql:string;
begin
  sql := 'UPDATE Money_Account SET'+
          ' Money_Name='+FormatSQLString(FMoneyName)+','+
//          ' Disabled_Date='+FormatSQLDate(FDisabledDate)+','+
  //        ' Notes='+FormatSQLString(FNotes)+','+
   //       ' Owner_Name='+FormatSQLString(FOwnerName)+','+
    //      ' Cashier_Code='+FormatSQLString(FCashierCode)+','+
          ' Money_Type='+FormatSQLString(FMoneyType)+','+
     //     IfThen(FPSSeq<>0,' PS_Seq='+FormatSQLNumber(FPSSeq)+',')+
      //    ' Cash_Type='+FormatSQLString(FCashType)+','+
        //  ' Can_Negative='+FormatSQLBoolean(FCanNegative)+','+
          ' Bank_Name ='+FormatSQLString(FBankName)+','+
          ' Account_Number ='+FormatSQLString(AccNum)+
//          IfThen(FMoneyType = MONEY_TYPE_DP,', is_in = '+ FormatSQLBoolean(FIsIn))+
    ' WHERE Money_code ='+FormatSQLString(FMoneyCode);
//      ' AND PS_Seq='+FormatSQLNumber(FPSSeq);
  Result := ExecTransaction(sql,False);
end;


constructor TMoneyAccount_Arr.Create;
begin
   inherited Create;
   FFilter := _MoneyAccount.Create;
end;

destructor TMoneyAccount_Arr.Destroy;
begin
  inherited;
  FFilter.Free;
end;

function TMoneyAccount_Arr.FindOnDB(AIsNegative:TBooleanOperator): boolean;
var buffer: _RecordSet; i:integer;
   sql,vFilter :string;
begin
  sql :=
    'SELECT MA.money_id,MA.Money_Code, MA.Money_Name, MA.Money_type,  '+
    'MA.Money_Owner,MA.account_number,MA.Bank_Name'+
     ' FROM Money_Account MA ';
  vFilter := '';
  If FFilter.MoneyCode <> '' then
    vFilter := vFilter +' and Money_Code='+FormatSQLString(FFilter.MoneyCode);
  if (FFilter.MoneyType <> '') then
    vFilter := vFilter +' and Money_Type ='+FormatSQLString(FFilter.MoneyType);
  if FFilter.MoneyName <> '' then
    vFilter := vFilter +' and Money_Name ='+FormatSQLString(FFilter.MoneyName);

  if vFilter <> '' then
    sql := sql+' WHERE '+copy(vFilter, 5, length(vFilter))+' order by Money_Name';
  buffer := myConnection.OpenSQL(sql);
  Result := (buffer.RecordCount<>0);

  if Result then
    for i:= 0 to buffer.RecordCount-1 do
      with buffer do begin
        Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
          BufferToString(Fields[4].Value),BufferToString(Fields[5].Value),
          BufferToString(Fields[6].Value),'',0);
        MoveNext;
      end;
  buffer.Close;
end;

{ TPayment }

constructor TPayment.Create;
begin
  FMoneyTrans_Arr := TMoneyTransaction_Arr.Create;
  inherited Create;
end;

destructor TPayment.Destroy;
begin
  FMoneyTrans_Arr.Free;
  inherited;
end;

class function TPayment.getNewNumber(APaymentType: string;
  ADate: TDate): string;
var vPrefix:string;  
begin
  vPrefix := PrefixOf(APaymentType)+getPeriode2(ADate)+'/';
  Result := getNextIDNumPeriode('payment_num','payment',' AND payment_type ='+FormatSQLString(APaymentType),
    vPrefix,'','');

end;

function TPayment.InsertOnDb: boolean;
var SQL : string;
    i:integer;
begin
  SQL := 'INSERT INTO Payment (Payment_Type,Payment_Date,Payment_Num,Subtotal,Discount,Ppn,Charges,Total,Notes,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FPaymentType)+','+
      FormatSQLDate(FPaymentDate)+','+
      FormatSQLString(FPaymentNum)+','+
      FormatSQLNumber(FSubtotal)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FPpn)+','+
      FormatSQLNumber(FCharges)+','+
      FormatSQLNumber(FTotal)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+')';
  try
    MyConnection.BeginSQL;
    MyConnection.ExecSQL(SQL);
    FPaymentId := getIntegerFromSQL('SELECT MAX(payment_id) FROM payment');
    for i:= 0 to FMoneyTrans_Arr.Count-1 do begin
       FMoneyTrans_Arr[i].Payment.PaymentId := FPaymentId;
       TMoneyTransaction(FMoneyTrans_Arr[i]).InsertOnDB;
    end;
    Result := True;
    MyConnection.EndSQL;
  except
    Result := False;
    MyConnection.UndoSQL;
  end;
end;

class function TPayment.PrefixOf(AType: string): string;
begin
  case AType[1] of
    PAYMENT_TYPE_BIAYA : Result := 'PB';
  end;
end;

{ TMoneyTransaction_Arr }

constructor TMoneyTransaction_Arr.Create;
begin
  inherited Create;
  SetLength(FMoneyTransaction_Arr,0);
end;

destructor TMoneyTransaction_Arr.Destroy;
begin
  inherited;
end;

function TMoneyTransaction_Arr.FindOnDb(APaymentID:integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT d.Money_Trans_Id, d.payment_id, d.money_balance_Id, d.db_cr_type, d.Amount, d.Notes '+
            ' , d.acc_id, a.acc_code, a.acc_name '+
            ' FROM money_Transaction d LEFT OUTER JOIN '+
                ' Account a ON a.acc_id = d.acc_id '+
            ' WHERE payment_id ='+FormatSQLNumber(APaymentID);

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
          BufferToInteger(Fields[2].Value),BufferToString(Fields[3].Value),
          BufferToFloat(Fields[4].Value),BufferToString(Fields[5].Value),
          BufferToInteger(Fields[6].Value));
      FMoneyTransaction_Arr[idx].Account.AccCode := BufferToString(Fields[7].Value);
      FMoneyTransaction_Arr[idx].Account.AccName := BufferToString(Fields[8].Value);    
      moveNext;
    end;
  buffer.close;
end;

function TMoneyTransaction_Arr.get(Index: integer): TMoneyTransaction;
begin
  Result := TMoneyTransaction(inherited get(Index));
end;

function TMoneyTransaction_Arr.New: TMoneyTransaction;
begin
  Result:= TMoneyTransaction.Create;
end;

{ TMoneyTransaction }

function TMoneyTransaction.InsertOnDb: boolean;
var SQL : string;
begin
  SQL :=  'INSERT INTO Money_Transaction (Payment_Id,Acc_Id,Money_Balance_Id,Db_Cr_Type,Amount,Notes)'+
    ' VALUES ('+
      FormatSQLNumber(FPayment.PaymentId)+','+
      IfThen(FAccount.AccId>0,FormatSQLNumber(FAccount.AccId),FormatSQLNULL)+','+
      FormatSQLNumber(FMoneyBalance.MoneyBalanceId)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLNumber(FAmount)+','+
      FormatSQLString(FNotes)+')';
  Result := ExecTransaction3(SQL);
end;

{ TPayment_Arr }

function TPayment_Arr.FindOnDB: boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  SQL := 'SELECT P.Payment_Id, P.Payment_Type, P.Payment_Date, P.Payment_Num, P.Subtotal,'+
      ' P.Discount, P.Ppn, P.Charges, P.Total, P.Notes, P.user_insert '+
     ' FROM Payment P ';

  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND payment_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND payment_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if vFilter <> '' then
    SQL := SQL + 'WHERE'+copy(vFilter,5,length(vFilter));
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToDateTime(Fields[2].Value),BufferToString(Fields[3].Value),
          BufferToFloat(Fields[4].Value),BufferToFloat(Fields[5].Value),
          BufferToFloat(Fields[6].Value),BufferToFloat(Fields[7].Value),
          BufferToFloat(Fields[8].Value),BufferToString(Fields[9].Value),
          BufferToString(Fields[10].Value),'',0,0);
      moveNext;
    end;
  buffer.close;
end;

end.
