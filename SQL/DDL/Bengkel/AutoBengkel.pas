unit AutoBengkel;

interface

uses
  Classes, Controls, SysUtils, ADODB, AccessConnection, Subroutines;

type

{ cut from here ---------------------------------------------- 
  TItems_Arr = class(_Items_Arr) end;
  TItems = class(_Items) end;
  TItemPrice_Arr = class(_ItemPrice_Arr) end;
  TItemPrice = class(_ItemPrice) end;
  TItemPricePurchase_Arr = class(_ItemPricePurchase_Arr) end;
  TItemPricePurchase = class(_ItemPricePurchase) end;
  TWarehouse_Arr = class(_Warehouse_Arr) end;
  TWarehouse = class(_Warehouse) end;
  TServices_Arr = class(_Services_Arr) end;
  TServices = class(_Services) end;
  TServicePackage_Arr = class(_ServicePackage_Arr) end;
  TServicePackage = class(_ServicePackage) end;
  TCompanyProfile_Arr = class(_CompanyProfile_Arr) end;
  TCompanyProfile = class(_CompanyProfile) end;
  TMotor_Arr = class(_Motor_Arr) end;
  TMotor = class(_Motor) end;
  TPersons_Arr = class(_Persons_Arr) end;
  TPersons = class(_Persons) end;
  TAccount_Arr = class(_Account_Arr) end;
  TAccount = class(_Account) end;
  TShipment_Arr = class(_Shipment_Arr) end;
  TShipment = class(_Shipment) end;
  TServiceDetail_Arr = class(_ServiceDetail_Arr) end;
  TServiceDetail = class(_ServiceDetail) end;
  TItemBalance_Arr = class(_ItemBalance_Arr) end;
  TItemBalance = class(_ItemBalance) end;
  TItemDetail_Arr = class(_ItemDetail_Arr) end;
  TItemDetail = class(_ItemDetail) end;
  TDummyItemDetail_Arr = class(_DummyItemDetail_Arr) end;
  TDummyItemDetail = class(_DummyItemDetail) end;
  TPayment_Arr = class(_Payment_Arr) end;
  TPayment = class(_Payment) end;
  TMoneyAccount_Arr = class(_MoneyAccount_Arr) end;
  TMoneyAccount = class(_MoneyAccount) end;
  TMoneyBalance_Arr = class(_MoneyBalance_Arr) end;
  TMoneyBalance = class(_MoneyBalance) end;
  TMoneyTransaction_Arr = class(_MoneyTransaction_Arr) end;
  TMoneyTransaction = class(_MoneyTransaction) end;
  cut until here ------------------------------------------- }

  _Items_Arr = class;
  _Items = class;
  //Table Name: Items
  //Fields:
  //  0. Item_Id* (integer<sequence)
  //  1. Item_Code (string[20])
  //  2. Item_Type (string[1])
  //  3. Item_Name (string[150])
  //  4. Used_Unit (string[50])
  //  5. Purchase_Unit (string[50])
  //  6. Price (currency)
  //  7. Conversion (real)
  //  8. Notes (string[200])
  //  9. User_Insert (string[20])
  //  10. User_Edit (string[20])
  //  11. Date_Insert (TDateTime)
  //  12. Date_Edit (TDateTime)
  //  13. Stok_Limit (integer)
  //  14. Rank (integer)
  //  15. Price_Purchase (currency)
  //Properties:
  //  0. ItemId* (integer)
  //  1. ItemCode (string)
  //  2. ItemType (string)
  //  3. ItemName (string)
  //  4. UsedUnit (string)
  //  5. PurchaseUnit (string)
  //  6. Price (currency)
  //  7. Conversion (real)
  //  8. Notes (string)
  //  9. UserInsert (string)
  //  10. UserEdit (string)
  //  11. DateInsert (TDateTime)
  //  12. DateEdit (TDateTime)
  //  13. StokLimit (integer)
  //  14. Rank (integer)
  //  15. PricePurchase (currency)

  _ItemPrice_Arr = class;
  _ItemPrice = class;
  //Table Name: Item_Price
  //Fields:
  //  0. Price_Id* (integer<sequence)
  //  1. Item_Id (integer) Reference to: Items\Item_Id
  //  2. Service_Id (integer)
  //  3. Price (currency)
  //  4. Disable_Date (TDateTime)
  //  5. Date_Insert (TDateTime)
  //  6. User_Insert (string[30])
  //  7. User_Edit (string[30])
  //  8. Date_Edit (TDateTime)
  //Properties:
  //  0. PriceId* (integer)
  //  1. Items (_Items)
  //  2. ServiceId (integer)
  //  3. Price (currency)
  //  4. DisableDate (TDateTime)
  //  5. DateInsert (TDateTime)
  //  6. UserInsert (string)
  //  7. UserEdit (string)
  //  8. DateEdit (TDateTime)

  _ItemPricePurchase_Arr = class;
  _ItemPricePurchase = class;
  //Table Name: Item_Price_Purchase
  //Fields:
  //  0. Price_Purchase_Id (integer<sequence)
  //  1. Item_Id (integer) Reference to: Items\Item_Id
  //  2. Price (currency)
  //  3. Disable_Date (TDateTime)
  //  4. Date_Insert (TDateTime)
  //  5. User_Insert (string[30])
  //  6. User_Edit (string[30])
  //  7. Date_Edit (TDateTime)
  //Properties:
  //  0. PricePurchaseId (integer)
  //  1. Items (_Items)
  //  2. Price (currency)
  //  3. DisableDate (TDateTime)
  //  4. DateInsert (TDateTime)
  //  5. UserInsert (string)
  //  6. UserEdit (string)
  //  7. DateEdit (TDateTime)

  _Warehouse_Arr = class;
  _Warehouse = class;
  //Table Name: Warehouse
  //Fields:
  //  0. Wh_Id* (integer<sequence)
  //  1. Wh_Code (string[10])
  //  2. Wh_Name (string[150])
  //  3. Is_Active (boolean)
  //  4. User_Insert (string[30])
  //  5. User_Edit (string[30])
  //  6. Date_Insert (TDateTime)
  //  7. Date_Edit (TDateTime)
  //Properties:
  //  0. WhId* (integer)
  //  1. WhCode (string)
  //  2. WhName (string)
  //  3. IsActive (boolean)
  //  4. UserInsert (string)
  //  5. UserEdit (string)
  //  6. DateInsert (TDateTime)
  //  7. DateEdit (TDateTime)

  _Services_Arr = class;
  _Services = class;
  //Table Name: Services
  //Fields:
  //  0. Service_Id* (integer<sequence)
  //  1. Service_Code (string[50])
  //  2. Service_Type (string[1])
  //  3. Service_Name (string[100])
  //  4. Price (real)
  //  5. Notes (string[200])
  //  6. User_Insert (string[20])
  //  7. User_Edit (string[20])
  //  8. Date_Insert (TDateTime)
  //  9. Date_Edit (TDateTime)
  //Properties:
  //  0. ServiceId* (integer)
  //  1. ServiceCode (string)
  //  2. ServiceType (string)
  //  3. ServiceName (string)
  //  4. Price (real)
  //  5. Notes (string)
  //  6. UserInsert (string)
  //  7. UserEdit (string)
  //  8. DateInsert (TDateTime)
  //  9. DateEdit (TDateTime)

  _ServicePackage_Arr = class;
  _ServicePackage = class;
  //Table Name: Service_Package
  //Fields:
  //  0. Pkg_Id* (integer<sequence)
  //  1. Service_Id (integer) Reference to: Services\Service_Id
  //  2. Item_Id (integer) Reference to: Items\Item_Id
  //  3. Price (currency)
  //  4. Quantity (real)
  //  5. Service_Parent (integer)
  //  6. Notes (string[100])
  //Properties:
  //  0. PkgId* (integer)
  //  1. Services (_Services)
  //  2. Items (_Items)
  //  3. Price (currency)
  //  4. Quantity (real)
  //  5. ServiceParent (integer)
  //  6. Notes (string)

  _CompanyProfile_Arr = class;
  _CompanyProfile = class;
  //Table Name: Company_Profile
  //Fields:
  //  0. Company_Name (string[50])
  //  1. Address (string[50])
  //  2. Telp1 (string[50])
  //  3. Telp2 (string[50])
  //  4. Fax (string[50])
  //  5. City (string[50])
  //  6. Branch (string[50])
  //  7. Info (string[500])
  //Properties:
  //  0. CompanyName (string)
  //  1. Address (string)
  //  2. Telp1 (string)
  //  3. Telp2 (string)
  //  4. Fax (string)
  //  5. City (string)
  //  6. Branch (string)
  //  7. Info (string)

  _Motor_Arr = class;
  _Motor = class;
  //Table Name: Motor
  //Fields:
  //  0. Motor_Id* (integer<sequence)
  //  1. Motor_Type (string[1])
  //  2. Motor_Code (string[10])
  //  3. Motor_Name (string[50])
  //  4. Motor_Year (integer)
  //  5. User_Insert (string[30])
  //  6. User_Edit (string[30])
  //  7. Date_Insert (TDateTime)
  //  8. Date_Edit (TDateTime)
  //Properties:
  //  0. MotorId* (integer)
  //  1. MotorType (string)
  //  2. MotorCode (string)
  //  3. MotorName (string)
  //  4. MotorYear (integer)
  //  5. UserInsert (string)
  //  6. UserEdit (string)
  //  7. DateInsert (TDateTime)
  //  8. DateEdit (TDateTime)

  _Persons_Arr = class;
  _Persons = class;
  //Table Name: Persons
  //Fields:
  //  0. Person_Id* (integer<sequence)
  //  1. Person_Code (string[20])
  //  2. Person_Type (string[1])
  //  3. Person_Name (string[50])
  //  4. Motor_Id (integer) Reference to: Motor\Motor_Id
  //  5. Address (string[200])
  //  6. City (string[50])
  //  7. Postal_Code (string[10])
  //  8. Birth_Date (TDateTime)
  //  9. Id_Num (string[50])
  //  10. Phone1 (string[20])
  //  11. Phone2 (string[20])
  //  12. Phone3 (string[20])
  //  13. Notes (string[200])
  //  14. User_Insert (string[30])
  //  15. User_Edit (string[20])
  //  16. Date_Insert (TDateTime)
  //  17. Date_Edit (TDateTime)
  //  18. Mtr_Year (integer)
  //  19. Mtr_Rangka (string[50])
  //  20. Mtr_Mesin (string[50])
  //Properties:
  //  0. PersonId* (integer)
  //  1. PersonCode (string)
  //  2. PersonType (string)
  //  3. PersonName (string)
  //  4. Motor (_Motor)
  //  5. Address (string)
  //  6. City (string)
  //  7. PostalCode (string)
  //  8. BirthDate (TDateTime)
  //  9. IdNum (string)
  //  10. Phone1 (string)
  //  11. Phone2 (string)
  //  12. Phone3 (string)
  //  13. Notes (string)
  //  14. UserInsert (string)
  //  15. UserEdit (string)
  //  16. DateInsert (TDateTime)
  //  17. DateEdit (TDateTime)
  //  18. MtrYear (integer)
  //  19. MtrRangka (string)
  //  20. MtrMesin (string)

  _Account_Arr = class;
  _Account = class;
  //Table Name: Account
  //Fields:
  //  0. Acc_Id* (integer<sequence)
  //  1. Acc_Type (string[1])
  //  2. Acc_Code (string[20])
  //  3. Acc_Name (string[150])
  //  4. Db_Cr_Type (string[1])
  //  5. User_Insert (string[30])
  //  6. User_Edit (string[30])
  //  7. Date_Insert (TDateTime)
  //  8. Date_Edt (TDateTime)
  //Properties:
  //  0. AccId* (integer)
  //  1. AccType (string)
  //  2. AccCode (string)
  //  3. AccName (string)
  //  4. DbCrType (string)
  //  5. UserInsert (string)
  //  6. UserEdit (string)
  //  7. DateInsert (TDateTime)
  //  8. DateEdt (TDateTime)

  _Shipment_Arr = class;
  _Shipment = class;
  //Table Name: Shipment
  //Fields:
  //  0. Ship_Id* (integer<sequence)
  //  1. Ship_Num (string[30])
  //  2. Ship_Type (string[1])
  //  3. Ship_Date (TDateTime)
  //  4. Person_Id (integer) Reference to: Persons\Person_Id
  //  5. Mekanik_Id (integer) Reference to: Persons\Person_Id
  //  6. Notes (string[50])
  //  7. Subtotal (currency)
  //  8. Discount (currency)
  //  9. Ppn (currency)
  //  10. Total (currency)
  //  11. User_Insert (string[30])
  //  12. User_Edit (string[30])
  //  13. Date_Insert (TDateTime)
  //  14. Date_Edit (TDateTime)
  //  15. Ship_Id_Used (integer)
  //  16. Wh_Id (integer) Reference to: Warehouse\Wh_Id
  //  17. Wh_Id_Out (integer)
  //  18. Expr_Date (TDateTime)
  //  19. Is_Post (boolean)
  //  20. Ship_Service_Type (string[1])
  //  21. Down_Payment (currency)
  //  22. Tgl_Kirim (TDate)
  //  23. Tgl_Sampai (TDate)
  //  24. Delivery_Num (string[100])
  //Properties:
  //  0. ShipId* (integer)
  //  1. ShipNum (string)
  //  2. ShipType (string)
  //  3. ShipDate (TDateTime)
  //  4. Persons (_Persons)
  //  5. PersonsMekanik_Id (_Persons)
  //  6. Notes (string)
  //  7. Subtotal (currency)
  //  8. Discount (currency)
  //  9. Ppn (currency)
  //  10. Total (currency)
  //  11. UserInsert (string)
  //  12. UserEdit (string)
  //  13. DateInsert (TDateTime)
  //  14. DateEdit (TDateTime)
  //  15. ShipIdUsed (integer)
  //  16. Warehouse (_Warehouse)
  //  17. WhIdOut (integer)
  //  18. ExprDate (TDateTime)
  //  19. IsPost (boolean)
  //  20. ShipServiceType (string)
  //  21. DownPayment (currency)
  //  22. TglKirim (TDate)
  //  23. TglSampai (TDate)
  //  24. DeliveryNum (string)

  _ServiceDetail_Arr = class;
  _ServiceDetail = class;
  //Table Name: Service_Detail
  //Fields:
  //  0. Service_Detail_Id* (integer<sequence)
  //  1. Ship_Id (integer) Reference to: Shipment\Ship_Id
  //  2. Service_Id (integer) Reference to: Services\Service_Id
  //  3. Quantity (real)
  //  4. Price (currency)
  //  5. Amount (currency)
  //  6. Notes (string[200])
  //  7. Charges (currency)
  //  8. Discount (real)
  //  9. Service_Parent (integer)
  //  10. Is_Ksg (boolean)
  //Properties:
  //  0. ServiceDetailId* (integer)
  //  1. Shipment (_Shipment)
  //  2. Services (_Services)
  //  3. Quantity (real)
  //  4. Price (currency)
  //  5. Amount (currency)
  //  6. Notes (string)
  //  7. Charges (currency)
  //  8. Discount (real)
  //  9. ServiceParent (integer)
  //  10. IsKsg (boolean)

  _ItemBalance_Arr = class;
  _ItemBalance = class;
  //Table Name: Item_Balance
  //Fields:
  //  0. Item_Balance_Id* (integer<sequence)
  //  1. Item_Id (integer) Reference to: Items\Item_Id
  //  2. Balance_Date (TDateTime)
  //  3. Balance (real)
  //  4. Db_Balance (real)
  //  5. Cr_Balance (real)
  //  6. Price (real)
  //  7. Date_Edit (TDateTime)
  //Properties:
  //  0. ItemBalanceId* (integer)
  //  1. Items (_Items)
  //  2. BalanceDate (TDateTime)
  //  3. Balance (real)
  //  4. DbBalance (real)
  //  5. CrBalance (real)
  //  6. Price (real)
  //  7. DateEdit (TDateTime)

  _ItemDetail_Arr = class;
  _ItemDetail = class;
  //Table Name: Item_Detail
  //Fields:
  //  0. Item_Detail_Id* (integer<sequence)
  //  1. Item_Balance_Id (integer) Reference to: Item_Balance\Item_Balance_Id
  //  2. Quantity (real)
  //  3. Price (currency)
  //  4. Conversion (real)
  //  5. Amount (currency)
  //  6. Db_Cr_Type (string[1])
  //  7. Ship_Id (integer) Reference to: Shipment\Ship_Id
  //  8. Discount (real)
  //  9. Service_Parent (integer)
  //  10. Item_ID (integer)
  //  11. Balance_In_Concerned (string[0])
  //  12. Real_Value (currency)
  //  13. Is_Ksg (boolean)
  //Properties:
  //  0. ItemDetailId* (integer)
  //  1. ItemBalance (_ItemBalance)
  //  2. Quantity (real)
  //  3. Price (currency)
  //  4. Conversion (real)
  //  5. Amount (currency)
  //  6. DbCrType (string)
  //  7. Shipment (_Shipment)
  //  8. Discount (real)
  //  9. ServiceParent (integer)
  //  10. ItemID (integer)
  //  11. BalanceInConcerned (string)
  //  12. RealValue (currency)
  //  13. IsKsg (boolean)

  _DummyItemDetail_Arr = class;
  _DummyItemDetail = class;
  //Table Name: Dummy_Item_Detail
  //Fields:
  //  0. Dump_Id* (integer<sequence)
  //  1. Ship_Id (integer)
  //  2. Item_Id (integer) Reference to: Items\Item_Id
  //  3. Service_Id (integer) Reference to: Services\Service_Id
  //  4. Service_Parent (integer)
  //  5. Db_Cr_Type (string[1])
  //  6. Quantity (real)
  //  7. Price (currency)
  //  8. Discount (currency)
  //  9. Amount (currency)
  //  10. Is_Ksg (boolean)
  //Properties:
  //  0. DumpId* (integer)
  //  1. ShipId (integer)
  //  2. Items (_Items)
  //  3. Services (_Services)
  //  4. ServiceParent (integer)
  //  5. DbCrType (string)
  //  6. Quantity (real)
  //  7. Price (currency)
  //  8. Discount (currency)
  //  9. Amount (currency)
  //  10. IsKsg (boolean)

  _Payment_Arr = class;
  _Payment = class;
  //Table Name: Payment
  //Fields:
  //  0. Payment_Id* (integer<sequence)
  //  1. Payment_Type (string[1])
  //  2. Payment_Date (TDateTime)
  //  3. Payment_Num (string[30])
  //  4. Subtotal (currency)
  //  5. Discount (currency)
  //  6. Ppn (currency)
  //  7. Charges (currency)
  //  8. Total (currency)
  //  9. Notes (string[200])
  //  10. User_Insert (string[30])
  //  11. User_Edit (string[30])
  //  12. Date_Insert (TDateTime)
  //  13. Date_Edit (TDateTime)
  //Properties:
  //  0. PaymentId* (integer)
  //  1. PaymentType (string)
  //  2. PaymentDate (TDateTime)
  //  3. PaymentNum (string)
  //  4. Subtotal (currency)
  //  5. Discount (currency)
  //  6. Ppn (currency)
  //  7. Charges (currency)
  //  8. Total (currency)
  //  9. Notes (string)
  //  10. UserInsert (string)
  //  11. UserEdit (string)
  //  12. DateInsert (TDateTime)
  //  13. DateEdit (TDateTime)

  _MoneyAccount_Arr = class;
  _MoneyAccount = class;
  //Table Name: Money_Account
  //Fields:
  //  0. Money_Id* (integer)
  //  1. Money_Code (string[10])
  //  2. Money_Name (string[50])
  //  3. Money_Type (string[1])
  //  4. Money_Owner (string[50])
  //  5. Acc_Num (string[50])
  //  6. Bank_Name (string[50])
  //  7. User_Id (string[20])
  //  8. Date_Modify (TDateTime)
  //Properties:
  //  0. MoneyId* (integer)
  //  1. MoneyCode (string)
  //  2. MoneyName (string)
  //  3. MoneyType (string)
  //  4. MoneyOwner (string)
  //  5. AccNum (string)
  //  6. BankName (string)
  //  7. UserId (string)
  //  8. DateModify (TDateTime)

  _MoneyBalance_Arr = class;
  _MoneyBalance = class;
  //Table Name: Money_Balance
  //Fields:
  //  0. Money_Balance_Id* (integer<sequence)
  //  1. Money_Id (integer) Reference to: Money_Account\Money_Id
  //  2. Balance_Date (TDateTime)
  //  3. Balance (currency)
  //  4. Db_Balance (currency)
  //  5. Cr_Balance (currency)
  //  6. Date_Modify (TDateTime)
  //Properties:
  //  0. MoneyBalanceId* (integer)
  //  1. MoneyAccount (_MoneyAccount)
  //  2. BalanceDate (TDateTime)
  //  3. Balance (currency)
  //  4. DbBalance (currency)
  //  5. CrBalance (currency)
  //  6. DateModify (TDateTime)

  _MoneyTransaction_Arr = class;
  _MoneyTransaction = class;
  //Table Name: Money_Transaction
  //Fields:
  //  0. Money_Trans_Id* (integer<sequence)
  //  1. Payment_Id (integer) Reference to: Payment\Payment_Id
  //  2. Money_Balance_Id (integer) Reference to: Money_Balance\Money_Balance_Id
  //  3. Db_Cr_Type (string[1])
  //  4. Amount (currency)
  //  5. Notes (string[200])
  //  6. Acc_Id (integer) Reference to: Account\Acc_Id
  //Properties:
  //  0. MoneyTransId* (integer)
  //  1. Payment (_Payment)
  //  2. MoneyBalance (_MoneyBalance)
  //  3. DbCrType (string)
  //  4. Amount (currency)
  //  5. Notes (string)
  //  6. Account (_Account)


  _Items_Arr = class(TObject) {Strong-Container Items}
  private
    FOwner: TObject;
  protected
    FItems_Arr: array of _Items;
    function Get(Index: integer): _Items; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Items_Arr[Index: integer]: _Items read Get; default;

    function Add(AItemId: integer; AItemCode: string; AItemType: string; AItemName: string; AUsedUnit: string; APurchaseUnit: string; APrice: currency; AConversion: real; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime; AStokLimit: integer; ARank: integer; APricePurchase: currency): integer; virtual;
    function IndexOf(AItemId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Items = class(TObject) {Strong-Basic Items}
  private
    FOwner: TObject;
  protected
    FItemId: integer; //<sequence
    FItemCode: string; //[20]
    FItemType: string; //[1]
    FItemName: string; //[150]
    FUsedUnit: string; //[50]
    FPurchaseUnit: string; //[50]
    FPrice: currency; //
    FConversion: real; //
    FNotes: string; //[200]
    FUserInsert: string; //[20]
    FUserEdit: string; //[20]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
    FStokLimit: integer; //
    FRank: integer; //
    FPricePurchase: currency; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ItemId: integer  read FItemId write FItemId;
    property ItemCode: string  read FItemCode write FItemCode;
    property ItemType: string  read FItemType write FItemType;
    property ItemName: string  read FItemName write FItemName;
    property UsedUnit: string  read FUsedUnit write FUsedUnit;
    property PurchaseUnit: string  read FPurchaseUnit write FPurchaseUnit;
    property Price: currency  read FPrice write FPrice;
    property Conversion: real  read FConversion write FConversion;
    property Notes: string  read FNotes write FNotes;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;
    property StokLimit: integer  read FStokLimit write FStokLimit;
    property Rank: integer  read FRank write FRank;
    property PricePurchase: currency  read FPricePurchase write FPricePurchase;

    function SelectInDB(AItemId: integer): boolean; virtual;
    class function ExistInDB(AItemId: integer): integer; virtual;
  end;

  _ItemPrice_Arr = class(TObject) {Strong-Container ItemPrice}
  private
    FOwner: TObject;
  protected
    FItemPrice_Arr: array of _ItemPrice;
    function Get(Index: integer): _ItemPrice; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property ItemPrice_Arr[Index: integer]: _ItemPrice read Get; default;

    function Add(APriceId: integer; AItemId: integer; AServiceId: integer; APrice: currency; ADisableDate: TDateTime; ADateInsert: TDateTime; AUserInsert: string; AUserEdit: string; ADateEdit: TDateTime): integer; virtual;
    function IndexOf(APriceId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _ItemPrice = class(TObject) {Strong-Basic ItemPrice}
  private
    FOwner: TObject;
  protected
    FPriceId: integer; //<sequence
    FItems: _Items; //ItemId: integer
    FServiceId: integer; //
    FPrice: currency; //
    FDisableDate: TDateTime; //
    FDateInsert: TDateTime; //
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property PriceId: integer  read FPriceId write FPriceId;
    property Items: _Items  read FItems;
    property ServiceId: integer  read FServiceId write FServiceId;
    property Price: currency  read FPrice write FPrice;
    property DisableDate: TDateTime  read FDisableDate write FDisableDate;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;
  end;

  _ItemPricePurchase_Arr = class(TObject) {Strong-Container ItemPricePurchase}
  private
    FOwner: TObject;
  protected
    FItemPricePurchase_Arr: array of _ItemPricePurchase;
    function Get(Index: integer): _ItemPricePurchase; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property ItemPricePurchase_Arr[Index: integer]: _ItemPricePurchase read Get; default;

    function Add(APricePurchaseId: integer; AItemId: integer; APrice: currency; ADisableDate: TDateTime; ADateInsert: TDateTime; AUserInsert: string; AUserEdit: string; ADateEdit: TDateTime): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _ItemPricePurchase = class(TObject) {Strong-Basic ItemPricePurchase}
  private
    FOwner: TObject;
  protected
    FPricePurchaseId: integer; //<sequence
    FItems: _Items; //ItemId: integer
    FPrice: currency; //
    FDisableDate: TDateTime; //
    FDateInsert: TDateTime; //
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property PricePurchaseId: integer  read FPricePurchaseId write FPricePurchaseId;
    property Items: _Items  read FItems;
    property Price: currency  read FPrice write FPrice;
    property DisableDate: TDateTime  read FDisableDate write FDisableDate;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;
  end;

  _Warehouse_Arr = class(TObject) {Strong-Container Warehouse}
  private
    FOwner: TObject;
  protected
    FWarehouse_Arr: array of _Warehouse;
    function Get(Index: integer): _Warehouse; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Warehouse_Arr[Index: integer]: _Warehouse read Get; default;

    function Add(AWhId: integer; AWhCode: string; AWhName: string; AIsActive: boolean; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer; virtual;
    function IndexOf(AWhId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Warehouse = class(TObject) {Strong-Basic Warehouse}
  private
    FOwner: TObject;
  protected
    FWhId: integer; //<sequence
    FWhCode: string; //[10]
    FWhName: string; //[150]
    FIsActive: boolean; //
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property WhId: integer  read FWhId write FWhId;
    property WhCode: string  read FWhCode write FWhCode;
    property WhName: string  read FWhName write FWhName;
    property IsActive: boolean  read FIsActive write FIsActive;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;

    function SelectInDB(AWhId: integer): boolean; virtual;
    class function ExistInDB(AWhId: integer): integer; virtual;
  end;

  _Services_Arr = class(TObject) {Strong-Container Services}
  private
    FOwner: TObject;
  protected
    FServices_Arr: array of _Services;
    function Get(Index: integer): _Services; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Services_Arr[Index: integer]: _Services read Get; default;

    function Add(AServiceId: integer; AServiceCode: string; AServiceType: string; AServiceName: string; APrice: real; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer; virtual;
    function IndexOf(AServiceId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Services = class(TObject) {Strong-Basic Services}
  private
    FOwner: TObject;
  protected
    FServiceId: integer; //<sequence
    FServiceCode: string; //[50]
    FServiceType: string; //[1]
    FServiceName: string; //[100]
    FPrice: real; //
    FNotes: string; //[200]
    FUserInsert: string; //[20]
    FUserEdit: string; //[20]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ServiceId: integer  read FServiceId write FServiceId;
    property ServiceCode: string  read FServiceCode write FServiceCode;
    property ServiceType: string  read FServiceType write FServiceType;
    property ServiceName: string  read FServiceName write FServiceName;
    property Price: real  read FPrice write FPrice;
    property Notes: string  read FNotes write FNotes;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;

    function SelectInDB(AServiceId: integer): boolean; virtual;
    class function ExistInDB(AServiceId: integer): integer; virtual;
  end;

  _ServicePackage_Arr = class(TObject) {Strong-Container ServicePackage}
  private
    FOwner: TObject;
  protected
    FServicePackage_Arr: array of _ServicePackage;
    function Get(Index: integer): _ServicePackage; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property ServicePackage_Arr[Index: integer]: _ServicePackage read Get; default;

    function Add(APkgId: integer; AServiceId: integer; AItemId: integer; APrice: currency; AQuantity: real; AServiceParent: integer; ANotes: string): integer; virtual;
    function IndexOf(APkgId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _ServicePackage = class(TObject) {Strong-Basic ServicePackage}
  private
    FOwner: TObject;
  protected
    FPkgId: integer; //<sequence
    FServices: _Services; //ServiceId: integer
    FItems: _Items; //ItemId: integer
    FPrice: currency; //
    FQuantity: real; //
    FServiceParent: integer; //
    FNotes: string; //[100]
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property PkgId: integer  read FPkgId write FPkgId;
    property Services: _Services  read FServices;
    property Items: _Items  read FItems;
    property Price: currency  read FPrice write FPrice;
    property Quantity: real  read FQuantity write FQuantity;
    property ServiceParent: integer  read FServiceParent write FServiceParent;
    property Notes: string  read FNotes write FNotes;
  end;

  _CompanyProfile_Arr = class(TObject) {Strong-Container CompanyProfile}
  private
    FOwner: TObject;
  protected
    FCompanyProfile_Arr: array of _CompanyProfile;
    function Get(Index: integer): _CompanyProfile; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property CompanyProfile_Arr[Index: integer]: _CompanyProfile read Get; default;

    function Add(ACompanyName: string; AAddress: string; ATelp1: string; ATelp2: string; AFax: string; ACity: string; ABranch: string; AInfo: string): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _CompanyProfile = class(TObject) {Strong-Basic CompanyProfile}
  private
    FOwner: TObject;
  protected
    FCompanyName: string; //[50]
    FAddress: string; //[50]
    FTelp1: string; //[50]
    FTelp2: string; //[50]
    FFax: string; //[50]
    FCity: string; //[50]
    FBranch: string; //[50]
    FInfo: string; //[500]
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property CompanyName: string  read FCompanyName write FCompanyName;
    property Address: string  read FAddress write FAddress;
    property Telp1: string  read FTelp1 write FTelp1;
    property Telp2: string  read FTelp2 write FTelp2;
    property Fax: string  read FFax write FFax;
    property City: string  read FCity write FCity;
    property Branch: string  read FBranch write FBranch;
    property Info: string  read FInfo write FInfo;
  end;

  _Motor_Arr = class(TObject) {Strong-Container Motor}
  private
    FOwner: TObject;
  protected
    FMotor_Arr: array of _Motor;
    function Get(Index: integer): _Motor; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Motor_Arr[Index: integer]: _Motor read Get; default;

    function Add(AMotorId: integer; AMotorType: string; AMotorCode: string; AMotorName: string; AMotorYear: integer; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer; virtual;
    function IndexOf(AMotorId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Motor = class(TObject) {Strong-Basic Motor}
  private
    FOwner: TObject;
  protected
    FMotorId: integer; //<sequence
    FMotorType: string; //[1]
    FMotorCode: string; //[10]
    FMotorName: string; //[50]
    FMotorYear: integer; //
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property MotorId: integer  read FMotorId write FMotorId;
    property MotorType: string  read FMotorType write FMotorType;
    property MotorCode: string  read FMotorCode write FMotorCode;
    property MotorName: string  read FMotorName write FMotorName;
    property MotorYear: integer  read FMotorYear write FMotorYear;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;

    function SelectInDB(AMotorId: integer): boolean; virtual;
    class function ExistInDB(AMotorId: integer): integer; virtual;
  end;

  _Persons_Arr = class(TObject) {Strong-Container Persons}
  private
    FOwner: TObject;
  protected
    FPersons_Arr: array of _Persons;
    function Get(Index: integer): _Persons; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Persons_Arr[Index: integer]: _Persons read Get; default;

    function Add(APersonId: integer; APersonCode: string; APersonType: string; APersonName: string; AMotorId: integer; AAddress: string; ACity: string; APostalCode: string; ABirthDate: TDateTime; AIdNum: string; APhone1: string; APhone2: string; APhone3: string; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime; AMtrYear: integer; AMtrRangka: string; AMtrMesin: string): integer; virtual;
    function IndexOf(APersonId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Persons = class(TObject) {Strong-Basic Persons}
  private
    FOwner: TObject;
  protected
    FPersonId: integer; //<sequence
    FPersonCode: string; //[20]
    FPersonType: string; //[1]
    FPersonName: string; //[50]
    FMotor: _Motor; //MotorId: integer
    FAddress: string; //[200]
    FCity: string; //[50]
    FPostalCode: string; //[10]
    FBirthDate: TDateTime; //
    FIdNum: string; //[50]
    FPhone1: string; //[20]
    FPhone2: string; //[20]
    FPhone3: string; //[20]
    FNotes: string; //[200]
    FUserInsert: string; //[30]
    FUserEdit: string; //[20]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
    FMtrYear: integer; //
    FMtrRangka: string; //[50]
    FMtrMesin: string; //[50]
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property PersonId: integer  read FPersonId write FPersonId;
    property PersonCode: string  read FPersonCode write FPersonCode;
    property PersonType: string  read FPersonType write FPersonType;
    property PersonName: string  read FPersonName write FPersonName;
    property Motor: _Motor  read FMotor;
    property Address: string  read FAddress write FAddress;
    property City: string  read FCity write FCity;
    property PostalCode: string  read FPostalCode write FPostalCode;
    property BirthDate: TDateTime  read FBirthDate write FBirthDate;
    property IdNum: string  read FIdNum write FIdNum;
    property Phone1: string  read FPhone1 write FPhone1;
    property Phone2: string  read FPhone2 write FPhone2;
    property Phone3: string  read FPhone3 write FPhone3;
    property Notes: string  read FNotes write FNotes;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;
    property MtrYear: integer  read FMtrYear write FMtrYear;
    property MtrRangka: string  read FMtrRangka write FMtrRangka;
    property MtrMesin: string  read FMtrMesin write FMtrMesin;

    function SelectInDB(APersonId: integer): boolean; virtual;
    class function ExistInDB(APersonId: integer): integer; virtual;
  end;

  _Account_Arr = class(TObject) {Strong-Container Account}
  private
    FOwner: TObject;
  protected
    FAccount_Arr: array of _Account;
    function Get(Index: integer): _Account; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Account_Arr[Index: integer]: _Account read Get; default;

    function Add(AAccId: integer; AAccType: string; AAccCode: string; AAccName: string; ADbCrType: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdt: TDateTime): integer; virtual;
    function IndexOf(AAccId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Account = class(TObject) {Strong-Basic Account}
  private
    FOwner: TObject;
  protected
    FAccId: integer; //<sequence
    FAccType: string; //[1]
    FAccCode: string; //[20]
    FAccName: string; //[150]
    FDbCrType: string; //[1]
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateInsert: TDateTime; //
    FDateEdt: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property AccId: integer  read FAccId write FAccId;
    property AccType: string  read FAccType write FAccType;
    property AccCode: string  read FAccCode write FAccCode;
    property AccName: string  read FAccName write FAccName;
    property DbCrType: string  read FDbCrType write FDbCrType;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdt: TDateTime  read FDateEdt write FDateEdt;

    function SelectInDB(AAccId: integer): boolean; virtual;
    class function ExistInDB(AAccId: integer): integer; virtual;
  end;

  _Shipment_Arr = class(TObject) {Strong-Container Shipment}
  private
    FOwner: TObject;
  protected
    FShipment_Arr: array of _Shipment;
    function Get(Index: integer): _Shipment; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Shipment_Arr[Index: integer]: _Shipment read Get; default;

    function Add(AShipId: integer; AShipNum: string; AShipType: string; AShipDate: TDateTime; APersonId: integer; AMekanikId: integer; ANotes: string; ASubtotal: currency; ADiscount: currency; APpn: currency; ATotal: currency; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime; AShipIdUsed: integer; AWhId: integer; AWhIdOut: integer; AExprDate: TDateTime; AIsPost: boolean; AShipServiceType: string; ADownPayment: currency; ATglKirim: TDate; ATglSampai: TDate; ADeliveryNum: string): integer; virtual;
    function IndexOf(AShipId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Shipment = class(TObject) {Strong-Basic Shipment}
  private
    FOwner: TObject;
  protected
    FShipId: integer; //<sequence
    FShipNum: string; //[30]
    FShipType: string; //[1]
    FShipDate: TDateTime; //
    FPersons: _Persons; //PersonId: integer
    FPersonsMekanik_Id: _Persons; //MekanikId: integer
    FNotes: string; //[50]
    FSubtotal: currency; //
    FDiscount: currency; //
    FPpn: currency; //
    FTotal: currency; //
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
    FShipIdUsed: integer; //
    FWarehouse: _Warehouse; //WhId: integer
    FWhIdOut: integer; //
    FExprDate: TDateTime; //
    FIsPost: boolean; //
    FShipServiceType: string; //[1]
    FDownPayment: currency; //
    FTglKirim: TDate; //
    FTglSampai: TDate; //
    FDeliveryNum: string; //[100]
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ShipId: integer  read FShipId write FShipId;
    property ShipNum: string  read FShipNum write FShipNum;
    property ShipType: string  read FShipType write FShipType;
    property ShipDate: TDateTime  read FShipDate write FShipDate;
    property Persons: _Persons  read FPersons;
    property PersonsMekanik_Id: _Persons  read FPersonsMekanik_Id;
    property Notes: string  read FNotes write FNotes;
    property Subtotal: currency  read FSubtotal write FSubtotal;
    property Discount: currency  read FDiscount write FDiscount;
    property Ppn: currency  read FPpn write FPpn;
    property Total: currency  read FTotal write FTotal;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;
    property ShipIdUsed: integer  read FShipIdUsed write FShipIdUsed;
    property Warehouse: _Warehouse  read FWarehouse;
    property WhIdOut: integer  read FWhIdOut write FWhIdOut;
    property ExprDate: TDateTime  read FExprDate write FExprDate;
    property IsPost: boolean  read FIsPost write FIsPost;
    property ShipServiceType: string  read FShipServiceType write FShipServiceType;
    property DownPayment: currency  read FDownPayment write FDownPayment;
    property TglKirim: TDate  read FTglKirim write FTglKirim;
    property TglSampai: TDate  read FTglSampai write FTglSampai;
    property DeliveryNum: string  read FDeliveryNum write FDeliveryNum;

    function SelectInDB(AShipId: integer): boolean; virtual;
    class function ExistInDB(AShipId: integer): integer; virtual;
  end;

  _ServiceDetail_Arr = class(TObject) {Strong-Container ServiceDetail}
  private
    FOwner: TObject;
  protected
    FServiceDetail_Arr: array of _ServiceDetail;
    function Get(Index: integer): _ServiceDetail; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property ServiceDetail_Arr[Index: integer]: _ServiceDetail read Get; default;

    function Add(AServiceDetailId: integer; AShipId: integer; AServiceId: integer; AQuantity: real; APrice: currency; AAmount: currency; ANotes: string; ACharges: currency; ADiscount: real; AServiceParent: integer; AIsKsg: boolean): integer; virtual;
    function IndexOf(AServiceDetailId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _ServiceDetail = class(TObject) {Strong-Basic ServiceDetail}
  private
    FOwner: TObject;
  protected
    FServiceDetailId: integer; //<sequence
    FShipment: _Shipment; //ShipId: integer
    FServices: _Services; //ServiceId: integer
    FQuantity: real; //
    FPrice: currency; //
    FAmount: currency; //
    FNotes: string; //[200]
    FCharges: currency; //
    FDiscount: real; //
    FServiceParent: integer; //
    FIsKsg: boolean; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ServiceDetailId: integer  read FServiceDetailId write FServiceDetailId;
    property Shipment: _Shipment  read FShipment;
    property Services: _Services  read FServices;
    property Quantity: real  read FQuantity write FQuantity;
    property Price: currency  read FPrice write FPrice;
    property Amount: currency  read FAmount write FAmount;
    property Notes: string  read FNotes write FNotes;
    property Charges: currency  read FCharges write FCharges;
    property Discount: real  read FDiscount write FDiscount;
    property ServiceParent: integer  read FServiceParent write FServiceParent;
    property IsKsg: boolean  read FIsKsg write FIsKsg;
  end;

  _ItemBalance_Arr = class(TObject) {Strong-Container ItemBalance}
  private
    FOwner: TObject;
  protected
    FItemBalance_Arr: array of _ItemBalance;
    function Get(Index: integer): _ItemBalance; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property ItemBalance_Arr[Index: integer]: _ItemBalance read Get; default;

    function Add(AItemBalanceId: integer; AItemId: integer; ABalanceDate: TDateTime; ABalance: real; ADbBalance: real; ACrBalance: real; APrice: real; ADateEdit: TDateTime): integer; virtual;
    function IndexOf(AItemBalanceId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _ItemBalance = class(TObject) {Strong-Basic ItemBalance}
  private
    FOwner: TObject;
  protected
    FItemBalanceId: integer; //<sequence
    FItems: _Items; //ItemId: integer
    FBalanceDate: TDateTime; //
    FBalance: real; //
    FDbBalance: real; //
    FCrBalance: real; //
    FPrice: real; //
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ItemBalanceId: integer  read FItemBalanceId write FItemBalanceId;
    property Items: _Items  read FItems;
    property BalanceDate: TDateTime  read FBalanceDate write FBalanceDate;
    property Balance: real  read FBalance write FBalance;
    property DbBalance: real  read FDbBalance write FDbBalance;
    property CrBalance: real  read FCrBalance write FCrBalance;
    property Price: real  read FPrice write FPrice;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;

    function SelectInDB(AItemBalanceId: integer): boolean; virtual;
    class function ExistInDB(AItemBalanceId: integer): integer; virtual;
  end;

  _ItemDetail_Arr = class(TObject) {Strong-Container ItemDetail}
  private
    FOwner: TObject;
  protected
    FItemDetail_Arr: array of _ItemDetail;
    function Get(Index: integer): _ItemDetail; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property ItemDetail_Arr[Index: integer]: _ItemDetail read Get; default;

    function Add(AItemDetailId: integer; AItemBalanceId: integer; AQuantity: real; APrice: currency; AConversion: real; AAmount: currency; ADbCrType: string; AShipId: integer; ADiscount: real; AServiceParent: integer; AItemID: integer; ABalanceInConcerned: string; ARealValue: currency; AIsKsg: boolean): integer; virtual;
    function IndexOf(AItemDetailId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _ItemDetail = class(TObject) {Strong-Basic ItemDetail}
  private
    FOwner: TObject;
  protected
    FItemDetailId: integer; //<sequence
    FItemBalance: _ItemBalance; //ItemBalanceId: integer
    FQuantity: real; //
    FPrice: currency; //
    FConversion: real; //
    FAmount: currency; //
    FDbCrType: string; //[1]
    FShipment: _Shipment; //ShipId: integer
    FDiscount: real; //
    FServiceParent: integer; //
    FItemID: integer; //
    FBalanceInConcerned: string; //[0]
    FRealValue: currency; //
    FIsKsg: boolean; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property ItemDetailId: integer  read FItemDetailId write FItemDetailId;
    property ItemBalance: _ItemBalance  read FItemBalance;
    property Quantity: real  read FQuantity write FQuantity;
    property Price: currency  read FPrice write FPrice;
    property Conversion: real  read FConversion write FConversion;
    property Amount: currency  read FAmount write FAmount;
    property DbCrType: string  read FDbCrType write FDbCrType;
    property Shipment: _Shipment  read FShipment;
    property Discount: real  read FDiscount write FDiscount;
    property ServiceParent: integer  read FServiceParent write FServiceParent;
    property ItemID: integer  read FItemID write FItemID;
    property BalanceInConcerned: string  read FBalanceInConcerned write FBalanceInConcerned;
    property RealValue: currency  read FRealValue write FRealValue;
    property IsKsg: boolean  read FIsKsg write FIsKsg;
  end;

  _DummyItemDetail_Arr = class(TObject) {Strong-Container DummyItemDetail}
  private
    FOwner: TObject;
  protected
    FDummyItemDetail_Arr: array of _DummyItemDetail;
    function Get(Index: integer): _DummyItemDetail; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property DummyItemDetail_Arr[Index: integer]: _DummyItemDetail read Get; default;

    function Add(ADumpId: integer; AShipId: integer; AItemId: integer; AServiceId: integer; AServiceParent: integer; ADbCrType: string; AQuantity: real; APrice: currency; ADiscount: currency; AAmount: currency; AIsKsg: boolean): integer; virtual;
    function IndexOf(ADumpId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _DummyItemDetail = class(TObject) {Strong-Basic DummyItemDetail}
  private
    FOwner: TObject;
  protected
    FDumpId: integer; //<sequence
    FShipId: integer; //
    FItems: _Items; //ItemId: integer
    FServices: _Services; //ServiceId: integer
    FServiceParent: integer; //
    FDbCrType: string; //[1]
    FQuantity: real; //
    FPrice: currency; //
    FDiscount: currency; //
    FAmount: currency; //
    FIsKsg: boolean; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property DumpId: integer  read FDumpId write FDumpId;
    property ShipId: integer  read FShipId write FShipId;
    property Items: _Items  read FItems;
    property Services: _Services  read FServices;
    property ServiceParent: integer  read FServiceParent write FServiceParent;
    property DbCrType: string  read FDbCrType write FDbCrType;
    property Quantity: real  read FQuantity write FQuantity;
    property Price: currency  read FPrice write FPrice;
    property Discount: currency  read FDiscount write FDiscount;
    property Amount: currency  read FAmount write FAmount;
    property IsKsg: boolean  read FIsKsg write FIsKsg;
  end;

  _Payment_Arr = class(TObject) {Strong-Container Payment}
  private
    FOwner: TObject;
  protected
    FPayment_Arr: array of _Payment;
    function Get(Index: integer): _Payment; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property Payment_Arr[Index: integer]: _Payment read Get; default;

    function Add(APaymentId: integer; APaymentType: string; APaymentDate: TDateTime; APaymentNum: string; ASubtotal: currency; ADiscount: currency; APpn: currency; ACharges: currency; ATotal: currency; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer; virtual;
    function IndexOf(APaymentId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _Payment = class(TObject) {Strong-Basic Payment}
  private
    FOwner: TObject;
  protected
    FPaymentId: integer; //<sequence
    FPaymentType: string; //[1]
    FPaymentDate: TDateTime; //
    FPaymentNum: string; //[30]
    FSubtotal: currency; //
    FDiscount: currency; //
    FPpn: currency; //
    FCharges: currency; //
    FTotal: currency; //
    FNotes: string; //[200]
    FUserInsert: string; //[30]
    FUserEdit: string; //[30]
    FDateInsert: TDateTime; //
    FDateEdit: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property PaymentId: integer  read FPaymentId write FPaymentId;
    property PaymentType: string  read FPaymentType write FPaymentType;
    property PaymentDate: TDateTime  read FPaymentDate write FPaymentDate;
    property PaymentNum: string  read FPaymentNum write FPaymentNum;
    property Subtotal: currency  read FSubtotal write FSubtotal;
    property Discount: currency  read FDiscount write FDiscount;
    property Ppn: currency  read FPpn write FPpn;
    property Charges: currency  read FCharges write FCharges;
    property Total: currency  read FTotal write FTotal;
    property Notes: string  read FNotes write FNotes;
    property UserInsert: string  read FUserInsert write FUserInsert;
    property UserEdit: string  read FUserEdit write FUserEdit;
    property DateInsert: TDateTime  read FDateInsert write FDateInsert;
    property DateEdit: TDateTime  read FDateEdit write FDateEdit;

    function SelectInDB(APaymentId: integer): boolean; virtual;
    class function ExistInDB(APaymentId: integer): integer; virtual;
  end;

  _MoneyAccount_Arr = class(TObject) {Strong-Container MoneyAccount}
  private
    FOwner: TObject;
  protected
    FMoneyAccount_Arr: array of _MoneyAccount;
    function Get(Index: integer): _MoneyAccount; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property MoneyAccount_Arr[Index: integer]: _MoneyAccount read Get; default;

    function Add(AMoneyId: integer; AMoneyCode: string; AMoneyName: string; AMoneyType: string; AMoneyOwner: string; AAccNum: string; ABankName: string; AUserId: string; ADateModify: TDateTime): integer; virtual;
    function IndexOf(AMoneyId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _MoneyAccount = class(TObject) {Strong-Basic MoneyAccount}
  private
    FOwner: TObject;
  protected
    FMoneyId: integer; //
    FMoneyCode: string; //[10]
    FMoneyName: string; //[50]
    FMoneyType: string; //[1]
    FMoneyOwner: string; //[50]
    FAccNum: string; //[50]
    FBankName: string; //[50]
    FUserId: string; //[20]
    FDateModify: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property MoneyId: integer  read FMoneyId write FMoneyId;
    property MoneyCode: string  read FMoneyCode write FMoneyCode;
    property MoneyName: string  read FMoneyName write FMoneyName;
    property MoneyType: string  read FMoneyType write FMoneyType;
    property MoneyOwner: string  read FMoneyOwner write FMoneyOwner;
    property AccNum: string  read FAccNum write FAccNum;
    property BankName: string  read FBankName write FBankName;
    property UserId: string  read FUserId write FUserId;
    property DateModify: TDateTime  read FDateModify write FDateModify;

    function SelectInDB(AMoneyId: integer): boolean; virtual;
    class function ExistInDB(AMoneyId: integer): integer; virtual;
  end;

  _MoneyBalance_Arr = class(TObject) {Strong-Container MoneyBalance}
  private
    FOwner: TObject;
  protected
    FMoneyBalance_Arr: array of _MoneyBalance;
    function Get(Index: integer): _MoneyBalance; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property MoneyBalance_Arr[Index: integer]: _MoneyBalance read Get; default;

    function Add(AMoneyBalanceId: integer; AMoneyId: integer; ABalanceDate: TDateTime; ABalance: currency; ADbBalance: currency; ACrBalance: currency; ADateModify: TDateTime): integer; virtual;
    function IndexOf(AMoneyBalanceId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _MoneyBalance = class(TObject) {Strong-Basic MoneyBalance}
  private
    FOwner: TObject;
  protected
    FMoneyBalanceId: integer; //<sequence
    FMoneyAccount: _MoneyAccount; //MoneyId: integer
    FBalanceDate: TDateTime; //
    FBalance: currency; //
    FDbBalance: currency; //
    FCrBalance: currency; //
    FDateModify: TDateTime; //
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property MoneyBalanceId: integer  read FMoneyBalanceId write FMoneyBalanceId;
    property MoneyAccount: _MoneyAccount  read FMoneyAccount;
    property BalanceDate: TDateTime  read FBalanceDate write FBalanceDate;
    property Balance: currency  read FBalance write FBalance;
    property DbBalance: currency  read FDbBalance write FDbBalance;
    property CrBalance: currency  read FCrBalance write FCrBalance;
    property DateModify: TDateTime  read FDateModify write FDateModify;

    function SelectInDB(AMoneyBalanceId: integer): boolean; virtual;
    class function ExistInDB(AMoneyBalanceId: integer): integer; virtual;
  end;

  _MoneyTransaction_Arr = class(TObject) {Strong-Container MoneyTransaction}
  private
    FOwner: TObject;
  protected
    FMoneyTransaction_Arr: array of _MoneyTransaction;
    function Get(Index: integer): _MoneyTransaction; virtual;
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Clear; virtual;
    function Count: integer;
    property MoneyTransaction_Arr[Index: integer]: _MoneyTransaction read Get; default;

    function Add(AMoneyTransId: integer; APaymentId: integer; AMoneyBalanceId: integer; ADbCrType: string; AAmount: currency; ANotes: string; AAccId: integer): integer; virtual;
    function IndexOf(AMoneyTransId: integer): integer; virtual;
    procedure Delete(Index: integer); virtual;
  end;

  _MoneyTransaction = class(TObject) {Strong-Basic MoneyTransaction}
  private
    FOwner: TObject;
  protected
    FMoneyTransId: integer; //<sequence
    FPayment: _Payment; //PaymentId: integer
    FMoneyBalance: _MoneyBalance; //MoneyBalanceId: integer
    FDbCrType: string; //[1]
    FAmount: currency; //
    FNotes: string; //[200]
    FAccount: _Account; //AccId: integer
  public
    property Owner: TObject read FOwner;
    constructor Create(AOwner: TObject = nil);
    destructor Destroy; override;
    procedure Reset; virtual;
    procedure InsertOnDB; virtual;
    procedure UpdateOnDB; virtual;
    procedure DeleteOnDB; virtual;
    property MoneyTransId: integer  read FMoneyTransId write FMoneyTransId;
    property Payment: _Payment  read FPayment;
    property MoneyBalance: _MoneyBalance  read FMoneyBalance;
    property DbCrType: string  read FDbCrType write FDbCrType;
    property Amount: currency  read FAmount write FAmount;
    property Notes: string  read FNotes write FNotes;
    property Account: _Account  read FAccount;
  end;


implementation
{$HINTS OFF}


{ _Items_Arr }

constructor _Items_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FItems_Arr,0);
end;

destructor _Items_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Items_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FItems_Arr) do FItems_Arr[i].Destroy;
  setLength(FItems_Arr,0);
end;

function _Items_Arr.Add(AItemId: integer; AItemCode: string; AItemType: string; AItemName: string; AUsedUnit: string; APurchaseUnit: string; APrice: currency; AConversion: real; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime; AStokLimit: integer; ARank: integer; APricePurchase: currency): integer;
begin
  setLength(FItems_Arr, length(FItems_Arr)+1);
  Result := high(FItems_Arr);
  FItems_Arr[Result] := _Items.Create(Self);
  FItems_Arr[Result].ItemId := AItemId;
  FItems_Arr[Result].ItemCode := AItemCode;
  FItems_Arr[Result].ItemType := AItemType;
  FItems_Arr[Result].ItemName := AItemName;
  FItems_Arr[Result].UsedUnit := AUsedUnit;
  FItems_Arr[Result].PurchaseUnit := APurchaseUnit;
  FItems_Arr[Result].Price := APrice;
  FItems_Arr[Result].Conversion := AConversion;
  FItems_Arr[Result].Notes := ANotes;
  FItems_Arr[Result].UserInsert := AUserInsert;
  FItems_Arr[Result].UserEdit := AUserEdit;
  FItems_Arr[Result].DateInsert := ADateInsert;
  FItems_Arr[Result].DateEdit := ADateEdit;
  FItems_Arr[Result].StokLimit := AStokLimit;
  FItems_Arr[Result].Rank := ARank;
  FItems_Arr[Result].PricePurchase := APricePurchase;
end;

function _Items_Arr.IndexOf(AItemId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FItems_Arr)) and (not found) do
    if (FItems_Arr[i].FItemId=AItemId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Items_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FItems_Arr)) then Exit;
  FItems_Arr[Index].Destroy;
  for i:=Index to high(FItems_Arr)-1 do
    FItems_Arr[Index] := FItems_Arr[Index-1];
  setLength(FItems_Arr,length(FItems_Arr)-1);
end;

function _Items_Arr.Count: integer;
begin
  Result := length(FItems_Arr);
end;

function _Items_Arr.Get(Index: integer): _Items;
begin
  if (Index<0) or (Index>high(FItems_Arr)) then Result := nil
  else Result := FItems_Arr[Index];
end;


{ _Items }

constructor _Items.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _Items.Destroy;
begin
  inherited;
end;

procedure _Items.Reset;
begin
  FItemId := 0;
  FItemCode := '';
  FItemType := '';
  FItemName := '';
  FUsedUnit := '';
  FPurchaseUnit := '';
  FPrice := 0.0;
  FConversion := 0.0;
  FNotes := '';
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
  FStokLimit := 0;
  FRank := 0;
  FPricePurchase := 0.0;
end;

procedure _Items.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Items (Item_Code,Item_Type,Item_Name,Used_Unit,Purchase_Unit,Price,Conversion,Notes,User_Insert,User_Edit,Date_Insert,Date_Edit,Stok_Limit,Rank,Price_Purchase)'+
    ' VALUES ('+
      FormatSQLString(FItemCode)+','+
      FormatSQLString(FItemType)+','+
      FormatSQLString(FItemName)+','+
      FormatSQLString(FUsedUnit)+','+
      FormatSQLString(FPurchaseUnit)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FConversion)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+','+
      FormatSQLNumber(FStokLimit)+','+
      FormatSQLNumber(FRank)+','+
      FormatSQLNumber(FPricePurchase)+')'
  ); except raise; end;
end;

procedure _Items.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Items SET'+
          ' Item_Code='+FormatSQLString(FItemCode)+','+
          ' Item_Type='+FormatSQLString(FItemType)+','+
          ' Item_Name='+FormatSQLString(FItemName)+','+
          ' Used_Unit='+FormatSQLString(FUsedUnit)+','+
          ' Purchase_Unit='+FormatSQLString(FPurchaseUnit)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Conversion='+FormatSQLNumber(FConversion)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+','+
          ' Stok_Limit='+FormatSQLNumber(FStokLimit)+','+
          ' Rank='+FormatSQLNumber(FRank)+','+
          ' Price_Purchase='+FormatSQLNumber(FPricePurchase)+
    ' WHERE Item_Id='+FormatSQLNumber(FItemId)
  ); except raise; end;
end;

procedure _Items.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Items'+
    ' WHERE Item_Id='+FormatSQLNumber(FItemId)
  ); except raise; end;
end;

function _Items.SelectInDB(AItemId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT I.Item_Id, I.Item_Code, I.Item_Type, I.Item_Name, I.Used_Unit, I.Purchase_Unit, I.Price, I.Conversion, I.Notes, I.User_Insert, I.User_Edit, I.Date_Insert, I.Date_Edit, I.Stok_Limit, I.Rank, I.Price_Purchase'+
         ''+
     ' FROM Items I'+
    ' WHERE I.Item_Id='+FormatSQLNumber(AItemId)
  );
  if (buffer.RecordCount<>0) then begin
    FItemId := BufferToInteger(buffer.Fields[0].Value);
    FItemCode := BufferToString(buffer.Fields[1].Value);
    FItemType := BufferToString(buffer.Fields[2].Value);
    FItemName := BufferToString(buffer.Fields[3].Value);
    FUsedUnit := BufferToString(buffer.Fields[4].Value);
    FPurchaseUnit := BufferToString(buffer.Fields[5].Value);
    FPrice := BufferToFloat(buffer.Fields[6].Value);
    FConversion := BufferToFloat(buffer.Fields[7].Value);
    FNotes := BufferToString(buffer.Fields[8].Value);
    FUserInsert := BufferToString(buffer.Fields[9].Value);
    FUserEdit := BufferToString(buffer.Fields[10].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[11].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[12].Value);
    FStokLimit := BufferToInteger(buffer.Fields[13].Value);
    FRank := BufferToInteger(buffer.Fields[14].Value);
    FPricePurchase := BufferToFloat(buffer.Fields[15].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Items.ExistInDB(AItemId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Items'+
    ' WHERE Item_Id='+FormatSQLNumber(AItemId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _ItemPrice_Arr }

constructor _ItemPrice_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FItemPrice_Arr,0);
end;

destructor _ItemPrice_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _ItemPrice_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FItemPrice_Arr) do FItemPrice_Arr[i].Destroy;
  setLength(FItemPrice_Arr,0);
end;

function _ItemPrice_Arr.Add(APriceId: integer; AItemId: integer; AServiceId: integer; APrice: currency; ADisableDate: TDateTime; ADateInsert: TDateTime; AUserInsert: string; AUserEdit: string; ADateEdit: TDateTime): integer;
begin
  setLength(FItemPrice_Arr, length(FItemPrice_Arr)+1);
  Result := high(FItemPrice_Arr);
  FItemPrice_Arr[Result] := _ItemPrice.Create(Self);
  FItemPrice_Arr[Result].PriceId := APriceId;
  FItemPrice_Arr[Result].Items.ItemId := AItemId;
  FItemPrice_Arr[Result].ServiceId := AServiceId;
  FItemPrice_Arr[Result].Price := APrice;
  FItemPrice_Arr[Result].DisableDate := ADisableDate;
  FItemPrice_Arr[Result].DateInsert := ADateInsert;
  FItemPrice_Arr[Result].UserInsert := AUserInsert;
  FItemPrice_Arr[Result].UserEdit := AUserEdit;
  FItemPrice_Arr[Result].DateEdit := ADateEdit;
end;

function _ItemPrice_Arr.IndexOf(APriceId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FItemPrice_Arr)) and (not found) do
    if (FItemPrice_Arr[i].FPriceId=APriceId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _ItemPrice_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FItemPrice_Arr)) then Exit;
  FItemPrice_Arr[Index].Destroy;
  for i:=Index to high(FItemPrice_Arr)-1 do
    FItemPrice_Arr[Index] := FItemPrice_Arr[Index-1];
  setLength(FItemPrice_Arr,length(FItemPrice_Arr)-1);
end;

function _ItemPrice_Arr.Count: integer;
begin
  Result := length(FItemPrice_Arr);
end;

function _ItemPrice_Arr.Get(Index: integer): _ItemPrice;
begin
  if (Index<0) or (Index>high(FItemPrice_Arr)) then Result := nil
  else Result := FItemPrice_Arr[Index];
end;


{ _ItemPrice }

constructor _ItemPrice.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := _Items.Create(Self);
end;

destructor _ItemPrice.Destroy;
begin
  FItems.Destroy;
  inherited;
end;

procedure _ItemPrice.Reset;
begin
  FPriceId := 0;
  FItems.Reset;
  FServiceId := 0;
  FPrice := 0.0;
  FDisableDate := 0;
  FDateInsert := 0;
  FUserInsert := '';
  FUserEdit := '';
  FDateEdit := 0;
end;

procedure _ItemPrice.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Item_Price (Item_Id,Service_Id,Price,Disable_Date,Date_Insert,User_Insert,User_Edit,Date_Edit)'+
    ' VALUES ('+
      FormatSQLNumber(FItems.ItemId)+','+
      FormatSQLNumber(FServiceId)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLDateTime(FDisableDate)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _ItemPrice.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Item_Price SET'+
          ' Item_Id='+FormatSQLNumber(FItems.ItemId)+','+
          ' Service_Id='+FormatSQLNumber(FServiceId)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Disable_Date='+FormatSQLDateTime(FDisableDate)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Price_Id='+FormatSQLNumber(FPriceId)
  ); except raise; end;
end;

procedure _ItemPrice.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Item_Price'+
    ' WHERE Price_Id='+FormatSQLNumber(FPriceId)
  ); except raise; end;
end;


{ _ItemPricePurchase_Arr }

constructor _ItemPricePurchase_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FItemPricePurchase_Arr,0);
end;

destructor _ItemPricePurchase_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _ItemPricePurchase_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FItemPricePurchase_Arr) do FItemPricePurchase_Arr[i].Destroy;
  setLength(FItemPricePurchase_Arr,0);
end;

function _ItemPricePurchase_Arr.Add(APricePurchaseId: integer; AItemId: integer; APrice: currency; ADisableDate: TDateTime; ADateInsert: TDateTime; AUserInsert: string; AUserEdit: string; ADateEdit: TDateTime): integer;
begin
  setLength(FItemPricePurchase_Arr, length(FItemPricePurchase_Arr)+1);
  Result := high(FItemPricePurchase_Arr);
  FItemPricePurchase_Arr[Result] := _ItemPricePurchase.Create(Self);
  FItemPricePurchase_Arr[Result].PricePurchaseId := APricePurchaseId;
  FItemPricePurchase_Arr[Result].Items.ItemId := AItemId;
  FItemPricePurchase_Arr[Result].Price := APrice;
  FItemPricePurchase_Arr[Result].DisableDate := ADisableDate;
  FItemPricePurchase_Arr[Result].DateInsert := ADateInsert;
  FItemPricePurchase_Arr[Result].UserInsert := AUserInsert;
  FItemPricePurchase_Arr[Result].UserEdit := AUserEdit;
  FItemPricePurchase_Arr[Result].DateEdit := ADateEdit;
end;

procedure _ItemPricePurchase_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FItemPricePurchase_Arr)) then Exit;
  FItemPricePurchase_Arr[Index].Destroy;
  for i:=Index to high(FItemPricePurchase_Arr)-1 do
    FItemPricePurchase_Arr[Index] := FItemPricePurchase_Arr[Index-1];
  setLength(FItemPricePurchase_Arr,length(FItemPricePurchase_Arr)-1);
end;

function _ItemPricePurchase_Arr.Count: integer;
begin
  Result := length(FItemPricePurchase_Arr);
end;

function _ItemPricePurchase_Arr.Get(Index: integer): _ItemPricePurchase;
begin
  if (Index<0) or (Index>high(FItemPricePurchase_Arr)) then Result := nil
  else Result := FItemPricePurchase_Arr[Index];
end;


{ _ItemPricePurchase }

constructor _ItemPricePurchase.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := _Items.Create(Self);
end;

destructor _ItemPricePurchase.Destroy;
begin
  FItems.Destroy;
  inherited;
end;

procedure _ItemPricePurchase.Reset;
begin
  FPricePurchaseId := 0;
  FItems.Reset;
  FPrice := 0.0;
  FDisableDate := 0;
  FDateInsert := 0;
  FUserInsert := '';
  FUserEdit := '';
  FDateEdit := 0;
end;

procedure _ItemPricePurchase.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Item_Price_Purchase (Item_Id,Price,Disable_Date,Date_Insert,User_Insert,User_Edit,Date_Edit)'+
    ' VALUES ('+
      FormatSQLNumber(FItems.ItemId)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLDateTime(FDisableDate)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _ItemPricePurchase.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Item_Price_Purchase SET'+
          ' Price_Purchase_Id='+FormatSQLNumber(FPricePurchaseId)+','+
          ' Item_Id='+FormatSQLNumber(FItems.ItemId)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Disable_Date='+FormatSQLDateTime(FDisableDate)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ''
  ); except raise; end;
end;

procedure _ItemPricePurchase.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Item_Price_Purchase'+
    ''
  ); except raise; end;
end;


{ _Warehouse_Arr }

constructor _Warehouse_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FWarehouse_Arr,0);
end;

destructor _Warehouse_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Warehouse_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FWarehouse_Arr) do FWarehouse_Arr[i].Destroy;
  setLength(FWarehouse_Arr,0);
