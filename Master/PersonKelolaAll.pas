unit PersonKelolaAll;
   {UTK Customer, Subdelaer, dan mekanik}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ExtCtrls, AdvEdit,
  strUtils, math,
   UMaster, WinXP, ComCtrls, SUIButton;

type
  TfrmPersonKelolaAll = class(TForm)
    MainPanel: TPanel;
    WinXP1: TWinXP;
    pgcMain: TPageControl;
    tbsPelanggan: TTabSheet;
    tbsSubDealer: TTabSheet;
    tbsMekanik: TTabSheet;
    Panel1: TPanel;
    Bevel1: TBevel;
    Shape2: TShape;
    btnContact: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnFilter: TButton;
    btnPrint: TButton;
    asgPerson: TAdvStringGrid;
    pnlFilter: TPanel;
    Label1: TLabel;
    btnReset: TButton;
    txtKode: TAdvEdit;
    txtPhone: TAdvEdit;
    txtNama: TAdvEdit;
    txtAddress: TAdvEdit;
    tbsSupplier: TTabSheet;
    btnOk: TButton;
    st: TStaticText;
    pnlRangka: TPanel;
    Label2: TLabel;
    txtRangka: TAdvEdit;
    Label3: TLabel;
    txtMesin: TAdvEdit;
    txtLimit: TAdvEdit;
    spdFirst: TsuiButton;
    spdPrev: TsuiButton;
    spdNext: TsuiButton;
    spdLast: TsuiButton;
    lblHal: TLabel;
    btnDelete: TButton;
    procedure asgPersonGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure btnFilterClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnContactClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure asgPersonDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure pgcMainChange(Sender: TObject);
    procedure txtKodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtNamaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure spdFirstClick(Sender: TObject);
    procedure spdPrevClick(Sender: TObject);
    procedure spdNextClick(Sender: TObject);
    procedure spdLastClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    BrowseMode : boolean;

    halaman,totalHalaman : integer;
    procedure arrangeSizeColl;
    procedure initGrid;
    procedure initFilter;
    function getPurpose:string;
    procedure initForm;
    procedure loadData(Arow,AItemId:integer;isAdd:boolean);
    procedure loadData2(Arow,AItemId:integer;isAdd:boolean);
  public
    procedure Execute;
  end;

var
  frmPersonKelolaAll: TfrmPersonKelolaAll;

implementation

uses MainMenu, PersonAdd, un_ryu, UConst, PersonPrint, AutoBengkel,
  Subroutines, LOVFlat, SQLServerConnections, PersonCarAdd;


const
  colNo      = 0;
  colCode    = 1;
  colName    = 2;
  colAddress = 3;
  colCity    = 4;
  colPhone   = 5;
  colPhone2  = 6;
  colFax     = 7;
  colTipe    = 8;
  colTahun   = 9;
  colRangka  = 10;
  colMesin   = 11;
  colID    = 12;

  {SubDealer}
  colSNo      = 0;
  colSCode    = 1;
  colSName    = 2;
  colSAddress = 3;
  colSCity    = 4;
  colSPhone   = 5;
  colSPhone2  = 6;
  colSFax     = 7;
  colSID    = 8;

  {mEKANIK}
  colMNo      = 0;
  colMCode    = 1;
  colMName    = 2;
  colMAddress = 3;
  colMCity    = 4;
  colMPhone   = 5;
  colMPhone2  = 6;
  colMFax      = 7;
  colMID    = 8;

  {SUPPLIER}
  colpNo      = 0;
  colpCode    = 1;
  colpName    = 2;
  colpAddress = 3;
  colpCity    = 4;
  colpPhone   = 5;
  colpPhone2  = 6;
  colpFax  = 7;
  colpCP = 8;
  colpAccount = 9;
  colpID    = 10;


  TAB_CUSTOMER = 0;
  TAB_SUBDEALER = 1;
  TAB_MECHANIC = 2;
  TAB_SUPPLIER = 3;

