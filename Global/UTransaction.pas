unit UTransaction;
{******************************************}
{                                          }
{    Copyright(C) work@home                }
{                                          }
{           All rights reserved            }
{                                          }

{                                          }
{                                          }
{******************************************}
interface
uses
  Classes, Controls, SysUtils, ADODB, Math, strUtils,
  AutoBengkel, SqlServerConnections, Subroutines,UMaster;

type
  TShipment_Arr = class;
  TShipment = class;
  TShipmentMechanic_Arr = class;
  TShipmentMechanic = class;
  TItemBalance_Arr = class;
  TItemBalance = class;
  TItemDetail_Arr = class;
  TItemDetail = class;
  TServiceDetail_Arr = class;
  TServiceDetail = class;
  TDummyItemDetail_Arr = class;
  TDummyItemDetail = class;

  TShipment_Arr = class(_Shipment_Arr)
  protected
    FFilter : TItemDetail;
    FGBuffer : _Recordset;
  public
     constructor Create;
     destructor Destroy;override;
     function FindOnDb(AService2:string='';PostCriteria:Boolean=False):boolean;
     function FindOnDbEstimasi(AService2:string='';PostCriteria:Boolean=False):boolean;
     function FindKhusus():boolean;
     function FindKhususWithService():boolean;
     function FindKhususService(serviceId:integer):boolean;

     function FindLapClaim():boolean;
     function FindGlobalPart:boolean;
     function FindGlobalPartHistory:boolean;
     property Filter : TItemDetail read FFilter write FFilter;
     property GBuffer :_Recordset read FGBuffer write FGBuffer;
  end;

  TShipment = class(_Shipment)
  protected
    FServiceDetailArr : TServiceDetail_Arr;
    FItemDetailArr : TItemDetail_Arr;
    FMechanics : TShipmentMechanic_Arr;
    FDummyArr : tDummyItemDetail_Arr;
    //FTglKirim : TDate;
    //FTglSampai : TDate;
    //FDeliveryNum : string;
  public
    constructor Create;
    destructor Destroy;override;
    property ServiceDetailArr : TServiceDetail_Arr read FServiceDetailArr write FServiceDetailArr;
    property ItemDetailArr : TItemDetail_Arr read FItemDetailArr write FItemDetailArr;
    property DummyArr : TDummyItemDetail_Arr read FDummyArr write FDummyArr;
    property Mechanics : TShipmentMechanic_Arr read FMechanics write FMechanics;
   // property TglKirim : TDate  read FTglKirim write FTglKirim;
   // property TglSampai : TDate  read FTglSampai write FTglSampai;
   // property DeliveryNum : string read FDeliveryNum write FDeliveryNum;
    function InsertTerima(ADetail : TItemDetail_Arr):boolean;
    function UpdateTerima(ADetail : TItemDetail_Arr):boolean;
    function InsertService(EditMode:boolean=False):boolean;
    function InsertEstimasi(EditMode:boolean=False):boolean;

    function InsertMutasi(ADetail : TItemDetail_Arr):boolean;
    function InsertOpname(ADetail : TItemDetail_Arr):boolean;

    function SelectInDb(AShipId:integer):boolean;reintroduce;
    function SelectInDbEstimasi(AShipId:integer):boolean;
    //procedure Reset;override;
    class function getNewNumber(AShipType:string;ATransDate:TDate):string;
    class function getNewNumberService(AShipType,AServiceType:string;ATransDate:TDate):string;
    class function getNewNumberEstimasi(AShipType,AServiceType:string;ATransDate:TDate):string;
    class function PrefixOf(AShipType:string):string;
    class function getDesc(AShipType:string):string;
    class function getDescTransType(aShipType,aShipServType:string):string;
    class function getStatus(AShipId:integer):string;
    class function setCloseOrder(ARegId,aPaymentID,AShipID:integer):boolean;
    class function getIdFromNum(AShipNum:string):integer;
    class function getIdEstimasiFromNum(AShipNum:string):integer;
    class function getNumFromID(AShipId:integer):string;
    class procedure DeleteShipment(AShipId:integer);
    class procedure DeleteEstimasi(AShipId:integer);
    class function getValueItemType(AFieldName:string;APeriode : TPeriode;aShipType,aItemType:string;aMekanikId:integer=0;aShipServType:string='';aPostCriterian:TBooleanOperator=boTrue):Double;
    //tidak ada pemisahan ship_service_type = nilai piutang adalah tipe ksg
    class function getValueItemType2(AFieldName:string;APeriode : TPeriode;aShipType,aItemType:string;aMekanikId:integer=0;
        aPostCriterian:TBooleanOperator=boTrue;isPiutang:boolean=False;WIthDP : boolean=False):Double;
     //fungsi getItemValue2 + ship_service/sales_type
    class function getValueItemType3(AFieldName:string;APeriode : TPeriode;aShipType,aItemType,aShipServType:string;aMekanikId:integer=0;
        aPostCriterian:TBooleanOperator=boTrue;isPiutang:boolean=False;WIthDP : boolean=False):Double;
    class function getValueAll(AFieldName:string;APeriode : TPeriode;aShipType:string;isHeaderOnly:boolean=False;aPostCriteria:TBooleanOperator=boTrue):Double;
    class function getValueShipField(AFieldName:string;APeriode : TPeriode;aShipType:string;isHeaderOnly:boolean=False;aPostCriteria:TBooleanOperator=boTrue):Double;
    class function setPost(AShipID:integer):Boolean;
    class function isPosted(AShipId:integer):boolean;
    class function getUnitMotor(aMotorId:integer;AShipServType:string=''):Integer;
    class function getTotalMotor(aMotorId:integer;AShipServType:string=''):Double;
    //nyrari info transaksi yg menjadikan paramater menjadi ship_id_used nya
    class function getTransRefDesc(AShipId:integer):string;
    //cari nama mekanik dari ship_seq_used sebuah transaksi
    class function getMekanikFromIdRetur(AIdRetur:integer):string;
    //cari nomor transaksi dari ship_seq_used sebuah transaksi
    class function getShipNumRefFromId(AIdRetur:integer):string;
  end;

  TItemBalance_Arr = class(_ItemBalance_Arr)
  private
    FFilter : TItemBalance;
  public
    constructor Create;
    destructor Destroy;override;
    function FindStokValue(aZeroSTok:TBooleanOperator=boNone;WIthBalanceDate:boolean=True):boolean;
    property Filter : TItemBalance read FFilter write  FFilter;
  end;

  TItemBalance = class(_ItemBalance)
  public
    class function getNilaiPersediaan(aItemId: integer;
  aPeriode: TPeriode;WithBalanceDate:boolean=False): Double;
  end;

  TItemDetail_Arr = class(_ItemDetail_Arr)
  protected
    function get(Index:integer):TItemDetail;reintroduce;virtual;
    function New:TItemDetail;
  private
    FFilter : TItemDetail;
  public
    constructor Create;
    destructor Destroy;override;
    property ItemDetail_Arr[index:integer] : TItemDetail read get;default;
    function FindOnDB(AShipSeq:integer):boolean;
    function FindOnDBEstimasi(AShipSeq:integer):boolean;
    function FindKartuStok:boolean;
    function FindRekapStok:boolean;
    function FindRekapStokNew(WithStokZero:boolean=True;limit:integer=25;offset:integer=0):boolean;
    function countFindRekapStokNew(WithStokZero:boolean=True):integer;
    function FindRekapitulasi(vPostCriteria:TBooleanOperator=boNone):boolean;
    property Filter : TItemDetail read FFilter write FFilter;
    class function getPersediaan(isAwal,isAkhir:boolean;Periode:TPeriode):Double;

    class function getPembelian(Periode:TPeriode):Double;
  end;

  TItemDetail = class(_ItemDetail)
  public
    class function getHpp(aPeriode: TPeriode;ASHipType: string): Double;

  end;

  TShipmentMechanic = class(_ShipmentMechanic)
  public

  end;

  TShipmentMechanic_Arr = class(_ShipmentMechanic_Arr)
  protected
    function get(Index:integer):TShipmentMechanic;reintroduce;virtual;
    function New:TShipmentMechanic;
  private
    FFilter : TShipmentMechanic;
  public
    constructor Create;
    destructor Destroy;override;
    property ShipmentMechanic_Arr[index:integer] : TShipmentMechanic read get;default;
    function FindOnDB(AShipSeq:integer):boolean;
    class function getMechanic(AShipSeq:integer):string;
    property Filter : TShipmentMechanic read FFilter write FFilter;
  end;

  TServiceDetail_Arr = class(_ServiceDetail_Arr)
  private
    FFilter : TServiceDetail;
  protected

    function get(index:integer):TServiceDetail;reintroduce;virtual;
    function New:TServiceDetail;

  public
    constructor Create;
    destructor Destroy;override;
    function FindOnDb(AShipID:integer):boolean;
    function FindOnDbEstimasi(AShipID:integer):boolean;
    function FindRekapitulasi(aPostCriteria:TBooleanOperator=boNone):boolean;
    property Filter : TServiceDetail read FFilter write FFilter;
    property ServiceDetail_Arr[index : integer] : TServiceDetail read get;default;
  end;

  TServiceDetail = class(_ServiceDetail)
  public

    procedure InsertOnDb;reintroduce;
    procedure InsertOnDbEstimasi;
    
  end;

  TDummyItemDetail_Arr = class(_DummyItemDetail_Arr)
  protected
    function get(Index:integer):TDummyItemDetail;reintroduce;virtual;
    function New:TDummyItemDetail;
  private
    FFilter : TDummyItemDetail;
  public
    constructor Create;
    destructor Destroy;override;
    property DummyItemDetail_Arr[index:integer] : TDummyItemDetail read get;default;
    function FindOnDB(AShipID:integer):boolean;
    property Filter : TDummyItemDetail read FFilter write FFilter;
  end;

  TDummyItemDetail = class(_DummyItemDetail)
  public
    function InsertOnDb:boolean;reintroduce;
    class function DeleteDummy(AShipId:integer):boolean;
  end;

implementation

uses UConst, un_ryu, ADOInt;

{ TShipment }

constructor TShipment.Create;
begin
  inherited Create;
  FServiceDetailArr := TServiceDetail_Arr.Create;
  FItemDetailArr := TItemDetail_Arr.Create;
  FDummyArr := TDummyItemDetail_Arr.Create;
  FMechanics := TShipmentMechanic_Arr.Create;
end;

class procedure TShipment.DeleteEstimasi(AShipId: integer);
var //Sql : string;
   vShipment : TShipment;
   i:integer;
begin
  vShipment := TShipment.Create;
  try

    if not vShipment.SelectInDbEstimasi(AShipId) then begin
      Alert(MSG_NO_DATA_FOUND);
      vShipment.Free;
      exit;
    end;


  {  if getTransRefDesc(vShipment.ShipId) <> '' then begin
       Alert('Transaksi tidak bisa dihapus karena menjadi referensi transaksi-transaksi berikut : '+#13+
            getTransRefDesc(vShipment.ShipId)+#13+#13+
            'Solusi : Hapus dulu transaksi-transaksi yg mereferensi ke transaksi ini.');
       vShipment.Free;
       Exit;
    end;}

   // vShipment.FItemDetailArr.FindOnDBEstimasi(AShipId);
    MyConnection.BeginSQL;
    MyConnection.ExecSQL('delete from estimasi_service_detail where estimasi_id='+FormatSQLNumber(AShipId));
    MyConnection.ExecSQL('delete from estimasi_detail where estimasi_id='+FormatSQLNumber(AShipId));
    MyConnection.ExecSQL('delete from estimasi where estimasi_id='+FormatSQLNumber(AShipId));

   // vShipment.DeleteEstimasi(AShipId);
    MyConnection.EndSQL;
    Inform(MSG_SUCCESS_DELETING);
  except
    Alert(MSG_UNSUCCESS_DELETING);
    MyConnection.UndoSQL;
  end;
  vShipment.Free;

end;

class procedure TShipment.DeleteShipment(AShipId: integer);
var //Sql : string;
   vShipment : TShipment;
   i:integer;
begin
  vShipment := TShipment.Create;
  try

    if not vShipment.SelectInDb(AShipId) then begin
      Alert(MSG_NO_DATA_FOUND);
      vShipment.Free;
      exit;
    end;


    if getTransRefDesc(vShipment.ShipId) <> '' then begin
       Alert('Transaksi tidak bisa dihapus karena menjadi referensi transaksi-transaksi berikut : '+#13+
            getTransRefDesc(vShipment.ShipId)+#13+#13+
            'Solusi : Hapus dulu transaksi-transaksi yg mereferensi ke transaksi ini.');
       vShipment.Free;
       Exit;
    end;

    vShipment.FItemDetailArr.FindOnDB(AShipId);
    MyConnection.BeginSQL;
    for i:= 0 to vShipment.FItemDetailArr.Count-1 do begin
      with MyConnection do begin
          if vShipment.FItemDetailArr[i].DbCrType = DB_CR_TYPE_DEBIT then //dibalikeeun
            StoredProc('dbo.save_to_item_balance_out')
          else
            StoredProc('dbo.save_to_item_balance');
        //  AddParamInteger('@ship_id',FShipId);
          AddParamInteger('@item_id',vShipment.FItemDetailArr[i].ItemBalance.Items.ItemId);
          AddParamDate('@balance_date',vShipment.ShipDate);

          AddParamFloat('@quantity',vShipment.FItemDetailArr[i].Quantity);
          AddParamFloat('@price',vShipment.FItemDetailArr[i].Price);
          AddParamString('@db_cr_type',IfThen(vShipment.FItemDetailArr[i].DbCrType=DB_CR_TYPE_DEBIT,DB_CR_TYPE_CREDIT,DB_CR_TYPE_DEBIT));
          AddParamInteger('@@item_balance_id',vShipment.FItemDetailArr[i].ItemBalance.ItemBalanceId,pdOutput);
          if vShipment.FItemDetailArr[i].DbCrType = DB_CR_TYPE_DEBIT then begin//dibalikeeun
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',vShipment.FItemDetailArr[i].RealValue,pdOutput);
          end;
          ExecStoredProc;
          {ADetail[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');
          StoredProc('dbo.insert_to_item_detail');
          AddParamInteger('@ship_id',FShipId);
          AddParamDate('@trans_date',FShipDate);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId);
          AddParamFloat('@conversion',ADetail[i].Conversion);
          AddParamString('@ship_type',FShipType);
          AddParamInteger('@serv_ship_id',0);
          AddParamFloat('@amount',ADetail[i].Amount);
          AddParamFloat('@discount',ADetail[i].Discount);
          ExecStoredProc;}
        end;
      vShipment.FItemDetailArr[i].DeleteOnDB;
    end;
    vShipment.FServiceDetailArr.FindOnDb(vShipment.ShipId);
    for i:= 0 to vShipment.FServiceDetailArr.Count-1 do
      TServiceDetail(vShipment.FServiceDetailArr[i]).DeleteOnDB;
    vShipment.FDummyArr.FindOnDB(vShipment.ShipId);
    for i:= 0 to vShipment.FDummyArr.Count-1 do
      vShipment.FDummyArr[i].DeleteDummy(vShipment.ShipId);
    vShipment.DeleteOnDB;
    MyConnection.EndSQL;
    Inform(MSG_SUCCESS_DELETING);
  except
    Alert(MSG_UNSUCCESS_DELETING);
    MyConnection.UndoSQL;
  end;
  vShipment.Free;
end;

destructor TShipment.Destroy;
begin
  FServiceDetailArr.Free;
  FItemDetailArr.Free;
  FDummyArr.Free;
  FMechanics.Free;
  inherited;
end;

class function TShipment.getDesc(AShipType: string): string;
begin
  case AShipType[1] of
    SHIP_TYPE_TERIMA_BARANG : Result := 'Penerimaan Barang';
    SHIP_TYPE_MUTASI_MASUK  : Result := 'Mutasi Masuk';
    SHIP_TYPE_MUTASI_KELUAR : Result := 'Mutasi Keluar';
    SHIP_TYPE_SALES         : Result := 'Sales';
    SHIP_TYPE_RETUR_SALES   : Result := 'Retur Sales';
    SHIP_TYPE_RETUR_SERVICE : Result := 'Retur Service';
    SHIP_TYPE_SERVICE       : Result := 'Service';
    SHIP_TYPE_RETUR_BELI    : Result := 'Retur Penerimaan Barang';
  else
    Result := '';
  end;
end;

class function TShipment.getDescTransType(aShipType,aShipServType: string): string;
begin
 if aShipServType = '' then
   Result := ''
 else
 case aShipType[1] of
   SHIP_TYPE_SALES : begin
     case aShipServType[1] of
       SHIP_SALES_TYPE_REG : Result := 'Reguler';
       SHIP_SALES_TYPE_CREDIT : Result := 'Credit';
     end;
   end;
   SHIP_TYPE_SERVICE : begin
     case aShipServType[1] of
       SHIP_SERVICE_TYPE_REG : Result := 'Reguler';
       SHIP_SERVICE_TYPE_KSG : Result := 'KSG';
       SHIP_SERVICE_TYPE_COMP : Result := 'Company';
     end;
   end;
 end;
end;

class function TShipment.getIdEstimasiFromNum(AShipNum: string): integer;
begin
  Result := getIntegerFromSQL('SELECT estimasi_id FROM Estimasi WHERE ship_num='+FormatSQLString(AShipNum));
end;

class function TShipment.getIdFromNum(AShipNum: string): integer;
begin
  Result := getIntegerFromSQL('SELECT ship_id FROM shipment WHERE ship_num='+FormatSQLString(AShipNum));
end;

class function TShipment.getMekanikFromIdRetur(AIdRetur: integer): string;
begin
  Result := getStringFromSQL('select person_name from persons where person_id = (select mekanik_id from shipment where '+
        ' ship_id = (select ship_id_used from shipment where ship_id='+FormatSQLNumber(AIdRetur)+'))');