end;

function _Warehouse_Arr.Add(AWhId: integer; AWhCode: string; AWhName: string; AIsActive: boolean; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer;
begin
  setLength(FWarehouse_Arr, length(FWarehouse_Arr)+1);
  Result := high(FWarehouse_Arr);
  FWarehouse_Arr[Result] := _Warehouse.Create(Self);
  FWarehouse_Arr[Result].WhId := AWhId;
  FWarehouse_Arr[Result].WhCode := AWhCode;
  FWarehouse_Arr[Result].WhName := AWhName;
  FWarehouse_Arr[Result].IsActive := AIsActive;
  FWarehouse_Arr[Result].UserInsert := AUserInsert;
  FWarehouse_Arr[Result].UserEdit := AUserEdit;
  FWarehouse_Arr[Result].DateInsert := ADateInsert;
  FWarehouse_Arr[Result].DateEdit := ADateEdit;
end;

function _Warehouse_Arr.IndexOf(AWhId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FWarehouse_Arr)) and (not found) do
    if (FWarehouse_Arr[i].FWhId=AWhId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Warehouse_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FWarehouse_Arr)) then Exit;
  FWarehouse_Arr[Index].Destroy;
  for i:=Index to high(FWarehouse_Arr)-1 do
    FWarehouse_Arr[Index] := FWarehouse_Arr[Index-1];
  setLength(FWarehouse_Arr,length(FWarehouse_Arr)-1);
