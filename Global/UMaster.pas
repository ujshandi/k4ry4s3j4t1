unit UMaster;

interface

uses
  Classes, Controls, SysUtils, ADODB, Math, strUtils,
  AutoBengkel, SqlServerConnections, Subroutines;

type
  TItems_Arr = class;
  TItems = class;
  TItemPrice_Arr = class;
  TItemPrice = class;
  TMotor_Arr = class;
  TMotor = class;
  TWarehouse_Arr = class;
  TWarehouse = class;

  TPersons_Arr = class;
  TPersons = class;

  TPersonsCar_Arr = class;
  TPersonsCar = class;

  TServices_Arr = class;
  TServices = class;

  TAccount_Arr = class;
  TAccount = class;

  TServicePackage_Arr = class;
  TServicePackage = class;

  TItems_Arr = class(_Items_Arr)
  protected
    FFilter : TItems;
    //FStok : array of Double;
  public
    constructor Create;
    destructor Destroy;override;
    property Filter : TItems read FFilter write FFilter;
    //property Stok[index:integer] : double read FStok;default;
    procedure Clear;override;
    function FindOnDb(isAddNew:boolean=False;limit:integer=25;offset:integer=0):boolean;

    function FindFlat(ExistInBalance:boolean=False;ShowZero:boolean=True;WithStok:boolean=False;limit:integer=25;offset:integer=0):boolean;
    function countFindFlat(ExistInBalance:boolean=False;ShowZero:boolean=True;WithStok:boolean=False):integer;
    function FindFlatWithService:boolean;
    function countOnDb(isAddNew:boolean=False):integer;
  end;

  TItems = class(_Items)
  private
    //tok : Double;
  public
    constructor Create;
    destructor Destroy;override;
    function InsertOnDb:boolean;reintroduce;
    function UpdateOnDB(WithPRice:boolean):boolean;reintroduce;
    procedure UpdatePrice;
    procedure UpdatePricePurchase;
    procedure InsertPrice;
    procedure Reset;override;
    function UpdateTipe:boolean;
    function SelectInDb(AItemId:integer):boolean;reintroduce;
    //operty Stok :Double read FStok write FStok;
    class function getNewNumber(AItemType:string):string;
    class function Hapus(AItemID:integer):boolean;
    class function getConversion(AItemId:integer):real;
    class function getStokTotal(AItemId:integer;aWithPending:boolean=False):real;
    class function getStokTotalPeriode(AItemId:integer;APeriode:TDate;AIsAwal:boolean=True):real;
    class function getStokTotalPeriodeNew(AItemId:integer;APeriode:TDate;AIsAwal:boolean=True):real;
    class procedure getListName(AStringList:TStringList);
    class function getDesc(AType:string):string;
    class function isExistCode(ACode:string;aID:integer=0;aPrice:Double=0;ASOrtirHarga:boolean=True):boolean;
    class function isOldSameNewPrice(ACode:string;aID:integer=0;aPrice:Double=0):boolean;
    class function getMaxId:integer;
    class function isZeroPrice(AItemId:integer):boolean;
    class function isZeroPricePurchase(AItemId:integer):boolean;
    class function getPrice(AItemID: integer;AItemCode:string=''): Double;
    class function getPricePurchase(AItemID: integer;AItemCode:string=''): Double;
    class function getFieldValue(AItemId: integer; AFieldName: string): string;
    class function getMaxPriceBel(aSHipType : string;aItemId:Integer;aShipType2:string=''):Double;
    //cari data trans yg ref ke item ini
    class function getTransRefItem(AItemId:integer):string;
    class function BenerinStock(AItemId:integer):boolean;
    class function getIdFromCode(ACode:string):integer;
  end;

  TWarehouse_Arr = class(_Warehouse_Arr)
  public
    function FindOnDb():boolean;
    class procedure getListGudang(AList:TStringList;AItems:TStrings;AWithAcive:boolean=False;AWithAll:boolean=False);
  end;

  TWarehouse = class(_Warehouse)
  public
    function InsertOnDb:boolean;reintroduce;
    function UpdateOnDb : boolean;reintroduce;
    class function isExistCode(ACode:string):boolean;
    class function adaYgAktif:boolean;
    class function getGudangAktif:integer;
    class function getName(AID:integer):string;
  end;

  TPersons_Arr = class(_Persons_Arr)
  protected
    FFilter: TPersons;
  public
    constructor Create;
    destructor Destroy; override;
    property Filter : TPersons read FFilter write FFilter;
    function FindOnDB(AForContact:boolean=False;AManyTyppe:boolean=False;isAddNew:boolean=False;limit:integer=25;offset:integer=0): boolean;
    function countOnDB(AForContact:boolean=False;AManyTyppe:boolean=False;isAddNew:boolean=False): integer;
    function FindFlat(aWithShipment:boolean=False;aFieldInShipment:string='';aPeriode:TPeriode=nil):boolean;
    function FindMechanic(shipId:integer=0):boolean;

    class procedure GetList(ATarget: TStringList; APsType: string;WithAddressTlp:boolean=False;PsSeqUsed:integer=0;WithAll:boolean=False);
    class function GetSQLPerson(AFilter: TPersons): string;
  end;

  TPersons = class(_Persons)
  protected
    FCar_Arr : tpersonsCar_Arr;
  public
    constructor Create();
    destructor Destroy; override;
    function InsertOnDB: boolean; reintroduce;
    function UpdateOnDB: boolean; reintroduce;
    function DeleteOnDB: boolean; reintroduce;
    //with cars
    function InsertOnDBCars: boolean;
    function UpdateOnDBCars: boolean;
    function DeleteOnDBCars: boolean;

    function SelectInDB(APsSeq: integer=0; APsCode: string= ''): boolean; reintroduce;
    function SelectInDBCars(APsSeq: integer=0; APsCode: string= ''): boolean;

    function ExistInDBCar(aID:integer;aNoPol:string): boolean; reintroduce;

    function isMechanicOnService(shipId:integer;mechanicId:integer):boolean;
    class function ExistInDB(APsCode: string;aID:integer=0): boolean; reintroduce;

//    class function ExistFromName(APsName: string): boolean;
    class function GetNewNumber(APsType: string): string;
    class function getSeqFromCode(APsCode:string):integer;
    class function getCodeFromID(APsID:integer):string;
    class function getInfo(ApsSeq:integer):string;
    class function getMaxId:integer;

    property Car_Arr : tpersonsCar_Arr read FCar_Arr write FCar_Arr;
  end;


  TPersonsCar_Arr = class(_PersonsCar_Arr)
  protected
    FFilter: TPersonsCar;
  public
    constructor Create;
    destructor Destroy; override;
    property Filter : TPersonsCar read FFilter write FFilter;
    function FindOnDb(ApersonId:integer):boolean;
    class procedure GetList(ATarget: TStringList; APersonId:integer;WithAll:boolean=false);


  end;

  TPersonsCar = class(_PersonsCar)
  protected
     function InsertOnDB: boolean; reintroduce;
    function UpdateOnDB: boolean; reintroduce;
  public
    constructor Create();
    destructor Destroy; override;

    function DeleteOnDB: boolean; reintroduce;

    function SelectInDB(APsSeq: integer=0; APsCode: string= '';forInfo:boolean=false;aktifOnly:boolean=false): boolean; reintroduce;
    class function ExistInDB(APsCode: string;aID:integer=0): boolean; reintroduce;
  end;


  TServices_Arr = class(_Services_Arr)
  protected
    FFilter : TServices;
  public
    constructor Create;
    destructor Destroy;override;
    property Filter : TServices read FFilter write FFilter;
    function FindOnDb(AServiceType2:string='';isAddNew:boolean=False;limit:integer=25;offset:integer=0):boolean;
    function FindFlat:boolean;
    function countOnDb(AServiceType2:string='';isAddNew:boolean=False):integer;
  end;

  TServices = class(_Services)
  protected
    FPackage_Arr : tServicePackage_Arr;

  public
    constructor Create;
    destructor Destroy;override;
    function InsertOnDb:boolean;reintroduce;
    function UpdateOnDB:boolean;reintroduce;
    procedure UpdatePrice;
    property Package_Arr : TServicePackage_Arr read FPackage_Arr write FPackage_Arr;
    class function getNewNumber(AServiceType:string):string;
    class function Hapus(AServiceSeq:integer): boolean; reintroduce;
    class function getMaxID:integer;
    class function getDesc(AType:string):string;
    class function isZeroPrice(AServiceID:integer):boolean;
    class function isExistCode(ACode:string;aId:integer=0):boolean;
    class function getTransRefService(AServiceId:integer):string;
  end;

  TCompanyProfile = class(_CompanyProfile)
  public
    function isExist:boolean;
    function SelectInDB:boolean;
    class function  getProfile:string;
  end;

  TMotor_Arr = class(_Motor_Arr)
  protected
    FFilter : TMotor;
  public
    constructor Create;
    destructor Destroy;override;
    property Filter : TMotor read FFilter write FFilter;
    function FindOnDb(CheckWithService:Boolean=False;aShipServType:string=''):boolean;

  end;

  TMotor = class(_Motor)
  public
    function InsertOnDb:boolean;reintroduce;
    function UpdateOnDB:boolean;reintroduce;
    class function getNewNumber(AMotorType:string):string;
    class function getName(AMotorId:integer):string;
    class function Hapus(AMotorId:integer): boolean;
    class procedure getListType(AList:TStringList;ATarget:TStrings;AWithAll:boolean=False);
  end;

  TItemPrice_Arr = class(_ItemPrice_Arr)
  public
    function FindOnDb(AItemId:integer=0;AServiceId:integer=0):boolean;
  end;

  TItemPrice = class(_ItemPrice)
  public
    class function getPriceActive(AItemId,AServiceID:integer):Double;
  end;

  TItemPricePurchase_Arr = class(_ItemPricePurchase_Arr)
  public
    function FindOnDb(AItemId:integer=0):boolean;
  end;

  TItemPricePurchase = class(_ItemPricePurchase)
  public
    class function getPriceActive(AItemId:integer):Double;
  end;


  TAccount_Arr = class(_Account_Arr)
    function FindOnDb():boolean;
  end;
  
  TAccount = class(_Account)
  public
    function InsertOnDB:boolean;reintroduce;
    function UpdateOnDb:boolean;reintroduce;
    function SelectOnDB(AAccId:integer):boolean;reintroduce;
    class function isExistCode(AAccCode:string):boolean;
    class function getNewCode(AccType:string):string;
    class function getAmountBiaya(AccId:integer;Periode:TPeriode):Double;
  end;


  TServicePackage_Arr = class(_ServicePackage_Arr)
  protected
    function get(index:integer):TServicePackage;reintroduce;virtual;
    function New:TServicePackage;
  public
    function FindOnDb(AServiceId:integer):boolean;
    property ServicePackage_arr[index : integer] : TServicePackage read get;default;
  end;

  TServicePackage = class(_ServicePackage)
  protected
    function InsertOnDb:boolean;reintroduce;
    function UpdateOnDb:boolean;reintroduce;
  public
    class function getNotes(aId,aParentId:integer;isService:boolean):string;
  end;
implementation

uses un_ryu, UConst, UTransaction;

{ TPersons }

constructor TPersons.Create;
begin

  inherited Create;
  FCar_Arr := TPersonsCar_Arr.Create;
end;

function TPersons.DeleteOnDB: boolean;
var sqL: string;
begin
  sql:=
    'DELETE FROM Persons'+
    ' WHERE Person_id='+FormatSQLNumber(FPersonId);
  Result:= ExecTransaction4(sqL);

end;

function TPersons.DeleteOnDBCars: boolean;
var sqL: string;
begin
  sql:=
    'DELETE FROM Persons'+
    ' WHERE Person_id='+FormatSQLNumber(FPersonId);
  Result:= ExecTransaction4(sqL);


end;

destructor TPersons.Destroy;
begin
  FCar_Arr.Free;
  inherited;
end;

class function TPersons.ExistInDB(APsCode: string;aID:integer): boolean;
begin
  Result:= getIntegerFromSQL
    ('SELECT COUNT(*) FROM Persons WHERE Person_Code = '+
      FormatSQLString(APsCode)+
      IfThen(aID>0,' AND person_id <> '+FormatSQLNumber(aID))) > 0;