end;

class function TShipment.getNewNumber(AShipType: string;ATransDate:TDate): string;
var vPrefix:string;
begin
  vPrefix := PrefixOf(AShipType)+getPeriode2(ATransDate)+'/'; //PREFIX_SHIP_TYPE_JUAL_LANGSUNG+'/'+IfThen(AIsPPN,'N/');
//  vSuffix := getPeriode2(ATransDate);
  Result :=getNextIDNumPeriode('ship_num','shipment',' AND ship_type ='+FormatSQLString(AShipType),
                         vPrefix,'','',4);
//  Result := vTmp + vSuffix;

//  Result := getNextIDNumPeriode('ship_num','shipment',' AND ship_type ='+FormatSQLString(AShipType),
  //         AShipType,)
end;

class function TShipment.getNewNumberEstimasi(AShipType,
  AServiceType: string; ATransDate: TDate): string;
var vPrefix:string;
begin
  vPrefix := PrefixOf(AShipType)+getPeriode2(ATransDate)+'/'; //PREFIX_SHIP_TYPE_JUAL_LANGSUNG+'/'+IfThen(AIsPPN,'N/');
//  vSuffix := getPeriode2(ATransDate);
  Result :=getNextIDNumPeriode('ship_num','estimasi',' AND ship_type ='+FormatSQLString(AShipType),
                         vPrefix,'','',4);
                         //+
               // ' AND ship_service_type = '+FormatSQLString(AServiceType)


end;

class function TShipment.getNewNumberService(AShipType,
  AServiceType: string; ATransDate: TDate): string;
var vPrefix:string;
begin
  vPrefix := PrefixOf(AShipType)+'/'+AServiceType+getPeriode2(ATransDate)+'/'; //PREFIX_SHIP_TYPE_JUAL_LANGSUNG+'/'+IfThen(AIsPPN,'N/');
//  vSuffix := getPeriode2(ATransDate);
  Result :=getNextIDNumPeriode('ship_num','shipment',' AND ship_type ='+FormatSQLString(AShipType)+
                ' AND ship_service_type = '+FormatSQLString(AServiceType),
                         vPrefix,'','',4);
end;

class function TShipment.getNumFromID(AShipId: integer): string;
begin
  Result := getStringFromSQL('SELECT ship_num FROM shipment WHERE ship_id='+FormatSQLNumber(AShipId));
end;

class function TShipment.getShipNumRefFromId(AIdRetur: integer): string;
begin
  Result := getStringFromSQL('select ship_num from shipment where ship_id = (select ship_id_used from shipment where ship_id='+FormatSQLNumber(AIdRetur)+')');
end;

class function TShipment.getStatus(AShipId: integer): string;
var SQL : string;
  vTmp : integer;
begin
  Result := 'Undifined';
  SQL := 'SELECT COUNT(*) FROM shipment WHERE reg_id IS NULL and Payment_ID is NULL '+
          ' AND ship_id ='+FormatSQLNumber(AShipId);
  vTmp := getIntegerFromSQL(SQL);
  if vTmp > 0 then begin
    Result := 'In Order';
    exit;
  end;

  SQL := 'SELECT COUNT(*) FROM shipment WHERE reg_id IS NOT NULL OR Payment_ID is NOT NULL '+
          ' AND ship_id ='+FormatSQLNumber(AShipId);
  vTmp := getIntegerFromSQL(SQL);
  if vTmp > 0 then
    Result := 'Close Order';
end;


class function TShipment.getTotalMotor(aMotorId: integer;AShipServType:string): Double;
var SQL : string;
begin
  SQL := 'SELECT SUM(TOTAL) FROM shipment s,persons p, motor m '+
        ' WHERE s.person_id = p.person_id and m.motor_id = p.motor_id '+
        ' And m.motor_id = '+FormatSQLNumber(aMotorId)+
        ' AND s.is_post = -1 AND s.ship_type = '+FormatSQLString(SHIP_TYPE_SERVICE)+
        IfThen(AShipServType<> '',' AND s.ship_service_type = '+FormatSQLString(AShipServType))+
        IfThen(GlobalPeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
        IfThen(GlobalPeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
        IfThen(GlobalPeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2))+
        IfThen(GlobalPeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2));
  Result := getFloatFromSQL(SQL);
end;

class function TShipment.getTransRefDesc(AShipId: integer): string;
var SQL : string;
    buffer : _recordset;
    i:integer;
begin
  SQL := 'SELECT ship_num, ship_type, ship_date '+
          ' FROM Shipment '+
          ' WHERE ship_id_used ='+FormatSQLNumber(AShipId);
  buffer := MyConnection.OpenSQL(SQL);
  Result := '';
  for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      Result := Result + 'Transaksi '+getDesc(BufferToString(Fields[1].Value))+'  ('+
      BufferToString(Fields[0].Value)+')'+ #13;
      moveNext;
    end;
  buffer.close;


end;

class function TShipment.getUnitMotor(aMotorId: integer;AShipServType:string): Integer;
var SQL : string;
begin
  SQL := 'SELECT COUNT(*) FROM shipment s,persons p, motor m '+
        ' WHERE s.person_id = p.person_id and m.motor_id = p.motor_id '+
        ' And m.motor_id = '+FormatSQLNumber(aMotorId)+
        ' AND s.is_post = -1 AND s.ship_type = '+FormatSQLString(SHIP_TYPE_SERVICE)+
        IfThen(AShipServType<> '',' AND s.ship_service_type = '+FormatSQLString(AShipServType))+
        IfThen(GlobalPeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
        IfThen(GlobalPeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
        IfThen(GlobalPeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2))+
        IfThen(GlobalPeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2));
  Result := getIntegerFromSQL(SQL);
end;

class function TShipment.getValueAll(AFieldName: string;
  APeriode: TPeriode; aShipType:string;isHeaderOnly:boolean;aPostCriteria:TBooleanOperator): Double;
var sql : string;
  vPost,vService : Double;
begin

   // if (aItemType = ITEM_TYPE_OIL) or (aItemType=ITEM_TYPE_PART) then begin
       sql := 'SELECT SUM('+AFieldName+') '+
          ' FROM shipment s, item_detail d, item_balance b, items i '+
          ' WHERE s.ship_id = d.ship_id AND d.item_balance_id = b.item_balance_id AND '+
          '  b.item_id = i.item_id AND '+
          IfThen(aPostCriteria=boTrue,' s.is_post = -1 AND ',' s.is_post = 0 AND ')+
          '	s.ship_type='+FormatSQLString(aShipType)+//' AND '+
//ditutup, ditambah is_ksg          ' AND ISNULL(d.service_parent,0) = 0'+
          ' AND ((ISNULL(d.service_parent,0) = 0) and (d.is_ksg<>-1))'+
         // ' i.item_type = '+FormatSQLString(aItemType)+
          //diganti 09.08.06
    //      ' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
         // ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
         //     ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2));
      //    IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
      { if (aPostCriterian = boFalse) or (aPostCriterian = boNone) then begin
         sql := 'SELECT     SUM('+AFieldName+') '+
                ' FROM dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                ' dbo.Items i ON D.item_id = i.item_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
                ' i.item_type = '+FormatSQLString(aItemType)+
          //      IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
          //' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                    //diganti 09.08.06
          ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
              ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end; }
   // end
   // else begin
      sql := 'SELECT SUM('+AFieldName+') '+
        ' FROM shipment s, service_detail d, services i '+
        ' WHERE s.ship_id = d.ship_id AND d.service_id = i.service_id AND '+
        //' s.is_post = -1 AND '+
          IfThen(aPostCriteria=boTrue,' s.is_post = -1 AND ',' s.is_post = 0 AND ')+
      //  IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
        '	s.ship_type='+FormatSQLString(aShipType)+//' AND '+
    //ditutup, ditambah is_ksg    ' AND ISNULL(d.service_parent,0) = 0'+
    ' AND ((ISNULL(d.service_parent,0) = 0) and (d.is_ksg<>-1))'+
   //     ' i.service_type = '+FormatSQLString(aItemType)+
        //IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+

        //' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                  //diganti 09.08.06
//          ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
     //         ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2));
      //  IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vService := getFloatFromSQL(sql);
{       if (aPostCriterian = boFalse) or (aPostCriterian = boNone) then begin
         sql := 'SELECT     SUM('+AFieldName+') '+
                ' FROM  dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                '  dbo.Services i ON D.service_id = i.service_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
        //IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
       // ' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                 //diganti 09.08.06
          ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
              ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end;     }
 { if aPostCriterian = boFalse then
    Result := vPending
  else if aPostCriterian = boTrue then
    Result := vPost
  else      }
    if isHeaderOnly then
      Result := IfThen(vPost=0,vService,vPost)
    else
     Result := vPost + vService;

end;

class function TShipment.getValueItemType(AFieldName:string;APeriode: TPeriode; aShipType,
  aItemType: string; aMekanikId: integer;aShipServType:string;aPostCriterian:TBooleanOperator): Double;
var sql : string;
  vPost,vPending : Double;
begin
    vPending := 0;
    if (aItemType = ITEM_TYPE_OIL) or (aItemType=ITEM_TYPE_PART) then begin
       sql := 'SELECT SUM('+AFieldName+') '+
          ' FROM shipment s, item_detail d, item_balance b, items i '+
          ' WHERE s.ship_id = d.ship_id AND d.item_balance_id = b.item_balance_id AND '+
          '  b.item_id = i.item_id AND '+
          IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
          '	s.ship_type='+FormatSQLString(aShipType)+' AND '+
          ' i.item_type = '+FormatSQLString(aItemType)+
          IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+
          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
       if (aPostCriterian = boFalse) or (aPostCriterian = boNone) then begin
         sql := 'SELECT     SUM('+AFieldName+') '+
                ' FROM dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                ' dbo.Items i ON D.item_id = i.item_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
                ' i.item_type = '+FormatSQLString(aItemType)+
                IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end
    else begin
      sql := 'SELECT SUM('+AFieldName+') '+
        ' FROM shipment s, service_detail d, services i '+
        ' WHERE s.ship_id = d.ship_id AND d.service_id = i.service_id AND '+
        //' s.is_post = -1 AND '+
        IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
        '	s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
        IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
       if (aPostCriterian = boFalse) or (aPostCriterian = boNone) then begin
         sql := 'SELECT     SUM('+AFieldName+') '+
                ' FROM  dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                '  dbo.Services i ON D.service_id = i.service_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
        IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
        IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end;
  if aPostCriterian = boFalse then
    Result := vPending
  else if aPostCriterian = boTrue then
    Result := vPost
  else
    Result := vPost + vPending;
end;

class function TShipment.getValueItemType2(AFieldName: string;
  APeriode: TPeriode; aShipType, aItemType: string; aMekanikId: integer;
  aPostCriterian: TBooleanOperator;isPiutang:boolean;WIthDP : boolean): Double;
var sql : string;
  vPost,vPending : Double;
begin
    vPending := 0;
    if (aItemType = ITEM_TYPE_OIL) or (aItemType=ITEM_TYPE_PART) then begin
       sql := 'SELECT SUM('+AFieldName+') '+IfThen(WIthDP,' - SUM(s.down_payment)')+
          ' FROM shipment s, item_detail d, item_balance b, items i '+
          ' WHERE s.ship_id = d.ship_id AND d.item_balance_id = b.item_balance_id AND '+
          '  b.item_id = i.item_id AND '+
          IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
          '	s.ship_type='+FormatSQLString(aShipType)+' AND '+
          ' i.item_type = '+FormatSQLString(aItemType)+
          //diganti 09.08.06
    //      ' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
          ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
 //ditutup, ditambah is_ksg             ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
           ' AND ((d.service_parent > 0)or (ISNULL(d.is_ksg,0) =-1) ))',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) +
           ' OR ((ISNULL(d.service_parent,0) = 0) and (ISNULL(d.is_ksg,0)<>-1)))')+
           //ditambah 18.12.06 --jang kasus sales credit
           IfThen(aShipType=SHIP_TYPE_SALES,' AND s.ship_service_type <> '+FormatSQLString(SHIP_SALES_TYPE_CREDIT))+
          IfThen(APeriode.PeriodeAwal1<>0,' AND  cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
//       if ((aPostCriterian = boFalse) or (aPostCriterian = boNone)) then begin
       if ((aPostCriterian = boFalse) or (aPostCriterian = boNone)) and isPiutang then begin
         sql := 'SELECT     SUM('+AFieldName+') '+ IfThen(WIthDP,' - SUM(s.down_payment)')+
                ' FROM dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                ' dbo.Items i ON D.item_id = i.item_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
                ' i.item_type = '+FormatSQLString(aItemType)+
          //      IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
          //' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                    //diganti 09.08.06
        //12.08  kayanya utk dummy ga usah di pasang kriteria ship_service/ sales_type coz dummy pasti lari ke piutang
        //  ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
        //      ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end
    else begin
      sql := 'SELECT SUM('+AFieldName+') '+IfThen(WIthDP,' - SUM(s.down_payment)')+
        ' FROM shipment s, service_detail d, services i '+
        ' WHERE s.ship_id = d.ship_id AND d.service_id = i.service_id AND '+
        //' s.is_post = -1 AND '+
        IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
        '	s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
        //IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+

        //' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                  //diganti 09.08.06
          ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
 //ditutup, ditambah is_ksg   ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
        ' AND ((d.service_parent > 0) or (d.is_ksg=-1)) )',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) +
         ' OR ((ISNULL(d.service_parent,0) = 0) and (d.is_ksg<>-1)))')+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
        IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
    //   if ((aPostCriterian = boFalse) or (aPostCriterian = boNone))   then begin
    if ((aPostCriterian = boFalse) or (aPostCriterian = boNone)) and isPiutang then begin
         sql := 'SELECT     SUM('+AFieldName+') '+IfThen(WIthDP,' - SUM(s.down_payment)')+
                ' FROM  dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                '  dbo.Services i ON D.service_id = i.service_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
        //IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
       // ' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                 //diganti 09.08.06
      //12.08    ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
         //     ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
        IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+
        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end;
  if aPostCriterian = boFalse then
    Result := vPending
  else if aPostCriterian = boTrue then
    Result := vPost
  else
    Result := vPost + vPending;

end;

class function TShipment.getValueItemType3(AFieldName: string;
  APeriode: TPeriode; aShipType, aItemType, aShipServType: string;
  aMekanikId: integer; aPostCriterian: TBooleanOperator; isPiutang,
  WIthDP: boolean): Double;
var sql : string;
  vPost,vPending : Double;
begin
    vPending := 0;
    if (aItemType = ITEM_TYPE_OIL) or (aItemType=ITEM_TYPE_PART) then begin
       sql := 'SELECT SUM('+AFieldName+') '+IfThen(WIthDP,' - SUM(s.down_payment)')+
          ' FROM shipment s, item_detail d, item_balance b, items i '+
          ' WHERE s.ship_id = d.ship_id AND d.item_balance_id = b.item_balance_id AND '+
          '  b.item_id = i.item_id AND '+
          IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
          '	s.ship_type='+FormatSQLString(aShipType)+' AND '+
          ' i.item_type = '+FormatSQLString(aItemType)+
          //diganti 09.08.06
    //      ' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
          IfThen(aShipType = SHIP_TYPE_SALES,' AND s.ship_service_type = '+FormatSQLString(aShipServType),
          ' AND s.ship_service_type = '+FormatSQLString(aShipServType))+
          //ditambah 04.10.06 buat memfilter yg tipe ksg hanya yg service_parentnya > 0
  //ditutup, ditambah is_ksg        IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND d.service_parent > 0' )+
          IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND ((d.service_parent > 0) or (d.is_ksg = -1)) ' )+
{jika tipe service' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                  ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) +' AND s.ship_service_type ='+FormatSQLString(aShipServType)+
                 ' OR ISNULL(d.service_parent,0) = 0)'))+
          }IfThen(APeriode.PeriodeAwal1<>0,' AND  cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+

          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
//       if ((aPostCriterian = boFalse) or (aPostCriterian = boNone)) then begin
       if ((aPostCriterian = boFalse) or (aPostCriterian = boNone)) and isPiutang then begin
         sql := 'SELECT     SUM('+AFieldName+') '+ IfThen(WIthDP,' - SUM(s.down_payment)')+
                ' FROM dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                ' dbo.Items i ON D.item_id = i.item_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
                ' i.item_type = '+FormatSQLString(aItemType)+
                IfThen(aShipType = SHIP_TYPE_SALES,' AND s.ship_service_type = '+FormatSQLString(aShipServType),
                 ' AND s.ship_service_type = '+FormatSQLString(aShipServType))+
                 //ditambah 04.10.06 buat memfilter yg tipe ksg hanya yg service_parentnya > 0
//ditutup, ditambah is_ksg          IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND d.service_parent > 0' )+
                IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND ((d.service_parent > 0) or (d.is_ksg=-1)) ' )+
{jika tipe service}//' AND (s.ship_service_type ='+FormatSQLString(aShipServType) IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                  //' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) +' AND s.ship_service_type ='+FormatSQLString(aShipServType)+
                 //' OR ISNULL(d.service_parent,0) = 0)'))+
                    //diganti 09.08.06
        //12.08  kayanya utk dummy ga usah di pasang kriteria ship_service/ sales_type coz dummy pasti lari ke piutang
        //  ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
        //      ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+
          IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end
    else begin
      sql := 'SELECT SUM('+AFieldName+') '+IfThen(WIthDP,' - SUM(s.down_payment)')+
        ' FROM shipment s, service_detail d, services i '+
        ' WHERE s.ship_id = d.ship_id AND d.service_id = i.service_id AND '+
        //' s.is_post = -1 AND '+
        IfThen(aPostCriterian=boTrue,' s.is_post = -1 AND ',IfThen(aPostCriterian=boFalse,' s.is_post = 0 AND '))+
        '	s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
                  //diganti 09.08.06
        IfThen(aShipType = SHIP_TYPE_SALES,' AND s.ship_service_type = '+FormatSQLString(aShipServType),
                 ' AND s.ship_service_type = '+FormatSQLString(aShipServType))+
//ditambah 04.10.06 buat memfilter yg tipe ksg hanya yg service_parentnya > 0
    //ditutup,ditambah is_ksg      IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND d.service_parent > 0' )+
           IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND ((d.service_parent > 0) or (d.is_ksg=-1))' )+
     {     ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
              ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+' AND s.ship_service_type ='+FormatSQLString(aShipServType)+
               ' OR ISNULL(d.service_parent,0) = 0)')+
      }  IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
        IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+
        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
       vPost := getFloatFromSQL(sql);
    //   if ((aPostCriterian = boFalse) or (aPostCriterian = boNone))   then begin
    if ((aPostCriterian = boFalse) or (aPostCriterian = boNone)) and isPiutang then begin
         sql := 'SELECT     SUM('+AFieldName+') '+IfThen(WIthDP,' - SUM(s.down_payment)')+
                ' FROM  dbo.Dummy_item_detail D INNER JOIN '+
                ' dbo.Shipment s ON D.ship_id = s.ship_id INNER JOIN '+
                '  dbo.Services i ON D.service_id = i.service_id '+
                '	WHERE s.ship_type='+FormatSQLString(aShipType)+' AND '+
        ' i.service_type = '+FormatSQLString(aItemType)+
        IfThen(aShipType = SHIP_TYPE_SALES,' AND s.ship_service_type = '+FormatSQLString(aShipServType),
        //ditambah 04.10.06 buat memfilter yg tipe ksg hanya yg service_parentnya > 0
//ditutup, ditambah is_ksg          IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND d.service_parent > 0' )+
            IfThen((aShipType = SHIP_TYPE_SERVICE) and (aShipServType = SHIP_SERVICE_TYPE_KSG), ' AND ((d.service_parent > 0) or (d.is_ksg = -1))' )+
                 ' AND s.ship_service_type = '+FormatSQLString(aShipServType))+
        //IfThen(aShipServType<> '', ' AND s.ship_service_type ='+FormatSQLString(aShipServType))+
       // ' AND s.ship_service_type '+IfThen(isPiutang,' = ', ' <> ')+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
                 //diganti 09.08.06
      //12.08    ' AND (s.ship_service_type '+IfThen(isPiutang,' = '+FormatSQLString(SHIP_SERVICE_TYPE_KSG)+
         //     ' AND d.service_parent > 0)',' <> '+FormatSQLString(SHIP_SERVICE_TYPE_KSG) + ' OR ISNULL(d.service_parent,0) = 0)')+
        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
        IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2))+
        IfThen(aMekanikId>0,' AND s.mekanik_id ='+FormatSQLNumber(aMekanikId));
         vPending := getFloatFromSQL(sql);
       end;
    end;
  if aPostCriterian = boFalse then
    Result := vPending
  else if aPostCriterian = boTrue then
    Result := vPost
  else
    Result := vPost + vPending;