end;

function _Warehouse_Arr.Count: integer;
begin
  Result := length(FWarehouse_Arr);
end;

function _Warehouse_Arr.Get(Index: integer): _Warehouse;
begin
  if (Index<0) or (Index>high(FWarehouse_Arr)) then Result := nil
  else Result := FWarehouse_Arr[Index];
end;


{ _Warehouse }

constructor _Warehouse.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _Warehouse.Destroy;
begin
  inherited;
end;

procedure _Warehouse.Reset;
begin
  FWhId := 0;
  FWhCode := '';
  FWhName := '';
  FIsActive := false;
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
end;

procedure _Warehouse.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Warehouse (Wh_Code,Wh_Name,Is_Active,User_Insert,User_Edit,Date_Insert,Date_Edit)'+
    ' VALUES ('+
      FormatSQLString(FWhCode)+','+
      FormatSQLString(FWhName)+','+
      FormatSQLBoolean(FIsActive)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _Warehouse.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Warehouse SET'+
          ' Wh_Code='+FormatSQLString(FWhCode)+','+
          ' Wh_Name='+FormatSQLString(FWhName)+','+
          ' Is_Active='+FormatSQLBoolean(FIsActive)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Wh_Id='+FormatSQLNumber(FWhId)
  ); except raise; end;