{$R *.dfm}

procedure TfrmPersonKelolaAll.asgPersonGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign:= taCenter
  else if ACol in[colNo, colPhone] then  HAlign:= taRightJustify
//  else if (ACol = colPsUsed) and (MasterPurpose = PS_TYPE_CONTACT) then  HAlign:= taCenter

end;

procedure TfrmPersonKelolaAll.arrangeSizeColl;
begin

  case pgcMain.ActivePageIndex of
    TAB_CUSTOMER:
    begin
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPerson.AutoSizeColumns(True,5);
      asgPerson.ColWidths[colId ]:= 0;
      asgPerson.ColWidths[colTipe]:= 0;
      asgPerson.ColWidths[colTahun]:= 0;
      asgPerson.ColWidths[colMesin]:= 0;
      asgPerson.ColWidths[colRangka]:= 0;
    end;
    TAB_SUBDEALER:
    begin
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPerson.AutoSizeColumns(True,5);
      asgPerson.ColWidths[colSId ]:= 0;

    end;
    TAB_MECHANIC:
    begin
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPerson.AutoSizeColumns(True,5);
      asgPerson.ColWidths[colMId ]:= 0;
      asgPerson.ColWidths[colMFax]:= 0;

    end;
    TAB_SUPPLIER:
    begin
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPerson.AutoSizeColumns(True,5);
      asgPerson.ColWidths[colpId ]:= 0;

    end;
  end;

end;

procedure TfrmPersonKelolaAll.Execute;
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  halaman := 1; totalHalaman := 0;
  pnlFilter.Height := 0;
  SetFilterSize(pnlFilter,btnFilter, 90);
  pgcMain.ActivePageIndex := TAB_CUSTOMER;
  BrowseMode:= False;
  InitForm;
//  RelationArr.Filter.PsType:= vType;
  pgcMainChange(Self);
  //loadData;
  Run(self);
//  if ModalResult in[mrOk, mrCancel] then

end;

procedure TfrmPersonKelolaAll.initFilter;
begin
  txtKode.Clear;
  txtAddress.Clear;
  txtPhone.Clear;
  txtNama.Clear;
  txtRangka.Clear;
  txtMesin.Clear;
  txtLimit.IntValue := 25;
  halaman := 1;totalHalaman :=0;
end;

procedure TfrmPersonKelolaAll.initForm;
begin
  tbsSubDealer.TabVisible := False;
  lblHal.Caption := ''; txtLimit.Tag := 0;
  InitGrid;
  InitFilter;
  btnEdit.Enabled   := not BrowseMode;
end;