end;

class function TShipment.getValueShipField(AFieldName: string;
  APeriode: TPeriode; aShipType: string; isHeaderOnly: boolean;
  aPostCriteria: TBooleanOperator): Double;
var sql : string;
  vPost,vService : Double;
begin
       sql := 'SELECT SUM('+AFieldName+') '+
          ' FROM shipment s '+
          ' WHERE '+
          IfThen(aPostCriteria=boTrue,' s.is_post = -1 AND ',' s.is_post = 0 AND ')+
          '	s.ship_type='+FormatSQLString(aShipType)+//' AND '+
          //diganti 09.08.06
          IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
          IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2));
       vPost := getFloatFromSQL(sql);


      sql := 'SELECT SUM('+AFieldName+') '+
        ' FROM shipment s '+
        ' WHERE '+
          IfThen(aPostCriteria=boTrue,' s.is_post = -1 AND ',' s.is_post = 0 AND ')+

        '	s.ship_type='+FormatSQLString(aShipType)+//' AND '+

        IfThen(APeriode.PeriodeAwal1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal1)+FormatSQLDate(APeriode.PeriodeAwal1))+
        IfThen(APeriode.PeriodeAkhir1<>0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir1)+FormatSQLDate(APeriode.PeriodeAkhir1))+
        IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2));

       vService := getFloatFromSQL(sql);

    if isHeaderOnly then
      Result := IfThen(vPost=0,vService,vPost)
    else
     Result := vPost + vService;



end;

function TShipment.InsertEstimasi(EditMode: boolean): boolean;
var SQL : string; i,idx:integer;
begin
   try
     MyConnection.BeginSQL;
     if not EditMode then
       SQL := 'INSERT INTO Estimasi (Ship_Num,Ship_Type,Ship_Date,person_id, mekanik_id,Subtotal,'+
       'Down_payment,Discount,Total,ship_id_used,Notes,User_Insert,is_Post,ship_service_type, Expr_Date,kilometer,nopol)'+
      ' VALUES ('+
        FormatSQLString(FShipNum)+','+
        FormatSQLString(FShipType)+','+
        FormatSQLDate(FShipDate)+','+
        IfThen(FPersons.PersonId<>0, FormatSQLNumber(FPersons.PersonId),FormatSQLNULL)+','+
        FormatSQLNULL+','+
        //IfThen(FShipType=SHIP_TYPE_SERVICE,FormatSQLNumber(FPersonsMekanik_Id.PersonId),FormatSQLNULL)+','+
        FormatSQLNumber(FSubtotal)+','+
        FormatSQLNumber(FDownPayment)+','+
        FormatSQLNumber(FDiscount)+','+
        FormatSQLNumber(FTotal)+','+
        IfThen(FShipIdUsed>0,FormatSQLNumber(FShipIdUsed),FormatSQLNULL)+','+
        FormatSQLString(FNotes)+','+
        FormatSQLString(FUserInsert)+','+
        FormatSQLBoolean(FIsPost)+','+
        FormatSQLString(FShipServiceType)+','+
        FormatSQLDate(FExprDate)+','+
        FormatSQLString(FKilometer)+','+
        IfThen(FShipType= ESTIMASI_TYPE_1, FormatSQLString(FNoPol),FormatSQLNULL)+')'
      else
        SQL :=  'UPDATE Estimasi SET'+
          ' Ship_Num='+FormatSQLString(FShipNum)+','+
          ' Ship_Type='+FormatSQLString(FShipType)+','+
          ' Ship_Date='+FormatSQLDateTime(FShipDate)+','+
          ' Person_Id='+FormatSQLNumber(FPersons.PersonId)+','+
          ' Mekanik_Id='+IfThen(FPersonsMekanik_Id.PersonId>0,FormatSQLNumber(FPersonsMekanik_Id.PersonId),FormatSQLNULL)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' Subtotal='+FormatSQLNumber(FSubtotal)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Ppn='+FormatSQLNumber(FPpn)+','+
          ' Total='+FormatSQLNumber(FTotal)+','+
          ' Down_Payment='+FormatSQLNumber(FDownPayment)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+','+
          ' Expr_Date ='+FormatSQLDate(FExprDate)+','+
          ' Ship_Id_Used='+IfThen(FShipIdUsed>0,FormatSQLNumber(FShipIdUsed),FormatSQLNULL)+','+
          ' Is_Post='+FormatSQLBoolean(FIsPost)+','+
          ' kilometer ='+  FormatSQLString(FKilometer)+','+
          ' nopol='+IfThen(FShipType= ESTIMASI_TYPE_1, FormatSQLString(FNoPol),FormatSQLNULL)+
          ' ,ship_service_type ='+FormatSQLString(FShipServiceType)+
      ' WHERE Estimasi_Id='+FormatSQLNumber(FShipId);
     MyConnection.ExecSQL(SQL);
     if not EditMode then
       FShipId := getIntegerFromSQL('SELECT max(Estimasi_Id) FROM Estimasi WHERE ship_num='+FormatSQLString(FShipNum));
      //mekanik start here
//      MyConnection.ExecSQL('delete from shipment_mechanic where ship_id='+FormatSQLNumber(FShipId));
  {    for i:= 0 to FMechanics.Count-1 do begin
         FMechanics[i].ShipId := FShipId;
         FMechanics[i].InsertOnDB;
      end;}
      //mekanik end here

//     if FIsPost then begin //jika transaksi langsung commit
      MyConnection.ExecSQL('delete from estimasi_detail where estimasi_id='+FormatSQLNumber(FShipId));
       for i:= 0 to Self.FItemDetailArr.Count-1 do
          with MyConnection do begin
            {if Self.FItemDetailArr[i].DbCrType = DB_CR_TYPE_DEBIT then
              StoredProc('dbo.save_to_item_balance')
            else
              StoredProc('dbo.save_to_item_balance_out');
          //  AddParamInteger('@ship_id',FShipId);
            AddParamInteger('@item_id',Self.FItemDetailArr[i].ItemBalance.Items.ItemId);
            AddParamDate('@balance_date',FShipDate);

            AddParamFloat('@quantity',Self.FItemDetailArr[i].Quantity);
            AddParamFloat('@price',Self.FItemDetailArr[i].Price);
            AddParamString('@db_cr_type',Self.FItemDetailArr[i].DbCrType);
            AddParamInteger('@@item_balance_id',Self.FItemDetailArr[i].ItemBalance.ItemBalanceId,pdOutput);
            if FItemDetailArr[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',Self.FItemDetailArr[i].RealValue,pdOutput);
            end;
            ExecStoredProc;
            Self.FItemDetailArr[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');

            if FItemDetailArr[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              FItemDetailArr[I].BalanceInConcerned := GetParamOutput('@@balance_concerned');
              FItemDetailArr[i].RealValue := BufferToFloat(GetParamOutput('@@real_value'));
            end
            else begin}
              FItemDetailArr[i].BalanceInConcerned := '';
              FItemDetailArr[i].RealValue := 0;
//            end;
            StoredProc('dbo.insert_to_estimasi_detail');
            AddParamInteger('@ship_id',FShipId);
            AddParamDate('@trans_date',FShipDate);
            AddParamInteger('@item_id',Self.FItemDetailArr[i].ItemBalance.Items.ItemId);
            AddParamFloat('@quantity',Self.FItemDetailArr[i].Quantity);
            AddParamFloat('@price',Self.FItemDetailArr[i].Price);
            AddParamString('@db_cr_type',Self.FItemDetailArr[i].DbCrType);
            AddParamInteger('@item_balance_id',Self.FItemDetailArr[i].ItemBalance.ItemBalanceId);
            AddParamFloat('@conversion',Self.FItemDetailArr[i].Conversion);
            AddParamString('@ship_type',FShipType);
            AddParamInteger('@serv_ship_id',Self.FItemDetailArr[i].ServiceParent);//dipake jang service parent
            AddParamFloat('@amount',Self.FItemDetailArr[i].Amount);
            AddParamFloat('@discount',Self.FItemDetailArr[i].Discount);
            AddParamString('@balance_concerned',FItemDetailArr[i].BalanceInConcerned);
            AddParamFloat('@real_value',FItemDetailArr[i].RealValue);
            AddParamBoolean('@is_ksg',FItemDetailArr[i].FIsKsg);
            ExecStoredProc;
            //update harga jika harga  master = 0
            {if (TItems.isZeroPrice(Self.FItemDetailArr[i].FItemBalance.Items.ItemId)) and
               (FShipType[1] in [SHIP_TYPE_SERVICE,SHIP_TYPE_SALES])then begin
              Self.FItemDetailArr[i].ItemBalance.Items.Price := Self.FItemDetailArr[i].Price;
              Self.FItemDetailArr[i].ItemBalance.Items.UserEdit := Self.UserInsert;
              Self.FItemDetailArr[i].ItemBalance.Items.ItemId := Self.FItemDetailArr[i].ItemBalance.Items.ItemId;

              TItems(Self.FItemDetailArr[i].FItemBalance.Items).UpdatePrice;
            end;}
          end; // end with

          MyConnection.ExecSQL('delete from estimasi_service_detail where estimasi_id='+FormatSQLNumber(FShipId));

          for i:= 0 to FServiceDetailArr.Count-1 do begin
            FServiceDetailArr[i].Shipment.ShipId := FShipId;
            FServiceDetailArr[i].InsertOnDbEstimasi;
            //update harga jika harga  master = 0
            {if (TServices.isZeroPrice(FServiceDetailArr[i].Services.ServiceId)) and
               (FShipType[1] in [SHIP_TYPE_SERVICE]) THEN begin
               FServiceDetailArr[i].Services.Price := FServiceDetailArr[i].Price;
               FServiceDetailArr[i].Services.UserEdit := Self.UserInsert;
               TServices(Self.FServiceDetailArr[i].Services).UpdatePrice;
            end;}
          end;//end for

  //   end; //end bukan isPOST

    
     MyConnection.EndSQL;
     Result := TRUE;
   except
     Result := False;
     MyConnection.UndoSQL;
   end;


end;

function TShipment.InsertMutasi(ADetail: TItemDetail_Arr): boolean;
var SQL : string; i:integer;
begin
   try
     MyConnection.BeginSQL;
     SQL := 'INSERT INTO Shipment (Ship_Num,Ship_Type,Ship_Date,Subtotal,Discount,Total,Notes,wh_id, wh_id_out,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FShipNum)+','+
      FormatSQLString(FShipType)+','+
      FormatSQLDate(FShipDate)+','+
      FormatSQLNumber(FSubtotal)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FTotal)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLNumber(FWarehouse.WhId)+','+
      FormatSQLNumber(FWhIdOut)+','+
      FormatSQLString(FUserInsert)+')';
     MyConnection.ExecSQL(SQL);
     FShipId := getIntegerFromSQL('SELECT max(ship_id) FROM shipment WHERE ship_num='+FormatSQLString(FShipNum));
     for i:= 0 to ADetail.Count-1 do
        with MyConnection do begin
          if ADetail[i].DbCrType = DB_CR_TYPE_DEBIT then
            StoredProc('dbo.save_to_item_balance')
          else
            StoredProc('dbo.save_to_item_balance_out');
        //  AddParamInteger('@ship_id',FShipId);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamDate('@balance_date',FShipDate);

          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId,pdOutput);
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',ADetail[i].RealValue,pdOutput);
          end;
          ExecStoredProc;
          ADetail[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
            ADetail[I].BalanceInConcerned := GetParamOutput('@@balance_concerned');
            ADetail[i].RealValue := GetParamOutput('@@real_value');
          end
          else begin
            ADetail[i].BalanceInConcerned := '';
            ADetail[i].RealValue := 0;
          end;
          StoredProc('dbo.insert_to_item_detail');
          AddParamInteger('@ship_id',FShipId);
          AddParamDate('@trans_date',FShipDate);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId);
          AddParamFloat('@conversion',ADetail[i].Conversion);
          AddParamString('@ship_type',FShipType);
          AddParamInteger('@serv_ship_id',0);
          AddParamFloat('@amount',ADetail[i].Amount);
          AddParamFloat('@discount',ADetail[i].Discount);
          AddParamString('@balance_concerned',ADetail[i].BalanceInConcerned);
          AddParamFloat('@real_value',ADetail[i].RealValue);
          ExecStoredProc;
          if (TItems.isZeroPrice(ADetail[i].FItemBalance.Items.ItemId)) AND
             (FShipType[1] in [SHIP_TYPE_MUTASI_MASUK]) then begin
              ADetail[i].ItemBalance.Items.ItemId := ADetail[i].ItemBalance.Items.ItemId;
              ADetail[i].ItemBalance.Items.UserEdit := FUserInsert;
              ADetail[i].ItemBalance.Items.Price := ADetail[i].Price;
              TItems(ADetail[i].FItemBalance.Items).UpdatePrice;
          end;
        end;
     MyConnection.EndSQL;
     Result := TRUE;
   except
     Result := False;
     MyConnection.UndoSQL;
   end;

end;

function TShipment.InsertOpname(ADetail: TItemDetail_Arr): boolean;
var SQL : string; i:integer;
begin
   try
     MyConnection.BeginSQL;
     SQL := 'INSERT INTO Shipment (Ship_Num,Ship_Type,Ship_Date,Subtotal,Discount,Total,Notes,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FShipNum)+','+
      FormatSQLString(FShipType)+','+
      FormatSQLDate(FShipDate)+','+
      FormatSQLNumber(FSubtotal)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FTotal)+','+
      FormatSQLString(FNotes)+','+
     // FormatSQLNumber(FWarehouse.WhId)+','+
      //FormatSQLNumber(FWhIdOut)+','+
      FormatSQLString(FUserInsert)+')';
     MyConnection.ExecSQL(SQL);
     FShipId := getIntegerFromSQL('SELECT max(ship_id) FROM shipment WHERE ship_num='+FormatSQLString(FShipNum));
     for i:= 0 to ADetail.Count-1 do
        with MyConnection do begin
          if ADetail[i].DbCrType = DB_CR_TYPE_DEBIT then
            StoredProc('dbo.save_to_item_balance')
          else
            StoredProc('dbo.save_to_item_balance_out');
        //  AddParamInteger('@ship_id',FShipId);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamDate('@balance_date',FShipDate);

          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId,pdOutput);
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',ADetail[i].RealValue,pdOutput);
          end;
          ExecStoredProc;
          ADetail[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
            ADetail[I].BalanceInConcerned := GetParamOutput('@@balance_concerned');
            ADetail[i].RealValue := GetParamOutput('@@real_value');
          end
          else begin
            ADetail[i].BalanceInConcerned := '';
            ADetail[i].RealValue := 0;
          end;
          StoredProc('dbo.insert_to_item_detail_opname');
          AddParamInteger('@ship_id',FShipId);
          AddParamDate('@trans_date',FShipDate);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId);
          AddParamFloat('@conversion',ADetail[i].Conversion);
          AddParamString('@ship_type',FShipType);
          AddParamInteger('@serv_ship_id',0);
          AddParamFloat('@amount',ADetail[i].Amount);
          AddParamFloat('@discount',ADetail[i].Discount);
          AddParamString('@balance_concerned',ADetail[i].BalanceInConcerned);
          AddParamFloat('@real_value',ADetail[i].RealValue);
          SQL := 'insert into item_detail(item_balance_id, ship_id, quantity, price, discount, amount,db_cr_type, conversion,item_id,service_parent,balance_in_concerned,real_value,stok) '+
                ' values ('+
                FormatSQLNumber(ADetail[i].ItemBalance.ItemBalanceId)+','+
                FormatSQLNumber(FShipId)+','+
                FormatSQLNumber(ADetail[i].Quantity)+','+
                FormatSQLNumber(ADetail[i].price)+','+
                FormatSQLNumber(ADetail[i].discount)+','+
                FormatSQLNumber(ADetail[i].amount)+','+
                FormatSQLString(ADetail[i].DbCrType)+','+
                FormatSQLNumber(ADetail[i].conversion)+','+
                FormatSQLNumber(ADetail[i].ItemBalance.Items.ItemId)+','+
                FormatSQLNumber(0)+','+
                FormatSQLString(ADetail[i].BalanceInConcerned)+','+
                FormatSQLNumber(ADetail[i].RealValue)+','+
                FormatSQLNumber(ADetail[i].Stok) +')';
                MyConnection.ExecSQL(SQL);