end;

function TPersons.ExistInDBCar(aID: integer;
  aNoPol: string): boolean;
begin
  Result:= getIntegerFromSQL
    ('SELECT COUNT(*) FROM Persons_car WHERE person_id = '+FormatSQLNumber(aID)+
    ' and nopol = '+ FormatSQLString(aNoPol)) > 0;

end;

function TPersons.isMechanicOnService(shipId,
  mechanicId: integer): boolean;
var sql : string;
begin
   Sql := 'select count(*) from persons p inner join shipment_mechanic s on s.person_id=p.person_id '+
   ' where s.ship_id = '+FormatSQLNumber(shipId)+ ' and s.person_id = '+FormatSQLNumber(mechanicId);
   Result := getIntegerFromSQL(sql)>0;
end;


class function TPersons.getCodeFromID(APsID: integer): string;
begin
  Result := getStringFromSQL('SELECT person_code FROM persons WHERE person_id ='+FormatSQLNumber(APsID));
end;

class function TPersons.getInfo(ApsSeq: integer): string;
begin
   Result := getStringFromSQL('SELECT person_name FROM persons WHERE person_id ='+FormatSQLNumber(ApsSeq));
end;

class function TPersons.getMaxId: integer;
begin
  Result := getIntegerFromSQL('SELECT MAX(person_id) FROM persons')
end;

class function TPersons.GetNewNumber(APsType: string): string;
var vPrefix:string;
begin
  vPrefix := APsType;
  Result  := getNextIDNum('person_code','persons',' and person_type = '+FormatSQLString(APsType),vPrefix,'',IfThen(APsType=PS_TYPE_CUSTOMER,5,3));
end;

class function TPersons.getSeqFromCode(APsCode: string): integer;
begin
  Result := getIntegerFromSQL('SELECT person_id FROM persons WHERE person_code ='+FormatSQLString(APsCode));
end;

function TPersons.InsertOnDB: boolean;
   var sqL: string;
begin
  sql:=
    'INSERT INTO Persons (Person_Code,Person_Type,Person_Name,Address,City,Postal_Code,Birth_Date,Id_Num,'+
    'Phone1,Phone2,Phone3,mtr_year, mtr_rangka, mtr_mesin, motor_id, Notes,User_Insert,contact_person,account)'+
    ' VALUES ('+
      FormatSQLString(FPersonCode)+','+
      FormatSQLString(FPersonType)+','+
      FormatSQLString(FPersonName)+','+
      FormatSQLString(FAddress)+','+
      FormatSQLString(FCity)+','+
      FormatSQLString(FPostalCode)+','+
      FormatSQLDateTime(FBirthDate)+','+
      FormatSQLString(FIdNum)+','+
      FormatSQLString(FPhone1)+','+
      FormatSQLString(FPhone2)+','+
      FormatSQLString(FPhone3)+','+
      FormatSQLNumber(FMtrYear)+','+
      FormatSQLString(FMtrRangka)+','+
      FormatSQLString(FMtrMesin)+','+
      IfThen(FMotor.MotorId>0,FormatSQLNumber(FMotor.MotorId),FormatSQLNULL)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FContactPerson)+','+
      FormatSQLString(FAccount)+')';
    //  FormatSQLString(FUserEdit)+','+
     // FormatSQLDateTime(FDateInsert)+','+
    //  FormatSQLDateTime(FDateEdit)+')';
  Result:= ExecTransaction(sqL);
end;

function TPersons.InsertOnDBCars: boolean;
   var SQL : string;
   i:integer;
begin
   sql:=
    'INSERT INTO Persons (Person_Code,Person_Type,Person_Name,Address,City,Postal_Code,Birth_Date,Id_Num,'+
    'Phone1,Phone2,Phone3, Notes,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FPersonCode)+','+
      FormatSQLString(FPersonType)+','+
      FormatSQLString(FPersonName)+','+
      FormatSQLString(FAddress)+','+
      FormatSQLString(FCity)+','+
      FormatSQLString(FPostalCode)+','+
      FormatSQLDateTime(FBirthDate)+','+
      FormatSQLString(FIdNum)+','+
      FormatSQLString(FPhone1)+','+
      FormatSQLString(FPhone2)+','+
      FormatSQLString(FPhone3)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+')';
  try
    MyConnection.BeginSQL;
    Result := ExecTransaction3(SQL);
    FPersonId := getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
      for i:= 0 to FCar_Arr.Count-1 do begin
        FCar_Arr[i].PersonId := FPersonId;
        TPersonsCar(FCar_Arr[i]).InsertOnDB;
      end;
    MyConnection.EndSQL;
  except
    MyConnection.UndoSQL;
    Result := False;
  end;


end;

function TPersons.SelectInDB(APsSeq: integer; APsCode: string): boolean;
var sqL: string; buffer: _Recordset;
begin
  sqL:=
    'SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Address, P.City, '+
    'P.Phone1, P.Phone2, P.Phone3, P.Postal_Code,P.Birth_Date,P.id_num  '+
    ', p.motor_id, p.mtr_rangka, p.mtr_mesin, p.mtr_year,p.contact_person, p.account '+
    'FROM Persons P '+
    IfThen(APsSeq <> 0,
      ' WHERE P.Person_id ='+FormatSQLNumber(APsSeq),
      ' WHERE P.Person_Code ='+FormatSQLString(APsCode));
  Self.Reset;
  buffer:= myConnection.OpenSQL(sqL);
  result:= buffer.RecordCount > 0;
  if Result then begin
    FPersonId   := BufferToInteger(buffer.Fields[0].Value);
    FPersonCode := BufferToString(buffer.Fields[1].Value);
    FPersonType := BufferToString(buffer.Fields[2].Value);
    FPersonName := BufferToString(buffer.Fields[3].Value);
    FAddress    := BufferToString(buffer.Fields[4].Value);
    FCity       := BufferToString(buffer.Fields[5].Value);
    FPhone1     := BufferToString(buffer.Fields[6].Value);
    FPhone2     := BufferToString(buffer.Fields[7].Value);
    FPhone3     := BufferToString(buffer.Fields[8].Value);
    FPostalCode := BufferToString(buffer.Fields[9].Value);
    FBirthDate  := BufferToDateTime(buffer.Fields[10].Value);
    FIdNum      := BufferToString(buffer.Fields[11].Value);
    FMotor.MotorId := BufferToInteger(buffer.Fields[12].Value);
    FMtrRangka  := BufferToString(buffer.Fields[13].Value);
    FMtrMesin   := BufferToString(buffer.Fields[14].Value);
    FMtrYear    := BufferToInteger(buffer.Fields[15].Value);
    FContactPerson  := BufferToString(buffer.Fields[16].Value);
    FAccount   := BufferToString(buffer.Fields[17].Value);
    buffer.MoveNext;
  end;
  buffer.Close;

end;

function TPersons.SelectInDBCars(APsSeq: integer;
  APsCode: string): boolean;
var sqL: string; buffer: _Recordset;
begin
  sqL:=
    'SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Address, P.City, '+
    'P.Phone1, P.Phone2, P.Phone3, P.Postal_Code,P.Birth_Date,P.id_num  '+
    ', p.motor_id, p.mtr_rangka, p.mtr_mesin, p.mtr_year '+
    'FROM Persons P '+
    IfThen(APsSeq <> 0,
      ' WHERE P.Person_id ='+FormatSQLNumber(APsSeq),
      ' WHERE P.Person_Code ='+FormatSQLString(APsCode));
  Self.Reset;
  buffer:= myConnection.OpenSQL(sqL);
  result:= buffer.RecordCount > 0;
  if Result then begin
    FPersonId   := BufferToInteger(buffer.Fields[0].Value);
    FPersonCode := BufferToString(buffer.Fields[1].Value);
    FPersonType := BufferToString(buffer.Fields[2].Value);
    FPersonName := BufferToString(buffer.Fields[3].Value);
    FAddress    := BufferToString(buffer.Fields[4].Value);
    FCity       := BufferToString(buffer.Fields[5].Value);
    FPhone1     := BufferToString(buffer.Fields[6].Value);
    FPhone2     := BufferToString(buffer.Fields[7].Value);
    FPhone3     := BufferToString(buffer.Fields[8].Value);
    FPostalCode := BufferToString(buffer.Fields[9].Value);
    FBirthDate  := BufferToDateTime(buffer.Fields[10].Value);
    FIdNum      := BufferToString(buffer.Fields[11].Value);
    FMotor.MotorId := BufferToInteger(buffer.Fields[12].Value);
    FMtrRangka  := BufferToString(buffer.Fields[13].Value);
    FMtrMesin   := BufferToString(buffer.Fields[14].Value);
    FMtrYear    := BufferToInteger(buffer.Fields[15].Value);
    buffer.MoveNext;
  end;
  buffer.Close;



end;

function TPersons.UpdateOnDB: boolean;
var SQL : string;
begin
  SQL := 'UPDATE Persons SET'+
          ' Person_Code='+FormatSQLString(FPersonCode)+','+
          ' Person_Type='+FormatSQLString(FPersonType)+','+
          ' Person_Name='+FormatSQLString(FPersonName)+','+
          ' Address='+FormatSQLString(FAddress)+','+
          ' City='+FormatSQLString(FCity)+','+
          ' Postal_Code='+FormatSQLString(FPostalCode)+','+
          ' Birth_Date='+FormatSQLDateTime(FBirthDate)+','+
          IfThen(FMotor.MotorId>0,'motor_id ='+FormatSQLNumber(FMotor.MotorId)+',')+
          ' Id_Num='+FormatSQLString(FIdNum)+','+
          ' Phone1='+FormatSQLString(FPhone1)+','+
          ' Phone2='+FormatSQLString(FPhone2)+','+
          ' Phone3='+FormatSQLString(FPhone3)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' mtr_year ='+FormatSQLNumber(FMtrYear)+','+
          ' mtr_rangka ='+FormatSQLString(FMtrRangka)+','+
          ' mtr_mesin ='+FormatSQLString(FMtrMesin)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' contact_person ='+FormatSQLString(FContactPerson)+','+
          ' account='+FormatSQLString(FAccount)+','+
          ' Date_Edit='+FormatSQLDateTime(ServerNow)+
    ' WHERE Person_Id='+FormatSQLNumber(FPersonId);
  Result := ExecTransaction(SQL,False);

end;


function TPersons.UpdateOnDBCars: boolean;
var SQL : string; i:integer;
begin
  SQL := 'UPDATE Persons SET'+
          ' Person_Code='+FormatSQLString(FPersonCode)+','+
          ' Person_Type='+FormatSQLString(FPersonType)+','+
          ' Person_Name='+FormatSQLString(FPersonName)+','+
          ' Address='+FormatSQLString(FAddress)+','+
          ' City='+FormatSQLString(FCity)+','+
          ' Postal_Code='+FormatSQLString(FPostalCode)+','+
          ' Birth_Date='+FormatSQLDateTime(FBirthDate)+','+
          IfThen(FMotor.MotorId>0,'motor_id ='+FormatSQLNumber(FMotor.MotorId)+',')+
          ' Id_Num='+FormatSQLString(FIdNum)+','+
          ' Phone1='+FormatSQLString(FPhone1)+','+
          ' Phone2='+FormatSQLString(FPhone2)+','+
          ' Phone3='+FormatSQLString(FPhone3)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' mtr_year ='+FormatSQLNumber(FMtrYear)+','+
          ' mtr_rangka ='+FormatSQLString(FMtrRangka)+','+
          ' mtr_mesin ='+FormatSQLString(FMtrMesin)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(ServerNow)+
    ' WHERE Person_Id='+FormatSQLNumber(FPersonId);
  try
    MyConnection.BeginSQL;
    Result := ExecTransaction3(SQL);
    Result := ExecTransaction3(SQL);
      for i:= 0 to FCar_Arr.Count-1 do begin
        FCar_Arr[i].PersonId := FPersonId;

        if ExistInDBCar(FPersonId,FCar_Arr[i].NoPol) then
          TPersonsCar(FCar_Arr[i]).UpdateOnDB
        else
          TPersonsCar(FCar_Arr[i]).InsertOnDB;
      end;
    Result := True;
    MyConnection.EndSQL;
  except
    Result := False;
    MyConnection.UndoSQL;
  end;