procedure TfrmPersonKelolaAll.initGrid;
begin
  asgPerson.ExpandAll;
  asgPerson.Clear;
  case pgcMain.ActivePageIndex of
    TAB_CUSTOMER : begin
      ResetGrid(asgPerson,3,14,1,1);
        asgPerson.SortSettings.Show := False;
      with asgPerson do begin
        Cells[colNo,0]    := 'No.';
        Cells[colCode,0]  := 'Kode';
        Cells[colName,0]  := 'Nama Pelanggan';
        Cells[colAddress,0]:= 'Alamat';
        Cells[colPhone,0] := 'Tlp';
        Cells[colCity,0]  := 'Kota';
        Cells[colPhone2,0]:='Tlp2';
        Cells[colFax,0]:='Fax';
        cells[colTipe,0]  :='Tipe Kendaraan';
        Cells[colTahun,0] := 'Tahun';
        Cells[colMesin,0] := 'No.Mesin';
        Cells[colRangka,0]:= 'No.Rangka';
        Cells[colId,0] := 'guestid';
      end;

    end;
    TAB_SUBDEALER : begin
       ResetGrid(asgPerson,2,9,1,1);
      with asgPerson do begin
        Cells[colNo,0]    := 'No.';
        Cells[colSCode,0]  := 'Kode SubDealer';
        Cells[colSName,0]  := 'Nama SubDealer';
        Cells[colSAddress,0]:= 'Alamat';
        Cells[colSPhone,0] := 'Tlp';
        Cells[colSCity,0]  := 'Kota';
        Cells[colSPhone2,0]:='Tlp2';
        Cells[colSFax,0]:='Fax';
        Cells[colSId,0] := 'guestid';
      end;
    end;
    TAB_MECHANIC : begin
       ResetGrid(asgPerson,2,10,1,1);
      with asgPerson do begin
        Cells[colNo,0]    := 'No.';
        Cells[colMCode,0]  := 'Kode Mekanik';
        Cells[colMName,0]  := 'Nama Mekanik';
        Cells[colMAddress,0]:= 'Alamat';
        Cells[colMPhone,0] := 'Tlp';
        Cells[colMCity,0]  := 'Kota';
        Cells[colMPhone2,0]:='Tlp2';
        Cells[colMId,0] := 'guestid';
      end;
    end;
    TAB_SUPPLIER : begin
       ResetGrid(asgPerson,2,12,1,1);
      with asgPerson do begin
        Cells[colNo,0]    := 'No.';
        Cells[colpCode,0]  := 'Kode Supplier';
        Cells[colpName,0]  := 'Nama Supplier';
        Cells[colpAddress,0]:= 'Alamat';
        Cells[colpPhone,0] := 'Tlp';
        Cells[colpCity,0]  := 'Kota';
        Cells[colpPhone2,0]:='Tlp2';
        Cells[colpFax,0]:='Fax';
        Cells[colpCp,0]:='Contact Person';
        Cells[colpAccount,0]:='No.Rek';
        Cells[colpId,0] := 'idSuplier';
      end;
    end;
  end;
  ArrangeSizeColl;
end;


procedure TfrmPersonKelolaAll.loadData(Arow,AItemId:integer;isAdd:boolean);
var i,vRow,vColId: integer;
  RelationArr: TPersons_Arr;

  procedure SetFilter;
  begin
     RelationArr.Clear;
     case pgcMain.ActivePageIndex of
       TAB_CUSTOMER : begin
         RelationArr.Filter.PersonType := PS_TYPE_CUSTOMER;
         RelationArr.Filter.MtrRangka  := txtRangka.Text;
         RelationArr.Filter.MtrMesin   := txtMesin.Text;
         vColId := colID;
       end;
       TAB_SUBDEALER : begin
         RelationArr.Filter.PersonType := PS_TYPE_SUBDEALER;
         vColId := colSID;
       end;
       TAB_MECHANIC : begin
         RelationArr.Filter.PersonType := PS_TYPE_MECHANIC;
         vColId := colMID;
       end;
       TAB_SUPPLIER : begin
         RelationArr.Filter.PersonType := PS_TYPE_SUPPLIER;
         vColId := colpID;
       end;
     end;
     RelationArr.Filter.PersonId := AItemId;
     if txtKode.Text <> '' then
       RelationArr.Filter.PersonCode := txtKode.Text;
     if txtAddress.Text <> '' then
       RelationArr.Filter.Address := txtAddress.Text;
     RelationArr.Filter.PersonName := txtNama.Text;
     RelationArr.Filter.Phone1    := txtPhone.Text;
  end;