//          ExecStoredProc;
          if (TItems.isZeroPrice(ADetail[i].FItemBalance.Items.ItemId)) AND
             (FShipType[1] in [SHIP_TYPE_MUTASI_MASUK]) then begin
              ADetail[i].ItemBalance.Items.ItemId := ADetail[i].ItemBalance.Items.ItemId;
              ADetail[i].ItemBalance.Items.UserEdit := FUserInsert;
              ADetail[i].ItemBalance.Items.Price := ADetail[i].Price;
              TItems(ADetail[i].FItemBalance.Items).UpdatePrice;
          end;
        end;
     MyConnection.EndSQL;
     Result := TRUE;
   except
     Result := False;
     MyConnection.UndoSQL;
   end;


end;

function TShipment.InsertService(EditMode:boolean): boolean;
var SQL : string; i,idx:integer;
begin
   try
     MyConnection.BeginSQL;
     if not EditMode then
       SQL := 'INSERT INTO Shipment (Ship_Num,Ship_Type,Ship_Date,person_id, mekanik_id,Subtotal,'+
       'Down_payment,Discount,Total,ship_id_used,Notes,User_Insert,is_Post,ship_service_type, Expr_Date,kilometer,nopol,estimasi_id)'+
      ' VALUES ('+
        FormatSQLString(FShipNum)+','+
        FormatSQLString(FShipType)+','+
        FormatSQLDate(FShipDate)+','+
        IfThen(FPersons.PersonId<>0, FormatSQLNumber(FPersons.PersonId),FormatSQLNULL)+','+
        FormatSQLNULL+','+
        //IfThen(FShipType=SHIP_TYPE_SERVICE,FormatSQLNumber(FPersonsMekanik_Id.PersonId),FormatSQLNULL)+','+
        FormatSQLNumber(FSubtotal)+','+
        FormatSQLNumber(FDownPayment)+','+
        FormatSQLNumber(FDiscount)+','+
        FormatSQLNumber(FTotal)+','+
        IfThen(FShipIdUsed>0,FormatSQLNumber(FShipIdUsed),FormatSQLNULL)+','+
        FormatSQLString(FNotes)+','+
        FormatSQLString(FUserInsert)+','+
        FormatSQLBoolean(FIsPost)+','+
        FormatSQLString(FShipServiceType)+','+
        FormatSQLDate(FExprDate)+','+
        FormatSQLString(FKilometer)+','+
        IfThen(FShipType= SHIP_TYPE_SERVICE, FormatSQLString(FNoPol),FormatSQLNULL)+','+
        IfThen(FEstimasiId<>0, FormatSQLNumber(FEstimasiId),FormatSQLNULL)+')'
      else
        SQL :=  'UPDATE Shipment SET'+
          ' Ship_Num='+FormatSQLString(FShipNum)+','+
          ' Ship_Type='+FormatSQLString(FShipType)+','+
          ' Ship_Date='+FormatSQLDateTime(FShipDate)+','+
          ' Person_Id='+FormatSQLNumber(FPersons.PersonId)+','+
          ' Mekanik_Id='+IfThen(FPersonsMekanik_Id.PersonId>0,FormatSQLNumber(FPersonsMekanik_Id.PersonId),FormatSQLNULL)+','+
          ' Notes='+FormatSQLString(FNotes)+','+
          ' Subtotal='+FormatSQLNumber(FSubtotal)+','+
          ' Discount='+FormatSQLNumber(FDiscount)+','+
          ' Ppn='+FormatSQLNumber(FPpn)+','+
          ' Total='+FormatSQLNumber(FTotal)+','+
          ' Down_Payment='+FormatSQLNumber(FDownPayment)+','+
          ' User_Edit='+FormatSQLString(FUserEdit)+','+
          ' Date_Edit='+FormatSQLDateTime(FDateEdit)+','+
          ' Expr_Date ='+FormatSQLDate(FExprDate)+','+
          ' Ship_Id_Used='+IfThen(FShipIdUsed>0,FormatSQLNumber(FShipIdUsed),FormatSQLNULL)+','+
          ' estimasi_id ='+IfThen(FEstimasiId>0,FormatSQLNumber(FEstimasiId),FormatSQLNULL)+','+
          ' Is_Post='+FormatSQLBoolean(FIsPost)+','+
          ' kilometer ='+  FormatSQLString(FKilometer)+','+
          ' nopol='+IfThen(FShipType= SHIP_TYPE_SERVICE, FormatSQLString(FNoPol),FormatSQLNULL)+
          ' ,ship_service_type ='+FormatSQLString(FShipServiceType)+
      ' WHERE Ship_Id='+FormatSQLNumber(FShipId);
     MyConnection.ExecSQL(SQL);
     if not EditMode then
       FShipId := getIntegerFromSQL('SELECT max(ship_id) FROM shipment WHERE ship_num='+FormatSQLString(FShipNum));
      //mekanik start here
      MyConnection.ExecSQL('delete from shipment_mechanic where ship_id='+FormatSQLNumber(FShipId));
      for i:= 0 to FMechanics.Count-1 do begin
         FMechanics[i].ShipId := FShipId;
         FMechanics[i].InsertOnDB;
      end;
      //mekanik end here
     if FIsPost then begin //jika transaksi langsung commit
       for i:= 0 to Self.FItemDetailArr.Count-1 do
          with MyConnection do begin
            if Self.FItemDetailArr[i].DbCrType = DB_CR_TYPE_DEBIT then
              StoredProc('dbo.save_to_item_balance')
            else
              StoredProc('dbo.save_to_item_balance_out');
          //  AddParamInteger('@ship_id',FShipId);
            AddParamInteger('@item_id',Self.FItemDetailArr[i].ItemBalance.Items.ItemId);
            AddParamDate('@balance_date',FShipDate);

            AddParamFloat('@quantity',Self.FItemDetailArr[i].Quantity);
            AddParamFloat('@price',Self.FItemDetailArr[i].Price);
            AddParamString('@db_cr_type',Self.FItemDetailArr[i].DbCrType);
            AddParamInteger('@@item_balance_id',Self.FItemDetailArr[i].ItemBalance.ItemBalanceId,pdOutput);
            if FItemDetailArr[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',Self.FItemDetailArr[i].RealValue,pdOutput);
            end;
            ExecStoredProc;
            Self.FItemDetailArr[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');
            if FItemDetailArr[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              FItemDetailArr[I].BalanceInConcerned := GetParamOutput('@@balance_concerned');
              FItemDetailArr[i].RealValue := BufferToFloat(GetParamOutput('@@real_value'));
            end
            else begin
              FItemDetailArr[i].BalanceInConcerned := '';
              FItemDetailArr[i].RealValue := 0;
            end;
            StoredProc('dbo.insert_to_item_detail');
            AddParamInteger('@ship_id',FShipId);
            AddParamDate('@trans_date',FShipDate);
            AddParamInteger('@item_id',Self.FItemDetailArr[i].ItemBalance.Items.ItemId);
            AddParamFloat('@quantity',Self.FItemDetailArr[i].Quantity);
            AddParamFloat('@price',Self.FItemDetailArr[i].Price);
            AddParamString('@db_cr_type',Self.FItemDetailArr[i].DbCrType);
            AddParamInteger('@item_balance_id',Self.FItemDetailArr[i].ItemBalance.ItemBalanceId);
            AddParamFloat('@conversion',Self.FItemDetailArr[i].Conversion);
            AddParamString('@ship_type',FShipType);
            AddParamInteger('@serv_ship_id',Self.FItemDetailArr[i].ServiceParent);//dipake jang service parent
            AddParamFloat('@amount',Self.FItemDetailArr[i].Amount);
            AddParamFloat('@discount',Self.FItemDetailArr[i].Discount);
            AddParamString('@balance_concerned',FItemDetailArr[i].BalanceInConcerned);
            AddParamFloat('@real_value',FItemDetailArr[i].RealValue);
            AddParamBoolean('@is_ksg',FItemDetailArr[i].FIsKsg);
            ExecStoredProc;
            //update harga jika harga  master = 0
            if (TItems.isZeroPrice(Self.FItemDetailArr[i].FItemBalance.Items.ItemId)) and
               (FShipType[1] in [SHIP_TYPE_SERVICE,SHIP_TYPE_SALES])then begin
              Self.FItemDetailArr[i].ItemBalance.Items.Price := Self.FItemDetailArr[i].Price;
              Self.FItemDetailArr[i].ItemBalance.Items.UserEdit := Self.UserInsert;
              Self.FItemDetailArr[i].ItemBalance.Items.ItemId := Self.FItemDetailArr[i].ItemBalance.Items.ItemId;

              TItems(Self.FItemDetailArr[i].FItemBalance.Items).UpdatePrice;
            end;
          end; // end with

          for i:= 0 to FServiceDetailArr.Count-1 do begin
            FServiceDetailArr[i].Shipment.ShipId := FShipId;
            FServiceDetailArr[i].InsertOnDB;
            //update harga jika harga  master = 0
            if (TServices.isZeroPrice(FServiceDetailArr[i].Services.ServiceId)) and
               (FShipType[1] in [SHIP_TYPE_SERVICE]) THEN begin
               FServiceDetailArr[i].Services.Price := FServiceDetailArr[i].Price;
               FServiceDetailArr[i].Services.UserEdit := Self.UserInsert;
               TServices(Self.FServiceDetailArr[i].Services).UpdatePrice;
            end;
          end;//end for

     end //end bukan isPOST
     else begin  //jika transaksi status pending masukkan ke table dummy
       TDummyItemDetail.DeleteDummy(FShipId);//bisi aya perubahan detail transaksi
        // maka kosongin heula dummy na meh teu ngalieurken
       FDummyArr.Clear;
       for i:= 0 to FItemDetailArr.Count -1 do begin
         idx := FDummyArr.Add(0,FShipId,FItemDetailArr[i].ItemBalance.Items.ItemId,0,FItemDetailArr[i].ServiceParent,
                  FItemDetailArr[i].DbCrType,FItemDetailArr[i].Quantity,FItemDetailArr[i].Price,
                  FItemDetailArr[i].Discount,FItemDetailArr[i].Amount,FItemDetailArr[i].FIsKsg);
         TDummyItemDetail(FDummyArr[idx]).InsertOnDB;
         //update harga jika harga  master = 0
         if (TItems.isZeroPrice(Self.FItemDetailArr[i].FItemBalance.Items.ItemId)) and
               (FShipType[1] in [SHIP_TYPE_SERVICE,SHIP_TYPE_SALES])then begin
              Self.FItemDetailArr[i].ItemBalance.Items.Price := Self.FItemDetailArr[i].Price;
              Self.FItemDetailArr[i].ItemBalance.Items.ItemId := Self.FItemDetailArr[i].ItemBalance.Items.ItemId;
              Self.FItemDetailArr[i].ItemBalance.Items.UserEdit := FUserInsert;
              TItems(Self.FItemDetailArr[i].FItemBalance.Items).UpdatePrice;
         end;
       end;

       for i:= 0 to FServiceDetailArr.Count-1 do begin
         idx := FDummyArr.Add(0,FShipId,0,FServiceDetailArr[i].Services.ServiceId,FServiceDetailArr[i].ServiceParent,
                DB_CR_TYPE_DEBIT,FServiceDetailArr[i].Quantity,FServiceDetailArr[i].Price,FServiceDetailArr[i].Discount,
                FServiceDetailArr[i].Amount,FServiceDetailArr[i].FIsKsg);
         TDummyItemDetail(FDummyArr[idx]).InsertOnDB;
         //update harga jika harga  master = 0
         if (TServices.isZeroPrice(FServiceDetailArr[i].Services.ServiceId)) and
               (FShipType[1] in [SHIP_TYPE_SERVICE]) THEN begin
               FServiceDetailArr[i].Services.Price := FServiceDetailArr[i].Price;
               TServices(Self.FServiceDetailArr[i].Services).UpdatePrice;
         end;
       end;

     end;//end dummy
     if FIsPost then //jika transaksi diposting maka delete table dummy
       TDummyItemDetail.DeleteDummy(FShipId);
     MyConnection.EndSQL;
     Result := TRUE;
   except
     Result := False;
     MyConnection.UndoSQL;
   end;

end;

function TShipment.InsertTerima(ADetail: TItemDetail_Arr): boolean;
var SQL : string; i:integer;
begin
   try
     MyConnection.BeginSQL;
     SQL := 'INSERT INTO Shipment (Ship_Num,Ship_Type,Ship_Date,Person_id,Subtotal,Discount,Total,ship_id_used,Notes,'+
     'tgl_kirim,tgl_sampai,delivery_num,User_Insert)'+
    ' VALUES ('+
      FormatSQLString(FShipNum)+','+
      FormatSQLString(FShipType)+','+
      FormatSQLDate(FShipDate)+','+
      FormatSQLNumber(FPersons.PersonId)+','+
      FormatSQLNumber(FSubtotal)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FTotal)+','+
      IfThen(FShipIdUsed>0,FormatSQLNumber(FShipIdUsed),FormatSQLNULL)+','+
      FormatSQLString(FNotes)+','+
      FormatSQLDate(FTglKirim)+','+
      FormatSQLDate(FTglSampai)+','+
      FormatSQLString(FDeliveryNum)+','+
      FormatSQLString(FUserInsert)+')';
     MyConnection.ExecSQL(SQL);
     FShipId := getIntegerFromSQL('SELECT max(ship_id) FROM shipment WHERE ship_num='+FormatSQLString(FShipNum));
     for i:= 0 to ADetail.Count-1 do
        with MyConnection do begin
          if ADetail[i].DbCrType = DB_CR_TYPE_DEBIT then
            StoredProc('dbo.save_to_item_balance')
          else
            StoredProc('dbo.save_to_item_balance_out');
        //  AddParamInteger('@ship_id',FShipId);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamDate('@balance_date',FShipDate);

          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId,pdOutput);
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',ADetail[i].RealValue,pdOutput);
          end;
          ExecStoredProc;
          ADetail[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
            ADetail[I].BalanceInConcerned := GetParamOutput('@@balance_concerned');
            ADetail[i].RealValue := GetParamOutput('@@real_value');
          end
          else begin
            ADetail[i].BalanceInConcerned := '';
            ADetail[i].RealValue := 0;
          end;
          StoredProc('dbo.insert_to_item_detail');
          AddParamInteger('@ship_id',FShipId);
          AddParamDate('@trans_date',FShipDate);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId);
          AddParamFloat('@conversion',ADetail[i].Conversion);
          AddParamString('@ship_type',FShipType);
          AddParamInteger('@serv_ship_id',0);
          AddParamFloat('@amount',ADetail[i].Amount);
          AddParamFloat('@discount',ADetail[i].Discount);
          AddParamString('@balance_concerned',ADetail[i].BalanceInConcerned);
          AddParamFloat('@real_value',ADetail[i].RealValue);
         // if (TItems.isZeroPricePurchase(ADetail[i].FItemBalance.Items.ItemId)) AND
         //poko namah setiap ada penerimaan baran baru update harganya
           IF  (FShipType[1] in [SHIP_TYPE_TERIMA_BARANG]) then begin
              ADetail[i].ItemBalance.Items.ItemId := ADetail[i].ItemBalance.Items.ItemId;
              ADetail[i].ItemBalance.Items.UserEdit := FUserInsert;
              ADetail[i].ItemBalance.Items.PricePurchase := ADetail[i].Price;
              TItems(ADetail[i].FItemBalance.Items).UpdatePricePurchase;
          end;
          ExecStoredProc;
        end;
     MyConnection.EndSQL;
     Result := TRUE;
   except
     Result := False;
     MyConnection.UndoSQL;
   end;
end;

class function TShipment.isPosted(AShipId: integer): boolean;
begin
  Result := getIntegerFromSQL('SELECT  is_post FROM shipment WHERE ship_id='+FormatSQLNumber(AShipId)) = TRUE_VALUE;
end;

class function TShipment.PrefixOf(AShipType: string): string;
begin
  case AShipType[1] of
    SHIP_TYPE_TERIMA_BARANG : Result := 'TB';
    SHIP_TYPE_MUTASI_MASUK  : Result := 'MM';
    SHIP_TYPE_MUTASI_KELUAR  : Result := 'MK';
    SHIP_TYPE_SALES : Result := 'SS';
    SHIP_TYPE_RETUR_BELI  : Result := 'RB';
    SHIP_TYPE_RETUR_SALES : Result := 'RS';
    SHIP_TYPE_SERVICE  : Result := 'SV';
    SHIP_TYPE_CLAIM  : Result := 'SC';
    SHIP_TYPE_RETUR_SERVICE : Result := 'RV';
    ESTIMASI_TYPE_1 : Result := 'ES';
    ESTIMASI_TYPE_ORDER : Result := 'OG';
    SHIP_TYPE_OPNAME : Result := 'SO';
  else
    Result := '';
  end;
end;


function TShipment.SelectInDb(AShipId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT S.Ship_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date, S.Notes, S.User_Insert, S.User_Edit, S.Date_Insert, S.Date_Edit, S.Subtotal, S.Discount, S.Ppn, S.Total'+
    ',person_id, mekanik_id, s.ship_id_used, wh_id, wh_id_out,ship_id_used '+
    ',s.is_post, s.ship_service_type, s.down_payment, S.Expr_Date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,s.kilometer '+
    ',s.nopol '+
       //  ', S.Reg_Id '+// R.Reg_Num, R.Reg_Date, R.Reg_Type, R.Res_Id, R.Guest_Id, R.Purpose, R.Notes, R.User_Insert, R.User_Edit, R.Date_Insert, R.Date_Edit, R.Check_In, R.Check_Out, R.Room_Id, R.Real_Check_Out'+
     ' FROM Shipment S'+
    ' WHERE S.Ship_Id='+FormatSQLNumber(AShipId));
   //   ' AND S.Reg_Id=R.Reg_Id(+)'+
   //   ' AND S.Payment_Id=P.Payment_Id(+)'

  if (buffer.RecordCount<>0) then begin
    FShipId := BufferToInteger(buffer.Fields[0].Value);
    FShipNum := BufferToString(buffer.Fields[1].Value);
    FShipType := BufferToString(buffer.Fields[2].Value);
    FShipDate := BufferToDateTime(buffer.Fields[3].Value);
    FNotes := BufferToString(buffer.Fields[4].Value);
    FUserInsert := BufferToString(buffer.Fields[5].Value);
    FUserEdit := BufferToString(buffer.Fields[6].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[7].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[8].Value);
    FSubtotal := BufferToFloat(buffer.Fields[9].Value);
    FDiscount := BufferToFloat(buffer.Fields[10].Value);
    FPpn := BufferToFloat(buffer.Fields[11].Value);
    FTotal := BufferToFloat(buffer.Fields[12].Value);
    FPersons.PersonId := BufferToInteger(buffer.Fields[13].Value);
    FPersonsMekanik_Id.PersonId := BufferToInteger(buffer.Fields[14].Value);
    FShipIdUsed := BufferToInteger(buffer.Fields[15].Value);
    FWarehouse.WhId := BufferToInteger(buffer.Fields[16].Value);
    FWhIdOut := BufferToInteger(buffer.Fields[17].Value);
    FShipIdUsed := BufferToInteger(buffer.Fields[18].Value);
    FIsPost := BufferToBoolean(buffer.Fields[19].Value);
    FShipServiceType := BufferToString(buffer.Fields[20].Value);
    FDownPayment := BufferToFloat(buffer.Fields[21].Value);
    FExprDate := BufferToDateTime(buffer.Fields[22].Value);
    FTglKirim := BufferToDateTime(buffer.Fields[23].Value);
    FTglSampai := BufferToDateTime(buffer.Fields[24].Value);
    FDeliveryNum := BufferToString(buffer.Fields[25].Value);
    FKilometer := BufferToString(buffer.Fields[26].Value);
    FNoPol := BufferToString(buffer.Fields[27].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;

end;

function TShipment.SelectInDbEstimasi(AShipId: integer): boolean;
var buffer: _RecordSet;
begin
  buffer := myConnection.OpenSQL(
    'SELECT S.Estimasi_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date, S.Notes, S.User_Insert, S.User_Edit, S.Date_Insert, S.Date_Edit, S.Subtotal, S.Discount, S.Ppn, S.Total'+
    ',person_id, mekanik_id, s.ship_id_used, wh_id, wh_id_out,ship_id_used '+
    ',s.is_post, s.ship_service_type, s.down_payment, S.Expr_Date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,s.kilometer '+
    ',s.nopol '+
       //  ', S.Reg_Id '+// R.Reg_Num, R.Reg_Date, R.Reg_Type, R.Res_Id, R.Guest_Id, R.Purpose, R.Notes, R.User_Insert, R.User_Edit, R.Date_Insert, R.Date_Edit, R.Check_In, R.Check_Out, R.Room_Id, R.Real_Check_Out'+
     ' FROM Estimasi S'+
    ' WHERE S.Estimasi_Id='+FormatSQLNumber(AShipId));
   //   ' AND S.Reg_Id=R.Reg_Id(+)'+
   //   ' AND S.Payment_Id=P.Payment_Id(+)'

  if (buffer.RecordCount<>0) then begin
    FShipId := BufferToInteger(buffer.Fields[0].Value);
    FShipNum := BufferToString(buffer.Fields[1].Value);
    FShipType := BufferToString(buffer.Fields[2].Value);
    FShipDate := BufferToDateTime(buffer.Fields[3].Value);
    FNotes := BufferToString(buffer.Fields[4].Value);
    FUserInsert := BufferToString(buffer.Fields[5].Value);
    FUserEdit := BufferToString(buffer.Fields[6].Value);
    FDateInsert := BufferToDateTime(buffer.Fields[7].Value);
    FDateEdit := BufferToDateTime(buffer.Fields[8].Value);
    FSubtotal := BufferToFloat(buffer.Fields[9].Value);
    FDiscount := BufferToFloat(buffer.Fields[10].Value);
    FPpn := BufferToFloat(buffer.Fields[11].Value);
    FTotal := BufferToFloat(buffer.Fields[12].Value);
    FPersons.PersonId := BufferToInteger(buffer.Fields[13].Value);
    FPersonsMekanik_Id.PersonId := BufferToInteger(buffer.Fields[14].Value);
    FShipIdUsed := BufferToInteger(buffer.Fields[15].Value);
    FWarehouse.WhId := BufferToInteger(buffer.Fields[16].Value);
    FWhIdOut := BufferToInteger(buffer.Fields[17].Value);
    FShipIdUsed := BufferToInteger(buffer.Fields[18].Value);
    FIsPost := BufferToBoolean(buffer.Fields[19].Value);
    FShipServiceType := BufferToString(buffer.Fields[20].Value);
    FDownPayment := BufferToFloat(buffer.Fields[21].Value);
    FExprDate := BufferToDateTime(buffer.Fields[22].Value);
    FTglKirim := BufferToDateTime(buffer.Fields[23].Value);
    FTglSampai := BufferToDateTime(buffer.Fields[24].Value);
    FDeliveryNum := BufferToString(buffer.Fields[25].Value);
    FKilometer := BufferToString(buffer.Fields[26].Value);
    FNoPol := BufferToString(buffer.Fields[27].Value);
  end;
  Result := (buffer.RecordCount<>0);
  buffer.Close;


end;

class function TShipment.setCloseOrder(ARegId, aPaymentID,
  AShipID: integer): boolean;
var sql:String;
begin
  sql := 'UPDATE shipment SET '+
      IfThen(ARegId>0,' reg_id ='+FormatSQLNumber(ARegId))+
      IfThen(aPaymentID>0,' payment_id ='+FormatSQLNumber(aPaymentID))+
      ' WHERE ship_id ='+FormatSQLNumber(AShipID);
  Result := ExecTransaction(sql,False);
end;

class function TShipment.setPost(AShipID: integer): Boolean;
begin
  Result := ExecTransaction2('UPDATE shipment SET is_post ='+FormatSQLBoolean(True)+
        ' WHERE ship_id ='+FormatSQLNumber(AShipID));
end;

function TShipment.UpdateTerima(ADetail: TItemDetail_Arr): boolean;
var SQL : string; i:integer;
begin
   try
     MyConnection.BeginSQL;
     SQL := 'UPDATE Shipment set Ship_Date= '+ FormatSQLDate(FShipDate)+
     ', Person_id= '+ FormatSQLNumber(FPersons.PersonId)+
     ',Subtotal= '+ FormatSQLNumber(FSubtotal)+
     ',Discount= '+FormatSQLNumber(FDiscount)+
     ',Total= '+ FormatSQLNumber(FTotal)+
     ',ship_id_used= '+IfThen(FShipIdUsed>0,FormatSQLNumber(FShipIdUsed),FormatSQLNULL)+
     ',Notes= '+FormatSQLString(FNotes)+
     ',tgl_kirim= '+FormatSQLDate(FTglKirim)+
     ',tgl_sampai= '+FormatSQLDate(FTglSampai)+
     ',delivery_num= '+FormatSQLString(FDeliveryNum)+
     ',User_edit= '+ FormatSQLString(FUserInsert)+
     ' WHERE ship_id = '+FormatSQLNumber(FShipId);
     MyConnection.ExecSQL(SQL);
     //balikin stok lama
     self.FItemDetailArr.FindOnDB(FShipId);
    for i:= 0 to Self.FItemDetailArr.Count-1 do begin
      with MyConnection do begin
          if self.FItemDetailArr[i].DbCrType = DB_CR_TYPE_DEBIT then //dibalikeeun
            StoredProc('dbo.save_to_item_balance_out')
          else
            StoredProc('dbo.save_to_item_balance');
        //  AddParamInteger('@ship_id',FShipId);
          AddParamInteger('@item_id',self.FItemDetailArr[i].ItemBalance.Items.ItemId);
          AddParamDate('@balance_date',FShipDate);

          AddParamFloat('@quantity',self.FItemDetailArr[i].Quantity);
          AddParamFloat('@price',self.FItemDetailArr[i].Price);
          AddParamString('@db_cr_type',IfThen(self.FItemDetailArr[i].DbCrType=DB_CR_TYPE_DEBIT,DB_CR_TYPE_CREDIT,DB_CR_TYPE_DEBIT));
          AddParamInteger('@@item_balance_id',self.FItemDetailArr[i].ItemBalance.ItemBalanceId,pdOutput);
          if Self.FItemDetailArr[i].DbCrType = DB_CR_TYPE_DEBIT then begin//dibalikeeun
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',Self.FItemDetailArr[i].RealValue,pdOutput);
          end;
          ExecStoredProc;

        end;
      Self.FItemDetailArr[i].DeleteOnDB;
    end;

    //end balikin stok lama


    // FShipId := getIntegerFromSQL('SELECT max(ship_id) FROM shipment WHERE ship_num='+FormatSQLString(FShipNum));
     for i:= 0 to ADetail.Count-1 do
        with MyConnection do begin
          if ADetail[i].DbCrType = DB_CR_TYPE_DEBIT then
            StoredProc('dbo.save_to_item_balance')
          else
            StoredProc('dbo.save_to_item_balance_out');
        //  AddParamInteger('@ship_id',FShipId);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamDate('@balance_date',FShipDate);

          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId,pdOutput);
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
              AddParamString('@@balance_concerned','',pdOutput,150);
              AddParamFloat('@@real_value',ADetail[i].RealValue,pdOutput);
          end;
          ExecStoredProc;
          ADetail[i].ItemBalance.ItemBalanceId := GetParamOutput('@@item_balance_id');
          if ADetail[i].DbCrType = DB_CR_TYPE_CREDIT then begin
            ADetail[I].BalanceInConcerned := GetParamOutput('@@balance_concerned');
            ADetail[i].RealValue := GetParamOutput('@@real_value');
          end
          else begin
            ADetail[i].BalanceInConcerned := '';
            ADetail[i].RealValue := 0;
          end;
          StoredProc('dbo.insert_to_item_detail');
          AddParamInteger('@ship_id',FShipId);
          AddParamDate('@trans_date',FShipDate);
          AddParamInteger('@item_id',ADetail[i].ItemBalance.Items.ItemId);
          AddParamFloat('@quantity',ADetail[i].Quantity);
          AddParamFloat('@price',ADetail[i].Price);
          AddParamString('@db_cr_type',ADetail[i].DbCrType);
          AddParamInteger('@item_balance_id',ADetail[i].ItemBalance.ItemBalanceId);
          AddParamFloat('@conversion',ADetail[i].Conversion);
          AddParamString('@ship_type',FShipType);
          AddParamInteger('@serv_ship_id',0);
          AddParamFloat('@amount',ADetail[i].Amount);
          AddParamFloat('@discount',ADetail[i].Discount);
          AddParamString('@balance_concerned',ADetail[i].BalanceInConcerned);
          AddParamFloat('@real_value',ADetail[i].RealValue);
         // if (TItems.isZeroPricePurchase(ADetail[i].FItemBalance.Items.ItemId)) AND
         //poko namah setiap ada penerimaan baran baru update harganya
           IF  (FShipType[1] in [SHIP_TYPE_TERIMA_BARANG]) then begin
              ADetail[i].ItemBalance.Items.ItemId := ADetail[i].ItemBalance.Items.ItemId;
              ADetail[i].ItemBalance.Items.UserEdit := FUserInsert;
              ADetail[i].ItemBalance.Items.PricePurchase := ADetail[i].Price;
              TItems(ADetail[i].FItemBalance.Items).UpdatePricePurchase;
          end;
          ExecStoredProc;
        end;
     MyConnection.EndSQL;
     Result := TRUE;
   except
     Result := False;
     MyConnection.UndoSQL;
   end;


end;

{ TItemDetail_Arr }

function TItemDetail_Arr.countFindRekapStokNew(
  WithStokZero: boolean): integer;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
    vDate,vDateAkhir : TDate;
begin
  vFilter := '';
  if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
    vDate := 0
  else
    vDate := GlobalPeriode.PeriodeAwal1-1;

  if GlobalPeriode.OpPeriodeAwal1 in[soEquals,soLessThan,soLessThanEqualsTo] then
    vDateAkhir := GlobalPeriode.PeriodeAwal1
  else
    vDateAkhir := GlobalPeriode.PeriodeAkhir1;

  SQL := 'SELECT b.balance_date,b.balance, b.db_balance, b.cr_balance,b.price '+
         ' ,i.item_id, i.item_name, b.item_balance_id '+
          ' FROM item_balance b, items i '+
          ' WHERE b.item_id = i.item_id ';
  SQL := 'SELECT DISTINCT i.item_id, i.item_code, i.item_name, i.used_unit, i.stok_limit, '+
        ' dbo.get_stok_periode(i.item_id,'+FormatSQLDate(vDate)+') as SAwal, '+
        ' (select isnull(sum(quantity),0) From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  item_id = i.item_id and db_cr_type = ''C'''+
            IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
            ' ) as keluar, '+
        ' (select isnull(sum(quantity),0) From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  item_id = i.item_id and db_cr_type = ''D'''+
            IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
        ' ) as masuk '+
//        IfThen(GlobalPeriode.OpPeriodeAwal1 = soGreaterThanEqualsTo,' dbo.get_stok_onhand(i.item_id) ',
  //       ' dbo.get_stok_periode(i.item_id,'+FormatSQLDate(vDateAkhir)+') as SAKhir ')+
        ' FROM items i '+IfThen(WithStokZero,'LEFT','INNER')+' JOIN item_detail d on i.item_id = d.item_id ';
     //     ' LEFT JOIN item_balance b ON b.item_id = i.item_id ';
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId);
  if FFilter.ItemBalance.Items.ItemCode <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemCode+'%'));
   if  FFilter.ItemBalance.Items.ItemName <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemName+'%'));