end;

{ TPersonsCar }

constructor TPersonsCar.Create;
begin
  inherited Create;
end;

function TPersonsCar.DeleteOnDB: boolean;
var sqL: string;
begin
  sql:=
    'DELETE FROM Persons'+
    ' WHERE Person_id='+FormatSQLNumber(FPersonId);
  Result:= ExecTransaction4(sqL);

end;

destructor TPersonsCar.Destroy;
begin

  inherited;
end;

class function TPersonsCar.ExistInDB(APsCode: string;aID:integer): boolean;
begin
  Result:= getIntegerFromSQL
    ('SELECT COUNT(*) FROM Persons_car WHERE disable=0 and nopol = '+
      FormatSQLString(APsCode))>0;
  //    IfThen(aID>0,' AND person_id <> '+FormatSQLNumber(aID))) > 0;
end;

function TPersonsCar.InsertOnDB: boolean;
   var sqL: string;
begin
  sql:=
    'INSERT INTO Persons_car (person_id,nopol,mtr_year, mtr_rangka, mtr_mesin, disable,motor_id)'+
    ' VALUES ('+
    FormatSQLNumber(FPersonId)+','+
      FormatSQLString(FNoPol)+','+
      FormatSQLNumber(FMtrYear)+','+
      FormatSQLString(FMtrRangka)+','+
      FormatSQLString(FMtrMesin)+','+
      FormatSQLNumber(FDisable)+','+
      FormatSQLNumber(FMotor.MotorId)+')';
  Result:= ExecTransaction3(sqL);
end;

function TPersonsCar.SelectInDB(APsSeq: integer; APsCode: string;forInfo:boolean;aktifOnly:boolean): boolean;
var sqL: string; buffer: _Recordset;
begin
  if forInfo  then

    sqL:=
    'SELECT person_id,nopol, p.motor_id, p.mtr_rangka, p.mtr_mesin, p.mtr_year,p.disable '+
    'FROM Persons_car P '+
      ' WHERE  P.Person_id ='+FormatSQLNumber(APsSeq)+
        ' and nopol = '+FormatSQLString(APsCode)
  else
  sqL:=
    'SELECT person_id,nopol, p.motor_id, p.mtr_rangka, p.mtr_mesin, p.mtr_year,p.disable '+
    'FROM Persons_car P '+
      ' WHERE '+IfThen(APsSeq>0, ' P.Person_id ='+FormatSQLNumber(APsSeq),
        ' nopol = '+FormatSQLString(APsCode))+IfThen(aktifOnly,' and p.disable =0 ','');
  Self.Reset;
  buffer:= myConnection.OpenSQL(sqL);
  result:= buffer.RecordCount > 0;
  if Result then begin
    FPersonId   := BufferToInteger(buffer.Fields[0].Value);
    FNoPol := BufferToString(buffer.Fields[1].Value);
    FMotor.MotorId := BufferToInteger(buffer.Fields[2].Value);
    FMtrRangka  := BufferToString(buffer.Fields[3].Value);
    FMtrMesin   := BufferToString(buffer.Fields[4].Value);
    FMtrYear    := BufferToInteger(buffer.Fields[5].Value);
    FDisable    := BufferToInteger(buffer.Fields[6].Value);
    buffer.MoveNext;
  end;
  buffer.Close;

end;

function TPersonsCar.UpdateOnDB: boolean;
var SQL : string;
begin
  SQL := 'UPDATE Persons_car SET'+
          ' nopol='+FormatSQLString(FNoPol)+','+
          'motor_id ='+FormatSQLNumber(FMotor.MotorId)+','+
          ' mtr_year ='+FormatSQLNumber(FMtrYear)+','+
          ' mtr_rangka ='+FormatSQLString(FMtrRangka)+','+
          'disable ='+FormatSQLNumber(FDisable)+','+
          ' mtr_mesin ='+FormatSQLString(FMtrMesin)+
    ' WHERE Person_Id='+FormatSQLNumber(FPersonId)+
    ' and nopol='+FormatSQLString(FNoPol);
  Result := ExecTransaction3(SQL);

end;

{ TPersons_Arr }

function TPersons_Arr.countOnDB(AForContact, AManyTyppe,
  isAddNew: boolean): integer;
var SQL,vFilter, vOperant : string;
    buffer : _Recordset;
    i,idx : integer;
begin
   vFilter := '';
   SQL :=  'SELECT COUNT (*)   '+
    'FROM Persons P ';
   vOperant := IfThen(isAddNew,' OR', ' AND');   
   if FFilter.PersonType <> '' then
     if AManyTyppe then
       vFilter := vFilter + ' AND p.person_type IN ('+FFilter.PersonType+')'
     else
       vFilter := vFilter + ' AND p.person_type = '+FormatSQLString(FFilter.PersonType);
   if FFilter.PersonId <> 0 then
     vFilter := vFilter + ' AND p.person_id ='+FormatSQLNumber(FFilter.PersonId);
   if FFilter.PersonCode <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.person_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.PersonCode+'%'));
   if FFilter.PersonName <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.person_Name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.PersonName+'%'));
   if FFilter.Address <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.address) LIKE '+FormatSQLWildCard(UpperCase(FFilter.Address+'%'));
   if FFilter.Phone1 <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.phone1) LIKE '+FormatSQLWildCard(UpperCase(FFilter.Phone1+'%'));
   if FFilter.MtrRangka <> '' then
     vFilter := vFilter + ' AND UPPER(p.mtr_Rangka) LIKE '+FormatSQLWildCard(UpperCase(FFilter.MtrRangka+'%'));
   if FFilter.MtrMesin <> '' then
     vFilter := vFilter + ' AND UPPER(p.mtr_Mesin) LIKE '+FormatSQLWildCard(UpperCase(FFilter.MtrMesin+'%'));
   if vFilter <> '' then
     SQL := SQL + 'WHERE '+copy(vFilter,5,length(vFilter));
   buffer := myConnection.OpenSQL(SQL);
   Result := getIntegerFromSQL(SQL);

  
end;

constructor TPersons_Arr.Create;
begin
  FFilter := TPersons.Create;
  inherited Create;
end;

destructor TPersons_Arr.Destroy;
begin
  FFilter.Free;
  inherited;
end;

function TPersons_Arr.FindFlat(aWithShipment: boolean;aFieldInShipment:string;aPeriode:TPeriode): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  if FFilter.PersonType <> '' then
//       vFilter := vFilter + ' AND p.person_type IN ('+FFilter.PersonType+')'
  //   else
     vFilter := vFilter + ' AND p.person_type = '+FormatSQLString(FFilter.PersonType);
   if FFilter.PersonId <> 0 then
     vFilter := vFilter + ' AND p.person_id ='+FormatSQLNumber(FFilter.PersonId);
   if FFilter.PersonCode <> '' then
     vFilter := vFilter + ' AND UPPER(p.person_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.PersonCode+'%'));
   if FFilter.PersonName <> '' then
     vFilter := vFilter + ' AND UPPER(p.person_Name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.PersonName+'%'));
   if FFilter.Address <> '' then
     vFilter := vFilter + ' AND UPPER(p.address) LIKE '+FormatSQLWildCard(UpperCase(FFilter.Address+'%'));
   if FFilter.Phone1 <> '' then
     vFilter := vFilter + ' AND UPPER(p.phone1) LIKE '+FormatSQLWildCard(UpperCase(FFilter.Phone1+'%'));

  if aWithShipment then begin
    SQL := 'SELECT DISTINCT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name  '+
//    'P.Phone1,p.mtr_year, p.mtr_rangka, p.mtr_mesin   '+
    'FROM Persons P, Shipment S '+
    ' WHERE '+IfThen(aFieldInShipment='','s.person_id',aFieldInShipment)+ ' = p.person_id';
    if vFilter <> '' then
      SQL := SQL + vFilter;
  end
  else begin
    SQL := 'SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name  '+
    'FROM Persons P ';
    if vFilter <> '' then
    SQL := SQL + 'WHERE'+copy(vFilter,5,length(vFilter));
  end;


  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
          0,'','','',0,'','','','','','','',0,0,0,'','');
      moveNext;
    end;
  buffer.close;
end;

function TPersons_Arr.FindMechanic(shipId: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
   vFilter := vFilter + ' AND p.person_type = '+FormatSQLString(PS_TYPE_MECHANIC);
//   if (shipId>0) then
  //   vFilter := vFilter + ' AND ship_id ='+FormatSQLNumber(shipId);

  if true then begin
    SQL := 'SELECT DISTINCT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name  '+
//    'P.Phone1,p.mtr_year, p.mtr_rangka, p.mtr_mesin   '+
    'FROM Persons P left join Shipment_mechanic S on s.person_id = p.person_id ';
    SQL := SQL + 'WHERE'+copy(vFilter,5,length(vFilter));
   // ' WHERE '+IfThen(aFieldInShipment='','s.person_id',aFieldInShipment)+ ' = p.person_id';
//    if vFilter <> '' then
   //   SQL := SQL + vFilter;
  end
  else begin
    SQL := 'SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name  '+
    'FROM Persons P ';
    if vFilter <> '' then
    SQL := SQL + 'WHERE'+copy(vFilter,5,length(vFilter));
  end;


  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
          0,'','','',0,'','','','','','','',0,0,0,'','');//titip ke mtr_year = ship_id
      moveNext;
    end;
  buffer.close;


end;

function TPersons_Arr.FindOnDB(AForContact: boolean=false;AManyTyppe:boolean=false;isAddNew:boolean=false;limit:integer=25;offset:integer=0): boolean;
var SQL,vFilter, vOperant,vFilterInner : string;
    buffer : _Recordset;
    i,idx : integer;
begin
   vFilter := '';
   vOperant := IfThen(isAddNew,' OR', ' AND');
   if FFilter.PersonType <> '' then
     if AManyTyppe then
       vFilter := vFilter + ' AND p.person_type IN ('+FFilter.PersonType+')'
     else
       vFilter := vFilter + ' AND p.person_type = '+FormatSQLString(FFilter.PersonType);
   if FFilter.PersonId <> 0 then
     vFilter := vFilter + ' AND p.person_id ='+FormatSQLNumber(FFilter.PersonId);
   if FFilter.PersonCode <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.person_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.PersonCode+'%'));
   if FFilter.PersonName <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.person_Name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.PersonName+'%'));
   if FFilter.Address <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.address) LIKE '+FormatSQLWildCard(UpperCase(FFilter.Address+'%'));
   if FFilter.Phone1 <> '' then
     vFilter := vFilter + vOperant +' UPPER(p.phone1) LIKE '+FormatSQLWildCard(UpperCase(FFilter.Phone1+'%'));
   if FFilter.MtrRangka <> '' then
     vFilter := vFilter + ' AND UPPER(p.mtr_Rangka) LIKE '+FormatSQLWildCard(UpperCase(FFilter.MtrRangka+'%'));
   if FFilter.MtrMesin <> '' then
     vFilter := vFilter + ' AND UPPER(p.mtr_Mesin) LIKE '+FormatSQLWildCard(UpperCase(FFilter.MtrMesin+'%'));
   if vFilter <> '' then
     vFilterInner := 'WHERE '+copy(vFilter,5,length(vFilter));

   SQL :=   'SELECT TOP '+FormatSQLNumber(limit)+
    ' P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name,p.Motor_Id, P.Address, P.City, '+
    'P.Postal_Code,P.Birth_Date,P.id_num,P.Phone1, P.Phone2, P.Phone3,P.Notes,P.User_Insert,p.mtr_year, p.mtr_rangka, p.mtr_mesin,p.contact_person,p.account   '+
    'FROM Persons P '+
    ' where P.Person_Id not in (select top '+FormatSQLNumber(offset)+' P.Person_Id from Persons P '+vFilterInner+' order by person_id ) ';;

   SQL := SQL + vFilter; 
   buffer := myConnection.OpenSQL(SQL);
   Self.Clear;
   Result := (buffer.recordcount >0);
   if Result then
     for i:= 0 to buffer.RecordCount-1 do
      With buffer do begin
        idx:=Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
            BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
            BufferToInteger(Fields[4].Value),BufferToString(Fields[5].Value),
            BufferToString(Fields[6].Value),BufferToString(Fields[7].Value),
            BufferToDateTime(Fields[8].Value),
            BufferToString(Fields[9].Value),BufferToString(Fields[10].Value),
            BufferToString(Fields[11].Value),BufferToString(Fields[12].Value),
            BufferToString(Fields[13].Value),BufferToString(Fields[14].Value),
            '',0,0,BufferToInteger(Fields[15].Value),
            BufferToString(Fields[16].Value),BufferToString(Fields[17].Value));
           FPersons_Arr[idx].ContactPerson := BufferToString(Fields[18].Value);
           FPersons_Arr[idx].Account := BufferToString(Fields[19].Value); 
        MoveNext;
      end;
   buffer.close;