end;

procedure _Warehouse.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Warehouse'+
    ' WHERE Wh_Id='+FormatSQLNumber(FWhId)
  ); except raise; end;
end;

function _Warehouse.SelectInDB(AWhId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT W.Wh_Id, W.Wh_Code, W.Wh_Name, W.Is_Active, W.User_Insert, W.User_Edit, W.Date_Insert, W.Date_Edit'+
     ' FROM Warehouse W'+
    ' WHERE W.Wh_Id='+FormatSQLNumber(AWhId)
  );
  if (buffer.RecordCount<>0) then begin
    FWhId := BufferToInteger(buffer.Fields[0].Value);
    FWhCode := BufferToString(buffer.Fields[1].Value);
    FWhName := BufferToString(buffer.Fields[2].Value);
    FIsActive := BufferToBoolean(buffer.Fields[3].Value);
    FUserInsert := BufferToString(buffer.Fields[4].Value);
    FUserEdit := BufferToString(buffer.Fields[5].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[6].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[7].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Warehouse.ExistInDB(AWhId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Warehouse'+
    ' WHERE Wh_Id='+FormatSQLNumber(AWhId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _Services_Arr }

constructor _Services_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FServices_Arr,0);
end;

destructor _Services_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Services_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FServices_Arr) do FServices_Arr[i].Destroy;
  setLength(FServices_Arr,0);
end;

function _Services_Arr.Add(AServiceId: integer; AServiceCode: string; AServiceType: string; AServiceName: string; APrice: real; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer;
begin
  setLength(FServices_Arr, length(FServices_Arr)+1);
  Result := high(FServices_Arr);
  FServices_Arr[Result] := _Services.Create(Self);
  FServices_Arr[Result].ServiceId := AServiceId;
  FServices_Arr[Result].ServiceCode := AServiceCode;
  FServices_Arr[Result].ServiceType := AServiceType;
  FServices_Arr[Result].ServiceName := AServiceName;
  FServices_Arr[Result].Price := APrice;
  FServices_Arr[Result].Notes := ANotes;
  FServices_Arr[Result].UserInsert := AUserInsert;
  FServices_Arr[Result].UserEdit := AUserEdit;
  FServices_Arr[Result].DateInsert := ADateInsert;
  FServices_Arr[Result].DateEdit := ADateEdit;
end;

function _Services_Arr.IndexOf(AServiceId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FServices_Arr)) and (not found) do
    if (FServices_Arr[i].FServiceId=AServiceId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Services_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FServices_Arr)) then Exit;
  FServices_Arr[Index].Destroy;
  for i:=Index to high(FServices_Arr)-1 do
    FServices_Arr[Index] := FServices_Arr[Index-1];
  setLength(FServices_Arr,length(FServices_Arr)-1);
end;

function _Services_Arr.Count: integer;
begin
  Result := length(FServices_Arr);
end;

function _Services_Arr.Get(Index: integer): _Services;
begin
  if (Index<0) or (Index>high(FServices_Arr)) then Result := nil
  else Result := FServices_Arr[Index];
end;


{ _Services }

constructor _Services.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _Services.Destroy;
begin
  inherited;
end;

procedure _Services.Reset;
begin
  FServiceId := 0;
  FServiceCode := '';
  FServiceType := '';
  FServiceName := '';
  FPrice := 0.0;
  FNotes := '';
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
end;

procedure _Services.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Services (Service_Code,Service_Type,Service_Name,Price,Notes,User_Insert,User_Edit,Date_Insert,Date_Edit)'+
    ' VALUES ('+
      FormatSQLString(FServiceCode)+','+
      FormatSQLString(FServiceType)+','+
      FormatSQLString(FServiceName)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _Services.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Services SET'+
          ' Service_Code='+FormatSQLString(FServiceCode)+','+
          ' Service_Type='+FormatSQLString(FServiceType)+','+
          ' Service_Name='+FormatSQLString(FServiceName)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Service_Id='+FormatSQLNumber(FServiceId)
  ); except raise; end;
end;

procedure _Services.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Services'+
    ' WHERE Service_Id='+FormatSQLNumber(FServiceId)
  ); except raise; end;
end;

function _Services.SelectInDB(AServiceId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT S.Service_Id, S.Service_Code, S.Service_Type, S.Service_Name, S.Price, S.Notes, S.User_Insert, S.User_Edit, S.Date_Insert, S.Date_Edit'+
     ' FROM Services S'+
    ' WHERE S.Service_Id='+FormatSQLNumber(AServiceId)
  );
  if (buffer.RecordCount<>0) then begin
    FServiceId := BufferToInteger(buffer.Fields[0].Value);
    FServiceCode := BufferToString(buffer.Fields[1].Value);
    FServiceType := BufferToString(buffer.Fields[2].Value);
    FServiceName := BufferToString(buffer.Fields[3].Value);
    FPrice := BufferToFloat(buffer.Fields[4].Value);
    FNotes := BufferToString(buffer.Fields[5].Value);
    FUserInsert := BufferToString(buffer.Fields[6].Value);
    FUserEdit := BufferToString(buffer.Fields[7].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[8].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[9].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Services.ExistInDB(AServiceId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Services'+
    ' WHERE Service_Id='+FormatSQLNumber(AServiceId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _ServicePackage_Arr }

constructor _ServicePackage_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FServicePackage_Arr,0);
end;

destructor _ServicePackage_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _ServicePackage_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FServicePackage_Arr) do FServicePackage_Arr[i].Destroy;
  setLength(FServicePackage_Arr,0);
end;

function _ServicePackage_Arr.Add(APkgId: integer; AServiceId: integer; AItemId: integer; APrice: currency; AQuantity: real; AServiceParent: integer; ANotes: string): integer;
begin
  setLength(FServicePackage_Arr, length(FServicePackage_Arr)+1);
  Result := high(FServicePackage_Arr);
  FServicePackage_Arr[Result] := _ServicePackage.Create(Self);
  FServicePackage_Arr[Result].PkgId := APkgId;
  FServicePackage_Arr[Result].Services.ServiceId := AServiceId;
  FServicePackage_Arr[Result].Items.ItemId := AItemId;
  FServicePackage_Arr[Result].Price := APrice;
  FServicePackage_Arr[Result].Quantity := AQuantity;
  FServicePackage_Arr[Result].ServiceParent := AServiceParent;
  FServicePackage_Arr[Result].Notes := ANotes;
end;

function _ServicePackage_Arr.IndexOf(APkgId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FServicePackage_Arr)) and (not found) do
    if (FServicePackage_Arr[i].FPkgId=APkgId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _ServicePackage_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FServicePackage_Arr)) then Exit;
  FServicePackage_Arr[Index].Destroy;
  for i:=Index to high(FServicePackage_Arr)-1 do
    FServicePackage_Arr[Index] := FServicePackage_Arr[Index-1];
  setLength(FServicePackage_Arr,length(FServicePackage_Arr)-1);
end;

function _ServicePackage_Arr.Count: integer;
begin
  Result := length(FServicePackage_Arr);
end;

function _ServicePackage_Arr.Get(Index: integer): _ServicePackage;
begin
  if (Index<0) or (Index>high(FServicePackage_Arr)) then Result := nil
  else Result := FServicePackage_Arr[Index];
end;


{ _ServicePackage }

constructor _ServicePackage.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FServices := _Services.Create(Self);
  FItems := _Items.Create(Self);
end;

destructor _ServicePackage.Destroy;
begin
  FServices.Destroy;
  FItems.Destroy;
  inherited;
end;

procedure _ServicePackage.Reset;
begin
  FPkgId := 0;
  FServices.Reset;
  FItems.Reset;
  FPrice := 0.0;
  FQuantity := 0.0;
  FServiceParent := 0;
  FNotes := '';
end;

procedure _ServicePackage.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Service_Package (Service_Id,Item_Id,Price,Quantity,Service_Parent,Notes)'+
    ' VALUES ('+
      FormatSQLNumber(FServices.ServiceId)+','+
      FormatSQLNumber(FItems.ItemId)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FQuantity)+','+
      FormatSQLNumber(FServiceParent)+','+
      FormatSQLString(FNotes)+')'
  ); except raise; end;
end;

procedure _ServicePackage.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Service_Package SET'+
          ' Service_Id='+FormatSQLNumber(FServices.ServiceId)+','+
          ' Item_Id='+FormatSQLNumber(FItems.ItemId)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Quantity='+FormatSQLNumber(FQuantity)+','+
          ' Service_Parent='+FormatSQLNumber(FServiceParent)+','+
          ' Notes='+FormatSQLString(FNotes)+
    ' WHERE Pkg_Id='+FormatSQLNumber(FPkgId)
  ); except raise; end;
end;

procedure _ServicePackage.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Service_Package'+
    ' WHERE Pkg_Id='+FormatSQLNumber(FPkgId)
  ); except raise; end;
end;


{ _CompanyProfile_Arr }

constructor _CompanyProfile_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FCompanyProfile_Arr,0);
end;

destructor _CompanyProfile_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _CompanyProfile_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FCompanyProfile_Arr) do FCompanyProfile_Arr[i].Destroy;
  setLength(FCompanyProfile_Arr,0);
end;

function _CompanyProfile_Arr.Add(ACompanyName: string; AAddress: string; ATelp1: string; ATelp2: string; AFax: string; ACity: string; ABranch: string; AInfo: string): integer;
begin
  setLength(FCompanyProfile_Arr, length(FCompanyProfile_Arr)+1);
  Result := high(FCompanyProfile_Arr);
  FCompanyProfile_Arr[Result] := _CompanyProfile.Create(Self);
  FCompanyProfile_Arr[Result].CompanyName := ACompanyName;
  FCompanyProfile_Arr[Result].Address := AAddress;
  FCompanyProfile_Arr[Result].Telp1 := ATelp1;
  FCompanyProfile_Arr[Result].Telp2 := ATelp2;
  FCompanyProfile_Arr[Result].Fax := AFax;
  FCompanyProfile_Arr[Result].City := ACity;
  FCompanyProfile_Arr[Result].Branch := ABranch;
  FCompanyProfile_Arr[Result].Info := AInfo;
