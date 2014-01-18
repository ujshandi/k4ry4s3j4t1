unit PersonCarAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinXP, ComCtrls, AdvEdit, StdCtrls, ExtCtrls,  StrUtils, Math,
  Grids, BaseGrid, AdvGrid;

type
  TfrmPersonCarAdd = class(TForm)
    WinXP1: TWinXP;
    sttInfo: TStaticText;
    Bevel1: TBevel;
    lblCode: TLabel;
    txtCode: TAdvEdit;
    txtName: TAdvEdit;
    txtAddress: TAdvEdit;
    txtCity: TAdvEdit;
    txtPhone: TAdvEdit;
    txtPhone2: TAdvEdit;
    btnSave: TButton;
    btnCancel: TButton;
    txtFax: TAdvEdit;
    asgCar: TAdvStringGrid;
    Panel1: TPanel;
    StaticText1: TStaticText;
    Bevel2: TBevel;
    procedure cmbStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmbCityKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure cmbStatusSelect(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure txtPhone2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgCarGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TVAlignment);
    procedure asgCarCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure asgCarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure asgCarClick(Sender: TObject);
    procedure asgCarCellValidate(Sender: TObject; Col, Row: Integer;
      var Value: String; var Valid: Boolean);
    procedure asgCarGetEditorType(Sender: TObject; ACol, ARow: Integer;
      var AEditor: TEditorType);
  private
    EditMode   : boolean;
    gMasterSeq :integer;
    gMasterTipe: string;
    isReference : boolean;
//    ListMotor : TStringList;
    procedure getItem(AMotorId,ARow:integer);
    procedure NewCode;
    procedure ArrangeColSize;
    procedure initGrid;
    procedure InitForm;
    procedure LoadData;
    function IsValid: boolean;
    function IsSaved: boolean;
  public
    function ExecuteCustomer(ARSeq: integer=0):integer;


  end;

var
  frmPersonCarAdd: TfrmPersonCarAdd;

implementation

uses
  UConst, subroutines, MainMenu, un_ryu, AutoBengkel, UMaster, LOVFlat;

const
  colNo = 0;
  colNopol = 1;
  colTipe = 2;
  colTahun =3;
  colRangka = 4;
  colMesin=5;
  colDisable = 6;
  colMotorId =7;
{$R *.dfm}

procedure TfrmPersonCarAdd.cmbStatusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) then txtName.SetFocus;
end;

procedure TfrmPersonCarAdd.cmbCityKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (key=vk_return) then txtPhone.SetFocus;
end;

procedure TfrmPersonCarAdd.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) then btnSave.SetFocus;
end;

procedure TfrmPersonCarAdd.InitForm;
var tipe: string;
begin
//  pnlKontak.Visible := (gMasterTipe = PS_TYPE_CONTACT);
  txtName.Clear;
  txtAddress.Clear;
  txtPhone.Clear;
  txtPhone2.Clear;
  txtCity.Clear;
  txtCode.Clear;
  txtFax.Clear;
  btnSave.Caption:= IfThen(EditMode,'&Update','&Save');
  NewCode;
  case gMasterTipe[1] of
    PS_TYPE_CUSTOMER : begin
      lblCode.Caption := 'Kode';
      tipe:= ' Customer';
      Self.ActiveControl := txtCode;
      txtCode.ReadOnly := False;
      sttInfo.Caption := '    Data Pelanggan    ';
    end;

  end;
  Self.Caption:= IfThen(EditMode,'Edit '+tipe, 'Input Baru '+tipe);
  initGrid;


//  btnContact.Visible:= (gMasterTipe = PS_TYPE_CONTACT); //--chan---Anti N.A.T.O--gMasterTipe <> PS_TYPE_CONTACT;
end;