begin
  


  RelationArr := TPersons_Arr.Create;
  //InitGrid;
   if (Arow = 0) and (not isAdd) then
    InitGrid;
  if isAdd then begin
    asgPerson.AddRow;
    Arow := asgPerson.RowCount-1;
  end;
  SetFilter;
  totalHalaman := RelationArr.countOnDb(False,False,((isAdd) or (AItemId>0))) div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
  frmMainMenu.Gauge.Show;
  RelationArr.FindOnDB(False,False,((isAdd) or (AItemId>0)) ,txtLimit.IntValue,((halaman-1)*txtLimit.IntValue));
  for i:= 0 to RelationArr.Count-1 do begin
   frmMainMenu.Gauge.Progress := round((i+1)/(RelationArr.Count)*100);
   vRow := IfThen(Arow=0,asgPerson.RowCount-1,Arow);
    asgPerson.Ints[colNo,vRow] := (i+1)+((halaman-1)*txtLimit.IntValue);
    asgPerson.Cells[colCode,   vRow]:= RelationArr[i].PersonCode;
    asgPerson.Cells[colName,   vRow]:= RelationArr[i].PersonName;
    asgPerson.Cells[colAddress,vRow]:= RelationArr[i].Address;
    asgPerson.Cells[colCity,   vRow]:= RelationArr[i].City;
    asgPerson.Cells[colPhone,  vRow]:= RelationArr[i].Phone1;
    asgPerson.Cells[colPhone2, vRow]:= RelationArr[i].Phone2;
    asgPerson.Ints[vColId,     vRow]:= RelationArr[i].PersonId;
    if pgcMain.ActivePageIndex = TAB_CUSTOMER then begin
      asgPerson.Ints[colTahun,vRow]  := RelationArr[i].MtrYear;
      asgPerson.Cells[colRangka,vRow]:= RelationArr[i].MtrRangka;
      asgPerson.Cells[colMesin,vRow] := RelationArr[i].MtrMesin;
      asgPerson.Cells[colTipe,vRow]  := TMotor.getName(RelationArr[i].Motor.MotorId);
    end;

    if pgcMain.ActivePageIndex = TAB_SUPPLIER then begin
      asgPerson.Cells[colpFax,vRow]  := RelationArr[i].Phone3;
      asgPerson.Cells[colpCp,vRow]:= RelationArr[i].ContactPerson;
      asgPerson.Cells[colpAccount,vRow] := RelationArr[i].Account;
    end;
    if Arow = 0 then
      asgPerson.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
   if Arow = 0 then
  DeleteRowTerakhir(asgPerson,2,1);
  //asgPerson.AutoNumberCol(colNo);
  ArrangeSizeColl;
  RelationArr.Free;
end;


procedure TfrmPersonKelolaAll.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter, 90);
end;

procedure TfrmPersonKelolaAll.btnEditClick(Sender: TObject);
var vColId :integer;
begin
vColId := colID;
  case pgcMain.ActivePageIndex of
     TAB_CUSTOMER : begin
     vColId := colID;
      if(asgPerson.Ints[colId,asgPerson.Row]=0)then begin
        Inform('Data yang akan diedit belum dipilih.'+#13+
               'Silahkan pilih data yang akan diedit '+#13+
               'pada kolom yang tersdia di bawah');
        asgPerson.SetFocus;
      end else begin
        frmPersonCarAdd.ExecuteCustomer(asgPerson.Ints[colId,asgPerson.Row]);
      end;
    end;
    TAB_SUBDEALER : begin
    vColId := colsID;
      if(asgPerson.Ints[colSId,asgPerson.Row]=0)then begin
        Inform('Data yang akan diedit belum dipilih.'+#13+
               'Silahkan pilih data yang akan diedit '+#13+
               'pada kolom yang tersdia di bawah');
        asgPerson.SetFocus;
      end else begin
        frmPersonAdd.ExecuteSubdealer(asgPerson.Ints[colSId,asgPerson.Row]);
      end;
    end;
    TAB_MECHANIC : begin
      vColId := colMID;
      if(asgPerson.Ints[colMId,asgPerson.Row]=0)then begin
        Inform('Data yang akan diedit belum dipilih.'+#13+
               'Silahkan pilih data yang akan diedit '+#13+
               'pada kolom yang tersdia di bawah');
        asgPerson.SetFocus;
      end else begin
        frmPersonAdd.ExecuteMekanik(asgPerson.Ints[colMId,asgPerson.Row]);

      end;
    end;
    TAB_SUPPLIER : begin
    vColId := colpID;
      if(asgPerson.Ints[colpId,asgPerson.Row]=0)then begin
        Inform('Data yang akan diedit belum dipilih.'+#13+
               'Silahkan pilih data yang akan diedit '+#13+
               'pada kolom yang tersdia di bawah');
        asgPerson.SetFocus;
      end else begin
        frmPersonAdd.ExecuteSupplier(asgPerson.Ints[colpId,asgPerson.Row]);
      end;
    end;
   end;
  // if pgcMain.ActivePageIndex = TAB_CUSTOMER then
     // loadData2(asgPerson.Row,asgPerson.Ints[vColId,asgPerson.Row],False)
  // else
   //  loadData(asgPerson.Row,asgPerson.Ints[vColId,asgPerson.Row],False);