end;

procedure _CompanyProfile_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FCompanyProfile_Arr)) then Exit;
  FCompanyProfile_Arr[Index].Destroy;
  for i:=Index to high(FCompanyProfile_Arr)-1 do
    FCompanyProfile_Arr[Index] := FCompanyProfile_Arr[Index-1];
  setLength(FCompanyProfile_Arr,length(FCompanyProfile_Arr)-1);
end;

function _CompanyProfile_Arr.Count: integer;
begin
  Result := length(FCompanyProfile_Arr);
end;

function _CompanyProfile_Arr.Get(Index: integer): _CompanyProfile;
begin
  if (Index<0) or (Index>high(FCompanyProfile_Arr)) then Result := nil
  else Result := FCompanyProfile_Arr[Index];
end;


{ _CompanyProfile }

constructor _CompanyProfile.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _CompanyProfile.Destroy;
begin
  inherited;
end;

procedure _CompanyProfile.Reset;
begin
  FCompanyName := '';
  FAddress := '';
  FTelp1 := '';
  FTelp2 := '';
  FFax := '';
  FCity := '';
  FBranch := '';
  FInfo := '';
end;

procedure _CompanyProfile.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Company_Profile (Company_Name,Address,Telp1,Telp2,Fax,City,Branch,Info)'+
    ' VALUES ('+
      FormatSQLString(FCompanyName)+','+
      FormatSQLString(FAddress)+','+
      FormatSQLString(FTelp1)+','+
      FormatSQLString(FTelp2)+','+
      FormatSQLString(FFax)+','+
      FormatSQLString(FCity)+','+
      FormatSQLString(FBranch)+','+
      FormatSQLString(FInfo)+')'
  ); except raise; end;
end;

procedure _CompanyProfile.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Company_Profile SET'+
          ' Company_Name='+FormatSQLString(FCompanyName)+','+
          ' Address='+FormatSQLString(FAddress)+','+
          ' Telp1='+FormatSQLString(FTelp1)+','+
          ' Telp2='+FormatSQLString(FTelp2)+','+
          ' Fax='+FormatSQLString(FFax)+','+
          ' City='+FormatSQLString(FCity)+','+
          ' Branch='+FormatSQLString(FBranch)+','+
          ' Info='+FormatSQLString(FInfo)+
    ''
  ); except raise; end;
end;

procedure _CompanyProfile.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Company_Profile'+
    ''
  ); except raise; end;
end;


{ _Motor_Arr }

constructor _Motor_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FMotor_Arr,0);
end;

destructor _Motor_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Motor_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FMotor_Arr) do FMotor_Arr[i].Destroy;
  setLength(FMotor_Arr,0);
end;

function _Motor_Arr.Add(AMotorId: integer; AMotorType: string; AMotorCode: string; AMotorName: string; AMotorYear: integer; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer;
begin
  setLength(FMotor_Arr, length(FMotor_Arr)+1);
  Result := high(FMotor_Arr);
  FMotor_Arr[Result] := _Motor.Create(Self);
  FMotor_Arr[Result].MotorId := AMotorId;
  FMotor_Arr[Result].MotorType := AMotorType;
  FMotor_Arr[Result].MotorCode := AMotorCode;
  FMotor_Arr[Result].MotorName := AMotorName;
  FMotor_Arr[Result].MotorYear := AMotorYear;
  FMotor_Arr[Result].UserInsert := AUserInsert;
  FMotor_Arr[Result].UserEdit := AUserEdit;
  FMotor_Arr[Result].DateInsert := ADateInsert;
  FMotor_Arr[Result].DateEdit := ADateEdit;
end;

function _Motor_Arr.IndexOf(AMotorId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FMotor_Arr)) and (not found) do
    if (FMotor_Arr[i].FMotorId=AMotorId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Motor_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FMotor_Arr)) then Exit;
  FMotor_Arr[Index].Destroy;
  for i:=Index to high(FMotor_Arr)-1 do
    FMotor_Arr[Index] := FMotor_Arr[Index-1];
  setLength(FMotor_Arr,length(FMotor_Arr)-1);
end;

function _Motor_Arr.Count: integer;
begin
  Result := length(FMotor_Arr);
end;

function _Motor_Arr.Get(Index: integer): _Motor;
begin
  if (Index<0) or (Index>high(FMotor_Arr)) then Result := nil
  else Result := FMotor_Arr[Index];
end;


{ _Motor }

constructor _Motor.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _Motor.Destroy;
begin
  inherited;
end;

procedure _Motor.Reset;
begin
  FMotorId := 0;
  FMotorType := '';
  FMotorCode := '';
  FMotorName := '';
  FMotorYear := 0;
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
end;

procedure _Motor.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Motor (Motor_Type,Motor_Code,Motor_Name,Motor_Year,User_Insert,User_Edit,Date_Insert,Date_Edit)'+
    ' VALUES ('+
      FormatSQLString(FMotorType)+','+
      FormatSQLString(FMotorCode)+','+
      FormatSQLString(FMotorName)+','+
      FormatSQLNumber(FMotorYear)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _Motor.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Motor SET'+
          ' Motor_Type='+FormatSQLString(FMotorType)+','+
          ' Motor_Code='+FormatSQLString(FMotorCode)+','+
          ' Motor_Name='+FormatSQLString(FMotorName)+','+
          ' Motor_Year='+FormatSQLNumber(FMotorYear)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Motor_Id='+FormatSQLNumber(FMotorId)
  ); except raise; end;
end;

procedure _Motor.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Motor'+
    ' WHERE Motor_Id='+FormatSQLNumber(FMotorId)
  ); except raise; end;
end;

function _Motor.SelectInDB(AMotorId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT M.Motor_Id, M.Motor_Type, M.Motor_Code, M.Motor_Name, M.Motor_Year, M.User_Insert, M.User_Edit, M.Date_Insert, M.Date_Edit'+
     ' FROM Motor M'+
    ' WHERE M.Motor_Id='+FormatSQLNumber(AMotorId)
  );
  if (buffer.RecordCount<>0) then begin
    FMotorId := BufferToInteger(buffer.Fields[0].Value);
    FMotorType := BufferToString(buffer.Fields[1].Value);
    FMotorCode := BufferToString(buffer.Fields[2].Value);
    FMotorName := BufferToString(buffer.Fields[3].Value);
    FMotorYear := BufferToInteger(buffer.Fields[4].Value);
    FUserInsert := BufferToString(buffer.Fields[5].Value);
    FUserEdit := BufferToString(buffer.Fields[6].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[7].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[8].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Motor.ExistInDB(AMotorId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Motor'+
    ' WHERE Motor_Id='+FormatSQLNumber(AMotorId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _Persons_Arr }

constructor _Persons_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FPersons_Arr,0);
end;

destructor _Persons_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Persons_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FPersons_Arr) do FPersons_Arr[i].Destroy;
  setLength(FPersons_Arr,0);
end;

function _Persons_Arr.Add(APersonId: integer; APersonCode: string; APersonType: string; APersonName: string; AMotorId: integer; AAddress: string; ACity: string; APostalCode: string; ABirthDate: TDateTime; AIdNum: string; APhone1: string; APhone2: string; APhone3: string; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime; AMtrYear: integer; AMtrRangka: string; AMtrMesin: string): integer;
begin
  setLength(FPersons_Arr, length(FPersons_Arr)+1);
  Result := high(FPersons_Arr);
  FPersons_Arr[Result] := _Persons.Create(Self);
  FPersons_Arr[Result].PersonId := APersonId;
  FPersons_Arr[Result].PersonCode := APersonCode;
  FPersons_Arr[Result].PersonType := APersonType;
  FPersons_Arr[Result].PersonName := APersonName;
  FPersons_Arr[Result].Motor.MotorId := AMotorId;
  FPersons_Arr[Result].Address := AAddress;
  FPersons_Arr[Result].City := ACity;
  FPersons_Arr[Result].PostalCode := APostalCode;
  FPersons_Arr[Result].BirthDate := ABirthDate;
  FPersons_Arr[Result].IdNum := AIdNum;
  FPersons_Arr[Result].Phone1 := APhone1;
  FPersons_Arr[Result].Phone2 := APhone2;
  FPersons_Arr[Result].Phone3 := APhone3;
  FPersons_Arr[Result].Notes := ANotes;
  FPersons_Arr[Result].UserInsert := AUserInsert;
  FPersons_Arr[Result].UserEdit := AUserEdit;
  FPersons_Arr[Result].DateInsert := ADateInsert;
  FPersons_Arr[Result].DateEdit := ADateEdit;
  FPersons_Arr[Result].MtrYear := AMtrYear;
  FPersons_Arr[Result].MtrRangka := AMtrRangka;
  FPersons_Arr[Result].MtrMesin := AMtrMesin;
end;

function _Persons_Arr.IndexOf(APersonId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FPersons_Arr)) and (not found) do
    if (FPersons_Arr[i].FPersonId=APersonId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Persons_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FPersons_Arr)) then Exit;
  FPersons_Arr[Index].Destroy;
  for i:=Index to high(FPersons_Arr)-1 do
    FPersons_Arr[Index] := FPersons_Arr[Index-1];
  setLength(FPersons_Arr,length(FPersons_Arr)-1);
end;

function _Persons_Arr.Count: integer;
begin
  Result := length(FPersons_Arr);
end;

function _Persons_Arr.Get(Index: integer): _Persons;
begin
  if (Index<0) or (Index>high(FPersons_Arr)) then Result := nil
  else Result := FPersons_Arr[Index];
end;


{ _Persons }

constructor _Persons.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FMotor := _Motor.Create(Self);
end;

destructor _Persons.Destroy;
begin
  FMotor.Destroy;
  inherited;
end;

procedure _Persons.Reset;
begin
  FPersonId := 0;
  FPersonCode := '';
  FPersonType := '';
  FPersonName := '';
  FMotor.Reset;
  FAddress := '';
  FCity := '';
  FPostalCode := '';
  FBirthDate := 0;
  FIdNum := '';
  FPhone1 := '';
  FPhone2 := '';
  FPhone3 := '';
  FNotes := '';
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
  FMtrYear := 0;
  FMtrRangka := '';
  FMtrMesin := '';
end;

procedure _Persons.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Persons (Person_Code,Person_Type,Person_Name,Motor_Id,Address,City,Postal_Code,Birth_Date,Id_Num,Phone1,Phone2,Phone3,Notes,User_Insert,User_Edit,Date_Insert,Date_Edit,Mtr_Year,Mtr_Rangka,'+
    'Mtr_Mesin)'+
    ' VALUES ('+
      FormatSQLString(FPersonCode)+','+
      FormatSQLString(FPersonType)+','+
      FormatSQLString(FPersonName)+','+
      FormatSQLNumber(FMotor.MotorId)+','+
      FormatSQLString(FAddress)+','+
      FormatSQLString(FCity)+','+
      FormatSQLString(FPostalCode)+','+
      FormatSQLDateTime(FBirthDate)+','+
      FormatSQLString(FIdNum)+','+
      FormatSQLString(FPhone1)+','+
      FormatSQLString(FPhone2)+','+
      FormatSQLString(FPhone3)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+','+
      FormatSQLNumber(FMtrYear)+','+
      FormatSQLString(FMtrRangka)+','+
      FormatSQLString(FMtrMesin)+')'
  ); except raise; end;
end;

procedure _Persons.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Persons SET'+
          ' Person_Code='+FormatSQLString(FPersonCode)+','+
          ' Person_Type='+FormatSQLString(FPersonType)+','+
          ' Person_Name='+FormatSQLString(FPersonName)+','+
          ' Motor_Id='+FormatSQLNumber(FMotor.MotorId)+','+
          ' Address='+FormatSQLString(FAddress)+','+
          ' City='+FormatSQLString(FCity)+','+
          ' Postal_Code='+FormatSQLString(FPostalCode)+','+
          ' Birth_Date='+FormatSQLDateTime(FBirthDate)+','+
          ' Id_Num='+FormatSQLString(FIdNum)+','+
          ' Phone1='+FormatSQLString(FPhone1)+','+
          ' Phone2='+FormatSQLString(FPhone2)+','+
          ' Phone3='+FormatSQLString(FPhone3)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+','+
          ' Mtr_Year='+FormatSQLNumber(FMtrYear)+','+
          ' Mtr_Rangka='+FormatSQLString(FMtrRangka)+','+
          ' Mtr_Mesin='+FormatSQLString(FMtrMesin)+
    ' WHERE Person_Id='+FormatSQLNumber(FPersonId)
  ); except raise; end;
end;

procedure _Persons.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Persons'+
    ' WHERE Person_Id='+FormatSQLNumber(FPersonId)
  ); except raise; end;
end;

function _Persons.SelectInDB(APersonId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Address, P.City, P.Postal_Code, P.Birth_Date, P.Id_Num, P.Phone1, P.Phone2, P.Phone3, P.Notes, P.User_Insert, P.User_Edit, P.Date_Insert, P.Date_Edit'+
         ', P.Mtr_Year, P.Mtr_Rangka, P.Mtr_Mesin'+
         ', M.Motor_Id, M.Motor_Type, M.Motor_Code, M.Motor_Name, M.Motor_Year, M.User_Insert, M.User_Edit, M.Date_Insert, M.Date_Edit'+
     ' FROM Persons P, Motor M'+
    ' WHERE P.Person_Id='+FormatSQLNumber(APersonId)+
      ' AND P.Motor_Id=M.Motor_Id(+)'
  );
  if (buffer.RecordCount<>0) then begin
    FPersonId := BufferToInteger(buffer.Fields[0].Value);
    FPersonCode := BufferToString(buffer.Fields[1].Value);
    FPersonType := BufferToString(buffer.Fields[2].Value);
    FPersonName := BufferToString(buffer.Fields[3].Value);
    FAddress := BufferToString(buffer.Fields[4].Value);
    FCity := BufferToString(buffer.Fields[5].Value);
    FPostalCode := BufferToString(buffer.Fields[6].Value);
    FBirthDate := BufferToDateTime(buffer.Fields[7].Value);
    FIdNum := BufferToString(buffer.Fields[8].Value);
    FPhone1 := BufferToString(buffer.Fields[9].Value);
    FPhone2 := BufferToString(buffer.Fields[10].Value);
    FPhone3 := BufferToString(buffer.Fields[11].Value);
    FNotes := BufferToString(buffer.Fields[12].Value);
    FUserInsert := BufferToString(buffer.Fields[13].Value);
    FUserEdit := BufferToString(buffer.Fields[14].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[15].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[16].Value);
    FMtrYear := BufferToInteger(buffer.Fields[17].Value);
    FMtrRangka := BufferToString(buffer.Fields[18].Value);
    FMtrMesin := BufferToString(buffer.Fields[19].Value);
    FMotor.MotorId := BufferToInteger(buffer.Fields[20].Value);
    FMotor.MotorType := BufferToString(buffer.Fields[21].Value);
    FMotor.MotorCode := BufferToString(buffer.Fields[22].Value);
    FMotor.MotorName := BufferToString(buffer.Fields[23].Value);
    FMotor.MotorYear := BufferToInteger(buffer.Fields[24].Value);
    FMotor.UserInsert := BufferToString(buffer.Fields[25].Value);
    FMotor.UserEdit := BufferToString(buffer.Fields[26].Value);
    FMotor.DateInsert := BufferToDateTime(buffer.Fields[27].Value);
    FMotor.DateEdit := BufferToDateTime(buffer.Fields[28].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Persons.ExistInDB(APersonId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Persons'+
    ' WHERE Person_Id='+FormatSQLNumber(APersonId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _Account_Arr }

constructor _Account_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FAccount_Arr,0);
end;

destructor _Account_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Account_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FAccount_Arr) do FAccount_Arr[i].Destroy;
  setLength(FAccount_Arr,0);
end;

function _Account_Arr.Add(AAccId: integer; AAccType: string; AAccCode: string; AAccName: string; ADbCrType: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdt: TDateTime): integer;
begin
  setLength(FAccount_Arr, length(FAccount_Arr)+1);
  Result := high(FAccount_Arr);
  FAccount_Arr[Result] := _Account.Create(Self);
  FAccount_Arr[Result].AccId := AAccId;
  FAccount_Arr[Result].AccType := AAccType;
  FAccount_Arr[Result].AccCode := AAccCode;
  FAccount_Arr[Result].AccName := AAccName;
  FAccount_Arr[Result].DbCrType := ADbCrType;
  FAccount_Arr[Result].UserInsert := AUserInsert;
  FAccount_Arr[Result].UserEdit := AUserEdit;
  FAccount_Arr[Result].DateInsert := ADateInsert;
  FAccount_Arr[Result].DateEdt := ADateEdt;
end;

function _Account_Arr.IndexOf(AAccId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FAccount_Arr)) and (not found) do
    if (FAccount_Arr[i].FAccId=AAccId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Account_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FAccount_Arr)) then Exit;
  FAccount_Arr[Index].Destroy;
  for i:=Index to high(FAccount_Arr)-1 do
    FAccount_Arr[Index] := FAccount_Arr[Index-1];
  setLength(FAccount_Arr,length(FAccount_Arr)-1);
end;

function _Account_Arr.Count: integer;
begin
  Result := length(FAccount_Arr);
end;

function _Account_Arr.Get(Index: integer): _Account;
begin
  if (Index<0) or (Index>high(FAccount_Arr)) then Result := nil
  else Result := FAccount_Arr[Index];
end;


{ _Account }

constructor _Account.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _Account.Destroy;
begin
  inherited;
end;

procedure _Account.Reset;
begin
  FAccId := 0;
  FAccType := '';
  FAccCode := '';
  FAccName := '';
  FDbCrType := '';
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdt := 0;
end;

procedure _Account.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Account (Acc_Type,Acc_Code,Acc_Name,Db_Cr_Type,User_Insert,User_Edit,Date_Insert,Date_Edt)'+
    ' VALUES ('+
      FormatSQLString(FAccType)+','+
      FormatSQLString(FAccCode)+','+
      FormatSQLString(FAccName)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdt)+')'
  ); except raise; end;
end;

procedure _Account.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Account SET'+
          ' Acc_Type='+FormatSQLString(FAccType)+','+
          ' Acc_Code='+FormatSQLString(FAccCode)+','+
          ' Acc_Name='+FormatSQLString(FAccName)+','+
          ' Db_Cr_Type='+FormatSQLString(FDbCrType)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edt='+FormatSQLDateTime(FDateEdt)+
    ' WHERE Acc_Id='+FormatSQLNumber(FAccId)
  ); except raise; end;
end;

procedure _Account.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Account'+
    ' WHERE Acc_Id='+FormatSQLNumber(FAccId)
  ); except raise; end;
end;

function _Account.SelectInDB(AAccId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT A.Acc_Id, A.Acc_Type, A.Acc_Code, A.Acc_Name, A.Db_Cr_Type, A.User_Insert, A.User_Edit, A.Date_Insert, A.Date_Edt'+
     ' FROM Account A'+
    ' WHERE A.Acc_Id='+FormatSQLNumber(AAccId)
  );
  if (buffer.RecordCount<>0) then begin
    FAccId := BufferToInteger(buffer.Fields[0].Value);
    FAccType := BufferToString(buffer.Fields[1].Value);
    FAccCode := BufferToString(buffer.Fields[2].Value);
    FAccName := BufferToString(buffer.Fields[3].Value);
    FDbCrType := BufferToString(buffer.Fields[4].Value);
    FUserInsert := BufferToString(buffer.Fields[5].Value);
    FUserEdit := BufferToString(buffer.Fields[6].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[7].Value);
    FDateEdt := BufferToDateTime(buffer.Fields[8].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Account.ExistInDB(AAccId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Account'+
    ' WHERE Acc_Id='+FormatSQLNumber(AAccId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _Shipment_Arr }

constructor _Shipment_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FShipment_Arr,0);
end;

destructor _Shipment_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Shipment_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FShipment_Arr) do FShipment_Arr[i].Destroy;
  setLength(FShipment_Arr,0);