//  if GlobalPeriode.PeriodeAwal1 <> 0 then
 //   vFilter := vFilter + ' AND b.balance_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
//  if GlobalPeriode.PeriodeAkhir1 <> 0 then
 //   vFilter := vFilter + ' AND b.balance_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if not WithStokZero then
    vFilter := vFilter + ' AND dbo.get_stok_onhand(i.item_id) > 0 ';
  if vFilter <> '' then
    SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFilter)) ;
 // buffer := MyConnection.OpenSQL(SQL+' ORDER BY i.item_code ');
 Result := getIntegerFromSQL(SQL);



end;

constructor TItemDetail_Arr.Create;
begin
  SetLength(FItemDetail_Arr,0);
  inherited Create;
  FFilter := TItemDetail.Create;
end;

destructor TItemDetail_Arr.Destroy;
begin
  FFilter.Free;

  inherited;
end;

function TItemDetail_Arr.FindKartuStok: boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT s.ship_id, s.ship_date, s.ship_num, d.quantity, d.db_cr_type '+
        ' ,s.ship_type, d.price, d.amount, d.is_ksg '+
        ' FROM item_detail d, item_balance b, shipment s '+
        ' WHERE d.item_balance_id = b.item_balance_id AND s.ship_id = d.ship_id ';
  if FFilter.Shipment.ShipId <> 0 then
    vFilter := vFilter + ' AND d.ship_id = '+FormatSQLNumber(FFilter.FShipment.ShipId);

  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId);
  if FFilter.ItemBalance.ItemBalanceId <> 0 then
    vFilter := vFilter + ' AND d.item_balance_id = '+FormatSQLNumber(FFilter.FItemBalance.ItemBalanceId);
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+ ' ORDER BY s.ship_date,d.db_Cr_type DESC,s.ship_id');
  Result := (buffer.recordcount<>0);
  Self.Clear;
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(0,0,BufferToFloat(Fields[3].Value),BufferToFloat(Fields[6].Value),
                0,BufferToFloat(Fields[7].Value),BufferToString(Fields[4].Value),0,0,0,0,'',0,
                BufferToBoolean(Fields[8].Value));
      FItemDetail_Arr[idx].Shipment.ShipId  := BufferToInteger(Fields[0].Value);
      FItemDetail_Arr[idx].Shipment.ShipDate:= BufferToDateTime(Fields[1].Value);
      FItemDetail_Arr[idx].Shipment.ShipNum := BufferToString(Fields[2].Value);
      FItemDetail_Arr[idx].Shipment.ShipType:= BufferToString(Fields[5].Value);
      moveNext;
    end;
  buffer.close;
