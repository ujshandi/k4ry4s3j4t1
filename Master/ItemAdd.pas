unit ItemAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, AdvEdit,strUtils, ExtCtrls;

type
  TfrmItemAdd = class(TForm)
    Kode: TLabel;
    txtKode: TAdvEdit;
    txtNama: TAdvEdit;
    mmNotes: TMemo;
    btnSave: TButton;
    btnBatal: TButton;
    sttInfo: TStaticText;
    Bevel2: TBevel;
    txtSatuan: TAdvEdit;
    txtLimit: TAdvEdit;
    chkEdit: TCheckBox;
    txtSatuanBeli: TAdvEdit;
    txtConversion: TAdvEdit;
    Label1: TLabel;
    txtKendaraan: TAdvEdit;
    Button1: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtKendaraanKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    EditMode : boolean;
    MasterSeq : integer;
    MasterPurpose :string;
    procedure InitForm;
    function isSaved : boolean;
    function isValid : boolean;
    procedure LoadData;
    procedure NewNumber;
  public
    { Public declarations }
    function Execute(APurpose:string;AItemSeq:integer):boolean;
    function NewExecute:integer;overload;
    function NewExecute(APurpose,AResultType:string):string;overload;
  end;

var
  frmItemAdd: TfrmItemAdd;

implementation

uses UMaster, Subroutines, UConst, MainMenu, AutoBengkel, ItemKelola,
  LOVFlat;

{$R *.dfm}

{ TfrmItemAdd }

procedure TfrmItemAdd.InitForm;
begin
  Self.Caption := IfThen(EditMode,'Edit Item','New Item');
  sttInfo.Caption := 'Master '+IfThen(MasterPurpose=ITEM_TYPE_OIL,'Oli','Part');
  txtKode.Clear;
  txtLimit.Clear;
  txtSatuan.Clear;
  txtNama.Clear;
  mmNotes.Clear;
  txtKendaraan.Clear;
  txtKendaraan.Tag:=0;
  txtSatuanBeli.Clear;
  txtConversion.IntValue := 1;
  Self.ActiveControl:= txtKode;
  NewNumber;
end;

function TfrmItemAdd.isSaved: boolean;
var Item : TItems;
begin
  Item := TItems.Create;
  Result := False;
//  if EditMode then
  Item.ItemCode := txtKode.Text;
 // else
 //   Item.ItemCode:= TItems.GetNewNumber(MasterPurpose);
  Item.ItemType:= MasterPurpose;
  Item.ItemName:= txtNama.Text;
  Item.Notes   := mmNotes.Text;
  Item.PurchaseUnit := txtSatuanBeli.Text;
  Item.StokLimit := txtLimit.IntValue;
  Item.Conversion := txtConversion.IntValue;
  Item.CarId := txtKendaraan.Tag;
//  Item.Price   := txtPrice.FloatValue;
  Item.UserInsert  := GlobalSystemUser.UserId;
  Item.UsedUnit := txtSatuan.Text;
  Item.ItemId := MasterSeq;
  if not EditMode then
    Result:= Item.InsertOnDB
  else Result:= Item.UpdateOnDB(False);
  Item.Free;
//  if Result then
  //  TItems.getListName(G_ITEM_LIST);
end;

function TfrmItemAdd.isValid: boolean;
begin
   Result:= False;
   if txtKode.Text = '' then begin
    Inform('Kode belum diisi.');
    txtKode.SetFocus;
  end
  else if TItems.isExistCode(txtKode.Text,IfThen(EditMode,MasterSeq,0)) then begin
    Inform('Kode sudah ada.');
    txtKode.SetFocus;
  end
  else  if txtNama.Text = '' then begin
    Inform('Nama belum diisi.');
    txtNama.SetFocus;
  end
  else  if (txtConversion.IntValue <=0) then begin
    Inform('Nilai konversi harus lebih dari nol');
    txtConversion.SetFocus;
  end else  if txtKendaraan.Tag<=0 then begin
    Inform('Jenis kendaraan belum ditentukan.');
    txtKendaraan.SetFocus;
  end else
    Result:= True;

end;

procedure TfrmItemAdd.LoadData;
var Item : TItems;
begin
 Item := TItems.Create;
      if Item.SelectInDB(MasterSeq) then begin
        txtKode.Text:= Item.ItemCode;
        txtNama.Text:= Item.ItemName;
        txtSatuan.Text := Item.UsedUnit;
        txtLimit.IntValue := Item.StokLimit;
        txtSatuanBeli.Text := Item.PurchaseUnit;
        txtConversion.FloatValue := Item.Conversion;
        txtKendaraan.Tag:= Item.CarId;
        txtKendaraan.Text := TMotor.getName(Item.CarId);
        mmNotes.Text:= Item.Notes;
      end;
  Item.Free;
end;

procedure TfrmItemAdd.btnSaveClick(Sender: TObject);
begin
   if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then begin
          InitForm;
          if MasterPurpose = ITEM_TYPE_PART then
            frmItemKelola.ReloadGrid(0,TItems.getMaxId,True)
          else if MasterPurpose = ITEM_TYPE_OIL then
            frmItemKelola.ReloadOil(0,TItems.getMaxId,True);
        end
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
end;

function TfrmItemAdd.Execute(APurpose:string;AItemSeq: integer): boolean;
begin
  MasterPurpose := APurpose;
  Result := False;
  EditMode := AItemSeq>0;
  MasterSeq := AItemSeq;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
  if ModalResult= mrOK then begin
     Result := True;
  end;
end;

procedure TfrmItemAdd.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmItemAdd.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    btnSave.SetFocus;
end;

procedure TfrmItemAdd.NewNumber;
begin
//  if not EditMode then
  //  txtKode.Text := TItems.getNewNumber(MasterPurpose);
end;

function TfrmItemAdd.NewExecute: integer;
begin
  Result := 0;
  EditMode := False;
//  MasterSeq := AItemSeq;
  InitForm;
  Run(Self);
  if ModalResult= mrOK then
    Result := getIntegerFromSQL('SELECT MAX(item_id) FROM items');
end;

procedure TfrmItemAdd.txtKendaraanKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var vId:integer;
  frm : TfrmLovFlat;  
begin
 case Key of
      ord('A')..ord('Z'), ord('0')..ord('9'),VK_NUMPAD0..VK_NUMPAD9 : begin
            frm := TfrmLovFlat.Create(Self);
            frm.Position    := poDesktopCenter;
            frm.Color       := clFormBackGround;
            vId := frm.Execute('NAME',txtKendaraan.Text,'MOTOR','');
             if vId > 0 then begin
               txtKendaraan.Tag:= vId;
               txtKendaraan.Text := TMotor.getName(vId);
             end;
             frm.Free;
         end;
   end;
end;

function TfrmItemAdd.NewExecute(APurpose, AResultType: string): string;
begin
  MasterPurpose := APurpose;
  EditMode := 0>0;
  MasterSeq := 0;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
  if ModalResult= mrOK then begin
     Result := txtNama.Text;
  end;

end;

end.
