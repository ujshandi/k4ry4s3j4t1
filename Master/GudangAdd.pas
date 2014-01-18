unit GudangAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls,strUtils;

type
  TfrmGudangAdd = class(TForm)
    StaticText1: TStaticText;
    Bevel2: TBevel;
    Label1: TLabel;
    txtKode: TAdvEdit;
    txtNama: TAdvEdit;
    btnBatal: TButton;
    chkStatus: TCheckBox;
    btnSave: TButton;
    procedure btnSaveClick(Sender: TObject);
    procedure btnBatalClick(Sender: TObject);
  private
    { Private declarations }
    EditMode : boolean;
    MasterID : integer;
    procedure InitForm;
    function isSaved:boolean;
    function isValid:boolean;
    procedure LoadData;
  public
    { Public declarations }
    function Execute(AId:integer):boolean;
  end;

var
  frmGudangAdd: TfrmGudangAdd;

implementation

uses MainMenu, UMaster, Subroutines, UConst;

{$R *.dfm}

{ TfrmGudangAdd }

function TfrmGudangAdd.Execute(AId:integer): boolean;
begin
  Result := True;
  MasterID := AId;
  EditMode := AId >0;
  InitForm;
  if EditMode then LoadData;
  Run(Self);
end;

procedure TfrmGudangAdd.InitForm;
begin
  Self.Caption := IfThen(EditMode,'Edit ','New')+ ' Gudang';
  txtKode.Clear;
  txtNama.Clear;
  chkStatus.Checked  := False;
  Self.ActiveControl := txtKode;
end;

function TfrmGudangAdd.isSaved: boolean;
var vGudang : TWarehouse;
begin
  vGudang := TWarehouse.Create;
  vGudang.WhCode := txtKode.Text;
  vGudang.WhName := txtNama.Text;
  vGudang.IsActive := chkStatus.Checked;
  vGudang.WhId   := MasterID;
  vGudang.UserInsert := GlobalSystemUser.UserId;
  vGudang.UserEdit   := GlobalSystemUser.UserId;
  if  EditMode then
    Result := vGudang.UpdateOnDb
  else
    Result := vGudang.InsertOnDb;
  vGudang.Free;
end;

function TfrmGudangAdd.isValid: boolean;
begin
  Result := False;
  if txtKode.Text = '' then begin
    Alert('Kode belum diisi');
    txtKode.SetFocus;
  end
  else if (not EditMode) and (TWarehouse.isExistCode(txtKode.Text)) then begin
    Alert(MSG_DUPLICATE);
    txtKode.SetFocus;
  end
  else if txtNama.Text = '' then begin
    Alert('Nama belum diisi');
    txtNama.SetFocus;
  end
  else if (chkStatus.Checked) and (TWarehouse.adaYgAktif) then begin
    Alert('Dalam satu sistem hanya boleh satu gudang yang aktif!');
    chkStatus.Checked := False; 
  end
  else
    Result := True;
end;

procedure TfrmGudangAdd.LoadData;
var vGudang : TWarehouse;
begin
   vGudang := TWarehouse.Create;
   if not  vGudang.SelectInDB(MasterID) then begin
     Alert(MSG_NO_DATA_FOUND);
     vGudang.Free;
     exit;
   end;
   txtKode.Text := vGudang.WhCode;
   txtNama.Text := vGudang.WhName;
   chkStatus.Checked := vGudang.IsActive;
   vGudang.Free;
end;

procedure TfrmGudangAdd.btnSaveClick(Sender: TObject);
begin
   if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then begin
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then
          InitForm
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
    end;
end;

procedure TfrmGudangAdd.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