function TfrmPersonCarAdd.IsSaved: boolean;
var vRelation: TPersons; i,idx:integer; vState:boolean;
begin
  vRelation:= TPersons.Create;
  vRelation.PersonId   := gMasterSeq; //jika posisi edit
  vRelation.PersonCode  := txtCode.Text;
  vRelation.PersonName  := txtName.Text;
  vRelation.PersonType  := gMasterTipe;

  vRelation.Phone1  := txtPhone.Text;
  vRelation.Phone2  := txtPhone2.Text;
  vRelation.Phone3  := txtFax.Text;
  vRelation.Address := txtAddress.Text;
  vRelation.City    := txtCity.Text;
  vRelation.UserInsert := GlobalSystemUser.UserId;
  vRelation.UserEdit := GlobalSystemUser.UserId;

  for i:= 1 to asgCar.RowCount-1 do
      if not IsClear(asgCar,i,colMotorID) then
        with asgCar do begin
          idx:=vRelation.Car_Arr.Add( vRelation.PersonId,Cells[colNopol,i],Ints[colMotorId,i],Ints[colTahun,i],Cells[colRangka,i],Cells[colMesin,i]);

          asgCar.GetCheckBoxState(colDisable,i,vState);
          vRelation.Car_Arr[idx].Disable := IfThen(vState,0,1);
        end;

  if EditMode then
    Result:= vRelation.UpdateOnDBCars
  else Result:= vRelation.InsertOnDBCars;
  vRelation.Free;
end;

function TfrmPersonCarAdd.IsValid: boolean;
begin
  Result:= False;
  if (TPersons.ExistInDB(txtCode.Text,IfThen(EditMode,gMasterSeq,0))) then
    Inform('Kode sudah ada.')
  else
  if ValidMessage(txtCode,'Kode') then
   if ValidMessage(txtName,'Nama') then  begin
//     if gMasterTipe = PS_TYPE_CUSTOMER then begin
//       Result := ValidMessage(cmbMotorType,'Tipe Kendaraan') ;

  //   end
    // else
       result:= true;
   end;
end;

procedure TfrmPersonCarAdd.LoadData;
var vRelation: TPersons; i:integer;
begin
  vRelation:= TPersons.Create;
  if not vRelation.SelectInDBCars(gMasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    vRelation.Free;
    Exit;
  end;
  txtCode.Text   := vRelation.PersonCode;
  txtName.Text   := vRelation.PersonName;
  gMasterTipe    := vRelation.PersonType;

  txtPhone.Text  := vRelation.Phone1;
  txtPhone2.Text := vRelation.Phone2;
  txtFax.Text := vRelation.Phone3;
  txtAddress.Text:= vRelation.Address;
  txtCity.Text   := vRelation.City;
  vRelation.Car_Arr.FindOnDb(vRelation.PersonId);
  initGrid;
  for i:= 0 to vRelation.Car_Arr.Count-1 do begin
      asgCar.Cells[colNoPol,i+1] := vRelation.Car_Arr[i].NoPol;
      asgCar.Ints[colMotorId,i+1] := vRelation.Car_Arr[i].Motor.MotorId;
      asgCar.Ints[colTahun,i+1] := vRelation.Car_Arr[i].MtrYear;
      asgCar.Cells[colTipe,i+1] := vRelation.Car_Arr[i].Motor.MotorName;
      asgCar.Cells[colRangka,i+1] := vRelation.Car_Arr[i].MtrRangka;
      asgCar.Cells[colMesin,i+1] := vRelation.Car_Arr[i].MtrMesin;
      asgCar.AddCheckBox(colDisable,i+1,true,true);
      asgCar.SetCheckBoxState(colDisable,i+1,(vRelation.Car_Arr[i].Disable=0));
      asgCar.AddRow;
  end;
  DeleteRowTerakhir(asgCar,2,1);
  ArrangeColSize;

  vRelation.Free;
end;

function TfrmPersonCarAdd.ExecuteCustomer(ARSeq: integer):integer;
begin
//  ListMotor := TStringList.Create;
//  TMotor.getListType(ListMotor,cmbMotorType.Items);
  Result := 0;
  isReference := False;
  EditMode   := ARSeq<>0;
  gMasterSeq := ARSeq;
  gMasterTipe:= PS_TYPE_CUSTOMER;
  InitForm;
  if EditMode then
    LoadData;

  Run(Self);

  if ModalResult = mrOk then
    Result :=  getIntegerFromSQL('SELECT MAX(person_id) FROM persons');
//  ListMotor.Free;
end;

procedure TfrmPersonCarAdd.btnSaveClick(Sender: TObject);
begin
  if IsValid and Confirmed(MSG_SAVE_CONFIRMATION)then
    if IsSaved then
      if not EditMode then begin
        if isReference then
          ModalResult := mrOk
        else if Confirmed(MSG_ADD_DATA) then InitForm
        else ModalResult:= mrOk;
      end
      else
        ModalResult:= mrOk;
end;

procedure TfrmPersonCarAdd.NewCode;
begin
  txtCode.Text:= TPersons.GetNewNumber(gMasterTipe);
end;

procedure TfrmPersonCarAdd.cmbStatusSelect(Sender: TObject);
begin
  NewCode
end;


procedure TfrmPersonCarAdd.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;


procedure TfrmPersonCarAdd.txtPhone2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    if gMasterTipe = PS_TYPE_CUSTOMER then
      asgCar.SetFocus
    else
      btnSave.SetFocus;
end;

procedure TfrmPersonCarAdd.initGrid;
begin
  ResetGrid(asgCar,2,9,1,0);
  with asgCar do begin
    Cells[colNo,0] := 'No.';
    Cells[colNoPol,0] := 'Nomor Polisi';
    Cells[colTipe,0] := 'Tipe Kendaraan';
    Cells[colTahun,0] := 'Tahun';
    Cells[colRangka,0] := 'No.Rangka';
    Cells[colMesin,0] := 'No.Mesin';
    Cells[colDisable,0] := 'Status Aktif';
    Cells[colMotorId,0] := 'motor_id';
    StretchRightColumn;
  end;
  ArrangeColSize;
end;

procedure TfrmPersonCarAdd.ArrangeColSize;
begin
with asgCar do begin
    AutoSizeColumns(True,3);
    AutoNumberCol(colNo);
    ColWidths[colMotorId]:=0;
  end;
end;

procedure TfrmPersonCarAdd.asgCarGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TVAlignment);
begin
if ARow = 0 then
    HAlign := taCenter
  else if ACol in [colDisable] then
    HAlign := taCenter;