end;

function TItemDetail_Arr.FindOnDB(AShipSeq: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT d.item_detail_id, d.item_balance_id, d.quantity, d.price, d.amount,d.db_cr_type, d.ship_id '+
    {7}    ' ,i.item_code, i.item_name, i.used_unit, d.conversion,i.purchase_unit,i.item_type '+
        ' ,d.discount, b.item_id, d.service_parent, d.is_ksg,d.stok '+
        ' FROM item_detail d, item_balance b, items i '+
        ' WHERE d.item_balance_id = b.item_balance_id AND b.item_id = i.item_id ';
  if AShipSeq <> 0 then
    vFilter := vFilter + ' AND d.ship_id = '+FormatSQLNumber(AShipSeq);

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+' Order By i.item_code');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
                BufferToFloat(Fields[2].Value),BufferToFloat(Fields[3].Value),
                BufferToFloat(Fields[10].Value),BufferToFloat(Fields[4].Value),
                BufferToString(Fields[5].Value),BufferToInteger(Fields[6].Value),
                BufferToFloat(Fields[13].Value),BufferToInteger(Fields[15].Value),0,'',0,
                BufferToBoolean(Fields[16].Value));
      FItemDetail_Arr[idx].ItemBalance.Items.ItemCode := BufferToString(Fields[7].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemName := BufferToString(Fields[8].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.UsedUnit := BufferToString(Fields[9].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.PurchaseUnit := BufferToString(Fields[11].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemType := BufferToString(Fields[12].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemId   := BufferToInteger(Fields[14].Value);
      FItemDetail_Arr[idx].Stok := BufferToFloat(Fields[17].Value);
      moveNext;
    end;
  buffer.close;

end;

function TItemDetail_Arr.FindOnDBEstimasi(AShipSeq: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT d.estimasi_detail_id, 0, d.quantity, d.price, d.amount,d.db_cr_type, d.estimasi_id '+
    {7}    ' ,i.item_code, i.item_name, i.used_unit, d.conversion,i.purchase_unit,i.item_type '+
        ' ,d.discount, d.item_id, d.service_parent, d.is_ksg '+
        ' FROM estimasi_detail d, items i '+
        ' WHERE d.item_id = i.item_id ';
  if AShipSeq <> 0 then
    vFilter := vFilter + ' AND d.estimasi_id = '+FormatSQLNumber(AShipSeq);

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+' Order By i.item_code');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
                BufferToFloat(Fields[2].Value),BufferToFloat(Fields[3].Value),
                BufferToFloat(Fields[10].Value),BufferToFloat(Fields[4].Value),
                BufferToString(Fields[5].Value),BufferToInteger(Fields[6].Value),
                BufferToFloat(Fields[13].Value),BufferToInteger(Fields[15].Value),0,'',0,
                BufferToBoolean(Fields[16].Value));
      FItemDetail_Arr[idx].ItemBalance.Items.ItemCode := BufferToString(Fields[7].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemName := BufferToString(Fields[8].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.UsedUnit := BufferToString(Fields[9].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.PurchaseUnit := BufferToString(Fields[11].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemType := BufferToString(Fields[12].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemId   := BufferToInteger(Fields[14].Value);
      moveNext;
    end;
  buffer.close;
end;

function TItemDetail_Arr.FindRekapitulasi(vPostCriteria:TBooleanOperator): boolean;
var SQL,SQLDmp, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT   i.item_code, i.item_name,d.quantity, d.price, d.amount, d.discount, s.ship_num, s.is_post '+
        ' ,S.Ship_service_type, d.service_parent, d.is_ksg '+
        ' FROM dbo.Item_Detail d INNER JOIN '+
        ' dbo.Item_Balance b ON d.item_balance_id = b.item_balance_id INNER JOIN '+
        ' dbo.Items i ON b.item_id = i.item_id INNER JOIN  '+
        ' dbo.Shipment s ON d.ship_id = s.ship_id';
  SQLDmp := 'SELECT   i.item_code, i.item_name,d.quantity, d.price, d.amount, d.discount, s.ship_num, s.is_post '+
        ' ,S.Ship_service_type, d.service_parent, d.is_ksg '+
        ' FROM dbo.Dummy_Item_Detail d INNER JOIN '+
        ' dbo.Items i ON d.item_id = i.item_id INNER JOIN  '+
        ' dbo.Shipment s ON d.ship_id = s.ship_id';

  if FFilter.Shipment.ShipId <> 0 then
    vFilter := vFilter + ' AND d.ship_id = '+FormatSQLNumber(FFilter.FShipment.ShipId);

  if FFilter.Shipment.ShipType <> '' then
    vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.FShipment.ShipType);
  if FFilter.Shipment.ShipServiceType <> '' then
    vFilter := vFilter + ' AND s.ship_service_type = '+FormatSQLString(FFilter.FShipment.ShipServiceType);

  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);

  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId);
  if FFilter.ItemBalance.Items.ItemType <> '' then
    vFilter := vFilter + ' AND i.item_type ='+FormatSQLString(FFilter.ItemBalance.Items.ItemType);
  if FFilter.ItemBalance.Items.ItemCode <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemCode+'%'));
   if  FFilter.ItemBalance.Items.ItemName <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemName+'%'));
  //if FFilter.ItemBalance.ItemBalanceId <> 0 then
   // vFilter := vFilter + ' AND d.item_balance_id = '+FormatSQLNumber(FFilter.FItemBalance.ItemBalanceId);

  if vFilter <> '' then begin
    SQL := SQL + ' WHERE'+copy(vFilter,5,length(vFilter));
    SQLDmp := SQLDmp + ' WHERE'+copy(vFilter,5,length(vFilter));
  end;
  if vPostCriteria = boTrue then
     SQL := SQL
  else if vPostCriteria = boFalse then
     SQL := SQLDmp
  else
    SQL := SQL + ' UNION ALL '+SQLDmp;
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(0,0,BufferToFloat(Fields[2].Value),BufferToFloat(Fields[3].Value),
            0,BufferToFloat(Fields[4].Value),'',0,BufferToFloat(Fields[5].Value),BufferToInteger(Fields[9].Value),0,'',0,
            BufferToBoolean(Fields[10].Value));
      FItemDetail_Arr[idx].ItemBalance.Items.ItemCode := BufferToString(Fields[0].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemName := BufferToString(Fields[1].Value);
      FItemDetail_Arr[idx].Shipment.ShipNum := BufferToString(Fields[6].Value);
      FItemDetail_Arr[idx].Shipment.IsPost  := BufferToBoolean(Fields[7].Value);
      FItemDetail_Arr[idx].Shipment.ShipServiceType := BufferToString(Fields[8].Value);
      moveNext;
    end;
  buffer.close;
end;

function TItemDetail_Arr.FindRekapStok: boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT b.balance_date,b.balance, b.db_balance, b.cr_balance,b.price '+
         ' ,i.item_id, i.item_name, b.item_balance_id '+
          ' FROM item_balance b, items i '+
          ' WHERE b.item_id = i.item_id ';
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId);
  if FFilter.ItemBalance.Items.ItemCode <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemCode+'%'));
   if  FFilter.ItemBalance.Items.ItemName <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemName+'%'));
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+' ORDER BY i.item_name, b.balance_date ');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(0,BufferToInteger(Fields[7].Value),0,0,0,0,'',0,0,0,0,'',0,False);
      FItemDetail_Arr[idx].ItemBalance.BalanceDate := BufferToDateTime(Fields[0].Value);
      FItemDetail_Arr[idx].ItemBalance.Balance     := BufferToFloat(Fields[1].Value);
      FItemDetail_Arr[idx].ItemBalance.DbBalance   := BufferToFloat(Fields[2].Value);
      FItemDetail_Arr[idx].ItemBalance.CrBalance   := BufferToFloat(Fields[3].Value);
      FItemDetail_Arr[idx].ItemBalance.Price       := BufferToFloat(Fields[4].Value);

      moveNext;
    end;
  buffer.close;

end;

function TItemDetail_Arr.FindRekapStokNew(WithStokZero:boolean=true;limit:integer=25;offset:integer=0): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
    vDate,vDateAkhir : TDate;
begin
  vFilter := '';
  if (GlobalPeriode.OpPeriodeAwal1 = soLessThan) or (GlobalPeriode.OpPeriodeAwal1 = soLessThanEqualsTo) then
    vDate := 0
  else
    vDate := GlobalPeriode.PeriodeAwal1-1;

  if GlobalPeriode.OpPeriodeAwal1 in[soEquals,soLessThan,soLessThanEqualsTo] then
    vDateAkhir := GlobalPeriode.PeriodeAwal1
  else
    vDateAkhir := GlobalPeriode.PeriodeAkhir1;

  SQL := 'SELECT b.balance_date,b.balance, b.db_balance, b.cr_balance,b.price '+
         ' ,i.item_id, i.item_name, b.item_balance_id '+
          ' FROM item_balance b, items i '+
          ' WHERE b.item_id = i.item_id ';
  SQL := 'SELECT DISTINCT i.item_id, i.item_code, i.item_name, i.used_unit, i.stok_limit, '+
        ' dbo.get_stok_periode(i.item_id,'+FormatSQLDate(vDate)+') as SAwal, '+
        ' (select isnull(sum(quantity),0) From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  item_id = i.item_id and db_cr_type = ''C'''+
            IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
            ' ) as keluar, '+
        ' (select isnull(sum(quantity),0) From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  item_id = i.item_id and db_cr_type = ''D'''+
            IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
        ' ) as masuk '+
//        IfThen(GlobalPeriode.OpPeriodeAwal1 = soGreaterThanEqualsTo,' dbo.get_stok_onhand(i.item_id) ',
  //       ' dbo.get_stok_periode(i.item_id,'+FormatSQLDate(vDateAkhir)+') as SAKhir ')+
        ' FROM items i '+IfThen(WithStokZero,'LEFT','INNER')+' JOIN item_detail d on i.item_id = d.item_id ';
     //     ' LEFT JOIN item_balance b ON b.item_id = i.item_id ';
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND i.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId);
  if FFilter.ItemBalance.Items.ItemCode <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_code) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemCode+'%'));
   if  FFilter.ItemBalance.Items.ItemName <> '' then
     vFilter := vFilter + ' AND UPPER(i.item_name) LIKE '+FormatSQLWildCard(UpperCase( FFilter.ItemBalance.Items.ItemName+'%'));
//  if GlobalPeriode.PeriodeAwal1 <> 0 then
 //   vFilter := vFilter + ' AND b.balance_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
//  if GlobalPeriode.PeriodeAkhir1 <> 0 then
 //   vFilter := vFilter + ' AND b.balance_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if not WithStokZero then
    vFilter := vFilter + ' AND dbo.get_stok_onhand(i.item_id) > 0 ';
  if vFilter <> '' then
    SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFilter)) ;
  buffer := MyConnection.OpenSQL(SQL+' ORDER BY i.item_code ');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin             //nginjem field quantity
      idx := Add(0,0,0,0,0,0,'',0,0,0,0,'',0,False);
//      FItemDetail_Arr[idx].ItemBalance.BalanceDate := BufferToDateTime(Fields[0].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemId := BufferToInteger(Fields[0].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemCode := BufferToString(Fields[1].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.ItemName := BufferToString(Fields[2].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.UsedUnit := BufferToString(Fields[3].Value);
      FItemDetail_Arr[idx].ItemBalance.Items.StokLimit:= BufferToInteger(Fields[4].Value);
      FItemDetail_Arr[idx].ItemBalance.Balance     := BufferToFloat(Fields[5].Value);
      FItemDetail_Arr[idx].ItemBalance.DbBalance   := BufferToFloat(Fields[7].Value);
      FItemDetail_Arr[idx].ItemBalance.CrBalance   := BufferToFloat(Fields[6].Value);

  //    FItemDetail_Arr[idx].ItemBalance.Price       := BufferToFloat(Fields[4].Value);

      moveNext;
    end;
  buffer.close;


end;

function TItemDetail_Arr.get(Index: integer): TItemDetail;
begin
  Result := TItemDetail(inherited get(Index));
end;

class function TItemDetail_Arr.getPembelian(Periode: TPeriode): Double;
var sql:string;
begin
  sql := 'SELECT SUM(d.quantity * d.price) '+
          ' FROM item_detail d, shipment s '+
          ' WHERE d.ship_id = s.ship_id '+
          ' AND s.ship_type IN ('+FormatSQLString(SHIP_TYPE_TERIMA_BARANG)+','+
            FormatSQLString(SHIP_TYPE_MUTASI_MASUK)+')'+
            IfThen(Periode.PeriodeAwal1<>0, ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(Periode.OpPeriodeAwal1)+FormatSQLDate(Periode.PeriodeAwal1))+
            IfThen(Periode.PeriodeAkhir1<>0, ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(Periode.OpPeriodeAkhir1)+FormatSQLDate(Periode.PeriodeAkhir1));
  Result := getFloatFromSQL(sql);
end;

class function TItemDetail_Arr.getPersediaan(isAwal,isAKhir: boolean;
  Periode: TPeriode): Double;
var sql:string;
begin
  if isAwal then
    sql := 'SELECT SUM(b.balance * b.price) '+
          ' FROM item_balance b '+
          ' WHERE b.balance_date < '+FormatSQLDate(Periode.PeriodeAwal1)
  else if isAkhir then
    sql := 'select dbo.get_stokvalue_onhand_periode('+
            FormatSQLDate(IfThen(Periode.PeriodeAkhir1=0,Periode.PeriodeAwal1,Periode.PeriodeAkhir1))+')'
  else
    sql := 'SELECT SUM(b.balance * b.price) '+
          ' FROM item_balance b '+
          ' WHERE b.balance_date >='+FormatSQLDate(Periode.PeriodeAwal1)+
          ' AND b.balance_date <= '+FormatSQLDate(Periode.PeriodeAkhir1);
  Result := getFloatFromSQL(sql);
end;

function TItemDetail_Arr.New: TItemDetail;
begin
  Result := TItemDetail.Create;
end;

{ TShipment_Arr }

constructor TShipment_Arr.Create;
begin
  FFilter := TItemDetail.Create;
  inherited Create;
end;

destructor TShipment_Arr.Destroy;
begin
  FFilter.Free;

  inherited;
end;

function TShipment_Arr.FindGlobalPart: boolean;
var SQL,vFilter:string;
begin
  vFilter := '';
  SQL := 'select distinct i.item_code, i.item_name, Sum(d.quantity),i.price,sum(d.discount),sum(d.amount) '+
          ' from shipment s, item_detail d, items i '+
        ' where s.ship_id = d.ship_id and d.item_id = i.item_id ';
  if FFilter.Shipment.ShipType <> '' then begin
   // if AService2 <> '' then
    //  vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    //else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

//  if PostCriteria then
  //  vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%') +') ';
  if FFilter.Shipment.Persons.PersonName <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_name LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonName+'%') +') ';

  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  if (FFilter.ItemBalance.Items.ItemCode <> '') then //begin
    // or (FFilter.ItemBalance.Items.ItemName <> '') then begin
     vFilter := vFilter + ' AND upper(i.item_code) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%');
    {vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';}
  if (FFilter.ItemBalance.Items.ItemName <> '') then
     vFilter := vFilter + ' AND upper(i.item_name) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%');
  //end;

  if vFilter <> '' then
    SQL := SQL + vFilter;
  FGBuffer := MyConnection.OpenSQL(SQL+' GROUP BY i.item_code, i.item_name,i.price order by  i.item_code');
  Result := FGBuffer.RecordCount>0;


end;

function TShipment_Arr.FindGlobalPartHistory: boolean;
var SQL,vFilter:string;
begin

  vFilter := '';
  //01.08.-07  distinct dihilangkan
  SQL := 'select i.item_code, i.item_name, d.quantity,d.price,d.discount,d.amount '+
          ' from shipment s, item_detail d, items i '+
        ' where s.ship_id = d.ship_id and d.item_id = i.item_id ';
  if FFilter.Shipment.ShipType <> '' then begin
   // if AService2 <> '' then
    //  vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    //else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

//  if PostCriteria then
  //  vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%') +') ';
  if FFilter.Shipment.Persons.PersonName <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_name LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonName+'%') +') ';

  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  if (FFilter.ItemBalance.Items.ItemCode <> '') then //begin
    // or (FFilter.ItemBalance.Items.ItemName <> '') then begin
     vFilter := vFilter + ' AND upper(i.item_code) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%');
    {vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';}
  if (FFilter.ItemBalance.Items.ItemName <> '') then
     vFilter := vFilter + ' AND upper(i.item_name) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%');
  //end;

  if vFilter <> '' then
    SQL := SQL + vFilter;
  FGBuffer := MyConnection.OpenSQL(SQL+' order BY i.item_code');
  Result := FGBuffer.RecordCount>0;
end;

function TShipment_Arr.FindKhusus: boolean;
var SQL,vFilter:string;
begin
  vFilter := '';
  SQL := 'select distinct s.expr_date, p.person_name, i.item_code, i.item_name,d.real_value,d.price,d.quantity,d.discount,s.ship_id , s.kilometer, s.nopol '+
          ' from shipment s left join persons p on s.person_id = p.person_id inner join  item_detail d on d.ship_id=s.ship_id '+
          ' inner join items i on d.item_id = i.item_id ';
//        ' where s.person_id = p.person_id and s.ship_id = d.ship_id and d.item_id = i.item_id ';
  if FFilter.Shipment.ShipType <> '' then begin
   // if AService2 <> '' then
    //  vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    //else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

//  if PostCriteria then
  //  vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then
//    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
    vFilter := vFilter + ' AND (p.person_code  LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%')+
          ' or p.person_name like ' +FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%')+
          ' or s.nopol like ' +FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%')+') ';
