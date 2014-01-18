unit MesinAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AdvEdit, ExtCtrls,strUtils;

type
  TfrmMesinAdd = class(TForm)
    btnSave: TButton;
    btnBatal: TButton;
    txtKategori: TAdvEdit;
    txtNama: TAdvEdit;
    Label1: TLabel;
    txtKode: TAdvEdit;
    Bevel2: TBevel;
    StaticText1: TStaticText;
    procedure btnSaveClick(Sender: TObject);
    procedure cmbItemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnBatalClick(Sender: TObject);
  private
    { Private declarations }
    EditMode : boolean;
    MasterSeq : integer;
    MasterPurpose : string;
    procedure InitForm;
    function isSaved:boolean;
    function isValid:boolean;
    procedure LoadData;
  public
    { Public declarations }
    function Execute(APurpose:string;AServiceSeq:integer):boolean;
  end;

var
  frmMesinAdd: TfrmMesinAdd;

implementation

uses UMaster, Subroutines, UConst, SQLServerConnections, MainMenu,
  AutoSriwijaya, ItemKelola;

{$R *.dfm}

{ TfrmServiceAdd }

procedure TfrmMesinAdd.InitForm;
var vPurpose : string;
begin
  vPurpose := IfThen(MasterPurpose=MACHINE_TYPE,'Mesin/Kategori','Biaya');
  txtKode.Clear;
  txtNama.Clear;
  txtKategori.Clear;
  btnSave.Caption:= IfThen(EditMode, '&Update', '&Save');
  Self.Caption := IfThen(EditMode,'  Edit Data ','  Input Data ')+vPurpose;
  Self.ActiveControl := txtKode;
end;

function TfrmMesinAdd.isSaved: boolean;
var vMEsin : TMachine;
begin
  vMEsin := TMachine.Create;
  vMEsin.MachineCode:= txtKode.Text;
  vMEsin.MachineName:= txtNama.Text;
  vMEsin.MachineType:= MasterPurpose;
  vMEsin.MachineCategory  := txtKategori.Text;
  vMEsin.MachineId := MasterSeq;
  vMEsin.UserInsert  := GlobalSystemUser.UserId;
  vMEsin.UserEdit    := GlobalSystemUser.UserId;
  if not EditMode then
    Result:= vMEsin.InsertOnDB
  else Result:= vMEsin.UpdateOnDB;
  
end;

function TfrmMesinAdd.isValid: boolean;
begin
  Result:= False;
  if (not EditMode) and (TMachine.ExistCode(txtKode.Text)) then begin
    Inform('Kode sudah ada.');
    txtKode.SetFocus;
  end else
  if txtKode.Text = '' then begin
    Inform('Kode belum diisi.');
    txtKode.SetFocus;
  end else
  if txtNama.Text = '' then begin
    Inform('Nama belum diisi.');
    txtNama.SetFocus;
  end else
    Result:= True;

end;

procedure TfrmMesinAdd.LoadData;
var vMEsin : TMachine;
begin
  vMEsin := TMachine.Create;
  if not vMEsin.SelectInDB(MasterSeq) then begin
    Alert(MSG_NO_DATA_FOUND);
    vMEsin.Free;
    exit;
  end;
  txtNama.Text  := vMEsin.MachineName;
  txtKategori.Text  := vMEsin.MachineCategory;
  txtKode.Text  := vMEsin.MachineCode;
  vMEsin.Free;
end;

procedure TfrmMesinAdd.btnSaveClick(Sender: TObject);
begin
  if isValid and Confirmed(MSG_SAVE_CONFIRMATION) then
    if isSaved then begin
      if not EditMode then begin
        if Confirmed(MSG_ADD_DATA) then begin
          InitForm;
          if MasterPurpose = MACHINE_TYPE then
            frmItemKelola.ReloadMesin(0,TMachine.getMaxId,True)
        end
        else
          ModalResult := mrOk;
      end
      else
        ModalResult := mrOk;
    end;
end;

function TfrmMesinAdd.Execute(APurpose:string;AServiceSeq: integer): boolean;
begin

  MasterPurpose := APurpose;
  MasterSeq := AServiceSeq;
  EditMode  := (MasterSeq <> 0);
  InitForm;
  if EditMode then
    LoadData;
  Run(Self);
  Result := ModalResult = mrOK;
end;

procedure TfrmMesinAdd.cmbItemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_return then
    btnSave.SetFocus;
end;

procedure TfrmMesinAdd.btnBatalClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
