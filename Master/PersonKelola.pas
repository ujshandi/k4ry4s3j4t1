unit PersonKelola;
   {UTK PERSON DAN GUEST}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ExtCtrls, AdvEdit,
  strUtils, math,
   UMaster, WinXP;

type
  TfrmPersonKelola = class(TForm)
    MainPanel: TPanel;
    pnlFilter: TPanel;
    btnReset: TButton;
    txtKota: TAdvEdit;
    Bevel1: TBevel;
    Shape2: TShape;
    btnContact: TButton;
    btnAdd: TButton;
    btnEdit: TButton;
    btnFilter: TButton;
    btnPrint: TButton;
    Label1: TLabel;
    StaticText1: TStaticText;
    txtPhone: TAdvEdit;
    asgPerson: TAdvStringGrid;
    txtAddress: TAdvEdit;
    txtFax: TAdvEdit;
    WinXP1: TWinXP;
    btnOk: TButton;
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
  private
    BrowseMode : boolean;
    MasterPurpose: string;


    procedure arrangeSizeColl;
    procedure initGrid;
    procedure isiList;
    procedure initFilter;

    procedure initForm;
    procedure loadData;
  public
    procedure Execute(vPurpose: string);
    procedure ExecuteGuest;
  end;

var
  frmPersonKelola: TfrmPersonKelola;

implementation

uses MainMenu, PersonAdd, un_ryu, UConst, PersonPrint, AutoBengkel,
  Subroutines;


const
  colNo      = 0;
  colCode    = 1;
  colName    = 2;
  colAddress = 3;
  colCity    = 4;
  colPhone   = 5;
 // colOccupation = 7;
  colPhone2  = 6;
//  colHP      = 7;
//  colFax     = 8;
 // colCompany = 8;
 // colNationality = 9;
//  colPsUsed  = 9;
  //colNote    = 12;
  colID    = 7;
//  colSeq     = 11;


  PURPOSE_PERSON = 'P';
  PURPOSE_GUEST  = 'G';

{$R *.dfm}

procedure TfrmPersonKelola.asgPersonGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
  if ARow = 0 then HAlign:= taCenter
  else if ACol in[colNo, colPhone] then  HAlign:= taRightJustify
//  else if (ACol = colPsUsed) and (MasterPurpose = PS_TYPE_CONTACT) then  HAlign:= taCenter

end;

procedure TfrmPersonKelola.arrangeSizeColl;
begin
  asgPerson.AutoSizeColumns(True,5);
  case MasterPurpose[1] of
    PS_TYPE_CUSTOMER,PS_TYPE_SUBDEALER,PS_TYPE_MECHANIC :
    begin
      if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPerson.ColWidths[colId ]:= 0;
//      asgPerson.ColWidths[colTipe]:= 0;
    end;
    GUEST_TYPE_GROUP  : BEGIN
       asgPerson.AutoNumberCol(colNo);
       if GlobalSystemUser.AccessLevel > LEVEL_OWNER then exit;
      asgPerson.ColWidths[colId ]:= 0;
    End;
  end;

//  if gMasterType <> PS_TYPE_CONTACT then
//    asgPerson.ColWidths[colPsUsed] :=0;
end;

procedure TfrmPersonKelola.Execute(vPurpose: string);
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  pnlFilter.Height := 0;
  MasterPurpose:= vPurpose;
  BrowseMode:= False;
  InitForm;
//  RelationArr.Filter.PsType:= vType;

  loadData;
  Run(self);
//  if ModalResult in[mrOk, mrCancel] then

end;

procedure TfrmPersonKelola.initFilter;
begin
  txtKota.Clear;
  txtAddress.Clear;
  txtPhone.Clear;
  txtFax.Clear;
end;

procedure TfrmPersonKelola.initForm;
begin
  isiList;
 // btnFilter.Click;
  InitGrid;
//  Self.Caption:= 'Kelola '+ TPerson.getTypeValue(gMasterType);
  InitFilter;
//  btnContact.Enabled:= (not BrowseMode) and (MasterPurpose<>PS_TYPE_CONTACT);
  btnEdit.Enabled   := not BrowseMode;
end;

procedure TfrmPersonKelola.initGrid;
begin
  case MasterPurpose[1] of
    PS_TYPE_CUSTOMER,PS_TYPE_SUBDEALER,PS_TYPE_MECHANIC : begin
      ResetGrid(asgPerson,2,9,1,1);
      with asgPerson do begin
        Cells[colCode,0]  := IfThen(MasterPurpose=PS_TYPE_CUSTOMER,'No.Polisi',IfThen(MasterPurpose=PS_TYPE_SUBDEALER,'Kode SubDealer','Kode Mekanik'));
        Cells[colName,0]  := IfThen(MasterPurpose=PS_TYPE_CUSTOMER,'Nama Pelanggan',IfThen(MasterPurpose=PS_TYPE_SUBDEALER,'Nama SubDealer','Nama Mekanik'));
        Cells[colAddress,0]:= 'Alamat';
        Cells[colPhone,0] := 'Tlp';
        Cells[colCity,0]  := 'Kota';
        Cells[colPhone2,0]:='Tlp2';
        Cells[colId,0] := 'guestid';
      end;
    end;

  end;
  ArrangeSizeColl;