end;

function _Shipment_Arr.Add(AShipId: integer; AShipNum: string; AShipType: string; AShipDate: TDateTime; APersonId: integer; AMekanikId: integer; ANotes: string; ASubtotal: currency; ADiscount: currency; APpn: currency; ATotal: currency; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime; AShipIdUsed: integer; AWhId: integer; AWhIdOut: integer; AExprDate: TDateTime; AIsPost: boolean; AShipServiceType: string; ADownPayment: currency; ATglKirim: TDate; ATglSampai: TDate; ADeliveryNum: string): integer;
begin
  setLength(FShipment_Arr, length(FShipment_Arr)+1);
  Result := high(FShipment_Arr);
  FShipment_Arr[Result] := _Shipment.Create(Self);
  FShipment_Arr[Result].ShipId := AShipId;
  FShipment_Arr[Result].ShipNum := AShipNum;
  FShipment_Arr[Result].ShipType := AShipType;
  FShipment_Arr[Result].ShipDate := AShipDate;
  FShipment_Arr[Result].Persons.PersonId := APersonId;
  FShipment_Arr[Result].PersonsMekanik_Id.PersonId := AMekanikId;
  FShipment_Arr[Result].Notes := ANotes;
  FShipment_Arr[Result].Subtotal := ASubtotal;
  FShipment_Arr[Result].Discount := ADiscount;
  FShipment_Arr[Result].Ppn := APpn;
  FShipment_Arr[Result].Total := ATotal;
  FShipment_Arr[Result].UserInsert := AUserInsert;
  FShipment_Arr[Result].UserEdit := AUserEdit;
  FShipment_Arr[Result].DateInsert := ADateInsert;
  FShipment_Arr[Result].DateEdit := ADateEdit;
  FShipment_Arr[Result].ShipIdUsed := AShipIdUsed;
  FShipment_Arr[Result].Warehouse.WhId := AWhId;
  FShipment_Arr[Result].WhIdOut := AWhIdOut;
  FShipment_Arr[Result].ExprDate := AExprDate;
  FShipment_Arr[Result].IsPost := AIsPost;
  FShipment_Arr[Result].ShipServiceType := AShipServiceType;
  FShipment_Arr[Result].DownPayment := ADownPayment;
  FShipment_Arr[Result].TglKirim := ATglKirim;
  FShipment_Arr[Result].TglSampai := ATglSampai;
  FShipment_Arr[Result].DeliveryNum := ADeliveryNum;
end;

function _Shipment_Arr.IndexOf(AShipId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FShipment_Arr)) and (not found) do
    if (FShipment_Arr[i].FShipId=AShipId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Shipment_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FShipment_Arr)) then Exit;
  FShipment_Arr[Index].Destroy;
  for i:=Index to high(FShipment_Arr)-1 do
    FShipment_Arr[Index] := FShipment_Arr[Index-1];
  setLength(FShipment_Arr,length(FShipment_Arr)-1);
end;

function _Shipment_Arr.Count: integer;
begin
  Result := length(FShipment_Arr);
end;

function _Shipment_Arr.Get(Index: integer): _Shipment;
begin
  if (Index<0) or (Index>high(FShipment_Arr)) then Result := nil
  else Result := FShipment_Arr[Index];
end;


{ _Shipment }

constructor _Shipment.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FPersons := _Persons.Create(Self);
  FPersonsMekanik_Id := _Persons.Create(Self);
  FWarehouse := _Warehouse.Create(Self);
end;

destructor _Shipment.Destroy;
begin
  FPersons.Destroy;
  FPersonsMekanik_Id.Destroy;
  FWarehouse.Destroy;
  inherited;
end;

procedure _Shipment.Reset;
begin
  FShipId := 0;
  FShipNum := '';
  FShipType := '';
  FShipDate := 0;
  FPersons.Reset;
  FPersonsMekanik_Id.Reset;
  FNotes := '';
  FSubtotal := 0.0;
  FDiscount := 0.0;
  FPpn := 0.0;
  FTotal := 0.0;
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
  FShipIdUsed := 0;
  FWarehouse.Reset;
  FWhIdOut := 0;
  FExprDate := 0;
  FIsPost := false;
  FShipServiceType := '';
  FDownPayment := 0.0;
  FTglKirim := 0;
  FTglSampai := 0;
  FDeliveryNum := '';
end;

procedure _Shipment.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Shipment (Ship_Num,Ship_Type,Ship_Date,Person_Id,Mekanik_Id,Notes,Subtotal,Discount,Ppn,Total,User_Insert,User_Edit,Date_Insert,Date_Edit,Ship_Id_Used,Wh_Id,Wh_Id_Out,Expr_Date,Is_Post,Ship_Service_Type,'+
    'Down_Payment,Tgl_Kirim,Tgl_Sampai,Delivery_Num)'+
    ' VALUES ('+
      FormatSQLString(FShipNum)+','+
      FormatSQLString(FShipType)+','+
      FormatSQLDateTime(FShipDate)+','+
      FormatSQLNumber(FPersons.PersonId)+','+
      FormatSQLNumber(FPersonsMekanik_Id.PersonId)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLNumber(FSubtotal)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FPpn)+','+
      FormatSQLNumber(FTotal)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+','+
      FormatSQLNumber(FShipIdUsed)+','+
      FormatSQLNumber(FWarehouse.WhId)+','+
      FormatSQLNumber(FWhIdOut)+','+
      FormatSQLDateTime(FExprDate)+','+
      FormatSQLBoolean(FIsPost)+','+
      FormatSQLString(FShipServiceType)+','+
      FormatSQLNumber(FDownPayment)+','+
      FormatSQLDate(FTglKirim)+','+
      FormatSQLDate(FTglSampai)+','+
      FormatSQLString(FDeliveryNum)+')'
  ); except raise; end;
end;

procedure _Shipment.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Shipment SET'+
          ' Ship_Num='+FormatSQLString(FShipNum)+','+
          ' Ship_Type='+FormatSQLString(FShipType)+','+
          ' Ship_Date='+FormatSQLDateTime(FShipDate)+','+
          ' Person_Id='+FormatSQLNumber(FPersons.PersonId)+','+
          ' Mekanik_Id='+FormatSQLNumber(FPersonsMekanik_Id.PersonId)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' Subtotal='+FormatSQLNumber(FSubtotal)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Ppn='+FormatSQLNumber(FPpn)+','+
          ' Total='+FormatSQLNumber(FTotal)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+','+
          ' Ship_Id_Used='+FormatSQLNumber(FShipIdUsed)+','+
          ' Wh_Id='+FormatSQLNumber(FWarehouse.WhId)+','+
          ' Wh_Id_Out='+FormatSQLNumber(FWhIdOut)+','+
          ' Expr_Date='+FormatSQLDateTime(FExprDate)+','+
          ' Is_Post='+FormatSQLBoolean(FIsPost)+','+
          ' Ship_Service_Type='+FormatSQLString(FShipServiceType)+','+
          ' Down_Payment='+FormatSQLNumber(FDownPayment)+','+
          ' Tgl_Kirim='+FormatSQLDate(FTglKirim)+','+
          ' Tgl_Sampai='+FormatSQLDate(FTglSampai)+','+
          ' Delivery_Num='+FormatSQLString(FDeliveryNum)+
    ' WHERE Ship_Id='+FormatSQLNumber(FShipId)
  ); except raise; end;
end;

procedure _Shipment.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Shipment'+
    ' WHERE Ship_Id='+FormatSQLNumber(FShipId)
  ); except raise; end;
end;

function _Shipment.SelectInDB(AShipId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT S.Ship_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date, S.Notes, S.Subtotal, S.Discount, S.Ppn, S.Total, S.User_Insert, S.User_Edit, S.Date_Insert, S.Date_Edit, S.Ship_Id_Used, S.Wh_Id_Out, S.Expr_Date, S.Is_Post'+
         ', S.Ship_Service_Type, S.Down_Payment, S.Tgl_Kirim, S.Tgl_Sampai, S.Delivery_Num'+
         ', P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Motor_Id, P.Address, P.City, P.Postal_Code, P.Birth_Date, P.Id_Num, P.Phone1, P.Phone2, P.Phone3, P.Notes, P.User_Insert, P.User_Edit, P.Date_Insert'+
         ', P.Date_Edit, P.Mtr_Year, P.Mtr_Rangka, P.Mtr_Mesin'+
         ', P.Person_Id, P.Person_Code, P.Person_Type, P.Person_Name, P.Motor_Id, P.Address, P.City, P.Postal_Code, P.Birth_Date, P.Id_Num, P.Phone1, P.Phone2, P.Phone3, P.Notes, P.User_Insert, P.User_Edit, P.Date_Insert'+
         ', P.Date_Edit, P.Mtr_Year, P.Mtr_Rangka, P.Mtr_Mesin'+
         ', W.Wh_Id, W.Wh_Code, W.Wh_Name, W.Is_Active, W.User_Insert, W.User_Edit, W.Date_Insert, W.Date_Edit'+
     ' FROM Shipment S, Persons P, Persons P, Warehouse W'+
    ' WHERE S.Ship_Id='+FormatSQLNumber(AShipId)+
      ' AND S.Person_Id=P.Person_Id(+)'+
      ' AND S.Mekanik_Id=P.Person_Id(+)'+
      ' AND S.Wh_Id=W.Wh_Id(+)'
  );
  if (buffer.RecordCount<>0) then begin
    FShipId := BufferToInteger(buffer.Fields[0].Value);
    FShipNum := BufferToString(buffer.Fields[1].Value);
    FShipType := BufferToString(buffer.Fields[2].Value);
    FShipDate := BufferToDateTime(buffer.Fields[3].Value);
    FNotes := BufferToString(buffer.Fields[4].Value);
    FSubtotal := BufferToFloat(buffer.Fields[5].Value);
    FDiscount := BufferToFloat(buffer.Fields[6].Value);
    FPpn := BufferToFloat(buffer.Fields[7].Value);
    FTotal := BufferToFloat(buffer.Fields[8].Value);
    FUserInsert := BufferToString(buffer.Fields[9].Value);
    FUserEdit := BufferToString(buffer.Fields[10].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[11].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[12].Value);
    FShipIdUsed := BufferToInteger(buffer.Fields[13].Value);
    FWhIdOut := BufferToInteger(buffer.Fields[14].Value);
    FExprDate := BufferToDateTime(buffer.Fields[15].Value);
    FIsPost := BufferToBoolean(buffer.Fields[16].Value);
    FShipServiceType := BufferToString(buffer.Fields[17].Value);
    FDownPayment := BufferToFloat(buffer.Fields[18].Value);
    FTglKirim := BufferToDateTime(buffer.Fields[19].Value);
    FTglSampai := BufferToDateTime(buffer.Fields[20].Value);
    FDeliveryNum := BufferToString(buffer.Fields[21].Value);
    FPersons.PersonId := BufferToInteger(buffer.Fields[22].Value);
    FPersons.PersonCode := BufferToString(buffer.Fields[23].Value);
    FPersons.PersonType := BufferToString(buffer.Fields[24].Value);
    FPersons.PersonName := BufferToString(buffer.Fields[25].Value);
    FPersons.Motor.MotorId := BufferToInteger(buffer.Fields[26].Value);
    FPersons.Address := BufferToString(buffer.Fields[27].Value);
    FPersons.City := BufferToString(buffer.Fields[28].Value);
    FPersons.PostalCode := BufferToString(buffer.Fields[29].Value);
    FPersons.BirthDate := BufferToDateTime(buffer.Fields[30].Value);
    FPersons.IdNum := BufferToString(buffer.Fields[31].Value);
    FPersons.Phone1 := BufferToString(buffer.Fields[32].Value);
    FPersons.Phone2 := BufferToString(buffer.Fields[33].Value);
    FPersons.Phone3 := BufferToString(buffer.Fields[34].Value);
    FPersons.Notes := BufferToString(buffer.Fields[35].Value);
    FPersons.UserInsert := BufferToString(buffer.Fields[36].Value);
    FPersons.UserEdit := BufferToString(buffer.Fields[37].Value);
    FPersons.DateInsert := BufferToDateTime(buffer.Fields[38].Value);
    FPersons.DateEdit := BufferToDateTime(buffer.Fields[39].Value);
    FPersons.MtrYear := BufferToInteger(buffer.Fields[40].Value);
    FPersons.MtrRangka := BufferToString(buffer.Fields[41].Value);
    FPersons.MtrMesin := BufferToString(buffer.Fields[42].Value);
    FPersons.PersonId := BufferToInteger(buffer.Fields[43].Value);
    FPersons.PersonCode := BufferToString(buffer.Fields[44].Value);
    FPersons.PersonType := BufferToString(buffer.Fields[45].Value);
    FPersons.PersonName := BufferToString(buffer.Fields[46].Value);
    FPersons.Motor.MotorId := BufferToInteger(buffer.Fields[47].Value);
    FPersons.Address := BufferToString(buffer.Fields[48].Value);
    FPersons.City := BufferToString(buffer.Fields[49].Value);
    FPersons.PostalCode := BufferToString(buffer.Fields[50].Value);
    FPersons.BirthDate := BufferToDateTime(buffer.Fields[51].Value);
    FPersons.IdNum := BufferToString(buffer.Fields[52].Value);
    FPersons.Phone1 := BufferToString(buffer.Fields[53].Value);
    FPersons.Phone2 := BufferToString(buffer.Fields[54].Value);
    FPersons.Phone3 := BufferToString(buffer.Fields[55].Value);
    FPersons.Notes := BufferToString(buffer.Fields[56].Value);
    FPersons.UserInsert := BufferToString(buffer.Fields[57].Value);
    FPersons.UserEdit := BufferToString(buffer.Fields[58].Value);
    FPersons.DateInsert := BufferToDateTime(buffer.Fields[59].Value);
    FPersons.DateEdit := BufferToDateTime(buffer.Fields[60].Value);
    FPersons.MtrYear := BufferToInteger(buffer.Fields[61].Value);
    FPersons.MtrRangka := BufferToString(buffer.Fields[62].Value);
    FPersons.MtrMesin := BufferToString(buffer.Fields[63].Value);
    FWarehouse.WhId := BufferToInteger(buffer.Fields[64].Value);
    FWarehouse.WhCode := BufferToString(buffer.Fields[65].Value);
    FWarehouse.WhName := BufferToString(buffer.Fields[66].Value);
    FWarehouse.IsActive := BufferToBoolean(buffer.Fields[67].Value);
    FWarehouse.UserInsert := BufferToString(buffer.Fields[68].Value);
    FWarehouse.UserEdit := BufferToString(buffer.Fields[69].Value);
    FWarehouse.DateInsert := BufferToDateTime(buffer.Fields[70].Value);
    FWarehouse.DateEdit := BufferToDateTime(buffer.Fields[71].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Shipment.ExistInDB(AShipId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Shipment'+
    ' WHERE Ship_Id='+FormatSQLNumber(AShipId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _ServiceDetail_Arr }

constructor _ServiceDetail_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FServiceDetail_Arr,0);
end;

destructor _ServiceDetail_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _ServiceDetail_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FServiceDetail_Arr) do FServiceDetail_Arr[i].Destroy;
  setLength(FServiceDetail_Arr,0);
end;

function _ServiceDetail_Arr.Add(AServiceDetailId: integer; AShipId: integer; AServiceId: integer; AQuantity: real; APrice: currency; AAmount: currency; ANotes: string; ACharges: currency; ADiscount: real; AServiceParent: integer; AIsKsg: boolean): integer;
begin
  setLength(FServiceDetail_Arr, length(FServiceDetail_Arr)+1);
  Result := high(FServiceDetail_Arr);
  FServiceDetail_Arr[Result] := _ServiceDetail.Create(Self);
  FServiceDetail_Arr[Result].ServiceDetailId := AServiceDetailId;
  FServiceDetail_Arr[Result].Shipment.ShipId := AShipId;
  FServiceDetail_Arr[Result].Services.ServiceId := AServiceId;
  FServiceDetail_Arr[Result].Quantity := AQuantity;
  FServiceDetail_Arr[Result].Price := APrice;
  FServiceDetail_Arr[Result].Amount := AAmount;
  FServiceDetail_Arr[Result].Notes := ANotes;
  FServiceDetail_Arr[Result].Charges := ACharges;
  FServiceDetail_Arr[Result].Discount := ADiscount;
  FServiceDetail_Arr[Result].ServiceParent := AServiceParent;
  FServiceDetail_Arr[Result].IsKsg := AIsKsg;
end;

function _ServiceDetail_Arr.IndexOf(AServiceDetailId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FServiceDetail_Arr)) and (not found) do
    if (FServiceDetail_Arr[i].FServiceDetailId=AServiceDetailId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _ServiceDetail_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FServiceDetail_Arr)) then Exit;
  FServiceDetail_Arr[Index].Destroy;
  for i:=Index to high(FServiceDetail_Arr)-1 do
    FServiceDetail_Arr[Index] := FServiceDetail_Arr[Index-1];
  setLength(FServiceDetail_Arr,length(FServiceDetail_Arr)-1);
end;

function _ServiceDetail_Arr.Count: integer;
begin
  Result := length(FServiceDetail_Arr);
end;

function _ServiceDetail_Arr.Get(Index: integer): _ServiceDetail;
begin
  if (Index<0) or (Index>high(FServiceDetail_Arr)) then Result := nil
  else Result := FServiceDetail_Arr[Index];
end;


{ _ServiceDetail }

constructor _ServiceDetail.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FShipment := _Shipment.Create(Self);
  FServices := _Services.Create(Self);
end;

destructor _ServiceDetail.Destroy;
begin
  FShipment.Destroy;
  FServices.Destroy;
  inherited;
end;

procedure _ServiceDetail.Reset;
begin
  FServiceDetailId := 0;
  FShipment.Reset;
  FServices.Reset;
  FQuantity := 0.0;
  FPrice := 0.0;
  FAmount := 0.0;
  FNotes := '';
  FCharges := 0.0;
  FDiscount := 0.0;
  FServiceParent := 0;
  FIsKsg := false;
end;

procedure _ServiceDetail.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Service_Detail (Ship_Id,Service_Id,Quantity,Price,Amount,Notes,Charges,Discount,Service_Parent,Is_Ksg)'+
    ' VALUES ('+
      FormatSQLNumber(FShipment.ShipId)+','+
      FormatSQLNumber(FServices.ServiceId)+','+
      FormatSQLNumber(FQuantity)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FAmount)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLNumber(FCharges)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FServiceParent)+','+
      FormatSQLBoolean(FIsKsg)+')'
  ); except raise; end;
end;

procedure _ServiceDetail.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Service_Detail SET'+
          ' Ship_Id='+FormatSQLNumber(FShipment.ShipId)+','+
          ' Service_Id='+FormatSQLNumber(FServices.ServiceId)+','+
          ' Quantity='+FormatSQLNumber(FQuantity)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Amount='+FormatSQLNumber(FAmount)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' Charges='+FormatSQLNumber(FCharges)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Service_Parent='+FormatSQLNumber(FServiceParent)+','+
          ' Is_Ksg='+FormatSQLBoolean(FIsKsg)+
    ' WHERE Service_Detail_Id='+FormatSQLNumber(FServiceDetailId)
  ); except raise; end;
end;

procedure _ServiceDetail.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Service_Detail'+
    ' WHERE Service_Detail_Id='+FormatSQLNumber(FServiceDetailId)
  ); except raise; end;
end;


{ _ItemBalance_Arr }

constructor _ItemBalance_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FItemBalance_Arr,0);
end;

destructor _ItemBalance_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _ItemBalance_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FItemBalance_Arr) do FItemBalance_Arr[i].Destroy;
  setLength(FItemBalance_Arr,0);
end;

