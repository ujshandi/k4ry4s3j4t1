program KaryaSejati;

uses
  Forms,
  LOVRekap in 'LOVRekap.pas' {frmLOVRekap},
  MainMenu in 'MainMenu.pas' {frmMainMenu},
  SQLServerConnections in 'SQLServerConnections.pas' {MyConnection: TDataModule},
  Subroutines in 'Subroutines.pas',
  UConst in 'UConst.pas',
  un_ryu in 'un_ryu.pas',
  About in 'About.pas' {frmAbout},
  ChangePassword in 'ChangePassword.pas' {frmChangePassword},
  CompanyProfile in 'CompanyProfile.pas' {frmCompany},
  HtmlHlp in 'HtmlHlp.pas',
  Login in 'Login.pas' {frmLogin},
  AddUser in '..\Setting\AddUser.pas' {frmAddUser},
  KelolaUser in '..\Setting\KelolaUser.pas' {frmKelolaUser},
  PersonKelolaAll in '..\Master\PersonKelolaAll.pas' {frmPersonKelolaAll},
  ItemPrice in '..\Master\ItemPrice.pas' {frmItemPrice},
  PersonCarAdd in 'PersonCarAdd.pas' {frmPersonCarAdd},
  MotorPrint in '..\Print\MotorPrint.pas' {qrpMotor: TQuickRep},
  PersonPrint in '..\Print\PersonPrint.pas' {qrpPerson: TQuickRep},
  StokOpname in '..\Transaction\StokOpname.pas' {frmStokOpname},
  StokOpnameRekap in '..\Transaction\StokOpnameRekap.pas' {frmOpnameRekap},
  KartuStok in '..\Report\KartuStok.pas' {frmKartuStok},
  MotorAdd in 'MotorAdd.pas' {frmMotorAdd},
  ServicePrint in '..\Print\ServicePrint.pas' {qrpService: TQuickRep},
  UTransaction in 'UTransaction.pas',
  ServicePkgAdd in '..\Master\ServicePkgAdd.pas' {frmServicePkgAdd},
  MotorKelola in '..\Master\MotorKelola.pas' {frmMotorKelola},
  ReturBeli in '..\Transaction\ReturBeli.pas' {frmReturBeli},
  Penerimaan in '..\Transaction\Penerimaan.pas' {frmPenerimaan},
  ReturSales in '..\Transaction\ReturSales.pas' {frmReturSales},
  RugiLaba in '..\Report\RugiLaba.pas' {frmRugiLaba},
  MekanikPendapatan in '..\Report\MekanikPendapatan.pas' {frmMekanikPendapatan},
  UMaster in 'UMaster.pas',
  Claim in '..\Transaction\Claim.pas' {frmClaim},
  Estimasi in '..\Transaction\Estimasi.pas' {frmEstimasi},
  ReturService in '..\Transaction\ReturService.pas' {frmReturService},
  GudangAdd in '..\Master\GudangAdd.pas' {frmGudangAdd},
  HistoriKendaraan in '..\Report\HistoriKendaraan.pas' {frmHistoriKendaraan},
  ItemPriceAktifPrint in '..\Print\ItemPriceAktifPrint.pas' {qrpItemPRiceAktif: TQuickRep},
  Sales in '..\Transaction\Sales.pas' {frmSales},
  ItemKelola in '..\Master\ItemKelola.pas' {frmItemKelola},
  StokRekaplPrint in '..\Print\StokRekaplPrint.pas' {qrpStokRekap: TQuickRep},
  KartuStokPrint in '..\Print\KartuStokPrint.pas' {qrpKartuStok: TQuickRep},
  AccountKelola in '..\Master\AccountKelola.pas' {frmAccountKelola},
  AccountAdd in '..\Master\AccountAdd.pas' {frmAccountAdd},
  MutasiRekapPrint in '..\Print\MutasiRekapPrint.pas' {qrpMutasiRekap: TQuickRep},
  BiayaRekap in '..\Transaction\BiayaRekap.pas' {frmBiayaRekap},
  Biaya in '..\Transaction\Biaya.pas' {frmBiaya},
  PenerimaanRekapPrint in '..\Print\PenerimaanRekapPrint.pas' {qrpPenerimaanRekap: TQuickRep},
  ReturBeliPrint in '..\Print\ReturBeliPrint.pas' {qrpReturBeliRekap: TQuickRep},
  NotaReturSalesPrint in '..\Print\NotaReturSalesPrint.pas' {qrpNotaReturSales: TQuickRep},
  NotaReturServicePrint in '..\Print\NotaReturServicePrint.pas' {qrpNotaReturService: TQuickRep},
  ServiceRekapPrint in '..\Print\ServiceRekapPrint.pas' {qrpServiceRekap: TQuickRep},
  PenerimaanRekap in '..\Transaction\PenerimaanRekap.pas' {frmPenerimaanRekap},
  SalesRekapPrint in '..\Print\SalesRekapPrint.pas' {qrpSalesRekap: TQuickRep},
  PendapatanMekanikItemPrint2 in 'PendapatanMekanikItemPrint2.pas' {qrpPendapatanMekanikItem2: TQuickRep},
  ServiceMotorPrint in '..\Print\ServiceMotorPrint.pas' {qrpServiceMotor: TQuickRep},
  ItemAdd in '..\Master\ItemAdd.pas' {frmItemAdd},
  ItemEditPrice in '..\Master\ItemEditPrice.pas' {frmItemEditPrice},
  PendapatanMekanikPrint in '..\Print\PendapatanMekanikPrint.pas' {qrpPendapatanMekanik: TQuickRep},
  ServiceAdd in '..\Master\ServiceAdd.pas' {frmServiceAdd},
  LOVFlat in 'LOVFlat.pas' {frmLovFlat},
  AutoBengkel in 'AutoBengkel.pas',
  UFinance in 'UFinance.pas',
  RekapitulasiSalesPrint in '..\Print\RekapitulasiSalesPrint.pas' {qrpRekapitulasiSales: TQuickRep},
  ServiceGlobalPrint in '..\Print\ServiceGlobalPrint.pas' {qrpServiceGlobal: TQuickRep},
  RekapitulasiPrint in '..\Print\RekapitulasiPrint.pas' {qrpRekapitulasi: TQuickRep},
  LoadPrice in '..\Master\LoadPrice.pas' {frmLoadPrice},
  StokGlobalPrint in '..\Print\StokGlobalPrint.pas' {qrpStokGlobal: TQuickRep},
  ItemPriceHistoryPrint in '..\Print\ItemPriceHistoryPrint.pas' {qrpItemPriceHistory: TQuickRep},
  ItemPrint in '..\Print\ItemPrint.pas' {qrpItem: TQuickRep},
  RugiLabaPrint in '..\Print\RugiLabaPrint.pas' {qrpRugiLaba: TQuickRep},
  StokRekapDetailPrint in '..\Print\StokRekapDetailPrint.pas' {qrpStokRekapDetail: TQuickRep},
  SalesServiceGlobalPrint in '..\Print\SalesServiceGlobalPrint.pas' {qrpSalesServiceGlobal: TQuickRep},
  EstimasiPrint in '..\Print\EstimasiPrint.pas' {qrpEstimasi: TQuickRep},
  StokOpnamePrint in '..\Transaction\StokOpnamePrint.pas' {qrpOpname: TQuickRep},
  GlobalPartPrint in '..\Print\GlobalPartPrint.pas' {qrpGlobalPart: TQuickRep},
  RekapKhususPrint in '..\Print\RekapKhususPrint.pas' {qrpRekapKhusus: TQuickRep},
  LaporanClaim in '..\Print\LaporanClaim.pas' {qrpLapClaim: TQuickRep},
  NotaSalesPrint in '..\Print\NotaSalesPrint.pas' {qrpNotaSales: TQuickRep},
  NotaReturBeli in '..\Print\NotaReturBeli.pas' {qrpNotaReturBeli: TQuickRep},
  PenerimaanPrint in '..\Print\PenerimaanPrint.pas' {qrpPenerimaan: TQuickRep},
  PersonAdd in '..\Master\PersonAdd.pas' {frmPersonAdd},
  MutasiBarang in '..\Transaction\MutasiBarang.pas' {frmMutasiBarang},
  MutasiBarangRekap in '..\Transaction\MutasiBarangRekap.pas' {frmMutasiBarangRekap},
  Services in '..\Transaction\Services.pas' {frmServices},
  SalesServiceRekap in '..\Transaction\SalesServiceRekap.pas' {frmSalesServiceRekap},
  EstimasiRekap in '..\Transaction\EstimasiRekap.pas' {frmEstimasiRekap},
  NotaServiceObjectGabungPrint in 'NotaServiceObjectGabungPrint.pas' {qrpNotaServiceObjectGabung: TQuickRep},
  MutasiPrint in '..\Print\MutasiPrint.pas' {qrpMutasi: TQuickRep},
  NotaServiceObjectPrint in '..\Print\NotaServiceObjectPrint.pas' {qrpNotaServiceObject: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  InitializeApplication;
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmAbout, frmAbout);
//  Application.CreateForm(TqrpNotaServiceObject, qrpNotaServiceObject);
  frmLogin.Status('Connecting Database....');
  Application.CreateForm(TMyConnection, MyConnection);

  frmLogin.Status('Load System Modules....');
  Application.CreateForm(TfrmKelolaUser,frmKelolaUser);
  Application.CreateForm(TfrmAddUser,frmAddUser);
  Application.CreateForm(TfrmCompany,frmCompany);
  Application.CreateForm(TfrmChangePassword,frmChangePassword);
  //Application.CreateForm(TfrmLOVNew,frmLOVNew);
  Application.CreateForm(TfrmLOVRekap,frmLOVRekap);
  Application.CreateForm(TfrmLovFlat, frmLovFlat);

  frmLogin.Status('Load Master Modules...');
  Application.CreateForm(TfrmAccountKelola, frmAccountKelola);
  Application.CreateForm(TfrmAccountAdd, frmAccountAdd);
  Application.CreateForm(TfrmPersonKelolaAll,frmPersonKelolaAll);
  Application.CreateForm(TfrmPersonAdd,frmPersonAdd);
  Application.CreateForm(TfrmPersonCarAdd, frmPersonCarAdd);
  Application.CreateForm(TfrmItemKelola,frmItemKelola);
  Application.CreateForm(TfrmItemPrice, frmItemPrice);
  Application.CreateForm(TfrmItemAdd,frmItemAdd);
  Application.CreateForm(TfrmItemEditPrice, frmItemEditPrice);
  Application.CreateForm(TfrmServiceAdd, frmServiceAdd);
  Application.CreateForm(TfrmServicePkgAdd,frmServicePkgAdd);
  Application.CreateForm(TfrmMotorAdd, frmMotorAdd);
  Application.CreateForm(TfrmMotorKelola, frmMotorKelola);
  Application.CreateForm(TfrmGudangAdd, frmGudangAdd);
  Application.CreateForm(TfrmLoadPrice,frmLoadPrice);


  frmLogin.Status('Loading Transaction Module..');
  Application.CreateForm(TfrmBiayaRekap, frmBiayaRekap);
  Application.CreateForm(TfrmBiaya, frmBiaya);
  Application.CreateForm(TfrmMutasiBarangRekap, frmMutasiBarangRekap);
  Application.CreateForm(TfrmOpnameRekap, frmOpnameRekap);
  Application.CreateForm(TfrmPenerimaanRekap,frmPenerimaanRekap);
  Application.CreateForm(TfrmPenerimaan, frmPenerimaan);
  Application.CreateForm(TfrmReturSales, frmReturSales);
  Application.CreateForm(TfrmSales, frmSales);
  Application.CreateForm(TfrmClaim, frmClaim);
  Application.CreateForm(TfrmServices, frmServices);
  Application.CreateForm(TfrmReturService, frmReturService);