end;

procedure TfrmPersonKelolaAll.btnAddClick(Sender: TObject);
var maxId : integer;
begin
  maxId :=0;
  case pgcMain.ActivePageIndex of
    TAB_CUSTOMER : begin
      maxId :=  frmPersonCarAdd.ExecuteCustomer( 0);
    end;
    TAB_SUBDEALER : begin
      maxId :=  frmPersonAdd.ExecuteSubdealer( 0);
    end;
    TAB_MECHANIC : begin
      maxId := frmPersonAdd.ExecuteMekanik(0);
    end;
    TAB_SUPPLIER : begin
      maxId := frmPersonAdd.ExecuteSupplier(0);
    end;
  end;
 // loadData(1,maxId,maxId>0);//TPersons.getMaxId,True);;
end;

procedure TfrmPersonKelolaAll.btnOkClick(Sender: TObject);
begin
  if (txtKode.Text = '') and (txtNama.Text='') and
      (txtPhone.Text = '') and (txtAddress.Text='') and
      (not Confirmed('Apakah anda akan memproses laporan tanpa melakukan filter terlebih dahulu?'+#13+
            '(waktu untuk memproses laporan tanpa filter butuh waktu yg cukup lama)')) then
       exit;

  halaman := 1;
  totalHalaman :=0;
  spdFirst.Enabled:= False;
  spdPrev.Enabled:= False;

   if pgcMain.ActivePageIndex = TAB_CUSTOMER then
      loadData2(0,0,False)
    else
      LoadData(0,0,False);

      spdNext.Enabled:= (halaman< totalHalaman);
    spdLast.Enabled:= (halaman< totalHalaman);
end;

procedure TfrmPersonKelolaAll.btnResetClick(Sender: TObject);
begin
  initFilter;
end;

procedure TfrmPersonKelolaAll.btnContactClick(Sender: TObject);
begin
//  frmPersonAdd.Execute(PS_TYPE_CONTACT,0,asgPerson.Ints[colId,asgPerson.Row]);
end;

procedure TfrmPersonKelolaAll.btnPrintClick(Sender: TObject);
begin
  Application.CreateForm(TqrpPerson,qrpPerson);
  case pgcMain.ActivePageIndex of
    TAB_CUSTOMER:  qrpPerson.ExecuteGrid(asgPerson,PS_TYPE_CUSTOMER);
    TAB_SUBDEALER : qrpPerson.ExecuteGrid(asgPerson,PS_TYPE_SUBDEALER);
    TAB_MECHANIC : qrpPerson.ExecuteGrid(asgPerson,PS_TYPE_MECHANIC);
    TAB_SUPPLIER : qrpPerson.ExecuteGrid(asgPerson,PS_TYPE_SUPPLIER);
  end;
  qrpPerson.Free;
end;

procedure TfrmPersonKelolaAll.asgPersonDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then exit;
  if pgcMain.ActivePageIndex = TAB_CUSTOMER then begin
    if asgPerson.IsNode(ARow) then
      btnEdit.Click;
  end
  else
    btnEdit.Click;