//  if FFilter.Shipment.Persons.PersonName <> '' then
  //  vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_name LIKE '+
    //      FormatSQLWildCard(FFilter.Shipment.Persons.PersonName+'%') +') ';

  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  if (FFilter.ItemBalance.Items.ItemCode <> '') then //begin
    // or (FFilter.ItemBalance.Items.ItemName <> '') then begin
     vFilter := vFilter + ' AND upper(i.item_code) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%');
    {vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';}
  if (FFilter.ItemBalance.Items.ItemName <> '') then
     vFilter := vFilter + ' AND upper(i.item_name) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%');
  //end;

  if vFilter <> '' then
    SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFilter));
  FGBuffer := MyConnection.OpenSQL(SQL+' order by  s.expr_date,p.person_name,i.item_code');
  Result := FGBuffer.RecordCount>0;

end;

function TShipment_Arr.FindKhususService(serviceId:integer): boolean;
var SQL,vFilter:string;
begin
  vFilter := '';
  SQL := 'select distinct s.expr_date, p.person_name, i.service_code, i.service_name,0 as real_value,d.price,d.quantity,d.discount,s.ship_id , s.kilometer, s.nopol '+
         '  from shipment s left join persons p on s.person_id = p.person_id inner join  service_detail d on d.ship_id=s.ship_id '+
          ' inner join services i on d.service_id = i.service_id '+
        ' where s.ship_id = '+FormatSQLNumber(serviceId);

  FGBuffer := MyConnection.OpenSQL(SQL+' order by  s.expr_date,p.person_name,i.service_code');
  Result := FGBuffer.RecordCount>0;

end;

function TShipment_Arr.FindKhususWithService: boolean;
var SQL,vFilter,vFilterService,SQLService:string;
begin
  vFilter := '';
  SQL := 'select distinct s.expr_date, p.person_name, i.item_code, i.item_name,d.real_value,d.price,d.quantity,d.discount,s.ship_id , s.kilometer, s.nopol '+
          ' from shipment s left join persons p on s.person_id = p.person_id inner join  item_detail d on d.ship_id=s.ship_id '+
          ' inner join items i on d.item_id = i.item_id ';
//        ' where s.person_id = p.person_id and s.ship_id = d.ship_id and d.item_id = i.item_id ';
  if FFilter.Shipment.ShipType <> '' then begin
   // if AService2 <> '' then
    //  vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    //else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

//  if PostCriteria then
  //  vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then
//    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
    vFilter := vFilter + ' AND (p.person_code  LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%')+
          ' or p.person_name like ' +FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%')+
          ' or s.nopol like ' +FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%')+') ';
//  if FFilter.Shipment.Persons.PersonName <> '' then
  //  vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_name LIKE '+
    //      FormatSQLWildCard(FFilter.Shipment.Persons.PersonName+'%') +') ';

  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  vFilterService := vFilter;

  if FFilter.ItemBalance.Items.ItemId <> 0 then begin
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
    vFilterService := vFilterService + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM service_detail d, services i'+
      ' WHERE d.service_id = i.service_id AND d.service_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  end;

  if (FFilter.ItemBalance.Items.ItemCode <> '') then begin
    // or (FFilter.ItemBalance.Items.ItemName <> '') then begin
     vFilter := vFilter + ' AND upper(i.item_code) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%');
     vFilterService := vFilterService + ' AND upper(i.service_code) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%');
    {vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';}
  end;

  if (FFilter.ItemBalance.Items.ItemName <> '') then begin
     vFilter := vFilter + ' AND upper(i.item_name) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%');
     vFilterService := vFilterService + ' AND upper(i.service_name) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%');
  end;

  SQLService := ' union '+
        ' select distinct s.expr_date, p.person_name, i.service_code, i.service_name,0 as real_value,d.price,d.quantity,d.discount,'+
        ' s.ship_id , s.kilometer, s.nopol  from shipment s left join persons p on s.person_id = p.person_id '+
        ' inner join  service_detail d on d.ship_id=s.ship_id  inner join services i on d.service_id = i.service_id ';
  if vFilter <> '' then begin
    SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFilter));
    SQLService := SQLService + ' WHERE '+copy(vFilterService,5,length(vFilterService));
  end;

  SQL := SQL + SQLService;
  FGBuffer := MyConnection.OpenSQL(SQL+' order by  s.expr_date,p.person_name,i.item_code');
  Result := FGBuffer.RecordCount>0;

end;

function TShipment_Arr.FindLapClaim: boolean;
var SQL,vFilter:string;
begin
  vFilter := '';
  SQL := 'select distinct s.ship_date, s.notes,i.item_code, i.item_name,i.price_purchase,d.price,d.quantity,d.discount,s.ship_id,d.amount '+
          ' from shipment s, item_detail d, items i '+
        ' where  s.ship_id = d.ship_id and d.item_id = i.item_id ';
  if FFilter.Shipment.ShipType <> '' then begin
   // if AService2 <> '' then
    //  vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    //else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

//  if PostCriteria then
  //  vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonCode+'%') +') ';
  if FFilter.Shipment.Persons.PersonName <> '' then
    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_name LIKE '+
          FormatSQLWildCard(FFilter.Shipment.Persons.PersonName+'%') +') ';

  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  if (FFilter.ItemBalance.Items.ItemCode <> '') then //begin
    // or (FFilter.ItemBalance.Items.ItemName <> '') then begin
     vFilter := vFilter + ' AND upper(i.item_code) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%');
    {vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';}
  if (FFilter.ItemBalance.Items.ItemName <> '') then
     vFilter := vFilter + ' AND upper(i.item_name) LIKE '+ FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%');
  //end;

  if vFilter <> '' then
    SQL := SQL + vFilter;
  FGBuffer := MyConnection.OpenSQL(SQL+' order by  s.ship_date,s.notes,i.item_code');
  Result := FGBuffer.RecordCount>0;


end;

function TShipment_Arr.FindOnDb(AService2:string;PostCriteria:Boolean): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT S.Ship_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date,S.Person_id,s.Mekanik_id, S.Notes, '+
      ' s.subtotal, s.discount, s.ppn, s.total,S.User_Insert, s.wh_id, s.wh_id_out,s.ship_id_used '+
      ' ,s.is_post, s.ship_service_type, s.expr_date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,S.nopol '+
     ' FROM Shipment S left outer join persons p on s.person_id = p.person_id ';
  if FFilter.Shipment.ShipType <> '' then begin
    if AService2 <> '' then
      vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

  if PostCriteria then
    vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then begin
//    vFilter := vFilter + ' AND upper(p.person_code) LIKE '+
    vFilter := vFilter + ' AND (upper(s.nopol) LIKE '+
          FormatSQLWildCard(UpperCase(FFilter.Shipment.Persons.PersonCode)+'%');// +') ';
  //if FFilter.Shipment.Persons.PersonName <> '' then
    vFilter := vFilter + ' or upper(p.person_name) LIKE '+
          FormatSQLWildCard(UpperCase(FFilter.Shipment.Persons.PersonName)+'%')+')' ;// +') ';
   end;
  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  if (FFilter.ItemBalance.Items.ItemCode <> '') or (FFilter.ItemBalance.Items.ItemName <> '') then begin
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d, item_balance b, items i'+
      ' WHERE b.item_balance_id = d.item_balance_id AND d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';
  end;

//filter kendaraan part
  if (FFilter.ItemBalance.Items.UserInsert <> '') then begin
    vFilter := vFilter + ' AND s.ship_id IN (SELECT DISTINCT ship_id FROM item_detail d left join item_balance b on b.item_balance_id = d.item_balance_id '+
    ' inner join  items i on d.item_id = i.item_id '+
    ' left join motor m on i.car_id = m.motor_id '+
      ' WHERE  UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.ItemBalance.Items.UserInsert+'%'))+')';
//       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';
  end;

  //if FFilter.UserInsert <> '' then
//     vFilter := vFilter + ' AND UPPER(m.motor_name) LIKE '+FormatSQLWildCard(UpperCase(FFilter.UserInsert+'%'));

  if vFilter <> '' then
    SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFIlter));
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx:=Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
              BufferToString(Fields[2].Value),BufferToDateTime(Fields[3].Value),
              BufferToInteger(Fields[4].Value),BufferToInteger(Fields[5].Value),
              BufferToString(Fields[6].Value),BufferToFloat(Fields[7].Value),
              BufferToFloat(Fields[8].Value),BufferToFloat(Fields[9].Value),
              BufferToFloat(Fields[10].Value),BufferToString(Fields[11].Value),'',0,0,
              BufferToInteger(Fields[14].Value),BufferToInteger(Fields[12].Value),
              BufferToInteger(Fields[13].Value),BufferToDateTime(Fields[17].Value),BufferToBoolean(Fields[15].Value),
              BufferToString(Fields[16].Value),0,BufferToDateTime(Fields[18].Value),
              BufferToDateTime(Fields[19].Value),BufferToString(Fields[20].Value));
      FShipment_Arr[idx].NoPol := BufferToString(buffer.Fields[21].Value);
      moveNext;
    end;
  buffer.close;

end;


function TShipment_Arr.FindOnDbEstimasi(AService2: string;
  PostCriteria: Boolean): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT S.estimasi_Id, S.Ship_Num, S.Ship_Type, S.Ship_Date,S.Person_id,s.Mekanik_id, S.Notes, '+
      ' s.subtotal, s.discount, s.ppn, s.total,S.User_Insert, s.wh_id, s.wh_id_out,s.ship_id_used '+
      ' ,s.is_post, s.ship_service_type, s.expr_date, s.tgl_kirim, s.tgl_sampai, s.delivery_num,S.nopol '+
     ' FROM Estimasi S left outer join persons p on s.person_id = p.person_id ';
  if FFilter.Shipment.ShipType <> '' then begin
    if AService2 <> '' then
      vFilter := vFilter + ' AND s.ship_type IN ('+FormatSQLString(FFilter.Shipment.ShipType)+','+AService2+')'
    else
      vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.Shipment.ShipType);
  end;

  if PostCriteria then
    vFilter := vFilter + ' AND s.is_post = '+FormatSQLBoolean(FFilter.FShipment.IsPost);

  if (Filter.Shipment.ShipServiceType <> '') then
    vFilter := vFilter + ' AND s.ship_service_type ='+FormatSQLString(FFilter.Shipment.ShipServiceType);

  if (Filter.Shipment.ShipNum <> '') then
    vFilter := vFilter + ' AND s.ship_num ='+FormatSQLString(FFilter.Shipment.ShipNum);

  if FFilter.Shipment.Persons.PersonId <> 0 then
    vFilter := vFilter + ' AND s.person_id = '+FormatSQLNumber(FFilter.Shipment.Persons.PersonId);
  if FFilter.Shipment.Persons.PersonCode <> '' then
//    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_code LIKE '+
    vFilter := vFilter + ' AND upper(p.person_code) LIKE '+
          FormatSQLWildCard(UpperCase(FFilter.Shipment.Persons.PersonCode)+'%');// +') ';
  if FFilter.Shipment.Persons.PersonName <> '' then
//    vFilter := vFilter + ' AND s.person_id IN (SELECT person_id FROM persons WHERE person_name LIKE '+
    vFilter := vFilter + ' AND upper(p.person_name) LIKE '+
          FormatSQLWildCard(UpperCase(FFilter.Shipment.Persons.PersonName)+'%');// +') ';

  if FFilter.Shipment.PersonsMekanik_Id.PersonId >0 then
    vFilter := vFilter + ' AND s.mekanik_id ='+FormatSQLNumber(FFilter.Shipment.PersonsMekanik_Id.PersonId);
  if FFilter.Shipment.Warehouse.WhId <> 0 then
    vFilter := vFilter +' AND s.wh_id ='+FormatSQLNumber(FFilter.Shipment.Warehouse.WhId);
  if FFilter.Shipment.WhIdOut <> 0 then
    vFilter := vFilter +' AND s.wh_id_out ='+FormatSQLNumber(FFilter.Shipment.WhIdOut);
  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);

  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime)  '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.Expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);
  if FFilter.ItemBalance.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND s.estimasi_Id IN (SELECT DISTINCT estimasi_Id FROM estimasi_detail d, items i'+
      ' WHERE d.item d.item_id = i.item_id AND b.item_id ='+FormatSQLNumber(FFilter.ItemBalance.Items.ItemId)+') ';
  if (FFilter.ItemBalance.Items.ItemCode <> '') or (FFilter.ItemBalance.Items.ItemName <> '') then begin
    vFilter := vFilter + ' AND s.estimasi_Id IN (SELECT DISTINCT estimasi_Id FROM estimasi_detail d, items i'+
      ' WHERE d.item_id = i.item_id AND '+
      IfThen(FFilter.ItemBalance.Items.ItemCode <> '', 'upper(i.item_code) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemCode+'%'))+
       IfThen(FFilter.ItemBalance.Items.ItemName <> '', ' upper(i.item_name) LIKE '+FormatSQLWildCard(FFilter.ItemBalance.Items.ItemName+'%'))+') ';
  end;

  if vFilter <> '' then
    SQL := SQL + ' WHERE '+copy(vFilter,5,length(vFIlter));
  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx:=Add(BufferToInteger(Fields[0].Value),BufferToString(Fields[1].Value),
              BufferToString(Fields[2].Value),BufferToDateTime(Fields[3].Value),
              BufferToInteger(Fields[4].Value),BufferToInteger(Fields[5].Value),
              BufferToString(Fields[6].Value),BufferToFloat(Fields[7].Value),
              BufferToFloat(Fields[8].Value),BufferToFloat(Fields[9].Value),
              BufferToFloat(Fields[10].Value),BufferToString(Fields[11].Value),'',0,0,
              BufferToInteger(Fields[14].Value),BufferToInteger(Fields[12].Value),
              BufferToInteger(Fields[13].Value),BufferToDateTime(Fields[17].Value),BufferToBoolean(Fields[15].Value),
              BufferToString(Fields[16].Value),0,BufferToDateTime(Fields[18].Value),
              BufferToDateTime(Fields[19].Value),BufferToString(Fields[20].Value));
      FShipment_Arr[idx].NoPol := BufferToString(buffer.Fields[21].Value);
      moveNext;
    end;
  buffer.close;
end;

{ TItemBalance_Arr }

constructor TItemBalance_Arr.Create;
begin
  FFilter := TItemBalance.Create;
  inherited Create;
end;

destructor TItemBalance_Arr.Destroy;
begin
   FFilter.Free;
  inherited;
end;

function TItemBalance_Arr.FindStokValue(aZeroSTok:TBooleanOperator=boNone;WIthBalanceDate:boolean=True): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
    vMasuk, vKeluar : Double;

    function getQtyDetail(aItemId,aItemBalanceID:integer;adbCrType:string):Double;
    var x,y,jmlKoma:integer; vQty : Double;
        vBalanceId,vBalanceConcerned,vTmp,vConcernedCut : string;
         buffer2 : _recordset;
    begin
       Result := 0;
       SQL := ' select quantity, balance_in_concerned From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  item_id = '+FormatSQLNumber(aItemId)+
            ' and db_cr_type = '+FormatSQLString(adbCrType)+
            ' and ((id.item_balance_id = '+FormatSQLNumber(aItemBalanceID)+') or (id.balance_in_concerned like ''%''+cast('+FormatSQLNumber(aItemBalanceID)+' as varchar) +''%'') ) '+
            IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1));
       vBalanceId := IntToStr(aItemBalanceID);
       buffer2 := MyConnection.OpenSQL(SQL);
       for x := 0 to buffer2.RecordCount-1 do begin
          vBalanceConcerned := BufferToString(buffer2.Fields[1].Value);
          vQty := BufferToFloat(buffer2.Fields[0].Value);
          if vBalanceConcerned = '' then
            Result := Result + vQty
          else begin
          //hitung tanda koma di balance concerned ada berapa
             jmlKoma:= HitungChar(vBalanceConcerned,',');
             for y := 0 to jmlKoma do begin
               vConcernedCut := EkstrakString(vBalanceConcerned,',',y+1);
               vTmp := EkstrakString(vConcernedCut,'=',1);
               if vTmp = vBalanceId then 
                 Result := Result + StrToFloatDef(EkstrakString(vConcernedCut,'=',2),0);
             end;
           end; 
          buffer2.MoveNext;
       end;
       buffer2.Close;
    end;

begin
  vFilter := '';
  SQL := 'SELECT b.balance_date, b.balance, b.db_balance, b.cr_balance, b.price, b.item_id '+
          ', i.item_code, i.item_name, i.used_unit, i.purchase_unit, i.conversion '+
          ', b.item_balance_id '+
          ' FROM item_balance b, items i '+
          ' WHERE b.item_id = i.item_id ';

 //UPDATE 27.08.07
    sql:=     'SELECT DISTINCT b.balance_date, '+
        ' dbo.get_stok_periode(i.item_id,b.balance_date) as balance, '+
        ' (select isnull(sum(quantity),0) From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  item_id = i.item_id and db_cr_type = ''D'''+
            ' and ((id.item_balance_id = b.item_balance_id) or (id.balance_in_concerned like ''%''+cast(b.item_balance_id as varchar) +''%'') ) '+
            IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
            ' ) as masuk, '+
        ' (select isnull(sum(quantity),0) From item_detail id, shipment s  '+
            ' where s.ship_id = id.ship_id and  id.item_id = i.item_id and db_cr_type = ''C'''+
             ' and ((id.item_balance_id = b.item_balance_id) or (id.balance_in_concerned like ''%''+cast(b.item_balance_id as varchar) +''%'') ) '+
           IfThen(GlobalPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1))+
            IfThen(GlobalPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1))+
        ' ) as keluar '+
        ',b.price '+
        ',b.item_id, i.item_code, i.item_name, i.used_unit, i.purchase_unit, i.conversion '+
        ', b.item_balance_id '+