function _ItemBalance_Arr.Add(AItemBalanceId: integer; AItemId: integer; ABalanceDate: TDateTime; ABalance: real; ADbBalance: real; ACrBalance: real; APrice: real; ADateEdit: TDateTime): integer;
begin
  setLength(FItemBalance_Arr, length(FItemBalance_Arr)+1);
  Result := high(FItemBalance_Arr);
  FItemBalance_Arr[Result] := _ItemBalance.Create(Self);
  FItemBalance_Arr[Result].ItemBalanceId := AItemBalanceId;
  FItemBalance_Arr[Result].Items.ItemId := AItemId;
  FItemBalance_Arr[Result].BalanceDate := ABalanceDate;
  FItemBalance_Arr[Result].Balance := ABalance;
  FItemBalance_Arr[Result].DbBalance := ADbBalance;
  FItemBalance_Arr[Result].CrBalance := ACrBalance;
  FItemBalance_Arr[Result].Price := APrice;
  FItemBalance_Arr[Result].DateEdit := ADateEdit;
end;

function _ItemBalance_Arr.IndexOf(AItemBalanceId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FItemBalance_Arr)) and (not found) do
    if (FItemBalance_Arr[i].FItemBalanceId=AItemBalanceId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _ItemBalance_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FItemBalance_Arr)) then Exit;
  FItemBalance_Arr[Index].Destroy;
  for i:=Index to high(FItemBalance_Arr)-1 do
    FItemBalance_Arr[Index] := FItemBalance_Arr[Index-1];
  setLength(FItemBalance_Arr,length(FItemBalance_Arr)-1);
end;

function _ItemBalance_Arr.Count: integer;
begin
  Result := length(FItemBalance_Arr);
end;

function _ItemBalance_Arr.Get(Index: integer): _ItemBalance;
begin
  if (Index<0) or (Index>high(FItemBalance_Arr)) then Result := nil
  else Result := FItemBalance_Arr[Index];
end;


{ _ItemBalance }

constructor _ItemBalance.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := _Items.Create(Self);
end;

destructor _ItemBalance.Destroy;
begin
  FItems.Destroy;
  inherited;
end;

procedure _ItemBalance.Reset;
begin
  FItemBalanceId := 0;
  FItems.Reset;
  FBalanceDate := 0;
  FBalance := 0.0;
  FDbBalance := 0.0;
  FCrBalance := 0.0;
  FPrice := 0.0;
  FDateEdit := 0;
end;

procedure _ItemBalance.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Item_Balance (Item_Id,Balance_Date,Balance,Db_Balance,Cr_Balance,Price,Date_Edit)'+
    ' VALUES ('+
      FormatSQLNumber(FItems.ItemId)+','+
      FormatSQLDateTime(FBalanceDate)+','+
      FormatSQLNumber(FBalance)+','+
      FormatSQLNumber(FDbBalance)+','+
      FormatSQLNumber(FCrBalance)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _ItemBalance.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Item_Balance SET'+
          ' Item_Id='+FormatSQLNumber(FItems.ItemId)+','+
          ' Balance_Date='+FormatSQLDateTime(FBalanceDate)+','+
          ' Balance='+FormatSQLNumber(FBalance)+','+
          ' Db_Balance='+FormatSQLNumber(FDbBalance)+','+
          ' Cr_Balance='+FormatSQLNumber(FCrBalance)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Item_Balance_Id='+FormatSQLNumber(FItemBalanceId)
  ); except raise; end;
end;

procedure _ItemBalance.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Item_Balance'+
    ' WHERE Item_Balance_Id='+FormatSQLNumber(FItemBalanceId)
  ); except raise; end;
end;

function _ItemBalance.SelectInDB(AItemBalanceId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT IB.Item_Balance_Id, IB.Balance_Date, IB.Balance, IB.Db_Balance, IB.Cr_Balance, IB.Price, IB.Date_Edit'+
         ', I.Item_Id, I.Item_Code, I.Item_Type, I.Item_Name, I.Used_Unit, I.Purchase_Unit, I.Price, I.Conversion, I.Notes, I.User_Insert, I.User_Edit, I.Date_Insert, I.Date_Edit, I.Stok_Limit, I.Rank, I.Price_Purchase'+
     ' FROM Item_Balance IB, Items I'+
    ' WHERE IB.Item_Balance_Id='+FormatSQLNumber(AItemBalanceId)+
      ' AND IB.Item_Id=I.Item_Id'
  );
  if (buffer.RecordCount<>0) then begin
    FItemBalanceId := BufferToInteger(buffer.Fields[0].Value);
    FBalanceDate := BufferToDateTime(buffer.Fields[1].Value);
    FBalance := BufferToFloat(buffer.Fields[2].Value);
    FDbBalance := BufferToFloat(buffer.Fields[3].Value);
    FCrBalance := BufferToFloat(buffer.Fields[4].Value);
    FPrice := BufferToFloat(buffer.Fields[5].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[6].Value);
    FItems.ItemId := BufferToInteger(buffer.Fields[7].Value);
    FItems.ItemCode := BufferToString(buffer.Fields[8].Value);
    FItems.ItemType := BufferToString(buffer.Fields[9].Value);
    FItems.ItemName := BufferToString(buffer.Fields[10].Value);
    FItems.UsedUnit := BufferToString(buffer.Fields[11].Value);
    FItems.PurchaseUnit := BufferToString(buffer.Fields[12].Value);
    FItems.Price := BufferToFloat(buffer.Fields[13].Value);
    FItems.Conversion := BufferToFloat(buffer.Fields[14].Value);
    FItems.Notes := BufferToString(buffer.Fields[15].Value);
    FItems.UserInsert := BufferToString(buffer.Fields[16].Value);
    FItems.UserEdit := BufferToString(buffer.Fields[17].Value);
    FItems.DateInsert := BufferToDateTime(buffer.Fields[18].Value);
    FItems.DateEdit := BufferToDateTime(buffer.Fields[19].Value);
    FItems.StokLimit := BufferToInteger(buffer.Fields[20].Value);
    FItems.Rank := BufferToInteger(buffer.Fields[21].Value);
    FItems.PricePurchase := BufferToFloat(buffer.Fields[22].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _ItemBalance.ExistInDB(AItemBalanceId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Item_Balance'+
    ' WHERE Item_Balance_Id='+FormatSQLNumber(AItemBalanceId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _ItemDetail_Arr }

constructor _ItemDetail_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FItemDetail_Arr,0);
end;

destructor _ItemDetail_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _ItemDetail_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FItemDetail_Arr) do FItemDetail_Arr[i].Destroy;
  setLength(FItemDetail_Arr,0);
end;

function _ItemDetail_Arr.Add(AItemDetailId: integer; AItemBalanceId: integer; AQuantity: real; APrice: currency; AConversion: real; AAmount: currency; ADbCrType: string; AShipId: integer; ADiscount: real; AServiceParent: integer; AItemID: integer; ABalanceInConcerned: string; ARealValue: currency; AIsKsg: boolean): integer;
begin
  setLength(FItemDetail_Arr, length(FItemDetail_Arr)+1);
  Result := high(FItemDetail_Arr);
  FItemDetail_Arr[Result] := _ItemDetail.Create(Self);
  FItemDetail_Arr[Result].ItemDetailId := AItemDetailId;
  FItemDetail_Arr[Result].ItemBalance.ItemBalanceId := AItemBalanceId;
  FItemDetail_Arr[Result].Quantity := AQuantity;
  FItemDetail_Arr[Result].Price := APrice;
  FItemDetail_Arr[Result].Conversion := AConversion;
  FItemDetail_Arr[Result].Amount := AAmount;
  FItemDetail_Arr[Result].DbCrType := ADbCrType;
  FItemDetail_Arr[Result].Shipment.ShipId := AShipId;
  FItemDetail_Arr[Result].Discount := ADiscount;
  FItemDetail_Arr[Result].ServiceParent := AServiceParent;
  FItemDetail_Arr[Result].ItemID := AItemID;
  FItemDetail_Arr[Result].BalanceInConcerned := ABalanceInConcerned;
  FItemDetail_Arr[Result].RealValue := ARealValue;
  FItemDetail_Arr[Result].IsKsg := AIsKsg;
end;

function _ItemDetail_Arr.IndexOf(AItemDetailId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FItemDetail_Arr)) and (not found) do
    if (FItemDetail_Arr[i].FItemDetailId=AItemDetailId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _ItemDetail_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FItemDetail_Arr)) then Exit;
  FItemDetail_Arr[Index].Destroy;
  for i:=Index to high(FItemDetail_Arr)-1 do
    FItemDetail_Arr[Index] := FItemDetail_Arr[Index-1];
  setLength(FItemDetail_Arr,length(FItemDetail_Arr)-1);
end;

function _ItemDetail_Arr.Count: integer;
begin
  Result := length(FItemDetail_Arr);
end;

function _ItemDetail_Arr.Get(Index: integer): _ItemDetail;
begin
  if (Index<0) or (Index>high(FItemDetail_Arr)) then Result := nil
  else Result := FItemDetail_Arr[Index];
end;


{ _ItemDetail }

constructor _ItemDetail.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FItemBalance := _ItemBalance.Create(Self);
  FShipment := _Shipment.Create(Self);
end;

destructor _ItemDetail.Destroy;
begin
  FItemBalance.Destroy;
  FShipment.Destroy;
  inherited;
end;

procedure _ItemDetail.Reset;
begin
  FItemDetailId := 0;
  FItemBalance.Reset;
  FQuantity := 0.0;
  FPrice := 0.0;
  FConversion := 0.0;
  FAmount := 0.0;
  FDbCrType := '';
  FShipment.Reset;
  FDiscount := 0.0;
  FServiceParent := 0;
  FItemID := 0;
  FBalanceInConcerned := '';
  FRealValue := 0.0;
  FIsKsg := false;
end;

procedure _ItemDetail.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Item_Detail (Item_Balance_Id,Quantity,Price,Conversion,Amount,Db_Cr_Type,Ship_Id,Discount,Service_Parent,Item_ID,Balance_In_Concerned,Real_Value,Is_Ksg)'+
    ' VALUES ('+
      FormatSQLNumber(FItemBalance.ItemBalanceId)+','+
      FormatSQLNumber(FQuantity)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FConversion)+','+
      FormatSQLNumber(FAmount)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLNumber(FShipment.ShipId)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FServiceParent)+','+
      FormatSQLNumber(FItemID)+','+
      FormatSQLString(FBalanceInConcerned)+','+
      FormatSQLNumber(FRealValue)+','+
      FormatSQLBoolean(FIsKsg)+')'
  ); except raise; end;
end;

procedure _ItemDetail.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Item_Detail SET'+
          ' Item_Balance_Id='+FormatSQLNumber(FItemBalance.ItemBalanceId)+','+
          ' Quantity='+FormatSQLNumber(FQuantity)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Conversion='+FormatSQLNumber(FConversion)+','+
          ' Amount='+FormatSQLNumber(FAmount)+','+
          ' Db_Cr_Type='+FormatSQLString(FDbCrType)+','+
          ' Ship_Id='+FormatSQLNumber(FShipment.ShipId)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Service_Parent='+FormatSQLNumber(FServiceParent)+','+
          ' Item_ID='+FormatSQLNumber(FItemID)+','+
          ' Balance_In_Concerned='+FormatSQLString(FBalanceInConcerned)+','+
          ' Real_Value='+FormatSQLNumber(FRealValue)+','+
          ' Is_Ksg='+FormatSQLBoolean(FIsKsg)+
    ' WHERE Item_Detail_Id='+FormatSQLNumber(FItemDetailId)
  ); except raise; end;
end;

procedure _ItemDetail.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Item_Detail'+
    ' WHERE Item_Detail_Id='+FormatSQLNumber(FItemDetailId)
  ); except raise; end;
end;


{ _DummyItemDetail_Arr }

constructor _DummyItemDetail_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FDummyItemDetail_Arr,0);
end;

destructor _DummyItemDetail_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _DummyItemDetail_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FDummyItemDetail_Arr) do FDummyItemDetail_Arr[i].Destroy;
  setLength(FDummyItemDetail_Arr,0);
end;

function _DummyItemDetail_Arr.Add(ADumpId: integer; AShipId: integer; AItemId: integer; AServiceId: integer; AServiceParent: integer; ADbCrType: string; AQuantity: real; APrice: currency; ADiscount: currency; AAmount: currency; AIsKsg: boolean): integer;
begin
  setLength(FDummyItemDetail_Arr, length(FDummyItemDetail_Arr)+1);
  Result := high(FDummyItemDetail_Arr);
  FDummyItemDetail_Arr[Result] := _DummyItemDetail.Create(Self);
  FDummyItemDetail_Arr[Result].DumpId := ADumpId;
  FDummyItemDetail_Arr[Result].ShipId := AShipId;
  FDummyItemDetail_Arr[Result].Items.ItemId := AItemId;
  FDummyItemDetail_Arr[Result].Services.ServiceId := AServiceId;
  FDummyItemDetail_Arr[Result].ServiceParent := AServiceParent;
  FDummyItemDetail_Arr[Result].DbCrType := ADbCrType;
  FDummyItemDetail_Arr[Result].Quantity := AQuantity;
  FDummyItemDetail_Arr[Result].Price := APrice;
  FDummyItemDetail_Arr[Result].Discount := ADiscount;
  FDummyItemDetail_Arr[Result].Amount := AAmount;
  FDummyItemDetail_Arr[Result].IsKsg := AIsKsg;
end;

function _DummyItemDetail_Arr.IndexOf(ADumpId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FDummyItemDetail_Arr)) and (not found) do
    if (FDummyItemDetail_Arr[i].FDumpId=ADumpId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _DummyItemDetail_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FDummyItemDetail_Arr)) then Exit;
  FDummyItemDetail_Arr[Index].Destroy;
  for i:=Index to high(FDummyItemDetail_Arr)-1 do
    FDummyItemDetail_Arr[Index] := FDummyItemDetail_Arr[Index-1];
  setLength(FDummyItemDetail_Arr,length(FDummyItemDetail_Arr)-1);
end;

function _DummyItemDetail_Arr.Count: integer;
begin
  Result := length(FDummyItemDetail_Arr);
end;

function _DummyItemDetail_Arr.Get(Index: integer): _DummyItemDetail;
begin
  if (Index<0) or (Index>high(FDummyItemDetail_Arr)) then Result := nil
  else Result := FDummyItemDetail_Arr[Index];
end;


{ _DummyItemDetail }

constructor _DummyItemDetail.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := _Items.Create(Self);
  FServices := _Services.Create(Self);
end;

destructor _DummyItemDetail.Destroy;
begin
  FItems.Destroy;
  FServices.Destroy;
  inherited;
end;

procedure _DummyItemDetail.Reset;
begin
  FDumpId := 0;
  FShipId := 0;
  FItems.Reset;
  FServices.Reset;
  FServiceParent := 0;
  FDbCrType := '';
  FQuantity := 0.0;
  FPrice := 0.0;
  FDiscount := 0.0;
  FAmount := 0.0;
  FIsKsg := false;
end;

procedure _DummyItemDetail.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Dummy_Item_Detail (Ship_Id,Item_Id,Service_Id,Service_Parent,Db_Cr_Type,Quantity,Price,Discount,Amount,Is_Ksg)'+
    ' VALUES ('+
      FormatSQLNumber(FShipId)+','+
      FormatSQLNumber(FItems.ItemId)+','+
      FormatSQLNumber(FServices.ServiceId)+','+
      FormatSQLNumber(FServiceParent)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLNumber(FQuantity)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FAmount)+','+
      FormatSQLBoolean(FIsKsg)+')'
  ); except raise; end;
end;

procedure _DummyItemDetail.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Dummy_Item_Detail SET'+
          ' Ship_Id='+FormatSQLNumber(FShipId)+','+
          ' Item_Id='+FormatSQLNumber(FItems.ItemId)+','+
          ' Service_Id='+FormatSQLNumber(FServices.ServiceId)+','+
          ' Service_Parent='+FormatSQLNumber(FServiceParent)+','+
          ' Db_Cr_Type='+FormatSQLString(FDbCrType)+','+
          ' Quantity='+FormatSQLNumber(FQuantity)+','+
          ' Price='+FormatSQLNumber(FPrice)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Amount='+FormatSQLNumber(FAmount)+','+
          ' Is_Ksg='+FormatSQLBoolean(FIsKsg)+
    ' WHERE Dump_Id='+FormatSQLNumber(FDumpId)
  ); except raise; end;
end;

procedure _DummyItemDetail.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Dummy_Item_Detail'+
    ' WHERE Dump_Id='+FormatSQLNumber(FDumpId)
  ); except raise; end;
end;


{ _Payment_Arr }

constructor _Payment_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FPayment_Arr,0);
end;

destructor _Payment_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _Payment_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FPayment_Arr) do FPayment_Arr[i].Destroy;
  setLength(FPayment_Arr,0);
end;

function _Payment_Arr.Add(APaymentId: integer; APaymentType: string; APaymentDate: TDateTime; APaymentNum: string; ASubtotal: currency; ADiscount: currency; APpn: currency; ACharges: currency; ATotal: currency; ANotes: string; AUserInsert: string; AUserEdit: string; ADateInsert: TDateTime; ADateEdit: TDateTime): integer;
begin
  setLength(FPayment_Arr, length(FPayment_Arr)+1);
  Result := high(FPayment_Arr);
  FPayment_Arr[Result] := _Payment.Create(Self);
  FPayment_Arr[Result].PaymentId := APaymentId;
  FPayment_Arr[Result].PaymentType := APaymentType;
  FPayment_Arr[Result].PaymentDate := APaymentDate;
  FPayment_Arr[Result].PaymentNum := APaymentNum;
  FPayment_Arr[Result].Subtotal := ASubtotal;
  FPayment_Arr[Result].Discount := ADiscount;
  FPayment_Arr[Result].Ppn := APpn;
  FPayment_Arr[Result].Charges := ACharges;
  FPayment_Arr[Result].Total := ATotal;
  FPayment_Arr[Result].Notes := ANotes;
  FPayment_Arr[Result].UserInsert := AUserInsert;
  FPayment_Arr[Result].UserEdit := AUserEdit;
  FPayment_Arr[Result].DateInsert := ADateInsert;
  FPayment_Arr[Result].DateEdit := ADateEdit;
end;

function _Payment_Arr.IndexOf(APaymentId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FPayment_Arr)) and (not found) do
    if (FPayment_Arr[i].FPaymentId=APaymentId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _Payment_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FPayment_Arr)) then Exit;
  FPayment_Arr[Index].Destroy;
  for i:=Index to high(FPayment_Arr)-1 do
    FPayment_Arr[Index] := FPayment_Arr[Index-1];
  setLength(FPayment_Arr,length(FPayment_Arr)-1);
end;

function _Payment_Arr.Count: integer;
begin
  Result := length(FPayment_Arr);
end;

function _Payment_Arr.Get(Index: integer): _Payment;
begin
  if (Index<0) or (Index>high(FPayment_Arr)) then Result := nil
  else Result := FPayment_Arr[Index];
end;


{ _Payment }

constructor _Payment.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _Payment.Destroy;
begin
  inherited;
end;

procedure _Payment.Reset;
begin
  FPaymentId := 0;
  FPaymentType := '';
  FPaymentDate := 0;
  FPaymentNum := '';
  FSubtotal := 0.0;
  FDiscount := 0.0;
  FPpn := 0.0;
  FCharges := 0.0;
  FTotal := 0.0;
  FNotes := '';
  FUserInsert := '';
  FUserEdit := '';
  FDateInsert := 0;
  FDateEdit := 0;
end;

procedure _Payment.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Payment (Payment_Type,Payment_Date,Payment_Num,Subtotal,Discount,Ppn,Charges,Total,Notes,User_Insert,User_Edit,Date_Insert,Date_Edit)'+
    ' VALUES ('+
      FormatSQLString(FPaymentType)+','+
      FormatSQLDateTime(FPaymentDate)+','+
      FormatSQLString(FPaymentNum)+','+
      FormatSQLNumber(FSubtotal)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FPpn)+','+
      FormatSQLNumber(FCharges)+','+
      FormatSQLNumber(FTotal)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLString(FUserInsert)+','+
      FormatSQLString(FUserEdit)+','+
      FormatSQLDateTime(FDateInsert)+','+
      FormatSQLDateTime(FDateEdit)+')'
  ); except raise; end;