end;

class procedure TPersons_Arr.GetList(ATarget: TStringList; APsType: string;
  WithAddressTlp: boolean; PsSeqUsed: integer; WithAll: boolean);
var sqL: String; buffer:_Recordset;
  i:integer;
begin
  sqL:=
    'SELECT Person_Id, Person_Name, RTRIM(address), phone1  FROM Persons'+
    IfThen(APsType <> '', ' where person_type in('+APsType+')');
//    IfThen(PsSeqUsed>0,' AND ps_seq_used = '+FormatSQLNumber(PsSeqUsed));
  //SQLToNameValueList(ATarget, sqL);
   {+IfThen(WithAddressTlp,'+'' (''+RTRIM(ISNULL(address,''''))+''<''+ISNULL(phone1,'''')+''>''+'')''')+'
   }ATarget.Clear;
    buffer := myConnection.OpenSQL(SQL);
    for i :=1 to buffer.RecordCount do begin
      ATarget.Add(BufferToString(buffer.Fields[0].Value)+'='+BufferToString(buffer.Fields[1].Value)+
          IfThen(WithAddressTlp,' ('+BufferToString(buffer.Fields[2].Value+' <'+
              BufferToString(buffer.Fields[3].Value+'>)'))));
      buffer.MoveNext;
    end;
    if WithAll then
      ATarget.Add('0'+'='+'Semua');
    buffer.Close;

end;

class function TPersons_Arr.GetSQLPerson(AFilter: TPersons): string;
var SQL,vFilter : string;
begin
   vFilter := '';
   SQL :=  'SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Address, P.City, '+
    'P.Postal_Code,P.Birth_Date,P.id_num,P.Phone1, P.Phone2, P.Phone3,P.Notes,P.User_Insert,P.User_Edit,P.Date_Insert,P.date_Edit   '+
    'FROM Persons P ';
   if vFilter <> '' then
     SQL := SQL + 'WHERE '+copy(vFilter,5,length(vFilter));
   Result := SQL;
end;




{ TPersonsCar_Arr }

constructor TPersonsCar_Arr.Create;
begin
  FFilter := TPersonsCar.Create;
  inherited Create;
end;

destructor TPersonsCar_Arr.Destroy;
begin
  FFilter.Free;
  inherited;
end;


function TPersonsCar_Arr.FindOnDb(ApersonId:integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    idx,i:integer;
begin
  vFilter := '';
   if (ApersonId>0) then
     vFilter := vFilter + ' AND person_id ='+FormatSQLNumber(ApersonId);

  if true then begin
    SQL := 'SELECT DISTINCT p.person_id,p.nopol,p.motor_id,p.mtr_year, p.mtr_rangka, p.mtr_mesin,s.Motor_Name,p.disable   '+
    'FROM Persons_car P left join motor S on s.motor_id = p.motor_id ';
    SQL := SQL + 'WHERE'+copy(vFilter,5,length(vFilter));
  end;


  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx:=Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToInteger(Fields[2].Value),BufferToInteger(Fields[3].Value),
          BufferToString(Fields[4].Value),BufferToString(Fields[5].Value));
      FPersonsCar_Arr[idx].Motor.MotorId := BufferToInteger(Fields[2].Value);
      FPersonsCar_Arr[idx].Motor.MotorName := BufferToString(Fields[6].Value);
      FPersonsCar_Arr[idx].Disable := BufferToInteger(Fields[7].Value);
      moveNext;
    end;
  buffer.close;


end;


class procedure TPersonsCar_Arr.GetList(ATarget: TStringList; APersonId:integer;WithAll:boolean=false);
var sqL: String; buffer:_Recordset;
  i:integer;
begin
  sqL:=
    'SELECT nopol  FROM Persons_car'+
 ' where person_id ='+FormatSQLNumber(APersonId);
//    IfThen(PsSeqUsed>0,' AND ps_seq_used = '+FormatSQLNumber(PsSeqUsed));
  //SQLToNameValueList(ATarget, sqL);
   {+IfThen(WithAddressTlp,'+'' (''+RTRIM(ISNULL(address,''''))+''<''+ISNULL(phone1,'''')+''>''+'')''')+'
   }ATarget.Clear;
    buffer := myConnection.OpenSQL(SQL);
    for i :=1 to buffer.RecordCount do begin
      ATarget.Add(BufferToString(buffer.Fields[0].Value)+'='+BufferToString(buffer.Fields[0].Value));
      buffer.MoveNext;
    end;
    if WithAll then
      ATarget.Add('0'+'='+'Semua');
    buffer.Close;

end;

{ TItems }

class function TItems.BenerinStock(AItemId: integer): boolean;
begin
  Result := False;
  with MyConnection do begin
    try
       MyConnection.BeginSQL;
       StoredProc('menerkeun_stock');
       AddParamInteger('@p_item_id',AItemId);
       ExecStoredProc;
       MyConnection.EndSQL;
       Inform('Data telah diperbaiki!');
       Result := True;
    except
       MyConnection.UndoSQL;
       Alert('Data gagal diperbaiki!');
       Result := False;
    end;
  end;
end;

constructor TItems.Create;
begin
  inherited Create;
end;

destructor TItems.Destroy;
begin

  inherited;
end;

class function TItems.getConversion(AItemId: integer): real;
begin
  Result := getFloatFromSQL('SELECT conversion FROM items WHERE item_id='+FormatSQLNumber(AItemId));
  if Result = 0 then
    Result := 1;
end;

class function TItems.getDesc(AType: string): string;
begin
  case AType[1] of
    ITEM_TYPE_OIL : Result := 'Oli';
    ITEM_TYPE_PART: Result := 'Part';
    SERVICE_TYPE_SINGLE : Result := 'Service';
    SERVICE_TYPE_OTHERS : Result := 'Lain-Lain';
  end;
end;

class function TItems.getFieldValue(AItemId: integer;
  AFieldName: string): string;
begin
  Result := getStringFromSQL('SELECT '+AFieldName+' FROM items '+
          ' WHERE item_id ='+FormatSQLNumber(AItemId));
end;

class function TItems.getIdFromCode(ACode: string): integer;
begin
  Result := getIntegerFromSQL('SELECT item_id from items where item_code='+FormatSQLString(ACode));
end;

class procedure TItems.getListName(AStringList: TStringList);
var sql:string;
begin
  sql := 'SELECT item_id, item_name FROM items '+
          ' ORDER by item_name';
  SQLToNameValueList2(AStringList,sql);
end;

class function TItems.getMaxId: integer;
begin
  Result := getIntegerFromSQL('SELECT MAX(item_id) FROM items')
end;

class function TItems.getMaxPriceBel(aSHipType: string; aItemId: Integer;
  aShipType2: string): Double;
var sql : string;
begin
 if aShipType2 = '' then
    sql := 'SELECT MAX(price) FROM item_detail d INNER JOIN shipment s '+
          ' ON d.ship_id = s.ship_id '+
          ' WHERE s.ship_type = '+FormatSQLString(aSHipType)+
          ' AND d.item_id = '+FormatSQLNumber(aItemId)
  else
    sql := 'SELECT MAX(price) FROM item_detail d INNER JOIN shipment s '+
          ' ON d.ship_id = s.ship_id '+
          ' WHERE s.ship_type IN ('+FormatSQLString(aSHipType)+','+FormatSQLString(aShipType2)+')'+
          ' AND d.item_id = '+FormatSQLNumber(aItemId);
 Result := getFloatFromSQL(sql);
end;

class function TItems.getNewNumber(AItemType: string): string;
begin
  Result := getNextIDNum('item_code','items',' AND item_type ='+FormatSQLString(AItemType),AItemType);
end;

class function TItems.getPrice(AItemID: integer;AItemCode:string): Double;
begin
 if AItemID >0 then
    Result := getFloatFromSQL('SELECT price FROM items WHERE item_id ='+FormatSQLNumber(AItemID))
 else
  Result := getFloatFromSQL('SELECT price FROM items WHERE UPPER(item_code) ='+FormatSQLString(UpperCase(AItemCode)));
end;

class function TItems.getPricePurchase(AItemID: integer;AItemCode:string): Double;
begin
  if AItemID > 0 then
    Result := getFloatFromSQL('SELECT price_purchase FROM items WHERE item_id ='+FormatSQLNumber(AItemID))
  else
    Result := getFloatFromSQL('SELECT price_purchase FROM items WHERE Upper(item_code) ='+FormatSQLString(UpperCase(AItemCode)));
end;

class function TItems.getStokTotal(AItemId: integer;aWithPending:boolean): real;
begin
 Result := getFloatFromSQL('SELECT SUM(balance) FROM item_balance '+
        ' WHERE item_id ='+FormatSQLNumber(AItemId));
 if aWithPending then
   Result := Result - getFloatFromSQL('SELECT SUM(Quantity) FROM dummy_item_detail '+
            ' WHERE item_id='+FormatSQLNumber(AItemId));

end;

class function TItems.getStokTotalPeriode(AItemId: integer;
  APeriode: TDate; AIsAwal: boolean): real;
var sql:string;
    vOperator : TSQLOperator;
    vDebet,vCredit : Double;
begin
  if AIsAwal then
    vOperator := soLessThan
  else
    vOperator := soLessThanEqualsTo;
  sql := 'SELECT SUM(balance) FROM item_balance '+
        ' WHERE item_id ='+FormatSQLNumber(AItemId)+
          ' AND cast(floor(cast(balance_date as float)) as datetime) '+
          FormatSQLOperator(vOperator)+FormatSQLDate(APeriode);
  Result := getFloatFromSQL(sql);
  if Result = 0 then begin
    sql := 'SELECT (db_balance) FROM item_balance '+
        ' WHERE item_id ='+FormatSQLNumber(AItemId)+
          ' AND cast(floor(cast(balance_date as float)) as datetime) = '+
         ' (SELECT MAX(balance_date) FROM item_balance WHERE item_id ='+FormatSQLNumber(AItemId)+
          ' AND cast(floor(cast(balance_date as float)) as datetime) '+ FormatSQLOperator(vOperator)+FormatSQLDate(APeriode)+')'+
          ' order by item_balance_id desc ';
    sql := 'select sum(quantity) '+
          ' from item_detail d, shipment s, item_balance b '+
          ' where s.ship_id = d.ship_id and b.item_balance_id = d.item_balance_id '+
          ' and db_cr_type = ''D''  and b.item_id = '+FormatSQLNumber(AItemId)+
          ' AND cast(floor(cast(ship_date as float)) as datetime) '+ FormatSQLOperator(vOperator)+FormatSQLDate(APeriode);
   vDebet := getFloatFromSQL(sql);
   sql := 'select sum(quantity) '+
          ' from item_detail d, shipment s, item_balance b '+
          ' where s.ship_id = d.ship_id and b.item_balance_id = d.item_balance_id '+
          ' and db_cr_type = ''C''  and b.item_id = '+FormatSQLNumber(AItemId)+
          ' AND cast(floor(cast(ship_date as float)) as datetime) '+ FormatSQLOperator(vOperator)+FormatSQLDate(APeriode);
    vCredit := getFloatFromSQL(sql);
    Result := vDebet - vCredit;
  end;
end;