end;

procedure TfrmPersonKelolaAll.pgcMainChange(Sender: TObject);
begin
 //loadData;
 pnlRangka.Visible := False;
 case pgcMain.ActivePageIndex of
   TAB_CUSTOMER : begin
      frmMainMenu.lblJudul.Caption := 'Data Customer';
      pnlRangka.Visible := True;
   end;
   TAB_SUBDEALER : frmMainMenu.lblJudul.Caption := 'Data Sub Dealer';
   TAB_MECHANIC : frmMainMenu.lblJudul.Caption := 'Data Mekanik';
   TAB_SUPPLIER : frmMainMenu.lblJudul.Caption := 'Data Supplier';
 end;
 initGrid;
end;

procedure TfrmPersonKelolaAll.txtKodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;  
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('CODE',txtKode.Text,'CUSTOMER',' AND person_type='+FormatSQLString(getPurpose));
    txtKode.Text := TPersons.getCodeFromID(vId);
  end;  

end;

procedure TfrmPersonKelolaAll.txtNamaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var vId : integer;  
begin
   if (Key = vk_return) or (Key = vk_tab) then begin
    vId := frmLovFlat.Execute('NAME',txtNama.Text,'CUSTOMER',' AND person_type='+FormatSQLString(getPurpose));
    txtNama.Text := TPersons.getInfo(vId);
  end;

end;

function TfrmPersonKelolaAll.getPurpose: string;
begin
 case pgcMain.ActivePageIndex of
       TAB_CUSTOMER : Result := PS_TYPE_CUSTOMER;
       TAB_SUBDEALER: Result := PS_TYPE_SUBDEALER;
       TAB_SUPPLIER : Result := PS_TYPE_SUPPLIER;
       TAB_MECHANIC : Result := PS_TYPE_MECHANIC;
  end;
end;

procedure TfrmPersonKelolaAll.loadData2(Arow, AItemId: integer;
  isAdd: boolean);
var i,j,vRow,vRow2,vColId: integer;
  RelationArr: TPersons_Arr;
  vDetail : TPersonsCar_Arr;
  procedure SetFilter;
  begin
     RelationArr.Clear;
     case pgcMain.ActivePageIndex of
       TAB_CUSTOMER : begin
         RelationArr.Filter.PersonType := PS_TYPE_CUSTOMER;
         RelationArr.Filter.MtrRangka  := txtRangka.Text;
         RelationArr.Filter.MtrMesin   := txtMesin.Text;
         vColId := colID;
       end;
       TAB_SUBDEALER : begin
         RelationArr.Filter.PersonType := PS_TYPE_SUBDEALER;
         vColId := colSID;
       end;
       TAB_MECHANIC : begin
         RelationArr.Filter.PersonType := PS_TYPE_MECHANIC;
         vColId := colMID;
       end;
       TAB_SUPPLIER : begin
         RelationArr.Filter.PersonType := PS_TYPE_SUPPLIER;
         vColId := colpID;
       end;
     end;
     RelationArr.Filter.PersonId := AItemId;
     if txtKode.Text <> '' then
       RelationArr.Filter.PersonCode := txtKode.Text;
     if txtAddress.Text <> '' then
       RelationArr.Filter.Address := txtAddress.Text;
     RelationArr.Filter.PersonName := txtNama.Text;
     RelationArr.Filter.Phone1    := txtPhone.Text;
  end;

   procedure setHeader(aRow:integer);
   begin
     SetCellColor(asgPerson,clYellow,colpCode,aRow,colpPhone);
     with asgPerson do begin
       Cells[colpCode,aRow] := 'No.Polisi';
       Cells[colpName,aRow]:= 'Tipe Kendaraan';
       Cells[colpAddress,aRow] := 'Tahun';
       Cells[colpCity,aRow] := 'No.Rangka';
       Cells[colpPhone,aRow] := 'No.Mesin';
     end;
   end;
   