end;

procedure _Payment.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Payment SET'+
          ' Payment_Type='+FormatSQLString(FPaymentType)+','+
          ' Payment_Date='+FormatSQLDateTime(FPaymentDate)+','+
          ' Payment_Num='+FormatSQLString(FPaymentNum)+','+
          ' Subtotal='+FormatSQLNumber(FSubtotal)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Ppn='+FormatSQLNumber(FPpn)+','+
          ' Charges='+FormatSQLNumber(FCharges)+','+
          ' Total='+FormatSQLNumber(FTotal)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' User_Insert='+FormatSQLString(FUserInsert)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Insert='+FormatSQLDateTime(FDateInsert)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+
    ' WHERE Payment_Id='+FormatSQLNumber(FPaymentId)
  ); except raise; end;
end;

procedure _Payment.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Payment'+
    ' WHERE Payment_Id='+FormatSQLNumber(FPaymentId)
  ); except raise; end;
end;

function _Payment.SelectInDB(APaymentId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT P.Payment_Id, P.Payment_Type, P.Payment_Date, P.Payment_Num, P.Subtotal, P.Discount, P.Ppn, P.Charges, P.Total, P.Notes, P.User_Insert, P.User_Edit, P.Date_Insert, P.Date_Edit'+
     ' FROM Payment P'+
    ' WHERE P.Payment_Id='+FormatSQLNumber(APaymentId)
  );
  if (buffer.RecordCount<>0) then begin
    FPaymentId := BufferToInteger(buffer.Fields[0].Value);
    FPaymentType := BufferToString(buffer.Fields[1].Value);
    FPaymentDate := BufferToDateTime(buffer.Fields[2].Value);
    FPaymentNum := BufferToString(buffer.Fields[3].Value);
    FSubtotal := BufferToFloat(buffer.Fields[4].Value);
    FDiscount := BufferToFloat(buffer.Fields[5].Value);
    FPpn := BufferToFloat(buffer.Fields[6].Value);
    FCharges := BufferToFloat(buffer.Fields[7].Value);
    FTotal := BufferToFloat(buffer.Fields[8].Value);
    FNotes := BufferToString(buffer.Fields[9].Value);
    FUserInsert := BufferToString(buffer.Fields[10].Value);
    FUserEdit := BufferToString(buffer.Fields[11].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[12].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[13].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _Payment.ExistInDB(APaymentId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Payment'+
    ' WHERE Payment_Id='+FormatSQLNumber(APaymentId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _MoneyAccount_Arr }

constructor _MoneyAccount_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FMoneyAccount_Arr,0);
end;

destructor _MoneyAccount_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _MoneyAccount_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FMoneyAccount_Arr) do FMoneyAccount_Arr[i].Destroy;
  setLength(FMoneyAccount_Arr,0);
end;

function _MoneyAccount_Arr.Add(AMoneyId: integer; AMoneyCode: string; AMoneyName: string; AMoneyType: string; AMoneyOwner: string; AAccNum: string; ABankName: string; AUserId: string; ADateModify: TDateTime): integer;
begin
  setLength(FMoneyAccount_Arr, length(FMoneyAccount_Arr)+1);
  Result := high(FMoneyAccount_Arr);
  FMoneyAccount_Arr[Result] := _MoneyAccount.Create(Self);
  FMoneyAccount_Arr[Result].MoneyId := AMoneyId;
  FMoneyAccount_Arr[Result].MoneyCode := AMoneyCode;
  FMoneyAccount_Arr[Result].MoneyName := AMoneyName;
  FMoneyAccount_Arr[Result].MoneyType := AMoneyType;
  FMoneyAccount_Arr[Result].MoneyOwner := AMoneyOwner;
  FMoneyAccount_Arr[Result].AccNum := AAccNum;
  FMoneyAccount_Arr[Result].BankName := ABankName;
  FMoneyAccount_Arr[Result].UserId := AUserId;
  FMoneyAccount_Arr[Result].DateModify := ADateModify;
end;

function _MoneyAccount_Arr.IndexOf(AMoneyId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FMoneyAccount_Arr)) and (not found) do
    if (FMoneyAccount_Arr[i].FMoneyId=AMoneyId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _MoneyAccount_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FMoneyAccount_Arr)) then Exit;
  FMoneyAccount_Arr[Index].Destroy;
  for i:=Index to high(FMoneyAccount_Arr)-1 do
    FMoneyAccount_Arr[Index] := FMoneyAccount_Arr[Index-1];
  setLength(FMoneyAccount_Arr,length(FMoneyAccount_Arr)-1);
end;

function _MoneyAccount_Arr.Count: integer;
begin
  Result := length(FMoneyAccount_Arr);
end;

function _MoneyAccount_Arr.Get(Index: integer): _MoneyAccount;
begin
  if (Index<0) or (Index>high(FMoneyAccount_Arr)) then Result := nil
  else Result := FMoneyAccount_Arr[Index];
end;


{ _MoneyAccount }

constructor _MoneyAccount.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
end;

destructor _MoneyAccount.Destroy;
begin
  inherited;
end;

procedure _MoneyAccount.Reset;
begin
  FMoneyId := 0;
  FMoneyCode := '';
  FMoneyName := '';
  FMoneyType := '';
  FMoneyOwner := '';
  FAccNum := '';
  FBankName := '';
  FUserId := '';
  FDateModify := 0;
end;

procedure _MoneyAccount.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Money_Account (Money_Id,Money_Code,Money_Name,Money_Type,Money_Owner,Acc_Num,Bank_Name,User_Id,Date_Modify)'+
    ' VALUES ('+
      FormatSQLNumber(FMoneyId)+','+
      FormatSQLString(FMoneyCode)+','+
      FormatSQLString(FMoneyName)+','+
      FormatSQLString(FMoneyType)+','+
      FormatSQLString(FMoneyOwner)+','+
      FormatSQLString(FAccNum)+','+
      FormatSQLString(FBankName)+','+
      FormatSQLString(FUserId)+','+
      FormatSQLDateTime(FDateModify)+')'
  ); except raise; end;
end;

procedure _MoneyAccount.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Money_Account SET'+
          ' Money_Code='+FormatSQLString(FMoneyCode)+','+
          ' Money_Name='+FormatSQLString(FMoneyName)+','+
          ' Money_Type='+FormatSQLString(FMoneyType)+','+
          ' Money_Owner='+FormatSQLString(FMoneyOwner)+','+
          ' Acc_Num='+FormatSQLString(FAccNum)+','+
          ' Bank_Name='+FormatSQLString(FBankName)+','+
          ' User_Id='+FormatSQLString(FUserId)+','+
          ' Date_Modify='+FormatSQLDateTime(FDateModify)+
    ' WHERE Money_Id='+FormatSQLNumber(FMoneyId)
  ); except raise; end;
end;

procedure _MoneyAccount.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Money_Account'+
    ' WHERE Money_Id='+FormatSQLNumber(FMoneyId)
  ); except raise; end;
end;

function _MoneyAccount.SelectInDB(AMoneyId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT MA.Money_Id, MA.Money_Code, MA.Money_Name, MA.Money_Type, MA.Money_Owner, MA.Acc_Num, MA.Bank_Name, MA.User_Id, MA.Date_Modify'+
     ' FROM Money_Account MA'+
    ' WHERE MA.Money_Id='+FormatSQLNumber(AMoneyId)
  );
  if (buffer.RecordCount<>0) then begin
    FMoneyId := BufferToInteger(buffer.Fields[0].Value);
    FMoneyCode := BufferToString(buffer.Fields[1].Value);
    FMoneyName := BufferToString(buffer.Fields[2].Value);
    FMoneyType := BufferToString(buffer.Fields[3].Value);
    FMoneyOwner := BufferToString(buffer.Fields[4].Value);
    FAccNum := BufferToString(buffer.Fields[5].Value);
    FBankName := BufferToString(buffer.Fields[6].Value);
    FUserId := BufferToString(buffer.Fields[7].Value);
    FDateModify := BufferToDateTime(buffer.Fields[8].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _MoneyAccount.ExistInDB(AMoneyId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Money_Account'+
    ' WHERE Money_Id='+FormatSQLNumber(AMoneyId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _MoneyBalance_Arr }

constructor _MoneyBalance_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FMoneyBalance_Arr,0);
end;

destructor _MoneyBalance_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _MoneyBalance_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FMoneyBalance_Arr) do FMoneyBalance_Arr[i].Destroy;
  setLength(FMoneyBalance_Arr,0);
end;

function _MoneyBalance_Arr.Add(AMoneyBalanceId: integer; AMoneyId: integer; ABalanceDate: TDateTime; ABalance: currency; ADbBalance: currency; ACrBalance: currency; ADateModify: TDateTime): integer;
begin
  setLength(FMoneyBalance_Arr, length(FMoneyBalance_Arr)+1);
  Result := high(FMoneyBalance_Arr);
  FMoneyBalance_Arr[Result] := _MoneyBalance.Create(Self);
  FMoneyBalance_Arr[Result].MoneyBalanceId := AMoneyBalanceId;
  FMoneyBalance_Arr[Result].MoneyAccount.MoneyId := AMoneyId;
  FMoneyBalance_Arr[Result].BalanceDate := ABalanceDate;
  FMoneyBalance_Arr[Result].Balance := ABalance;
  FMoneyBalance_Arr[Result].DbBalance := ADbBalance;
  FMoneyBalance_Arr[Result].CrBalance := ACrBalance;
  FMoneyBalance_Arr[Result].DateModify := ADateModify;
end;

function _MoneyBalance_Arr.IndexOf(AMoneyBalanceId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FMoneyBalance_Arr)) and (not found) do
    if (FMoneyBalance_Arr[i].FMoneyBalanceId=AMoneyBalanceId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _MoneyBalance_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FMoneyBalance_Arr)) then Exit;
  FMoneyBalance_Arr[Index].Destroy;
  for i:=Index to high(FMoneyBalance_Arr)-1 do
    FMoneyBalance_Arr[Index] := FMoneyBalance_Arr[Index-1];
  setLength(FMoneyBalance_Arr,length(FMoneyBalance_Arr)-1);
end;

function _MoneyBalance_Arr.Count: integer;
begin
  Result := length(FMoneyBalance_Arr);
end;

function _MoneyBalance_Arr.Get(Index: integer): _MoneyBalance;
begin
  if (Index<0) or (Index>high(FMoneyBalance_Arr)) then Result := nil
  else Result := FMoneyBalance_Arr[Index];
end;


{ _MoneyBalance }

constructor _MoneyBalance.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FMoneyAccount := _MoneyAccount.Create(Self);
end;

destructor _MoneyBalance.Destroy;
begin
  FMoneyAccount.Destroy;
  inherited;
end;

procedure _MoneyBalance.Reset;
begin
  FMoneyBalanceId := 0;
  FMoneyAccount.Reset;
  FBalanceDate := 0;
  FBalance := 0.0;
  FDbBalance := 0.0;
  FCrBalance := 0.0;
  FDateModify := 0;
end;

procedure _MoneyBalance.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Money_Balance (Money_Id,Balance_Date,Balance,Db_Balance,Cr_Balance,Date_Modify)'+
    ' VALUES ('+
      FormatSQLNumber(FMoneyAccount.MoneyId)+','+
      FormatSQLDateTime(FBalanceDate)+','+
      FormatSQLNumber(FBalance)+','+
      FormatSQLNumber(FDbBalance)+','+
      FormatSQLNumber(FCrBalance)+','+
      FormatSQLDateTime(FDateModify)+')'
  ); except raise; end;
end;

procedure _MoneyBalance.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Money_Balance SET'+
          ' Money_Id='+FormatSQLNumber(FMoneyAccount.MoneyId)+','+
          ' Balance_Date='+FormatSQLDateTime(FBalanceDate)+','+
          ' Balance='+FormatSQLNumber(FBalance)+','+
          ' Db_Balance='+FormatSQLNumber(FDbBalance)+','+
          ' Cr_Balance='+FormatSQLNumber(FCrBalance)+','+
          ' Date_Modify='+FormatSQLDateTime(FDateModify)+
    ' WHERE Money_Balance_Id='+FormatSQLNumber(FMoneyBalanceId)
  ); except raise; end;
end;

procedure _MoneyBalance.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Money_Balance'+
    ' WHERE Money_Balance_Id='+FormatSQLNumber(FMoneyBalanceId)
  ); except raise; end;
end;

function _MoneyBalance.SelectInDB(AMoneyBalanceId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT MB.Money_Balance_Id, MB.Balance_Date, MB.Balance, MB.Db_Balance, MB.Cr_Balance, MB.Date_Modify'+
         ', MA.Money_Id, MA.Money_Code, MA.Money_Name, MA.Money_Type, MA.Money_Owner, MA.Acc_Num, MA.Bank_Name, MA.User_Id, MA.Date_Modify'+
     ' FROM Money_Balance MB, Money_Account MA'+
    ' WHERE MB.Money_Balance_Id='+FormatSQLNumber(AMoneyBalanceId)+
      ' AND MB.Money_Id=MA.Money_Id'
  );
  if (buffer.RecordCount<>0) then begin
    FMoneyBalanceId := BufferToInteger(buffer.Fields[0].Value);
    FBalanceDate := BufferToDateTime(buffer.Fields[1].Value);
    FBalance := BufferToFloat(buffer.Fields[2].Value);
    FDbBalance := BufferToFloat(buffer.Fields[3].Value);
    FCrBalance := BufferToFloat(buffer.Fields[4].Value);
    FDateModify := BufferToDateTime(buffer.Fields[5].Value);
    FMoneyAccount.MoneyId := BufferToInteger(buffer.Fields[6].Value);
    FMoneyAccount.MoneyCode := BufferToString(buffer.Fields[7].Value);
    FMoneyAccount.MoneyName := BufferToString(buffer.Fields[8].Value);
    FMoneyAccount.MoneyType := BufferToString(buffer.Fields[9].Value);
    FMoneyAccount.MoneyOwner := BufferToString(buffer.Fields[10].Value);
    FMoneyAccount.AccNum := BufferToString(buffer.Fields[11].Value);
    FMoneyAccount.BankName := BufferToString(buffer.Fields[12].Value);
    FMoneyAccount.UserId := BufferToString(buffer.Fields[13].Value);
    FMoneyAccount.DateModify := BufferToDateTime(buffer.Fields[14].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;
end;

class function _MoneyBalance.ExistInDB(AMoneyBalanceId: integer): integer;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT COUNT(*) FROM Money_Balance'+
    ' WHERE Money_Balance_Id='+FormatSQLNumber(AMoneyBalanceId)
  );
  Result := BufferToInteger(buffer.Fields[0].Value);
  buffer.Close;
end;

{ _MoneyTransaction_Arr }

constructor _MoneyTransaction_Arr.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  setLength(FMoneyTransaction_Arr,0);
end;

destructor _MoneyTransaction_Arr.Destroy;
begin
  Self.Clear;
  inherited;
end;

procedure _MoneyTransaction_Arr.Clear;
var i: integer;
begin
  for i:=0 to high(FMoneyTransaction_Arr) do FMoneyTransaction_Arr[i].Destroy;
  setLength(FMoneyTransaction_Arr,0);
end;

function _MoneyTransaction_Arr.Add(AMoneyTransId: integer; APaymentId: integer; AMoneyBalanceId: integer; ADbCrType: string; AAmount: currency; ANotes: string; AAccId: integer): integer;
begin
  setLength(FMoneyTransaction_Arr, length(FMoneyTransaction_Arr)+1);
  Result := high(FMoneyTransaction_Arr);
  FMoneyTransaction_Arr[Result] := _MoneyTransaction.Create(Self);
  FMoneyTransaction_Arr[Result].MoneyTransId := AMoneyTransId;
  FMoneyTransaction_Arr[Result].Payment.PaymentId := APaymentId;
  FMoneyTransaction_Arr[Result].MoneyBalance.MoneyBalanceId := AMoneyBalanceId;
  FMoneyTransaction_Arr[Result].DbCrType := ADbCrType;
  FMoneyTransaction_Arr[Result].Amount := AAmount;
  FMoneyTransaction_Arr[Result].Notes := ANotes;
  FMoneyTransaction_Arr[Result].Account.AccId := AAccId;
end;

function _MoneyTransaction_Arr.IndexOf(AMoneyTransId: integer): integer;
var i: integer; found: boolean;
begin
  i := 0; found := false;
  while (i<=high(FMoneyTransaction_Arr)) and (not found) do
    if (FMoneyTransaction_Arr[i].FMoneyTransId=AMoneyTransId) then
      found := true
    else inc(i);
  if (found) then
    Result := i
  else
    Result := -1;
end;

procedure _MoneyTransaction_Arr.Delete(Index: integer);
var i: integer;
begin
  if (Index<0) or (Index>high(FMoneyTransaction_Arr)) then Exit;
  FMoneyTransaction_Arr[Index].Destroy;
  for i:=Index to high(FMoneyTransaction_Arr)-1 do
    FMoneyTransaction_Arr[Index] := FMoneyTransaction_Arr[Index-1];
  setLength(FMoneyTransaction_Arr,length(FMoneyTransaction_Arr)-1);
end;

function _MoneyTransaction_Arr.Count: integer;
begin
  Result := length(FMoneyTransaction_Arr);
end;

function _MoneyTransaction_Arr.Get(Index: integer): _MoneyTransaction;
begin
  if (Index<0) or (Index>high(FMoneyTransaction_Arr)) then Result := nil
  else Result := FMoneyTransaction_Arr[Index];
end;


{ _MoneyTransaction }

constructor _MoneyTransaction.Create(AOwner: TObject);
begin
  inherited Create;
  FOwner := AOwner;
  FPayment := _Payment.Create(Self);
  FMoneyBalance := _MoneyBalance.Create(Self);
  FAccount := _Account.Create(Self);
end;

destructor _MoneyTransaction.Destroy;
begin
  FPayment.Destroy;
  FMoneyBalance.Destroy;
  FAccount.Destroy;
  inherited;
end;

procedure _MoneyTransaction.Reset;
begin
  FMoneyTransId := 0;
  FPayment.Reset;
  FMoneyBalance.Reset;
  FDbCrType := '';
  FAmount := 0.0;
  FNotes := '';
  FAccount.Reset;
end;

procedure _MoneyTransaction.InsertOnDB;
begin
  try myConnection.ExecSQL(
    'INSERT INTO Money_Transaction (Payment_Id,Money_Balance_Id,Db_Cr_Type,Amount,Notes,Acc_Id)'+
    ' VALUES ('+
      FormatSQLNumber(FPayment.PaymentId)+','+
      FormatSQLNumber(FMoneyBalance.MoneyBalanceId)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLNumber(FAmount)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLNumber(FAccount.AccId)+')'
  ); except raise; end;
end;

procedure _MoneyTransaction.UpdateOnDB;
begin
  try myConnection.ExecSQL(
    'UPDATE Money_Transaction SET'+
          ' Payment_Id='+FormatSQLNumber(FPayment.PaymentId)+','+
          ' Money_Balance_Id='+FormatSQLNumber(FMoneyBalance.MoneyBalanceId)+','+
          ' Db_Cr_Type='+FormatSQLString(FDbCrType)+','+
          ' Amount='+FormatSQLNumber(FAmount)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' Acc_Id='+FormatSQLNumber(FAccount.AccId)+
    ' WHERE Money_Trans_Id='+FormatSQLNumber(FMoneyTransId)
  ); except raise; end;
end;

procedure _MoneyTransaction.DeleteOnDB;
begin
  try myConnection.ExecSQL(
    'DELETE FROM Money_Transaction'+
    ' WHERE Money_Trans_Id='+FormatSQLNumber(FMoneyTransId)
  ); except raise; end;
end;


end.