class function TItems.getStokTotalPeriodeNew(AItemId: integer;
  APeriode: TDate; AIsAwal: boolean): real;
var sql : string;  
begin
  sql := 'SELECT dbo.get_stok_periode('+FormatSQLNumber(AItemId)+','+
          FormatSQLDate(IfThen(AIsAwal,APeriode-1,APeriode))+')';
  Result := getFloatFromSQL(sql);
end;

class function TItems.getTransRefItem(AItemId: integer): string;
var SQL: string;
    buffer : _recordset;
    i:integer;
begin
  SQL := 'SELECT ship_num, ship_type, ship_date '+
          ' FROM shipment s, item_detail d '+
          ' WHERE s.ship_id = d.ship_id '+
          ' AND d.item_id = '+FormatSQLNumber(AItemId)+
          ' UNION '+
          'SELECT ship_num, ship_type, ship_date '+
          ' FROM shipment s, dummy_item_detail d '+
          ' WHERE s.ship_id = d.ship_id '+
          ' AND d.item_id = '+FormatSQLNumber(AItemId);

  buffer := MyConnection.OpenSQL(SQL);
  Result := '';
  for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Result := Result + 'Transaksi '+ TShipment.getDesc(BufferToString(Fields[1].Value))+'  ('+
      BufferToString(Fields[0].Value)+')'+ #13;
      moveNext;
    end;
  buffer.close;


end;

class function TItems.Hapus(AItemID: integer): boolean;
var vStr : string;
begin
  vStr := getTransRefItem(AItemID);
  Result := False;
  if vStr <> '' then begin
    Alert('Data tidak bisa dihapus karena sudah ada pada transaksi berikut :'+#13+
          vStr);
    exit;
  end;

  try
    MyConnection.BeginSQL;
    MyConnection.ExecSQL('DELETE FROM item_balance WHERE item_id ='+FormatSQLNumber(AItemID));
    MyConnection.ExecSQL('DELETE FROM item_price WHERE item_id ='+FormatSQLNumber(AItemID));
    MyConnection.ExecSQL('DELETE FROM item_price_purchase WHERE item_id ='+FormatSQLNumber(AItemID));
    MyConnection.ExecSQL('DELETE FROM items WHERE item_id ='+FormatSQLNumber(AItemID));
   // Result := ExecTransaction4('DELETE FROM items WHERE item_id ='+FormatSQLNumber(AItemID))
    MyConnection.EndSQL;
    Result := True;
  except
    Result := False;
    MyConnection.UndoSQL;
  end;
//  Result := ExecTransaction4('DELETE FROM items WHERE item_id ='+FormatSQLNumber(AItemID))
end;

function TItems.InsertOnDb: boolean;
var SQL : string;
begin
  SQL := 'INSERT INTO Items (Item_Code,Item_Type,Item_Name,used_unit,Purchase_Unit, Conversion,Price,stok_limit,Notes,car_id,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FItemCode)+','+
      FormatSQLString(FItemType)+','+
      FormatSQLString(FItemName)+','+
      FormatSQLString(FUsedUnit)+','+
      FormatSQLString(FPurchaseUnit)+','+
      FormatSQLNumber(FConversion)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FStokLimit)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLNumber(FCarId)+','+
      FormatSQLString(FUserInsert)+')';
  Result := ExecTransaction(SQL);

end;

procedure TItems.InsertPrice;
var SQL : string;
begin
  SQL := 'INSERT INTO Items (Item_Code,Item_Type,Item_Name,used_unit,Purchase_Unit, Conversion,Price,Price_Purchase,stok_limit,Notes,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FItemCode)+','+
      FormatSQLString(FItemType)+','+
      FormatSQLString(FItemName)+','+
      FormatSQLString(FUsedUnit)+','+
      FormatSQLString(FPurchaseUnit)+','+
      FormatSQLNumber(FConversion)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FPricePurchase)+','+
      FormatSQLNumber(FStokLimit)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+')';
  ExecTransaction3(SQL);

end;

class function TItems.isExistCode(ACode: string;aID:integer;aPrice:Double;ASOrtirHarga:boolean): boolean;
begin
  Result := getIntegerFromSQL('SELECT COUNT(*) FROM items WHERE item_code ='+
        FormatSQLString(ACode)+
        IfThen(aID>0,' AND item_id <> '+FormatSQLNumber(aID))+
        IfThen(aPrice>0 ,IfThen(ASOrtirHarga,' And',' OR')+' price <> '+FormatSQLNumber(aPrice))) > 0;
end;

class function TItems.isOldSameNewPrice(ACode: string; aID: integer;
  aPrice: Double): boolean;
begin
  Result := getIntegerFromSQL('SELECT COUNT(*) FROM items WHERE item_code ='+
        FormatSQLString(ACode)+
        IfThen(aID>0,' AND item_id <> '+FormatSQLNumber(aID))+
        IfThen(aPrice>0 ,' And price = '+FormatSQLNumber(aPrice))) > 0;
end;

class function TItems.isZeroPrice(AItemId: integer): boolean;
begin
  Result := getFloatFromSQL('SELECT price FROM items WHERE item_id ='+FormatSQLNumber(AItemId))=0;
end;

class function TItems.isZeroPricePurchase(AItemId: integer): boolean;
begin
  Result := getFloatFromSQL('SELECT price_purchase FROM items WHERE item_id ='+FormatSQLNumber(AItemId))=0;
end;

procedure TItems.Reset;
begin
  inherited;

end;

function TItems.SelectInDb(AItemId: integer): boolean;
var vPrice, vPricePurchase : Double;
    sql : string;
    buffer:_Recordset;