begin
  RelationArr := TPersons_Arr.Create;
  vDetail := TPersonsCar_Arr.Create;
  //InitGrid;
   if (Arow = 0) and (not isAdd) then
    InitGrid;
  if isAdd then begin
    asgPerson.AddRow;
    Arow := asgPerson.RowCount-1;
  end;
  SetFilter;
  totalHalaman := RelationArr.countOnDb(isAdd) div  txtLimit.IntValue + 1;
  lblHal.Caption := 'Halaman : '+FloatToStr(halaman)+' dari '+FloatToStr(totalHalaman);
  frmMainMenu.Gauge.Show;
  vRow2 :=0;
  RelationArr.FindOnDB(False,False,((isAdd) or (AItemId>0)),txtLimit.IntValue,((halaman-1)*txtLimit.IntValue) );
  for i:= 0 to RelationArr.Count-1 do begin
   frmMainMenu.Gauge.Progress := round((i+1)/(RelationArr.Count)*100);
   vRow := IfThen(Arow=0,asgPerson.RowCount-2,Arow);
    //asgPerson.Ints[colNo,   vRow]:= (i+1);
    asgPerson.Ints[colNo,vRow] := (i+1)+((halaman-1)*txtLimit.IntValue);
    asgPerson.Cells[colCode,   vRow]:= RelationArr[i].PersonCode;
    asgPerson.Cells[colName,   vRow]:= RelationArr[i].PersonName;
    asgPerson.Cells[colAddress,vRow]:= RelationArr[i].Address;
    asgPerson.Cells[colCity,   vRow]:= RelationArr[i].City;
    asgPerson.Cells[colPhone,  vRow]:= RelationArr[i].Phone1;
    asgPerson.Cells[colPhone2, vRow]:= RelationArr[i].Phone2;
    asgPerson.Cells[colFax, vRow]:= RelationArr[i].Phone3;
    asgPerson.Ints[vColId,     vRow]:= RelationArr[i].PersonId;
    if pgcMain.ActivePageIndex = TAB_CUSTOMER then begin
      asgPerson.Ints[colTahun,vRow]  := RelationArr[i].MtrYear;
      asgPerson.Cells[colRangka,vRow]:= RelationArr[i].MtrRangka;
      asgPerson.Cells[colMesin,vRow] := RelationArr[i].MtrMesin;
      asgPerson.Cells[colTipe,vRow]  := TMotor.getName(RelationArr[i].Motor.MotorId);
    end;

    if pgcMain.ActivePageIndex = TAB_SUPPLIER then begin
      asgPerson.Cells[colpFax,vRow]  := RelationArr[i].Phone3;
      asgPerson.Cells[colpCp,vRow]:= RelationArr[i].ContactPerson;
      asgPerson.Cells[colpAccount,vRow] := RelationArr[i].Account;
    end;
    //start detail
    vDetail.Clear;

      vDetail.FindOnDb(RelationArr[i].PersonId);
      asgPerson.AddRow;
      setHeader(asgPerson.RowCount-2);
      for j:= 0 to vDetail.Count-1 do begin
        asgPerson.AddRow;
        vRow2 := asgPerson.RowCount-2;
        asgPerson.Cells[colpCode,vRow2] := vDetail[j].NoPol;
        asgPerson.Cells[colpName,vRow2]:= vDetail[j].Motor.MotorName;  //vDetail[j].Quantity;
        asgPerson.Ints[colpAddress,vRow2]:= vDetail[j].MtrYear;  //vDetail[j].Quantity;
        asgPerson.Cells[colpCity,vRow2]   := vDetail[j].MtrRangka;//vSaldo;
        asgPerson.Cells[colpPhone,vRow2]     := vDetail[j].MtrMesin;
        asgPerson.Cells[colpPhone2,vRow2]     := IfThen(vDetail[j].Disable=1,'Tidak Aktif','Aktif');
      end;
      asgPerson.AddRow;
      asgPerson.AddNode(vRow,vRow2-vRow+1);
    //end detail
    //if Arow = 0 then
     // asgPerson.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  // if Arow = 0 then
  DeleteRowTerakhir(asgPerson,3,1);
