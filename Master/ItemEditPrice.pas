unit ItemEditPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, StdCtrls, AdvEdit,strUtils, ExtCtrls;

type
  TfrmItemEditPrice = class(TForm)
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
    txtPrice: TAdvEdit;
    txtPricePurchase: TAdvEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
    procedure mmNotesKeyDown(Sender: TObject; var Key: Word;
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
    function NewExecute:integer;
  end;

var
  frmItemEditPrice: TfrmItemEditPrice;

implementation

uses UMaster, Subroutines, UConst, MainMenu, AutoBengkel;

{$R *.dfm}

{ TfrmItemAdd }

procedure TfrmItemEditPrice.InitForm;
begin
  Self.Caption := IfThen(EditMode,'Edit Item','New Item');
  sttInfo.Caption := 'Master '+IfThen(MasterPurpose=ITEM_TYPE_OIL,'Oli','Part');
  txtKode.Clear;
  txtLimit.Clear;
  txtSatuan.Clear;
  txtNama.Clear;
  txtPrice.Clear;
  txtPricePurchase.Clear;
  mmNotes.Clear;
  Self.ActiveControl:= txtKode;
  NewNumber;
end;

function TfrmItemEditPrice.isSaved: boolean;
var Item : TItems;
begin
  Item := TItems.Create;
  Result := False;
 // if EditMode then
  Item.ItemCode := txtKode.Text;
 { else
    Item.ItemCode:= TItems.GetNewNumber(MasterPurpose);
  }Item.ItemType:= MasterPurpose;
  Item.ItemName:= txtNama.Text;
  Item.Notes   := mmNotes.Text;
  Item.Price   := txtPrice.FloatValue;
  Item.PricePurchase := txtPricePurchase.FloatValue;
  Item.StokLimit := txtLimit.IntValue;
  Item.UserInsert  := GlobalSystemUser.UserId;
  Item.UserEdit  := GlobalSystemUser.UserId;
  Item.UsedUnit := txtSatuan.Text;
  Item.ItemId := MasterSeq;
  if not EditMode then
    Result:= Item.InsertOnDB
  else Result:= Item.UpdateOnDB(True);
  Item.Free;
  //if Result then
   // TItems.getListName(G_ITEM_LIST);
end;

function TfrmItemEditPrice.isValid: boolean;
begin
   Result:= False;
   if txtKode.Text = '' then begin
    Inform('Kode belum diisi.');
    txtKode.SetFocus;
  end else if (not EditMode) and (TItems.isExistCode(txtKode.Text)) then begin
    Inform('Kode sudah ada.');
    txtKode.SetFocus;
  end else  if txtNama.Text = '' then begin
    Inform('Nama belum diisi.');
    txtNama.SetFocus;
  end else
    Result:= True;

end;

procedure TfrmItemEditPrice.LoadData;
var Item : TItems;

begin
 Item := TItems.Create;
      if Item.SelectInDB(MasterSeq) then begin
        txtKode.Text:= Item.ItemCode;
        txtNama.Text:= Item.ItemName;
        txtSatuan.Text := Item.UsedUnit;
        txtLimit.IntValue := Item.StokLimit;

//        txtPurchaseUNit.Text := Item.PurchaseUnit;
        txtPrice.FloatValue := item.Price;
        txtPricePurchase.FloatValue := Item.PricePurchase;
        mmNotes.Text:= Item.Notes;
      end;
  Item.Free;
end;

procedure TfrmItemEditPrice.btnSaveClick(Sender: TObject);
begin
   if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then
          InitForm
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
end;

function TfrmItemEditPrice.Execute(APurpose:string;AItemSeq: integer): boolean;
begin
  MasterPurpose := APurpose;
  Result := True;
  EditMode := AItemSeq>0;
  MasterSeq := AItemSeq;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
  if ModalResult= mrOK then begin
    
  end;
end;

procedure TfrmItemEditPrice.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmItemEditPrice.mmNotesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_Return then
    btnSave.SetFocus;
end;

procedure TfrmItemEditPrice.NewNumber;
begin
//  if not EditMode then
  //  txtKode.Text := TItems.getNewNumber(MasterPurpose);
end;

function TfrmItemEditPrice.NewExecute: integer;
begin
  Result := 0;
  EditMode := False;
//  MasterSeq := AItemSeq;
  InitForm;
  Run(Self);
  if ModalResult= mrOK then
    Result := getIntegerFromSQL('SELECT MAX(item_id) FROM items');
end;

end.