begin
  sql :=
    'SELECT I.Item_Id, I.Item_Code, I.Item_Type, I.Item_Name, I.Used_Unit, I.Purchase_Unit, I.Price, I.Conversion, I.Notes, I.User_Insert, I.User_Edit, I.Date_Insert, I.Date_Edit, I.Stok_Limit, I.Rank, I.Price_Purchase,I.car_id'+

         ', m.motor_name'+
     ' FROM Items I LEFT OUTER JOIN motor m on m.motor_id = i.car_id '+
    ' WHERE I.Item_Id='+FormatSQLNumber(AItemId);
  buffer := myConnection.OpenSQL(sql);
  if (buffer.RecordCount<>0) then begin
    FItemId := BufferToInteger(buffer.Fields[0].Value);
    FItemCode := BufferToString(buffer.Fields[1].Value);
    FItemType := BufferToString(buffer.Fields[2].Value);
    FItemName := BufferToString(buffer.Fields[3].Value);
    FUsedUnit := BufferToString(buffer.Fields[4].Value);
    FPurchaseUnit := BufferToString(buffer.Fields[5].Value);
    vPrice := TItemPrice.getPriceActive(FItemId,0);
    vPricePurchase := TItemPricePurchase.getPriceActive(FItemId);

    FPrice := IfThen(vPrice>0,vPrice,BufferToFloat(buffer.Fields[6].Value));
    FConversion := BufferToFloat(buffer.Fields[7].Value);
    FNotes := BufferToString(buffer.Fields[8].Value);
    FUserInsert := BufferToString(buffer.Fields[9].Value);
    FUserEdit := BufferToString(buffer.Fields[10].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[11].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[12].Value);
    FStokLimit := BufferToInteger(buffer.Fields[13].Value);
    FRank := BufferToInteger(buffer.Fields[14].Value);
    FPricePurchase := IfThen(vPricePurchase>0,vPricePurchase, BufferToFloat(buffer.Fields[15].Value));
    FCarId := BufferToInteger(buffer.Fields[16].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

function TItems.UpdateOnDB(WithPRice:boolean): boolean;
var SQL : string;
begin
  SQL := 'UPDATE Items SET'+
          ' Item_Code='+FormatSQLString(FItemCode)+','+
          ' Item_Type='+FormatSQLString(FItemType)+','+
          ' Item_Name='+FormatSQLString(FItemName)+','+
          ' Used_Unit='+FormatSQLString(FUsedUnit)+','+
          ' Purchase_Unit='+FormatSQLString(FPurchaseUnit)+','+
          ' Conversion='+FormatSQLNumber(FConversion)+','+
          ' Price='+FormatSQLNumber(IfThen(withPrice,FPrice,TItems.getPrice(FItemId)))+','+
          ' Price_Purchase='+FormatSQLNumber(IfThen(withPrice,FPricePurchase,TItems.getPricePurchase(FItemId)))+','+
          ' Stok_Limit='+FormatSQLNumber(FStokLimit)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Car_Id='+FormatSQLNumber(FCarId)+','+
          ' Date_Edit='+FormatSQLDateTime(ServerNow)+
    ' WHERE Item_Id='+FormatSQLNumber(FItemId);
  Result := ExecTransaction(SQL,False);

end;



procedure TItems.UpdatePrice;
begin
  if FItemCode <> '' then
    ExecTransaction3('UPDATE items set Price='+FormatSQLNumber(fPrice)+
 //   ',price_purchase = '+FormatSQLNumber(TItems.getPricePurchase(FItemId))+
    ',user_edit = '+FormatSQLString(UserEdit)+
  ', date_edit = '+FormatSQLDate(ServerNow)+' WHERE item_code='+FormatSQLString(FItemCode))
  else
     ExecTransaction3('UPDATE items set Price='+FormatSQLNumber(fPrice)+
    //  ',price_purchase = '+FormatSQLNumber(TItems.getPricePurchase(FItemId))+
      ',user_edit = '+FormatSQLString(UserEdit)+
  ', date_edit = '+FormatSQLDate(ServerNow)+' WHERE item_id='+FormatSQLNumber(FItemId));
end;

procedure TItems.UpdatePricePurchase;
begin
  if FItemCode <> '' then
    ExecTransaction3('UPDATE items set Price_Purchase='+FormatSQLNumber(fPricePurchase)+
  //  ',price = '+FormatSQLNumber(TItems.getPrice(FItemId))+
    ',user_edit = '+FormatSQLString(UserEdit)+
  ', date_edit = '+FormatSQLDate(ServerNow)+' WHERE item_code='+FormatSQLString(FItemCode))
  else
     ExecTransaction3('UPDATE items set Price_Purchase='+FormatSQLNumber(fPricePurchase)+
   //   ',price = '+FormatSQLNumber(TItems.getPrice(FItemId))+
      ',user_edit = '+FormatSQLString(UserEdit)+
  ', date_edit = '+FormatSQLDate(ServerNow)+' WHERE item_id='+FormatSQLNumber(FItemId));
end;

function TItems.UpdateTipe: boolean;
begin
  Result := ExecTransaction('UPDATE items SET item_type ='+FormatSQLString(FItemType)+
          ' WHERE item_id = '+FormatSQLNumber(FItemId));
end;

{ TServices }

constructor TServices.Create;
begin
  inherited Create;
  FPackage_Arr := TServicePackage_Arr.Create;
end;

destructor TServices.Destroy;
begin
  FPackage_Arr.Free;
  inherited;
end;

class function TServices.getDesc(AType: string): string;
begin
  if AType = '' then
    Result := ''
  else
    case AType[1] of
      SERVICE_TYPE_SINGLE  : Result := 'Reguler';
      SERVICE_TYPE_PACKAGE : Result := 'Paket';
      SERVICE_TYPE_OTHERS  : Result := 'Lain-lain';
    end;
end;

class function TServices.getMaxID: integer;
begin
  Result := getIntegerFromSQL('SELECT MAX(service_id) FROM services');
end;

class function TServices.getNewNumber(AServiceType: string): string;
begin
  Result := getNextIDNum('service_code','services',' AND service_type ='+FormatSQLString(AServiceType),AServiceType);
end;

class function TServices.getTransRefService(AServiceId: integer): string;
var SQL: string;
    buffer : _recordset;
    i:integer;
begin
  SQL := 'SELECT ship_num, ship_type, ship_date '+
          ' FROM shipment s, service_detail d '+
          ' WHERE s.ship_id = d.ship_id '+
          ' AND d.service_id = '+FormatSQLNumber(AServiceId)+
          ' UNION '+
          'SELECT ship_num, ship_type, ship_date '+
          ' FROM shipment s, dummy_item_detail d '+
          ' WHERE s.ship_id = d.ship_id '+
          ' AND d.service_id = '+FormatSQLNumber(AServiceId);

  buffer := MyConnection.OpenSQL(SQL);
  Result := '';
  for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Result := Result + 'Transaksi '+ TShipment.getDesc(BufferToString(Fields[1].Value))+'  ('+
      BufferToString(Fields[0].Value)+')'+ #13;
      moveNext;
    end;
  buffer.close;
end;

class function TServices.Hapus(AServiceSeq: integer): boolean;
var //sqL: string;
   vStr : string;
begin
  vStr := getTransRefService(AServiceSeq);
  Result := False;
  if vStr <> '' then begin
    Alert('Data tidak bisa dihapus karena sudah ada pada transaksi berikut :'+#13+
          vStr);
    exit;
  end;

  try
    MyConnection.BeginSQL;
    MyConnection.ExecSQL('DELETE FROM service_detail WHERE service_id ='+FormatSQLNumber(AServiceSeq));
    MyConnection.ExecSQL('DELETE FROM services WHERE service_id ='+FormatSQLNumber(AServiceSeq));
   // Result := ExecTransaction4('DELETE FROM items WHERE item_id ='+FormatSQLNumber(AItemID))
    MyConnection.EndSQL;
    Result := True;
  except
    Result := False;
    MyConnection.UndoSQL;
  end;


  {sql:=
    'DELETE FROM Services '+
    'WHERE Service_Id='+FormatSQLNumber(AServiceSeq);
  Result:= ExecTransaction4(sqL);}
end;

function TServices.InsertOnDb: boolean;
var SQL : string;
   i:integer;
begin
  SQL := 'INSERT INTO Services (Service_Code,Service_Type,Service_Name,Price,Notes,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FServiceCode)+','+
      FormatSQLString(FServiceType)+','+
      FormatSQLString(FServiceName)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+')';
  try
    MyConnection.BeginSQL;
    Result := ExecTransaction3(SQL);
    FServiceId := getIntegerFromSQL('SELECT MAX(service_id) FROM services');
    if FServiceType = SERVICE_TYPE_PACKAGE then
      for i:= 0 to FPackage_Arr.Count-1 do begin
        FPackage_Arr[i].ServiceParent := FServiceId;
        TServicePackage(FPackage_Arr[i]).InsertOnDB;
      end;
    MyConnection.EndSQL;
  except
    MyConnection.UndoSQL;
    Result := False;
  end;
end;

class function TServices.isExistCode(ACode: string;aId:integer): boolean;
begin
  Result := getIntegerFromSQL('SELECT COUNT(*) FROM services WHERE UPPER(service_code) ='+
          FormatSQLString(UpperCase(ACode))+
          IfThen(aId>0,' AND service_id <> '+FormatSQLNumber(aId)))>0;
end;

class function TServices.isZeroPrice(AServiceID: integer): boolean;
begin
  Result := getFloatFromSQL('SELECT Price FROM services WHERE service_id ='+FormatSQLNumber(AServiceID)) =0;
end;

function TServices.UpdateOnDB: boolean;
var SQL : string; i:integer;
begin
  SQL := 'UPDATE Services SET'+
          ' Service_Code='+FormatSQLString(FServiceCode)+','+
          ' Service_Type='+FormatSQLString(FServiceType)+','+
          ' Service_Name='+FormatSQLString(FServiceName)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(ServerNow)+
    ' WHERE Service_Id='+FormatSQLNumber(FServiceId);
  try
    MyConnection.BeginSQL;
    Result := ExecTransaction3(SQL);
    if FServiceType = SERVICE_TYPE_PACKAGE then
      for i:= 0 to FPackage_Arr.Count-1 do begin
        FPackage_Arr[i].ServiceParent := FServiceId;
        if FPackage_Arr[i].PkgId > 0 then
          TServicePackage(FPackage_Arr[i]).UpdateOnDB
        else
          TServicePackage(FPackage_Arr[i]).InsertOnDB;
      end;
    Result := True;
    MyConnection.EndSQL;
  except
    Result := False;
    MyConnection.UndoSQL;
  end;
end;

procedure TServices.UpdatePrice;
begin
   ExecTransaction3('UPDATE Services set Price='+FormatSQLNumber(fPrice)+
   ', date_edit = '+FormatSQLDate(ServerNow)+
   ', user_edit = '+FormatSQLString(FUserEdit)+
        ' WHERE service_id='+FormatSQLNumber(FServiceId));
end;

{ TServices_Arr }

function TServices_Arr.countOnDb(AServiceType2: string;
  isAddNew: boolean): integer;
var SQL,vFilter,vFilterInner : string;
    buffer : _Recordset;
    i : integer;
    vOperant : String;
begin
   vFilter := '';
   SQL :=  '   select count(*)  '+
            ' FROM services S ';
   vOperant := IfThen(isAddNew,' OR', ' AND');
   if AServiceType2 <> '' then
     vFilter := vFilter + ' AND s.service_type IN ('+FormatSQLString(FFilter.ServiceType)+','+
              FormatSQLString(AServiceType2)+')'
   else  if FFilter.ServiceType <> '' then
      vFilter := vFilter + ' AND s.service_type = '+FormatSQLString(FFilter.ServiceType);
   if FFilter.ServiceId <> 0 then
     vFilter := vFilter + ' AND s.service_id = '+FormatSQLNumber(FFilter.ServiceId);
   if FFilter.ServiceCode <> '' then
     vFilter := vFilter + vOperant+' UPPER(s.service_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ServiceCode+'%'));
   if FFilter.ServiceName <> '' then
     vFilter := vFilter + vOperant +' UPPER(s.service_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ServiceName+'%'));
   if vFilter <> '' then
     SQL := SQL + 'WHERE '+copy(vFilter,5,length(vFilter));
   Result := getIntegerFromSQL(SQL);

end;

constructor TServices_Arr.Create;
begin
  inherited Create;
  FFilter := TServices.Create;
end;

destructor TServices_Arr.Destroy;
begin
  FFilter.Free;
  inherited;
end;

function TServices_Arr.FindFlat: boolean;
var SQL,vFilter : string;
    buffer : _Recordset;
    i : integer;
begin
   vFilter := '';
   SQL := 'SELECT s.service_id, s.service_code, s.service_type, s.service_name, s.price '+
            ' FROM services S ';
   if vFilter <> '' then
     SQL := SQL + 'WHERE '+copy(vFilter,5,length(vFilter));
   buffer := myConnection.OpenSQL(SQL);
   Self.Clear;
   Result := (buffer.recordcount >0);
   if Result then
     for i:= 0 to buffer.RecordCount-1 do
      With buffer do begin
        Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
        BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
        BufferToFloat(Fields[4].Value),'','','', 0,0);
        MoveNext;
      end;
   buffer.close;

end;

function TServices_Arr.FindOnDb(AServiceType2:string='';isAddNew:boolean=false;limit:integer=25;offset:integer=0): boolean;
var SQL,vFilter,vFilterInner : string;
    buffer : _Recordset;
    i : integer;
    vOperant : String;
begin
   vFilter := '';

   vOperant := IfThen(isAddNew,' OR', ' AND');
   if AServiceType2 <> '' then
     vFilter := vFilter + ' AND s.service_type IN ('+FormatSQLString(FFilter.ServiceType)+','+
              FormatSQLString(AServiceType2)+')'
   else  if FFilter.ServiceType <> '' then
      vFilter := vFilter + ' AND s.service_type = '+FormatSQLString(FFilter.ServiceType);
   if FFilter.ServiceId <> 0 then
     vFilter := vFilter + ' AND s.service_id = '+FormatSQLNumber(FFilter.ServiceId);
   if FFilter.ServiceCode <> '' then
     vFilter := vFilter + vOperant+' UPPER(s.service_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ServiceCode+'%'));
   if FFilter.ServiceName <> '' then
     vFilter := vFilter + vOperant +' UPPER(s.service_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ServiceName+'%'));
   if vFilter <> '' then
     vFilterInner :=  'WHERE '+copy(vFilter,5,length(vFilter));
    SQL :=   'SELECT TOP '+FormatSQLNumber(limit)+
    '   s.service_id, s.service_code, s.service_type, s.service_name, s.price,s.notes, '+
            ' s.user_insert, s.user_edit, s.date_insert, s.date_edit '+
            ' FROM services S '+
         ' where service_id not in (select top '+FormatSQLNumber(offset)+' service_id from services s '+vFilterInner+' order by service_id ) ';  
    SQL := SQL + vFilter;
   buffer := myConnection.OpenSQL(SQL);
   Self.Clear;
   Result := (buffer.recordcount >0);
   if Result then
     for i:= 0 to buffer.RecordCount-1 do
      With buffer do begin
        Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
        BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
        BufferToFloat(Fields[4].Value),BufferToString(Fields[5].Value),
        BufferToString(Fields[6].Value),BufferToString(Fields[7].Value),
        BufferToDateTime(Fields[8].Value),BufferToDateTime(Fields[9].Value));
        MoveNext;
      end;
   buffer.close;
end;

{ TItems_Arr }

procedure TItems_Arr.Clear;
begin
  inherited;
//  SetLength(FStok,0)
end;

function TItems_Arr.countFindFlat(ExistInBalance, ShowZero,
  WithStok: boolean): integer;
var SQL,vFilter : string;
    buffer : _Recordset;
    i : integer;
begin
   vFilter := '';
   SQL := 'SELECT count(*) '+
              ' FROM Items I ';
   SQL := 'SELECT count(*) '+
              ' FROM Items I '+IfThen(ExistInBalance and (not ShowZero), ' INNER JOIN item_Balance b ON b.item_id = i.item_id ');
   if FFilter.ItemId <> 0 then
     vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemId);
   if FFilter.ItemCode <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemCode+'%'));
   if FFilter.ItemName <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemName+'%'));
   if ExistInBalance and (not ShowZero) then
     vFilter := vFilter + ' AND (SELECT SUM(balance) FROM item_balance WHERE item_id = i.item_id) > 0 ';
   if vFilter <> '' then
     SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFilter));
   //buffer := myConnection.OpenSQL(SQL+' Order By  I.item_code');
   //Self.Clear;
   Result := getIntegerFromSQL(SQL);




end;

function TItems_Arr.countOnDb(isAddNew: boolean): integer;
var SQL,vFilter : string;
    buffer : _Recordset;
    i : integer;
    vOperant : string;
    vPrice, vPricePurchase :  Double;
begin
   vFilter := '';

    SQL :=   'select count(*) '+
              ' FROM Items I  left join motor m on i.car_id = m.motor_id ';
   vOperant := IfThen(isAddNew,' OR', ' AND');
   if FFilter.ItemType <> '' then
     vFilter := vFilter + ' AND i.item_type = '+FormatSQLString(FFilter.FItemType);
   if FFilter.ItemId <> 0 then
     vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemId);
   if FFilter.ItemCode <> '' then
     vFilter := vFilter + vOperant+' UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemCode+'%'));
   if FFilter.ItemName <> '' then
     vFilter := vFilter + vOperant+' UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemName+'%'));

   if FFilter.UserInsert <> '' then
     vFilter := vFilter + ' AND UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.UserInsert+'%'));

   if vFilter <> '' then
     SQL := SQL + 'WHERE '+copy(vFilter,5,length(vFilter));
   
   result:= getIntegerFromSQL(sqL);


end;

constructor TItems_Arr.Create;
begin
  inherited Create;
  FFilter := TItems.Create;
end;

destructor TItems_Arr.Destroy;
begin
  FFilter.Free;
  inherited;
end;

function TItems_Arr.FindFlat(ExistInBalance:boolean=False;ShowZero:boolean=True;WithStok:boolean=False;limit:integer=25;offset:integer=0): boolean;
var SQL,vFilter,vFilterInner : string;
    buffer : _Recordset;
    i : integer;