end;

procedure TfrmPersonCarAdd.asgCarCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
CanEdit := ACol in [colNoPol,colTipe,colTahun,colRangka,colMesin,colDisable];
end;

procedure TfrmPersonCarAdd.asgCarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId : integer;
begin
   case Key of
     VK_F8 : ShortCutF8(asgCar,Key,colNopol);
     VK_DELETE :  begin
       if (Shift = [ssCtrl]) then
      DeleteRowGrid(asgCar,asgCar.Row,colNopol);
     end;
      ord('A')..ord('Z'), ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
         case asgCar.Col of
           colTipe : begin
            vId := frmLovFlat.Execute('NAME',asgCar.Cells[asgCar.Col,asgCar.Row],'MOTOR','');
             if vId > 0 then
               getItem(vId,asgCar.Row);
           end;
         end;
      end;
   end;

end;

procedure TfrmPersonCarAdd.asgCarClick(Sender: TObject);
begin
if frmLovFlat.Showing then
    frmLovFlat.Close;
end;

procedure TfrmPersonCarAdd.getItem(AMotorId, ARow: integer);
var vMotor : TMotor;
begin
  vMotor := TMotor.Create();

    if vMotor.SelectInDB(AMotorId) then begin
       with asgCar do begin
         Cells[colTipe,ARow] := vMotor.MotorName;
         Ints[colMotorId,ARow]:= vMotor.MotorId;
       end;
    end;
    ArrangeColSize;
end;

procedure TfrmPersonCarAdd.asgCarCellValidate(Sender: TObject; Col,
  Row: Integer; var Value: String; var Valid: Boolean);
  var vEnemy : TPersonsCar;
begin
  case Col of
    colNopol : begin
      Valid :=  not TPersonsCar.ExistInDB(Value); //''(StrToFloat(Value)>0) and (Value<>'');
      if not Valid then begin
        vEnemy :=TPersonsCar.Create;
        vEnemy.SelectInDB(0,Value,false,true);
        Alert('Nomor Polisi sudah terdaftar pada customer '+TPersons.getInfo(vEnemy.PersonId));
        asgCar.Col := Col;
        Value := '';
      end;
    end;
  end;
end;

procedure TfrmPersonCarAdd.asgCarGetEditorType(Sender: TObject; ACol,
  ARow: Integer; var AEditor: TEditorType);
begin
    if (ARow>0) and (ACol=colDisable) then AEditor := edCheckBox;
end;

end.