//  asgPerson.AutoNumberCol(colNo);
asgPerson.ContractAll;
  ArrangeSizeColl;
  RelationArr.Free;

end;

procedure TfrmPersonKelolaAll.spdFirstClick(Sender: TObject);
begin
txtLimit.Tag:= 0;
    spdFirst.Enabled:= False;
    spdPrev.Enabled:= False;
    spdNext.Enabled:= True;
    spdLast.Enabled:= True;
    halaman := 1;
     lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
  //  lblHal.Caption:= 'Halaman: 1';


    if pgcMain.ActivePageIndex = TAB_CUSTOMER then
      loadData2(0,0,False)
    else
      loadData(0,0,False);
end;

procedure TfrmPersonKelolaAll.spdPrevClick(Sender: TObject);
begin
    dec(halaman);
    spdFirst.Enabled:= halaman > 1;
    spdPrev.Enabled:= halaman > 1;
    spdNext.Enabled:= True;
    spdLast.Enabled:= True;
   // lblHal.Caption:= 'Halaman: ' + IntToStr((txtLimit.Tag + txtLimit.IntValue) div txtLimit.IntValue);
     lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
    if pgcMain.ActivePageIndex = TAB_CUSTOMER then
      loadData2(0,0,False)
    else
      loadData(0,0,False);
end;

procedure TfrmPersonKelolaAll.spdNextClick(Sender: TObject);
begin
    inc(halaman);
    spdFirst.Enabled:= True;
    spdPrev.Enabled:= True;
    lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
    spdNext.Enabled:= (halaman< totalHalaman);
    spdLast.Enabled:= (halaman< totalHalaman);
    if pgcMain.ActivePageIndex = TAB_CUSTOMER then
      loadData2(0,0,False)
    else
      loadData(0,0,false);
end;

procedure TfrmPersonKelolaAll.spdLastClick(Sender: TObject);
begin
    spdFirst.Enabled:= True;
    spdPrev.Enabled:= True;
    spdNext.Enabled:= False;
    spdLast.Enabled:= False;
    halaman := totalHalaman;
    lblHal.Caption:= 'Halaman: ' + IntToStr(halaman)+ ' dari '+IntToStr(totalHalaman);
    if pgcMain.ActivePageIndex = TAB_CUSTOMER then
      loadData2(0,0,False)
    else
      loadData(0,0,False);
end;

procedure TfrmPersonKelolaAll.btnDeleteClick(Sender: TObject);
var vPerson : TPersons;
vColId:integer;
begin
  case pgcMain.ActivePageIndex of
     TAB_CUSTOMER : begin
     vColId := colID;
    end;
    TAB_SUBDEALER : begin
    vColId := colsID;
    end;
    TAB_MECHANIC : begin
      vColId := colMID;
    end;
    TAB_SUPPLIER : begin
    vColId := colpID;
    end;
   end;


   if(asgPerson.Ints[vColId,asgPerson.Row]=0)then begin
        Inform('Data yang akan didelete belum dipilih.'+#13+
               'Silahkan pilih data yang akan didele '+#13+
               'pada kolom yang tersdia di bawah');
        asgPerson.SetFocus;
      end else begin
        if Confirmed('Apakah data '+asgPerson.Cells[colName,asgPerson.row]+' benar akan dihapus?') then begin
            vPerson := TPersons.Create;
            vPerson.PersonId :=   asgPerson.Ints[vColId,asgPerson.Row];
           if vPerson.DeleteOnDB() then
             btnOk.Click;
        end;
      end;
end;

end.