begin
   vFilter := '';
   SQL := 'SELECT I.item_id, I.Item_Code, I.item_type, I.item_name, I.price, I.notes, '+
              ' I.user_insert, I.user_edit, I.date_insert, I.date_edit, I.used_unit '+IfThen(WithStok,',dbo.get_stok_onhand(i.item_id) ')+
              ' FROM Items I ';

   if FFilter.ItemId <> 0 then
     vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemId);
   if FFilter.ItemCode <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemCode+'%'));
   if FFilter.ItemName <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemName+'%'));
   if ExistInBalance and (not ShowZero) then
     vFilter := vFilter + ' AND (SELECT SUM(balance) FROM item_balance WHERE item_id = i.item_id) > 0 ';
   if vFilter <> '' then
     vFilterInner := ' WHERE '+copy(vFilter,5,length(vFilter));

   SQL :=   'SELECT distinct TOP '+FormatSQLNumber(limit)+  
        ' I.item_id, I.Item_Code, I.item_name, I.used_unit, I.Price, I.conversion, I.Purchase_Unit,I.stok_Limit '+
          ' ,I.item_type '+//IfThen(WithStok,',dbo.get_stok_onhand(i.item_id) ')+
          ' ,I.price_purchase '+
              ' FROM Items I '+IfThen(ExistInBalance and (not ShowZero), ' INNER JOIN item_Balance b ON b.item_id = i.item_id ')+
                 ' where i.item_id not in (select top '+FormatSQLNumber(offset)+' item_id from items i '+vFilterInner+' order by item_id ) '+
              vFilter;  
   buffer := myConnection.OpenSQL(SQL);//+' Order By  I.item_code');
   Self.Clear;
   Result := (buffer.recordcount >0);
   if Result then
     for i:= 0 to buffer.RecordCount-1 do
      With buffer do begin
        Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
        BufferToString(Fields[8].Value),BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),BufferToString(Fields[6].Value),
        BufferToFloat(Fields[4].Value),BufferToFloat(Fields[5].Value),'','','',0,0,
        BufferToInteger(Fields[7].Value),0,BufferToInteger(Fields[9].Value));
      //  if WithStok then
      //    TItems(Self[idx]).FStok := BufferToFloat(Fields[9].Value);
  //      if WithStok then
//          FStok[idx]:= BufferToFloat(Fields[9].Value);
        MoveNext;
      end;
   buffer.close;

end;

function TItems_Arr.FindFlatWithService: boolean;
var SQL,vFilter : string;
    buffer : _Recordset;
    i : integer;
begin
   vFilter := '';
   SQL := 'SELECT I.item_id, I.Item_Code,I.item_type as Tipe, I.item_name as Nama, I.used_unit, dbo.get_max_price(i.item_id) as Price '+
              ' FROM Items I '+
      ' UNION ALL '+
      ' SELECT s.service_id, s.service_code, S.service_type as Tipe, s.service_name as Nama, null, s.price '+
          ' FROM services s '+
      ' ORDER by Tipe,Nama';

   if FFilter.ItemId <> 0 then
     vFilter := vFilter + ' AND item_id ='+FormatSQLNumber(FFilter.ItemId);
   if vFilter <> '' then
     SQL := SQL + 'WHERE '+copy(vFilter,5,length(vFilter));
   buffer := myConnection.OpenSQL(SQL);
   Self.Clear;
   Result := (buffer.recordcount >0);
   if Result then
     for i:= 0 to buffer.RecordCount-1 do
      With buffer do begin
        Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
        BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),BufferToString(Fields[4].Value),BufferToString(Fields[5].Value),
        BufferToFloat(Fields[5].Value),0,'','','',0,0,0,0,0);
        MoveNext;
      end;
   buffer.close;
end;

function TItems_Arr.FindOnDb(isAddNew:boolean=False;limit:integer=25;offset:integer=0): boolean;
var SQL,vFilter : string;
    buffer : _Recordset;
    i,idx : integer;
    vOperant,vFilterInner : string;
    vPrice, vPricePurchase :  Double;
begin
   vFilter := '';
   vFilterInner := '';

//              '(row <='+FormatSQLNumber(limit + offset)+ ')) ';
   vOperant := IfThen(isAddNew,' OR', ' AND');
   if FFilter.ItemType <> '' then
     vFilter := vFilter + ' AND i.item_type = '+FormatSQLString(FFilter.FItemType);
   if FFilter.ItemId <> 0 then
     vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemId);
   if FFilter.ItemCode <> '' then
     vFilter := vFilter + vOperant+' UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemCode+'%'));
   if FFilter.ItemName <> '' then
     vFilter := vFilter + vOperant+' UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemName+'%'));
   if FFilter.UserInsert <> '' then
     vFilter := vFilter + ' AND UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.UserInsert+'%'));

   if vFilter <> '' then
      vFilterInner := 'WHERE '+copy(vFilter,5,length(vFilter));

   SQL :=   'SELECT TOP '+FormatSQLNumber(limit)+
       '  I.item_id, I.Item_Code, I.item_type, I.item_name,I.used_unit, I.purchase_unit, I.price, I.conversion, I.notes, '+
              ' I.user_insert, I.user_edit,I.stok_Limit, i.price_purchase,i.car_id '+
              ' FROM Items I  left join motor m on i.car_id = m.motor_id '+
             ' where item_id not in (select top '+FormatSQLNumber(offset)+' item_id from items i left join motor m on i.car_id = m.motor_id '+vFilterInner+' order by item_id ) ';
    SQL := SQL + vFilter;
   buffer := myConnection.OpenSQL(SQL);//+' Order By  I.item_name');
   Self.Clear;
   Result := (buffer.recordcount >0);
   if Result then
     for i:= 0 to buffer.RecordCount-1 do
      With buffer do begin
        vPrice := TItemPrice.getPriceActive(BufferToInteger(Fields[0].Value),0);
        vPricePurchase := TItemPricePurchase.getPriceActive(BufferToInteger(Fields[0].Value));
        idx:=Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
            BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
            BufferToString(Fields[4].Value),BufferToString(Fields[5].Value),
            IfThen(vPrice>0,vPrice, BufferToFloat(Fields[6].Value)),BufferToFloat(Fields[7].Value),
            BufferToString(Fields[8].Value),BufferToString(Fields[9].Value),
            BufferToString(Fields[10].Value),0,0,BufferToInteger(Fields[11].Value),0,
            IfThen(vPricePurchase>0,vPricePurchase,BufferToFloat(Fields[12].Value)));
        FItems_Arr[idx].CarId := BufferToInteger(Fields[13].Value);    
        MoveNext;
      end;
   buffer.close;
end;

{ TRestoTable_Arr }



{ TCompanyProfile }

class function TCompanyProfile.getProfile: string;
var vComp : TCompanyProfile;
begin
  vComp := TCompanyProfile.Create;
  vComp.SelectInDB;
  Result := vComp.FCompanyName+#13+vComp.FBranch+#13+vComp.FAddress+' '+
            vComp.City+' Telp.'+vComp.FTelp1;
  vComp.Free;
end;

function TCompanyProfile.isExist: boolean;
var sql:string;
begin
  sql := 'SELECT COUNT(*) FROM company_profile';
  Result := getIntegerFromSQL(sql)>0;

end;

function TCompanyProfile.SelectInDB: boolean;
var SQL : string;
    buffer : _Recordset;
begin
   SQL := 'SELECT company_name, address, telp1, telp2, city, fax, branch,info FROM company_profile ';
   buffer := myConnection.OpenSQL(SQL);
   Result := (buffer.recordcount >0);
   Self.Reset;
   if Result then
     With buffer do begin
       FCompanyName := BufferToString(Fields[0].Value);
       FAddress     := BufferToString(Fields[1].Value);
       FTelp1       := BufferToString(Fields[2].Value);
       FTelp2       := BufferToString(Fields[3].Value);
       FCity        := BufferToString(Fields[4].Value);
       FFax         := BufferToString(Fields[5].Value);
       FBranch      := BufferToString(Fields[6].Value);
       FInfo        := BufferToString(Fields[7].Value);
     end;
   buffer.close;

end;



{ TMotor_Arr }

constructor TMotor_Arr.Create;
begin

end;

destructor TMotor_Arr.Destroy;
begin

  inherited;
end;

function TMotor_Arr.FindOnDb(CheckWithService:Boolean;aShipServType:string): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  if CheckWithService then begin
    SQL := 'SELECT distincT m.motor_id, m.motor_type,m.motor_code, m.motor_name,motor_year,m.user_insert,m.user_edit '+
          ' FROM motor m, persons p, shipment s '+
          ' WHERE s.person_id = p.person_id AND '+
              ' p.motor_id = m.motor_id '+
              ' AND s.ship_type = '+FormatSQLString(SHIP_TYPE_SERVICE)+
              IfThen(aShipServType<> '',' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
          IfThen(GlobalPeriode.PeriodeAwal1>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
          IfThen(GlobalPeriode.PeriodeAkhir1>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1)) +
          IfThen(GlobalPeriode.PeriodeAwal2>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2))+
          IfThen(GlobalPeriode.PeriodeAkhir2>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2))    ;
    vFilter := '';
  end
  else
    SQL := 'SELECT motor_id, motor_type,motor_code, motor_name,motor_year, user_insert,user_edit '+
          ' FROM motor ';
  if vFilter <> '' then
    SQL := SQL +' WHERE '+copy(vFilter,5,length(vFilter));
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToString(Fields[2].Value),BufferToString(Fields[3].Value),
          BufferToInteger(Fields[4].Value),BufferToString(Fields[5].Value),
          BufferToString(Fields[6].Value),0,0);
      moveNext;
    end;
  buffer.close;

end;

{ TMotor }

class procedure TMotor.getListType(AList: TStringList; ATarget: TStrings;AWithAll:boolean);
var sql:string;
begin
  sql := 'SELECT motor_id, motor_name FROM motor '+
        ' ORDER BY motor_name ';
  if AWithAll then
    SQLToNameValueList2(AList,sql)
  else
    SQLToNameValueList(AList,sql);
  NameValueListToValueList(AList,ATarget);
end;

class function TMotor.getName(AMotorId: integer): string;
begin
  Result := getStringFromSQL('SELECT motor_name FROM motor WHERE motor_id='+FormatSQLNumber(AMotorId));
end;

class function TMotor.getNewNumber(AMotorType: string): string;
begin
   Result := getNextIDNum('motor_code','motor',' AND motor_type ='+FormatSQLString(AMotorType),AMotorType);
end;

class function TMotor.Hapus(AMotorId: integer): boolean;
begin
  Result := False;
end;

function TMotor.InsertOnDb: boolean;
var SQL:string;
begin
  SQL := 'INSERT INTO Motor (Motor_Type,Motor_Code,Motor_Name,Motor_Year,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FMotorType)+','+
      FormatSQLString(FMotorCode)+','+
      FormatSQLString(FMotorName)+','+
      FormatSQLNumber(FMotorYear)+','+
      FormatSQLString(FUserInsert)+')';
  Result := ExecTransaction(SQL);
end;

function TMotor.UpdateOnDB: boolean;
var SQL:string;
begin
  SQL := 'UPDATE Motor SET'+
          ' Motor_Type='+FormatSQLString(FMotorType)+','+
          ' Motor_Code='+FormatSQLString(FMotorCode)+','+
          ' Motor_Name='+FormatSQLString(FMotorName)+','+
          ' Motor_Year='+FormatSQLNumber(FMotorYear)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Motor_Id='+FormatSQLNumber(FMotorId);
  Result := ExecTransaction(SQL,False);
end;

{ TWarehouse }

class function TWarehouse.adaYgAktif: boolean;
var tmp : integer;
begin
  tmp := getIntegerFromSQL('SELECT COUNT(*) FROM warehouse WHERE is_active=-1');
  Result := tmp>0;
end;

class function TWarehouse.getGudangAktif: integer;
begin
  Result := getIntegerFromSQL('SELECT wh_id FROM warehouse WHERE is_active=-1');
end;

class function TWarehouse.getName(AID: integer): string;
begin
  Result := getStringFromSQL('SELECT wh_name FROM warehouse WHERE wh_id='+FormatSQLNumber(AID))
end;

function TWarehouse.InsertOnDb: boolean;
var SQL:string;
begin
  SQL :=  'INSERT INTO Warehouse (Wh_Code,Wh_Name,Is_Active,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FWhCode)+','+
      FormatSQLString(FWhName)+','+
      FormatSQLBoolean(FIsActive)+','+
      FormatSQLString(FUserInsert)+')';
  Result := ExecTransaction(SQL);