////  Application.CreateForm(TqrpNotaServiceObject, qrpNotaServiceObject);
  Application.CreateForm(TqrpNotaSales,qrpNotaSales);
  Application.CreateForm(TfrmServices, frmServices);
  Application.CreateForm(TfrmReturService, frmReturService);
  Application.CreateForm(TfrmReturBeli,frmReturBeli);
  Application.CreateForm(TfrmMutasiBarang, frmMutasiBarang);
  Application.CreateForm(TfrmSalesServiceRekap,frmSalesServiceRekap);
  Application.CreateForm(TqrpPenerimaan,qrpPenerimaan);
  Application.CreateForm(TqrpMutasi, qrpMutasi);
  Application.CreateForm(TqrpNotaReturBeli, qrpNotaReturBeli);
  Application.CreateForm(TfrmStokOpname, frmStokOpname);
  Application.CreateForm(TfrmEstimasiRekap, frmEstimasiRekap);
  Application.CreateForm(TfrmEstimasi, frmEstimasi);
  Application.CreateForm(TfrmHistoriKendaraan, frmHistoriKendaraan);

  frmLogin.Status('Load Report Modules..');
  Application.CreateForm(TfrmKartuStok,frmKartuStok);
  Application.CreateForm(TfrmRugiLaba, frmRugiLaba);
  Application.CreateForm(TfrmMekanikPendapatan, frmMekanikPendapatan);

  frmLogin.Status;
  RearrangeForms;
  Application.Run;
end.