end;

procedure TfrmPersonKelola.isiList;
begin
end;

procedure TfrmPersonKelola.loadData;
var i: integer;
  RelationArr: TPersons_Arr;

  procedure SetFilter;
  begin
     RelationArr.Clear;
     RelationArr.Filter.PersonType := MasterPurpose;
     if txtKota.Text <> '' then
       RelationArr.Filter.City := txtKota.Text;
     if txtAddress.Text <> '' then
       RelationArr.Filter.Address := txtAddress.Text;
  end;
begin
  RelationArr := TPersons_Arr.Create;
  InitGrid;
  SetFilter;
  frmMainMenu.Gauge.Show;
  RelationArr.FindOnDB;
  for i:= 0 to RelationArr.Count-1 do begin
   frmMainMenu.Gauge.Progress := round((i+1)/(RelationArr.Count)*100);
    asgPerson.Cells[colCode,   i+1]:= RelationArr[i].PersonCode;
    asgPerson.Cells[colName,   i+1]:= RelationArr[i].PersonName;
    asgPerson.Cells[colAddress,i+1]:= RelationArr[i].Address;
    asgPerson.Cells[colCity,   i+1]:= RelationArr[i].City;
    asgPerson.Cells[colPhone,  i+1]:= RelationArr[i].Phone1;
    asgPerson.Cells[colPhone2, i+1]:= RelationArr[i].Phone2;
    asgPerson.Ints[colId,     i+1]:= RelationArr[i].PersonId;
    asgPerson.AddRow;
  end;
  frmMainMenu.Gauge.Hide;
  DeleteRowTerakhir(asgPerson,2,1);
  asgPerson.AutoNumberCol(colNo);
  ArrangeSizeColl;
  RelationArr.Free;
end;


procedure TfrmPersonKelola.btnFilterClick(Sender: TObject);
begin
  SetFilterSize(pnlFilter,btnFilter, 93);
end;

procedure TfrmPersonKelola.btnEditClick(Sender: TObject);
begin
  case MasterPurpose[1] of
   PURPOSE_GUEST : begin

   end
   else begin
      if(asgPerson.Ints[colId,asgPerson.Row]=0)then begin
        Inform('Data yang akan diedit belum dipilih.'+#13+
               'Silahkan pilih data yang akan diedit '+#13+
               'pada kolom yang tersdia di bawah');
        asgPerson.SetFocus;
      end else begin
        frmPersonAdd.Execute(MasterPurpose, asgPerson.Ints[colId,asgPerson.Row]);
        loadData;
      end;
    end;
   end;
end;

procedure TfrmPersonKelola.btnAddClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    PURPOSE_PERSON : begin
      frmPersonAdd.Execute(MasterPurpose, 0);
      loadData;
    end;
    PS_TYPE_CUSTOMER,PS_TYPE_SUBDEALER,PS_TYPE_MECHANIC : begin
      frmPersonAdd.Execute(MasterPurpose,0);
      loadData;
    end;
  end;
end;

procedure TfrmPersonKelola.btnOkClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    PS_TYPE_CUSTOMER,PS_TYPE_SUBDEALER,PS_TYPE_MECHANIC : begin
      LoadData;
    end;
  end;
end;

procedure TfrmPersonKelola.btnResetClick(Sender: TObject);
begin
  initFilter;
end;

procedure TfrmPersonKelola.btnContactClick(Sender: TObject);
begin
//  frmPersonAdd.Execute(PS_TYPE_CONTACT,0,asgPerson.Ints[colId,asgPerson.Row]);
end;

procedure TfrmPersonKelola.btnPrintClick(Sender: TObject);
begin
  case MasterPurpose[1] of
    PS_TYPE_CUSTOMER,PS_TYPE_SUBDEALER,PS_TYPE_MECHANIC :
    begin
//      RelationArr.Filter.PersonType := PS_TYPE_CUSTOMER;
      Application.CreateForm(TqrpPerson,qrpPerson);
  //    qrpPerson.Executes(RelationArr.Filter);
      qrpPerson.Free;
    end;
    PURPOSE_GUEST  : begin
        Alert(MSG_UNDERCONSTRUCTION);
    end;
  end;
end;

procedure TfrmPersonKelola.asgPersonDblClickCell(Sender: TObject; ARow,
  ACol: Integer);
begin
  if ARow = 0 then exit;
  btnEdit.Click;
end;


procedure TfrmPersonKelola.ExecuteGuest;
begin
  if not Can_Access(Self) then begin
    Alert(MSG_UNAUTHORISED_ACCESS);
    exit;
  end;
  pnlFilter.Height := 0;
  MasterPurpose:= PURPOSE_GUEST;
  BrowseMode:= False;
  InitForm;

  loadData;
  Run(self);

end;

end.