//        IfThen(GlobalPeriode.OpPeriodeAwal1 = soGreaterThanEqualsTo,' dbo.get_stok_onhand(i.item_id) ',
  //       ' dbo.get_stok_periode(i.item_id,'+FormatSQLDate(vDateAkhir)+') as SAKhir ')+
        ' FROM items i, item_balance b '+
        ' where i.item_id = b.item_id ';
        //+IfThen(WithStokZero,'LEFT','INNER')+' JOIN item_detail d on i.item_id = d.item_id ';


  SQL := 'SELECT b.balance_date, b.balance, b.db_balance, b.cr_balance, b.price, b.item_id '+
          ', i.item_code, i.item_name, i.used_unit, i.purchase_unit, i.conversion '+
          ', b.item_balance_id '+
          ' FROM item_balance b, items i '+
          ' WHERE b.item_id = i.item_id ';
      
  if FFilter.Items.ItemId <> 0 then
    vFilter := vFilter + ' AND b.item_id ='+ FormatSQLNumber(FFilter.FItems.ItemId);
  if WIthBalanceDate then begin
    if GlobalPeriode.PeriodeAwal1 <> 0 then
      vFilter := vFilter + ' AND b.balance_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
    if GlobalPeriode.PeriodeAkhir1 <> 0 then
      vFilter := vFilter + ' AND b.balance_date '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  end;
  if aZeroSTok <> boNone then
    vFilter := vFilter + ' AND b.balance '+IfThen(aZeroSTok=boTrue,'= 0','<> 0');

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+ ' ORDER BY i.item_name,b.balance_date');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
     vMasuk := getQtyDetail(BufferToInteger(Fields[5].Value),BufferToInteger(Fields[11].Value),
          DB_CR_TYPE_DEBIT);
     vKeluar := getQtyDetail(BufferToInteger(Fields[5].Value),BufferToInteger(Fields[11].Value),
          DB_CR_TYPE_CREDIT);
      idx:=Add(BufferToInteger(Fields[11].Value),BufferToInteger(Fields[5].Value),
          BufferToDateTime(Fields[0].Value),
          //BufferToFloat(Fields[1].Value),
          //BufferToFloat(Fields[2].Value)-BufferToFloat(Fields[3].Value),
          vMasuk - vKeluar,
          BufferToFloat(Fields[2].Value),
          BufferToFloat(Fields[3].Value),BufferToFloat(Fields[4].Value),0);
      FItemBalance_Arr[idx].Items.ItemCode := BufferToString(Fields[6].Value);
      FItemBalance_Arr[idx].Items.ItemName := BufferToString(Fields[7].Value);
      FItemBalance_Arr[idx].Items.UsedUnit := BufferToString(Fields[8].Value);
      FItemBalance_Arr[idx].Items.PurchaseUnit := BufferToString(Fields[9].Value);
      FItemBalance_Arr[idx].Items.Conversion := BufferToFloat(Fields[10].Value);    
      moveNext;
    end;
  buffer.close;

end;


{ TServiceDetail_Arr }

constructor TServiceDetail_Arr.Create;
begin
  inherited Create;
  SetLength(FServiceDetail_Arr,0);
  FFilter := TServiceDetail.Create;
end;

destructor TServiceDetail_Arr.Destroy;
begin

  FFilter.Free;
  inherited;
end;

function TServiceDetail_Arr.FindOnDb(AShipID: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT s.ship_id, s.service_id,s.quantity, s.price, s.discount, s.amount '+
          ' ,v.service_type,v.service_code, v.service_name, s.service_parent, s.is_ksg, s.service_detail_id '+
        ' FROM service_detail s, services v '+
        ' WHERE s.service_id = v.service_id and s.ship_id = '+FormatSQLNumber(AShipID);

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+ ' ORDER BY v.Service_Code');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[11].Value),BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
            BufferToFloat(Fields[2].Value),BufferToFloat(Fields[3].Value),
            BufferToFloat(Fields[5].Value),'',0,BufferToFloat(Fields[4].Value),BufferToInteger(Fields[9].Value),
            BufferToBoolean(Fields[10].Value));
      Self[idx].Services.ServiceType := BufferToString(Fields[6].Value);
      Self[idx].Services.ServiceCode := BufferToString(Fields[7].Value);
      Self[idx].Services.ServiceName := BufferToString(Fields[8].Value);
      moveNext;
    end;
  buffer.close;

end;

function TServiceDetail_Arr.FindOnDbEstimasi(AShipID: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT s.estimasi_id, s.service_id,s.quantity, s.price, s.discount, s.amount '+
          ' ,v.service_type,v.service_code, v.service_name, s.service_parent, s.is_ksg, s.estimasi_service_detail_id '+
        ' FROM estimasi_service_detail s, services v '+
        ' WHERE s.service_id = v.service_id and s.estimasi_id = '+FormatSQLNumber(AShipID);

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+ ' ORDER BY v.Service_Code');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[11].Value),BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
            BufferToFloat(Fields[2].Value),BufferToFloat(Fields[3].Value),
            BufferToFloat(Fields[5].Value),'',0,BufferToFloat(Fields[4].Value),BufferToInteger(Fields[9].Value),
            BufferToBoolean(Fields[10].Value));
      Self[idx].Services.ServiceType := BufferToString(Fields[6].Value);
      Self[idx].Services.ServiceCode := BufferToString(Fields[7].Value);
      Self[idx].Services.ServiceName := BufferToString(Fields[8].Value);
      moveNext;
    end;
  buffer.close;



end;

function TServiceDetail_Arr.FindRekapitulasi(aPostCriteria:TBooleanOperator): boolean;
var SQL, SQLDmp, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT v.service_code, v.service_name, d.quantity, d.price, d.discount, d.amount, s.ship_num, s.is_post '+
        ' ,S.Ship_service_type, d.service_parent, d.is_ksg  '+
        ' FROM dbo.service_detail d INNER JOIN '+
        '  dbo.Services v ON d.service_id = v.service_id INNER JOIN '+
        '  dbo.Shipment s ON d.ship_id = s.ship_id ';
  SQLDmp := '  SELECT v.service_code, v.service_name, d.quantity, d.price, d.discount, d.amount, s.ship_num, s.is_post '+
  ' ,S.Ship_service_type, d.service_parent, d.is_ksg '+
        ' FROM dbo.dummy_item_detail d INNER JOIN '+
        '  dbo.Services v ON d.service_id = v.service_id INNER JOIN '+
        '  dbo.Shipment s ON d.ship_id = s.ship_id ';

  if FFilter.Shipment.ShipId <> 0 then
    vFilter := vFilter + ' AND s.ship_id = '+FormatSQLNumber(FFilter.FShipment.ShipId);

  if FFilter.Shipment.ShipType <> '' then
    vFilter := vFilter + ' AND s.ship_type = '+FormatSQLString(FFilter.FShipment.ShipType);
  if FFilter.Shipment.ShipServiceType <> '' then
    vFilter := vFilter + ' AND s.ship_service_type = '+FormatSQLString(FFilter.FShipment.ShipServiceType);

  if GlobalPeriode.PeriodeAwal1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal1)+FormatSQLDate(GlobalPeriode.PeriodeAwal1);
  if GlobalPeriode.PeriodeAkhir1 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir1)+FormatSQLDate(GlobalPeriode.PeriodeAkhir1);
  if GlobalPeriode.PeriodeAwal2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAwal2)+FormatSQLDate(GlobalPeriode.PeriodeAwal2);
  if GlobalPeriode.PeriodeAkhir2 <> 0 then
    vFilter := vFilter + ' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(GlobalPeriode.OpPeriodeAkhir2)+FormatSQLDate(GlobalPeriode.PeriodeAkhir2);


  if FFilter.Services.ServiceId <> 0 then
    vFilter := vFilter + ' AND d.service_id ='+FormatSQLNumber(FFilter.Services.ServiceId);
  if FFilter.Services.ServiceType <> '' then
    vFilter := vFilter + ' AND v.service_type ='+FormatSQLString(FFilter.Services.ServiceType);


  if vFilter <> '' then begin
    SQL := SQL + ' WHERE'+copy(vFilter,5,length(vFilter));
    SQLDmp := SQLDmp + ' WHERE'+copy(vFilter,5,length(vFilter));
  end;

  if aPostCriteria = boTrue then
     SQL := SQL
  else if aPostCriteria = boFalse then
     SQL := SQLDmp
  else
    SQL := SQL + ' UNION ALL '+SQLDmp;

  buffer := MyConnection.OpenSQL(SQL);
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(0,0,0,BufferToFloat(Fields[2].Value),BufferToFloat(Fields[3].Value),
            BufferToFloat(Fields[5].Value),'',0,BufferToFloat(Fields[4].Value),
            BufferToInteger(Fields[9].Value),BufferToBoolean(Fields[10].Value));
      FServiceDetail_Arr[idx].Services.ServiceCode := BufferToString(Fields[0].Value);
      FServiceDetail_Arr[idx].Services.ServiceName := BufferToString(Fields[1].Value);
      FServiceDetail_Arr[idx].Shipment.ShipNum := BufferToString(Fields[6].Value);
      FServiceDetail_Arr[idx].Shipment.IsPost  := BufferToBoolean(Fields[7].Value);
      FServiceDetail_Arr[idx].Shipment.ShipServiceType := BufferToString(Fields[8].Value);
      moveNext;
    end;
  buffer.close;
end;

function TServiceDetail_Arr.get(index: integer): TServiceDetail;
begin
  Result := TServiceDetail(inherited get(index));
end;

function TServiceDetail_Arr.New: TServiceDetail;
begin
  Result := TServiceDetail.Create;
end;

{ TServiceDetail }

procedure TServiceDetail.InsertOnDb;
var sql:string;
begin
  sql := 'INSERT INTO Service_Detail (Ship_Id,Service_Id,Quantity,Price,Amount,Notes,Charges,Discount,Service_Parent,is_ksg)'+
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
      FormatSQLBoolean(FIsKsg)+ ')';
  MyConnection.ExecSQL(sql);
end;

procedure TServiceDetail.InsertOnDbEstimasi;
var sql:string;
begin
  sql := 'INSERT INTO Estimasi_Service_Detail (estimasi_Id,Service_Id,Quantity,Price,Amount,Notes,Charges,Discount,Service_Parent,is_ksg)'+
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
      FormatSQLBoolean(FIsKsg)+ ')';
  MyConnection.ExecSQL(sql);


end;

{ TDummyItemDetail_Arr }

constructor TDummyItemDetail_Arr.Create;
begin
  SetLength(FDummyItemDetail_Arr,0);
  FFilter := TDummyItemDetail.Create;
  inherited Create;
end;

destructor TDummyItemDetail_Arr.Destroy;
begin
  FFilter.Free;
  inherited;
end;

function TDummyItemDetail_Arr.FindOnDB(AShipID: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i:integer;
begin
  vFilter := '';
  SQL := 'SELECT d.dump_id, d.ship_id, d.item_id, d.service_id, d.service_parent,'+
        ' d.db_cr_type,d.quantity, d.price, d.discount,d.amount, d.is_ksg '+
        ' FROM dummy_Item_Detail d'+
        ' WHERE d.ship_id ='+FormatSQLNumber(AShipID);
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+' Order BY dump_id, item_id');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
       Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value),
          BufferToInteger(Fields[2].Value),BufferToInteger(Fields[3].Value),
          BufferToInteger(Fields[4].Value),BufferToString(Fields[5].Value),
          BufferToFloat(Fields[6].Value),BufferToFloat(Fields[7].Value),
          BufferToFloat(Fields[8].Value),BufferToFloat(Fields[9].Value),
          BufferToBoolean(Fields[10].Value));
      moveNext;
    end;
  buffer.close;
end;

function TDummyItemDetail_Arr.get(Index: integer): TDummyItemDetail;
begin
   Result := TDummyItemDetail(inherited get(Index));
end;

function TDummyItemDetail_Arr.New: TDummyItemDetail;
begin
  Result := TDummyItemDetail.Create;
end;

{ TDummyItemDetail }

class function TDummyItemDetail.DeleteDummy(AShipId: integer): boolean;
var sql:string;
begin
  sql := 'DELETE FROM dummy_Item_Detail WHERE ship_id ='+FormatSQLNumber(AShipId);
  Result := ExecTransaction3(sql);
end;

function TDummyItemDetail.InsertOnDb: boolean;
var sql:string;
begin
  sql :=  'INSERT INTO Dummy_Item_Detail (Ship_Id,Item_Id,Service_Id,Service_Parent,Db_Cr_Type,Quantity,Price,Discount,Amount,is_ksg)'+
    ' VALUES ('+
      FormatSQLNumber(FShipId)+','+
      IfThen(FItems.ItemId>0, FormatSQLNumber(FItems.ItemId),FormatSQLNULL)+','+
      IfThen(FServices.ServiceId>0, FormatSQLNumber(FServices.ServiceId),FormatSQLNULL)+','+
      IfThen(FServiceParent>0, FormatSQLNumber(FServiceParent),FormatSQLNULL)+','+
      FormatSQLString(FDbCrType)+','+
      FormatSQLNumber(FQuantity)+','+
      FormatSQLNumber(FPrice)+','+
      FormatSQLNumber(FDiscount)+','+
      FormatSQLNumber(FAmount)+','+
      FormatSQLBoolean(FIsKsg)+')';
  Result := ExecTransaction3(sql)
end;

{ TItemDetail }

class function TItemDetail.getHpp(aPeriode: TPeriode;
  ASHipType: string): Double;
var sql:string;
begin
  sql := 'SELECT SUM(real_value) '+
         ' FROM item_detail d INNER JOIN Shipment s ON d.ship_id = s.ship_id '+
          ' WHERE s.ship_type ='+FormatSQLString(ASHipType)+
          IfThen(aPeriode.PeriodeAwal1<> 0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(aPeriode.OpPeriodeAwal1)+FormatSQLDate(aPeriode.PeriodeAwal1))+
          IfThen(aPeriode.PeriodeAkhir1<> 0,' AND cast(floor(cast(s.ship_date as float)) as datetime) '+FormatSQLOperator(aPeriode.OpPeriodeAkhir1)+FormatSQLDate(aPeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2));
  Result := getFloatFromSQL(sql);
end;

{ TItemBalance }

class function TItemBalance.getNilaiPersediaan(aItemId: integer;
  aPeriode: TPeriode; WithBalanceDate: boolean): Double;
var sql:string;
begin
  sql := 'SELECT SUM(balance * price) '+
          ' FROM item_balance '+
          ' WHERE item_id = '+FormatSQLNumber(aItemId)+
          IfThen((aPeriode.PeriodeAwal1<>0) and WithBalanceDate,' AND cast(floor(cast(balance_date as float)) as datetime) '+FormatSQLOperator(aPeriode.OpPeriodeAwal1)+FormatSQLDate(aPeriode.PeriodeAwal1))+
          IfThen((aPeriode.PeriodeAkhir1<>0) and WithBalanceDate,' AND cast(floor(cast(balance_date as float)) as datetime) '+FormatSQLOperator(aPeriode.OpPeriodeAkhir1)+FormatSQLDate(aPeriode.PeriodeAkhir1))+
          IfThen(APeriode.PeriodeAwal2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAwal2)+FormatSQLDate(APeriode.PeriodeAwal2))+
          IfThen(APeriode.PeriodeAkhir2<>0,' AND cast(floor(cast(s.expr_date as float)) as datetime) '+FormatSQLOperator(APeriode.OpPeriodeAkhir2)+FormatSQLDate(APeriode.PeriodeAkhir2));;
  Result := getFloatFromSQL(sql);
end;

{ TShipmentMechanic_Arr }

constructor TShipmentMechanic_Arr.Create;
begin
SetLength(FShipmentMechanic_Arr,0);
  inherited Create;
  FFilter := TShipmentMechanic.Create;
end;

destructor TShipmentMechanic_Arr.Destroy;
begin
   FFilter.Free;
  inherited;
end;

function TShipmentMechanic_Arr.FindOnDB(AShipSeq: integer): boolean;
var SQL, vFilter : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT d.ship_id, d.person_id '+
        ' FROM shipment_mechanic d, shipment b, persons i '+
        ' WHERE d.ship_id = b.ship_id AND d.person_id = i.person_id ';
  if AShipSeq <> 0 then
    vFilter := vFilter + ' AND d.ship_id = '+FormatSQLNumber(AShipSeq);

  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+' Order By i.person_id');
  Result := (buffer.recordcount<>0);
  if Result then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      idx := Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value));
      moveNext;
    end;
  buffer.close;

end;

function TShipmentMechanic_Arr.get(Index: integer): TShipmentMechanic;
begin
      Result := TShipmentMechanic(inherited get(Index));
end;

class function TShipmentMechanic_Arr.getMechanic(
  AShipSeq: integer): string;

var SQL, vFilter,v_result : string;
    buffer : _recordset;
    i,idx:integer;
begin
  vFilter := '';
  SQL := 'SELECT d.ship_id, d.person_id,i.person_name '+
        ' FROM shipment_mechanic d, shipment b, persons i '+
        ' WHERE d.ship_id = b.ship_id AND d.person_id = i.person_id ';
  if AShipSeq <> 0 then
    vFilter := vFilter + ' AND d.ship_id = '+FormatSQLNumber(AShipSeq);
  v_result := '';
  if vFilter <> '' then
    SQL := SQL + vFilter;
  buffer := MyConnection.OpenSQL(SQL+' Order By i.person_id');
  if (buffer.recordcount<>0) then
    for i := 0 to buffer.RecordCount-1 do
    with buffer do begin
      //idx := Add(BufferToInteger(Fields[0].Value),BufferToInteger(Fields[1].Value));
      v_result := v_result+BufferToString(buffer.Fields[2].Value)+',';
      moveNext;
    end;
  buffer.close;
  if v_result <> '' then
    v_result := copy(v_result,0,length(v_result)-1);
  Result := v_result;
end;

function TShipmentMechanic_Arr.New: TShipmentMechanic;
begin
   Result := TShipmentMechanic.Create;
end;

end.
