unit UConst;

interface
uses Graphics,Classes;
                      {00F2F2FF}
const
   {Sys Colors }
  clBanned         = $00B3B3FF;
  clWarning        = $00B0FFFF;
  clFormBackGround = $00000088;//$00BD7B02;//$00685558;//clSIlver; //$00C4B7B0;// $00EEEEEE;
  clFixedColum     = $00E5EDEC;//$00DDDDDD;
  clFixedFont      = $00A45200; //clWhite;
  clPrimaryBand    = $00EDE7FE;//$00F7E2D7;//$00E1AA88;
  clSecondaryBand  = $00EEEEEE;
  clSelection      = $0000FF80;//$00F2F2FF;//kuning//merahmuda=$00F2F2FF; //$00FF9224;

  DISABLED_BG_COLOR = clBtnFace;
  DISABLED_FG_COLOR = clWindowText;

  {System Messages}
  MSG_UNAUTHORISED_ACCESS       = 'Anda tidak memiliki autorisasi untuk fungsi ini';
  MSG_SAVE_CONFIRMATION         = 'Apakah data sudah benar?';
  MSG_SUCCESS_SAVING            = 'Penyimpanan berhasil.';
  MSG_UNSUCCESS_SAVING          = 'Penyimpanan tidak berhasil.';
  MSG_SUCCESS_UPDATE            = 'Update data berhasil.';
  MSG_UNSUCCESS_UPDATE          = 'Update data gagal.';
  MSG_DUPLICATE                 = 'Duplikasi data.';
  MSG_NO_DATA_FOUND             = 'Data tidak ada atau tidak ditemukan.';
  MSG_ADD_DATA                  = 'Tambah data lagi ?';
  MSG_NO_NUMBER                 = '[Empty]';
  MSG_UNDERCONSTRUCTION         = 'Under Construction!';
  MSG_SUCCESS_DELETING          = 'Data telah dihapus.';
  MSG_UNSUCCESS_DELETING        = 'Data tidak bisa dihapus.';

  {user management}
  LEVEL_OPERATOR    = 1;
  LEVEL_SUPERVISOR  = 2;
  LEVEL_MANAGER     = 3;
  LEVEL_ADMIN       = 4;
  LEVEL_OWNER       = 5;
  LEVEL_DEVELOPER   = 8;
  PWD_LENGTH        = 8;
  DEVELOPER_NIK     = '~';
  OWNER_NIK         = '0';

  {FORM}
  RESTO_TABLE  = 'R';
  
  {Backup / Restore}
   BACKUP_DATABASE ='B';
   RESTORE_DATABASE = 'R';

  {buat lov}
  LOV_ITEM = 0;
  LOV_JASA = 1;
  LOV_EMPLOYEE = 2;
  LOV_SUPPLIER = 3 ;
  LOV_CUSTOMER = 4;
  LOV_CONTACT = 5;
  LOV_VC_ALL = 6;  //kabeh vendor customer
  LOV_ACCOUNT = 7;
  LOV_MONEY_ACC = 8;
  LOV_SEC = 9;
  LOV_GUEST = 10;

  LOV_SEARCH_NAMA = 0;
  LOV_SEARCH_KODE = 1;

  DB_CR_TYPE_DEBIT  = 'D';
  DB_CR_TYPE_CREDIT = 'C';

  {accounting}
  ACC_TYPE_HEADER     = '~';
  ACC_TYPE_ROOT       = '_';

  ACC_TYPE_ASSET      = '1';
  ACC_TYPE_LIABILITY  = '2';
  ACC_TYPE_EQUITY     = '3';
  ACC_TYPE_EXPENSE    = '4';

  SEX_MALE                      = 'M';
  SEX_FEMALE                    = 'F';
  SEX_TEXT_MALE                 = 'Pria';
  SEX_TEXT_FEMALE               = 'Wanita';

  RELIGION_ISLAM       = 'Islam';
  RELIGION_KATOLIK     = 'Katolik';
  RELIGION_PROTESTAN   = 'Protestan';
  RELIGION_HINDU       = 'Hindu';
  RELIGION_BUDHA       = 'Budha';

  DOC_TYPE_GIRO       = 'G';
  DOC_TYPE_CHEQUE     = 'Q';
  DOC_TYPE_TRANSFER   = 'T';
  DOC_TYPE_CASH       = 'C';
  DOC_TYPE_DP         = 'D';

  DOC_TYPE_GIRO_TEXT     = 'Giro';
  DOC_TYPE_CHEQUE_TEXT   = 'Cheque';
  DOC_TYPE_TRANSFER_TEXT = 'Transfer';
  DOC_TYPE_CASH_TEXT     = 'Cash';
  DOC_TYPE_DP_TEXT       = 'DP';

  DEBT_TYPE_KAS    = 'K';
  DEBT_TYPE_BANK   = 'B';
  DEBT_TYPE_NULL   = '_';

  {---------------------------------M A S T E R-------------------------------}

  {Person}
  PS_TYPE_CUSTOMER  = 'C';
  PS_TYPE_SUBDEALER  = 'S';
  PS_TYPE_MECHANIC   = 'M';
  PS_TYPE_SUPPLIER   = 'P';

  PS_TYPE_CUSTOMER_VALUE  = 'Customer';
  PS_TYPE_SUBDEALER_VALUE  = 'Sub Dealer';
  PS_TYPE_MECHANIC_VALUE  = 'Mechanic';

  {Shipment}
  SHIP_TYPE_TERIMA_BARANG = 'T';
  SHIP_TYPE_MUTASI_MASUK  = 'M';
  SHIP_TYPE_MUTASI_KELUAR = 'K';
  SHIP_TYPE_SALES         = 'S';
  SHIP_TYPE_RETUR_BELI    = 'B';
  SHIP_TYPE_RETUR_SALES   = 'R';
  SHIP_TYPE_RETUR_SERVICE = 'U';
  SHIP_TYPE_SERVICE       = 'V';
  SHIP_TYPE_CLAIM         = 'C';

  SHIP_TYPE_OPNAME         = 'A'; //STOCK OPNAME

  ESTIMASI_TYPE_1  = 'E';//estimasi
  ESTIMASI_TYPE_ORDER  = 'O';//order bengkel


  {utk shipment tipe service}
  SHIP_SERVICE_TYPE_REG = 'R';//REGULER
  SHIP_SERVICE_TYPE_KSG = 'K';
  SHIP_SERVICE_TYPE_COMP = 'C';//COMPANY
  {utk shipment tipe sales}
  SHIP_SALES_TYPE_REG = 'R'; //REGULER
  SHIP_SALES_TYPE_CREDIT = 'C'; //CREDIT


  {SERVICE}
  SERVICE_TYPE_SINGLE     = 'S';
  SERVICE_TYPE_PACKAGE    = 'K';
  SERVICE_TYPE_OTHERS     = 'N';

  {Items}
  ITEM_TYPE_OIL        = 'L';
  ITEM_TYPE_PART        = 'P';
   {Motor}
  MOTOR_TYPE = 'M';

   {Money_account}
   MONEY_TYPE_CASH = 'K';
   MONEY_TYPE_BANK = 'B';
  // MONEY_TYPE_DP   = 'D';

   TEXT_MONEY_TYPE_CASH = 'Kas';
   TEXT_MONEY_TYPE_BANK = 'Bank';
   TEXT_MONEY_TYPE_DP   = 'DP';
   {------------------------------TRANSAKSI----------------------}
  

   {Payment_}
   PAYMENT_TYPE_BIAYA = 'B';



  

   //Accounting
  SETUP_TYPE_ACC_PAYABLE    = 'P';
  SETUP_TYPE_ACC_RECEIVE    = 'R';
  SETUP_TYPE_GENERAL        = 'G';

  SETUP_TYPE_ACC_PAYABLE_TEXT  = 'Penerimaan Dana';
  SETUP_TYPE_ACC_RECEIVE_TEXT  = 'Pengeluaran Dana';
  SETUP_TYPE_GENERAL_TEXT      = 'Umum';


 {Menu Groups}
  MENU_GROUP_SYSTEM             = 'System';
  MENU_GROUP_FINANCE            = 'Finance';
  MENU_GROUP_INVENTORY          = 'Inventory';
  MENU_GROUP_SALES              = 'Sales';
  MENU_GROUP_PURCHASES          = 'Purchases';

var //G_PROJECT_LIST,
   G_CUSTOMER_LIST,
//   G_SERVICE_LIST,
   G_WAREHOUSE: TStringList;
   GLOBAL_PATH : string;
//   G_CHARGE_LIST

implementation



end.