end;

class function TWarehouse.isExistCode(ACode: string): boolean;
var tmp:integer;
begin
  tmp := getIntegerFromSQL('SELECT COUNT(*) FROM warehouse WHERE wh_code='+FormatSQLString(ACode));
  Result := tmp>0;
end;

function TWarehouse.UpdateOnDb: boolean;
var SQL:string;
begin
  SQL := 'UPDATE Warehouse SET'+
          ' Wh_Code='+FormatSQLString(FWhCode)+','+
          ' Wh_Name='+FormatSQLString(FWhName)+','+
          ' Is_Active='+FormatSQLBoolean(FIsActive)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Wh_Id='+FormatSQLNumber(FWhId);
  Result := ExecTransaction(SQL,False);
end;

{ TWarehouse_Arr }

function TWarehouse_Arr.FindOnDb: boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  SQL :=  'SELECT W.Wh_Id, W.Wh_Code, W.Wh_Name, W.Is_Active, W.User_Insert, W.User_Edit, W.Date_Insert, W.Date_Edit'+
     ' FROM Warehouse W';
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToString(Fields[2].Value),BufferToBoolean(Fields[3].Value),
          BufferToString(Fields[4].Value),BufferToString(Fields[5].Value),
          BufferToDateTime(Fields[6].Value),BufferToDateTime(Fields[7].Value));
      moveNext;
    end;
  buffer.close;

end;

class procedure TWarehouse_Arr.getListGudang(AList: TStringList;
  AItems: TStrings;AWithAcive:boolean;AWithAll:boolean);
var sql:string;
begin
  sql := 'SELECT wh_id, wh_name FROM warehouse '+
         IfThen(not AWithAcive,' WHERE is_active <> -1') ;
  if not AWithAll then
    SQLToNameValueList(AList,sql)
  else
    SQLToNameValueList2(AList,sql);
  NameValueListToValueList(AList,AItems);  
end;

{ TItemPrice_Arr }

function TItemPrice_Arr.FindOnDb(AItemId: integer;AServiceId:integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  SQL := 'Select price_id, item_id, price, disable_date, user_insert, user_edit, date_insert, date_edit, service_id '+
        ' FROM item_Price ';
  if AItemId <> 0 then
    vFilter := vFilter + ' AND item_id = '+FormatSQLNumber(AItemId);
  if AServiceId <> 0 then
    vFilter := vFilter + ' AND service_id = '+FormatSQLNumber(AServiceId);

  if vFilter <> '' then
    SQL := SQL +' WHERE '+copy(vFilter,5,length(vFilter));
  buffer := MyConnection.OpenSQL(SQL+ ' ORDER by item_id,price_id DESC,disable_date DESC ');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
      BufferToInteger(Fields[8].Value),
      BufferToFloat(Fields[2].Value),BufferToDateTime(Fields[3].Value),
      BufferToDateTime(Fields[6].Value),BufferToString(Fields[4].Value),
      BufferToString(Fields[5].Value),BufferToDateTime(Fields[7].Value));
      moveNext;
    end;
  buffer.close;
end;

{ TItemPrice }

class function TItemPrice.getPriceActive(AItemId,
  AServiceID: integer): Double;
begin
  Result := getFloatFromSQL('SELECT Price FROM item_price WHERE '+
        IfThen(AItemId>0,'item_id='+FormatSQLNumber(AItemId),
        'service_id='+FormatSQLNumber(AServiceID))+
        ' AND disable_date IS NULL '+
        'ORDER BY price_id DESC ');
end;

{ TAccount_Arr }

function TAccount_Arr.FindOnDb: boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  SQL := 'SELECT acc_id, acc_type, acc_code, acc_name, db_cr_type '+
        ' FROM account ';
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
          BufferToString(Fields[2].Value), BufferToString(Fields[3].Value),
          BufferToString(Fields[4].Value),'','',0,0);
      moveNext;
    end;
  buffer.close;

end;

{ TAccount }

class function TAccount.getAmountBiaya(AccId: integer;
  Periode: TPeriode): Double;
var sql:string;
begin
   sql := 'SELECT SUM(d.amount) '+
        ' FROM money_transaction d, payment p '+
        ' WHERE d.payment_id = p.payment_id '+
        ' AND p.payment_type = '+FormatSQLString(PAYMENT_TYPE_BIAYA)+
        ' AND d.acc_id = '+FormatSQLNumber(AccId)+
        IfThen(Periode.PeriodeAwal1<>0,' AND p.payment_date '+FormatSQLOperator(Periode.OpPeriodeAwal1)+FormatSQLDate(Periode.PeriodeAwal1))+
        IfThen(Periode.PeriodeAkhir1<>0,' AND p.payment_date '+FormatSQLOperator(Periode.OpPeriodeAkhir1)+FormatSQLDate(Periode.PeriodeAkhir1));
  Result := getFloatFromSQL(sql);
end;

class function TAccount.getNewCode(AccType:string): string;
begin
  Result := getNextIDNum('acc_code','account',' AND acc_type='+FormatSQLString(AccType),AccType);
end;

function TAccount.InsertOnDB: boolean;
var SQL:string;
begin
  SQL :=  'INSERT INTO Account (Acc_Type,Acc_Code,Acc_Name,Db_Cr_Type,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FAccType)+','+
      FormatSQLString(FAccCode)+','+
      FormatSQLString(FAccName)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLString(FUserInsert)+')';
  Result := ExecTransaction(SQL);
end;

class function TAccount.isExistCode(AAccCode: string): boolean;
begin
  Result := getIntegerFromSQL('SELECT COUNT(*) FROM account WHERE acc_code ='+FormatSQLString(AAccCode))>0;
end;

function TAccount.SelectOnDB(AAccId: integer): boolean;
var SQL : string;
    buffer : _recordset;
begin
   SQL := 'SELECT acc_id, acc_type, acc_code, acc_name, db_cr_type '+
        ' FROM account '+
        ' WHERE acc_id ='+FormatSQLNumber(AAccId);
   buffer := myConnection.OpenSQL(SQL);
   Result := (buffer.recordcount<>0);
   self.Reset;
   if Result then
     with buffer do begin
        FAccId    := BufferToInteger(Fields[0].Value);
        FAccType  := BufferToString(Fields[1].Value);
        FAccCode  := BufferToString(Fields[2].Value);
        FAccName  := BufferToString(Fields[3].Value);
        FDbCrType := BufferToString(Fields[4].Value);
     end;
   buffer.close;

end;

function TAccount.UpdateOnDb: boolean;
var SQL:string;
begin
  SQL := 'UPDATE Account SET'+
          ' Acc_Type='+FormatSQLString(FAccType)+','+
          ' Acc_Code='+FormatSQLString(FAccCode)+','+
          ' Acc_Name='+FormatSQLString(FAccName)+','+
          ' Db_Cr_Type='+FormatSQLString(FDbCrType)+','+
//          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
 //         ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edt='+FormatSQLDateTime(ServerNow)+
    ' WHERE Acc_Id='+FormatSQLNumber(FAccId);
  Result := ExecTransaction(SQL,False);

end;

{ TServicePackage_Arr }

function TServicePackage_Arr.FindOnDb(AServiceId: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL :=  ' SELECT     p.pkg_id, p.service_id, p.item_id, p.price, p.quantity, i.item_code, i.item_name, p.service_parent, '+
          ' s.service_code, i.item_type, s.service_type, s.service_name, p.notes '+
          ' FROM  dbo.Service_Package p LEFT OUTER JOIN '+
          ' dbo.Services s ON p.service_id = s.service_id LEFT OUTER JOIN '+
          ' dbo.Items i ON p.item_id = i.item_id '+
          ' WHERE     p.service_parent = '+FormatSQLNumber(AServiceId);
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
          BufferToInteger(Fields[2].Value),BufferToFloat(Fields[3].Value),
          BufferToFloat(Fields[4].Value),BufferToInteger(Fields[7].Value),
          BufferToString(Fields[12].Value));
     // TItems(FServicePackage_Arr[idx].Items).SelectInDB()
      FServicePackage_Arr[idx].Items.ItemCode := BufferToString(Fields[5].Value);
      FServicePackage_Arr[idx].Items.ItemName := BufferToString(Fields[6].Value);
      FServicePackage_Arr[idx].Services.ServiceCode := BufferToString(Fields[8].Value);
      FServicePackage_Arr[idx].Items.ItemType := BufferToString(Fields[9].Value);
      FServicePackage_Arr[idx].Services.ServiceType := BufferToString(Fields[10].Value);
      FServicePackage_Arr[idx].Services.ServiceName := BufferToString(Fields[11].Value);
      moveNext;
    end;
  buffer.close;
end;

function TServicePackage_Arr.get(index: integer): TServicePackage;
begin
  Result := TServicePackage(inherited get(index));
end;

function TServicePackage_Arr.New: TServicePackage;
begin
  Result := TServicePackage.Create;
end;

{ TServicePackage }

class function TServicePackage.getNotes(aId,aParentId: integer;isService:boolean): string;
begin
  if isService then
    Result := getStringFromSQL('SELECT notes FROM service_package '+
        ' WHERE service_id ='+FormatSQLNumber(aId)+
        ' AND service_parent = '+FormatSQLNumber(aParentId))
  else
    Result := getStringFromSQL('SELECT notes FROM service_package WHERE item_id ='+FormatSQLNumber(aId)+
        ' AND service_parent = '+FormatSQLNumber(aParentId));
end;

function TServicePackage.InsertOnDb: boolean;
var SQL : string;
begin
  SQL := 'INSERT INTO Service_Package (Service_Id,Item_Id,Price,Quantity,Service_Parent,Notes)'+
    ' VALUES ('+
      IfThen(FServices.ServiceId>0,FormatSQLNumber(FServices.ServiceId),FormatSQLNULL)+','+
      IfThen(FItems.ItemId>0, FormatSQLNumber(FItems.ItemId),FormatSQLNULL)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FQuantity)+','+
      FormatSQLNumber(FServiceParent)+','+
      FormatSQLString(FNotes)+')';
  Result := ExecTransaction3(SQL);

end;

function TServicePackage.UpdateOnDb: boolean;
var SQL : string;
begin
  SQL:=  'UPDATE Service_Package SET'+
          IfThen(FServices.ServiceId>0,' Service_Id='+FormatSQLNumber(FServices.ServiceId)+',')+
          IfThen(FItems.ItemId>0, ' Item_Id='+FormatSQLNumber(FItems.ItemId)+',')+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Quantity='+FormatSQLNumber(FQuantity)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' Service_Parent='+FormatSQLNumber(FServiceParent)+

    ' WHERE Pkg_Id='+FormatSQLNumber(FPkgId);
  Result := ExecTransaction3(SQL);
end;

{ TItemPricePurchase }

class function TItemPricePurchase.getPriceActive(AItemId: integer): Double;
begin
  Result := getFloatFromSQL('SELECT Price FROM item_price_purchase WHERE '+
        'item_id='+FormatSQLNumber(AItemId)+
        ' AND disable_date IS NULL'+
        ' ORDER BY price_purchase_id DESC');
end;

{ TItemPricePurchase_Arr }

function TItemPricePurchase_Arr.FindOnDb(AItemId: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  SQL := 'Select price_purchase_id, item_id, price, disable_date, user_insert, user_edit, date_insert, date_edit'+
        ' FROM item_Price_Purchase ';
  if AItemId <> 0 then
    vFilter := vFilter + ' AND item_id = '+FormatSQLNumber(AItemId);

  if vFilter <> '' then
    SQL := SQL +' WHERE '+copy(vFilter,5,length(vFilter));
  buffer := MyConnection.OpenSQL(SQL+ ' ORDER by item_id,price_purchase_id DESC,disable_date DESC ');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
      BufferToFloat(Fields[2].Value),BufferToDateTime(Fields[3].Value),
      BufferToDateTime(Fields[6].Value),BufferToString(Fields[4].Value),
      BufferToString(Fields[5].Value),BufferToDateTime(Fields[7].Value));
      moveNext;
    end;
  buffer.close;

end;

end.
